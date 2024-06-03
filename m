Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710671362
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717374658; cv=none; b=SOrpws7Pi0TtOAjtk1UUm2q0pf7W8c2EDG2Dfs5WvegrHhWIEqfB40R9xUAjha2748M0qOzCTVpS2YiwsTa8gA1Yask9dtHU6Cy8BCqf0o3pkB8Z/HUVduTr8IKy5qb2ADOM8lTHuGrBRd/FEIeyXKHzZrr0Xve0r+XFzIBDPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717374658; c=relaxed/simple;
	bh=Px9LpLZ50Vxs66f1OA/pg1XcnbLZAQkqHmAvGhp8sd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1wiK9QZSc60CSWcrAlMV7XM32+3pnfwqkvLcsbt0e0HZ7QhpBfgxYOvFLrFz4pXXMWI/pESXFlgaq9KeXqBK7PIRVfFTn1h/51IdN5kJKkwLPJOlNilBv55HMwZWzJ7xm6Awh3soDL8XbdAJESo8C/GSSIi+JFtKoD47TxPDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAZPC643; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAZPC643"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717374656; x=1748910656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Px9LpLZ50Vxs66f1OA/pg1XcnbLZAQkqHmAvGhp8sd8=;
  b=XAZPC643kSh2ZYl2bnAqfIbQiCo08QwYljos07mxwyixdEhRNoH+irmk
   yr1eGjwpfNw8fmdlnIyszzqymAXQDmZR6S3/I2vfh9DLu14DrC5azNV1E
   IJcKTW8huzy8xJoWAz6+oWTrJ9UsJrnorP2g1AjMdNt6dvXdU4ZSlLCSr
   EOXmxAm0mjCmw7zH2DohBH7hIXhisk/BOGa2UHkvnhxl2zELaUrLUQKR5
   fdbHpZ3r9d8PhnFQHu9iUSaD+8yw3NaNzNVzpN13DRc7dIrSDHTiY3fDS
   UBNWaZpvfJ/Xtw5srTvG8IMgR5CtLCqSDL8x9Z4+hIE06wesZnHodqlif
   g==;
X-CSE-ConnectionGUID: 5MiQHZQTQXiVuNuDDGl4QQ==
X-CSE-MsgGUID: 6tNMTqbLRZupXygkKWdeQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13670856"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13670856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 17:30:56 -0700
X-CSE-ConnectionGUID: oYR5EoS7T/eOxYeHo/qhlw==
X-CSE-MsgGUID: KdpIUD5KQRGHMdo24rp9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="37171057"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2024 17:30:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDvbA-000KfN-0k;
	Mon, 03 Jun 2024 00:30:52 +0000
Date: Mon, 3 Jun 2024 08:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/amd/acp/acp-legacy-common.c:467 check_acp_config() error:
 uninitialized symbol 'pdm_addr'.
Message-ID: <202406030807.JwvI3iy2-lkp@intel.com>
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
head:   a693b9c95abd4947c2d06e05733de5d470ab6586
commit: 09068d624c490c0e89f33f963c402f1859964467 ASoC: amd: acp: fix for acp platform device creation failure
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20240603 (https://download.01.org/0day-ci/archive/20240603/202406030807.JwvI3iy2-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406030807.JwvI3iy2-lkp@intel.com/

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
