Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6028EB
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731853664; cv=none; b=W1uMXQ4Y8b8MBBrwD+i8pX+19lZeuy03GyuP3+ssneP3dsQJxCBtkX77n+35tjsnPPArIsQ13fv4u1S07nSLMrFRh+RVPUOaZRmjIZR+dWuLkDudgroIXiNgkE4Q4b6wNbEVz0D55kdTxrihhUq5/lY5PNctZbWsYCk15kZr/QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731853664; c=relaxed/simple;
	bh=qa+0T1G9c2iAJb6/OhmCUjcs5VzCnmQRpE9Jkb3uWPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1X6OEZgpJYcgj9W5TAO2V1YHOOAuMIS+L6R+aD+wSQotXRDD1DiQfNuBWAUFNoUi0mB8nl/ztK4SyWmdBSljOu4FronKYOD0e1ewWVmA6EIPJccmtgx8SaRn+XzXa90tx4iTpa8+vWzMhPV+yvruxrOZX5X3U+KL5KpKYHEr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW6hHRcG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW6hHRcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731853662; x=1763389662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qa+0T1G9c2iAJb6/OhmCUjcs5VzCnmQRpE9Jkb3uWPI=;
  b=UW6hHRcGfa+58l/uWRkXsLGLER+9LQMIEfUNccuLR6KRehxjxCdJWLRf
   9N1e4VohCE/1TSJo9wHRKYe31XnI0l6oLyGt4hGPwXZ1yPlfM3XLYLKqL
   CEFSV+QTG9b3CmTcqF0QnDRbTlCyS3kPvvFCJBHcm/I/DG72OAgNA/LUz
   ktTJxH11I0q1sQeCiShY1qfBXgqAZpT6emQrDpRHyFv5Oa8YgWRDob4q1
   5V5q5+GRpNyQiUxa68TKWgT/+zC2x3L2qgIZWPyNRbNNzWFHx8bgO3Sr2
   R2mIOUvuLQa/3ztXwwrRct17mTucNLJ4oIApAgYfqNck9oAKYSeLbDUxT
   g==;
X-CSE-ConnectionGUID: Et0xkaFvRPWUg3gVDdgjfw==
X-CSE-MsgGUID: aND8hs4IR2qCMY/pQ0ME3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35730745"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35730745"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 06:27:41 -0800
X-CSE-ConnectionGUID: 9+T5W+2mQx2RfUKA6Ig0RQ==
X-CSE-MsgGUID: HAcfznMKR4qwMopCXfoL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89403975"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2024 06:27:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCgFV-0001nV-31;
	Sun, 17 Nov 2024 14:27:37 +0000
Date: Sun, 17 Nov 2024 22:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error:
 uninitialized symbol 'pdm_addr'.
Message-ID: <202411172217.GYwLWCUO-lkp@intel.com>
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
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: 09068d624c490c0e89f33f963c402f1859964467 ASoC: amd: acp: fix for acp platform device creation failure
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241117/202411172217.GYwLWCUO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411172217.GYwLWCUO-lkp@intel.com/

smatch warnings:
sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error: uninitialized symbol 'pdm_addr'.

vim +/pdm_addr +467 sound/soc/amd/acp/acp-legacy-common.c

3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  438  
09068d624c490c Vijendar Mukunda 2024-05-02  439  void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
09068d624c490c Vijendar Mukunda 2024-05-02  440  {
09068d624c490c Vijendar Mukunda 2024-05-02  441  	struct acpi_device *pdm_dev;
09068d624c490c Vijendar Mukunda 2024-05-02  442  	const union acpi_object *obj;
09068d624c490c Vijendar Mukunda 2024-05-02  443  	u32 pdm_addr;
09068d624c490c Vijendar Mukunda 2024-05-02  444  
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  445  	switch (chip->acp_rev) {
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  446  	case ACP3X_DEV:
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  447  		pdm_addr = ACP_RENOIR_PDM_ADDR;
09068d624c490c Vijendar Mukunda 2024-05-02  448  		check_acp3x_config(chip);
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  449  		break;
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  450  	case ACP6X_DEV:
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  451  		pdm_addr = ACP_REMBRANDT_PDM_ADDR;
09068d624c490c Vijendar Mukunda 2024-05-02  452  		check_acp6x_config(chip);
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  453  		break;
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  454  	case ACP63_DEV:
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  455  		pdm_addr = ACP63_PDM_ADDR;
09068d624c490c Vijendar Mukunda 2024-05-02  456  		check_acp6x_config(chip);
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  457  		break;
e84db124cb2158 Syed Saba Kareem 2023-10-21  458  	case ACP70_DEV:
e84db124cb2158 Syed Saba Kareem 2023-10-21  459  		pdm_addr = ACP70_PDM_ADDR;
09068d624c490c Vijendar Mukunda 2024-05-02  460  		check_acp70_config(chip);
e84db124cb2158 Syed Saba Kareem 2023-10-21  461  		break;
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  462  	default:
09068d624c490c Vijendar Mukunda 2024-05-02  463  		break;
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  464  	}
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  465  
09068d624c490c Vijendar Mukunda 2024-05-02  466  	if (chip->is_pdm_config) {
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21 @467  		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  468  		if (pdm_dev) {
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  469  			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  470  						   ACPI_TYPE_INTEGER, &obj) &&
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  471  						   obj->integer.value == pdm_addr)
09068d624c490c Vijendar Mukunda 2024-05-02  472  				chip->is_pdm_dev = true;
09068d624c490c Vijendar Mukunda 2024-05-02  473  		}
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  474  	}
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  475  }
09068d624c490c Vijendar Mukunda 2024-05-02  476  EXPORT_SYMBOL_NS_GPL(check_acp_config, SND_SOC_ACP_COMMON);
3a94c8ad0aae2b Syed Saba Kareem 2023-10-21  477  

:::::: The code at line 467 was first introduced by commit
:::::: 3a94c8ad0aae2b14a55059869871ea2d199af489 ASoC: amd: acp: add code for scanning acp pdm controller

:::::: TO: Syed Saba Kareem <Syed.SabaKareem@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
