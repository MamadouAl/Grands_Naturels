void setup() {
  test();
}

void test() {
  // Constructeur et accesseurs
  GrandNaturel n1 = new GrandNaturel(102);
  assert n1.nbChiffres() == 3;
  assert n1.chiffre(0) == 2;
  assert n1.chiffre(1) == 0;
  assert n1.chiffre(2) == 1;
  // si la position n'est pas valide, le chiffre est considéré comme zéro
  assert n1.chiffre(3) == 0;
  assert n1.chiffre(-1) == 0;
  assert n1.toString().equals("102");

  GrandNaturel n2 = new GrandNaturel(n1);
  assert n1.nbChiffres() == 3;
  assert n1.chiffre(0) == 2;
  assert n1.chiffre(1) == 0;
  assert n1.chiffre(2) == 1;
  // si la position n'est pas valide, le chiffre est considéré comme zéro
  assert n1.chiffre(3) == 0;
  assert n1.chiffre(-1) == 0;

  assert n1.egal(n2) == true;

  GrandNaturel n3 = new GrandNaturel(20);
  GrandNaturel n4 = new GrandNaturel(100);
  GrandNaturel n5 = new GrandNaturel(200);
  GrandNaturel n6 = new GrandNaturel(1000);

  assert n1.sup(n3) == true;
  assert n1.sup(n4) == true;
  assert n1.inf(n5) == true;
  assert n1.inf(n6) == true;

  assert n1.plus(n6).egal(new GrandNaturel(102 + 1000));

  assert n1.mult(1000).egal(new GrandNaturel(102 * 1000));

  assert n1.mult(n6).egal(new GrandNaturel(102 * 1000));
  //println(n1.mult(n2));

  GrandNaturel n7 = new GrandNaturel(4);
  //println(n7.fact());
  GrandNaturel n15 = new GrandNaturel(15);
  GrandNaturel n16 = n15.plus(1);
  assert n15.fact().toString().equals("1307674368000");
  assert n16.fact().egal(n15.fact().mult(n16));

  println(fibo(7));
  println(fibo(6));
  assert fibo(10).toString().equals("55");
  assert fibo(100).toString().equals("354224848179261915075");

  println("constructeur et accesseurs ok");

  // À compléter avec des tests pour les autres méthodes
}

//Question 10
GrandNaturel fibo(int n) {
  GrandNaturel f0 = new GrandNaturel(1, 1);
  GrandNaturel f1 = new GrandNaturel(1);
  if (n == 0) {
    return f0;
  } else if (n == 1) {
    return f1;
  } else {
    GrandNaturel f = new GrandNaturel(f0);
    for (int i = 2; i <= n; i++) {
      f = new GrandNaturel(f0.plus(f1));
      f0 = new GrandNaturel(f1);
      f1 = new GrandNaturel(f);
    }
    return f;
  }
}
