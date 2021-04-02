@bs.scope("window") @bs.val external addEventListener: 'a = "addEventListener"

addEventListener("load", State.init)
addEventListener("state-update", x => Template.render(Template.template(x["detail"]), "app"))