Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9A1DF273
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761356093; cv=none; b=gSairBZi55ROyHWUK/B6TmfbwGTDSeE/Ymcn4HxuZ/cf+VVw6PyABFhfqZGZ/VEdu5IucpW29+CNgm9BshUo+iOhhTC4kYXhWLRjx2Yskge77JPDDQT+FgckxgaBFLVJBLew/Cf9LbKeFlfqZqTBm7pfGZutm9icZbK/EVStoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761356093; c=relaxed/simple;
	bh=pNk2eQcmF8gALmMVJYfYlcM/YWYjpysjSxeYKObECnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNA/qV/ifavVqTQEIron9X933UbMMEJxCBJ64pY3X5rHSKcZV3+8L2AHnSVOR1X3Xt4QYlu9tJ6leZGXRwQ+1jmiLd6anFwC7PcBdi0J7RadLOP09n5H6YbzvO6v2bt+lduiR2bkkOTzcWBOe/KHjC0KEZLbtg4JxjizqW6mMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ke4Yx4tZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ke4Yx4tZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761356092; x=1792892092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNk2eQcmF8gALmMVJYfYlcM/YWYjpysjSxeYKObECnQ=;
  b=Ke4Yx4tZJOr+VorpyAG4tHXkCzuDV/1IKfrjeI9GoIHdvWysOF58vttL
   CjK1vHzNNuHUqn6KwQPlOnsCnvciQjkuTlQuIgHd849WHejfJaYQxCzvW
   9FA2DJalh2HhfudCwSf9YinQms+siZniOuBGdet6igVm4v3wjPyYgH3I6
   +g9W6nmRKMhXLd0bBOe/yjD6sF/oL+fvs3T0EF4QEgNHym0HIHvkKoI6Q
   n0OQWd525wXiT+SAVlX3C+0gvssNn8vS7610XgIn+nXQD00EpHM6b8RmN
   50v5xEPJnToyrXkGVWEBWlXQ4iV0wb/IATMT3EcsghnJH8SepiTghP/On
   w==;
X-CSE-ConnectionGUID: Q/vHYCsdSoeIyWepdPSWZw==
X-CSE-MsgGUID: PaneN92YQ3i3MZbm3YRoaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73824727"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="73824727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:34:51 -0700
X-CSE-ConnectionGUID: DIgWjFG3RDGEIPUgbyhNlg==
X-CSE-MsgGUID: C/Qh9VC8QpO68bfNQz1Kfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="215471659"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2025 18:34:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCTB5-000F2s-3A;
	Sat, 25 Oct 2025 01:34:45 +0000
Date: Sat, 25 Oct 2025 09:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: sound/hda/codecs/side-codecs/cs35l56_hda.c:256:20: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202510251128.xebXo49K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/hda/codecs/side-codecs/cs35l56_hda.c:256:20: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   53abe3e1c154628cc74e33a1bfcd865656e433a5
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 ALSA: hda: Move codec drivers into sound/hda/codecs directory
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r123-20251024 (https://download.01.org/0day-ci/archive/20251025/202510251128.xebXo49K-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251128.xebXo49K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251128.xebXo49K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/hda/codecs/side-codecs/cs35l56_hda.c:256:20: sparse: sparse: unsigned value that used to be signed checked against zero?
   sound/hda/codecs/side-codecs/cs35l56_hda.c:252:29: sparse: signed value source

vim +256 sound/hda/codecs/side-codecs/cs35l56_hda.c

73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  247  
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  248  static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  249  				   struct snd_ctl_elem_value *ucontrol)
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  250  {
483dd12dbe34c6 sound/pci/hda/cs35l56_hda.c Kuninori Morimoto 2025-05-07  251  	struct cs35l56_hda *cs35l56 = snd_kcontrol_chip(kcontrol);
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  252  	unsigned long pos = ucontrol->value.integer.value[0];
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  253  	bool changed;
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  254  	int ret;
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  255  
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21 @256  	if ((pos < CS35L56_MAIN_POSTURE_MIN) ||
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  257  	    (pos > CS35L56_MAIN_POSTURE_MAX))
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  258  		return -EINVAL;
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  259  
634f3b4e7dde38 sound/pci/hda/cs35l56_hda.c Simon Trimmer     2024-06-18  260  	cs35l56_hda_wait_dsp_ready(cs35l56);
634f3b4e7dde38 sound/pci/hda/cs35l56_hda.c Simon Trimmer     2024-06-18  261  
a3ec669efcee2c sound/pci/hda/cs35l56_hda.c Stefan Binding    2025-04-07  262  	ret = regmap_update_bits_check(cs35l56->base.regmap, cs35l56->base.fw_reg->posture_number,
a3ec669efcee2c sound/pci/hda/cs35l56_hda.c Stefan Binding    2025-04-07  263  				       CS35L56_MAIN_POSTURE_MASK, pos, &changed);
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  264  	if (ret)
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  265  		return ret;
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  266  
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  267  	return changed;
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  268  }
73cfbfa9caea8e sound/pci/hda/cs35l56_hda.c Simon Trimmer     2023-07-21  269  

:::::: The code at line 256 was first introduced by commit
:::::: 73cfbfa9caea8eda54b4c6e49a9555533660aa1e ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
