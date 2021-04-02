type element = {
	@bs.set "innerHTML": string
}
@bs.scope("document") @bs.val external getElementById: (string) => element = "getElementById"

let errorBubble = Belt.Option.mapWithDefault(_, "", x => `<div class="error-msg">${x}</div>`)

let form = (state: State.state) => `
	<form>
		${errorBubble(state.error)}
		<label>
			<span>Title:</span>
			<input id="title" name="title" type="text" />
		</label>
		<label>
			<span>Description:</span>
			<input id="description" name="description" type="text" />
		</label>
		<button id="add-todo">Add Todo</button>
	</form>
`

let makeTodo = (todo: State.todo) => `
	<article id="${todo.id}">${todo.title}</article>
`

let todoList = (list: array<State.todo>) => `
	<section id="todo-list">
		${Belt.Array.joinWith(list, "\n", makeTodo)}
	</section>
`

let template = (state: State.state) => `
	${form(state)}
	${todoList(state.list)}
`

let render = (html: string, id: string) => getElementById(id)["innerHTML"] = html
