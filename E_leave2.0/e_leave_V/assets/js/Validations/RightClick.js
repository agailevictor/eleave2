var BM = 2;
var BR = 3;
var sg = "RIGHT CLICK IS DISABLED !";
function mouseDown(e) {
    try{
        if(event.button== BM || event.button==BR){return false;}
    }
    catch (e) {
        if(e.which ==BR)
        {
            return false;
        }
    }
}
document.oncontextmenu = function () { alert(msg); return false; }
document.onmousedown = mouseDown;