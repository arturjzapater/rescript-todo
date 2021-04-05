type createTodo = {
	text: string,
}
type todo = {
	id: string,
	text: string,
	finished: bool,
	createdAt: float
}
type state = {
	error: option<string>,
	list: array<todo>
}
type detail<'a> = {
	detail: 'a
}

let addTodo: (state, createTodo) => unit
let clearError: state => unit
let init: () => unit
let removeTodo: (string, state) => unit
let setError: (state, string) => unit
let setFinished: (string, state) => unit
