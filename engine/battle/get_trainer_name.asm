GetTrainerName_: ; f67a5 (3d:67a5)
	ld hl, wGrassRate
	ld a, [wLinkState]
	and a
	jr nz, .foundName
	ld hl, wRivalName
	ld a, [W_TRAINERCLASS]
	cp SONY1
	jr z, .foundName
	cp SONY2
	jr z, .foundName
	cp SONY3
	jr z, .foundName
	ld [wd0b5], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName
	ld hl, wcd6d
.foundName
.rival
	ld de, wTrainerName
	ld bc, $d
	jp CopyData
