using System;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace SignalRApplication
{
    public class MyHub : Hub
    {
        [HubMethodName("Hello")]
        public void Hello()
        {
            Clients.All.hello();
        }
    }
}