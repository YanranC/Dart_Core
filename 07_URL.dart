//https://dart.cn/guides/libraries/library-tour#uris
//在使用 URI（可能你会称它为 URLs）时，Uri 类 提供对字符串的编解码操作。这些函数用来处理 URI 特有的字符，例如 ＆ 和 = 。 Uri 类还可以解析和处理 URI—host，port，scheme等组件。void main(){

void main(){
//编码和解码完整合法的URI
//使用 encodeFull() 和 decodeFull() 方法，对 URI 中除了特殊字符（例如 /， :， &， #）以外的字符进行编解码，这些方法非常适合编解码完整合法的 URI，并保留 URI 中的特殊字符。
var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeFull(uri);
assert(encoded == 'https://example.org/api?foo=some%20message');

var decoded = Uri.decodeFull(encoded);
assert(uri == decoded);
//注意上面代码只编码了 some 和 message 之间的空格。

//编码和解码 URI 组件
//使用 encodeComponent() 和 decodeComponent() 方法，对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :。
}