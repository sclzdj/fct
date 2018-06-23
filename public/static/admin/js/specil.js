//日期插件
$.fn.datepicker.dates['cn'] = {   //切换为中文显示  
    days: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],  
    daysShort: ["日", "一", "二", "三", "四", "五", "六", "七"],  
    daysMin: ["日", "一", "二", "三", "四", "五", "六", "七"],  
    months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
    monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
    today: "今天",  
    clear: "清除"  
};    
 $('.timepick').datepicker({  
    autoclose: true, //自动关闭  
    //beforeShowDay: $.noop,    //在显示日期之前调用的函数  
    calendarWeeks: false,     //是否显示今年是第几周  
    clearBtn: true,          //显示清除按钮  
    daysOfWeekDisabled: [],   //星期几不可选  
    endDate: Infinity,        //日历结束日期  
    forceParse: true,         //是否强制转换不符合格式的字符串  
    format: 'yyyy-mm-dd',     //日期格式  
    keyboardNavigation: true, //是否显示箭头导航  
    language: 'cn',           //语言  
    minViewMode: 0,  
    orientation: "bottom left",      //方向  
    rtl: false,  
    startDate: -Infinity,     //日历开始日期  
    startView: 0,             //开始显示  
    todayBtn: false,          //今天按钮  
    todayHighlight: true,    //今天高亮 
    weekStart: 1,   //星期几是开始 
    minViewMode: 0,
    maxViewMode: 4,
    multidate: false,
    multidateSeparator: ',',
    daysOfWeekHighlighted: [],
    datesDisabled: [],
    toggleActive: false  
}); 

function herhide(id){
    $(document).bind('click',function(e){ 
        var e = e || window.event; //浏览器兼容性 
        var vid=id+'1';
        var elem = e.target || e.srcElement; 
        while (elem) { //循环判断至跟节点，防止点击的是div子元素 
        if (elem.id && (elem.id==id|| elem.id==vid)) { 
            return false; 
        } 
        elem = elem.parentNode; 
        } 
        $('#'+vid).css('display','none'); //点击的不是div或其子元素 
    }); 
}


$.fn.extend({  
    "preventScroll":function(){  
        $(this).each(function(){  
            var _this = this;  
            if(navigator.userAgent.indexOf('Firefox') >= 0){   //firefox  
                _this.addEventListener('DOMMouseScroll',function(e){  
                    _this.scrollTop += e.detail > 0 ? 60 : -60;     
                    e.preventDefault();  
                },false);   
            }else{  
                _this.onmousewheel = function(e){     
                    e = e || window.event;     
                    _this.scrollTop += e.wheelDelta > 0 ? -60 : 60;     
                    return false;  
                };  
            }  
        })    
    }  
});  

$(function(){
    $('input.timepick').prop('readonly',true);
});