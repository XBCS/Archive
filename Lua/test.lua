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


