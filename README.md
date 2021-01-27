# flutter_walkthrough

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
