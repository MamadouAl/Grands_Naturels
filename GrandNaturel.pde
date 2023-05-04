class GrandNaturel {
  int[] chiffres; // chifres décimaux du moins au plus significatif

  // Crée un grand naturel égal à c
  GrandNaturel(int c) {
    // on s'assure que c est positif
  assert c > 0 : 
    "on ne représente que les nombres positifs";
    // on commence par calculer le nombre de chiffres
    int nbChiffres = 0;
    for (int c1 = c; c1 > 0; c1 /= 10) {
      nbChiffres++;
    }
    // on crée un tableau de la taille nécessaire
    chiffres = new int[nbChiffres];
    // et on le remplit
    for (int i = 0; i < nbChiffres; i++) {
      chiffres[i] = c % 10;
      c /= 10;
    }
  }

  //Question 1
  int nbChiffres() {
    return chiffres.length;
  }

  int chiffre(int pos) {
    if (pos >= 0 && pos < nbChiffres()) {
      return chiffres[pos];
    } else {
      return 0;
    }
  }

  //Question 2
  GrandNaturel(GrandNaturel n) {
    chiffres = new int[n.nbChiffres()];
    for (int i = 0; i < chiffres.length; i++) {
      chiffres[i] = n.chiffre(i);
    }
  }

  //Question 3
  String toString() {
    String s = "";
    for (int i = nbChiffres() - 1; i >= 0; i--) {
      s += chiffre(i);
    }
    return s;
  }

  //Question 4
  boolean egal(GrandNaturel n) {
    if (nbChiffres() != n.nbChiffres()) {
      return false;
    } else {
      for (int i = nbChiffres() - 1; i >= 0; i--) {
        if (chiffre(i) != n.chiffre(i)) {
          return false;
        }
      }
    }
    return true;
  }

  //Question 5
  boolean inf(GrandNaturel n) {
    if (nbChiffres() < n.nbChiffres()) {
      return true;
    } else if (nbChiffres() > n.nbChiffres()) {
      return false;
    } else {
      for (int i = nbChiffres() - 1; i >= 0; i--) {
        if (chiffre(i) < n.chiffre(i)) {
          return true;
        }
      }
    }
    return false;
  }

  boolean sup(GrandNaturel n) {
    if (nbChiffres() > n.nbChiffres()) {
      return true;
    } else if (nbChiffres() < n.nbChiffres()) {
      return false;
    } else {
      for (int i = nbChiffres() - 1; i >= 0; i--) {
        if (chiffre(i) > n.chiffre(i)) {
          return true;
        }
      }
    }
    return false;
  }

  //Question 6
  void normaliser() {
    int retenue = 0;
    // on sépare chaque chifre en dizaines et unités et on distribue
    // les dizaines vers le chiffre suivant
    for (int i = 0; i < chiffres.length; i++) {
      chiffres[i] += retenue;
      retenue = chiffres[i] / 10;
      chiffres[i] %= 10;
    }
    // s'il restre quelque chose à la fin, on l'ajoute
    if (retenue > 0) {
      GrandNaturel r = new GrandNaturel(retenue);
      chiffres = concat(chiffres, r.chiffres);
    }
  }

  GrandNaturel plus(int c) {
  assert c >= 0 : 
    "c ne peut pas être négatif"; 
    GrandNaturel resultat = new GrandNaturel(this);
    resultat.chiffres[0] += c;
    resultat.normaliser();
    return resultat;
  }

  GrandNaturel plus(GrandNaturel n) {
    GrandNaturel resultat;
    if (nbChiffres() >= n.nbChiffres()) {
      resultat = new GrandNaturel(this);
    } else {
      resultat = new GrandNaturel(n);
    }
    for (int i = 0; i < resultat.nbChiffres(); i++) {
      resultat.chiffres[i] = chiffre(i) + n.chiffre(i);
    }
    resultat.normaliser();
    return resultat;
  }

  //Question 7
  GrandNaturel mult(int c) {
  assert c >= 0 : 
    "c ne peut pas être négatif"; 
    GrandNaturel resultat = new GrandNaturel(this);
    for (int i = 0; i < resultat.nbChiffres(); i++) {
      resultat.chiffres[i] *= c;
    }
    resultat.normaliser();
    return resultat;
  }

  //Question 8
  /*Ce constructeur n'a pour fonction que de créer un grand naturel dont les chiffres sont 0 et la taille varie
    en fonction des paramètres */
  GrandNaturel(int a, int b) {
    int taille = (a-1) +(b-1) +1;
    chiffres = new int [taille];
    for (int i = 0; i < nbChiffres(); i++) {
      chiffres[i] = 0;
    }
  }

  GrandNaturel mult (GrandNaturel n) {
    GrandNaturel resultat = new GrandNaturel(nbChiffres(), n.nbChiffres()); 
    for (int i = 0; i < nbChiffres(); i++) {
      for (int j = 0; j < n.nbChiffres(); j ++) {
        resultat.chiffres[i + j] += chiffre(i) * n.chiffre(j);
      }
    }
    resultat.normaliser();
    return resultat;
  }

  //Question 9
  GrandNaturel fact() {
    GrandNaturel f = new GrandNaturel(1);
    GrandNaturel n = new GrandNaturel(1);
    while (!n.egal(this.plus(1))) {
      f = new GrandNaturel(f.mult(n));
      n = new GrandNaturel(n.plus(1));
    }
    return f;
  }
}
