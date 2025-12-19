Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7533A71F
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150490; cv=none; b=JeY0FRgbxos6z3t7IYyfLMky6WQvZIFLqTjqHy13Gk3AEVZn6tF3/P3yEI1As+dna3aNmWJN69tDXrvJIKfrf7VIu/CzaLEeHMKOBko0FUj9loDeemUyg9LyNK0BvGD7KGLbBlkD7S5J2BpAokxLW3P6WMCcb8JXrJ2Y+OESBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150490; c=relaxed/simple;
	bh=vFTUlx4nn9r75VVz5adJSSK8Da4ncV09jVaW8QyiwoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrrZZKhXDDnb8GbfaD8QLIi17Ijar80gwW1WgYr9hyRVyzeXr93BZxCMd7I4I5jyHLW+rgWf2i2DLyOXIP89CebtyPkKZScQnO3EQ3AXaJOrMnMOXv4Q2JBgDl2nxCtvgXXOvHptcDXlbV0YqUBKhh0SI6tJy6FSLnaxVu2BEFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LewKkC0T; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LewKkC0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766150489; x=1797686489;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vFTUlx4nn9r75VVz5adJSSK8Da4ncV09jVaW8QyiwoE=;
  b=LewKkC0TZKR9BMl+XyoM7pmzfWVz7GBlYcPHcr7kcnqA1Kbed4+Vx+cJ
   IT4OHryv1MMsM+qIjHJT0Y7RBDGRKqasPTUzniq8YE8r25rOjC++v02Fb
   PdwF8aGZcYV32Hq2jQKZSi8YaDguXSd65h16alQZ1scS/yh1wsfSGuWQx
   cwchfBhtVy2QUfSPW7NZDDDxz8COIdN16Wr0nQ34o+geXUyfw0o2EKwqu
   XG3UHrAj8w5ZMd21BFnthBFX61V0mBItmof0ouT3Tae8EYVsElzZpXUTb
   k1ZxE9ue6RwR+w9sY9j8OSSS19STL490OsPOAOdE/lNkPz0dRMI/No/dF
   w==;
X-CSE-ConnectionGUID: xTma7x+MSp6y4WfJifnBAA==
X-CSE-MsgGUID: VHrmRVb4SOmuTkBwgkmD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68263636"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68263636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 05:21:27 -0800
X-CSE-ConnectionGUID: HptYR4w8SZakEVp4J9G0Hw==
X-CSE-MsgGUID: oMZoTirEQIWq4O7vQh814g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="236284597"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2025 05:21:26 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWaQ7-000000003a3-262Z;
	Fri, 19 Dec 2025 13:21:23 +0000
Date: Fri, 19 Dec 2025 21:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/board_selection.c:497
 avs_register_i2s_test_board() warn: excess argument passed to
 'devm_kasprintf'
Message-ID: <202512192112.PWnHFxgV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 7d859189de13f06fdc511761c745f3b302bed7b6 ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r073-20251215 (https://download.01.org/0day-ci/archive/20251219/202512192112.PWnHFxgV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512192112.PWnHFxgV-lkp@intel.com/

smatch warnings:
sound/soc/intel/avs/board_selection.c:497 avs_register_i2s_test_board() warn: excess argument passed to 'devm_kasprintf'

vim +/devm_kasprintf +497 sound/soc/intel/avs/board_selection.c

beed983621fbdf Cezary Rojewski    2022-05-16  486  
7d859189de13f0 Amadeusz Sławiński 2025-04-04  487  static int avs_register_i2s_test_board(struct avs_dev *adev, int ssp_port, int tdm_slot)
beed983621fbdf Cezary Rojewski    2022-05-16  488  {
beed983621fbdf Cezary Rojewski    2022-05-16  489  	struct snd_soc_acpi_mach *mach;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  490  	int tdm_mask = BIT(tdm_slot);
7d859189de13f0 Amadeusz Sławiński 2025-04-04  491  	unsigned long *tdm_cfg;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  492  	char *tplg_name;
beed983621fbdf Cezary Rojewski    2022-05-16  493  	int ret;
beed983621fbdf Cezary Rojewski    2022-05-16  494  
7d859189de13f0 Amadeusz Sławiński 2025-04-04  495  	mach = devm_kzalloc(adev->dev, sizeof(*mach), GFP_KERNEL);
7d859189de13f0 Amadeusz Sławiński 2025-04-04  496  	tdm_cfg = devm_kcalloc(adev->dev, ssp_port + 1, sizeof(unsigned long), GFP_KERNEL);
7d859189de13f0 Amadeusz Sławiński 2025-04-04 @497  	tplg_name = devm_kasprintf(adev->dev, GFP_KERNEL, AVS_STRING_FMT("i2s", "-test-tplg.bin",
7d859189de13f0 Amadeusz Sławiński 2025-04-04  498  				   ssp_port, tdm_slot));
7d859189de13f0 Amadeusz Sławiński 2025-04-04  499  	if (!mach || !tdm_cfg || !tplg_name)
7d859189de13f0 Amadeusz Sławiński 2025-04-04  500  		return -ENOMEM;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  501  
7d859189de13f0 Amadeusz Sławiński 2025-04-04  502  	mach->drv_name = "avs_i2s_test";
7d859189de13f0 Amadeusz Sławiński 2025-04-04  503  	mach->mach_params.i2s_link_mask = AVS_SSP(ssp_port);
7d859189de13f0 Amadeusz Sławiński 2025-04-04  504  	tdm_cfg[ssp_port] = tdm_mask;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  505  	mach->pdata = tdm_cfg;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  506  	mach->tplg_filename = tplg_name;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  507  
7d859189de13f0 Amadeusz Sławiński 2025-04-04  508  	ret = avs_register_i2s_board(adev, mach);
7d859189de13f0 Amadeusz Sławiński 2025-04-04  509  	if (ret < 0) {
7d859189de13f0 Amadeusz Sławiński 2025-04-04  510  		dev_warn(adev->dev, "register i2s %s failed: %d\n", mach->drv_name, ret);
7d859189de13f0 Amadeusz Sławiński 2025-04-04  511  		return ret;
7d859189de13f0 Amadeusz Sławiński 2025-04-04  512  	}
7d859189de13f0 Amadeusz Sławiński 2025-04-04  513  
beed983621fbdf Cezary Rojewski    2022-05-16  514  	return 0;
beed983621fbdf Cezary Rojewski    2022-05-16  515  }
beed983621fbdf Cezary Rojewski    2022-05-16  516  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
