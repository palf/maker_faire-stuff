package palf.connect;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import com.github.kevinsawicki.http.HttpRequest;
import android.util.Log;
import java.net.URLEncoder;


public class AppEntry extends Activity {

	@Override
	public void onCreate (Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		Intent intent = getIntent();

		String message = "";
		String playlisturl = "";
		String encodedurl = "";

		try {
			playlisturl = intent.getStringExtra("playlisturl");
			message = playlisturl;
			encodedurl = URLEncoder.encode(playlisturl,"UTF-8");
		} catch (Exception e) {
			message = "no data sent with intent (or an exception occurred!)";
		}

		String xbmcURL = "http://192.168.1.74:3000/iplayer?action=play&playlisturl=" + encodedurl;
    int response = HttpRequest.get(xbmcURL).code();
    String code = Integer.toString(response);

		TextView textView = new TextView(this);
		textView.setText(message);

		setContentView(textView);
	}
}
