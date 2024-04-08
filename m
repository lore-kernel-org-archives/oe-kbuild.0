Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18392F51B
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Apr 2024 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712601245; cv=none; b=OEfV2jScg3HVbEqB+UZkty9iOjMbInE8UGGTwgieHA7mOOlmkStVwJaQqD32/tbUNr2gfwJ6vFHfQkK66fSWCVMrAC4EBhlx1XzpXYc7nIPLZ0hzxTLs8hAAkiIEcJaw7xu9vXPljj86RNfV9RvQ50YaxAoAJKErzsh14j28i2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712601245; c=relaxed/simple;
	bh=bNzwpbIVoC80bWrFMT/H2gzyMmgV6u2WkFq664i0lvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWA2XsNa1pxelDPBiN65CVCfLIRZn1foq6I5e5GdeCn5DPApXLs+sv6Al5F8/25XJHPXtQ3r1r76z71jnnm/B5kplJan8ek3LFaUGEjdJjS9rC/CehwnXMZDcld5cR7NWCdL0cZSUCGWJ+I0aFMW6s3elqF5nty56nw/Fdf1Hm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StixhYwL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StixhYwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712601243; x=1744137243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNzwpbIVoC80bWrFMT/H2gzyMmgV6u2WkFq664i0lvE=;
  b=StixhYwLVKJbARTGoxpnPnL7YRstwFLSRlyXnaQ9rVoxCwcZHpvophUh
   p6QhvhIfzFR9xY8HPQmNqRPkcTGbggFua5cU1DHkWPeUyRXFSFaO9c4RY
   ez94aclmbkjXHrM2IbNOgtnNvX4DaqfSd1Ui9QzcssrfjIuVEOzqw8xM7
   2k5ZSDiOyXm8z8M+fzqA4xHpVtMbdfXXHn/eQdeWU8phmMl1L1MgwJ74k
   PffcSrg4/Yrk3e34g+/oN2TJe++2M28GHETRvDi4CSgdbIM9GEz2KDzbx
   U0tnQTQSaA4CKAhVzQ9U7ZsBRgdPcckWdjOoIZnLJ/oVl9AaHdIBqmcWY
   A==;
X-CSE-ConnectionGUID: c3g3dAB2TCe+uRvujDFoXw==
X-CSE-MsgGUID: NcyLIqIlRfO4qPNmWC36mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7997992"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7997992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 11:34:02 -0700
X-CSE-ConnectionGUID: iI77ULFFQ+OF+2vqR5rOAA==
X-CSE-MsgGUID: e6Yj2qJ5QKyR2zFWYt0awg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="57430285"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2024 11:34:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rttoc-0005QE-0z;
	Mon, 08 Apr 2024 18:33:58 +0000
Date: Tue, 9 Apr 2024 02:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] ACPI: x86: Move LPSS to x86 folder
Message-ID: <202404090234.ZGYcaqJz-lkp@intel.com>
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
In-Reply-To: <20240404183448.3310449-5-andriy.shevchenko@linux.intel.com>
References: <20240404183448.3310449-5-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
TO: linux-kernel@vger.kernel.org
TO: linux-acpi@vger.kernel.org
CC: Len Brown <lenb@kernel.org>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/acpi-bus linus/master v6.9-rc3 next-20240408]
[cannot apply to rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ACPI-x86-Introduce-a-Makefile/20240405-023649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240404183448.3310449-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 4/4] ACPI: x86: Move LPSS to x86 folder
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240408 (https://download.01.org/0day-ci/archive/20240409/202404090234.ZGYcaqJz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404090234.ZGYcaqJz-lkp@intel.com/

smatch warnings:
drivers/acpi/x86/lpss.c:677 acpi_lpss_create_device() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +677 drivers/acpi/x86/lpss.c

e6ce0ce34f65779 drivers/acpi/acpi_lpss.c Adrian Hunter     2017-12-15  613  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  614  static int acpi_lpss_create_device(struct acpi_device *adev,
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  615  				   const struct acpi_device_id *id)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  616  {
b2687cd7d5fd739 drivers/acpi/acpi_lpss.c Mathias Krause    2015-06-13  617  	const struct lpss_device_desc *dev_desc;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  618  	struct lpss_private_data *pdata;
90e97820619dc91 drivers/acpi/acpi_lpss.c Jiang Liu         2015-02-05  619  	struct resource_entry *rentry;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  620  	struct list_head resource_list;
8ce62f85a81f57e drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2014-05-25  621  	struct platform_device *pdev;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  622  	int ret;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  623  
b2687cd7d5fd739 drivers/acpi/acpi_lpss.c Mathias Krause    2015-06-13  624  	dev_desc = (const struct lpss_device_desc *)id->driver_data;
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  625  	if (!dev_desc)
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  626  		return -EINVAL;
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  627  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  628  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  629  	if (!pdata)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  630  		return -ENOMEM;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  631  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  632  	INIT_LIST_HEAD(&resource_list);
840baca4c44130e drivers/acpi/acpi_lpss.c Heikki Krogerus   2022-08-16  633  	ret = acpi_dev_get_memory_resources(adev, &resource_list);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  634  	if (ret < 0)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  635  		goto err_out;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  636  
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  637  	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  638  	if (rentry) {
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  639  		if (dev_desc->prv_size_override)
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  640  			pdata->mmio_size = dev_desc->prv_size_override;
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  641  		else
90e97820619dc91 drivers/acpi/acpi_lpss.c Jiang Liu         2015-02-05  642  			pdata->mmio_size = resource_size(rentry->res);
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  643  		pdata->mmio_base = ioremap(rentry->res->start, pdata->mmio_size);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  644  	}
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  645  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  646  	acpi_dev_free_resource_list(&resource_list);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  647  
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  648  	if (!pdata->mmio_base) {
e1681599345b846 drivers/acpi/acpi_lpss.c Hans de Goede     2018-01-14  649  		/* Avoid acpi_bus_attach() instantiating a pdev for this dev. */
e1681599345b846 drivers/acpi/acpi_lpss.c Hans de Goede     2018-01-14  650  		adev->pnp.type.platform_id = 0;
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  651  		goto out_free;
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  652  	}
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  653  
dd242a080d178c3 drivers/acpi/acpi_lpss.c Hans de Goede     2017-07-06  654  	pdata->adev = adev;
af65cfe9aeae03e drivers/acpi/acpi_lpss.c Mika Westerberg   2013-09-02  655  	pdata->dev_desc = dev_desc;
af65cfe9aeae03e drivers/acpi/acpi_lpss.c Mika Westerberg   2013-09-02  656  
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  657  	if (dev_desc->setup)
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  658  		dev_desc->setup(pdata);
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  659  
ff8c1af5e7ebfdf drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  660  	if (dev_desc->flags & LPSS_CLK) {
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  661  		ret = register_device_clock(adev, pdata);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  662  		if (ret)
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  663  			goto out_free;
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  664  	}
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  665  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  666  	/*
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  667  	 * This works around a known issue in ACPI tables where LPSS devices
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  668  	 * have _PS0 and _PS3 without _PSC (and no power resources), so
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  669  	 * acpi_bus_init_power() will assume that the BIOS has put them into D0.
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  670  	 */
1a2fa02f7489dc4 drivers/acpi/acpi_lpss.c Hans de Goede     2018-12-08  671  	acpi_device_fix_up_power(adev);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  672  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  673  	adev->driver_data = pdata;
1571875beecd5de drivers/acpi/acpi_lpss.c Heikki Krogerus   2016-11-03  674  	pdev = acpi_create_platform_device(adev, dev_desc->properties);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  675  	if (IS_ERR_OR_NULL(pdev)) {
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  676  		adev->driver_data = NULL;
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29 @677  		ret = PTR_ERR(pdev);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  678  		goto err_out;
8ce62f85a81f57e drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2014-05-25  679  	}
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  680  
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  681  	acpi_lpss_create_device_links(adev, pdev);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  682  	return 1;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  683  
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  684  out_free:
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  685  	/* Skip the device, but continue the namespace scan */
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  686  	ret = 0;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  687  err_out:
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  688  	kfree(pdata);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  689  	return ret;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  690  }
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
