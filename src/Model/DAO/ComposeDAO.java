package Model.DAO;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import com.google.gson.Gson;

public class ComposeDAO {
	private InputStream is;
	private InputStreamReader isr;
	private BufferedReader br;
	private PrintWriter pw = null;
	Socket soc;
	Gson gson = new Gson();

	@SuppressWarnings("unchecked")
	public boolean insertMess(int id_sender, String receiver, String title, String content) {
		try {
			this.soc = new Socket("localhost", 9696);
		} catch (Exception e) {
			System.out.println("Error");
		}
		try {
			is = soc.getInputStream();
			isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
			if (pw == null) {
				pw = new PrintWriter(soc.getOutputStream());
			}
		} catch (Exception e) {
			System.out.println("Error User Thread");
		}
		try {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			HashMap<String, String> pairs = new HashMap<>();
			pairs.put("command", "insert_mess");
			pairs.put("id_sender", String.valueOf(id_sender));
			pairs.put("receiver", receiver);
			pairs.put("title", title);
			pairs.put("content", content);
			pairs.put("create_at", dtf.format(now));
			String request = gson.toJson(pairs);
			request = request + "\n";
			pw.write(request);
			pw.flush();

			String strRes = br.readLine();
			HashMap<String, String> response = new HashMap<>();
			response = gson.fromJson(strRes, response.getClass());
			String status = response.get("status");
			if (status.equals("fail")) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			System.out.println("ToServer");
			return false;
		}
	}
}