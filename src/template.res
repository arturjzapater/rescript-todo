let _errorBubble = x => `
	<span class="error__text">${x}</span>
	<button class="list__button" id="close-error">X</button>
`
let errorBubble = Belt.Option.mapWithDefault(_, "", _errorBubble)

let form = (state: State.state) => `
	<div class="error-container ${Belt.Option.isSome(state.error) ? "error" : ""}">
		${errorBubble(state.error)}
	</div>
	<form class="container form">
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
	let text = Helpers.Dom.getElementById("text")["value"]

	switch text {
	| "" => State.setError(state, "You must add a description")
	| text => State.addTodo(state, { text: text })
	}
}

let removeTodo = (state: State.state, id) =>
	id
	-> Js.String2.replace("remove-", "")
	-> State.removeTodo(state)

let updateTodo = (state: State.state, id) =>
	id
	-> Js.String2.replace("todo-", "")
	-> State.setFinished(state)

let handleClick = (state, event) => {
	event["preventDefault"]()

	switch event["target"]["id"] {
	| "add-todo" => addTodo(state)
	| "close-error" => State.clearError(state)
	| x when Js.String.startsWith("todo", x) => updateTodo(state, x)
	| x when Js.String.startsWith("remove", x) => removeTodo(state, x)
	| _ => ()
	}
}

let events = (state: State.state, id) =>
	Helpers.Dom.getElementById(id)["addEventListener"]("click", handleClick(state))

let template = (state: State.state) => `
	${form(state)}
	${todoList(state.list)}
`

let render = (html, id) => {
	Helpers.Dom.getElementById(id)["innerHTML"] = html
	let body = Helpers.Dom.body
	body["innerHTML"] = body["innerHTML"]
	id
}
