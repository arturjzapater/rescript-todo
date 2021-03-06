// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";
import * as State$Todo from "./state.bs.js";
import * as Belt_Option from "bs-platform/lib/es6/belt_Option.js";

function _errorBubble(x) {
  return "\n	<span class=\"error__text\">" + x + "</span>\n	<button class=\"list__button\" id=\"close-error\">X</button>\n";
}

function form(state) {
  return "\n	<div class=\"error-container " + (
          Belt_Option.isSome(state.error) ? "error" : ""
        ) + "\">\n		" + Belt_Option.mapWithDefault(state.error, "", _errorBubble) + "\n	</div>\n	<form class=\"container form\">\n		<label class=\"form__field\">\n			<span class=\"form__field--text\">Don't</span>\n			<input class=\"form__field--input\" id=\"text\" name=\"text\" type=\"text\" />\n		</label>\n		<button class=\"form__button\" id=\"add-todo\">Add Todon't</button>\n	</form>\n";
}

function makeTodo(todo) {
  return "\n	<article class=\"list__item\">\n		<span class=\"list__text " + (
          todo.finished ? "done" : ""
        ) + "\" id=\"todo-" + todo.id + "\">" + todo.text + "</span>\n		<button class=\"list__button\" id=\"remove-" + todo.id + "\">X</button>\n	</article>\n";
}

function todoList(list) {
  return "\n	<section class=\"container list\" id=\"todo-list\">\n		" + Belt_Array.joinWith(list, "\n", makeTodo) + "\n	</section>\n";
}

function events(state, id) {
  return document.getElementById(id).addEventListener("click", (function (param) {
                param.preventDefault();
                var x = param.target.id;
                switch (x) {
                  case "add-todo" :
                      var text = document.getElementById("text").value;
                      if (text === "") {
                        return State$Todo.setError(state, "You must add a description");
                      } else {
                        return State$Todo.addTodo(state, {
                                    text: text
                                  });
                      }
                  case "close-error" :
                      return State$Todo.clearError(state);
                  default:
                    if (x.startsWith("todo")) {
                      return State$Todo.setFinished(x.replace("todo-", ""), state);
                    } else if (x.startsWith("remove")) {
                      return State$Todo.removeTodo(x.replace("remove-", ""), state);
                    } else {
                      return ;
                    }
                }
              }));
}

function template(state) {
  return "\n	" + form(state) + "\n	" + todoList(state.list) + "\n";
}

function render(html, id) {
  var tmp = document.getElementById(id);
  tmp.innerHTML = html;
  var body = document.body;
  body.innerHTML = body.innerHTML;
  return id;
}

export {
  events ,
  render ,
  template ,
  
}
/* State-Todo Not a pure module */
