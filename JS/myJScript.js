$(document).ready(function () {

    $("#lnkRegister").click(function () {
        if ($("#txtUname").val == "") {
            alert("Enter usernme");
            return false;
        }
        else
            return true;
    });


});


var menuOffset = $('#menu')[0].offsetTop;
$(document).bind('ready scroll', function () {
    var docScroll = $(document).scrollTop();

    if (docScroll >= menuOffset) {

        $('#menu').addClass('fixed');
    }
    else {
        $('#menu').removeClass('fixed');


    }
});




$("#conHold_btnUpload").click(function () {

    if ($("#conHold_fuProfile").val() == "") {
        $("#lblMsg").text("Please Select A File!");
        return false;
    }

    var filename = $("#conHold_fuProfile").val();

    var ex = filename.replace(/^.*\./, '');
    if (ex == filename)
        ex = '';
    else {
        ex = ex.toLowerCase();
    }
    switch (ex) {
        case 'jpg':
        case 'png':
        case 'jpeg':


            return true;

    }

    $("#lblMsg").text("Invalid File Type!");
    return false;
});

$("#spnUpload").bind("click", function () {
    $("#conHold_fuProfile").click();
});

$("#spnUploadfile").bind("click", function () {
    $("#conHold_fuNotes").click();
});

$(function () {
    $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).fadeIn("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");
            },
            function () {
                $('.dropdown-menu', this).fadeOut("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");
            });
});
