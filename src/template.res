type element = {
	@bs.set "innerHTML": string
}
@bs.scope("document") @bs.val external getElementById: (string) => element = "getElementById"

let makeTodo = (todo: State.todo) => `
	<article id="${todo.id}">${todo.title}</article>
`

let todoList = (list: array<State.todo>) => `
	<section id="todo-list">
		${Belt.Array.joinWith(list, "\n", makeTodo)}
	</section>
`

let template = (state: State.state) => todoList(state.list)

let render = (html: string, id: string) => getElementById(id)["innerHTML"] = html
