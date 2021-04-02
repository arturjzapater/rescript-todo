type todo = {
	title: string,
	description: string,
	createdAt: int
}

type state = {
	list: array<todo>
}

type stateManager = {
	state: state,
	update: state => unit
}

let stateFactory: state => stateManager = init => {
	let state = init

	{ 
		state: state,
		update: x => {
			let state = x
		}
	}
}