/datum/power/changeling/silence_sting
	name = "Silence Sting"
	desc = "We silently sting a human, completely silencing them for a short time."
	helptext = "Does not provide a warning to a victim that they have been stung, until they try to speak and cannot."
	enhancedtext = "Silence duration is extended."
	ability_icon_state = "ling_sting_mute"
	genomecost = 2
	power_category = CHANGELING_POWER_STINGS
	allowduringlesserform = 1
	verbpath = TYPE_PROC_REF(/mob, changeling_silence_sting)

/mob/proc/changeling_silence_sting()
	set category = "Changeling"
	set name = "Silence sting (10)"
	set desc="Sting target"

	var/mob/living/carbon/T = changeling_sting(10,TYPE_PROC_REF(/mob, changeling_silence_sting))
	if(!T)	return 0
	add_attack_logs(src,T,"Silence sting (changeling)")
	var/duration = 30
	if(src.mind.changeling.recursive_enhancement)
		duration = duration + 10
		to_chat(src, "<span class='notice'>They will be unable to cry out in fear for a little longer.</span>")
	T.silent += duration
	feedback_add_details("changeling_powers","SS")
	return 1
