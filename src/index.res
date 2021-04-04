@bs.scope("window") @bs.val external addEventListener: 'a = "addEventListener"
// @bs.scope("document.body") @bs.val external onEvent: (string, 'a) => unit = "addEventListener"
// @bs.scope("document.body") @bs.val external offEvent: (string, 'a) => unit = "removeEventListener"

// let addTodo = (state: State.state) => {
// 	Js.log("Hi")
// 	Js.log(Helpers.Dom.getElementById("text")["value"])
// 	State.addTodo(
// 	state,
// 	{ text: Helpers.Dom.getElementById("text")["value"] }
// )
// }

// let handleClick = (state, e) => {
// 	e["preventDefault"]()
// 	switch e["target"]["id"] {
// 	| "add-todo" => addTodo(state)
// 	| _ => state
// 	}
// }

// let handleClick = (state) => {
// 	let function = (event) => {
// 		event["preventDefault"]()

// 		switch event["target"]["id"] {
// 		| "add-todo" => addTodo(state)
// 		| _ => state
// 		}
// 	}

// 	onEvent("click", function)
// 	// offEvent("click", function)
// }

addEventListener("load", State.init)
addEventListener(
	"state-update",
	event => {
		Template.template(event["detail"])
		-> Template.render("app")
		-> Template.events(event["detail"], _)
	}
)
