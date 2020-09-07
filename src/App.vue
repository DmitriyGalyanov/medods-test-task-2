<template>
	<div id="app">
		<SimonCircle/>
	</div>
</template>

<script>
import SimonCircle from '@components/SimonCircle'

export default {
	name: 'App',
	components: {
		SimonCircle
	}
}
</script>

<style lang="scss">
body, p, h1, h2, h3, h4, h5, h6, ul, li {
	margin: 0; padding: 0;
	margin-block-start: 0;
	margin-block-end: 0;
	font-size: 1em;
} //reset
* {
	box-sizing: border-box;
}
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	max-width: 940px;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 4px;
	padding: 8px;
}
</style>
