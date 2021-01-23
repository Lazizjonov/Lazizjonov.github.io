async function fileWorker(files, primary){
    var promArr = [];
    var names = [];
    for(file in files){
        let imageFile = files[file];
        var filename;
        const dt = new Date();
        const rand = `${dt.getHours()}_${dt.getMinutes()}_${dt.getSeconds()}_${dt.getDate()}_${dt.getMonth()}_${dt.getFullYear()}`
        if(/\.png$|\.jpeg$|\.jpg$|\.webp$/.test(imageFile.name)){
            filename = 'public/uploads/imgs/'+ rand + "_" + primary + "_" + imageFile.name;
            names.push('/uploads/imgs/' + rand + "_" + primary + "_" + imageFile.name);
        }else{
            filename = 'public/uploads/files/'+ rand + "_" + primary + "_" + imageFile.name;
            names.push('/uploads/files/' + rand + "_" + primary + "_" + imageFile.name);
        }
        const resp = await imageFile.mv(filename);
        promArr.push(resp);
    }
    return [Promise.all(promArr), names];
}
module.exports = fileWorker;
