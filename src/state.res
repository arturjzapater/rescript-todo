type todo = {
	title: string,
	description: string,
	createdAt: int
}
type state = {
	list: array<todo>
}
type detail = {
	detail: state
}
@bs.new external createEvent: (string, detail) => detail = "CreateEvent"
@bs.scope("window") @bs.val external dispatchEvent: (detail) => bool = "dispatchEvent"


let update = (newState: state) => {
	createEvent("state-update", { detail: newState })
	->dispatchEvent
	->(_x) => ()

	newState
}

let addTodo = (state, todo) => update({ ...state, list: Belt.Array.concat(state.list, [todo]) })
