module Dom = {
	@bs.scope("document") @bs.val external getElementById: (string) => {
		"addEventListener": 'a,
		@bs.set "innerHTML": string,
		"value": string
	} = "getElementById"
	@bs.scope("document") @bs.val external body: { @bs.set "innerHTML": string } = "body"
}
