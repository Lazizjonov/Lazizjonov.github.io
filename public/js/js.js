/* 
    dqs() is same as $() for selecting elemnts in html
    usage:
        dqs("#myID").innerHTML = "new value";
        dqs(".colorDiv").style.color = "silver";
        dqs("body").addEventListener("click", (event)=>{console.log(event)});
*/

function dqs(name){
    var n = document.querySelectorAll(name);
    if(n.length === 0){
        return undefined;
    }else if(n.length === 1){
        return n[0];
    }else{
        return n;
    }
}

/*
    sbmt(inputdata, url, func_name) is function to use as ajax
    inputdata = {"name": name, "email": email, "number": message, "_token": token, "token": token}
    url = dqs("#myform").action

    request method is post
    running func_name(response) on the response
    response in json format

    usage: 
        function responseFunction(res){
            console.log(res);
        }
        sbmt({"name": "myName", "email": "myEmail@mail.xx"}, "localhost:8040/admin/", responseFunction);
*/

function sbmt(inputdata, url, func_name) {
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200) {
            var jsonData = JSON.parse(request.response);
            func_name(jsonData);
            //sdf = request.response;
            //alert("Принято");
        }
    };
    var data = JSON.stringify(inputdata);
    request.send(data);
    request.onload = function() {
        //console.log(request.responseText);
    }
}

/* 
    sbmt2() works as sbmt()
    the difference is sbmt runing responce function with true responce not in json format
*/

function sbmt2(inputdata, url, func_name) {
    //inputdata = {"name": name, "email": email, "number": message, "_token": token, "token": token}
    //url = {.{ route('form_submit') }.}
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200) {
            //var jsonData = JSON.parse(request.response);
            func_name(request.response);
            //sdf = request.response;
            //alert("Принято");
        }
    };
    var data = JSON.stringify(inputdata);
    request.send(data);
    request.onload = function() {
        //console.log(request.responseText);
    }
}

/* sticky header adding scroll event */
document.addEventListener("scroll", ()=>{
    if(document.documentElement.scrollTop > 80){
        dqs('.stick').classList.remove('active');
    }else{
        dqs('.stick').classList.add('active');
    }
});


/* adding stick effect to header if page is already scrolled */
if(dqs('.stick')){
    if(document.documentElement.scrollTop > 80){
        dqs('.stick').classList.remove('active');
    }else{
        dqs('.stick').classList.add('active');
    }
}

/* slider functions */
var timer = null;
function slide__left(name){
    var els = dqs('.'+ name);
    var actel = dqs('.'+ name + '.active');
    if(actel.previousElementSibling && actel.previousElementSibling.classList.contains(name)){
        actel.classList.remove('active');
        actel.previousElementSibling.classList.add('active');
        actel.style.animation = "go_right 0.5s linear";
        actel.previousElementSibling.style.animation = "come_left 0.5s linear";
    }else if(els.length){
        actel.classList.remove('active');
        els[els.length - 1].classList.add('active');
        actel.style.animation = "go_right 0.5s linear";
        els[els.length - 1].style.animation = "come_left 0.5s linear";
    }
    if(timer){
        clearTimeout(timer);
    }
    timer = setTimeout(()=>{
        slide__right(name);
    }, 6000);
}

function slide__right(name){
    var els = dqs('.'+ name);
    var actel = dqs('.'+ name + '.active');
    if(actel.nextElementSibling && actel.nextElementSibling.classList.contains(name)){
        actel.classList.remove('active');
        actel.nextElementSibling.classList.add('active');
        actel.style.animation = "go_left 0.5s linear";
        actel.nextElementSibling.style.animation = "come_right 0.5s linear";
    }else if(els.length){
        actel.classList.remove('active');
        els[0].classList.add('active');
        actel.style.animation = "go_left 0.5s linear";
        els[0].style.animation = "come_right 0.5s linear";
    }
    if(timer){
        clearTimeout(timer);
    }
    timer = setTimeout(()=>{
        slide__right(name);
    }, 6000);
}

if(dqs('.slider')){
    if(timer){
        clearTimeout(timer);
    }
    timer = setTimeout(()=>{
        slide__right('slider__elem');
    }, 6000);
}

/* functions for piano */

function piano(el){
    var act = dqs('.note.active')
    if(act){
        act.classList.remove("active");
    }
    if(act !== el.parentElement){
        el.parentElement.classList.add("active");
    }else{
        el.parentElement.classList.remove("active");
    }
}

/* calling registration form */

function call__reg(){
    dqs('.reg').classList.add('active');
}

/* adding buttons to cal reg form */

if(dqs('.stick .stick__btn')){
    dqs('.stick .stick__btn').addEventListener('click', call__reg);
}

if(dqs('.callus .call__btn')){
    dqs('.callus .call__btn').addEventListener('click', call__reg);
}

/* checklabel function */

function checklabel(that){
    if(that.value === ""){
        that.classList.remove('active');
    }else{
        that.classList.add('active');
    }
}

/* numbers section js with animations */

function run(el){
    if (el.dataset.src === el.innerHTML){
        return;
    }else{
        el.innerHTML -= -1;
        el.classList.remove('active');
        setTimeout(()=>{
            run(el);
        }, 60);
    }
}

if(dqs('.num.active')){
    document.addEventListener('scroll', (event)=>{
        var n1 = dqs('.num.active');
        if(n1 && n1.length){
            for (let i = 0; i < n1.length; i++) {
                const el = n1[i];
                var mid = el.offsetTop + el.offsetHeight/2;
                if( ( window.scrollY < mid ) && ( mid < (window.scrollY + window.innerHeight))){
                    run(el);
                }
            }
        }else if(n1){
            var mid = n1.offsetTop + n1.offsetHeight/2;
            if( ( window.scrollY < mid ) && ( mid < (window.scrollY + window.innerHeight))){
                run(n1);
            }
        }
    });
}

/* burger menu js */

dqs('.stick .burger').addEventListener('click', switchmenu);

function switchmenu(){
    dqs('.stick__menu').classList.toggle('active');
    dqs('.stick .burger').classList.toggle('active');
    if(dqs('.head')){
        dqs('.head').classList.toggle('active');
    }
}

/* preloader js */

window.onload = function(){
    dqs(".prel").classList.remove("active");
    setTimeout(()=>{
        dqs(".prel__hid--text").innerHTML = dqs(".prel__hid--text").dataset.src;
    },1000);
}

/* loging to console at the end */

console.log('js connected.');