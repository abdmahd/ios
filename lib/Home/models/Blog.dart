class Blog {
  final String title, description, image;

  Blog({this.title, this.description, this.image});
}

List<Blog> blogPosts = [
  Blog(
      image: "assets/images/Customer-Service.jpg",
      title: "Client Area",
      description:
          " The Client Area is an administrative section of the website which allows you to manage your SA Domain account. This includes viewing invoices; updating your contact details as well as managing your domains and hosting packages."),
];

class Blog2 {
  final String title, description, image;

  Blog2({this.title, this.description, this.image});
}

List<Blog> blog2Posts = [
  Blog(
    image: "assets/images/artisan1.jpeg",
    title: "Artisan Area :",
    description:
        "The Artisan Area is an administrative section of the website which allows the skilled craft worker who makes or creates material objects partly or entirely by hand to manage them SA Domain account ",
  ),
];
