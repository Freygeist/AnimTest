part of anim_test;

class Game {

  List entitiesLayer1 = [];
  List entitiesLayer2 = [];
  List entitiesLayer3 = [];
  CanvasRenderingContext2D ctx;
  Timer timer = new Timer();
  num clockTick;
  num canvasBreite;
  num canvasHoehe;
  AssetManager assetManager;

  bool showOutlines = false;

  /**
   * Konstruktor
   */
  Game(AssetManager this.assetManager);

  /**
   * Initialisierung von sämtlichen Variablen
   */
  void init(CanvasRenderingContext2D _ctx) {
    this.ctx = _ctx;
    canvasBreite = ctx.canvas.width;
    canvasHoehe = ctx.canvas.height;

    initListener();
    
    //Muss als erstes zur Entitylist hinzugefügt werden!!
    addEntity(new Hero(this, 160, 160), 2);

    print('game initialized');
  }

  /**
   * Stößt unsere Zeichenschleife an
   */
  void start() {
    print("starting game");
    window.requestAnimationFrame(loop);
  }

  /**
   * Die Zeichenschleife
   */
  void loop(num time) {
    clockTick = this.timer.tick();
    update();
    draw();
    window.requestAnimationFrame(loop);
  }

  /**
   * Initialiserung der Listener
   */
  void initListener() {
    print('Starting input');

    document.window.on.keyDown.add((e) => onKeyPushed(e), true);
    
    document.window.on.keyUp.add((e) => onKeyReleased(e), true);

    print('Input started');
  }
  
  /**
   * Wechselt die Richtung des Helden
   */
  void onKeyPushed(event){
    switch(event.keyCode) {
      case 37:
        print('left!');
        entitiesLayer2[0].changeDirectionOfEntity(1);
        break;
      case 39:
        print('right!');
        entitiesLayer2[0].changeDirectionOfEntity(2);
        break;
      case 38:
        print('up!');
        entitiesLayer2[0].changeDirectionOfEntity(3);
        break;
      case 40:
        print('down!');
        entitiesLayer2[0].changeDirectionOfEntity(4);
        break;
      default:
        print('${event.keyCode}');
        break;
    }
  }
  
  /**
   * Setzt die Bewegungsrichtung des Helden wieder zurück
   */
  void onKeyReleased(event){
    switch(event.keyCode) {
      case 37:
        print('left!');
        entitiesLayer2[0].releaseKey(1);
        break;
      case 39:
        print('right!');
        entitiesLayer2[0].releaseKey(2);
        break;
      case 38:
        print('up!');
        entitiesLayer2[0].releaseKey(3);
        break;
      case 40:
        print('down!');
        entitiesLayer2[0].releaseKey(4);
        break;
      default:
        print('${event.keyCode}');
        break;
    }
  }

  /**
   * Fügt ein Objekt der Liste an Entitäten im Spiel hinzu
   * 
   * @param entity: Das Objekt
   * 
   * @param layer: Das Layer auf welches das Objekt gezeichnet werden soll (1,2,3)
   */
  void addEntity(GameEntity entity, int layer) {
    switch(layer){
      case 1:
        entitiesLayer1.add(entity);
        break;
      case 2:
        entitiesLayer2.add(entity);
        break;
      case 3:
        entitiesLayer3.add(entity);
        break;
      default:
        print("No valid Layer!");
        break;
    }
  }

  /**
   * Zeichnet alle Objekte in der Entity-List
   */
  void draw() {
    ctx.clearRect(0, 0, this.ctx.canvas.width, this.ctx.canvas.height);
    ctx.save();
    for (final GameEntity entity in entitiesLayer1) {
      entity.draw(ctx);
    }
    for (final GameEntity entity in entitiesLayer2) {
      entity.draw(ctx);
    }
    for (final GameEntity entity in entitiesLayer3) {
      entity.draw(ctx);
    }
    drawBeforeCtxRestore();
    ctx.restore();
  }

  void drawBeforeCtxRestore() {

  }

  /**
   * Aktualisiert alle Objekte in der Entity-List
   * und schaut ob diese noch gezeichnet werden dürfen.
   * Wenn nicht werden sie aus der Liste entfernt.
   */
  void update() {
    num entitiesCount = entitiesLayer2.length;

    for (var i = 0; i < entitiesCount; i++) {
      var entity = entitiesLayer2[i];

      //Wenn die Entity noch nicht entfernt wird, werden ihre Koordinaten
      //aktualisiert
      if (!entity.removeFromWorld) {
        entity.update();
      }
    }

    //Wenn eine Entity nicht mehr benötigt wird, wird sie gelöscht
    for (var i = entitiesLayer2.length-1; i >= 0; --i) {
      if (entitiesLayer2[i].removeFromWorld) {
        //Löscht eine Entity in der Liste vom Punkt 'i' bis zum Punkt 'i+1'
        entitiesLayer2.removeRange(i, 1);
      }
    }
  }
}