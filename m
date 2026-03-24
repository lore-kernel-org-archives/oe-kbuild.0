Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4373F7881
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356855; cv=none; b=fMSJBy2tXh6bq389X/kytn0NQQ5ecgnDxh9suHYUpG2+2jFvDEjGIu6gBa34F3P2fZUxZaOIt49aDS0A6iPBSouLTMbUnb061B2g6zJHssqy6ugMDCzD8EQxHU0oZ6UJ2l/L0aaNNwqJAmP7QJWE1WNEy5Lg0NzEr+06D2g+eaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356855; c=relaxed/simple;
	bh=UVWUGHpWdYTisxRJu4u1OqdREgtnAhj6Hf5JmJICCWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=twvye0UC09c3ROiMdV+VByiTQbu24qu+9WfQiaPbjH3gMK26NcCYmCClmDUQiiWpmaaH9GRBJm9Ju5ife2Se7uuw2pYxrcVS/7xPdRndU/KB1DVsckfZzYGi0qJ63erjB0IeAXTTFVoLfLWRaaWKZAq0uFMYC/o+1Ry/mdZ96Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr4qvdmj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr4qvdmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356853; x=1805892853;
  h=date:from:to:cc:subject:message-id;
  bh=UVWUGHpWdYTisxRJu4u1OqdREgtnAhj6Hf5JmJICCWI=;
  b=Qr4qvdmjJaaiy9qPc5kPRU8a2AMLnCebHVSDaiV8CZohf+Qkc5pL2FqS
   0weqAhGMy+BRlWJo7dRvGYa9iUB08/gkz/muWCP5LHLQAHaqql02wAUta
   LZC/VOvbCZngJBqzn+8TR9UkzZ5ZMdnbXp5YBWPkVcKNo5Nx7gsTjTe7G
   +DR1Km1AEfFIOjYhgwbIecu8spaXkNOG56Zu57ykONF+zpIYCRPiGiXYL
   hu2UVd1bvamtutcm9n/GcIZFJQuGceZ65cYoeUfn3MK+53xyVTkMzqI4i
   Towro3dYoNzlorSh9n5k8+EyJzQZ45UeEbvmTHhIkOS3rqpxodhYTfjQ9
   A==;
X-CSE-ConnectionGUID: Zq4FEDKxTm+1CwEqKQCLTQ==
X-CSE-MsgGUID: WrvpFzIKSuuekUWb/bDvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79279085"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79279085"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:54:12 -0700
X-CSE-ConnectionGUID: xjEQfmNDTL+O7zjqJ7x3Jg==
X-CSE-MsgGUID: Fb4K4MGbRoW6PBeg9w4yXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224312699"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2026 05:54:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51Gq-000000004ZN-0Ecz;
	Tue, 24 Mar 2026 12:54:08 +0000
Date: Tue, 24 Mar 2026 20:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/codecs/hdmi/hdmi.c:378 hdmi_eld_ctl_get() warn:
 calling memset(x, y, ARRAY_SIZE());
Message-ID: <202603242001.1cmDCawX-lkp@intel.com>
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
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 ALSA: hda: Move codec drivers into sound/hda/codecs directory
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: s390-randconfig-r071-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242001.1cmDCawX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603242001.1cmDCawX-lkp@intel.com/

New smatch warnings:
sound/hda/codecs/hdmi/hdmi.c:378 hdmi_eld_ctl_get() warn: calling memset(x, y, ARRAY_SIZE());

Old smatch warnings:
sound/hda/codecs/hdmi/hdmi.c:391 hdmi_eld_ctl_get() warn: calling memset(x, y, ARRAY_SIZE());

vim +378 sound/hda/codecs/hdmi/hdmi.c

14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  362  
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  363  static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  364  			struct snd_ctl_elem_value *ucontrol)
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  365  {
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  366  	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  367  	struct hdmi_spec *spec = codec->spec;
a4e9a38b40a0e2 sound/pci/hda/patch_hdmi.c Takashi Iwai         2013-10-17  368  	struct hdmi_spec_per_pin *per_pin;
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  369  	struct hdmi_eld *eld;
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  370  	int pcm_idx;
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  371  	int err = 0;
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  372  
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  373  	pcm_idx = kcontrol->private_value;
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  374  	mutex_lock(&spec->pcm_lock);
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  375  	per_pin = pcm_idx_to_pin(spec, pcm_idx);
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  376  	if (!per_pin) {
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  377  		/* no pin is bound to the pcm */
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23 @378  		memset(ucontrol->value.bytes.data, 0,
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  379  		       ARRAY_SIZE(ucontrol->value.bytes.data));
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  380  		goto unlock;
fb087eaaef7206 sound/pci/hda/patch_hdmi.c Libin Yang           2016-02-23  381  	}
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  382  
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  383  	eld = &per_pin->sink_eld;
360a8245680053 sound/pci/hda/patch_hdmi.c David Henningsson    2016-02-05  384  	if (eld->eld_size > ARRAY_SIZE(ucontrol->value.bytes.data) ||
360a8245680053 sound/pci/hda/patch_hdmi.c David Henningsson    2016-02-05  385  	    eld->eld_size > ELD_MAX_SIZE) {
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  386  		snd_BUG();
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  387  		err = -EINVAL;
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  388  		goto unlock;
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  389  	}
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  390  
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  391  	memset(ucontrol->value.bytes.data, 0,
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  392  	       ARRAY_SIZE(ucontrol->value.bytes.data));
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  393  	if (eld->eld_valid)
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  394  		memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
68e03de9850706 sound/pci/hda/patch_hdmi.c David Henningsson    2013-02-19  395  		       eld->eld_size);
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  396  
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  397   unlock:
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  398  	mutex_unlock(&spec->pcm_lock);
f69548ffafcc49 sound/pci/hda/patch_hdmi.c Takashi Iwai         2018-07-12  399  	return err;
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  400  }
14bc52b8feaae6 sound/pci/hda/patch_hdmi.c Pierre-Louis Bossart 2011-09-30  401  

:::::: The code at line 378 was first introduced by commit
:::::: fb087eaaef72061b2bb4e35b70ab43865f541cad ALSA: hda - hdmi eld control created based on pcm

:::::: TO: Libin Yang <libin.yang@linux.intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
