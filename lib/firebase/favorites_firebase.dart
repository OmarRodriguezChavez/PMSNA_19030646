
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesFirebase{
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _favoritesCollection;

  FavoritesFirebase(){
    final _favoritesCollection = _firebase.collection('favorites');
  }
  
  Stream<QuerySnapshot> getAllFavorites(){
    
  }
}