//import 'package:flame/extensions/vector2.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'dart:core';
import 'dart:ui';
import 'dart:math';
import 'package:vector_math/vector_math.dart';
import 'package:flame/sprite.dart';

class MazeGame extends Game {
  MazeGame(this.bgRect) {
    level = RotatingLevel(Rect.fromLTWH(
      0,
      (bgRect.height-bgRect.width)/2.0,
      bgRect.width,
      bgRect.width)
    );
  }
  RotatingLevel level;
  Rect bgRect;
  @override
  void update(double t) {
    level.update(t);
  }
  @override
  void render(Canvas canvas) {
    canvas.drawRect(this.bgRect, Paint()..color=Color(0xff0b2b44));
    level.render(canvas);
  }
  @override
  void resize(Size size) {
    bgRect = Rect.fromLTWH(0, 0, size.width, size.height);
    level.rect = bgRect;
    super.resize(size);
  }
}







class RotatingLevel {
  RotatingLevel(this.rect) {
    tiles = [];
    tiles.add(Tile(Vector3(0,0,0), [Rect.fromLTWH(16, 16, 16, 16),Rect.fromLTWH(16, 48, 16, 16),Rect.fromLTWH(16, 16, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(1,0,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(2,0,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(3,0,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(4,0,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(5,0,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,0,0), [Rect.fromLTWH(0, 16, 16, 16),Rect.fromLTWH(0, 48, 16, 16),Rect.fromLTWH(0, 16, 16, 16)], "tiles.gif"));

    tiles.add(Tile(Vector3(0,1,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(0,2,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(0,3,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(0,4,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(0,5,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));

    tiles.add(Tile(Vector3(6,1,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,2,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,3,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,4,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,5,0), [Rect.fromLTWH(32, 0, 16, 16),Rect.fromLTWH(32, 32, 16, 16),Rect.fromLTWH(32, 0, 16, 16)], "tiles.gif"));

    tiles.add(Tile(Vector3(0,6,0), [Rect.fromLTWH(48, 16, 16, 16),Rect.fromLTWH(48, 48, 16, 16),Rect.fromLTWH(48, 16, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(1,6,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(2,6,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(3,6,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(4,6,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(5,6,0), [Rect.fromLTWH(16, 0, 16, 16),Rect.fromLTWH(16, 32, 16, 16),Rect.fromLTWH(16, 0, 16, 16)], "tiles.gif"));
    tiles.add(Tile(Vector3(6,6,0), [Rect.fromLTWH(32, 16, 16, 16),Rect.fromLTWH(32, 48, 16, 16),Rect.fromLTWH(32, 16, 16, 16)], "tiles.gif"));
  }

  Rect rect;
  List<Tile> tiles;
  double gridSize = 7;
  double tileScale;

  // Properties for spinning the level
  Matrix4 matrix;
  double angle = 0.0;
  double spin = 0.0;

  // Drawing for non-tile elements
  List<Vector3> mainCorners = [];
  Paint outlinePaint;

  void update(double t) {
    updateRotation(t);
    tileScale = (rect.width/16.0)/gridSize;
    for(Tile tile in tiles) {
      Vector3 v = tile.coordinates * (rect.width/gridSize);
      v.applyMatrix4(matrix);
      v.add(Vector3(rect.center.dx, rect.center.dy, 0.0));
      tile.setTransforms(angle, tileScale, v);
    }
    // Sort based on screen space
    tiles.sort((a, b) => a.screenPos.y.compareTo(b.screenPos.y));
  }

  void render(Canvas canvas) {
    for(Tile tile in tiles) {
      tile.render(canvas);
    }
  }

  void updateRotation(double t) {
    spin = 0.01;
    angle += spin;
    matrix = Matrix4.identity();
    matrix.rotateZ(angle);
    matrix.translate(-rect.center.dx, -rect.center.dx);
  }
}



class Tile {
  Vector3 coordinates;
  List<Rect> srcFrames;
  Image image;
  Paint paint = Paint()..isAntiAlias = false..filterQuality = FilterQuality.none;
  Vector3 screenPos = Vector3.zero();
  double elevation = 0;
  double scale;
  double angle;
  double numLayers = 3;
  double separation = 4;
  double tileSize = 16.0;

  Tile(this.coordinates, this.srcFrames ,String filename) {
    Flame.images.load(filename).then((img) {
      image = img;
    });
    tileSize = this.srcFrames[0].width;
  }

  void render(Canvas c) {
    if (image != null) {
      for(int i = 0; i < numLayers; i++) {
        c.save();
        c.translate(screenPos.x, screenPos.y-(separation*i*scale));
        c.scale(scale);
        c.rotate(angle);
        c.drawImageRect(image, srcFrames[i], Rect.fromLTWH(0.0, 0.0, 16, 16), paint);
        c.restore();
      }
    }
  }
  void setTransforms(double a, double s, Vector3 p) {
    scale = s;
    angle = a;
    screenPos = p;
  }
}