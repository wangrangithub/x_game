function CheckAll(chkTop, chkName){
	var chks = document.getElementsByName(chkName);
	for(var i = 0; i < chks.length; i++){
		chks[i].checked = chkTop.checked;
	}
}

function initTable(selector){
	$(selector).find("tbody tr:odd").css("background-color", "#fff");
	$(selector).find("tbody tr:even").css("background-color", "#f3f7fa");
	$(selector).hover(function(){
		
	});
}

/**
 * 获取表格选中的记录值，需要在表格的checkbox上设置value属性
 * @param tableid 表格id
 * @returns {Array} 返回值为数组
 */
function getSelectionIds(tableid){
	var array = new Array();
	$("#"+tableid).find("tbody :checkbox:checked").each(function(i, item){
		var val = $(item).val();
		array.push(val);
	});
	return array;
}



function hex(x) {
    //return ("0" + parseInt(x)).toString(16).slice(-2);
    return parseInt(x).toString(16);
}

function getHexBackgroundColor(obj) {
    var rgb = obj.style.backgroundColor;
    if (!+[1, ]) {
    }
    else {
        rgb = rgb.slice(4, -1).split(',');
        rgb = "#" + hex(rgb[0]) + hex(rgb[1]) + hex(rgb[2]);
    }
    return rgb;
}


function show() {
    var tab = $(".table_list tbody")[0];
    var tr = tab.getElementsByTagName("tr");
    for (var i = 1; i <= tr.length; i++) {

        var tag1 = tr[i - 1].getElementsByTagName("input");

        var isChecked = false;
        for (var j = 0; j < tag1.length; j++) {
            if (tag1[j].type == "checkbox" || tag1[j].type == "radio") {
                if (tag1[j].checked) {
                    isChecked = true;
                    break;
                }
            }
        }

        if (isChecked) {
            tr[i - 1].style.backgroundColor = "#fbe6e8";
        }
        else {
            if (i % 2 == 1) {
                tr[i - 1].style.backgroundColor = "#fff";
            }
            else {
                tr[i - 1].style.backgroundColor = "#f3f7fa";
            }
        }


        if (i % 2 == 1) {
            tr[i - 1].onmouseover = function () { if (getHexBackgroundColor(this) != '#fbe6e8') { this.style.backgroundColor = "#f9eced"; } };
            tr[i - 1].onmouseout = function () { if (getHexBackgroundColor(this) != '#fbe6e8') { this.style.backgroundColor = "#fff"; } };
            tr[i - 1].onclick = function () {
                var tag = this.getElementsByTagName("input");
                if (tag.length > 0) {
                    if (getHexBackgroundColor(this) != "#fbe6e8") {
                        this.style.backgroundColor = "#fbe6e8";

                        for (var j = 0; j < tag.length; j++) {
                            if (tag[j].type == "checkbox" || tag[j].type == "radio") {
                                tag[j].checked = true;
                            }
                            if (tag[j].type == "radio") {
                                show();
                            }
                        }

                    } else {
                        this.style.backgroundColor = "#fff";
                        for (var j = 0; j < tag.length; j++) {
                            if (tag[j].type == "checkbox" || tag[j].type == "radio") {
                                tag[j].checked = false;
                            }
                            if (tag[j].type == "radio") {
                                show();
                            }
                        }
                    }
                }
            };
        } else {
            tr[i - 1].onmouseover = function () { if (getHexBackgroundColor(this) != '#fbe6e8') { this.style.backgroundColor = "#f9eced"; } };
            tr[i - 1].onmouseout = function () { if (getHexBackgroundColor(this) != '#fbe6e8') { this.style.backgroundColor = "#f3f7fa"; } };
            tr[i - 1].onclick = function () {
                var tag = this.getElementsByTagName("input");
                if (tag.length > 0) {
                    if (getHexBackgroundColor(this) != "#fbe6e8") {
                        this.style.backgroundColor = "#fbe6e8";
                        for (var j = 0; j < tag.length; j++) {
                            if (tag[j].type == "checkbox" || tag[j].type == "radio") {
                                tag[j].checked = true;
                            }
                            if (tag[j].type == "radio") {
                                show();
                            }
                        }
                    } else {
                        this.style.backgroundColor = "#f3f7fa";
                        for (var j = 0; j < tag.length; j++) {
                            if (tag[j].type == "checkbox" || tag[j].type == "radio") {
                                tag[j].checked = false;
                            }
                            if (tag[j].type == "radio") {
                                show();
                            }
                        }
                    }
                }
            };
        }
        if (document.getElementById("tab1") != null) {
            show1();
        }
    }
}
function show1() {
    var tab = document.getElementById("tab1");
    var tr = tab.getElementsByTagName("tr");
    for (var i = 1; i <= tr.length; i++) {

        var tag1 = tr[i - 1].getElementsByTagName("input");

        var isChecked = false;
        for (var j = 0; j < tag1.length; j++) {
            if (tag1[j].type == "checkbox" || tag1[j].type == "radio") {
                if (tag1[j].checked) {
                    isChecked = true;
                    break;
                }
            }
        }
        if (isChecked) {
            tr[i - 1].style.backgroundColor = "#d4ebff";
        }
        else {
            if (i % 2 == 1) {
                tr[i - 1].style.backgroundColor = "#fff";
            }
            else {
                tr[i - 1].style.backgroundColor = "#f3f7fa";
            }
        }

        if (i % 2 == 1) {
            tr[i - 1].style.backgroundColor = "#fff";
            tr[i - 1].onmouseover = function () { if (getHexBackgroundColor(this)) { this.style.backgroundColor = "#f9eced" } };
            tr[i - 1].onmouseout = function () { if (getHexBackgroundColor(this)) { this.style.backgroundColor = "#fff" } };
            tr[i - 1].onclick = function () {
                var tag = this.getElementsByTagName("input");

                if (getHexBackgroundColor(this) != "#d4ebff") {
                    this.style.backgroundColor = "#d4ebff";

                    for (var i = 0; i < tag.length; i++) {
                        if (tag[i].type == "checkbox") {
                            tag[i].checked = true;
                        }
                    }

                } else {
                    this.style.backgroundColor = "#fff";
                    for (var i = 0; i < tag.length; i++) {
                        if (tag[i].type == "checkbox") {
                            tag[i].checked = false;
                        }
                    }
                }
            };
        } else {

            tr[i - 1].style.backgroundColor = "#f3f7fa";
            tr[i - 1].onmouseover = function () { if (getHexBackgroundColor(this) != '#d4ebff') { this.style.backgroundColor = "#f9eced" } };
            tr[i - 1].onmouseout = function () { if (getHexBackgroundColor(this) != '#d4ebff') { this.style.backgroundColor = "#f3f7fa"; } }
        };
        tr[i - 1].onclick = function () {
            var tag = this.getElementsByTagName("input");
            if (getHexBackgroundColor(this) != "#d4ebff") {
                this.style.backgroundColor = "#d4ebff";
                for (var i = 0; i < tag.length; i++) {
                    if (tag[i].type == "checkbox") {
                        tag[i].checked = true;
                    }
                }
            } else {
                this.style.backgroundColor = "#f3f7fa";
                for (var i = 0; i < tag.length; i++) {
                    if (tag[i].type == "checkbox") {
                        tag[i].checked = false;
                    }
                }
            }
        };
    }
}
window.onload = show;