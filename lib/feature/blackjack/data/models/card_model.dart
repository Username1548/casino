class CardBj {
  final String name;
  final int value;
  final String imagePath;

  const CardBj(this.name, this.value, this.imagePath);

  factory CardBj.fromString(String str){
    int len = str.length;
    String suit = str.substring(len - 1);
    String nominal =  str.substring(0, len - 1);
    int amount = 10;
    if (['J', 'Q', 'K', 'A'].contains(nominal)){
      if (nominal == 'A'){
         amount = 11;
      }
    }else{
      amount = int.parse(nominal);
    }
    String path = 'assets/images/cards/standard/$nominal$suit.png';
    return CardBj(str, amount, path);
  }
}
