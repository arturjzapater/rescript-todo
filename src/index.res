@bs.scope("window") @bs.val external addEventListener: 'a = "addEventListener"

addEventListener("load", State.init)
addEventListener(
	"state-update",
	event =>
		event["detail"]
		-> Template.template
		-> Template.render("app")
		-> Template.events(event["detail"], _)
)
