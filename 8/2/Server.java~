import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
public class Server
{
    public static void sender(String rec) throws IOException
    {
	DatagramSocket ds=new DatagramSocket();
	InetAddress ip=InetAddress.getLocalHost();
	byte buf[]=null;
	buf=rec.getBytes();
	DatagramPacket DpSend=new DatagramPacket(buf,buf.length,ip,4321);
	ds.send(DpSend);
    }
    public static void main(String[] args) throws IOException
    {
        DatagramSocket ds = new DatagramSocket(1234);
        byte[] receive = new byte[65535];
	DatagramPacket DpReceive = null;
 	DpReceive = new DatagramPacket(receive, receive.length);
	ds.receive(DpReceive);
	System.out.println("Client:-" + data(receive));
	sender(data(receive).toString());
        
    }
 
    // A utility method to convert the byte array
    // data into a string representation.
    public static StringBuilder data(byte[] a)
    {
        if (a == null)
            return null;
        StringBuilder ret = new StringBuilder();
        int i = 0;
        while (a[i] != 0)
        {
            ret.append((char) a[i]);
            i++;
        }
        return ret;
    }
}
