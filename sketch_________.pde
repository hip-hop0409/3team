class Character {
  float x, y;

  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {}

  void drawWeapon() {}
}

class Warrior extends Character {
  Warrior(float x, float y) {
    super(x, y);
  }

  void display() {
    float z = 12.5;
    fill(200, 200, 0);
    stroke(0);
    strokeWeight(1);
    circle(x, y, z * 4); // 얼굴
    quad(x - z * 4, y - z * 3, x - z * 3, y - z * 2, x - z * 2, y, x - z * 4, y - z * 3); // 왼쪽 날개1
    quad(x - z * 4, y + z * 3, x - z * 3, y + z * 2, x - z * 2, y, x - z * 4, y + z * 3); // 왼쪽 날개2
    quad(x + z * 4, y - z * 3, x + z * 3, y - z * 2, x + z * 2, y, x + z * 4, y - z * 3); // 오른쪽 날개1
    quad(x + z * 4, y + z * 3, x + z * 3, y + z * 2, x + z * 2, y, x + z * 4, y + z * 3); // 오른쪽 날개2
    fill(200, 200, 200);
    arc(x, y + z, z, z / 2, 0, PI); // 입
    fill(200, 0, 0);
    quad(x - z * 3 / 2, y - z / 2, x - z / 2, y, x - z * 6 / 5, y, x - z * 3 / 2, y - z / 2); // 왼쪽 눈
    quad(x + z * 3 / 2, y - z / 2, x + z / 2, y, x + z * 6 / 5, y, x + z * 3 / 2, y - z / 2); // 오른쪽 눈
    fill(200);
    new Sword().dis();
  }

  class Sword {
    void dis() {
      stroke(139, 69, 19);
      strokeWeight(12);
      line(x + 20, y, x + 20, y - 25);
      stroke(100);
      line(x + 10, y - 25, x + 30, y - 25);
      stroke(180);
      strokeWeight(1);
      beginShape();
      vertex(x + 20, y - 25);
      vertex(x + 10, y - 70);
      vertex(x + 20, y - 90);
      vertex(x + 30, y - 70);
      endShape(CLOSE);
    }
  }
  }


class Archer extends Character {
  float arrowX, arrowY; 
  boolean isShooting = false; 

  Archer(float x, float y) {
    super(x, y);
    arrowX = x; 
    arrowY = y;
  }

  void display() {
    float d = 25;
    stroke(0, 0, 0);
    strokeWeight(d / 20);
    fill(242, 159, 5);
    circle(x - d / 2, y - d * 4 / 5, d / 2); // 왼쪽 귀
    circle(x + d / 2, y - d * 4 / 5, d / 2); // 오른쪽 귀
    ellipse(x, y, 2.1 * d, 2 * d); // 얼굴
    noStroke();
    fill(255, 255, 255);
    circle(x - 14 * d / 100, 26 * d / 100 + y, d * 3 / 10); // 왼쪽 인중
    circle(x + 14 * d / 100, 26 * d / 100 + y, d * 3 / 10); // 오른쪽 인중
    strokeWeight(d * 3 / 50);
    stroke(0, 0, 0);
    fill(242, 159, 5);
    line(x - 58 * d / 100, y - 35 * d / 100, x - 22 * d / 100, y - 35 * d / 100); // 왼쪽 눈썹
    line(58 * d / 100 + x, y - 35 * d / 100, 22 * d / 100 + x, y - 35 * d / 100); // 오른쪽쪽 눈썹
    fill(0, 0, 0);
    circle(x - 40 * d / 100, y - 11 * d / 100, 8 * d / 100); // 왼쪽 눈
    circle(x + 40 * d / 100, y - 11 * d / 100, 8 * d / 100); // 오른쪽 눈
    circle(x, 15 * d / 100 + y, 7 * d / 100); // 코
    fill(252, 98, 111);
    noStroke();
    ellipse(x - 55 * d / 100, 17 * d / 100 + y, 27 * d / 100, 12 * d / 100); // 왼쪽 볼
    ellipse(55 * d / 100 + x, 17 * d / 100 + y, 27 * d / 100, 12 * d / 100); // 오른쪽 볼
    new Arch().dis();
  }

  class Arch {
    void dis() {
    x += 20;
    stroke(139, 69, 19);
    strokeWeight(6);
    noFill();
    arc(x - 42, y, 60, 120, PI - QUARTER_PI, PI + QUARTER_PI);
    stroke(0);
    strokeWeight(2);
    line(x - 60, y - 43, x - 60, y + 43);
    stroke(0);
    strokeWeight(3);
    line(x - 80, y, x - 50, y);
    fill(255, 0, 0);
    triangle(x - 80, y - 5, x - 80, y + 5, x - 90, y);
    x -= 20;
  }}

  void shootArrow() {
    if (!isShooting) {
      isShooting = true;
      arrowX = x - 70;
      arrowY = y;
    }
  }

  void updateArrow() {
    if (isShooting) {
      stroke(0);
      strokeWeight(3);
      line(arrowX + 10, arrowY, arrowX - 20, arrowY);
      fill(255, 0, 0);
      triangle(arrowX - 20, arrowY - 5, arrowX - 20, arrowY + 5, arrowX - 30, arrowY);
      arrowX -= 10;
      if (arrowX < 0) {
        isShooting = false;
      }
    }
  }
}

class Mage extends Character {
  float fireX, fireY;
  boolean isShooting = false; 

  Mage(float x, float y) {
    super(x, y);
    fireX = x + 28;
    fireY = y - 25;
  }

  void display() {
    float d = 2.5;
    fill(255);
    strokeWeight(1);
    stroke(0);
    circle(x, y, d * 20); 
    circle(x - d * 4, y - 4 * d, d * 4);
    circle(x + d * 4, y - 4 * d, d * 4);
    arc(x - d * 4, y - 6 * d, d * 4, d * 2, PI, 2 * PI); 
    arc(x + d * 4, y - 6 * d, d * 4, d * 2, PI, 2 * PI); 
    arc(x, y + d, d * 3, d, 0.5 * PI, 1.5 * PI); 
    fill(255, 0, 0);
    arc(x, y + d * 4, d * 6, d * 2, 0, PI);
    drawWeapon();
    new Magic().dis();
  }

  class Magic {
    void dis() {
    pushMatrix();
    translate(x + 28, y - 25);
    rotate(radians(35));
    scale(0.58);
    stroke(150);
    strokeWeight(8);
    line(30, 0, 30, 60);
    fill(0, 0, 255);
    noStroke();
    ellipse(30, -10, 15, 15);
    fill(173, 216, 230, 100);
    ellipse(30, -10, 30, 30);
    popMatrix();
  }}

  void shootFire() {
    if (!isShooting) {
      isShooting = true;
      fireX = x + 30;
      fireY = y - 15;
    }
  }

  void updateFire() {
    if (isShooting) {
      fill(255, 69, 0);
      noStroke();
      ellipse(fireX, fireY, 15, 15); 
      fireX += 10; 
      if (fireX > width) {
        isShooting = false;
      }
    }
  }
}

Character[] characters;

void setup() {
  size(800, 400);
  characters = new Character[3];
  characters[0] = new Warrior(150, 150);
  characters[1] = new Archer(650, 200);
  characters[2] = new Mage(150, 250);
}

void draw() {
  background(255);
  for (int i = 0; i < characters.length; i++) {
    Character c = characters[i];
    c.display();
 }
  ((Mage) characters[2]).updateFire();
  ((Archer) characters[1]).updateArrow();
  if (frameCount % 80 == 0) {
    ((Archer) characters[1]).shootArrow();
  }
}

void keyPressed() {
  if (key == ' ') {
    ((Mage) characters[2]).shootFire();
  }
}
