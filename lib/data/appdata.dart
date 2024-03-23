
import '../model/basemodel.dart';
import '../model/clothCategory.dart';

List<ClothCategories> categories = [
  ClothCategories(name: "Blazers", imgUrl: 'assets/images/categories/blazers.jpg'),
  ClothCategories(name: 'Jumpsuit', imgUrl: 'assets/images/categories/jumpsuits.jpg'),
  ClothCategories(name: "pants", imgUrl: 'assets/images/categories/pants.jpg'),
  ClothCategories(name: 'playsuits', imgUrl: 'assets/images/categories/playsuit.jpg'),
  ClothCategories(name: "Shorts", imgUrl: 'assets/images/categories/shorts.jpg'),
  ClothCategories(name: 'Skirts', imgUrl: 'assets/images/categories/skirts.jpg'),
  ClothCategories(name: "Tops", imgUrl: 'assets/images/categories/tops.jpg'),
  ClothCategories(name: 'Two Piece', imgUrl: 'assets/images/categories/two piece.jpg'),
];

List<ClothModel> showCaseList = [
  ClothModel(
      id: 1,
      imgUrl: 'assets/images/clothes/playsuit13.jpg',
      name: " Blue Play suit",
      review: 2,
      price: 3000,
      value: 1,
      star: 2),
  ClothModel(
      id: 2,
      imgUrl: 'assets/images/clothes/blazzers3.jpg',
      name: "White Blazers",
      review: 3,
      price: 4000,
      value: 1,
      star: 4),
  ClothModel(
      id: 3,
      imgUrl: 'assets/images/clothes/shirts3.jpg',
      name: "Blue Shirt",
      review: 1,
      price: 2000,
      value: 1,
      star: 2),
  ClothModel(
      id: 4,
      imgUrl: 'assets/images/clothes/jumpsuit1.jpg',
      name: "White Jump Suit",
      review: 3.4,
      price: 3500,
      value: 1,
      star: 3),
  ClothModel(
      id: 5,
      imgUrl: 'assets/images/clothes/tops6.jpg',
      name: "Red Top",
      review: 3.1,
      price: 2500,
      value: 1,
      star: 5),
];

List<ClothModel> searchList = [];