// split at Number of Words
// get every line with column-1

import java.io.IOException;
import java.net.URL;
import java.util.*;
import java.net.*;
import java.io.*;
import java.lang.*;

String solution = "";
ArrayList<String> all_letters;
ArrayList<String> used_letters;
String category_name;
Integer font_size = 150;
// PFont mono;

void setup(){
  background(0);
  size(1900, 1000);
  textSize(font_size);
  fill(255);
  // mono = createFont("NotoMono-Regular.ttf",font_size);
  // textFont(mono);
  text("WHEEL OF FORTUNE", 40, 120, width, height);
  ArrayList<String> urls = new ArrayList<String>(Arrays.asList(
    "https://wofanswers.com/around-the-house",
    "https://wofanswers.com/before-and-after",
    "https://wofanswers.com/event",
    "https://wofanswers.com/food-and-drink",
    // "https://wofanswers.com/megaword",
    "https://wofanswers.com/movie-title",
    "https://wofanswers.com/occupation",
    "https://wofanswers.com/on-the-map",
    "https://wofanswers.com/phrase",
    "https://wofanswers.com/rhyme-time"
  ));
  Collections.shuffle(urls);
  String url = urls.get(0);
  ArrayList<String> solutions = get_solutions(url);
  // for(String answer: solutions){println(answer);}
  Collections.shuffle(solutions);
  solution = solutions.get(0);
  solution = solution.replaceAll(" ", "  "); // 2x spaces for readability
  
  all_letters = new ArrayList<String>(
    Arrays.asList("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
  );
  used_letters = new ArrayList<String>();
  String[] url_pieces = split(url, '/');
  category_name = url_pieces[url_pieces.length - 1];
  category_name = category_name.replaceAll("-", " ");
  category_name = category_name.toUpperCase();
}

void draw(){
  background(#170A6F);
  String bottom_pane = category_name;
  if (keyPressed){
    if (key == 32){
      bottom_pane = used_letters.toString();
    } else {
      used_letters.add(String.valueOf(key).toUpperCase());
      used_letters = uniq(used_letters);
    }
  }
  
  String display_string = solution;
  ArrayList<String> replace_chars = all_letters;
  replace_chars.removeAll(used_letters);
  for(String c: replace_chars){
    display_string = display_string.replaceAll(c, "_");
  }
  text(display_string + "\n" + bottom_pane, 40, 40, width, height);
}

String get_webpage(String web){
  InputStream is = null;
  String line;

  try {
    URLConnection connection = new URL(web).openConnection();
    connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
    connection.connect();

    BufferedReader r  = new BufferedReader(new InputStreamReader(connection.getInputStream()));

    StringBuilder sb = new StringBuilder();
    while ((line = r.readLine()) != null) {
      sb.append(line);
    }
    return sb.toString();
  } catch (MalformedURLException mue) {
    mue.printStackTrace();
  } catch (IOException ioe) {
    ioe.printStackTrace();
  } finally {
    try {
      if (is != null) is.close();
    } catch (IOException ioe) {
      // nothing to see here
    }
  }
  return "";
}

ArrayList<String> get_solutions(String url){
  String page = get_webpage(url);
  String[] answers = page.split("<div class=\"wof-answers\">");
  ArrayList<String> answers2 = new ArrayList<String>();
  for(String answer: answers){
    answers2.add(answer.split("</div>")[0].trim());
  }
  return answers2;
}

ArrayList<String> uniq(ArrayList<String> list){
  Set<String> set = new LinkedHashSet<String>();

  // Add the elements to set
  set.addAll(list);

  // Clear the list
  list.clear();

  // add the elements of set
  // with no duplicates to the list
  list.addAll(set);

  // return the list
  return list;
}
