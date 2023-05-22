//如果实现了 Comparable 接口，也就是说可以将该对象与另一个对象进行比较，通常用于排序。 compareTo() 方法在 小于 时返回 < 0，在 相等 时返回 0，在 大于 时返回 > 0。
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}
void main() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}