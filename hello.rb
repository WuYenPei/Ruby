0709 Ruby (Day1)
在螢幕上印出
print "ab"
puts "cd"  ＃print + 換行
p "ef"     ＃印出完整的資訊
p 印出完整資訊，適合用來除錯

a = [1 ,2 ,3]
puts a    # 1  2  3
print a   # [1, 2, 3] 沒換行
p a       # [1, 2, 3] + 換行
程式撰寫風格
有很多種寫法

a = [1, 2, 3]
a = [1,2,3]

{name: 'kk', age: 18}
{name:'kk', age:18}
{ name:'kk', age:18 }

{ 
  name:'kk', 
  age:18 
}
REPL = Read-Eval-Print Loop

註解：用來解釋Why的時候再寫

變數
全域變數 $username (盡量不要使用)
區域變數 username
實體變數 @username
類別變數 @@username

邏輯短路
a && b: 前面成立才會做下一步，前面不成立不做下一步
a || b: 前面成立就不用做下一步，前面不成立會做下一步

def a
  return 1
end

def b
  return 2
end

p a && b # 2
p a || b # 1
&& vs &
&& 前面的成立才會做下一步

def a
  puts "aaa" # puts沒有回傳值
end

def b
  puts "bbb"
end

a && b  # => aaa
a & b # aaa bbb
a && b的意義
a && b 的意義接近以下：

if (a)
  b
end
puts沒有回傳值，但是p有回傳值
def a
  p "aaa"
end

def b
  p "bbb"
end


a && b  # => "aaa" "bbb"
進入irb看puts和p的差異：

2.5.2 :001 > puts "aaa"
aaa
 => nil  # 回傳的值 意思是 沒有結果

2.5.2 :002 > p "aaa"
"aaa"
 => "aaa"  #回傳它自己的東西
 
2.5.2 :004 > p nil
nil
 => nil 
2.5.2 :005 > puts nil

 => nil 
nil vs null
在Ruby裡nil也是一個物件，代表的意思是不存在
因為是物件，所以可以操作

2.5.2 :002 > nil.nil?
 => true 
不同的程式語言null有不同的定義

false 和 nil
false 和 nil是 false

def a
    nil
end

等於

def a

end

回傳值是nil

2
在Ruby裡2本身就是一段合法的語法 (expression)，所以有回傳值

2.5.2 :003 > 2
 => 2 
||
a || b 前面成立，後面就不用做

def a
  p "aaa"
end

def b
  p "bbb"
end


a || b # => "aaa"
||=
a = 1
puts a ||= 2  # => 1
如果 a 是 nil 或 false，就指定為後面的值

a = false
puts a ||= 2  # => 2
命名慣例
camelCase: firstName (Java常用)
snake_case: first_name (Ruby. Python常用)

練習題
x = 2
y = 3
請寫一段程式讓 x 與 y 對調
寫法一: 利用另一個變數暫存

x, y = [2, 3]
w = x
x = y
y = w
puts x # 3
puts y # 2
Ruby的特別寫法！

x, y = y, x # 直接交換
puts x
puts y
常數
大寫字母開頭就是常數

Pi = 3.1415

在Ruby世界，常數是可以被修改的（會發生警告，但是可以執行）

2.5.2 :001 > A = 1
 => 1 
2.5.2 :002 > A = 2
(irb):2: warning: already initialized constant A
(irb):1: warning: previous definition of A was here
 => 2 
javascript: 不能修改

var a = 1;
undefined

const b = 2;
undefined

b = 1;
VM172:1 Uncaught TypeError: Assignment to constant variable.
    at <anonymous>:1:3
變數
可以換掉集合裡的元素 （指標仍然指向同一個地方）

字串
陣列
Hash
都可以被修改
（但是數字不行修改！）

陣列


2.5.2 :003 > a = [1, 2, 3]
 => [1, 2, 3] 
2.5.2 :004 > b = a
 => [1, 2, 3] 
2.5.2 :005 > b [1] = "a"
 => "a" 
2.5.2 :006 > b
 => [1, "a", 3] 
2.5.2 :007 > a
 => [1, "a", 3] 
字串是類似連續的字元陣列

2.5.2 :020 > a = "123"
 => "123" 
2.5.2 :021 > b = a
 => "123" 
2.5.2 :022 > b[0]="x"
 => "x" 
2.5.2 :023 > b
 => "x23" 
2.5.2 :024 > a
 => "x23"
.chars method

 "ruby".chars
 => ["r", "u", "b", "y"] 
string 字串
用單引號或雙引號把字母串在一起

quote = '單引號'
double_qoute = "雙引號"
字串串接
數字+字串，ruby 會出錯（強型別語言）

2.5.2 :035 > "a" + 1
Traceback (most recent call last):
        3: from /Users/tingtinghsu/.rvm/rubies/ruby-2.5.2/bin/irb:11:in `<main>'
        2: from (irb):35
        1: from (irb):35:in `+'
TypeError (no implicit conversion of Integer into String)

2.5.2 :034 > "a" + a
Traceback (most recent call last):
        3: from /Users/tingtinghsu/.rvm/rubies/ruby-2.5.2/bin/irb:11:in `<main>'
        2: from (irb):34
        1: from (irb):34:in `+'
TypeError (no implicit conversion of Array into String)
javascript的加和減有不同轉換方式

"10" + 1
=> "101"

"10" - 1
=> 9
把字串變數帶入：

Ruby

2.5.2 :036 > name = "kk"
 => "kk" 
2.5.2 :037 > puts "Hi! My name is #{name}"
Hi! My name is kk
 => nil 
javascript

name = "kk"
=> "kk"

"my name is" + name
=> "my name is kk"


`my name is ${name}` //新型的寫法
=> "my name is kk"
邏輯控制
if
ruby

a = 1
if a = 2  # 新手常常忘記寫 a == 2
  puts "hi!"
else
  puts "hey!"
end

console

if.rb:2: warning: found = in conditional, should be ==

hi!
ruby

a = 1
if a == 2
  puts "hi!"
else
  puts "hey!"
end
console

hey!
等號
a =10 
b="10"
puts a === b  #=> false
puts a == b   #=> false
puts a = b    #=> 10
p a = b       #=> "10"
1 + 2
1 + .(2)

if modifier 倒裝句
if not x = > unless x
if x => unless not x

:Symbol
Symbol是有名字的物件（an object with name
Symbol 不是變數，而是值
一個特定Symbol只有一個Object id (存取時效能較好)
太大量的Symbol而沒有歸還記憶體時，會出現memory leak

冷知識：

數字的位置是在奇數記憶體上（公式2n+1）
nil, true, false在偶數記憶體位置上

2.5.2 :001 > nil.object_id
 => 8 
2.5.2 :002 > true.object_id
 => 20 
2.5.2 :003 > false.object_id
 => 0 
class
.class method

2.5.2 :007 > true.class
 => TrueClass 
2.5.2 :008 > false.class
 => FalseClass 
2.5.2 :009 > nil.class
 => NilClass 
method
為什麼要使用method?

可一直重複使用
讓程式碼更容易理解
在ruby所有的方法執行完後都有回傳值

參數 parameter 與 引數 argument
傳進去的是引數，規格是參數

def say_hello_to(someone) 
# someone: 參數 parameter; 規格
  puts "hi!, #{someone}"
end
同名變數會蓋掉同名方法

age = 18
def age
  return 20
end

puts "age" # => age
puts age # => 18
puts age() # => 20，呼叫方法其實是用小括號，只是平時常省略
ruby引數和參數個數要一樣
但是javascript 引數的個數和參數可以不一樣

javascript

function hello(a,b,c){
    console.log(a,b,c)
}


hello(1,2)
=> 1 2 undefined
undefined


hello(1)
=> 1 undefined undefined
undefined


hello()
=> undefined undefined undefined
undefined


hello(1,2,3,4)
=> 1 2 3
undefined
回傳值 return
回傳 = 交回控制權
控制權就像令牌一樣，手上有令牌，才能執行程式碼
執行完後，把控制權交給呼叫的程式
def calc_perimeter(radius)
  return 2 * Math::PI * radius
  # return: 把控制權交還給當初呼叫他的人
end

puts calc_perimeter(5) # => 31.41592653589793
呼叫calc_perimeter方法，並傳回5作為引數
執行calc_perimeter方法
return交還控制權，並同時回傳計算結果
把計算結果交給puts方法，並印出內容