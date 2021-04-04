let errorBubble = Belt.Option.mapWithDefault(_, "", x => `<div class="error-msg">${x}</div>`)

let form = (state: State.state) => `
	<form class="container form">
		${errorBubble(state.error)}
		<label class="form__field">
			<span class="form__field--text">Don't</span>
			<input class="form__field--input" id="text" name="text" type="text" />
		</label>
		<button class="form__button" id="add-todo">Add Todon't</button>
	</form>
`

let makeTodo = (todo: State.todo) => `
	<article class="list__item">
		<span class="list__text ${todo.finished ? "done" : ""}" id="todo-${todo.id}">${todo.text}</span>
		<button class="list__button" id="remove-${todo.id}">X</button>
	</article>
`

let todoList = (list: array<State.todo>) => `
	<section class="container list" id="todo-list">
		${Belt.Array.joinWith(list, "\n", makeTodo)}
	</section>
`

let addTodo = (state: State.state) => {
	State.addTodo(
		state,
		{ text: Helpers.Dom.getElementById("text")["value"] }
	)
}

let removeTodo = (state: State.state, id: string) =>
	id
	-> Js.String2.replace("remove-", "")
	-> State.removeTodo(state)

let updateTodo = (state: State.state, id: string) =>
	id
	-> Js.String2.replace("todo-", "")
	-> State.setFinished(state)

let handleClick = (state, event) => {
	event["preventDefault"]()

	switch event["target"]["id"] {
	| "add-todo" => addTodo(state)
	| x when Js.String.startsWith("todo", x) => updateTodo(state, x)
	| x when Js.String.startsWith("remove", x) => removeTodo(state, x)
	| _ => ()
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
