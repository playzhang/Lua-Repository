
--[[
一、Lua变量
	1.变量在使用前必须在代码中生命，即创建该变量
	2.编译程序执行代码之前编译器需要知道如何给语句变量开辟存储区，用于存储变量的值。
	3.Lua 变量有三种类型：全局变量、局部变量、表中的域。
	4.Lua 中的变量全是全局变量，那怕是语句块或是函数里，除非用 local 显式声明为局部变量。 
	5.局部变量的作用域为从声明位置开始到所在语句块结束。
	6.变量的默认值均为 nil。 	
]]--

--
a=5				--全局变量
local b=10		--局部变量

function jock()
c=5				--全局变量
local d=10		--局部变量
end

jock()
print(c,d)		--5 nil

do
	local e=6
	f=6
	print(e,f);
end

--[[
二、赋值语句
	2.1	赋值是改变一个变量的值和改变表域的最基本的方法
	2.2	Lua 可以对多个变量同时赋值，变量列表和值列表的各个元素用逗号分开，赋值语句右边的值会依次赋给左边的变量。
	2.3 遇到赋值语句Lua会先计算右边所有的值然后再执行赋值操作，
		当变量个数和值的个数不一致时，Lua会一直以变量个数为基础采取以下策略：
		a. 变量个数 > 值的个数             按变量个数补足nil
		b. 变量个数 < 值的个数             多余的值会被忽略
	2.4 多值赋值经常用来交换变量，或将函数调用返回给变量： 
		a, b = f()
		f()返回两个值，第一个赋给a，第二个赋给b
	2.5 应该尽可能的使用局部变量，有两个好处：
		1. 避免命名冲突。
		2. 访问局部变量的速度比全局变量更快。	
		
]]--

g="hello".."World"
print(g)
h,i=6,8
print(h,i)
h,i=i,h				--	swap 'h' for 'i'
j={"1","2"}
j[1],j[2]=j[2],j[1] --	swwap j[1] for j[2]
k, l, m,n = 0, 1
print(k,l,m,n)             --> 0   1   nil	 nil
o,p =7, 8, 9     -- value of 9 is ignored

--[[
三、索引
	对 table 的索引使用方括号 []。Lua 也提供了 . 操作。
]]--

site={}
site["key1"]="www.runoob.com"
print(site.key1)				--www.runoob.com
print(site["key1"])				--www.runoob.com

--[[
四、循环
	4.1 循环语句是由循环体及循环的终止条件两部分组成的
	4.2 while循环			:在条件为 true 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 true。
			while(condition（条件）)
			do
				statements（循环体语句）
			end
	4.3 for循环				:重复执行指定语句，重复次数可在 for 语句中控制。
			4.3.1 数值for循环:var 从 exp1 变化到 exp2，每次变化以 exp3 为步长递增 var，并执行一次 "执行体"。exp3 是可选的，如果不指定，默认为1。
				  for的三个表达式在循环开始前一次性求值，以后不再进行求值。
				for var=exp1,exp2,exp3 do
					<执行体>
				end
			4.3.2 泛型for循：通过一个迭代器函数来遍历所有值，类似 java 中的 foreach 语句
				--i是数组索引值，v是对应索引的数组元素值。ipairs是Lua提供的一个迭代器函数，用来迭代数组。
				a={one,two,three}
				for i,v in ipairs(a)
				do
					print(i,v)
				end
	4.4 repeat...until		:重复执行循环，直到 指定的条件为真时为止
			--repeat...until 循环的条件语句在当前循环结束后判断。
			repeat
				statement
			until(condition)
	4.5 嵌套循环
	4.6 break				:退出当前循环或语句，并开始脚本执行紧接着的语句。
	4.7 无线循环
]]--

--while循环
print("while循环-------------")
q=10
while(q<15)
do
print(q)
q=q+1
end

--for循环
print("for循环one-------------")
for r=5,10,2
do
print(r)
end				--5 7 9

print("for循环two-------------")
function f(x)
print("function(x)")
return x*2
end

for s=5,f(5),1
do
print(s)
end

print("for循环three-------------")
s={"sunday","Monday","TuesDay","Wednesday","Thursday","Friday","Saturday"}
for t,u in ipairs(s)
do
print(t,u)
end

print("repeat...until循环-------------")
v=5
repeat
print(v)
v=v+1
until(v==10)

--[[
五、流程控制
	5.1 控制结构的条件表达式结果可以是任何值，Lua认为false和nil为假，true和非nil为真。
	5.2 Lua中 0 为 true
	5.3 if语句：
		if(布尔表达式)
		then
			--[ 在布尔表达式为 true 时执行的语句 --]
		end
	5.4 if...else语句：
		if(布尔表达式)
		then
			--[ 布尔表达式为 true 时执行该语句块 --]
		else
			--[ 布尔表达式为 false 时执行该语句块 --]
		end
	5.5 if...elseif...else 语句：
		if(布尔表达式)
		then
			...
		elseif(布尔表达式)
		then
			...
		else
			...
		end
	5.6 if嵌套
		...
]]--

print("流程控制----------")
if(0)
then
	print("0为true")
end



