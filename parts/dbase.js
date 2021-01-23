const mysql = require("mysql2");
const util = require( 'util' );

const connection = mysql.createConnection({
    host: "localhost",
    user: "jasur",
    database: "architector",
    password: "J@$Ur"
});

function makerequest(){

    return {
        query( sql, args ) {
            return util.promisify( connection.query ).call( connection, sql, args );
        },
        close() {
            return util.promisify( connection.end ).call( connection );
        }
    }; 
}


const request = makerequest();

function dbase(sql, args){
    const res = request.query(sql, args);
    // request.close();
    return res;
}
module.exports = dbase;