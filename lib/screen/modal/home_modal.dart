class Artical {
  String? author, title, description, url, urlToImage, publishedAt, content;
  Source? source;

  Artical(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

  Artical articalJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    url = m1['url'];
    urlToImage = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];
    Source source = Source().sourceJson(m1['source']);

    Artical artical = Artical(
        urlToImage: urlToImage,
        url: url,
        publishedAt: publishedAt,
        description: description,
        content: content,
        author: author,
        title: title,
        source: source);

    return artical;
  }
}

class Source {
  String? id, name;

  Source({this.id, this.name});

  Source sourceJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    Source source = Source(name: name, id: id);
    return source;
  }
}
