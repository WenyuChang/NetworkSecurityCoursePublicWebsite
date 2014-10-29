(function($) {
    // 需要你写的数据
    var data = [
	    { title: '1', desc: '', src: '../image/1.jpg' },
	    { title: '2', desc: '', src: '../image/2.jpg' },
	    { title: '3', desc: '', src: '../image/3.jpg' },
	    { title: '4', desc: '', src: '../image/4.jpg' },
	    { title: '5', desc: '', src: '../image/5.jpg' }
    ];

    $(document).ready(function() {
        $('#pic').d_imagechange({
            data: data,
            playTime: 3000,
            width: 774,
            bg: false,
            title: false,
            desc: false,
            btn: false, 
            btnText: false 
        });
    });
})(jQuery);
