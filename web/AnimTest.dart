library anim_test;

import 'dart:html';
import 'dart:core';
import 'dart:math' as Math;
import './Audio.dart';

part 'AssetManager.dart';
part 'Game.dart';
part 'GameEntity.dart';
part 'Point.dart';
part 'Hero.dart';
part 'Timer.dart';
part 'Animation.dart';

void main(){
  Audio audio = new Audio();
  audio.playMusic();

  CanvasElement canvas = query('#canvas');
  var ctx = canvas.context2d;


  //assetmanager für bilder
  var assetManager = new AssetManager();
  assetManager.queueDownload('img/left_sprite.gif');
  assetManager.queueDownload('img/right_sprite.gif');
  assetManager.queueDownload('img/up_sprite.gif');
  assetManager.queueDownload('img/down_sprite.gif');
  assetManager.queueDownload('img/normale_sprite.gif');
  assetManager.queueDownload('img/grass.PNG');

  var game = new Game(assetManager);

  assetManager.downloadAll(() {
    game.init(ctx);
    game.start();
  });


}