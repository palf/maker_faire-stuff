package palf.triumph;

import android.app.Activity;
import android.os.Bundle;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

import com.github.kevinsawicki.http.HttpRequest;
import android.widget.TextView;
import android.util.Log;

public class AppEntry extends Activity
{
    /** Called when the activity is first created. */
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.main);

    String xbmcURL = "http://192.168.56.1:8081/jsonrpc";

    JSONObject item = new JSONObject();
    try {
      item.put("file", "plugin://plugin.video.youtube/?action=play_video&videoid=lsBigDzg3F8");
    } catch (JSONException e) {
      e.printStackTrace();
    }

    JSONObject params = new JSONObject();
    try {
      params.put("item", item);
    } catch (JSONException e) {
      e.printStackTrace();
    }

    JSONObject object = new JSONObject();
    try {
      object.put("id", new Integer(1));
      object.put("jsonrpc", "2.0");
      object.put("method", "Player.Open");
      object.put("params", params);
    } catch (JSONException e) {
      e.printStackTrace();
    }

    String  message = object.toString();
    Log.v("PALF", message);

    int thing = HttpRequest.post(xbmcURL)
      .contentType("application/json")
      .send(message)
      .code();
    String code = Integer.toString(thing);

    Log.v("PALF", code);

    TextView textView = new TextView(this);
    textView.setText("Still Alive...");

    setContentView(textView);
  }


}
