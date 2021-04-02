// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";

function makeTodo(todo) {
  return "\n	<article id=\"" + todo.id + "\">" + todo.title + "</article>\n";
}

function template(state) {
  var list = state.list;
  return "\n	<section id=\"todo-list\">\n		" + Belt_Array.joinWith(list, "\n", makeTodo) + "\n	</section>\n";
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