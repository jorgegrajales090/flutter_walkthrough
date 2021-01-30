class Fibonacci
{
  int f0, f1;
  List numbers = [];

  Fibonacci(this.f0, this.f1)
  {
    this.fillNumbers();
  }

  void fillNumbers()
  {
    int tempF0 = f0;
    int tempF1 = f1;

    for(int i = 0; i < 10; i++)
    {
      int fn = tempF0 + tempF1;
      numbers.add(fn);

      tempF0 = tempF1;
      tempF1 = fn;
    }
  }

  String printNumbers()
  {
    return f0.toString() + "," + f1.toString() + "," + numbers.join(",");
  }
}