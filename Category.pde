class Category{
  Category(){
  }
  
  String[] rand(){ 
    String[][] categories = {  
      {"Around the House","https://wheeloffortuneanswer.com/around-the-house/"},
      {"Before and After","https://wheeloffortuneanswer.com/before-and-after/"},
      {"Event","https://wheeloffortuneanswer.com/event/"},
      {"Fictional Character","https://wheeloffortuneanswer.com/fictional-character/"},
      {"Food and Drink","https://wheeloffortuneanswer.com/food-and-drink/"},
      {"Fun and Games","https://wheeloffortuneanswer.com/fun-and-games/"},
      {"In the Kitchen","https://wheeloffortuneanswer.com/in-the-kitchen/"},
      {"Landmark","https://wheeloffortuneanswer.com/landmark/"},
      {"Living Thing","https://wheeloffortuneanswer.com/living-thing/"},
      {"Megaword","https://wheeloffortuneanswer.com/megaword/"},
      {"Movie Title","https://wheeloffortuneanswer.com/movie-title/"},
      {"Occupation","https://wheeloffortuneanswer.com/occupation/"},
      {"On the Map","https://wheeloffortuneanswer.com/on-the-map/"},
      {"Place","https://wheeloffortuneanswer.com/place/"},
      {"Rhyme Time","https://wheeloffortuneanswer.com/rhyme-time/"},
      {"Same Letter","https://wheeloffortuneanswer.com/same-letter/"},
      {"Title/Author","https://wheeloffortuneanswer.com/title-and-author/"},
      {"Title","https://wheeloffortuneanswer.com/title/"},
      {"What Are You Doing","https://wheeloffortuneanswer.com/what-are-you-doing/"},
      {"What Are You Wearing","https://wheeloffortuneanswer.com/what-are-you-wearing/"},
      {"Where Are We Going","https://wheeloffortuneanswer.com/where-are-we-going/"}
    };
    return categories[int(random(categories.length))];
  }
}
