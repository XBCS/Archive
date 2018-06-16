
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
	
	
	
	





















