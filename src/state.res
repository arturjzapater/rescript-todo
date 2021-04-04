type createTodo = {
	text: string,
}
type todo = {
	id: string,
	text: string,
	createdAt: float
}
type state = {
	error: option<string>,
	list: array<todo>
}
type detail<'a> = {
	detail: 'a
}
@bs.new external createEvent: (string, detail<'a>) => detail<'a> = "CustomEvent"
@bs.scope("window") @bs.val external dispatchEvent: (detail<'a>) => bool = "dispatchEvent"
@bs.module("uuid") external uuid: unit => string = "v4"

let update = (newState: state) => {
	createEvent("state-update", { detail: newState })
	->dispatchEvent
	->_ => ()

	newState
}

let addTodo = (state, todo: createTodo) => {
	let _todo = {
		id: uuid(),
		text: todo.text,
		createdAt: Js.Date.now()
	}
	update({ ...state, list: Belt.Array.concat(state.list, [_todo]) })
}

let clearError = (state) => update({ ...state, error: None })

let init = () => update({
	error: Some(""),
	list: []
})

let removeTodo = (state, id) => {
	state.list
	->Belt.Array.keep(x => x.id != id)
	->x => update({ ...state, list: x })
}

let setError = (state, error) => update({ ...state, error: Some(error) })
