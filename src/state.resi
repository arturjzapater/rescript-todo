type createTodo = {
	title: string,
	description: string
}
type todo = {
	id: string,
	title: string,
	description: string,
	createdAt: float
}
type state = {
	error: option<string>,
	list: array<todo>
}
type detail<'a> = {
	detail: 'a
}

let addTodo: (state, createTodo) => state
let clearError: state => state
let init: () => state
let removeTodo: (state, string) => state
let setError: (state, string) => state