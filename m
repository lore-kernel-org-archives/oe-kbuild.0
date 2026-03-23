Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC533783D5
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254773; cv=none; b=q3HNhhd5df7j+WItImxv9uxVyhAxVljpXTFSBCqsd1KWBxz9ySjzrObwL5avLFMHkogik1rMwXNGj668OkELVVcr5UmC0dYcifPE3wXsh9vobKZjF9LtmhjL4iQLHFeAENAGVMldiZJLdoFKRR2LkIVOOJMQej9Df8mq3jiENBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254773; c=relaxed/simple;
	bh=n2VCbHWaqifSYTeUwSRMOu/X+1x9z65XjQGTfNXi9ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rbcLGIQFT6DkTG/zRapRmK1dAD/fnePycohqGazI+6KhZ5eonhjYeuBf1TuuQ/A82BAtoqPiDLJrru86p50Yj9pX8jX+XxL4SPiYIeaDTLhcnOZqI0zzDMjbv6B14uFvUGbywwdGRJB9TjwaF6Z6XBBN6jWscwHshARtWKnpwHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtKnvLFh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtKnvLFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774254771; x=1805790771;
  h=date:from:to:cc:subject:message-id;
  bh=n2VCbHWaqifSYTeUwSRMOu/X+1x9z65XjQGTfNXi9ug=;
  b=gtKnvLFhE1TNS7v8KPdDPkvtImMvZ1yS0dJmnW55Us9HilMVTUdWtoK5
   eWFowu/iMYEz6vtDNZrr/7+BxF8u8D3MrzFWCy5z40BO0FyOaEsUSb5I8
   Hz4vJJlu82jjdEgl1Gd7WrWBpUvJYW166/N0XeVg9cY6m67Y1fCGeiaIP
   WBf1w5EoO+RdNn+buMgIeFD0YCe3gi91pJFDu9w47eRigKOdm5bNt52n6
   cRWKe6P0rjnT1tx+OMGXQ0CY54RHWe51bvT4WICnLptF6ZGuLjyeTVD0c
   Dbw68XW3jkwdd0oXprUcRa9bQaAVT8j6+5P+v0T6NdqANbwjmEl8ycswa
   g==;
X-CSE-ConnectionGUID: +bow4Vo/RwiZbCboHP89Kg==
X-CSE-MsgGUID: nIpQmWg/RqaPlmmFW/F4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85942906"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85942906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:32:51 -0700
X-CSE-ConnectionGUID: x9UyOUJuSXyJy44Pv76r1w==
X-CSE-MsgGUID: /v8b04Q/ThSFZVz2FXQICQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2026 01:32:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4aiN-000000000CT-0pCb;
	Mon, 23 Mar 2026 08:32:47 +0000
Date: Mon, 23 Mar 2026 16:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/common/jack.c:572 snd_hda_jack_add_kctl_mst()
 error: we previously assumed 'jack->jack' could be null (see line 552)
Message-ID: <202603231656.NURIAbuw-lkp@intel.com>
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

Hi Takashi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 05be28fe8521f183f945d052d5019197e5934f0e ALSA: hda: Move common codec driver into sound/hda/common directory
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231656.NURIAbuw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603231656.NURIAbuw-lkp@intel.com/

smatch warnings:
sound/hda/common/jack.c:572 snd_hda_jack_add_kctl_mst() error: we previously assumed 'jack->jack' could be null (see line 552)

vim +572 sound/hda/common/jack.c

31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  527  
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  528  /**
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  529   * snd_hda_jack_add_kctl_mst - Add a kctl for the given pin
a11e9b168646cfc sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  530   * @codec: the HDA codec
a11e9b168646cfc sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  531   * @nid: pin NID to assign
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  532   * @dev_id : pin device entry id
a11e9b168646cfc sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  533   * @name: string name for the jack
a11e9b168646cfc sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  534   * @phantom_jack: flag to deal as a phantom jack
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  535   * @type: jack type bits to be reported, 0 for guessing from pincfg
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  536   * @keymap: optional jack / key mapping
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  537   *
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  538   * This assigns a jack-detection kctl to the given pin.  The kcontrol
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  539   * will have the given name and index.
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  540   */
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  541  int snd_hda_jack_add_kctl_mst(struct hda_codec *codec, hda_nid_t nid,
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  542  			      int dev_id, const char *name, bool phantom_jack,
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  543  			      int type, const struct hda_jack_keymap *keymap)
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  544  {
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  545  	struct hda_jack_tbl *jack;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  546  	const struct hda_jack_keymap *map;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  547  	int err, state, buttons;
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  548  
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  549  	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  550  	if (!jack)
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  551  		return 0;
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27 @552  	if (jack->jack)
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  553  		return 0; /* already created */
80c8bfbe76869bf sound/pci/hda/hda_jack.c David Henningsson 2012-06-04  554  
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  555  	if (!type)
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  556  		type = get_input_jack_type(codec, nid);
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  557  
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  558  	buttons = 0;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  559  	if (keymap) {
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  560  		for (map = keymap; map->type; map++)
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  561  			buttons |= map->type;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  562  	}
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  563  
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  564  	err = snd_jack_new(codec->card, name, type | buttons,
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  565  			   &jack->jack, true, phantom_jack);
31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  566  	if (err < 0)
31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  567  		return err;
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  568  
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  569  	jack->phantom_jack = !!phantom_jack;
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  570  	jack->type = type;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  571  	jack->button_state = 0;
31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01 @572  	jack->jack->private_data = jack;
31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  573  	jack->jack->private_free = hda_free_jack_priv;
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  574  	if (keymap) {
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  575  		for (map = keymap; map->type; map++)
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  576  			snd_jack_set_key(jack->jack, map->type, map->key);
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  577  	}
911761c2304327a sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  578  
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  579  	state = snd_hda_jack_detect_mst(codec, nid, dev_id);
31ef22579302ac4 sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  580  	snd_jack_report(jack->jack, state ? jack->type : 0);
2ba2dfa1fcc7ce5 sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  581  
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  582  	return 0;
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  583  }
5204a05d70d9354 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  584  EXPORT_SYMBOL_GPL(snd_hda_jack_add_kctl_mst);
01a61e12b4602c8 sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  585  

:::::: The code at line 572 was first introduced by commit
:::::: 31ef22579302ac42054bebecb528710f46580925 ALSA: hda - Integrate input-jack stuff into kctl-jack

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
