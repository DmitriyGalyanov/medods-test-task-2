<template>
	<button
		:disabled="disabled"
		:class="{
			button: true,
			button_filled: filled,
			button_hollow: hollow,
			button_disabled: disabled
			}"
		:type="type"
	>
	{{label}}
	</button>
</template>

<script>
export default {
	name: 'Button',
	props: {
		type: {
			type: String,
			default: 'submit'
		},
		label: {
			type: String,
			required: true
		},
		disabled: Boolean,
		filled: Boolean,
		hollow: Boolean
	}
}
</script>

<style lang="scss" scoped>
.button {
	border: none;
	display: inline-block; position: relative;
	min-width: 100px;
	text-transform: uppercase;
	padding: 10px 20px;
	text-align: center;
	border-radius: 22px; box-sizing: border-box;
	font-weight: bold; font-size: 12px;
	color: #fff; text-decoration: none;
	&:after {
		content: '';
		transition: 0.4s all ease;
		background: #fff; opacity: 0;
		position: absolute;
		color: inherit;
		top: 0; right: 0; bottom: 0; left: 0;
		z-index: 1; border-radius: inherit;
		margin: -1px;
		background: #fff;
	}
	&:hover {
		cursor: pointer;
		&:after {
			opacity: 0.5;
		}
	}
	&_disabled {
		cursor: default!important;
		&:after {
			opacity: 0.5;
		}
	}
}

.button_filled {
	background: linear-gradient(180deg, $primaryColor 0%, $gradientColor 100%);
}
.button_hollow {
	background-color: #fff;
	color: $primaryColor;
	&:before {
		position: absolute; content: '';
		top: 0; right: 0; bottom: 0; left: 0;
		z-index: -1;
		margin: -1px;
		border-radius: inherit;
		background: linear-gradient(180deg, $primaryColor 0%, $gradientColor 100%);
	}
}
</style>