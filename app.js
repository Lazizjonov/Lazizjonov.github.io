const express = require('express');
const path = require('path');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
var cookieSession = require('cookie-session'); 
var { randomBytes } = require('crypto');

const query = require('./parts/query.js');

const mainrouter = require('./routers/viewrouters');
const adminrouter = require('./routers/adminrouters');
const redircter = require('./routers/redirecter');

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

//app.use(express.json());
//app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser());

app.use(cookieSession({
    name: 'session',                              // name of the cookie
    secret: 'MAKE_THIS_SECRET_SECURE',            // key to encode session
    maxAge: 24 * 60 * 60 * 1000,                  // cookie's lifespan
    sameSite: 'lax',                              // controls when cookies are sent
    path: '/',                                    // explicitly set this for security purposes
    //secure: process.env.NODE_ENV === 'production',// cookie only sent on HTTPS
    httpOnly: true                                // cookie is not available to JavaScript (client)
}));

app.use(express.static(path.join(__dirname, 'public')));
app.use(fileUpload());


app.use(/\/uz|\/ru|\/admin|\//, query);

app.use(/\/uz|\/ru/, mainrouter);
app.use('/admin', (req, res, next)=>{
    if ( req.session.csrf === undefined ) {
        if ( req.method === "POST" && req.body.login === "LaZiZjOnOv" && req.body.pass === "PaSsWoRd" ){
            req.session.csrf = randomBytes(100).toString('base64'); // convert random data to a string
            res.redirect('/admin');
        }else{
            return res.render('authorization', {
                lang: '/uz',
                dbase: req.database,
                text: req.lang
            });
        }
    }
    next();
})
app.use('/admin', adminrouter);
app.use('/', redircter);
app.use((req, res, next) => {
    res.status(404).send("Sorry can't find that!");
});

app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something broke!');
});

const port = 8040;
app.listen(port, () => {
    console.log(`App running on port ${port}...`);
});