Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59951223708
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765522118; cv=none; b=N49f6yqXs73IimSxSHPtTMad8CcdockXNtp75AcJeyzOpZ8SIaVE9pn++7AYyjI7e/5wnjQzOmbynwZghtjhkoDV/2T9j7EbI8JaYagDWn/zhBrH56NIkfBk0FeA7bfcl/EkJFNHLbJ+pcfTagg0DXkdn4R8/MQdd00yXvgIodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765522118; c=relaxed/simple;
	bh=5y2fdpDSU6P3nQeqky2kZ18ZaaKdq/2SwAJ/2lyhNuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a05UBfIp/rf1mMKXOpflieaic8k5uM9J629jZq+BKR69svFAps+Nx1cF+B+x1AB0aQ8/DwELP3tvWchVzECSGXOT9aEeWfnFBWi2J2clZUudtJsDGB16ih65ghEglsdO6YN+4mwjX2lpZTMIUHlh8tCogdlweUwRrP8yLX7VU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdPRAaOV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdPRAaOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765522116; x=1797058116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5y2fdpDSU6P3nQeqky2kZ18ZaaKdq/2SwAJ/2lyhNuY=;
  b=RdPRAaOVFbevZ1AqUQPsuyaaXE7pG3VTgua3GQ6LHBHkTIpBiVET8PXO
   82JETWBjQKlNAsV/OGMhrcjbOrkYc4HrhPClXhlcD84EfpR0wc8w3uY+a
   j0ZYNEVgkdfO7R4oeKvAyJ/ZgjqBLaHlINhCJgqsFttdJcDONCDa9OI6R
   dK68ls5pMc0jBsmZoD0LRwOVvqR9PgZCfklYFCJGIqIdvqlsfC9pdHknk
   Ndh8Fpkt+SrIh4RF5JKa29EZgyickwAbgDdYLcu0MP6SPMCAh8+ctj5SP
   VvEx4WgEf0lRIlbwiYDDhTRMGhZXB85CoYiT9A5465id5sUlIVQtX0yA9
   w==;
X-CSE-ConnectionGUID: 5RDhltsTQKG/U/8am/Suhw==
X-CSE-MsgGUID: D0KSlFqlRuqDx8gJzCUZEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71379713"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71379713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:48:33 -0800
X-CSE-ConnectionGUID: IbrOAM/hQP6D66Q0eKUYqg==
X-CSE-MsgGUID: o360JiZoSgml+IyP2qcD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196292673"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 22:48:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwx4-000000005gi-0fSu;
	Fri, 12 Dec 2025 06:48:30 +0000
Date: Fri, 12 Dec 2025 14:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/common/jack.c:572 snd_hda_jack_add_kctl_mst() error: we
 previously assumed 'jack->jack' could be null (see line 552)
Message-ID: <202512121400.bHSVnCSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 05be28fe8521f183f945d052d5019197e5934f0e ALSA: hda: Move common codec driver into sound/hda/common directory
date:   5 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121400.bHSVnCSS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121400.bHSVnCSS-lkp@intel.com/

smatch warnings:
sound/hda/common/jack.c:572 snd_hda_jack_add_kctl_mst() error: we previously assumed 'jack->jack' could be null (see line 552)

vim +572 sound/hda/common/jack.c

31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  527  
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  528  /**
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  529   * snd_hda_jack_add_kctl_mst - Add a kctl for the given pin
a11e9b168646cf sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  530   * @codec: the HDA codec
a11e9b168646cf sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  531   * @nid: pin NID to assign
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  532   * @dev_id : pin device entry id
a11e9b168646cf sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  533   * @name: string name for the jack
a11e9b168646cf sound/pci/hda/hda_jack.c Takashi Iwai      2014-10-29  534   * @phantom_jack: flag to deal as a phantom jack
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  535   * @type: jack type bits to be reported, 0 for guessing from pincfg
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  536   * @keymap: optional jack / key mapping
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  537   *
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  538   * This assigns a jack-detection kctl to the given pin.  The kcontrol
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  539   * will have the given name and index.
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  540   */
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  541  int snd_hda_jack_add_kctl_mst(struct hda_codec *codec, hda_nid_t nid,
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  542  			      int dev_id, const char *name, bool phantom_jack,
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  543  			      int type, const struct hda_jack_keymap *keymap)
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  544  {
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  545  	struct hda_jack_tbl *jack;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  546  	const struct hda_jack_keymap *map;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  547  	int err, state, buttons;
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  548  
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  549  	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  550  	if (!jack)
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  551  		return 0;
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27 @552  	if (jack->jack)
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  553  		return 0; /* already created */
80c8bfbe76869b sound/pci/hda/hda_jack.c David Henningsson 2012-06-04  554  
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  555  	if (!type)
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  556  		type = get_input_jack_type(codec, nid);
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  557  
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  558  	buttons = 0;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  559  	if (keymap) {
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  560  		for (map = keymap; map->type; map++)
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  561  			buttons |= map->type;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  562  	}
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  563  
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  564  	err = snd_jack_new(codec->card, name, type | buttons,
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  565  			   &jack->jack, true, phantom_jack);
31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  566  	if (err < 0)
31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  567  		return err;
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  568  
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  569  	jack->phantom_jack = !!phantom_jack;
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  570  	jack->type = type;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  571  	jack->button_state = 0;
31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01 @572  	jack->jack->private_data = jack;
31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  573  	jack->jack->private_free = hda_free_jack_priv;
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  574  	if (keymap) {
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  575  		for (map = keymap; map->type; map++)
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  576  			snd_jack_set_key(jack->jack, map->type, map->key);
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  577  	}
911761c2304327 sound/pci/hda/hda_jack.c Takashi Iwai      2018-11-28  578  
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  579  	state = snd_hda_jack_detect_mst(codec, nid, dev_id);
31ef22579302ac sound/pci/hda/hda_jack.c Takashi Iwai      2011-12-01  580  	snd_jack_report(jack->jack, state ? jack->type : 0);
2ba2dfa1fcc7ce sound/pci/hda/hda_jack.c Jie Yang          2015-04-27  581  
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  582  	return 0;
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  583  }
5204a05d70d935 sound/pci/hda/hda_jack.c Nikhil Mahale     2019-11-19  584  EXPORT_SYMBOL_GPL(snd_hda_jack_add_kctl_mst);
01a61e12b4602c sound/pci/hda/hda_jack.c Takashi Iwai      2011-10-28  585  

:::::: The code at line 572 was first introduced by commit
:::::: 31ef22579302ac42054bebecb528710f46580925 ALSA: hda - Integrate input-jack stuff into kctl-jack

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
