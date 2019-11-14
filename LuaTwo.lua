
--[[
一、函数
]]--

print("获取最大值----------")
function max(num1,num2)
	if(num1>num2)
	then
		result=num1
	else
		result=num2
	end
		
	return result
end
print(max(10,8))

print("将函数作为参数传递给函数----------")
myprint=function(param)
	print("打印函数：",param,"##")
end

function add(num1,num2,functionPaint)
	result=num1+num2
	functionPaint(result)
end

myprint("param")
add(5,8,myprint)

print("多返回值string.find----------")
--string。find(a,b)	:返回匹配字符串的开始和结束的下标，不匹配返回nil
a,b=string.find("abcdefg","cd")
print(a,b)		--3,4

print("多返回值----------")
function fun(a)
	local mi=1
	local m=a[mi]
	for v,i in ipairs(a)
	do
		if i>m then
		mi=v
		m=i
		end
	end
	return m,mi
end
print(fun({5,8,9,6,3,2}))	

print("可变参数----------")
--函数参数列表中使用三点 ... 表示函数有可变的参数。
--{...} 表示一个由所有变长参数构成的数组
--通常在遍历变长参数的时候只需要使用 {…}
function fun1(...)
	local s=0
	for i,v in ipairs{...} do		--{...} 表示一个由所有变长参数构成的数组
		s=s+v
	end
	return s
end
print(fun1(2,3,4,5,6))	

print("可变参数赋值给一个变量。----------")
--通过 select("'#'",...) 来获取可变参数的数量:"
function fun2(...)
	local result=0
	local arg={...}		--arg为一个表
	for i , v in ipairs(arg) do
		result=result+v
	end
	print("参数长度： "..#arg .. "  个数 ")
	print("参数长度： "..select("#",...) .. " 个数 ")
	return result/#arg
end
print(fun2(2,8,5,3,15,9))	

print("固定参数加上可变参数，----------")
--固定参数必须放在变长参数之前:
function fun3(fmt,...)		--固定的参数fmt
	return io.write(string.format(fmt,...))
end
fun3("runoob\n")
fun3("%d%d\n",1,2)

print("可变参数select")
--select('#', …) 返回可变参数的长度
--select(n, …) 用于访问 n 到 select('#',…) 的参数 调用select时，必须传入一个固定实参selector(选择开关)和一系列变长参数。
--如果selector为数字n,那么select返回它的第n个可变实参，否则只能为字符串"#",这样select会返回变长参数的总数。
do
	function fun4(...)
		for i=1,select("#",...),1 do
			local arg=select(i,...)		-->读取参数
			print("arg",arg)
		end
	end
fun4(5,4,"s")	
end	



	