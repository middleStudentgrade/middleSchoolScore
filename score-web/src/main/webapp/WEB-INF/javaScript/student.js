function password(){
$.ajax({
    url: "http://localhost:8081/student/getPassword",
    data: {
        id: $("#studentId").val(),
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
        url: "http://localhost:8081/student/changePassword",
        data: {
            id: $("#studentId").val(),
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