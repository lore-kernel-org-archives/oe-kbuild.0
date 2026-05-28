Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A93E5EC7
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969566; cv=none; b=LxylnhZO4AahmxLdkWh9YiR+2IMoSBJCE6bOstq+WNUjKNea6cWQNlzhxxvwI7hr/+DUVWmqyA8VRsavEI6rPpHF4uhB2cnPAgQiB/zKkxir6w+viPahxP0GQtfMqRW52v4WwhQhJztizJFshWl28qkfy9juIfTqwpaUXN3/dcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969566; c=relaxed/simple;
	bh=Kjvbx+ApisitLilYfwzJuTlN7aAznKHAOjpYmN/Xrn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mAI/fIfKp/F+hyBmBzBWyVq8GAMPRp+OMvo9XEcVc4grt+AewX/Ef4RBz/E6p6BuK1XI75ZAp9zlRy7XMt7fZQ5nR+KoYaNCYBMQNK2prQ7Sxpz97AWT7qwcO11wriZz54owvKT2ZGdjQCrKH0aYyfvn08Vnbb+Wn/woTomyXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTGcvZ+l; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTGcvZ+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779969565; x=1811505565;
  h=date:from:to:cc:subject:message-id;
  bh=Kjvbx+ApisitLilYfwzJuTlN7aAznKHAOjpYmN/Xrn4=;
  b=RTGcvZ+lJAK1wI2EwMWBH0FeeLt+I0SKwocFIUHs9OKMCYiAce8mM2rN
   hRJ7q/mJk0okSiFNsivO1Y9LZICTAk94e6algbOXwX37rQMwSDOvJ6n+E
   HmQL3zsxAStpPMPApf8tB9zqoVxMZRJdjQRIFd/t1B/MfTze01e+7OfKP
   PUsvC7AtMgKSnPM2IK3RwnVqS/kRO2DgZXbVNU3p6JhgmhS2JgupSpz4I
   DLyReFFxqYAWd4f3iejHQ8IN9xfMqZ3YwbpR6tVhQe3k+N9EoLCTjdIeD
   Y2rqZsYALt21UnDGc43DqEDJYfS8FbxYlThG8LGFUNoI7XK5XcWw5AbDU
   w==;
X-CSE-ConnectionGUID: PiPhTHPJSs+lIB59dsupLw==
X-CSE-MsgGUID: WGA9/JX2RMavzJYnHr7O6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80709784"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80709784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:59:24 -0700
X-CSE-ConnectionGUID: jvImOPlJSIGgXYq8egeQSw==
X-CSE-MsgGUID: q9Q/9G51TYCLD7Cv8izJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246810398"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2026 04:59:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSZOR-000000005w8-3O6L;
	Thu, 28 May 2026 11:59:19 +0000
Date: Thu, 28 May 2026 19:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5457/8766]
 sound/soc/tegra/tegra210_mixer.c:219 tegra210_mixer_put_fade_duration() warn:
 impossible condition '(duration > 2147483647) => (33-s32max > s32max)'
Message-ID: <202605281937.XRgXhSMV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sheetal <sheetal@nvidia.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7d700e14934e68f86338c5610cf2ae76798b663
commit: 75a3e43339a2e66605deb8e726bb5d6372b1798a [5457/8766] ASoC: tegra: tegra210-mixer: Reject too-short fade durations
:::::: branch date: 21 hours ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-r072-20260527 (https://download.01.org/0day-ci/archive/20260528/202605281937.XRgXhSMV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281937.XRgXhSMV-lkp@intel.com/

smatch warnings:
sound/soc/tegra/tegra210_mixer.c:219 tegra210_mixer_put_fade_duration() warn: impossible condition '(duration > 2147483647) => (33-s32max > s32max)'

vim +219 sound/soc/tegra/tegra210_mixer.c

36645381b864b5 Sheetal 2026-05-06  207  
36645381b864b5 Sheetal 2026-05-06  208  static int tegra210_mixer_put_fade_duration(struct snd_kcontrol *kcontrol,
36645381b864b5 Sheetal 2026-05-06  209  					    struct snd_ctl_elem_value *ucontrol)
36645381b864b5 Sheetal 2026-05-06  210  {
36645381b864b5 Sheetal 2026-05-06  211  	struct soc_mixer_control *mc =
36645381b864b5 Sheetal 2026-05-06  212  		(struct soc_mixer_control *)kcontrol->private_value;
36645381b864b5 Sheetal 2026-05-06  213  	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
36645381b864b5 Sheetal 2026-05-06  214  	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
36645381b864b5 Sheetal 2026-05-06  215  	unsigned int id = mc->reg;
75a3e43339a2e6 Sheetal 2026-05-19  216  	long duration = ucontrol->value.integer.value[0];
36645381b864b5 Sheetal 2026-05-06  217  
75a3e43339a2e6 Sheetal 2026-05-19  218  	if (duration < (long)TEGRA210_MIXER_FADE_DURATION_MIN ||
75a3e43339a2e6 Sheetal 2026-05-19 @219  	    duration > TEGRA210_MIXER_FADE_DURATION_MAX)
36645381b864b5 Sheetal 2026-05-06  220  		return -EINVAL;
36645381b864b5 Sheetal 2026-05-06  221  
36645381b864b5 Sheetal 2026-05-06  222  	if (mixer->duration[id] == duration)
36645381b864b5 Sheetal 2026-05-06  223  		return 0;
36645381b864b5 Sheetal 2026-05-06  224  
36645381b864b5 Sheetal 2026-05-06  225  	mixer->duration[id] = duration;
36645381b864b5 Sheetal 2026-05-06  226  	mixer->fade_pending[id] = true;
36645381b864b5 Sheetal 2026-05-06  227  
36645381b864b5 Sheetal 2026-05-06  228  	return 1;
36645381b864b5 Sheetal 2026-05-06  229  }
36645381b864b5 Sheetal 2026-05-06  230  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
