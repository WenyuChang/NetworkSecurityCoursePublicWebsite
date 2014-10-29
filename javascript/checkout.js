(function($) {
    var myTimer, i = 5;
    function displaySecond() {
        var myDate = new Date();
        if (i == 0) {
            window.clearTimeout(myTimer);
            location.href = "index.aspx";
            return;
        }
        $('#time').html(i);
        myTimer = window.setTimeout(displaySecond, 1000);
        i = i - 1;
    }
    function SetCookie(name, value, expires) {
        var today = new Date();
        today.setTime(today.getTime());
        if (expires) { expires *= 86400000; }
        var expires_date = new Date(today.getTime() + (expires));
        document.cookie = name + "=" + value + (expires ? ";expires=" + expires_date.toGMTString() : "") + ";path=/";
    }
    function GetCookie(name) {
        var cookies = document.cookie.split(';');
        var cookie = '';
        for (var i = 0; i < cookies.length; i++) {
            cookie = cookies[i].split('=');
            if (cookie[0].replace(/^\s+|\s+$/g, '') == name) {
                return (cookie.length <= 1) ? "" : unescape(cookie[1].replace(/^\s+|\s+$/g, ''));
            }
        }
        return null;
    }
    function DelCookie(name) {
        document.cookie = name + "=" + GetCookie(name) + ";expires=Thu, 01-Jan-1970 00:00:01 GMT;path=/";
    }

    function delPhone() {
        var val = $(this).parent("li").attr("pid");
        var cookie = GetCookie("phoneDetail");
        var cookies = cookie.split('|');
        var str = "";
        for (var i = 0; i < cookies.length; i++) {
            if ((i + 1) != val) {
                str += cookies[i];
                str += "|";
            }
        }
        str = str.substring(0, str.length - 1);
        if (str.length == 0)
            DelCookie("phoneDetail");
        else
            SetCookie("phoneDetail", str, 24);
        var i = $(this).parent("li").attr("pid");
        $(this).parent("li").nextAll().each(function() { $(this).attr("pid", i); i++; });

        $("#phoneNum").html($("#phoneNum").html() - 1);
        $("#phoneMoney").html($("#phoneMoney").html() - $(this).prev().html().substring(1, $(this).prev().html().length));
        $(this).parent("li").slideUp("normal", function() {
            $(this).remove();
        });
        //$("li[pid]").each(function() { $(this).attr("pid") = i; i++; });
    }

    $(document).ready(function() {
        $(".del").click(delPhone);
        $(".detail").each(function() {
            var val = $(this).parent("li").attr("detail");
            var vals = val.split(' ');
            var open = vals[1] == "1" ? "可以" : "不可以";
            var water = vals[2] == "1" ? "有" : "没有";
            if (vals[3] == "1")
                state = "很好";
            else if (vals[3] == "2")
                state = "好";
            else if (vals[3] == "3")
                state = "一般";
            else if (vals[3] == "4")
                state = "比较差";
            var str = "";
            if (vals[4] == "1")
                str += "电源 ";
            if (vals[5] == "1")
                str += "内存卡 ";
            if (vals[6] == "1")
                str += "数据线 ";
            if (vals[7] == "1")
                str += "发票";
            $(this).qtip({
                style: { name: 'green', tip: true, border: { radius: 5} },
                hide: { effect: 'slide' },
                show: { effect: 'slide' },
                position: { corner: { target: 'bottomMiddle', tooltip: 'topMiddle'} },
                content: "<ul class='tips'><li>这部手机是否还能开机使用？<span>" + open + "</span></li><li>这部手机是否进过水？<span>" + water + "</span></li><li>这部手机处于什么状况？<span>" + state + "</span></li><li>以下配件您有哪些还保留？<span>" + str + "</span></li></ul>"
            });
        });
        $('#nextTip').qtip(
       {
           content: {
               title: {
                   text: '友情提示',
                   button: 'X'
               },
               text: "<span style='font-size:15px;'>您还没有登录，请先<a href='login.aspx' style='font-weight:bold;'>登录</a>或<a href='register.aspx' style='font-weight:bold;'>注册</a></span>"
           },
           position: {
               target: $(document.body), // Position it via the document body...
               corner: 'center' // ...at the center of the viewport
           },
           show: {
               when: 'click', // Show it on click
               solo: true // And hide all other tooltips
           },
           hide: false,
           style: {
               width: { max: 350 },
               padding: '14px',
               border: {
                   width: 9,
                   radius: 9,
                   color: '#666666'
               },
               name: 'light'
           },
           api: {
               beforeShow: function() {
                   // Fade in the modal "blanket" using the defined show speed
                   $('#qtip-blanket').fadeIn(this.options.show.effect.length);
               },
               beforeHide: function() {
                   // Fade out the modal "blanket" using the defined hide speed
                   $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
               }
           }
       });

        $('#nextTip2').qtip(
       {
           content: {
               title: {
                   text: '友情提示',
                   button: 'X'
               },
               text: "<span style='font-size:15px;'>您的回收箱中还没有需要回收的手机，系统将在<span id='time' class='imp'>5</span>秒后自动跳转到首页。</span>"
           },
           position: {
               target: $(document.body), // Position it via the document body...
               corner: 'center' // ...at the center of the viewport
           },
           show: {
               when: 'click', // Show it on click
               solo: true // And hide all other tooltips
           },
           hide: false,
           style: {
               width: { max: 350 },
               padding: '14px',
               border: {
                   width: 9,
                   radius: 9,
                   color: '#666666'
               },
               name: 'light'
           },
           api: {
               beforeShow: function() {
                   // Fade in the modal "blanket" using the defined show speed
                   $('#qtip-blanket').fadeIn(this.options.show.effect.length, function() { displaySecond(); });
               },
               beforeHide: function() {
                   // Fade out the modal "blanket" using the defined hide speed
                   $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
               }
           }
       });
        // Create the modal backdrop on document load so all modal tooltips can use it
        $('<div id="qtip-blanket">')
          .css({
              position: 'absolute',
              top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
              left: 0,
              height: $(document).height(), // Span the full document height...
              width: '100%', // ...and full width

              opacity: 0.7, // Make it slightly transparent
              backgroundColor: 'black',
              zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
          })
          .appendTo(document.body) // Append to the document body
          .hide(); // Hide it initially
    });
})(jQuery);