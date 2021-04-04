let errorBubble = Belt.Option.mapWithDefault(_, "", x => `<div class="error-msg">${x}</div>`)

let form = (state: State.state) => `
	<form>
		${errorBubble(state.error)}
		<label class="form__field">
			<span class="form__field--text">Title:</span>
			<input class="form__field--input" id="text" name="text" type="text" />
		</label>
		<button id="add-todo">Add Todo</button>
	</form>
`

let makeTodo = (todo: State.todo) => `
	<article id="${todo.id}">${todo.text}</article>
`

let todoList = (list: array<State.todo>) => `
	<section id="todo-list">
		${Belt.Array.joinWith(list, "\n", makeTodo)}
	</section>
`

let addTodo = (state: State.state) => {
	State.addTodo(
		state,
		{ text: Helpers.Dom.getElementById("text")["value"] }
	)
}

let handleClick = (state, event) => {
	event["preventDefault"]()

	switch event["target"]["id"] {
	| "add-todo" => addTodo(state)
	| _ => state
	}
}

let events = (state: State.state, id: string) => {
	Helpers.Dom.getElementById(id)["addEventListener"]("click", handleClick(state))
	()
}

let template = (state: State.state) => `
	${form(state)}
	${todoList(state.list)}
`

let render = (html: string, id: string) => {
	Helpers.Dom.getElementById(id)["innerHTML"] = html
	let body = Helpers.Dom.body
	body["innerHTML"] = body["innerHTML"]
	id
}
