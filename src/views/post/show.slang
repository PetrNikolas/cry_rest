h1 Show Post
p = post.title
p = post.description
p = post.content
p
  == link_to("back", "/posts", class: "btn btn-light btn-sm")
  == link_to("edit", "/posts/#{post.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/posts/#{post.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
