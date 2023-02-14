

## Features

This package take an string and highlight some keywords or patterns by using ReGEx to find them.
You can also click on the button to copy the code. You can edit the background color, the icon, and the style of comments, punctuations, keywords and num. If you want to add more functionnality you can contribute on Github.




## Getting started

first, import code-viewer library :

    import 'package:code_viewer/code_viewer.dart';

One Exemple :

	CodeViewer(codeToHighlight: '''//Thank you for downloading my package
    while (yourHeartBeat) {
  	spreadLove();
	}'''),

This is another exemple of uses :

    class MyApp extends StatelessWidget {
    const MyApp({super.key});
    
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: const CodeViewer(
    backgroundColor: Colors.yellow,
    clipboard: 'Hello my friend',
    numStyle: TextStyle(color: Colors.pink)),
    );
    }
    }


| parameters       | descriptions                               |
|:-----------------|:-------------------------------------------|
| codeTohighlight  | String(code) to highlight the syntax       |
| clipboard        | String when the button is hovered          |
| basicStyle       | Style of the Text with no syntax           |
| onClickFunction  | function to run when the button is clicked |
| commentStyle     | Style of the comment                       |
| stringStyle      | Style of the String                        |
| numStyle         | Style of the numerical values              |
| keywordStyle     | Style of the keywords                      |
| punctuationStyle | Style of the punctuations (, ;)            |
| icon             | Icon of the button                         |
| height           | height of the widget                       |
| width            | width of the widget                        |


## Author

My name is Kerby Elpenord and this is my first package. I'm a self-taught developer.
I want to create a multi language code-viewer but i will need contributors to do so


## Additional information

This package is open source. Therefore, you are invited to contribute on this package. If you find a problem, feel free to file an issue or make a pull request. 