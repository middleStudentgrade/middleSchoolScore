function password(){
$.ajax({
    url: "http://localhost:8080/student/getPassword",
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
        url: "http://localhost:8080/student/changePassword",
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
            }
        },
        error: function(){
        }
    })}