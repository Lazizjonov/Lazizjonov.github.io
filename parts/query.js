const dbase = require('./dbase.js');
const filesys_uz = require('../langs/filesys_uz.json');
const filesys_ru = require('../langs/filesys_ru.json');
const filesys_en = require('../langs/filesys_en.json');


/* 
    requiring language files in json
    *all files should contain same json keys
*/

function jsonify(arr,l){
    var retJSON = {}
    arr.forEach(el => {
        retJSON[el.name] = el[l];
    });
    return retJSON;
}

module.exports = async (req, res, next)=>{
    var lan = {};

    /* Testing the time to get all data from database */
    req.req_start = new Date().getTime();

    /* getting tables from database */
    const images = await dbase('SELECT * FROM `images`');
    const lang = await dbase('SELECT * FROM `lang`');
    const slider = await dbase('SELECT * FROM `slider`');
    const services = await dbase('SELECT * FROM `services`');
    const contacts = await dbase('SELECT * FROM `contacts`');
    const socials = await dbase('SELECT * FROM `socials`');
    const projects = await dbase('SELECT * FROM `projects`');

    
    req.req_end = new Date().getTime();
    
    /* 
        elem function will take TABLE and ID as argument then will return object with same id.
        use: 
            const image4U = dbase.elem(dbase.images, 4); 
            <%- image4U.name -%>
    */
    function elem(arr, id) {
        var o = {};
        arr.forEach(el => {
            if (el.hasOwnProperty('id')) {
                o[el.id] = el;
            } else {
                return arr[0];
            }
        });
        return o[id];
    }
    
    /* 
        getting language as request language

        getting lang table as json
    */

    var filesys = {};

    if(req.baseUrl === "/uz" || req.baseUrl === "/admin"|| req.baseUrl === "/"){
        filesys = filesys_uz;
        lan = jsonify(lang, "uz");
    }else if(req.baseUrl === "/ru"){
        filesys = filesys_ru;
        lan = jsonify(lang, "ru");
    }else if(req.baseUrl === "/en"){
        filesys = filesys_en;
        lan = jsonify(lang, "en");
    }
    
    
    /* 
        inserting tables to the request
        use: 
            <%= dbase.contacts[0].shower %>
    */

    req.database = {
        slider: slider,
        images: images,
        services: services,
        contacts: contacts,
        socials: socials,
        projects: projects,
        elem: elem
    };
    req.lang = {...filesys, ...lan};
    next();
}