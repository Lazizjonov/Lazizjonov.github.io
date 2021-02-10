const express = require('express');
const dbase = require('../parts/dbase.js');
const typemaker = require('../parts/typemaker.js');
const fileWorker = require('../parts/fileWorker.js');

var { randomBytes } = require('crypto');

const router = express.Router();

router.get('/', async (req, res)=>{
    if (req.session.csrf === undefined) {
        req.session.csrf = randomBytes(100).toString('base64'); // convert random data to a string
    }
    try{
        const result = await dbase("SHOW TABLES");
        res.status(200).render('admin', {
            result: result,
            lang: '/uz',
            dbase: req.database,
            text: req.lang
        });
    }catch(err){
        console.log(err);
        res.sendStatus(404);
    }
});

router.get('/:id/', async (req, res)=>{
    if (req.session.csrf === undefined) {
        req.session.csrf = randomBytes(100).toString('base64'); // convert random data to a string
    }

    try{
        const rownames = await dbase("SHOW columns FROM " + req.params.id);
        const rows = await dbase("SELECT * from " + req.params.id);

        var fields = [];
        var types = [];
        var primary = null;
        var primtype = null;
        rownames.forEach(row => { 
            fields.push(row.Field);
            types.push(typemaker(row.Type));
            if(primary === null && row.Key === "PRI"){
                primary = row.Field;
                primtype = row.Type;
            }
        });

        //console.log(rownames);

        //console.log(rownames);

        res.status(200).render('table', {
            fields: fields,
            types: types,
            rows: rows,
            id: req.params.id,
            token: req.session.csrf,
            primary: primary,
            primtype: primtype,
            lang: '/uz',
            dbase: req.database,
            text: req.lang
        });

    }catch(err){
        console.log(err);
        res.sendStatus(404);
    }
});

router.post('/:id/', async (req, res)=>{

    try{
        const rownames = await dbase("SHOW columns FROM " + req.params.id);
        var rows = await dbase("SELECT * from " + req.params.id);

        var fields = [];
        var types = [];
        var fillers = [];
        var files = [];
        var primary = null;
        var primtype = null;
        rownames.forEach(row => { 
            fields.push(row.Field);
            types.push(typemaker(row.Type));

            if(row.Key === "PRI" && primary === null){
                primary = row.Field;
                primtype = row.Type;
            }
        });

        if (req.files){
            const filesresponse = await fileWorker(req.files, req.body[primary]);
            //console.log(filesresponse);
            if(filesresponse[0] === undefined){
                return res.sendStatus(500);
            }
            files = filesresponse[1];
        }

        //console.log(fields, req.body);

        if (req.body.reqtype === "ins"){
            fields.forEach((field,i) => {
                if(types[i] === 'number') {
                    fillers.push(parseInt(req.body[field]));
                } else if(types[i] === 'file') {
                    fillers.push(files.shift());
                } else {
                    fillers.push(req.body[field].toString());
                }
            });

            const answer = await dbase(`INSERT INTO ${req.params.id} ( ${fields.join(', ')} ) VALUES (${'?, '.repeat(fields.length - 1)}?);`, fillers);
        }

        if (req.body.reqtype === "del"){
            const answer = await dbase(`DELETE FROM ${req.params.id} WHERE ${primary} = ${req.body[primary]}`);
        }

        if (req.body.reqtype === "edit"){
            var quer = {};
            fields.forEach((field,i) => {
                if (req.body.hasOwnProperty(field) && field !== primary) {
                    quer[field] = req.body[field];
                }else if(files.length !== 0 && types[i] === 'file'){
                    const fl = files.shift();
                    if(fl){
                        quer[field] = fl;
                    }
                }
            });

            const answer = await dbase(`
                UPDATE ${req.params.id}
                SET ? 
                WHERE ${primary} = '${req.body[primary]}';
            `,quer);
        }

        rows = await dbase("SELECT * from " + req.params.id);

        res.status(200).render('table', {
            fields: fields,
            types: types,
            rows: rows,
            id: req.params.id,
            token: req.session.csrf,
            primary: primary,
            primtype: primtype,
            lang: '/uz',
            dbase: req.database,
            text: req.lang
            //answer: answer
        });
    }catch(err){
        console.log(err);
        res.sendStatus(404);
    }
});

router.get('/:id/:col/', async (req, res)=>{

    //console.log(req.params);
    if(req.params.col === "new"){
        try{
            const rownames = await dbase("SHOW columns FROM " + req.params.id);
            
            var fields = [];
            var types = [];
            var primary = null;
            var primtype = null;
            rownames.forEach(row => { 
                fields.push(row.Field);
                types.push(typemaker(row.Type));
                if(primary === null && row.Key === "PRI"){
                    primary = row.Field;
                    primtype = row.Type;
                }
            });

            // const rows = await dbase(`SELECT * FROM ${req.params.id} WHERE ${primary}=${req.params.col}`);
            // console.log(rows);
            // res.sendStatus(200);
            //console.log(rownames);

            res.status(200).render('add', {
                fields: fields,
                types: types,
                id: req.params.id,
                token: req.session.csrf,
                primary: primary,
                primtype: primtype,
                lang: '/uz',
                dbase: req.database,
                text: req.lang
            });
        } catch(err) {
            console.log(err);
            res.sendStatus(404);
        }
    }else{
        try{
            const rownames = await dbase("SHOW columns FROM " + req.params.id);
            

            var fields = [];
            var types = [];
            var primary = null;
            var primtype = null;
            rownames.forEach(row => { 
                fields.push(row.Field);
                types.push(typemaker(row.Type));
                if(primary === null && row.Key === "PRI"){
                    primary = row.Field;
                    primtype = row.Type;
                }
            });
            // console.log(`SELECT * FROM ${req.params.id} WHERE ${primary}='${req.params.col}'`);

            const rows = await dbase(`SELECT * FROM ${req.params.id} WHERE ${primary}='${req.params.col}'`);
            // console.log(rows);
            // res.sendStatus(200);
            //console.log(rownames);

            res.status(200).render('edit', {
                fields: fields,
                types: types,
                rows: rows,
                id: req.params.id,
                token: req.session.csrf,
                primary: primary,
                primtype: primtype,
                lang: '/uz',
                dbase: req.database,
                text: req.lang
            });
        } catch(err) {
            console.log(err);
            res.sendStatus(404);
        }
    }
});

module.exports = router;