import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;
public class Client
{
	public static void main(String args[]) throws IOException
	{
		Scanner sc=new Scanner(System.in);
		DatagramSocket ds=new DatagramSocket();
		InetAddress ip=InetAddress.getLocalHost();
		byte buf[]=null;
		{
			String inp="starting client";
			buf=inp.getBytes();
			DatagramPacket DpSend=new DatagramPacket(buf,buf.length,ip,5000);
			ds.send(DpSend);
			int i=0;
			while(true)
			{
			System.out.println("Enter 1 to stop the client");
			inp=sc.nextLine();
			if (inp.equals("1"))
                		break;
			}
			inp="ending client";
			buf=inp.getBytes();
			DpSend=new DatagramPacket(buf,buf.length,ip,5000);
			ds.send(DpSend);
		}

	}
}
