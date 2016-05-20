
function password(){

    $.ajax({
        url: "http://localhost:8081/teacher/getPassword",
        data: {
            id: $("#teacherId").val(),
            password: $("#password").val()
        },
        type: 'POST',
        dataType: "json",
        async: false,
        success: function (data) {
            if(data.status==500) {
                $("#error").text("密码不正确");
                $("#commit").unbind("click");/*
                $("#rpwd").attr("readonly",true);
                $("#newPassword").attr("readonly",true);
                $("#commit").attr("readonly",true);*/
            }
            else
                $("#error").text("");
                $("#commit").bind("click");/*
                $("#rpwd").removeAttr("readonly");
                $("#newPassword").removeAttr("readonly");
                $("#commit").removeAttr("readonly");*/
        },
        error: function(){
        }
    })}

function changepassword(){
    $.ajax({
        url: "http://localhost:8081/teacher/changePassword",
        data: {
            id: $("#teacherId").val(),
            password: $("#newPassword").val()
        },
        type: 'POST',
        dataType: "json",
        async: false,
        success: function (data) {
            if(data.status==500) {
                $("#error").text("密码不正确");
            }else{
                $("#error").text("修改密码成功");
            }
        },
        error: function(){
        }
    })}