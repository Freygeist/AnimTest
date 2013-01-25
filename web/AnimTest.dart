library bad_aliens;

import 'dart:html';
import 'dart:math' as Math;

part 'AssetManager.dart';


void main(){
  CanvasElement canvas = query('#canvas');
  var ctx = canvas.context2d;


  //assetmanager für bilder
  var assetManager = new AssetManager();
  assetManager.queueDownload('img/left_sprite.png');


  //aufbauen einer neuen gameEntity
  //initalisieren des spiels
  //starten des spiel loops


}
