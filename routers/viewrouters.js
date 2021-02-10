const express = require('express');
const router = express.Router();
const dbase = require('../parts/dbase.js');
const getquerystrforexim = require('../parts/getquerystrforexim.js');
const getnumofrowsforexim = require('../parts/getnumofrowsforexim.js');
const xl = require('excel4node');


router.get('/', (req, res)=>{
    res.status(200).render(     'main',         {lang: req.baseUrl,     dbase: req.database,    text: req.lang,      req_time: req.req_start-req.req_end});
});

router.get('/contacts', (req, res)=>{
    res.status(200).render(     'contacts',     {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
});

router.get('/projects', (req, res)=>{
    res.status(200).render(     'projects',     {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
});

router.get('/projects/:id', (req, res)=>{
    res.status(200).render(     'simplepage',   {lang: req.baseUrl,     dbase: req.database,    text: req.lang,     id: req.params.id,      page: "projects"});
});

router.get('/services/:id', (req, res)=>{
    res.status(200).render(     'servpage',   {lang: req.baseUrl,     dbase: req.database,    text: req.lang,     id: req.params.id});
});

// router.get('/contacts', (req, res)=>{
//     res.status(200).render(     'contacts',     {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/aboutus', (req, res)=>{
//     res.status(200).render(     'aboutus',      {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/researches', (req, res)=>{
//     res.status(200).render(     'researches',   {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/news', (req, res)=>{
//     res.status(200).render(     'news',         {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/researches/:id', (req, res)=>{
//     res.status(200).render(     'reserch',      {lang: req.baseUrl,     dbase: req.database,    text: req.lang,        id: req.params.id});
// });
// router.get('/services/:id', (req, res)=>{
//     res.status(200).render(     'service',      {lang: req.baseUrl,     dbase: req.database,    text: req.lang,        id: req.params.id});
// });
// router.get('/person/:id', (req, res)=>{
//     res.status(200).render(     'person',       {lang: req.baseUrl,     dbase: req.database,    text: req.lang,        id: req.params.id});
// });
// router.get('/news/:id', (req, res)=>{
//     res.status(200).render(     'newsel',         {lang: req.baseUrl,     dbase: req.database,    text: req.lang,        id: req.params.id});
// });
// router.get('/stuff', (req, res)=>{
//     res.status(200).render(     'stuff',        {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/headStuff', (req, res)=>{
//     res.status(200).render(     'headStuff',    {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/structure', (req, res)=>{
//     res.status(200).render(     'structure',    {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/documents', (req, res)=>{
//     res.status(200).render(     'documents',    {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });
// router.get('/quest', (req, res)=>{
//     res.status(200).render(     'quest',    {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
// });

// router.get('/certificates', async(req, res)=>{
//     //console.log(req.query);
//     const certs = await dbase('SELECT * FROM `certificates` ORDER BY id DESC LIMIT 0, 50');
//     const number_of_rows = await dbase('SELECT COUNT(*) AS num FROM `certificates`');
//     const comp_names = await dbase('SELECT comp_name FROM `certificates` GROUP BY comp_name');
//     const prod_names = await dbase('SELECT prod_name FROM `certificates` GROUP BY prod_name');
    

//     res.status(200).render('certs', {
//         lang: req.baseUrl,
//         dbase: req.database,
//         text: req.lang,
//         number_of_rows: parseInt(number_of_rows[0].num/50 + 1),
//         certs: certs,
//         comp_names: comp_names,
//         prod_names: prod_names
//     });
// });

// router.post('/certificates', async(req, res)=>{
//     if(req.body.page < 0){
//         req.body.page = 0;
//     }
//     const certs = await dbase(`
//         SELECT * FROM \`certificates\` 
//         WHERE comp_name LIKE '%${req.body.comp_name}%' 
//         AND prod_name LIKE '%${req.body.prod_name}%'
//         AND (cert_num LIKE '%${req.body.search}%'
//         OR dvig LIKE '%${req.body.search}%'
//         OR shassi LIKE '%${req.body.search}%'
//         OR prod_num LIKE '%${req.body.search}%') ORDER BY id DESC LIMIT ${req.body.page}, 50`);

//     const number_of_rows = await dbase(`
//         SELECT COUNT(*) AS number FROM \`certificates\` 
//         WHERE comp_name LIKE '%${req.body.comp_name}%' 
//         AND prod_name LIKE '%${req.body.prod_name}%'
//         AND (cert_num LIKE '%${req.body.search}%'
//         OR dvig LIKE '%${req.body.search}%'
//         OR shassi LIKE '%${req.body.search}%'
//         OR prod_num LIKE '%${req.body.search}%')`);
    
    
//     res.json({a: certs, b: number_of_rows});
// });

// router.get('/exim', async(req, res)=>{
//     const firsttnved = await dbase("SELECT id, name FROM `tnvedcodes` LIMIT 0, 5");
//     // console.log(getquerystrforexim([2017,2018,2019], "4011", "", "im", 0, 50));
//     const exim = await dbase(getquerystrforexim([2017,2018,2019], "4011", "", "im", 0, 50));
//     const number_of_rows = await dbase(getnumofrowsforexim([2017,2018,2019], "4011", "", "im", 0, 50));
//     const iso3 = await dbase('SELECT country, id FROM `iso3codes`');
//     const years = await dbase('SELECT DISTINCT year_ FROM `exim` ORDER BY year_ ASC');

//     // console.log(firsttnved);

//     // console.log(number_of_rows[0].num/50-1);
//     res.status(200).render('exim', {
//         lang: req.baseUrl,
//         dbase: req.database,
//         text: req.lang,
//         number_of_rows: number_of_rows[0].num,
//         exim: exim,
//         iso3: iso3,
//         years: years,
//         firsttnved: firsttnved
//     });
// });

// router.post('/exim_tnved', async(req, res)=>{
//     const exim = await dbase("SELECT id, name FROM `tnvedcodes` WHERE id LIKE \"" + req.body.tnved + "%\" OR name LIKE \"% " + req.body.tnved + "%\" LIMIT 0, 10");
//     res.json(exim);
// });

// router.post('/exim', async(req, res)=>{
//     if(req.body.page < 0){
//         req.body.page = 0;
//     }
//     const exim = await dbase(getquerystrforexim(req.body.years, req.body.tnved, req.body.iso3, req.body.eximtype, req.body.begin, 50));
//     const number_of_rows = await dbase(getnumofrowsforexim(req.body.years, req.body.tnved, req.body.iso3, req.body.eximtype, req.body.begin, 50));
//     const years = await dbase('SELECT DISTINCT year_ FROM `exim` ORDER BY year_ ASC');

//     res.json({a: exim, b: number_of_rows[0].num, c:req.lang});
// });

// router.get('/exim_download', async(req, res)=>{
//     const years = JSON.parse(req.query.year);
//     const tnved = req.query.tnved;
//     const iso3 = req.query.iso3;
//     const eximtype = req.query.eximtype;
//     const exim = await dbase(getquerystrforexim(years, tnved, iso3, eximtype, 0, 50, false));
//     var wb = new xl.Workbook();
//     var ws = wb.addWorksheet('data');
//     const textStyle = wb.createStyle({
//         alignment:{ vertical: "center", horizontal: "center", wrapText: true}
//     });
//     ws.row(1).setHeight(54);
//     ws.row(2).setHeight(35);
//     ws.cell(1, 1, 1, 5, true)
//         .string(req.lang.center_name1 + req.lang.center_name2 + " " + req.lang.center_name3 + req.lang.center_name4)
//         .style(textStyle);
//     ws.cell(2, 1, 2, 5, true).string(req.lang.exim).style(textStyle).style({font: {bold: true}});
//     if(eximtype === "im"){
//         ws.cell(3, 1, 3, 5, true).string("Import").style(textStyle).style({font: {bold: true}});
//     }else if(eximtype === "ex"){
//         ws.cell(3, 1, 3, 5, true).string("Export").style(textStyle).style({font: {bold: true}});
//     }
    

//     var i_counter = 0;
//     for(field in exim[0]){
//         if( field.includes("count_") ){
//             ws.cell(4, i_counter + 1).string(req.lang.count_ + field.replace("count_", ""));
//         }else if( field.includes("sum_") ){
//             ws.cell(4, i_counter + 1).string(req.lang.sum_ + field.replace("sum_", ""));
//         }else{
//             ws.cell(4, i_counter + 1).string(req.lang[field]);
//         }
        
//         i_counter = i_counter + 1;
//     }

//     exim.forEach((el, i) => {
//         var j = 1;
//         for(field in el){
//             if(isNumber(el[field])){
//                 ws.cell(i + 5, j).number(el[field]);
//             }else{
//                 ws.cell(i + 5, j).string(String(el[field]));
//             }
            
//             j = j + 1;
//         }
//     });

//     // console.log(req.query.search);
//     wb.write(`exim${req.query.year}_${req.query.tnved}.xlsx`, res);
// });









// router.get('/quvvat', async(req, res)=>{
//     //console.log("quvvat is logging.");
//     const firstskp = await dbase("SELECT skp, name FROM `mosh` GROUP BY skp LIMIT 0, 5");
//     const number_of_rows = await dbase('SELECT COUNT(DISTINCT skp) AS num FROM mosh');
//     const skps = await dbase(`
//         SELECT skp, tnved, name, m_unit, SUM(m_value) as m_value 
//         FROM mosh
//         GROUP BY skp
//         ORDER BY m_value DESC 
//         LIMIT 0, 50
//     `);

//     //console.log(number_of_rows);

//     res.status(200).render('quvvat', {
//         lang: req.baseUrl,
//         dbase: req.database,
//         text: req.lang,
//         firstskp: firstskp,
//         skps: skps,
//         number_of_rows : number_of_rows[0].num
//     });
// });

// router.post('/quvvat_skp', async(req, res)=>{
//     const skp = await dbase(
//         `SELECT skp, name FROM mosh 
//         WHERE skp LIKE "${req.body.skp}%" OR name LIKE "%${req.body.skp}%" 
//         GROUP BY skp  
//         LIMIT 0, 10`
//     );
//     //console.log(skp);
//     res.json(skp);
// });

// router.post('/quvvat', async(req, res)=>{
//     if(req.body.page < 0){
//         req.body.page = 0;
//     }
//     const mosh = await dbase(
//         `SELECT skp, tnved, name, m_unit, SUM(m_value) as m_value FROM mosh 
//         WHERE skp LIKE "${req.body.search}%" OR name LIKE "%${req.body.search}%" 
//         GROUP BY skp  
//         ORDER BY m_value DESC 
//         LIMIT ${req.body.page}, 50`
//     );
//     const number_of_rows = await dbase(
//         `SELECT COUNT(*) as num FROM (
//             SELECT skp, tnved, name, m_unit, SUM(m_value) as m_value FROM mosh 
//             WHERE skp LIKE "${req.body.search}%" OR name LIKE "%${req.body.search}%" 
//             GROUP BY skp  
//             ORDER BY m_value DESC ) temp`
//     );

//     res.json({a: mosh, b: number_of_rows[0].num, c:req.lang});
// });

// function isNumber(value) {
//     return typeof value === 'number' && isFinite(value);
// }

// router.get('/quvvat_skp_download', async(req, res)=>{
//     var wb = new xl.Workbook();
//     var ws = wb.addWorksheet('data');
//     const textStyle = wb.createStyle({
//         alignment:{ vertical: "center", horizontal: "center", wrapText: true}
//     });
//     ws.row(1).setHeight(54);
//     ws.row(2).setHeight(35);
//     ws.cell(1, 1, 1, 5, true)
//         .string(req.lang.center_name1 + req.lang.center_name2 + " " + req.lang.center_name3 + req.lang.center_name4)
//         .style(textStyle);
//     ws.cell(2, 1, 2, 5, true).string(req.lang.quvvat).style(textStyle).style({font: {bold: true}});

//     const mosh = await dbase(
//         `SELECT skp, tnved, name, m_unit, SUM(m_value) as m_value FROM mosh 
//         WHERE skp LIKE "${req.query.search}%" OR name LIKE "%${req.query.search}%" 
//         GROUP BY skp  
//         ORDER BY m_value DESC 
//         `
//     ); 

//     var i_counter = 0;
//     for(field in mosh[0]){
//         ws.cell(4, i_counter + 1).string(req.lang[field]);
//         i_counter = i_counter + 1;
//     }

//     mosh.forEach((el, i) => {
//         var j = 1;
//         for(field in el){
//             if(isNumber(el[field])){
//                 ws.cell(i + 5, j).number(el[field]);
//             }else{
//                 ws.cell(i + 5, j).string(el[field]);
//             }
            
//             j = j + 1;
//         }
//     });

//     // console.log(req.query.search);
//     wb.write(`quvvat_2019.xlsx`, res);
// });





// router.post('/', async (req, res)=>{
//     if(req.body.type === "mail"){
//         const answer = await dbase(`INSERT INTO emails ( mail ) VALUES (?);`, [req.body.email]);
//         res.status(200).render(     'main',         {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
//     }else if(req.body.type === "tel"){
//         const answer = await dbase(`INSERT INTO tel ( name, tel ) VALUES (?, ?);`, [req.body.name, req.body.tel]);
//         res.status(200).render(     'main',         {lang: req.baseUrl,     dbase: req.database,    text: req.lang});
//     }
// });

module.exports = router;