(function($) {
    $(document).ready(function() {
        $("#login").qtip({ 
            style: { name: 'green', tip: true, border: { radius: 5 }},
            hide: { effect: 'slide' },
            show: { effect: 'slide' },
            position: { target: $('.moduleTitle') },
            content: "填写您的用户名和密码来查询您的<span class='imp'>订单状态</span>或修改您的<span class='imp'>个人信息</span>。"
        });
        $(".searchBox").qtip({ 
            style: { name: 'green', tip: true, border: { radius: 5 } },
            hide: { effect: 'slide' },
            show: { effect: 'slide' },
            position: { corner: { target: 'topMiddle',tooltip: 'bottomMiddle' } },
            content: "填写您要搜索的<span class='imp'>手机型号</span>。"
        }); 
        $("#searchText").keydown(function(event){
				if(event.keyCode == 13)
							$('#searchButton').click();
        });			   
    });
})(jQuery);