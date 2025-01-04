Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C72F36
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735951239; cv=none; b=CroJxyOFKPaH6UxDMnrxSHkGiJz4LCzFkJrXHtLNHK2pREqCMieYzw5/TQZJlKI8AZx54rLmf0chuXjqSCKq/feD9PTgNqHHpfCjVpIzFieA5heHC/NTmbnHYbyOC3gp1cW7zNPBxHThv3cq2hztDJlCVOj3Wt/iuBesTbhHE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735951239; c=relaxed/simple;
	bh=RiRpic8x6aRTuCJWlhnyaKoeez6KzH0AJ44q9czoc2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SB2BzWtlr2zgAGt3Ue8Vi9cZ867G0GNUrX2+xJAEDmEf7FZC+tzwZXikc76wHCAVK52KQOQgoCGyLWclLHaED0+MxlDA+R1kN2UxmlNsGS/J0gv8J6EWJ9AexusjZAFX3KvB0iWrYYDxs05HhcttAd1bZfuyiAs5ZnWNO8yz6q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2DhFpui; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2DhFpui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735951237; x=1767487237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiRpic8x6aRTuCJWlhnyaKoeez6KzH0AJ44q9czoc2M=;
  b=V2DhFpuiKKCvdRrENcdYaijEeHsw6fGLGDCxz5wnjNlOymnACe2QHo2l
   bhRJByK46A9Gk3AZnUvs2iOTFSKnMKxi3T13sjmuXNSaVVWLv9gVCRt1X
   k1grMChUMPXGcXkRkpmoQes3b5h7TKrh+l3cr5cWzsAeqTw97R4BnC9xd
   ie4Hs04LGSKKBLgTZBHR6WDg7Dp1hPTgpjkkZpZwaxP9Putw3c2JhI7e5
   1QrFEstrAGb6odLZ4iz+oxdfINXME/9r/dhhcaBmBP957WQWkr+IUyakM
   WRhpPKmTcayAS6/tR5OvUfWuqDkmlg9H4vzosV+O4ovxFIgLo0xnsCa4/
   A==;
X-CSE-ConnectionGUID: A/s/3W1NS5uCDxokPDBcWQ==
X-CSE-MsgGUID: hDemcHQlSEmaXFOn/1ITBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35437495"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="35437495"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 16:40:36 -0800
X-CSE-ConnectionGUID: oshTtyJhR2q4KDiDitrkqA==
X-CSE-MsgGUID: TYm4yKb3QFOAfw8lVP7Vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102785700"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jan 2025 16:40:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTsDR-000AUH-10;
	Sat, 04 Jan 2025 00:40:33 +0000
Date: Sat, 4 Jan 2025 08:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/i2c/i2c-smbus.c:202:8-33: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202501040805.slCcNXzk-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andi Shyti <andi.shyti@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 270cc3c54e229758b7c079e3aa3ef171e6d8698b i2c: support gpio-binding for SMBAlerts
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: hexagon-randconfig-r054-20250102 (https://download.01.org/0day-ci/archive/20250104/202501040805.slCcNXzk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501040805.slCcNXzk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/i2c-smbus.c:202:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +202 drivers/i2c/i2c-smbus.c

b5527a7766f050 Jean Delvare 2010-03-02  164  
b5527a7766f050 Jean Delvare 2010-03-02  165  /* Setup SMBALERT# infrastructure */
a00f6d3723f561 Stephen Kitt 2022-10-12  166  static int smbalert_probe(struct i2c_client *ara)
b5527a7766f050 Jean Delvare 2010-03-02  167  {
6d4028c644edc0 Jingoo Han   2013-07-30  168  	struct i2c_smbus_alert_setup *setup = dev_get_platdata(&ara->dev);
b5527a7766f050 Jean Delvare 2010-03-02  169  	struct i2c_smbus_alert *alert;
b5527a7766f050 Jean Delvare 2010-03-02  170  	struct i2c_adapter *adapter = ara->adapter;
270cc3c54e2297 Wolfram Sang 2024-09-09  171  	unsigned long irqflags = IRQF_SHARED | IRQF_ONESHOT;
270cc3c54e2297 Wolfram Sang 2024-09-09  172  	struct gpio_desc *gpiod;
9b9f2b8bc2ac98 Phil Reid    2017-08-24  173  	int res, irq;
b5527a7766f050 Jean Delvare 2010-03-02  174  
71b578452ec6b2 Julia Lawall 2012-10-05  175  	alert = devm_kzalloc(&ara->dev, sizeof(struct i2c_smbus_alert),
71b578452ec6b2 Julia Lawall 2012-10-05  176  			     GFP_KERNEL);
b5527a7766f050 Jean Delvare 2010-03-02  177  	if (!alert)
b5527a7766f050 Jean Delvare 2010-03-02  178  		return -ENOMEM;
b5527a7766f050 Jean Delvare 2010-03-02  179  
69d17246ab255d Phil Reid    2017-08-24  180  	if (setup) {
9b9f2b8bc2ac98 Phil Reid    2017-08-24  181  		irq = setup->irq;
69d17246ab255d Phil Reid    2017-08-24  182  	} else {
a263a84088f689 Akhil R      2022-01-28  183  		irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
a263a84088f689 Akhil R      2022-01-28  184  					    "smbus_alert");
270cc3c54e2297 Wolfram Sang 2024-09-09  185  		if (irq <= 0) {
270cc3c54e2297 Wolfram Sang 2024-09-09  186  			gpiod = devm_gpiod_get(adapter->dev.parent, "smbalert", GPIOD_IN);
270cc3c54e2297 Wolfram Sang 2024-09-09  187  			if (IS_ERR(gpiod))
270cc3c54e2297 Wolfram Sang 2024-09-09  188  				return PTR_ERR(gpiod);
270cc3c54e2297 Wolfram Sang 2024-09-09  189  
270cc3c54e2297 Wolfram Sang 2024-09-09  190  			irq = gpiod_to_irq(gpiod);
69d17246ab255d Phil Reid    2017-08-24  191  			if (irq <= 0)
69d17246ab255d Phil Reid    2017-08-24  192  				return irq;
270cc3c54e2297 Wolfram Sang 2024-09-09  193  
270cc3c54e2297 Wolfram Sang 2024-09-09  194  			irqflags |= IRQF_TRIGGER_FALLING;
270cc3c54e2297 Wolfram Sang 2024-09-09  195  		}
69d17246ab255d Phil Reid    2017-08-24  196  	}
69d17246ab255d Phil Reid    2017-08-24  197  
9b9f2b8bc2ac98 Phil Reid    2017-08-24  198  	INIT_WORK(&alert->alert, smbalert_work);
b5527a7766f050 Jean Delvare 2010-03-02  199  	alert->ara = ara;
b5527a7766f050 Jean Delvare 2010-03-02  200  
9b9f2b8bc2ac98 Phil Reid    2017-08-24  201  	if (irq > 0) {
270cc3c54e2297 Wolfram Sang 2024-09-09 @202  		res = devm_request_threaded_irq(&ara->dev, irq, NULL, smbus_alert,
270cc3c54e2297 Wolfram Sang 2024-09-09  203  						irqflags, "smbus_alert", alert);
71b578452ec6b2 Julia Lawall 2012-10-05  204  		if (res)
b5527a7766f050 Jean Delvare 2010-03-02  205  			return res;
b5527a7766f050 Jean Delvare 2010-03-02  206  	}
b5527a7766f050 Jean Delvare 2010-03-02  207  
b5527a7766f050 Jean Delvare 2010-03-02  208  	i2c_set_clientdata(ara, alert);
9b9f2b8bc2ac98 Phil Reid    2017-08-24  209  	dev_info(&adapter->dev, "supports SMBALERT#\n");
b5527a7766f050 Jean Delvare 2010-03-02  210  
b5527a7766f050 Jean Delvare 2010-03-02  211  	return 0;
b5527a7766f050 Jean Delvare 2010-03-02  212  }
b5527a7766f050 Jean Delvare 2010-03-02  213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
