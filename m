Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101734503B
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752774798; cv=none; b=IN1AhKjutwAbAMnafaoAkiewpxIwJ3o51hUYAZ8jBO7gbVPvQHpgUj+eHWAEsdjpJfvz3D+RzT9Wjogy2vOf7iDtVpp+QPoe3+NROILL54PCPoU84H+SAmr6PrehmeOe/P4UuaK3fmdL+3OPruJksOd6KGjxlzNYQd7HKuqtyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752774798; c=relaxed/simple;
	bh=2YQgLOgxoW3ocm5w82m1RNpJxtRC7+cCCeJgDaHVSVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktB5Bs5IhDbizxSAf5SGPNTmNssCDKO5wVVgVacQ9eYZroYQtn/HSu1eW4d5uUcZZHcLMbQ+hh2NRlRZVgkIQKJFbn97MpibUyPDDGWU4sGBQrHL+osZgiH8Ya1W1hG1ju27deyqQoL2F8OWQUMORU5wDybDgm3vF8Baqs9hd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSM9byYY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSM9byYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752774797; x=1784310797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2YQgLOgxoW3ocm5w82m1RNpJxtRC7+cCCeJgDaHVSVo=;
  b=fSM9byYYkyAriW7H+ov9EllkvaM444jIQurJ/+zNXfNc+oxaf0igxEV9
   UCRVwYbxaLL0Lp4m4dEFt5TVfYqNIIeBvgRBs+FQk0LU3tRDP7huiD6P/
   OZi1WYtmoFcZFqN8oB3eHtvkfHmaezvSy2yCqT1mOH4qC5ryb13xaYJ1Q
   xifTEq0deaVW1oSq9r/jwYl8YTFVyyDgoxOQPEgifSYtbq75j8JtdH9gk
   hMAldRck0HgQnf1XxJOJj6bim25rCOk4TNw3Lxxsm61M7WKpTjbpMilEy
   s1hin5iF1uylJbo8CZlTEwPoCW560tOQRlkEGGITYNtDQviTb+U0DIXRr
   g==;
X-CSE-ConnectionGUID: kuSLebr7REGPXL1vsGVP5g==
X-CSE-MsgGUID: HoO0Aq8JSAaRFzWgwhhaZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72517937"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="72517937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:53:16 -0700
X-CSE-ConnectionGUID: hwsnwQ+sQ8qG9KQb4YFA7g==
X-CSE-MsgGUID: 11LstuacSeeuWGcbQ2YtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="181571420"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2025 10:53:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucSnA-000DuR-0I;
	Thu, 17 Jul 2025 17:53:12 +0000
Date: Fri, 18 Jul 2025 01:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8249/10823] sound/hda/codecs/hdmi/hdmi.c:378
 hdmi_eld_ctl_get() warn: calling memset(x, y, ARRAY_SIZE());
Message-ID: <202507180118.3tzqvu2y-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 6014e9021b28e634935c776c0271b5cbcabdc5d6 [8249/10823] ALSA: hda: Move codec drivers into sound/hda/codecs directory
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180118.3tzqvu2y-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507180118.3tzqvu2y-lkp@intel.com/

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
