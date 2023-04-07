//Please make sure to:
//return FALSE: You are not going away, stop asking me to digest.
//return non-negative integer: Amount of nutrition/charge gained (scaled to nutrition, other end can multiply for charge scale).

// Ye default implementation.
/obj/item/proc/digest_act(obj/vore_belly/guthole, mob/living/owner)
	if(guthole && SEND_SIGNAL(src, COMSIG_CONTAINS_STORAGE))
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_QUICK_EMPTY, guthole)
	qdel(src)
	return w_class

/////////////
// Some indigestible stuff
/////////////
/obj/item/hand_tele/digest_act(...)
	return FALSE
/obj/item/card/id/digest_act(...)
	return FALSE
/obj/item/aicard/digest_act(...)
	return FALSE
/obj/item/paicard/digest_act(...)
	return FALSE
/obj/item/pinpointer/digest_act(...)
	return FALSE
/obj/item/disk/nuclear/digest_act(...)
	return FALSE
/obj/item/perfect_tele_beacon/digest_act(...)
	return FALSE //Sorta important to not digest your own beacons.
/obj/item/pda/digest_act(...)
	return FALSE
/obj/item/gun/digest_act(...)
	return FALSE
/obj/item/clothing/shoes/magboots/digest_act(...)
	return FALSE
/obj/item/clothing/head/helmet/space/digest_act(...)
	return FALSE
/obj/item/clothing/suit/space/digest_act(...)
	return FALSE
/obj/item/reagent_containers/hypospray/CMO/digest_act(...)
	return FALSE
/obj/item/tank/jetpack/oxygen/captain/digest_act(...)
	return FALSE
/obj/item/clothing/accessory/medal/gold/captain/digest_act(...)
	return FALSE
/obj/item/clothing/suit/armor/digest_act(...)
	return FALSE
/obj/item/documents/digest_act(...)
	return FALSE
/obj/item/nuke_core/digest_act(...)
	return FALSE
/obj/item/nuke_core_container/digest_act(...)
	return FALSE
/obj/item/areaeditor/blueprints/digest_act(...)
	return FALSE
/obj/item/documents/syndicate/digest_act(...)
	return FALSE
/obj/item/bombcore/digest_act(...)
	return FALSE
/obj/item/grenade/digest_act(...)
	preprime() // heh
	return FALSE
/obj/item/storage/digest_act(...)
	return FALSE

/////////////
// Some special treatment
/////////////

/obj/item/reagent_containers/food/digest_act(obj/vore_belly/guthole = null)
	if(isbelly(guthole))
		var/obj/vore_belly/B = guthole
		if(ishuman(B.owner))
			var/mob/living/carbon/human/H = B.owner
			reagents.trans_to(H, (reagents.total_volume * 0.3), 1, 0)
		else if(iscyborg(B.owner))
			var/mob/living/silicon/robot/R = B.owner
			R.cell.charge += 150

	. = ..()

/obj/item/organ/digest_act(obj/vore_belly/guthole = null)
	if((. = ..()))
		. += 70 //Organs give a little more

/obj/item/storage/digest_act(obj/vore_belly/guthole = null)
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_HIDE_ALL)
	. = ..()

/////////////
// Some more complicated stuff
/////////////
/obj/item/mmi/digital/posibrain/digest_act(obj/vore_belly/guthole = null)
	//Replace this with a VORE setting so all types of posibrains can/can't be digested on a whim
	return FALSE
