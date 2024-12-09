Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512E19B3EE
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733787660; cv=none; b=S3Ng/9E3odApihg4IgP/cuolsYvSbBsZUu22u5lxWvyZ9xUjWS0dGEY1Ax5g25ZqObyXdCmo0uiB9AtAmXXUllwv65BJDC38j5AKDbQlNVoxwwk896xYuO8kiAXC7ru1SSgakDcbM9t3GHfUsrBcuATqCbeR5EJYL/J0qARmxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733787660; c=relaxed/simple;
	bh=9sjbw6SdsOrwbsUjyLELaFS8AzTViqvAi53z9T2InB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUFCsOuQ0rPEhhwJqt52Xm5dxps2ArFcGnG7j5fb6sy69eYHWuFIdH40Li1rqPHxuB0bNgMgdH2EHRCTK0X+Lv00ORc2jutE5bEqQfkec3v4pp+7LQk/aZM8Ko67yAZb+e88uwhaXb4HJjQIQpzkqjgH6/Oa2d/CmISpFn1tBxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh8M2FWA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh8M2FWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733787658; x=1765323658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9sjbw6SdsOrwbsUjyLELaFS8AzTViqvAi53z9T2InB4=;
  b=Nh8M2FWASqyX5vzCLxBFiqNOxGszdEphb8Xv2gJQY1VY187yTSBzjn2n
   uZU/Hxvbb2ToEd3Ayw/EInGUTowOVRsryWEfY0kw4mDdPR8ERkVm5hN3d
   sPdZzCD+uz7Bs25Hd0LD2kO48Zz+Ru/0cuRw7A+ZmGA1VeW2cO2JlulwZ
   z0sGDFgJR/BeC29gQafE/1/PPxPv1DAU06S4pyzXP/auS96elbkBadhJo
   YBiSaLrO24z+2xfr8NMKpTMUttAZIIDJFfXSGKewXTDQiHLulfa/m7F2t
   vkZKg6tFbKX++J1zkHoTcoxpbZhDe7bTssPNYfg73Z0vZeAau5OCkzeAB
   w==;
X-CSE-ConnectionGUID: xl7uUTJhQjGfh8Oa+D42MQ==
X-CSE-MsgGUID: Pn+D6OR7T6KtHdkv3pcifQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34167542"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34167542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 15:40:58 -0800
X-CSE-ConnectionGUID: bGAQxlMaSEaoj9ziYUBh2A==
X-CSE-MsgGUID: T35qt7L9Sy2PJvqbzhC0vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100257351"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 15:40:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKnN0-0004vU-0g;
	Mon, 09 Dec 2024 23:40:54 +0000
Date: Tue, 10 Dec 2024 07:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error:
 uninitialized symbol 'pdm_addr'.
Message-ID: <202412100707.tLU9A8T8-lkp@intel.com>
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
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: 09068d624c490c0e89f33f963c402f1859964467 ASoC: amd: acp: fix for acp platform device creation failure
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241210/202412100707.tLU9A8T8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100707.tLU9A8T8-lkp@intel.com/

smatch warnings:
sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error: uninitialized symbol 'pdm_addr'.

vim +/pdm_addr +467 sound/soc/amd/acp/acp-legacy-common.c

3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  438  
09068d624c490c0 Vijendar Mukunda 2024-05-02  439  void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
09068d624c490c0 Vijendar Mukunda 2024-05-02  440  {
09068d624c490c0 Vijendar Mukunda 2024-05-02  441  	struct acpi_device *pdm_dev;
09068d624c490c0 Vijendar Mukunda 2024-05-02  442  	const union acpi_object *obj;
09068d624c490c0 Vijendar Mukunda 2024-05-02  443  	u32 pdm_addr;
09068d624c490c0 Vijendar Mukunda 2024-05-02  444  
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  445  	switch (chip->acp_rev) {
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  446  	case ACP3X_DEV:
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  447  		pdm_addr = ACP_RENOIR_PDM_ADDR;
09068d624c490c0 Vijendar Mukunda 2024-05-02  448  		check_acp3x_config(chip);
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  449  		break;
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  450  	case ACP6X_DEV:
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  451  		pdm_addr = ACP_REMBRANDT_PDM_ADDR;
09068d624c490c0 Vijendar Mukunda 2024-05-02  452  		check_acp6x_config(chip);
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  453  		break;
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  454  	case ACP63_DEV:
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  455  		pdm_addr = ACP63_PDM_ADDR;
09068d624c490c0 Vijendar Mukunda 2024-05-02  456  		check_acp6x_config(chip);
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  457  		break;
e84db124cb2158b Syed Saba Kareem 2023-10-21  458  	case ACP70_DEV:
e84db124cb2158b Syed Saba Kareem 2023-10-21  459  		pdm_addr = ACP70_PDM_ADDR;
09068d624c490c0 Vijendar Mukunda 2024-05-02  460  		check_acp70_config(chip);
e84db124cb2158b Syed Saba Kareem 2023-10-21  461  		break;
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  462  	default:
09068d624c490c0 Vijendar Mukunda 2024-05-02  463  		break;
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  464  	}
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  465  
09068d624c490c0 Vijendar Mukunda 2024-05-02  466  	if (chip->is_pdm_config) {
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21 @467  		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  468  		if (pdm_dev) {
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  469  			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  470  						   ACPI_TYPE_INTEGER, &obj) &&
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  471  						   obj->integer.value == pdm_addr)
09068d624c490c0 Vijendar Mukunda 2024-05-02  472  				chip->is_pdm_dev = true;
09068d624c490c0 Vijendar Mukunda 2024-05-02  473  		}
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  474  	}
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  475  }
09068d624c490c0 Vijendar Mukunda 2024-05-02  476  EXPORT_SYMBOL_NS_GPL(check_acp_config, SND_SOC_ACP_COMMON);
3a94c8ad0aae2b1 Syed Saba Kareem 2023-10-21  477  

:::::: The code at line 467 was first introduced by commit
:::::: 3a94c8ad0aae2b14a55059869871ea2d199af489 ASoC: amd: acp: add code for scanning acp pdm controller

:::::: TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
