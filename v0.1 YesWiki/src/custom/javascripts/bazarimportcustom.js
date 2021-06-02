function extractgeo(){
    // get inputs
    let inputs = $('form > #accordion-import > label:not(.gps-ready) > input[type=checkbox]:not(.error-adress):checked');
    $(inputs).each(function (){
        let entry = decodeBase64FromAnchor($(this));
        if (!entry) return false;
        // check gps
        if (!entry.bf_latitude || !entry.bf_longitude) {
            // generate gps async
            let id_fiche = entry.id_fiche ?? false;
            if (!id_fiche) {
                console.log('No id_fiche !')
                return false;
            }
            if (!$(this).hasClass('remove-adress')){
                var bf_adresse = entry.bf_adresse ?? '';
                var bf_adresse1 = entry.bf_adresse1 ?? '';
                var bf_adresse2 = entry.bf_adresse2 ?? '';
            } else {
                var bf_adresse = '';
                var bf_adresse1 = '';
                var bf_adresse2 = '';
            }
            let bf_ville = entry.bf_ville ?? '';
            let bf_code_postal = entry.bf_code_postal ?? '';

            updateAddress(id_fiche,bf_adresse,bf_adresse1,bf_adresse2,bf_ville,bf_code_postal);
        } else {
            // add class
            $(this).parent().addClass('gps-ready');
        }
    });
}
//http://www.navioo.com/javascript/tutorials/Javascript_unserialize_1614.html
function unserialize(data){
    // Takes a string representation of variable and recreates it  
    // 
    // version: 810.114
    // discuss at: http://phpjs.org/functions/unserialize
    // +     original by: Arpad Ray (mailto:arpad@php.net)
    // +     improved by: Pedro Tainha (http://www.pedrotainha.com)
    // +     bugfixed by: dptr1988
    // +      revised by: d3x
    // +     improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
    // %            note: We feel the main purpose of this function should be to ease the transport of data between php & js
    // %            note: Aiming for PHP-compatibility, we have to translate objects to arrays 
    // *       example 1: unserialize('a:3:{i:0;s:5:"Kevin";i:1;s:3:"van";i:2;s:9:"Zonneveld";}');
    // *       returns 1: ['Kevin', 'van', 'Zonneveld']
    // *       example 2: unserialize('a:3:{s:9:"firstName";s:5:"Kevin";s:7:"midName";s:3:"van";s:7:"surName";s:9:"Zonneveld";}');
    // *       returns 2: {firstName: 'Kevin', midName: 'van', surName: 'Zonneveld'}
    
    var error = function (type, msg, filename, line){throw new window[type](msg, filename, line);};
    var read_until = function (data, offset, stopchr){
        var buf = [];
        var chr = data.slice(offset, offset + 1);
        var i = 2;
        while(chr != stopchr){
            if((i+offset) > data.length){
                error('Error', 'Invalid');
            }
            buf.push(chr);
            chr = data.slice(offset + (i - 1),offset + i);
            i += 1;
        }
        return [buf.length, buf.join('')];
    };
    var read_chrs = function (data, offset, length){
        buf = [];
        for(var i = 0;i < length;i++){
            var chr = data.slice(offset + (i - 1),offset + i);
            buf.push(chr);
        }
        return [buf.length, buf.join('')];
    };
    var _unserialize = function (data, offset){
        if(!offset) offset = 0;
        var buf = [];
        var dtype = (data.slice(offset, offset + 1)).toLowerCase();
        
        var dataoffset = offset + 2;
        var typeconvert = new Function('x', 'return x');
        var chrs = 0;
        var datalength = 0;
        
        switch(dtype){
            case "i":
                typeconvert = new Function('x', 'return parseInt(x)');
                var readData = read_until(data, dataoffset, ';');
                var chrs = readData[0];
                var readdata = readData[1];
                dataoffset += chrs + 1;
            break;
            case "b":
                typeconvert = new Function('x', 'return (parseInt(x) == 1)');
                var readData = read_until(data, dataoffset, ';');
                var chrs = readData[0];
                var readdata = readData[1];
                dataoffset += chrs + 1;
            break;
            case "d":
                typeconvert = new Function('x', 'return parseFloat(x)');
                var readData = read_until(data, dataoffset, ';');
                var chrs = readData[0];
                var readdata = readData[1];
                dataoffset += chrs + 1;
            break;
            case "n":
                readdata = null;
            break;
            case "s":
                var ccount = read_until(data, dataoffset, ':');
                var chrs = ccount[0];
                var stringlength = ccount[1];
                dataoffset += chrs + 2;
                
                var readData = read_chrs(data, dataoffset+1, parseInt(stringlength));
                var chrs = readData[0];
                var readdata = readData[1];
                dataoffset += chrs + 2;
                if(chrs != parseInt(stringlength) && chrs != readdata.length){
                    error('SyntaxError', 'String length mismatch');
                }
            break;
            case "a":
                var readdata = {};
                
                var keyandchrs = read_until(data, dataoffset, ':');
                var chrs = keyandchrs[0];
                var keys = keyandchrs[1];
                dataoffset += chrs + 2;
                
                for(var i = 0;i < parseInt(keys);i++){
                    var kprops = _unserialize(data, dataoffset);
                    var kchrs = kprops[1];
                    var key = kprops[2];
                    dataoffset += kchrs;
                    
                    var vprops = _unserialize(data, dataoffset);
                    var vchrs = vprops[1];
                    var value = vprops[2];
                    dataoffset += vchrs;
                    
                    readdata[key] = value;
                }
                
                dataoffset += 1;
            break;
            default:
                error('SyntaxError', 'Unknown / Unhandled data type(s): ' + dtype);
            break;
        }
        return [dtype, dataoffset - offset, typeconvert(readdata)];
    };
    return _unserialize(data, 0)[2];
}

function updateAddress(id_fiche,bf_adresse,bf_adresse1,bf_adresse2,bf_ville,bf_code_postal) {
    var address = [bf_adresse,bf_adresse1,bf_adresse2,bf_ville,bf_code_postal].join(' ');
    address = address.replace(/\\("|\'|\\)/g, " ").trim();
    testGeocodage(address,id_fiche);
}

function testGeocodage(address,id){

    geocodage( address, 
        function (lon,lat){
            var elem = findBase64Anchor(id);
            if (!elem) {
                console.log('No elem found for id : '+id+' !')
                return false;
            }
            let entry = decodeBase64FromAnchor(elem);
            if (!entry) {
                console.log('No entry decoded for id : '+id+' !')
                return false;
            }
            
            $(elem).removeClass('remove-adress');
            $(elem).removeClass('error-adress');
            $(elem).parent().addClass('gps-ready');
            entry['bf_latitude'] = lat;
            entry['bf_longitude'] = lon;
            let data = serialize(entry);
            if (!data) {
                console.log('No data serialized for id : '+id+', entry : '+JSON.stringify(entry)+' !')
                return false;
            }
            let base64 = btoa(data);
            $(elem).val(base64);
        }, 
        function (msg){
            var elem = findBase64Anchor(id);
            consolge.log('error msg : '+msg);
            if (!elem) {
                console.log('No elem found for id : '+id+' !')
                return false;
            }
            if ($(elem).hasClass('remove-adress')){
                $(elem).removeClass('remove-adress');
                $(elem).addClass('error-adress');
            } else {
                $(elem).addClass('remove-adress');
            }
        }
    );
}

function findBase64Anchor(id){
    var elem = $('form > #accordion-import > label > input[name="importfiche['+id+']"]').first();
    return elem;
}

function decodeBase64FromAnchor(elem){
    // get entry
    let data = $(elem).val();
    if (!data) {
        console.log('no data found for '+JSON.stringify(elem));
        return false;
    }
    // decode
    let dec = window.atob(data);
    if (!dec) {
        console.log('no values decoded for '+JSON.stringify(elem));
        return false;
    }
    var entry = unserialize(dec) ;
    return entry;
}

// source http://www.navioo.com/javascript/tutorials/Javascript_serialize_1611.html
function serialize( mixed_value ) {
    // Returns a string representation of variable (which can later be unserialized)  
    // 
    // version: 812.3015
    // discuss at: http://phpjs.org/functions/serialize
    // +   original by: Arpad Ray (mailto:arpad@php.net)
    // +   improved by: Dino
    // +   bugfixed by: Andrej Pavlovic
    // +   bugfixed by: Garagoth
    // %          note: We feel the main purpose of this function should be to ease the transport of data between php & js
    // %          note: Aiming for PHP-compatibility, we have to translate objects to arrays
    // *     example 1: serialize(['Kevin', 'van', 'Zonneveld']);
    // *     returns 1: 'a:3:{i:0;s:5:"Kevin";i:1;s:3:"van";i:2;s:9:"Zonneveld";}'
    // *     example 2: serialize({firstName: 'Kevin', midName: 'van', surName: 'Zonneveld'});
    // *     returns 2: 'a:3:{s:9:"firstName";s:5:"Kevin";s:7:"midName";s:3:"van";s:7:"surName";s:9:"Zonneveld";}'
    var _getType = function( inp ) {
        var type = typeof inp, match;
        var key;
        if (type == 'object' && !inp) {
            return 'null';
        }
        if (type == "object") {
            if (!inp.constructor) {
                return 'object';
            }
            var cons = inp.constructor.toString();
            if (match = cons.match(/(\w+)\(/)) {
                cons = match[1].toLowerCase();
            }
            var types = ["boolean", "number", "string", "array"];
            for (key in types) {
                if (cons == types[key]) {
                    type = types[key];
                    break;
                }
            }
        }
        return type;
    };
    var type = _getType(mixed_value);
    var val, ktype = '';
    
    switch (type) {
        case "function": 
            val = ""; 
            break;
        case "undefined":
            val = "N";
            break;
        case "boolean":
            val = "b:" + (mixed_value ? "1" : "0");
            break;
        case "number":
            val = (Math.round(mixed_value) == mixed_value ? "i" : "d") + ":" + mixed_value;
            break;
        case "string":
            val = "s:" + mixed_value.length + ":\"" + mixed_value + "\"";
            break;
        case "array":
        case "object":
            val = "a";
            /*
            if (type == "object") {
                var objname = mixed_value.constructor.toString().match(/(\w+)\(\)/);
                if (objname == undefined) {
                    return;
                }
                objname[1] = serialize(objname[1]);
                val = "O" + objname[1].substring(1, objname[1].length - 1);
            }
            */
            var count = 0;
            var vals = "";
            var okey;
            var key;
            for (key in mixed_value) {
                ktype = _getType(mixed_value[key]);
                if (ktype == "function") { 
                    continue; 
                }
                
                okey = (key.match(/^[0-9]+$/) ? parseInt(key) : key);
                vals += serialize(okey) +
                        serialize(mixed_value[key]);
                count++;
            }
            val += ":" + count + ":{" + vals + "}";
            break;
    }
    if (type != "object" && type != "array") val += ";";
    return val;
}