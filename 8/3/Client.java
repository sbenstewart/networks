import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;
public class Client
{
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
	public static String read() throws IOException
	{
	DatagramSocket ds = new DatagramSocket(4321);
        byte[] receive = new byte[65535];
	DatagramPacket DpReceive = null;
	DpReceive = new DatagramPacket(receive, receive.length);
	ds.receive(DpReceive);
	System.out.println("Reply from server:-" + data(receive));
	String ans=data(receive).toString();
	ds.close();
	return ans;
	}

	public static void main(String args[]) throws IOException
	{
		Scanner sc=new Scanner(System.in);
		DatagramSocket ds=new DatagramSocket();
		InetAddress ip=InetAddress.getLocalHost();
		byte buf[]=null;
		while(true)
		{
		String inp=sc.nextLine();
		String check;
		buf=inp.getBytes();
		DatagramPacket DpSend=new DatagramPacket(buf,buf.length,ip,1234);
		while(true)
			{
			ds.send(DpSend);
			check=read();
			if(inp.equals(check))
				break;
			System.out.println("Packet was damaged.Resending packet.");
			}
		}	
	}
}
