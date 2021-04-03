module Dom = {
	type element = {
		@bs.set "innerHTML": string,
		"value": string
	}
	@bs.scope("document") @bs.val external getElementById: (string) => element = "getElementById"
}