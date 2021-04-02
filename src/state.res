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
	error: string,
	list: array<todo>
}
type detail<'a> = {
	detail: 'a
}
@bs.new external createEvent: (string, detail<'a>) => detail<'a> = "CreateEvent"
@bs.scope("window") @bs.val external dispatchEvent: (detail<'a>) => bool = "dispatchEvent"
@bs.module("uuid") external uuid: unit => string = "v4"

let update = (newState: state) => {
	createEvent("state-update", { detail: newState })
	->dispatchEvent
	->(_x) => ()

	newState
}

let addTodo = (state, todo: createTodo) => {
	let _todo = {
		id: uuid(),
		title: todo.title,
		description: todo.description,
		createdAt: Js.Date.now()
	}
	update({ ...state, list: Belt.Array.concat(state.list, [_todo]) })
}

let clearError = (state) => update({ ...state, error: "" })

let removeTodo = (state, id) => {
	state.list
	->Belt.Array.keep(x => x.id != id)
	->x => update({ ...state, list: x })
}

let setError = (state, error) => update({ ...state, error })
