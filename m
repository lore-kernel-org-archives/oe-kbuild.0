Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095D3C1D7B
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510609; cv=none; b=R2DYNrFmYICzuNp6ETAch8gac/W1SWgwMRrHzxc9Y/MKFOgXMPtQHxB3UBr8ptbxjThP2t9JWse5yjR4lexq9FR2+6k051HEsoQQY+lgvxNbjMqvz/V53/MQGt6MTsYhfLlzuAabTCxFRqUJt6QUrxos8CFtuqvS03M6ixug9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510609; c=relaxed/simple;
	bh=eslsfZOCLO+x/gxS6tr04H+c0BlNkkkPLTAe9WKM8k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kHiMVd7dE3QhIDsp3Zs2eWyf3xAyAADQPBxS1JciLSPjGMpgkP5GFOcD4pUp8bqorZf2WSykkskZ1w0D1uMnwh5QBP1bqRibhNTCZcCo4SN0pNZIb7j+A7IjKuvXHyXCR7Pa2bf2FaCnrTKhp2CSYcmyhZpkSsXbE8E4SxX8M4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+ryGuMk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+ryGuMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790510607; x=1822046607;
  h=date:from:to:cc:subject:message-id;
  bh=eslsfZOCLO+x/gxS6tr04H+c0BlNkkkPLTAe9WKM8k0=;
  b=S+ryGuMkwsCLNo5KFkUgYejAe/m/zpHUJFzwyvhw2epqBT5MUg2ZBZla
   Di4VLnQj1m+IHDCnQWPPk+gyo2Ek8AG7aSlvLQu5RcgcTz/xyA6wjCDQV
   i08nK6rJYgypTqyPnInJdh+zZrqcwxctmSAWm6Yxd8u9EBZd17YEvR50s
   UsWuQaMBOPnppFS0rX6cR9HYzd1B90kl1XnxckWYsspmCYaQTvrtn1+nk
   i4FMAO9rbddkEcgNtaMJxpGoVBwLH/DaVym6mg2+lfnKvHXHtK3shbzQo
   OO+GV/OtcJFnaO0XhuCsE98Pu8CIC2Kdl6/bC+W91ZIPp9KLTiZ3p70g9
   Q==;
X-CSE-ConnectionGUID: YlmF5m+eTCKqxVRKRH6diw==
X-CSE-MsgGUID: 4FdtaixkSq+UclniAiKBmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116758931"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="116758931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:03:26 -0700
X-CSE-ConnectionGUID: VkejHZqITJGGpY8lMvHy3Q==
X-CSE-MsgGUID: RE+TamBYTbmropBKwqSPFg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2026 05:03:25 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAnbG-000000000ZN-1zlX;
	Sun, 27 Sep 2026 12:03:22 +0000
Date: Sun, 27 Sep 2026 14:02:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
Message-ID: <202609271355.u0pymQoF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/

New smatch warnings:
sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

Old smatch warnings:
sound/soc/sof/amd/acp.c:663 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
sound/soc/sof/amd/acp.c:666 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
sound/soc/sof/amd/acp.c:1472 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3

vim +1469 sound/soc/sof/amd/acp.c

78d99c2c5eee0f Vijendar Mukunda 2026-07-01  1439  
be2823854e0055 Vijendar Mukunda 2026-09-10  1440  static void handle_amd_sof_acp7x_sdw_pme_event(struct snd_sof_dev *sdev)
be2823854e0055 Vijendar Mukunda 2026-09-10  1441  {
be2823854e0055 Vijendar Mukunda 2026-09-10  1442  	struct acp_dev_data *adata;
be2823854e0055 Vijendar Mukunda 2026-09-10  1443  	struct amd_sdw_manager *amd_manager;
be2823854e0055 Vijendar Mukunda 2026-09-10  1444  	u32 sdw_pme_stat;
be2823854e0055 Vijendar Mukunda 2026-09-10  1445  	u32 sdw_wake_en;
be2823854e0055 Vijendar Mukunda 2026-09-10  1446  	u32 pme_reg;
be2823854e0055 Vijendar Mukunda 2026-09-10  1447  	u32 wake_mask;
be2823854e0055 Vijendar Mukunda 2026-09-10  1448  	unsigned int instance;
be2823854e0055 Vijendar Mukunda 2026-09-10  1449  
be2823854e0055 Vijendar Mukunda 2026-09-10  1450  	adata = sdev->pdata->hw_pdata;
be2823854e0055 Vijendar Mukunda 2026-09-10  1451  	if (!adata->sdw)
be2823854e0055 Vijendar Mukunda 2026-09-10  1452  		return;
be2823854e0055 Vijendar Mukunda 2026-09-10  1453  
be2823854e0055 Vijendar Mukunda 2026-09-10  1454  	for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
be2823854e0055 Vijendar Mukunda 2026-09-10  1455  		pme_reg = ACP7X_SW_PME_STS + (instance * 4);
be2823854e0055 Vijendar Mukunda 2026-09-10  1456  		wake_mask = ACP7X_SW_WAKE_EN_MASK << instance;
be2823854e0055 Vijendar Mukunda 2026-09-10  1457  
be2823854e0055 Vijendar Mukunda 2026-09-10  1458  		sdw_pme_stat = snd_sof_dsp_read(sdev, ACP_DSP_BAR, pme_reg);
be2823854e0055 Vijendar Mukunda 2026-09-10  1459  		if (!sdw_pme_stat)
be2823854e0055 Vijendar Mukunda 2026-09-10  1460  			continue;
be2823854e0055 Vijendar Mukunda 2026-09-10  1461  
be2823854e0055 Vijendar Mukunda 2026-09-10  1462  		mutex_lock(&adata->acp_lock);
be2823854e0055 Vijendar Mukunda 2026-09-10  1463  		sdw_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN);
be2823854e0055 Vijendar Mukunda 2026-09-10  1464  		sdw_wake_en &= ~wake_mask;
be2823854e0055 Vijendar Mukunda 2026-09-10  1465  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN, sdw_wake_en);
be2823854e0055 Vijendar Mukunda 2026-09-10  1466  		mutex_unlock(&adata->acp_lock);
be2823854e0055 Vijendar Mukunda 2026-09-10  1467  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, pme_reg, sdw_pme_stat);
be2823854e0055 Vijendar Mukunda 2026-09-10  1468  
be2823854e0055 Vijendar Mukunda 2026-09-10 @1469  		if (!adata->sdw->pdev[instance])
be2823854e0055 Vijendar Mukunda 2026-09-10  1470  			continue;
be2823854e0055 Vijendar Mukunda 2026-09-10  1471  
be2823854e0055 Vijendar Mukunda 2026-09-10  1472  		amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
be2823854e0055 Vijendar Mukunda 2026-09-10  1473  		if (amd_manager)
be2823854e0055 Vijendar Mukunda 2026-09-10  1474  			pm_request_resume(amd_manager->dev);
be2823854e0055 Vijendar Mukunda 2026-09-10  1475  	}
be2823854e0055 Vijendar Mukunda 2026-09-10  1476  }
be2823854e0055 Vijendar Mukunda 2026-09-10  1477  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
