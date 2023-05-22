import 'dart:math';//引入数学库函数
void main(){
  // Cosine
  assert(cos(pi) == -1.0);

  // Sine-三角函数
  //Math 库提供基本的三角函数：
  //https://dart.cn/guides/libraries/library-tour#trigonometry
  var degrees = 30;
  var radians = degrees * (pi / 180);
  // radians is now 0.52359.
  var sinOf30degrees = sin(radians);
  // sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);

  //最大值和最小值
  //https://dart.cn/guides/libraries/library-tour#maximum-and-minimum
  //Math 库提供 max() 和 min() 方法：
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  //数学常数
  //https://dart.cn/guides/libraries/library-tour#math-constants
  //在 Math 库中可以找到你需要的数学常数，例如，pi， e 等等：
  // See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

  //随机数
  //https://dart.cn/guides/libraries/library-tour#random-numbers
  //使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数。
  var random = Random();
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9.

  //也可以产生随机布尔值序列：
  var random2 = Random();
  random2.nextBool(); // true or false
}