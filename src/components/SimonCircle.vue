<template>
	<div class="SimonCircleWrap">
		<div v-for="sector in sectors" :key="sector.id"
			:class="{
				[sector.class]: true,
				'sector_highlighted': sector.isHighlighted
			}"
			@click="handleSectorClick(sector.id)"
		>
		</div>

		<div class="buttons">
			<div @click="increaseRoundNumber">
				increaseRoundNumber
			</div>
			<div @click="highlightSectors">
				highlightSectors
			</div>
			<div @click="setTimeout(1.5)">
				set easy
			</div>
			<div @click="setTimeout(1)">
				set medium
			</div>
			<div @click="setTimeout(0.4)">
				set hard
			</div>
			<div @click="clearUserSelectedSectors">
				clearUserSelectedSectors
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: 'SimonCircle',
	data() {
		return {
			sectorsInit: [
				{
					id: 0,
					class: 'sector sector_first',
					isHighlighted: false
				},
				{
					id: 1,
					class: 'sector sector_second',
					isHighlighted: false
				},
				{
					id: 2,
					class: 'sector sector_third',
					isHighlighted: false
				},
				{
					id: 3,
					class: 'sector sector_fourth',
					isHighlighted: false
				},
			],
			roundNumber: 1,
			timeout: 1.5,
			isUserFail: false,
		}
	},
	computed: {
		sectors() {
			const data = [];
			this.sectorsInit.forEach(sector => {
				data.push(sector)
			})
			return data;
		},
		gameSelectedSectorsArray() {
			const data = []
			for (let i = 0; i < this.roundNumber; i++) {
				data.push(this.getRandomNumber())
			}
			return data;
		},
		userSelectedSectorsArray() {
			return []
		},
	},
	methods: {
		getRandomNumber() {
			return Math.floor(Math.random() * Math.floor(this.sectorsInit.length)); //+1
		},
		increaseRoundNumber() {
			this.roundNumber++;
		},
		setTimeout(value) {
			this.timeout = value;
		},
		highlightSector(value) {
			this.sectors.forEach(sector => {
				if (sector.id === value) {
					this.sectors[sector.id].isHighlighted = true
					setTimeout(() => {
						this.sectors[sector.id].isHighlighted = false
					}, this.timeout / 2 * 1000)
				} else this.sectors[sector.id].isHighlighted = false
			})
		},
		highlightSectors() {
			const {timeout,
				gameSelectedSectorsArray,
				highlightSector} = this;
			gameSelectedSectorsArray.forEach((number, index) => {
				setTimeout(() => {
					highlightSector(number)
				}, timeout * 1000 * (index + 1))
			})
		},
		setUserSelectedSectors(value) {
			this.userSelectedSectorsArray.push(value)
		},
		clearUserSelectedSectors() {
			this.userSelectedSectorsArray.length = 0;
		},
		setIsUserFail(userSelectedSectorId) {
			const {gameSelectedSectorsArray: gameSelectedArray,
				userSelectedSectorsArray: userSelectedArray} = this;
			if (gameSelectedArray[userSelectedArray.length - 1] !== userSelectedSectorId) {
				this.isUserFail = true;
			} else this.isUserFail = false;
		},
		handleSectorClick(sectorId) {
			this.setUserSelectedSectors(sectorId)
			this.setIsUserFail(sectorId)
		},
	}
}
</script>

<style lang="scss" scoped>
.SimonCircleWrap {
	.buttons {
		position: absolute;
		left: 400px;
		cursor: default;
	}
	width: 300px;
	height: 300px;
	border: 4px solid white;
	box-shadow: 0px 0px 10px 5px rgba(0,0,0,0.55);
	border-radius: 50%;
	position: relative;
	cursor: pointer;
	.sector {
		transition: 0.25s;
		position: absolute;
		border-radius: inherit;
		width: 100%;
		height: 100%;
		opacity: 0.7;
		&_first {
			clip-path: polygon(50% 0%, 50% 50%, 0 50%, 0 0);
			background-color: $firstSector_color;
		}
		&_second {
			clip-path: polygon(100% 0%, 100% 50%, 50% 50%, 50% 0%);
			background-color: $secondSector_color;
		}
		&_third {
			clip-path: polygon(50% 50%, 50% 100%, 100% 100%, 100% 50%);
			background-color: $thirdSector_color;
		}
		&_fourth {
			clip-path: polygon(0 50%, 0 100%, 50% 100%, 50% 50%);
			background-color: $fourthSector_color;
		}
		&_highlighted, &:hover {
			opacity: 1;
		}
	}
}

</style>