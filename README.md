[Rials 기본라우팅](Rails routing 리소스기반으로 라우팅하기)

```ruby
#roubts.rb
#idnex
get 'posts/new'=>'posts#new'
post 'posts'=>'posts#create'
#CRUD - R
get 'posts/:id'=>'posts#show'

#CRUD - U
get 'posts/:id/edit'=>'posts#edit'
put 'posts/:id/'=>'posts#update'

#CRUD - D
delete 'posts/:id'=>'posts#destroy'
```

```ruby
resources:post
```


* Rest API를 구성하는 기본원칙
  1.URL은 정보의 자원을 표현한다.
  2.자원에 대한 행위는 HTTP method(Verb)로 표현한다.

####form 에서 post요청보내기
```erb
//new .html.erb
<form action ='/posts' method="post">
    ..
    <input type="hidden" name="authenticity_token"
    value="<%=form_authenticity_token%>">
    ..
 </form>
 ```
 ```ruby
 #app/controller/
 ```
 * form 
