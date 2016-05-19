
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
                $("#commit").unbind("click");
            }
            else
                $("#error").text("");
            $("#commit").bind("click");
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
            }
        },
        error: function(){
        }
    })}