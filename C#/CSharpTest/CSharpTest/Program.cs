using System;
using System.Numerics;
using System.Runtime.InteropServices;

namespace CSharpTest
{
    class Program
    {

        public static string getMemory(object o) // 获取引用类型的内存地址方法  
        {  
            GCHandle h = GCHandle.Alloc(o, GCHandleType.WeakTrackResurrection);
            IntPtr addr = GCHandle.ToIntPtr(h);  
            return "0x" + addr.ToString("X");  
        }  

        static void Main(string[] args)
        {
            //Users users = new Users();
            //users.Test();
            //Program p = new Program();
            //p.GetTest();
            //Users.GetUserData();
            //Console.WriteLine("{0:e}", 1);
            //Console.WriteLine("{0:E}", 1);
            //Console.WriteLine("{0:f3}", 1);
            //string userMessage = string.Format("1000 in hex is {0:x}", 1000);
            //System.Windows.MessageBox.Show(userMessage);
            //Test.test();
            //Test.DateTimeAndTimeSpan();

            //Test.ProcessBytes();
            //Test.DeclareImplicitVars();

            //int a = 1;
            //Console.WriteLine(getMemory(a));
            ////a = 2;
            //Console.WriteLine(getMemory(a));

            Test t = new Test("123", 22);
            t.Display();

            t.personAge = 30;
            t.personNmae = "dfsfsf";
            t.Display();
            Console.WriteLine("ts = {0}", getMemory(t));
            for (int i = 0; i < 10; i++) 
            {
                Console.WriteLine("t{0} = {1}",i ,getMemory(t));
            }

            Test.SendAPersonByValue(ref t);
            t.Display();

            Console.WriteLine("te = {0}", getMemory(t));

//            int? nullableData = null;
//            int myData = nullableData ?? 100;
//
//            // 完整写法
//            Nullable<int> nInt = null;                                    
//
//            ManClass man = new ManClass();
//            ManClass.houJie = "没有";

            Console.ReadLine();
        }


        static void LocalVarDeclarations()
        {
            Console.WriteLine("=> Data Declarations:");

            //int x = 0;
            //string s = "";

            int myInt = 0;

            string myString;
            myString = "This is my character data";

            bool b1 = true, b2 = false, b3 = b1;

            System.Boolean b4 = false;

            Console.WriteLine("Your data : {0}, {1}, {2}, {3}, {4}, {5}", myInt, myString, b1, b2, b3, b4);

            Console.WriteLine();
        }
    }



    class ManClass
    {
        public string name;
        public static string houJie = "有";

        public void SettingNmae(string name)
        {
            this.name = name;
        }
    }


    // 使用this来优化构造方法
    class ThisTest
    {
        private int speed;
        private string name;

        public ThisTest() {}
        public ThisTest(int s) : this(s, "") {}
        public ThisTest(string n) : this(0, n) {}

        public ThisTest(int s, string n)
        {
            speed = s;
            if (s > 10)
            {
                speed = 10;
            }
            name = n;
        }
    }
    // 使用this及可选参数优化构造方法
    class ThisTestT
    {
        private int speed;
        private string name;

        public ThisTestT(int s = 0, string n = "Lee")
        {
            speed = s;
            if (s > 10)
            {
                speed = 10;
            }
            name = n;
        }
    }




    class Test
    {
        public string personNmae;
        public int personAge;

        public Test(string name, int age)
        {
            personNmae = name;
            personAge = age;
        }

        public Test(){}

        public static void SendAPersonByValue(ref Test p)
        {
            //p.personAge = 92;
            //p.personNmae = "ddd";
            //Console.WriteLine("ps = {0}", Program.getMemory(p));

            p = new Test("coco", 99);
            //Console.WriteLine("pe = {0}", Program.getMemory(p));

            p.Display();
        }

        public void Display()
        {
            Console.WriteLine("Name : {0}, age : {1}", personNmae, personAge);
        }

        public struct Point 
        {
            public int x;
            public int y;

            private int X
            {
                get{
                    return x;
                }
            }

            public Point(int a, int b)
            {
                x = a;
                y = b;
            }
        }

        enum EmpType
        {
            Manager,
            Grunt,
            Contractor,
            VicePresident
        }

        static void AskForBonus(EmpType e)
        {
            switch (e)
            {
                case EmpType.Manager:
                    break;
                case EmpType.Grunt:
                    break;
            }
            // 获取枚举值得类型, 例 byte.
            Enum.GetUnderlyingType(typeof(EmpType));

            // 获取枚举的字符串.
            EmpType emp = EmpType.Contractor;
            AskForBonus(emp); // ?
            emp.ToString();

            // 获取作为参数传入的任何枚举中的每一个名称/值对.
            Array enumData = Enum.GetValues(emp.GetType());
        }

        static void ThisMethodWillNotCompile()
        {
            EmpType emp = EmpType.Grunt;
            Console.WriteLine(emp);
            // 错误写法
            //emp = Manager;
        }


        // Array.Reverse(), Array.Clear();
        public static void SystemArrayFunction()
        {
            string[] gothicBands = {
                "Tones on Tail",
                "Bauhaus",
                "Sisters of Mercy"
            };

            Array.Reverse(gothicBands);

            // Clear(Array array, int index, int length);   index 从第几个, length: 清空几个.
            Array.Clear(gothicBands, 1, 2);
        }



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



        // 测试 var 
        public static void DeclareImplicitVars()
        {
            var myInt = 0;
            var myBool = true;
            var myString = "Time, marches on...";
            Console.WriteLine("myInt is a : {0}", myInt.GetType().Name);
            Console.WriteLine("myBool is a : {0}", myBool.GetType().Name);
            Console.WriteLine("myString is a : {0}", myString.GetType().Name);
        }


        public static void test()
        {
            bool b = bool.Parse("True");
            Console.WriteLine("Value of b: {0}", b);
            b = bool.Parse("false");
            Console.WriteLine("Value of b: {0}", b);

            double d = double.Parse("99.884");
            Console.WriteLine("Value of d: {0}", d);

            int i = int.Parse("8");
            Console.WriteLine("Value of i: {0}", i);

            char c = char.Parse("w");
            
            Console.WriteLine("Value of c: {0}", c);

        }

        public static void DateTimeAndTimeSpan()
        {
            DateTime dt = new DateTime(2018, 06, 18);
            Console.WriteLine("The day of {0} is {1}", dt.Date, dt.DayOfWeek);
            // 
            dt = dt.AddMonths(2);
            Console.WriteLine("Daylight savings: {0}", dt.IsDaylightSavingTime());

            TimeSpan ts = new TimeSpan(12, 39, 1);
            // 从当前 TimeSpan 减去15分钟并输出结果.
            Console.WriteLine(ts.Subtract(new TimeSpan(0, 15, 0)));
        }

        public static int Add1(int x, int y)
        {
            return x + y;
        }

        public static void ProcessBytes()
        {
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

        }
    }
}
