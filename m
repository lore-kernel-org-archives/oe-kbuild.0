Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081A366823
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 05:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661466; cv=none; b=WC1AgBxmZyIsyy+VRZ5XxWIlA5VGj69dpxAQ8VjH39UBi9BwilHljwHmLTWhLb9XFPlw+xhEXhvI+Hn9Xv87gVnIeA1o5EdhNlyh7miF6RwRxmdyBMKlGnhKW5ck15tEVwsjYi8GfUK/yuIFd7M5rTN72POU2uro98Vqq50pu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661466; c=relaxed/simple;
	bh=HjNN2F8DeEHWpaOJITHlm3mLkNaB0oKwRIc+VA/ZwrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XXOZ59uxxxcsT0Wmkz0m036Ri3GaHXRA+gu/hB9qhTzGOOhPpGhOvixtJqYxQj0Kdcym2SRJEQyYX0TpoAJTOsTBdQQqLc+8MTsnFYTd8Hdx4zUMYh6iuFZdH+i6Yz0CArDk8w5mjd8VAM+z8rb8RKm9Y59FqKupq8oVA5Mnf4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxw2MJPt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxw2MJPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783661465; x=1815197465;
  h=date:from:to:cc:subject:message-id;
  bh=HjNN2F8DeEHWpaOJITHlm3mLkNaB0oKwRIc+VA/ZwrQ=;
  b=hxw2MJPtThEypjcGGBglObZfmYAyKjNC1QvLSWvJOo63+fzAcz5ORkIb
   zNkEwJQHX6mQN/zVpJ3k+iI1WLffE+zOd5Q6ZNUy/L1AdHXYfo+BidmnO
   uNLP0tjDiwlOgctciRhBBAjimox9xzaDLAVwTZgdDJ0OTKchAsjKkFI5k
   MWhNtiGY9ECvSf9ThfRioDk/YX9NmzmUtcoxge7o0jUzDiyhcx1qP6UBn
   eUHSZIhc5AXu5Zk58fjjEeq9wDRElvAtga7XFg5Qpe92Omd4ByrRvTEwQ
   h2ZYw0FmID/d6yu8NsEJ6nP8ukKJYtX+7/kl51Tzgasixxsl7ZDn19lpc
   g==;
X-CSE-ConnectionGUID: FWU2jwX/RFyryrBj9kWD3g==
X-CSE-MsgGUID: G8fGRVgjQ1ee/tpfxjVSTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109902617"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109902617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 22:31:04 -0700
X-CSE-ConnectionGUID: kGAOfWTDQT6v+bwLdMtZOg==
X-CSE-MsgGUID: G8wKZs/cQgO7O8d6DLaL1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250372071"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 22:31:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi3pD-00000000IXD-3rye;
	Fri, 10 Jul 2026 05:30:59 +0000
Date: Fri, 10 Jul 2026 13:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/codecs/generic.c:198 parse_user_hints() warn:
 assigning (-2) to unsigned variable 'spec->mixer_nid'
Message-ID: <202607101310.BDnCmO2k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 ALSA: hda: Move codec drivers into sound/hda/codecs directory
date:   12 months ago
:::::: branch date: 3 days ago
:::::: commit date: 12 months ago
config: hexagon-randconfig-r072-20260710 (https://download.01.org/0day-ci/archive/20260710/202607101310.BDnCmO2k-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6014e9021b28 ("ALSA: hda: Move codec drivers into sound/hda/codecs directory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607101310.BDnCmO2k-lkp@intel.com/

smatch warnings:
sound/hda/codecs/generic.c:198 parse_user_hints() warn: assigning (-2) to unsigned variable 'spec->mixer_nid'

vim +198 sound/hda/codecs/generic.c

^1da177e4c3f41 sound/pci/hda/hda_generic.c Linus Torvalds 2005-04-16  101  
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  102  /*
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  103   * store user hints
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  104   */
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  105  static void parse_user_hints(struct hda_codec *codec)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  106  {
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  107  	struct hda_gen_spec *spec = codec->spec;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  108  	int val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  109  
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  110  	val = snd_hda_get_bool_hint(codec, "jack_detect");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  111  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  112  		codec->no_jack_detect = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  113  	val = snd_hda_get_bool_hint(codec, "inv_jack_detect");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  114  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  115  		codec->inv_jack_detect = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  116  	val = snd_hda_get_bool_hint(codec, "trigger_sense");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  117  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  118  		codec->no_trigger_sense = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  119  	val = snd_hda_get_bool_hint(codec, "inv_eapd");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  120  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  121  		codec->inv_eapd = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  122  	val = snd_hda_get_bool_hint(codec, "pcm_format_first");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  123  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  124  		codec->pcm_format_first = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  125  	val = snd_hda_get_bool_hint(codec, "sticky_stream");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  126  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  127  		codec->no_sticky_stream = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  128  	val = snd_hda_get_bool_hint(codec, "spdif_status_reset");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  129  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  130  		codec->spdif_status_reset = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  131  	val = snd_hda_get_bool_hint(codec, "pin_amp_workaround");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  132  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  133  		codec->pin_amp_workaround = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  134  	val = snd_hda_get_bool_hint(codec, "single_adc_amp");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  135  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  136  		codec->single_adc_amp = !!val;
967b1307b69b8a sound/pci/hda/hda_generic.c Takashi Iwai   2015-03-20  137  	val = snd_hda_get_bool_hint(codec, "power_save_node");
e6feb5d08509be sound/pci/hda/hda_generic.c Takashi Iwai   2015-03-16  138  	if (val >= 0)
967b1307b69b8a sound/pci/hda/hda_generic.c Takashi Iwai   2015-03-20  139  		codec->power_save_node = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  140  
f72706be354b35 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-16  141  	val = snd_hda_get_bool_hint(codec, "auto_mute");
f72706be354b35 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-16  142  	if (val >= 0)
f72706be354b35 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-16  143  		spec->suppress_auto_mute = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  144  	val = snd_hda_get_bool_hint(codec, "auto_mic");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  145  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  146  		spec->suppress_auto_mic = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  147  	val = snd_hda_get_bool_hint(codec, "line_in_auto_switch");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  148  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  149  		spec->line_in_auto_switch = !!val;
7eebffd3f4328c sound/pci/hda/hda_generic.c Takashi Iwai   2013-06-24  150  	val = snd_hda_get_bool_hint(codec, "auto_mute_via_amp");
7eebffd3f4328c sound/pci/hda/hda_generic.c Takashi Iwai   2013-06-24  151  	if (val >= 0)
7eebffd3f4328c sound/pci/hda/hda_generic.c Takashi Iwai   2013-06-24  152  		spec->auto_mute_via_amp = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  153  	val = snd_hda_get_bool_hint(codec, "need_dac_fix");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  154  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  155  		spec->need_dac_fix = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  156  	val = snd_hda_get_bool_hint(codec, "primary_hp");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  157  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  158  		spec->no_primary_hp = !val;
da96fb5b0185d2 sound/pci/hda/hda_generic.c Takashi Iwai   2013-07-29  159  	val = snd_hda_get_bool_hint(codec, "multi_io");
da96fb5b0185d2 sound/pci/hda/hda_generic.c Takashi Iwai   2013-07-29  160  	if (val >= 0)
da96fb5b0185d2 sound/pci/hda/hda_generic.c Takashi Iwai   2013-07-29  161  		spec->no_multi_io = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  162  	val = snd_hda_get_bool_hint(codec, "multi_cap_vol");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  163  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  164  		spec->multi_cap_vol = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  165  	val = snd_hda_get_bool_hint(codec, "inv_dmic_split");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  166  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  167  		spec->inv_dmic_split = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  168  	val = snd_hda_get_bool_hint(codec, "indep_hp");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  169  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  170  		spec->indep_hp = !!val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  171  	val = snd_hda_get_bool_hint(codec, "add_stereo_mix_input");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  172  	if (val >= 0)
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  173  		spec->add_stereo_mix_input = !!val;
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  174  	/* the following two are just for compatibility */
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  175  	val = snd_hda_get_bool_hint(codec, "add_out_jack_modes");
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  176  	if (val >= 0)
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  177  		spec->add_jack_modes = !!val;
29476558deb301 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-17  178  	val = snd_hda_get_bool_hint(codec, "add_in_jack_modes");
29476558deb301 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-17  179  	if (val >= 0)
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  180  		spec->add_jack_modes = !!val;
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  181  	val = snd_hda_get_bool_hint(codec, "add_jack_modes");
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  182  	if (val >= 0)
f811c3cf8fae63 sound/pci/hda/hda_generic.c Takashi Iwai   2013-03-07  183  		spec->add_jack_modes = !!val;
55196fffc95105 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-24  184  	val = snd_hda_get_bool_hint(codec, "power_down_unused");
55196fffc95105 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-24  185  	if (val >= 0)
55196fffc95105 sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-24  186  		spec->power_down_unused = !!val;
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  187  	val = snd_hda_get_bool_hint(codec, "add_hp_mic");
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  188  	if (val >= 0)
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  189  		spec->hp_mic = !!val;
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  190  	val = snd_hda_get_bool_hint(codec, "hp_mic_detect");
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  191  	if (val >= 0)
967303dabc2233 sound/pci/hda/hda_generic.c Takashi Iwai   2013-02-19  192  		spec->suppress_hp_mic_detect = !val;
7480316c265c9f sound/pci/hda/hda_generic.c Takashi Iwai   2017-04-10  193  	val = snd_hda_get_bool_hint(codec, "vmaster");
7480316c265c9f sound/pci/hda/hda_generic.c Takashi Iwai   2017-04-10  194  	if (val >= 0)
7480316c265c9f sound/pci/hda/hda_generic.c Takashi Iwai   2017-04-10  195  		spec->suppress_vmaster = !val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  196  
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  197  	if (!snd_hda_get_int_hint(codec, "mixer_nid", &val))
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11 @198  		spec->mixer_nid = val;
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  199  }
1c70a583417e8d sound/pci/hda/hda_generic.c Takashi Iwai   2013-01-11  200  

:::::: The code at line 198 was first introduced by commit
:::::: 1c70a583417e8db1e1d5069d7651ba294e9499de ALSA: hda - Allow user to give hints for codec parser behavior

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
