function typemaker(name){
    //console.log(name);
    name = name.split('(')[0];
    //console.log(name);
    if(name === "int"){
        return 'number';
    }else if(name === "mediumtext"){
        return 'file';
    }else if(name === "date" || name === "datetime"){
        return 'date';
    }else if(name === "text"){
        return 'textarea';
    }else{
        return 'text';
    }
}
module.exports = typemaker;