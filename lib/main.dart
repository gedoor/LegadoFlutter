import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 此小组件是应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '阅读',
      theme: ThemeData(
        // 这是您的应用程序的主题。
        //
        // 尝试使用“flutter run”运行您的应用程序。
        // 您将看到该应用程序有一个蓝色工具栏。
        // 然后，在不退出应用的情况下，
        // 尝试将下面的primarySwatch更改为Colors.green，
        // 然后调用“热重载”（在运行“flutter run”的控制台中按“r”，
        // 或者只是将更改保存到Flutter IDE中的“热重载”）。
        // 请注意，计数器未重置为零; 应用程序未重新启动。
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter测试程序首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 此小部件是应用程序的主页。
  // 它是有状态的，这意味着它有一个 State 对象（在下面定义），
  // 其中包含影响其外观的字段。

  // 此类是状态的配置。
  // 它保存父级（在本例中为 App 小部件）提供的值（在本例中为标题），并由 State 的构建方法使用。
  // Widget 子类中的字段始终标记为“ final ”。
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  IconData bico = Icons.favorite;

  void _incrementCounter() {
    setState(() {
      // 这个对 setState 的调用告诉 Flutter 框架在这个状态下发生了什么变化，
      // 这导致它重新运行下面的构建方法，以便显示可以反映更新的值。
      // 如果我们在不调用 setState() 的情况下更改 _counter，
      // 则不会再次调用构建方法，因此似乎不会发生任何事情。
      _counter++;
      bico = bico == Icons.favorite_border ? Icons.favorite :Icons.favorite_border;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用 setState 时都会重新运行此方法，例如，由上面的_incrementCounter方法完成。
    //
    // Flutter框架已经过优化，可以快速重新运行构建方法，
    // 因此您可以只重建需要更新的任何内容，而不必单独更改小部件的实例。
    return Scaffold(
      appBar: AppBar(
        // 这里我们从 App.build 方法创建的 MyHomePage 对象中获取值，并使用它来设置我们的 appbar 标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center 是一个布局小部件。
        // 它需要一个子部件并将其定位在父部件的中间。
        child: Column(
          // Column 也是布局小部件。
          // 它需要一个子部件列表并垂直排列。
          // 默认情况下，它会自行调整大小以适应其子级，并尝试与其父级一样高。
          //
          // 调用“debug painting”
          // （在控制台中按“p”，从Android Studio中的Flutter Inspector中选择“Toggle Debug Paint”操作，
          // 或在Visual Studio Code中选择“Toggle Debug Paint”命令）
          // 以查看每个小部件的线框。
          //
          // Column 具有各种属性来控制它自身的大小以及它如何定位其子级。
          // 这里我们使用 mainAxisAlignment 来垂直居中。
          // 这里的主轴是垂直轴，因为列是垂直的（横轴是水平的）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '统计点击按钮的次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(bico),
      ), // 这个尾随逗号使构建方法的自动格式更便于阅读。
    );
  }
}
