//https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more
//Console printing
class Person {//定义一个类
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {//定义类中一个方法
    print('Hello, my name is $name, I am $age years old.');
  }
}
void main() {
  var person = Person('Tom', 18);//新建对象
  print(person);//
  var sth = 'tea';
  print('I drink $sth.');//打印带变量的字符串

  //https://dart.cn/guides/libraries/library-tour#numbers
  //number:dart:core 库定义了 num ，int 以及 double 类，这些类拥有一定的工具方法来处理数字。
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //或者使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象：
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //通过添加 radix 参数，指定整数的进制基数：
  assert(int.parse('42', radix: 16) == 66);

  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型。使用 toStringAsFixed(). 指定小数点右边的位数，使用 toStringAsPrecision(): 指定字符串中的有效数字的位数。
  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);


  //https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions
  //在 Dart 中一个字符串是一个固定不变的 UTF-16 编码单元序列。语言概览中有更多关于 strings 的内容。使用正则表达式 (RegExp 对象) 可以在字符串内搜索和替换部分字符串。
  //String 定义了例如 split()， contains()， startsWith()， endsWith() 等方法。
  //在字符串中搜索
  //可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾。例如：
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  //可以获取字符串中的单个字符，将其作为字符串或者整数。确切地说，实际上获取的是单独的UTF-16编码单元; 诸如高音谱号符号 (‘\u{1D11E}’) 之类的高编号字符分别为两个编码单元。
  //也可以获取字符串中的子字符串或者将一个字符串分割为子字符串列表：
  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  //首字母大小写转换
  //可以轻松的对字符串的首字母大小写进行转换：
  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');
  //这些方法不是在所有语言上都有效的。例如，土耳其字母表的无点 I 转换是不正确的。
  //Trimming 和空字符串
  //使用 trim() 移除首尾空格。使用 isEmpty 检查一个字符串是否为空（长度为 0）。
  // Trim a string.
  assert('  hello  '.trim() == 'hello');

  // Check whether a string is empty.
  assert(''.isEmpty);

  // Strings with only white space are not empty.
  assert('  '.isNotEmpty);

  //替换部分字符串
  //字符串是不可变的对象，也就是说字符串可以创建但是不能被修改。如果仔细阅读了 String API docs, 你会注意到，没有一个方法实际的改变了字符串的状态。例如，方法 replaceAll() 返回一个新字符串，并没有改变原始字符串：
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
  //构建一个字符串
  //要以代码方式生成字符串，可以使用 StringBuffer 。在调用 toString() 之前， StringBuffer 不会生成新字符串对象。 writeAll() 的第二个参数为可选参数，用来指定分隔符，本例中使用空格作为分隔符。
  var sb = StringBuffer();
  sb
   ..write('Use a StringBuffer for ')
   ..writeAll(['efficient', 'string', 'creation'], ' ')
   ..write('.');
  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  //正则表达式
  //RegExp 类提供与 JavaScript 正则表达式相同的功能。使用正则表达式可以对字符串进行高效搜索和模式匹配。
  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  //You can work directly with the RegExp class, too. The Match class provides access to a regular expression match.

  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

  // Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
  print(match.group(0)); // 15, then 20
  }

  //https://dart.cn/guides/libraries/library-tour#collections
  //Lists
  //如语言概览中介绍，lists 可以通过字面量来创建和初始化。另外，也可以使用 List 的构造函数。 List 类还定义了若干方法，用于向列表添加或删除项目。
  // Create an empty list of strings.
var grains = <String>[];
assert(grains.isEmpty);

// Create a list using a list literal.
var fruits = ['apples', 'oranges'];

// Add to a list.
fruits.add('kiwis');

// Add multiple items to a list.
fruits.addAll(['grapes', 'bananas']);

// Get the list length.
assert(fruits.length == 5);

// Remove a single item.
var appleIndex = fruits.indexOf('apples');
fruits.removeAt(appleIndex);
assert(fruits.length == 4);

// Remove all elements from a list.
fruits.clear();
assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
var vegetables = List.filled(99, 'broccoli');
assert(vegetables.every((v) => v == 'broccoli'));


//列表是参数化类型（泛型），因此可以指定 list 应该包含的元素类型：
// This list should contain only strings.

fruits.add('apples');

  //Sets
  //在 Dart 中，set 是一个无序的，元素唯一的集合。因为一个 set 是无序的，所以无法通过下标（位置）获取 set 中的元素。
  // Create an empty set of strings.
var ingredients = <String>{};

// Add new items to it.
ingredients.addAll(['gold', 'titanium', 'xenon']);
assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
ingredients.add('gold');
assert(ingredients.length == 3);

// Remove an item from a set.
ingredients.remove('gold');
assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.

//使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中：
ingredients.addAll(['gold', 'titanium', 'xenon']);

// Check whether an item is in the set.
assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
assert(ingredients.containsAll(['titanium', 'xenon']));

//交集是另外两个 set 中的公共元素组成的 set。
ingredients.addAll(['gold', 'titanium', 'xenon']);

// Create the intersection of two sets.
var nobleGases = Set.from(['xenon', 'argon']);
var intersection = ingredients.intersection(nobleGases);
assert(intersection.length == 1);
assert(intersection.contains('xenon'));

//Maps
//map 是一个无序的 key-value （键值对）集合，就是大家熟知的 dictionary 或者 hash。 map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对象不是 map。

//声明 map 可以使用简洁的字面量语法，也可以使用传统构造函数：
// Maps often use strings as keys.
var hawaiianBeaches = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

// Maps can be built from a constructor.

// Maps are parameterized types; you can specify what
// types the key and value should be.

//通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对。

//可以从一个 map 中检索出所有的 key 或所有的 value：
var hawaiianBeachess = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

// Get all the keys as an unordered collection
// (an Iterable).
var keys = hawaiianBeaches.keys;

assert(keys.length == 3);
assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
var values = hawaiianBeaches.values;
assert(values.length == 3);
assert(values.any((v) => v.contains('Waikiki')));
//使用 containsKey() 方法检查一个 map 中是否包含某个key 。因为 map 中的 value 可能会是 null ，所有通过 key 获取 value，并通过判断 value 是否为 null 来判断 key 是否存在是不可靠的。
var hawaiianBeachesss = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

assert(hawaiianBeachesss.containsKey('Oahu'));
assert(!hawaiianBeachesss.containsKey('Florida'));

//公共集合方法
//List, Set, 和 Map 共享许多集合中的常用功能。其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现。
//使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：
var coffees = <String>[];
var teas = ['green', 'black', 'chamomile', 'earl grey'];
assert(coffees.isEmpty);
assert(teas.isNotEmpty);

//使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
var teas2 = ['green', 'black', 'chamomile', 'earl grey'];
teas.forEach((tea) => print('I drink $teas2'));

//当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：
hawaiianBeaches.forEach((k, v) {
  print('I want to visit $k and swim at $v');
  // I want to visit Oahu and swim at
  // [Waikiki, Kailua, Waimanalo], etc.
});

//Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
var teas3 = ['green', 'black', 'chamomile', 'earl grey'];

var loudTeas = teas3.map((tea) => tea.toUpperCase());
loudTeas.forEach(print);

//使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数。
var loudTeas3 = teas.map((tea) => tea.toUpperCase()).toList();

//使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件。
var teas4 = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
assert(teas4.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
assert(!teas4.every(isDecaffeinated));

print(1);//输出1就表示没有抛出异常，转换均为正确
}

