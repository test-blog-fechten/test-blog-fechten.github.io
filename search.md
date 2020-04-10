---
layout: search
---
<form action="index.html" method="get">
  <label for="search-box">Suche im Blog:</label>
  <input type="text" id="search-box" name="query">
  <input type="submit" value="search">
</form>

<ul id="search-results"></ul>

<script>
  window.store = {
    {% for post in site.posts %}
      "{{ post.url | slugify }}": {
        "title": "{{ post.title | xml_escape }}",
        "author": "{{ post.author | xml_escape }}",
        "category": "{{ post.category | xml_escape }}",
        "content": {{ post.content | strip_html | strip_newlines | jsonify }},
        "url": "{{ site.baseurl }}{{ post.url | xml_escape }}"
      }
      {% unless forloop.last %},{% endunless %}
    {% endfor %}
  };
</script>

<script src="{{ site.baseurl }}/js/lunr.min.js"></script>
<script src="{{ site.baseurl }}/js/search.js"></script>

<p>

<form method="get" action="http://www.google.com/search" target="_blank">
<input type="hidden" name="sitesearch" value="blog.fechten-hamm.de" />
<input type="text" name="q" maxlength="255" placeholder="Search with Google" />
</form>
