<template>
	<div class="radioButtonsWrap">
		<p v-if="isRequired"
			:class="{
				requiredAlert: true,
				requiredAlert_error: didSubmitAttempt &&
					!value
			}">
			Это поле обязательно для заполнения
		</p>
		<div class="buttonsWrap"
			:class="{
				'buttonsWrap_flex-row': flex_row,
				'buttonsWrap_flex-column': flex_column
			}"
		>
			<label v-for="button in buttons"
				tabindex="0"
				@keyup.enter="updateInputData(button.name)"
				:key="button.name"
				:for="button.name"
				:class="{
					label: true,
					label_error: isRequired &&
						didSubmitAttempt && !value
				}"
			>
				{{button.nameLocaleRu}}
				<input class="button" type="radio"
					tabindex="-1"
					:name="name" :value="button.name"
					:id="button.name"
					:checked="button.name === value"
					@change="updateInputData($event.target.value)"
				/>
			</label>
		</div>
	</div>
</template>

<script>
export default {
	name: 'RadioInput',
	props: {
		flex_row: Boolean,
		flex_column: Boolean,
		name: {
			type: String,
			required: true
		},
		defaultValue: {
			type: String,
			default: ''
		},
		buttons: {
			type: Array,
			required: true
		},
		isRequired: {
			type: Boolean,
			default: false
		},
		didSubmitAttempt: {
			type: Boolean,
			default: false //true ??
		}
	},
	data() {
		return {
			value: this.defaultValue
		}
	},
	methods: {
		updateInputData(value) {
			this.value = value;
			this.$emit('update-input-data', value)
		}
	}
}
</script>

<style lang="scss" scoped>
.radioButtonsWrap {
	// min-width: 250px;
	// max-width: 320px;
	.requiredAlert {
		margin-bottom: 2px;
		color: $gradientColor;
		line-height: 20px;
		&_error {
			color: $softErrorText;
		}
	}
	.buttonsWrap {
		display: flex;
		&_flex-row {
			min-width: 250px;
			max-width: 320px;
			flex-direction: row;
			justify-content: space-around;
		}
		&_flex-column {
			
			flex-direction: column;
		}
		gap: 10px;
		.label {
			cursor: pointer;
			// &:not(:first-child) {
			// 	margin-left: 20px;
			// }
			display: flex; align-items: center;
			font-size: 14px; color: $text_primary;
			.button {
				-webkit-appearance: unset; margin: 0 10px 0 0;
				display: block; position: relative;
				height: 20px; width: 20px;
				outline: none;
				order: -1;
				&::before {
					cursor: pointer;
					content: ''; display: inherit;
					margin-right: 10px;
					width: 18px; height: 18px;
					border: 1px solid transparentize($darkShadeColor, 0.75);
					border-radius: 10px;
				}
				&:checked::before {
					border-color:$primaryColor;
				}
				&:checked::after {
					content: ''; display: inherit;
					position: absolute; cursor: pointer;
					width: 12px; height: 12px;
					background: linear-gradient(180deg, $primaryColor 0%, #8BA4F9 100%); border-radius: 50%;
					top: calc(50% - 6px);
					right: calc(50% - 6px);
				}
			}
			&_error {
				color: $softErrorText;
				.button::before {
					border-color: $softErrorText;
				}
			}
		}
	}
}
</style>