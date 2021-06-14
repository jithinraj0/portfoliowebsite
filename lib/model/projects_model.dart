import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/strings.dart';

class ProjectsModel {
  final String logo;
  final String name;
  final String description;
  final String image;
  final String storelink;
  final bool isplaystore;
  final List<Technology> technologylist;

  ProjectsModel({
    this.logo,
    this.name,
    this.description,
    this.image,
    this.storelink,
    this.isplaystore = false,
    this.technologylist,
  });
}

class Technology {
  final String techname;
  final String techlogo;

  Technology({this.techname, this.techlogo});
}

List projectList = [
  ProjectsModel(
      logo: Images.ecreditslogo,
      name: 'e-credits',
      description: Strings.ecreditsdescription,
      image: Images.ecreditsmockup,
      isplaystore: true,
      storelink:
          'https://play.google.com/store/apps/details?id=com.loopersgroup.ecredits',
      technologylist: [
        Technology(
          techname: 'Flutter',
          techlogo: Images.flutterlogo,
        ),
        Technology(
          techname: 'WordPress',
          techlogo: Images.wordpresslogo,
        ),
        Technology(
          techname: 'Figma',
          techlogo: Images.figmalogo,
        ),
      ]),
  ProjectsModel(
      logo: Images.onlineshoplogo,
      name: 'Online Shopping',
      description: Strings.shefindescription,
      image: Images.onlineshopmockup,
      technologylist: [
        Technology(
          techname: 'Native Android',
          techlogo: Images.androidlogo,
        ),
        Technology(
          techname: 'JSP',
          techlogo: Images.javalogo,
        ),
        Technology(
          techname: 'MySql',
          techlogo: Images.mysqllogo,
        ),
      ]),
  /* ProjectsModel(
      logo: Images.ecreditslogo,
      name: 'e-credits',
      description: Strings.ecreditsdescription,
      image: Images.ecreditsmockup,
      technologylist: [
        Technology(
          techname: 'Flutter',
          techlogo: Images.flutterlogo,
        ),
        Technology(
          techname: 'WordPress',
          techlogo: Images.wordpresslogo,
        ),
        Technology(
          techname: 'Figma',
          techlogo: Images.figmalogo,
        ),
      ]) */
];
