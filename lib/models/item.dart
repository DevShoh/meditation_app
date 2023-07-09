class Item{
  String name;
  String image;
  String music;
  bool isplay = false;
  Item({required this.name, required this.image, required this.music, this.isplay = false});
}
List<Item> lists = [
  Item(name: 'Forest', image: 'lib/meditation_images/forest.jpeg', music: 'forest.mp3'),
  Item(name: 'Night', image: 'lib/meditation_images/night.jpeg', music: 'night.mp3'),
  Item(name: 'Ocean', image: 'lib/meditation_images/ocean.jpeg', music: 'ocean.mp3'),
  Item(name: 'Waterfall', image: 'lib/meditation_images/waterfall.jpeg', music: 'waterfall.mp3'),
  Item(name: 'Wind', image: 'lib/meditation_images/wind.jpeg', music: 'wind.mp3'),
  Item(name: 'Beach', image: 'assets/beachbirds.jpeg', music: 'beachbirds.mp3'),
  Item(name: 'Forest', image: 'assets/birdsforest.jpeg', music: 'birdsforest.mp3'),
  Item(name: 'River', image: 'assets/frogbirdriver.jpeg', music: 'frogbirdriver.mp3'),
  Item(name: 'Ocean', image: 'assets/oceanbeach.jpeg', music: 'oceanbeach.mp3'),
  Item(name: 'Rain', image: 'assets/rain.jpeg', music: 'rain.mp3'),
  Item(name: 'Raindrop', image: 'assets/raindrop.jpeg', music: 'raindrops.mp3'),
  Item(name: 'Water', image: 'assets/waterdrip.jpeg', music: 'waterdripping.mp3'),
  Item(name: 'Wind and Cold', image: 'assets/windyandcold.jpeg', music: 'windyandcold.mp3'),


];
