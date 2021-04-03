@bs.scope("window") @bs.val external addEventListener: 'a = "addEventListener"

addEventListener("load", State.init)
addEventListener(
	"state-update",
	event => {
		Template.template(event["detail"])
		-> Template.render("app")
	}
)
