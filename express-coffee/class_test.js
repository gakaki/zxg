// Generated by CoffeeScript 1.3.1
(function() {
  var CoffeePerson, Gakaki, People, felix, g, p;

  CoffeePerson = (function() {

    CoffeePerson.name = 'CoffeePerson';

    function CoffeePerson(name, age) {
      this.name = name;
      this.age = age;
      console.log('@name', this.name);
      console.log('@age', this.age);
    }

    CoffeePerson.prototype.toString = function() {
      return "name is " + this.name + " age is " + this.age + " years old";
    };

    return CoffeePerson;

  })();

  felix = new CoffeePerson("Felix Hoenikker", 63);

  console.log(felix.toString());

  People = (function() {

    People.name = 'People';

    function People(name, birth) {
      this.name = name;
      this.birth = birth;
      this.age = 2012 - this.birth;
      this.life = this.age * 10;
    }

    People.prototype.hurt = function() {
      return this.life -= Math.round(Math.random() * 100);
    };

    return People;

  })();

  p = new People('gakaki', 1984);

  p.hurt();

  Gakaki = function(name, birth) {
    var hurt, life_view;
    this.name = name;
    this.birth = birth;
    this.age = 2012 - this.birth;
    this.life = this.age * 10;
    hurt = function() {
      return this.life -= Math.round(Math.random() * 100);
    };
    life_view = function() {
      if (p.life < 0) {
        return console.log('you are dead');
      } else {
        return console.log('you are healthy , your life remains #{@life}');
      }
    };
    return 1;
  };

  g = new Gakaki('cc', 1986);

  while (true) {
    if (p.life < 0) {
      break;
    }
    g.hurt();
    g.life_view();
  }

}).call(this);
