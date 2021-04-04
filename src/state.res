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
@bs.new external createEvent: (string, detail<'a>) => detail<'a> = "CustomEvent"
@bs.scope("window") @bs.val external dispatchEvent: (detail<'a>) => bool = "dispatchEvent"
@bs.module("uuid") external uuid: unit => string = "v4"

let update = (newState: state) => {
	createEvent("state-update", { detail: newState })
	-> dispatchEvent
	-> _ => ()
}

let updateIndex = (xs: array<'a>, index: int, x: 'a) =>
	xs
	-> Belt.Array.slice(~offset=0, ~len=index)
	-> Belt.Array.concat([x])
	-> Belt.Array.concat(Belt.Array.sliceToEnd(xs, index + 1))

let updateTodo = (list: array<todo>, index: int) =>
	list
	-> Belt.Array.get(index)
	-> Belt.Option.map(x => { ...x, finished: !x.finished })
	-> Belt.Option.map(updateIndex(list, index))

let addTodo = (state, todo: createTodo) => {
	let _todo = {
		id: uuid(),
		text: todo.text,
		finished: false,
		createdAt: Js.Date.now()
	}
	update({ ...state, list: Belt.Array.concat(state.list, [_todo]) })
}

let clearError = (state) => update({ ...state, error: None })

let init = () => update({
	error: Some(""),
	list: []
})

let removeTodo = (id, state) =>
	state.list
	-> Belt.Array.keep(x => x.id != id)
	-> x => update({ ...state, list: x })

let setError = (state, error) => update({ ...state, error: Some(error) })

let setFinished = (id: string, state) =>
	state.list
	-> Belt.Array.getIndexBy(x => x.id == id)
	-> Belt.Option.flatMap(updateTodo(state.list))
	-> Belt.Option.getWithDefault(state.list)
	-> x => update({ ...state, list: x })
