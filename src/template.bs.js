// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";
import * as Belt_Option from "bs-platform/lib/es6/belt_Option.js";

function errorBubble(__x) {
  return Belt_Option.mapWithDefault(__x, "", (function (x) {
                return "<div class=\"error-msg\">" + x + "</div>";
              }));
}

function form(state) {
  return "\n	<form>\n		" + errorBubble(state.error) + "\n		<label class=\"form__field\">\n			<span class=\"form__field--text\">Title:</span>\n			<input class=\"form__field--input\" id=\"text\" name=\"text\" type=\"text\" />\n		</label>\n		<button id=\"add-todo\">Add Todo</button>\n	</form>\n";
}

function makeTodo(todo) {
  return "\n	<article id=\"" + todo.id + "\">" + todo.text + "</article>\n";
}

function todoList(list) {
  return "\n	<section id=\"todo-list\">\n		" + Belt_Array.joinWith(list, "\n", makeTodo) + "\n	</section>\n";
}

function template(state) {
  return "\n	" + form(state) + "\n	" + todoList(state.list) + "\n";
}

function render(html, id) {
  var tmp = document.getElementById(id);
  tmp.innerHTML = html;
  
}

export {
  render ,
  template ,
  
}
/* No side effect */
