using System;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Diagnostics;

namespace SignalRApplication
{
    public class MyHub : Hub
    {

        public override System.Threading.Tasks.Task OnConnected()
        {
            return base.OnConnected();
        }
        public override System.Threading.Tasks.Task OnReconnected()
        {
            return base.OnReconnected();
        }
        public override System.Threading.Tasks.Task OnDisconnected(bool stopCalled)
        {
            if (stopCalled) {
                Trace.WriteLine(string.Format("ConnectionId {0 disconnected", Context.ConnectionId));
            }
            else {
                Trace.WriteLine(string.Format("ConnectionId {0} time out", Context.ConnectionId));
            }
            return base.OnDisconnected(stopCalled);
        }
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }


        public void Connect(string who)
        {
            Clients.All.notifyUserConnected(who);
        }

        [HubMethodName("broadcastMessage")]
        public void BroadcastMessage(string name, string msg)
        {
            Clients.All.broadcastMessage(name, msg);
        }
    }
}