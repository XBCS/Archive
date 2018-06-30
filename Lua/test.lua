print(type(true))
print(type(false))
print(type(nil))
-- 测试nil是否为false
if false or nil then
	print("至少有一个是true")
else
	print("false 和 nil都为false!")
end
print("-----")
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.826262664654545e-06))

string1 = "sd"
string2 = "sdd"
-- 测试[[string]]
html = [[
	<html>
		<head>
		</head>
		<body>
			<a href="http://www.baidu.com">百度</a>
		</body>

	</html>

]]
print(html)

-- 测试 table
-- 空table
local tbl1 = {}
-- 初始化
local table2 = {"apple", "pear", "orange", "grape"}

-- table其实是一个关联数组, 数组的索引可以是数字或者是字符串.
print("table其实是一个关联数组, 数组的索引可以是数字或者是字符串.")
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
	print(k .. " : " .. v)
end

-- table的默认初始索引一般以1开始
print("-- table的默认初始索引一般以1开始")

local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
	print("Key", key)
end

-- table不会固定长度大小, 有新数据添加时table长度会自动增长, 没初始的table都是nil
print("-- table不会固定长度大小, 有新数据添加时table长度会自动增长, 没初始的table都是nil")

a3 = {}
for i=1,10 do
	a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])

print([[-- function
-- 函数被看做是"第一类值(First-Class Value)". 函数可以存在变量里:]])
-- function
-- 函数被看做是"第一类值(First-Class Value)". 函数可以存在变量里:
function factorial1(n)
	if n == 0 then
		return 1
	else
		return n * factorial1(n-1)
	end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))

-- function 可以以匿名函数的方式通过参数传递
print("-- function 可以以匿名函数的方式通过参数传递")
function testFun( tab, fun )
	for k,v in pairs(tab) do
		print(fun(k,v))
	end
end

tab={key1="val1", key2 = "val2"}

testFun(tab, function(key, val)
				return key.. " = " ..val
			 end
			 );

-- thread 线程
--[[ 最主要的线程是协同程序(coroutine), 它跟线程差不多, 拥有自己独立的栈, 局部变量和指针,
可以跟其他协同程序共享全局变量和其他大部分东西.]]

-- 赋值
print("-- 赋值")
-- a, b = 10, 2*x <--等效于--> a=10; b=2*x
--[[当变量个数和值得个数不一致时, lua会一直以变量个数为基础采取以下策略
	a. 变量个数 > 值得个数			按变量个数补足nil
	b. 变量个数 < 值得个数			多余的值会被忽略.
]]

a, b, c = 0, 1
print(a , b, c)

a, b = a+1, b+1, b+2
print(a, b)

a,b,c = 0
print(a,b,c)

-- 多值赋值经常用来交换变量, 或将函数调用返回给变量.
a, b = f()
-- f()返回两个值, 第一个赋值给a, 第二个赋值给b.
-- 应该尽可能的使用局部变量
-- 1. 避免命名冲突.
-- 2. 访问局部变量的速度比全局变量更快.

-- 索引. 也可用 .语法
-- 采用索引访问本质上是一个类似这样的函数调用 gettable_event(t, i)

-- for循环
--[[ 语法: 
		for var=exp1, exp2, exp3 do
			<执行体>
		end

		var从exp1变化到exp2, 每次变化以exp3为步长递增var, 并执行一次"执行体".
		exp3是可选的, 默认为1;
	]]

--[[运算符优先级
	
	^
	not		- (unary)
	*		/
	+		-
	..
	<		>		<=		>=		~=		==
	and
	or

	除了^和..外所有的二元运算符都是左连接的.

	a+i < b/2+1			 <-->		(a+i) < ((b/2)+1)
	5+x^2*8              <-->       5+((x^2)*8)
	a < y and y <= z     <-->       (a < y) and (y <= z)
	-x^2                 <-->       -(x^2)
	x^y^z                <-->       x^(y^z)
]]

--[[字符串
	
	1. string.gsub(mainString, findString, replaceString, num)
		num 表示替换次数
		如:
		 string.gsub("aaaaa", "a", 3);
		// zzzaa	3

	2. string.find(str, substr, [init, [end\]\])
		在一个指定的目标字符串中搜索指定的内容(第三个参数为索引), 返回其具体位置.
		如:
		string.find("Hello Lua user", "Lua", 1)
		7	9
	3. string.rep(string, n) 返回字符串的n个拷贝
		string.rep("abcd", 2)
		abcdabcd
	4. string.gmatch(str, pattern)
	  回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。
	  如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。

	  for word in string.gmatch("Hello Lua user", "%a+") do print(word) end

	  -> Hello
	  -> Lua
	  -> user



	5. string.match(str, pattern, int)
		string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。 
		在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。
		> = string.match("I have 2 questions for you.", "%d+ %a+")
		2 questions

		> = string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)"))
		2, "questions"

	字符串格式化

	Lua 提供了 string.format() 函数来生成具有特定格式的字符串, 函数的第一个参数是格式 , 之后是对应格式中每个代号的各种数据。

	由于格式字符串的存在, 使得产生的长字符串可读性大大提高了。这个函数的格式很像 C 语言中的 printf()。

	以下实例演示了如何对字符串进行格式化操作：

	格式字符串可能包含以下的转义码:

	%c - 接受一个数字, 并将其转化为ASCII码表中对应的字符
	%d, %i - 接受一个数字并将其转化为有符号的整数格式
	%o - 接受一个数字并将其转化为八进制数格式
	%u - 接受一个数字并将其转化为无符号整数格式
	%x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
	%X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
	%e - 接受一个数字并将其转化为科学记数法格式, 使用小写字母e
	%E - 接受一个数字并将其转化为科学记数法格式, 使用大写字母E
	%f - 接受一个数字并将其转化为浮点数格式
	%g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
	%q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
	%s - 接受一个字符串并按照给定的参数格式化该字符串
	为进一步细化格式, 可以在%号后添加参数. 参数将以如下的顺序读入:

	(1) 符号: 一个+号表示其后的数字转义符将让正数显示正号. 默认情况下只有负数显示符号.
	(2) 占位符: 一个0, 在后面指定了字串宽度时占位用. 不填时的默认占位符是空格.
	(3) 对齐标识: 在指定了字串宽度时, 默认为右对齐, 增加-号可以改为左对齐.
	(4) 宽度数值
	(5) 小数位数/字串裁切: 在宽度数值后增加的小数部分n, 若后接f(浮点数转义符, 如%6.3f)则设定该浮点数的小数只保留n位, 若后接s(字符串转义符, 如%5.3s)则设定该字符串只显示前n位.
	

	匹配模式
	Lua 中的匹配模式直接用常规的字符串来描述。 它用于模式匹配函数 string.find, string.gmatch, string.gsub, string.match。

	你还可以在模式串中使用字符类。

	字符类指可以匹配一个特定字符集合内任何字符的模式项。比如，字符类%d匹配任意数字。所以你可以使用模式串 '%d%d/%d%d/%d%d%d%d' 搜索 dd/mm/yyyy 格式的日期：

	s = "Deadline is 30/05/1999, firm"
	date = "%d%d/%d%d/%d%d%d%d"
	print(string.sub(s, string.find(s, date)))    --> 30/05/1999
	下面的表列出了Lua支持的所有字符类：

	单个字符(除 ^$()%.[]*+-? 外): 与该字符自身配对
	.(点): 与任何字符配对
	%a: 与任何字母配对
	%c: 与任何控制符配对(例如\n)
	%d: 与任何数字配对
	%l: 与任何小写字母配对
	%p: 与任何标点(punctuation)配对
	%s: 与空白字符配对
	%u: 与任何大写字母配对
	%w: 与任何字母/数字配对
	%x: 与任何十六进制数配对
	%z: 与任何代表0的字符配对
	%x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
	[数个字符类]: 与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
	[^数个字符类]: 与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对
	当上述的字符类用大写书写时, 表示与非此字符类的任何字符配对. 例如, %S表示与任何非空白字符配对.例如，'%A'非字母的字符:

	> print(string.gsub("hello, up-down!", "%A", "."))
	hello..up.down.    4
	数字4不是字符串结果的一部分，他是gsub返回的第二个结果，代表发生替换的次数。

	在模式匹配中有一些特殊字符，他们有特殊的意义，Lua中的特殊字符如下：

	( ) . % + - * ? [ ^ $
	'%' 用作特殊字符的转义字符，因此 '%.' 匹配点；'%%' 匹配字符 '%'。转义字符 '%'不仅可以用来转义特殊字符，还可以用于所有的非字母的字符。

	模式条目可以是：

	单个字符类匹配该类别中任意单个字符；
	单个字符类跟一个 '*'， 将匹配零或多个该类的字符。 这个条目总是匹配尽可能长的串；
	单个字符类跟一个 '+'， 将匹配一或更多个该类的字符。 这个条目总是匹配尽可能长的串；
	单个字符类跟一个 '-'， 将匹配零或更多个该类的字符。 和 '*' 不同， 这个条目总是匹配尽可能短的串；
	单个字符类跟一个 '?'， 将匹配零或一个该类的字符。 只要有可能，它会匹配一个；
	%n， 这里的 n 可以从 1 到 9； 这个条目匹配一个等于 n 号捕获物（后面有描述）的子串。
	%bxy， 这里的 x 和 y 是两个明确的字符； 这个条目匹配以 x 开始 y 结束， 且其中 x 和 y 保持 平衡 的字符串。 意思是，如果从左到右读这个字符串，对每次读到一个 x 就 +1 ，读到一个 y 就 -1， 最终结束处的那个 y 是第一个记数到 0 的 y。 举个例子，条目 %b() 可以匹配到括号平衡的表达式。
	%f[set]， 指 边境模式； 这个条目会匹配到一个位于 set 内某个字符之前的一个空串， 且这个位置的前一个字符不属于 set 。 集合 set 的含义如前面所述。 匹配出的那个空串之开始和结束点的计算就看成该处有个字符 '\0' 一样。
	模式：

	模式 指一个模式条目的序列。 在模式最前面加上符号 '^' 将锚定从字符串的开始处做匹配。 在模式最后面加上符号 '$' 将使匹配过程锚定到字符串的结尾。 如果 '^' 和 '$' 出现在其它位置，它们均没有特殊含义，只表示自身。

	捕获：

	模式可以在内部用小括号括起一个子模式； 这些子模式被称为 捕获物。 当匹配成功时，由 捕获物 匹配到的字符串中的子串被保存起来用于未来的用途。 捕获物以它们左括号的次序来编号。 例如，对于模式 "(a*(.)%w(%s*))" ， 字符串中匹配到 "a*(.)%w(%s*)" 的部分保存在第一个捕获物中 （因此是编号 1 ）； 由 "." 匹配到的字符是 2 号捕获物， 匹配到 "%s*" 的那部分是 3 号。

	作为一个特例，空的捕获 () 将捕获到当前字符串的位置（它是一个数字）。 例如，如果将模式 "()aa()" 作用到字符串 "flaaap" 上，将产生两个捕获物： 3 和 5 。
]]


