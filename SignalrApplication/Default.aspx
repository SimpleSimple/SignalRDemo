<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SignalRApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            $.connection.hub.logging = true;
            var myHub = $.connection.myHub;
            $.connection.hub.start({ transport: ['webSockets', 'longPolling', 'serverSentEvents'] })
                .done(function () {
                    console.info('`SignalR - The persistent connection has been successfully established, connectionId = ' + $.connection.hub.id + '.`');
                    myHub.server.connect("testuser");
                })
            .fail(function (error) {
                console.info('`SignalR - Unable to start persistent connection. Reason: ' + error + '`');
            });

            $.extend(myHub.client, {
                notifyUserConnected: function (msg) {
                    console.info(msg);
                }
            });
        })
    </script>

</body>
</html>
