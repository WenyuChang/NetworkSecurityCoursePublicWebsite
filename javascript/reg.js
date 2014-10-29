(function($) {
    $(document).ready(function() {
        $("#createUser_CreateUserStepContainer_UserName").qtip({
            style: { name: 'green', tip: true, border: { radius: 5} },
            hide: { effect: 'slide' },
            show: { effect: 'slide' },
            position: { corner: { target: 'rightMiddle', tooltip: 'leftMiddle'} },
            content: "用户名为<span class='imp'>英文</span>、<span class='imp'>数字</span>、<span class='imp'>下划线</span>的组合，长度为<span class='imp'>6-12</span>位。"
        });
        $("#createUser_CreateUserStepContainer_Password").qtip({
            style: { name: 'green', tip: true, border: { radius: 5} },
            hide: { effect: 'slide' },
            show: { effect: 'slide' },
            position: { corner: { target: 'rightMiddle', tooltip: 'leftMiddle'} },
            content: "密码为<span class='imp'>英文</span>、<span class='imp'>数字</span>、<span class='imp'>下划线</span>的组合，长度为<span class='imp'>6-16</span>位。"
        });        
        $("#createUser_CreateUserStepContainer_Email").qtip({
            style: { name: 'green', tip: true, border: { radius: 5} },
            hide: { effect: 'slide' },
            show: { effect: 'slide' },
            position: { corner: { target: 'rightMiddle', tooltip: 'leftMiddle'} },
            content: "Email方便我们与您联系，并且当您<span class='imp'>忘记密码</span>时将发送密码到这个Email。"
        });
    });
})(jQuery);