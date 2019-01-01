<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignalRDemo.aspx.cs" Inherits="SignalRApplication.SignalrDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="container">
    
    </div>
    <script src="Scripts/jquery-1.8.2.min.js"></script>
    <script src="Scripts/jquery.signalR-2.4.0.js"></script>
    <script src="/signalr/hubs"></script>
    <script>
        $(function () {
            var myHub = $.connection.MyHub;
            $.connection.hub.logging = true;
            $.connection.hub.start().done(function () {
                console.log('hub start done');
            })
        })
    </script>
    
</body>
</html>
