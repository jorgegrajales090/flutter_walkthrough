# Flutter Walkthrough

# Links

Flutter Showcase

https://flutter.dev/showcase

Flutter install

https://flutter.dev/docs/get-started/install

Dart

https://dart.dev/docs

Dart Online

https://dart.dev/#try-dart

# Dart

## Main program

```bash
main() {
  print("Hello, World! ");
}
```

## Variables
```bash

//Inferred
var var_name = "Jorge";

//Flexible (Not limited to a single type)
dynamic dyn_name = "Jorge";

//Explicit
String str_name = "Jorge";

main() {
  print("Hello, World! " + var_name);
}

```

## Const and final
```bash
//Final, the value could be known at runtime.
final date = new DateTime.now();

//Const, the value must be known at compile time.
const String date_const = "2021-01-30";

//Error!
const date_const1 = new DateTime.now();

```

## Functions
```bash
//Required and optional parameter
bool isNumberEven(int number, [int number1]) {
  return number % 2 == 0;
}

//With one sentence
bool isNumberEven(int number, [int number2]) => number % 2 == 0;

```
### Function call

```bash
bool isEven = isNumberEven(9);
bool isEven = isNumberEven(9, 2);
  
```

## Conditionals and switch

### Conditionals
```bash

if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}
  
```

### Switch
```bash
switch (command) {
  case 'CLOSED':
    executeClosed();
    break;
  case 'PENDING':
  case 'APPROVED':
    executeApproved();
    break;
  default:
    executeUnknown();
}
  
```

## Loops

### For

```bash
var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(i);
  }
  
  callbacks.forEach((c) => print(c));
  
```
### For through a list
```bash
var numbers = [1, 2, 3];
for (var x in numbers) {
  print(x); // 1 2 3
}
  
```

### While
```bash
while (!isDone()) {
  doSomething();
}
  
```

## Exceptions
```bash

try {
  //Throwing an exception
  throw Exception('Division by zero');
} on Exception catch (e) {
  print('Unknown exception: $e');
} finally {
  print('The end');
}
  
```
## Class
```bash
class Person
{
  //name and lastname have implicit getter and setter
  String name, lastname;
  
  //Default constructor, the class only can have one
  Person()
  {
    name = "Jorge";
    lastname = "Grajales";
  }
  
  //Named constructor
  Person.withNames(String name, String lastname)
  {
    this.name = name;
    this.lastname = lastname;
  }
}

//Creating instances
var person = new Person();
var person = new Person.withNames("Juan", "Velez");

```

### Abstract classes
```bash
abstract class Person
{
  String name, lastname;
  Person()
  {
    this.name = "Julia";
    this.lastname = "Doe";
  }
  
  Person.withNames(String name, String lastname)
  {
    this.name = name;
    this.lastname = lastname;
  }
  
  String getFullName()
  {
    return name + " " + lastname;
  }
}

//Using extends to inherit from a class
class Programmer extends Person
{
  //Using super to connect with the default constructor in base class.
  Programmer() : super();
  
  //Using super.withNames to connect with the withNames constructor in base class.
  Programmer.withNames(String name, String lastname) : super.withNames(name, lastname);    
  
  void getFullPresentation()
  {
    print("I am " + super.getFullName() + " a programmer");
  }
  
}

main() {
  //Creating the instances
  var p1 = new Programmer();
  var p2 = new Programmer.withNames("Juan", "Velez");
  
  p1.getFullPresentation();
  p2.getFullPresentation();
}

```

