Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A115574E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 06:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502397; cv=none; b=WP0VAb1g77biNqhh3njp00T9LlGq/x9rhSyPinoNfUOVXkeDl1+TeiCJMpT5TxKTKSntQmt7d7tY+kdjs6gBf75XBeWRSLHfPxuNc1i8pqlBOKqqgQHJQZ2K6YQccuv7vywbIRxBPNEeN2EeRZhmwltukzOsJp4AYjmM7xsK/G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502397; c=relaxed/simple;
	bh=S3TXbLxnOkGU/dYDbUjEhLTnHZp0V162jsPQkj8Iagc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXW1SR/ZPft656iY3kmjJGdp+HgXDGija1xb9nZH9z12GzLsDfZaB0vsBmG96/i/6L8e+C00X3iVd4FbqR7mPFmL60ZrdcVcjQMAIifMcmXk9u77FrHkxSzEEPLq2Ady552gR+0hOo4UxbG6p2fZJyd8PyhF7Dpefqv2sZVYtFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNgTJ8Dg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNgTJ8Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734502395; x=1766038395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S3TXbLxnOkGU/dYDbUjEhLTnHZp0V162jsPQkj8Iagc=;
  b=WNgTJ8DgFakT0k2dY0nq0LAU5VuruSOlFutM63ZyoCCM4xiPtbV/absu
   AhYR/FEKiIi03SjrbJ2btiiC+23BNZSswEp9QV2F0bCUiFAYbhM1CmzFp
   2wiLjx3e0kTYUoSFddfThr8Ql2iTvCjvIWEaS0+21eLsLaddhMgA1k007
   oyKmCJFSBKBz3+2IB1gxWByJ6QUgyQpUcdgnMQ9QGEi9s/JP8YzKFplOj
   iT8UsFCWIb9bFrBSe++0AciNyYD+j1DPk6GLiRMVhjWR5SObQx8GPGd4O
   IayjosYtDI/j6UJbID6Su5DE54RQPdGGvMFHZUq0wVbpCfoSiqN6mLEyA
   g==;
X-CSE-ConnectionGUID: waM5v/BDR46XjrH8Pb0MoQ==
X-CSE-MsgGUID: leu89pYtQGShWq0AjLll3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38744031"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38744031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 22:13:13 -0800
X-CSE-ConnectionGUID: erO+/WoXTReudsxd0Z2UFg==
X-CSE-MsgGUID: ZtzBVNxMRq6xvcB/V3zyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97816952"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2024 22:13:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNnIz-000G9H-1u;
	Wed, 18 Dec 2024 06:13:09 +0000
Date: Wed, 18 Dec 2024 14:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/x86/lpss.c:678 acpi_lpss_create_device() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202412181452.jpZEW0tc-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 2d5d5abebf1a342d672f738b60ea930ebc1070b0 ACPI: x86: Move LPSS to x86 folder
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181452.jpZEW0tc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412181452.jpZEW0tc-lkp@intel.com/

smatch warnings:
drivers/acpi/x86/lpss.c:678 acpi_lpss_create_device() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +678 drivers/acpi/x86/lpss.c

e6ce0ce34f65779 drivers/acpi/acpi_lpss.c Adrian Hunter     2017-12-15  614  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  615  static int acpi_lpss_create_device(struct acpi_device *adev,
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  616  				   const struct acpi_device_id *id)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  617  {
b2687cd7d5fd739 drivers/acpi/acpi_lpss.c Mathias Krause    2015-06-13  618  	const struct lpss_device_desc *dev_desc;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  619  	struct lpss_private_data *pdata;
90e97820619dc91 drivers/acpi/acpi_lpss.c Jiang Liu         2015-02-05  620  	struct resource_entry *rentry;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  621  	struct list_head resource_list;
8ce62f85a81f57e drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2014-05-25  622  	struct platform_device *pdev;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  623  	int ret;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  624  
b2687cd7d5fd739 drivers/acpi/acpi_lpss.c Mathias Krause    2015-06-13  625  	dev_desc = (const struct lpss_device_desc *)id->driver_data;
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  626  	if (!dev_desc)
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  627  		return -EINVAL;
bda3df10fb1ee99 drivers/acpi/acpi_lpss.c Raag Jadav        2023-10-03  628  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  629  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  630  	if (!pdata)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  631  		return -ENOMEM;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  632  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  633  	INIT_LIST_HEAD(&resource_list);
840baca4c44130e drivers/acpi/acpi_lpss.c Heikki Krogerus   2022-08-16  634  	ret = acpi_dev_get_memory_resources(adev, &resource_list);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  635  	if (ret < 0)
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  636  		goto err_out;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  637  
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  638  	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  639  	if (rentry) {
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  640  		if (dev_desc->prv_size_override)
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  641  			pdata->mmio_size = dev_desc->prv_size_override;
958c4eb2aa32509 drivers/acpi/acpi_lpss.c Mika Westerberg   2013-06-18  642  		else
90e97820619dc91 drivers/acpi/acpi_lpss.c Jiang Liu         2015-02-05  643  			pdata->mmio_size = resource_size(rentry->res);
da13b3361bb609f drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  644  		pdata->mmio_base = ioremap(rentry->res->start, pdata->mmio_size);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  645  	}
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  646  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  647  	acpi_dev_free_resource_list(&resource_list);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  648  
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  649  	if (!pdata->mmio_base) {
e1681599345b846 drivers/acpi/acpi_lpss.c Hans de Goede     2018-01-14  650  		/* Avoid acpi_bus_attach() instantiating a pdev for this dev. */
e1681599345b846 drivers/acpi/acpi_lpss.c Hans de Goede     2018-01-14  651  		adev->pnp.type.platform_id = 0;
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  652  		goto out_free;
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  653  	}
d3e13ff3c1aa240 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2015-07-07  654  
dd242a080d178c3 drivers/acpi/acpi_lpss.c Hans de Goede     2017-07-06  655  	pdata->adev = adev;
af65cfe9aeae03e drivers/acpi/acpi_lpss.c Mika Westerberg   2013-09-02  656  	pdata->dev_desc = dev_desc;
af65cfe9aeae03e drivers/acpi/acpi_lpss.c Mika Westerberg   2013-09-02  657  
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  658  	if (dev_desc->setup)
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  659  		dev_desc->setup(pdata);
03f09f73bbd805f drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  660  
ff8c1af5e7ebfdf drivers/acpi/acpi_lpss.c Heikki Krogerus   2014-09-02  661  	if (dev_desc->flags & LPSS_CLK) {
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  662  		ret = register_device_clock(adev, pdata);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  663  		if (ret)
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  664  			goto out_free;
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  665  	}
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  666  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  667  	/*
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  668  	 * This works around a known issue in ACPI tables where LPSS devices
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  669  	 * have _PS0 and _PS3 without _PSC (and no power resources), so
b9e95fc65ededbe drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-06-19  670  	 * acpi_bus_init_power() will assume that the BIOS has put them into D0.
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  671  	 */
1a2fa02f7489dc4 drivers/acpi/acpi_lpss.c Hans de Goede     2018-12-08  672  	acpi_device_fix_up_power(adev);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  673  
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  674  	adev->driver_data = pdata;
1571875beecd5de drivers/acpi/acpi_lpss.c Heikki Krogerus   2016-11-03  675  	pdev = acpi_create_platform_device(adev, dev_desc->properties);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  676  	if (IS_ERR_OR_NULL(pdev)) {
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  677  		adev->driver_data = NULL;
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29 @678  		ret = PTR_ERR(pdev);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  679  		goto err_out;
8ce62f85a81f57e drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2014-05-25  680  	}
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  681  
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  682  	acpi_lpss_create_device_links(adev, pdev);
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  683  	return 1;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  684  
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  685  out_free:
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  686  	/* Skip the device, but continue the namespace scan */
6cc401be16482bf drivers/acpi/acpi_lpss.c Andy Shevchenko   2022-08-29  687  	ret = 0;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  688  err_out:
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  689  	kfree(pdata);
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  690  	return ret;
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  691  }
f58b082aed43400 drivers/acpi/acpi_lpss.c Rafael J. Wysocki 2013-03-06  692  

:::::: The code at line 678 was first introduced by commit
:::::: 6cc401be16482bf35522c328be395507e331f9df ACPI: LPSS: Deduplicate skipping device in acpi_lpss_create_device()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
