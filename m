Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF087270578
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322704; cv=none; b=mmwmiCGlWg6NEL0wZhrhWIHrM2u//JRcffDcHpQ9nP2LhPAnJ7hx169Y99IN+nBKQ3MRx2e4tNY4W9xg7y2mfxJlTmbowB9846f8EWIIalGMpFyMkTzWzxe3Rz17Mf7syQrK8ZOp4igsE/INxwMLpxLxJmO12CV2701YPjBLZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322704; c=relaxed/simple;
	bh=yZCmhhwAhy+PjyXomBO2VAXHcceElJ5xJWf0LqCdjh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+NVzbI9xnRiypwnhPCQwcrhDsRcXHGtEFgrgw/HsLBpmIv9B+FNWfwieS1IjmlhifAMVpQ0t5EZFGdytc7z63mj7vwYTkXkciwl8bcRUrC1hxh8z2/JhirkGKhXzsd57kTJ18XQUo8VotLFOHUoTAh7pjrup85v9gzDZDZkCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPixbwmH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPixbwmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761322703; x=1792858703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZCmhhwAhy+PjyXomBO2VAXHcceElJ5xJWf0LqCdjh0=;
  b=dPixbwmH58xvvLhS3R5m4Q+BFwXKULSjUIu1945oiNiuZBc5H0B9dlk5
   tWP4qazHDO5CX+3EyoRiCdIh6qgPxq6Y1aGdS62Y7sQwx5+dUs5G+13S0
   hvDmWyuiDwNvf0EzEG7iUytCjyPABDTsre5KbP9CbcNXJc2IPn8thzMmi
   JZ0FcS8brn4LrCb6arxtd6ga5p1b61jcXchR5ooJWqaYz85UzKwSgQxKF
   WPlc7SlE+n/5KO9HhCKo9GAs1eTlBcI2vFggtDRY3/ccBGvZsUjExqDo9
   K5B1U0M6Gl+hiRukxLWg0Dzkp+WAhTQSPgQ2nmjUtGiE2DvEWROdZonvM
   Q==;
X-CSE-ConnectionGUID: ZKfhCxfvQ8autDqkSmgdWg==
X-CSE-MsgGUID: OpB3Al67TJa2qwGBRRUj8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74108599"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74108599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 09:18:22 -0700
X-CSE-ConnectionGUID: 0mGn12K3RB2lTvqyJKWoWg==
X-CSE-MsgGUID: /jHflT7mRD2MsIADOvbaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="215121436"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 09:18:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCKTv-000Eep-1W;
	Fri, 24 Oct 2025 16:17:46 +0000
Date: Sat, 25 Oct 2025 00:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/pci/pci-acpi.c:1648:3-10: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510250050.orkLv0NL-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: 789befdfa3892957d36d20e6e90be05486e316c5 [1/1] arm64: PCI: Migrate ACPI related functions to pci-acpi.c
:::::: branch date: 23 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-r064-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250050.orkLv0NL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510250050.orkLv0NL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/pci-acpi.c:1648:3-10: WARNING: Consider using %pe to print PTR_ERR()

vim +1648 drivers/pci/pci-acpi.c

789befdfa38929 Sunil V L 2024-08-12  1614  
789befdfa38929 Sunil V L 2024-08-12  1615  /*
789befdfa38929 Sunil V L 2024-08-12  1616   * Lookup the bus range for the domain in MCFG, and set up config space
789befdfa38929 Sunil V L 2024-08-12  1617   * mapping.
789befdfa38929 Sunil V L 2024-08-12  1618   */
789befdfa38929 Sunil V L 2024-08-12  1619  static struct pci_config_window *
789befdfa38929 Sunil V L 2024-08-12  1620  pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
789befdfa38929 Sunil V L 2024-08-12  1621  {
789befdfa38929 Sunil V L 2024-08-12  1622  	struct device *dev = &root->device->dev;
789befdfa38929 Sunil V L 2024-08-12  1623  	struct resource *bus_res = &root->secondary;
789befdfa38929 Sunil V L 2024-08-12  1624  	u16 seg = root->segment;
789befdfa38929 Sunil V L 2024-08-12  1625  	const struct pci_ecam_ops *ecam_ops;
789befdfa38929 Sunil V L 2024-08-12  1626  	struct resource cfgres;
789befdfa38929 Sunil V L 2024-08-12  1627  	struct acpi_device *adev;
789befdfa38929 Sunil V L 2024-08-12  1628  	struct pci_config_window *cfg;
789befdfa38929 Sunil V L 2024-08-12  1629  	int ret;
789befdfa38929 Sunil V L 2024-08-12  1630  
789befdfa38929 Sunil V L 2024-08-12  1631  	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
789befdfa38929 Sunil V L 2024-08-12  1632  	if (ret) {
789befdfa38929 Sunil V L 2024-08-12  1633  		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
789befdfa38929 Sunil V L 2024-08-12  1634  		return NULL;
789befdfa38929 Sunil V L 2024-08-12  1635  	}
789befdfa38929 Sunil V L 2024-08-12  1636  
789befdfa38929 Sunil V L 2024-08-12  1637  	adev = acpi_resource_consumer(&cfgres);
789befdfa38929 Sunil V L 2024-08-12  1638  	if (adev)
789befdfa38929 Sunil V L 2024-08-12  1639  		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
789befdfa38929 Sunil V L 2024-08-12  1640  			 dev_name(&adev->dev));
789befdfa38929 Sunil V L 2024-08-12  1641  	else
789befdfa38929 Sunil V L 2024-08-12  1642  		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
789befdfa38929 Sunil V L 2024-08-12  1643  			 &cfgres);
789befdfa38929 Sunil V L 2024-08-12  1644  
789befdfa38929 Sunil V L 2024-08-12  1645  	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
789befdfa38929 Sunil V L 2024-08-12  1646  	if (IS_ERR(cfg)) {
789befdfa38929 Sunil V L 2024-08-12  1647  		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
789befdfa38929 Sunil V L 2024-08-12 @1648  			PTR_ERR(cfg));
789befdfa38929 Sunil V L 2024-08-12  1649  		return NULL;
789befdfa38929 Sunil V L 2024-08-12  1650  	}
789befdfa38929 Sunil V L 2024-08-12  1651  
789befdfa38929 Sunil V L 2024-08-12  1652  	return cfg;
789befdfa38929 Sunil V L 2024-08-12  1653  }
789befdfa38929 Sunil V L 2024-08-12  1654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
