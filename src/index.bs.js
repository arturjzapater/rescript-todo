// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as State$Todo from "./state.bs.js";
import * as Template$Todo from "./template.bs.js";

Curry._2(window.addEventListener, "load", State$Todo.init);

Curry._2(window.addEventListener, "state-update", (function ($$event) {
        var __x = Template$Todo.render(Template$Todo.template($$event.detail), "app");
        return Template$Todo.events($$event.detail, __x);
      }));

export {
  
}
/*  Not a pure module */
