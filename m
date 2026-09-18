Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98C13AAF43
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722021; cv=none; b=MRMmQG/oDlxAaz8jWT4zOvXjdmOi4ep8eXN0GA9wSWTnOp9nckoQQPHSA1Ko7/VH4fejeAZuVYbcAaRDcDXt9wN/TCoyW86Kq8wKqXYXwzfZcWeJaQTzs2fO/ZC/toACgWIAPtg4mq+D39MVBbCwtYeeK5Hiypr5GYGUNmL8BSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722021; c=relaxed/simple;
	bh=jUk1furSjM2Ko0vkSUBJeJwUVgN/3vbbeUCs9rvdQ2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrHCsSiQyqsZvOqq2cB5x2QDiXPUVQL8Or8EUo+652JZmM1FY1O/Fz1xrF5vzd47aaqBSgBmudyP++I/kW4niJOQCrohByphb4aCtrcQhlFYmBeVtFVNhWE696PHZtGgPwl0YnrgiDGyguO08+jJqjwWmmHjViQ9mxtL8zE+Pj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMjCJtAS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMjCJtAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789722019; x=1821258019;
  h=date:from:to:cc:subject:message-id;
  bh=jUk1furSjM2Ko0vkSUBJeJwUVgN/3vbbeUCs9rvdQ2E=;
  b=GMjCJtAS2Wz64pR69Jhw47mc30t3VsWK7WLAVhAL3AFyqSfyXvXe7Qms
   1cWKqj+VAC4Iien63Rzs2tLosGPjVeGJdxfEQ5BgtoEFkJ2o34ZXx8uYM
   UVY6hy+1K7pye4xlqt3GVm2YwulJfuf5s4XxVJCbSmJXHFxT9uLPG/QQ5
   zZ/Vf5nRCXrC6y2Yl7lbpa2wQnR3kDCTrZpbLQWOtjqV/3y0mnpUR5+TO
   tTPDGfTAJqohUfJ27UfyQ9ibf4svDRXjOq6okG5NSLLuTQJsPafXpedm1
   tQDs+Qj7ZWjb2N/Ih8JlZySGe2c9D9MM9Y49h2NMOqHLNtM0VQkkwcuvk
   g==;
X-CSE-ConnectionGUID: C7TBtkllSCuZAhf70uGPPw==
X-CSE-MsgGUID: 9C0hiSeLTAe+cbzsZprhrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77777955"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77777955"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:00:18 -0700
X-CSE-ConnectionGUID: zwbdRaJrQSaoK6mzRtodhg==
X-CSE-MsgGUID: 7fpm9YAXTs+lXF7e6+Saqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2714378"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 02:00:17 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7US7-0000000012n-0IYQ;
	Fri, 18 Sep 2026 09:00:15 +0000
Date: Fri, 18 Sep 2026 10:59:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/tegra/tegra210_mixer.c:219
 tegra210_mixer_put_fade_duration() warn: impossible condition '(duration >
 2147483647) => (33-s32max > s32max)'
Message-ID: <202609181038.pjKojVh3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sheetal <sheetal@nvidia.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dd1818b15d98d4a20806cd00b1b40320b06004f
commit: 75a3e43339a2e66605deb8e726bb5d6372b1798a ASoC: tegra: tegra210-mixer: Reject too-short fade durations
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-r2200-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181038.pjKojVh3-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 75a3e43339a2 ("ASoC: tegra: tegra210-mixer: Reject too-short fade durations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609181038.pjKojVh3-lkp@intel.com/

New smatch warnings:
sound/soc/tegra/tegra210_mixer.c:219 tegra210_mixer_put_fade_duration() warn: impossible condition '(duration > 2147483647) => (33-s32max > s32max)'

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

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
