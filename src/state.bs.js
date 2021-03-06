// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Uuid from "uuid";
import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";
import * as Belt_Option from "bs-platform/lib/es6/belt_Option.js";

function update(newState) {
  window.dispatchEvent(new CustomEvent("state-update", {
            detail: newState
          }));
  
}

function addTodo(state, todo) {
  var _todo_id = Uuid.v4();
  var _todo_text = todo.text;
  var _todo_createdAt = Date.now();
  var _todo = {
    id: _todo_id,
    text: _todo_text,
    finished: false,
    createdAt: _todo_createdAt
  };
  return update({
              error: undefined,
              list: Belt_Array.concat(state.list, [_todo])
            });
}

function clearError(state) {
  return update({
              error: undefined,
              list: state.list
            });
}

function init(param) {
  return update({
              error: undefined,
              list: []
            });
}

function removeTodo(id, state) {
  var x = Belt_Array.keep(state.list, (function (x) {
          return x.id !== id;
        }));
  return update({
              error: state.error,
              list: x
            });
}

function setError(state, error) {
  return update({
              error: error,
              list: state.list
            });
}

function setFinished(id, state) {
  var partial_arg = state.list;
  var x = Belt_Option.getWithDefault(Belt_Option.flatMap(Belt_Array.getIndexBy(state.list, (function (x) {
                  return x.id === id;
                })), (function (param) {
              return Belt_Option.map(Belt_Option.map(Belt_Array.get(partial_arg, param), (function (x) {
                                return {
                                        id: x.id,
                                        text: x.text,
                                        finished: !x.finished,
                                        createdAt: x.createdAt
                                      };
                              })), (function (param$1) {
                            return Belt_Array.concat(Belt_Array.concat(Belt_Array.slice(partial_arg, 0, param), [param$1]), Belt_Array.sliceToEnd(partial_arg, param + 1 | 0));
                          }));
            })), state.list);
  return update({
              error: state.error,
              list: x
            });
}

export {
  addTodo ,
  clearError ,
  init ,
  removeTodo ,
  setError ,
  setFinished ,
  
}
/* uuid Not a pure module */
