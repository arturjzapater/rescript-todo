@genType.import("./state")
type createTodo
type state

let addTodo: (state, createTodo) => state
let clearError: state => state
let removeTodo: (state, string) => state
let setError: (state, string) => state