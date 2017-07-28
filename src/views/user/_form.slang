- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error

- action = (user.id ? "/users/" + user.id.to_s : "/users")
form action="#{ action }" method="post"
  == csrf_tag
  - if user.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="email" placeholder="Email" value="#{ user.email }"
  div.form-group
    input.form-control type="password" name="password" placeholder="password"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/users" back
