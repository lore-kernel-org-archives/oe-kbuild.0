Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA251DB37A
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470626; cv=none; b=pNdDWsTot1yyQ2BliXgXeKCDI2vb7Z4cjrsxp76HAgqNDC/+jlqn/KANMPWUpW4GaawkhOnfAgEWu6BgB8KD8t4FPJd6HdaTdDLGuc7iAdmXatgoU+5BgDKGNNSGEzCydEnri58CxlkEQTvlzk1p3vzqH2SWmiDAmSgifELLWn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470626; c=relaxed/simple;
	bh=sSHUbkEcI9paM1KAOWOrnrwjxfpmwJXnsYjxTu6IO8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmjD5ZKhNbynexir0SueLLIhdz1byuGvhFgd/mQGEYYQ5cpOVgUK2Y/TmYStNFRXl3SlpmJNNY/guXxP0Z2kvG/JwoP5gZmC4EjffyI3TFKfj1QS1R4JK8pIXVYpnQkyklLJEufE+/wZFa+FpFuft5QxvWwCgJN7NeYNZb74sfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E524iKST; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E524iKST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733470625; x=1765006625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sSHUbkEcI9paM1KAOWOrnrwjxfpmwJXnsYjxTu6IO8Q=;
  b=E524iKSTxGPRlQ4yUivzHdc4jxO55VZNEFou4KkR1sxobQZ9gkrOsBYP
   g8+teUlIIcuKNeCHNaWWOeRNSXLMGOs2gbz6OfOnP+G85dMIK3jh/hUGg
   fxgsTmxAPRk9wPLL0/CC5o9MHNT0HVAGBJNPNPKWp+7TN6hBwOKR6hZRk
   WsvVIcoyeqRELNBAa1hEPMvO2dbG4/fBWwzBLnAzN2iztTheELz2pjib+
   Tl6OHBqmb3wUsECnbi8sqdm8phDMgHdlWK+JEDayO7iC03C3fuUSCF2mF
   kgzIJ5uN07CukUtHeWMBvlDZPQRp2JLwcUWOlZ4NRGBeOnriEXk+Hyn8v
   w==;
X-CSE-ConnectionGUID: x97U5NnXSHGgaVns6dsTuA==
X-CSE-MsgGUID: eBzrl5SZTrm/WbzDeOSccw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51349831"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="51349831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:37:02 -0800
X-CSE-ConnectionGUID: 1WyfbVxDTDe2Gdf0aL5kMw==
X-CSE-MsgGUID: PxSf+xfWS2yAvKy7XISPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94526318"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2024 23:37:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJStW-0000of-2D;
	Fri, 06 Dec 2024 07:36:58 +0000
Date: Fri, 6 Dec 2024 15:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error:
 uninitialized symbol 'pdm_addr'.
Message-ID: <202412061543.KaDx60Q5-lkp@intel.com>
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
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: 09068d624c490c0e89f33f963c402f1859964467 ASoC: amd: acp: fix for acp platform device creation failure
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241206/202412061543.KaDx60Q5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412061543.KaDx60Q5-lkp@intel.com/

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
