
	C# 编译为 CIL, 每种支持 .NET 的编译器生成的是几乎完全相同的 CIL 指令.因此所有语言都能很好的定义明确的二级制文件间交互.


CTS公共类型系统



##### Attribute
	
	attribute : 为各种语言构造添加元数据信息的方式.
	


	----------------------------------------------------------------------------
	类的特征				|			在生命周期里的意义
	----------------------------------------------------------------------------
	类是否被"密封"			|	密封类不能作为其他类的接口.
	类实现任何接口了吗		|	接口是抽象成员的集合, 它在对象和对象的用户间提供一个契约.
	类是具体的还是抽象的	|	抽象类是不能直接创建的, 但是可以用来为派生类型定义公共的行为.
	类的可见性				|	public/internal.
	----------------------------------------------------------------------------
	
	
#####接口格式:
	
	public interface IDraw		// 一般情况下, 所有的.NET接口均以大写字母 I 开头.
	{
		void Draw();
	}
	
#####结构

	struct Point 
	{
		// 结构可包含字段
		public int xPos, yPos;
		
		// 结构可不含参数化的构造函数
		public Point(int x, int y)
		{
			xPos=x;
			yPos=y;
		}
		
		// 结构可以定义方法
		public void PrintPosition()
		{
			Console.WriteLine("({0}, {1})", xPos, yPos);  // 打印参数可以这样写.
		}
	}
	
#####枚举

	enum CharacterType
	{
		Wizard = 100,
		Fighter = 200,
		Thief = 300
	}
	
#####委托类型

	等效于类型安全的 C 风格的函数指针. .NET 委托是派生自 System.MulticastDelegate 的类, 而不是一个简单的指向原始内存地址的指针.
	
	// 这个 C# 委托类型可以指向任意带有两个整形参数且返回一个整形值得方法.
	delegate int BinaryOp(int x, int y);
	
#####类型成员
	类型成员是集合的元素之一.
					 {				
						构造函数,
						终结器,
						静态构造函数,
						嵌套类型,
						操作符,
						方法,
						属性,
						牵引器,
						字段,
						只读字段,
						常量,
						事件
					} 
					

#####C# - C++ 关键字
		
		C#	   			  		 C++
			
		byte				unsigned char
		sbyte				signed	char
		short				short
		int					int / long		
		long				__int64
		ushort				unsigned short
		uint				unsigned int / unsigned long
		ulong				unsigned __int64
		float				Float
		double				double
		object				object^
		char				wchar_t
		string				Stirng^
		decimal			Decimal
		bool				bool
		

#####mscoree.dll 工作流
	
	code  ->  编译器  ->  *.dll/*.exe程序集  ->  执行引擎mscoree.dll  ->  类加载(基础类库mscorlib.dll等也涵盖其中)  ->  Litter  ->  特定平台的指令  ->  执行成员.
	

#####程序集/命名空间/类型的关系

	命名空间是一个程序集内相关类型的一个分组. 例: System.IO 命名空间包含了有关文件 I/O 的类型, System.Data命名空间定义了基本的数据库类型等.一个程序集可以包含任意个命名空间, 每个命名空间又可以包含多种类型.
	
	//  foreach 相当于 forin.  取出本机的驱动器以及其他一些有用的细节信息
	foreach(string drive in Environment.GetLogicalDrives())
	{

	}

#####System.Environment 部分属性

	ExitCode				  	:	获取或设置应用程序中任何地方的退出代码
	Is64BitOperatingSystem	:	返回布尔值, 代表主机是否运行64位操作系统
	MachineName				:	当前机器的名字
	NewLine					:	当前环境的换行符
	SystemDirectory			:	通向系统目录的完整路径
	UserName					:	启动这个应用程序的用户的名称
	Version					:	版本对象, .NET 平台版本
	
#####System.Console类

	Beep()						:	强制控制台发出指定频率和持续时间的蜂鸣声.
	BufferHeight				:	控制台缓冲区域的高度/宽度
	BufferWidth
	Clear()					:	清除已建立的缓冲区和控制台的显示区域
	
	Console类捕获输入和输出的方法都被定义为静态的.
	
#####字符串格式字符
	
	C/c			:	用于格式化货币, 默认以当地的货币符号为前缀.
	D/d			:	格式化十进制数. 还可用于指定填充值得最小个数.
	E/e			:	用户指数计数法, 无论指数常数是大写 E 还是小写 e, 都进行转换控制.
	F/f			:	用于定点小数的格式化, 也用于指定填充值得最小个数.
	G/g			:	代表general. 用来将一个数格式化为定点或指数格式
	N/n			:	用户基本的数值格式化(带,)	
	X/x			:	用于16进制格式化.
	
	给定的占位符值以冒号为标记:
	Console.WriteLine("c format : {0:c}", 100);
	Console.WriteLine("d9 format : {0:d9}", 100);
	Console.WriteLine("f3 format : {0:f3}", 100);
	Console.WriteLine("n format : {0:n}", 100);
	
	Console.WriteLine("E format : {0:E}", 100);
	Console.WriteLine("e format : {0:e}", 100);
	格式化字符同样适用于 string.Format();
		

#####类的层次结构

	派生自 System.ValueType 的类型都会自动在栈上进行分配, 因此有一个可预测的生命周期, 而且非常高效.在继承链上没有System.ValueType的类型(如 System.Type, System.String, System,Array, System.Exception, System.Delegate)不会在栈上分配, 而是在垃圾回收堆上进行分配.
	
	方法:
	.GetHashCode();
	.Equals();
	.ToString();
	.GetType();
	.MaxValue;
	.MinValue;
	.Epsilon();
	.PositiveInfinity;
	.NegativeInfinity;
	
#####System.Char的成员
	
	使用 System.Char 的静态方法可以判定一个给定的字符是否是数字,字母,标点符号或其他.
	
	方法:
	char.IsDigit(myChar);		// 是否是数字.
	char.IsLetter(myChar);		// 是否是字母.
	char.IsWhiteSpace('a');		// 是否是空格.
	char.IsWhiteSpace("Hello There", 6);
	char.IsPunctuation('?');	// 是否是标点符号.

#####从字符串中解析数值

	.Parse("");
	
	例:
	 字符串
	 string a = "True";
	 bool b = bool.Parse(a);
	 // b = True;
	
##### System.DateTime 和 System.TimeSpan

	DateTime 类型包含了标识 (月,日,年)的数据及时间值, 可使用指定的成员以各种形式将他们格式化. TimeSpan 结构允许方便的使用各个成员定义和转换时间单位:
	
	DateTime构造函数接受 年月日.
	TimeSpan构造函数接受 时分秒.
	
#####System.String
	
	方法:
	Length;
	Compare();
	Contains();		//判定当前字符串是否包含一个指定的子字符串.
	Equals();
	Format();			
	Insert();			
	PadLeft();		// 填充字符.
	Remove();
	Replace();
	Split(); 			// 返回的 String 数组包含这个实例中由指定的Char 或String 数组的元素分割的子字符串.
	Trim();			//	从当前字符串头部和尾部移除所有出现的一组指定字符;
	ToUpper();		// 返回大写
	ToLower();
	

		
#####高效使用 string
	
	string 会间接的产生字符串数据不必要的副本, 因此使用 System.Text.StringBuilder 类型将会更加高效.
	
	uising System.Text;
	
	// 默认情况下 只能保存16个字符一下的字符串.
	StringBuilder sb = new StringBuilder("dddddd");
	
	// 通过StringBuilder("", n)来改变
	StringBuilder sb = new StringBuilder("ddddddddd", 256);
	
	// 如果追加的字符数超过规定限制, StringBuilder 对象会将它的数据复制到新的实例中, 并根据规定的限制来扩大缓冲区.
	sb.Appende("\n");
	sb.AppendLine("Half Life");
	sb.Replace("e", "Invisible War");
	
	
#####宽化/窄化


	int      	   	     Max :  2147483647,  		   Mix :  -2147483648
	uint     	  	Max :  4294967295,  		   Mix :  0
	byte           	Max :  255,    				  Mix :  0
	sbyte           	Max :  127,    				  Mix :  -128
	short           	Max :  32767,    			  Mix :  -32768
	ushort             Max :  65535,   			   Mix :  0
	long            	Max :  9223372036854775807,     Mix : -9223372036854775808
	ulong            	Max :  18446744073709551615,     Mix :  0
	float            	Max :  3.402823E+38,    	  Mix :  -3.402823E+38
	double           	 Max :  1.79769313486232E+308,     Mix : -1.79769313486232E+308
	decimal            Max :  79228162514264337593543950335,     Mix :  -792281625142643375 93543950335
	
	例:
	Static int Add(int x, int y)
	{
		Return x + y;
	}
	
	当传入函数 Add 的参数为 short, 接收为int 时会隐式宽化.
	宽化和窄化是相对的, 因为大值保存在小变量中.
	
	
#####checked 关键字
	
	  byte b1 = 100;
            byte b2 = 240;
            // 结果溢出, byte 取值范围0~256, 所以得出340-256=84; 若不作处理编译器不会报错.
            byte sum = (byte)Add(b1, b2);
            Console.WriteLine("sum = {0}\n\n\n", sum);

            // 解决方法: 使用 checked 关键字. 若发生溢出, 会得到一个运行时异常: System.OverflowException.

            //byte sum0 = checked((byte)Add(b1, b2));           
            try
            {
                byte sum1 = checked((byte)Add(b1, b2));
                Console.WriteLine("sum1 = {0}", sum);
            }
            catch (OverflowException ex)
            {
                Console.Beep();
                Console.WriteLine(ex.Message);
                Console.Beep();

            }

            // 如果想对一段代码语句进行强制溢出检测, 可使用 checked作用域
            try
            {
                checked
                {
                    byte sum2 = checked((byte)Add(b1, b2));
                    Console.WriteLine("sum2 = {0}", sum);
                }
            }
            catch (OverflowException ex)
            {
                Console.WriteLine(ex.Message);
            }

##### 设定项目级别的溢出检测

	C#编译器提供了/checked 标志. 如果启用, 所有的运算都会被检查是否溢出, 无需使用checked 关键字.
	当启用设置后, 有一段代码中的数据丢失是可接受的, 可以使用unchecked 关键字.
	
##### var - 隐式类型

	1. var 隐式类型只能用于方法或属性范围内的本地变量.
	2. var 不能定义返回值, 参数或自定义数据类型的字段数据.
	3. var 必须在声明时分配值.
	4. var 不能分配 null 作为初始值.
	5. var 分配初始值(必须是引用类型)后, 可以对其分配为 null.
	6. var 为强类型数据, 首次推断后, 后续不可赋值其他类型.

##### C# 迭代结构

	1. for 循环
	2. foreach/in 循环 相当于OC的 forin
	3. while 循环
	4. do/while 循环
	
	例:
	int[] = numbers = {0, 1 ,2 ,1 ,2 ,1 ,3 ,4 ,5};
	foreach (int a in numbers)
	{
		Console.Write("value is : {0}", a);
	}
	
	在foreach 循环中, in关键字后面的项可以是任何实现 IEnumerable 接口的类.
	
##### C# 条件结构/相等操作符

	C#中的 if/else 语句只能作用于bool 表达式, 不能作用于 -1或0 这样的值.
	
	例 :
	// 错误写法.
	if (string.Length) 
	{
	}
	// 正确写法.
	if (string.Length > 0)
	{
	}
	
	switch : 
	1. C# 要求所有情况包括default包含break 或 goto 终止的可执行语句来避免失败.
	2. 支持字符串.
	3. 支持枚举.
	
##### 方法和参数修饰符

	参数修饰符: 
	1. 如果参数没有参数修饰符标记, 则认为它将被按值传递(pass by value), 这意味着被调用的方法收到原始数据的一份副本.
	2. out : 输出参数由被调用的方法赋值, 因此它按引用传递(pass by reference), 如果被调用的方法没给输出参数赋值, 就会出现编译错误, 相当于OC的 ** ?
	3. ref : 调用者赋值, 并且可以由被调用的方法可选的重新赋值(因为数据时按引用传递的).如果被调用的方法未能给 ref 参数赋值, 也不会有编译器错误.
	4. params : 允许将一组可变数量的参数作为单独的逻辑参数进行传递, 方法只能有一个 params 修饰符, 而且必须是方法的最后一个参数.
	
	       // 测试 参数修饰符
        // 1. 默认参数的传递行为, 如果没有为参数标记修饰符, 数据的副本就会被传入函数.
        static int Add(int x, int y)
        {

            int sum = x + y;

            // 由于修改的数为副本, 所以不会更改调用者传入的字段或属性.
            x = 10;
            y = 2;

            return sum; 
        }

        // 2. out 输出参数修饰符. 若不给修饰为 out 的参数赋值, 则编译器报错. 
        // 返回值为 void!
        static void Add(int x, int y, out int sum)
        {
            sum = x + y;
        }
        // 可通过 out 在一个方法中获得多个返回值.
        static void FillTheseValues(out int a, out string b, out bool c)
        {
            a = 1;
            b = "dddd";
            c = false;
        }

        /* 3. ref 引用参数修饰符, 如果希望方法可以对在调用者作用域中声明的不同数据进行操作(通常是改变他的值), 例如排序和交换例程, 就必须使用引用参数.
         * 
         * 引用参数和输出参数的区别 :
         *  1) 输出参数不需要再阿门被传递给方法之前初始化, 因为方法在退出之前必须为输出参数赋值.
         *  2) 引用参数必须在它们被传递给方法之前初始化, 因为是在传递一个队已存在变量的引用.如果不赋初始值,就相当于要对一个未赋值的本地变量进行操作.
         */ 
         
        public static void SwapStrings(ref string s1, ref string s2)
        {
            string T = s1;
            s1 = s2;
            s2 = T;
        }

        // 4. params 修饰符. C#使用 params 关键字支持参数数组的使用.
        /*
            params 关键字可以把可变数量的同类型参数作为单个逻辑参数传给方法, 如果调用者传入强类型数组或以逗号分隔的项列表, 以 params 关键字标记的参数就可以被处理.

            为了避免歧义, C#要求方法只支持一个 params 参数, 而且必须是最后一个参数.
        */

        static double CalculateAverage(params double[] values)
        {
            double sum = 0;

            if (values.Length == 0)
            {
                return sum;
            }

            for (int i = 0; i < values.Length; i++)
            {
                sum += values[i];
            }
            return sum / values.Length;
        }

        /*
            调用示例 :
            1. 传递一个以逗号分隔的double 型数的列表
            double average;
            
            average = CalculateAverage(1.1, 1.2, 1.3, 0.0, 2112.1);
            

            2. 传递一个 double 型的数组.
            double[] data = {2.0, 1.0, 3.3};
            average = CalculateAverage(data);


        */


#####定义可选参数
	
	分配给可选参数的值必须在编译时确定.
	可选参数必须放在方法签名的最后.
	
##### 成员重载!

	当定义一组名字相同的成员时, 如果他们的参数数量或类型不同, 这样的成员叫做被重载.
	
#####数组

	Clear()		将数组元素设置为空值(值项为0, 对象引用为 null, 布尔值为 false)
	CopyTo()		
	Length
	Rank			 返回当前数组维数
	Reverse()		反转
	Sort()			?为内建类型的一维数组排序. 如果数组中的元素实现了 IComparer 接口, 我们就可以为自定义类型排序.
	

#####枚举
	
	enum EmpType
	{
		Manager,
		Grunt,
		Contractor,
		VicePresident
	}
	
	默认情况下枚举值得存储类型为 System.Int32, 更改格式如下:
	enum EmpType : byte
	{
		...
	}


	Enum.GetUnderlyingType() 返回用于保存枚举类型值得数据类型.
	
#####结构类型

	struct Point
	{
		// 结构的字段
		private int X;
		private int Y;
		
		// 属性
		public int x
		{
			get 
			{
				return X;
			}
			set
			{
				X = value;
			}
		}

		public int y
		{
			get 
			{
				return Y;
			}
			set
			{
				Y = value;
			}
		}
		
		// 方法
		
		public void Display()
		{
			Console.WriteLine("x = {0}, y = {1}", x, y);
		}
		
	}
		
	通常在在类或结构中定义公共数据是一个不好的方式. 最好使用私有数据,它可以使用公共属性来访问和改变.
	
#####创建结构变量
	
	//自定义构造函数	
	
	struct Point
	{
		// 结构的字段
		private int X;
		private int Y;
		
		Public Point(int x, int y)
		{
			X = x;
			Y = y;
		}
		
	}
	
#####值类型和引用类型

	值类型包含引用类型时, 赋值将生成一个引用的副本, 也就是浅复制, 当改变外部引用类型时值类型中包含的引用类型的值也会发生改变. 当想智行一个神复制, 需要实现 ICloneable接口.
	
	 使用 ref 修饰引用类型参数(按引用传递引用类型)注意事项:
	 1. 如果按引用传递引用类型, 被调用者可能改变对象的状态数据的值和所引用的对象.
	 2. 如果按值传递引用类型, 被调用者可能改变对象的状态数据的值, 但不能改变所引用的对象.
	 
	 
#####可空类型

	值类型永远不可以被赋值为 null.
	但可以通过可空数据类型来表示.
	定义一个可空变量类型, 应在底层数据类型中添加 ? 作为后缀, 这种语法只对 值类型 是合法的.
	
	例:
	int? myInt = null;
	bool nullableBool = null;
	char? nullableChar = 'a';
	int?[] arrayOfNullableInts = new int?[10];
	
	C#中 ?后缀语法实际上是创建一个泛型 System.Nullable<T>结构类型实例的简写.
	完全写法:
		
		Nullable<int> nullableInt = 10;
		Nullable<double> nullableDouble = 3.14;
		Nullable<bool> nullableBool = null;
		Nullable<int>[] arrayOfNullableInts = new int?[10];
	
	可以使用 ?? 操作符将获取的变量值为 null 时设置为其他数值, 如:
	int? nullableData = null;
	// int myData = nullableData; ---------> 报错
	int myData = nullableData ?? 100; -----> 正确
	
	
#####类类型

#####静态数据

	静态数据分配一次将会被类的所有实力所共享
	例 :
	class ManClass
	{
		public string name;
		public static string houJie = "有";

		public SettingNmae(string name)
		{
			this.name = name;
		}
	}
	
	ManClass man1 = new ManClass();
	ManClass man2 = new ManClass();
	ManClass man3 = new ManClass();
	ManClass man4 = new ManClass();
	
	当使用.houJie更改变量后, 所有man实例的houJie都会改变.
	ManClass.houJie = "没有";
	
	1. 一个静态类值可以定义一个静态构造函数. --- 静态构造函数不能被重载.
	2. 静态构造函数不允许访问修饰符并且不能接受任何参数.
	3. 无论创建了多少类型的对象, 静态构造函数只执行一次.
	4. 运行库创建类实例或调用者首次访问静态成员之前, 运行库会调用静态构造函数.
	5. 静态构造函数的执行先于任何实例级别的构造函数.


	如果一个类被定义为静态, 就不能使用new关键字来创建, 并且只能包含用static关键字标记的成员或字段. 只包含静态功能的类或结构通常称为工具类.
	
	
#####快速创建属性

	格式:
	public string Name {get; set;}
	public int Speed {get; set;}
			

	
	
	
	
		





