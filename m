Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298F1AB814
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707172847; cv=none; b=VF5EKvU8coKjS0mh8xem5mWD23F2CnZwVLnCUxN34QwqUufRUSIkas+IrYgh9oKG2N+oWBFkgrKn4xEcw1v9BT1y/q5jVSKwMGbGB3cy7jpfdZptaPf3Z1qBx6wpoy8+TnJECoORuvqKRPRMQ4BOYbAWruQJygpyi0+9X0MfPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707172847; c=relaxed/simple;
	bh=0FnZVGo+SlHrjxLsUW0nHFrWUFKeHt03/KfcQsqKbZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAUPCNHCS4nYuFSEFhd7zPYXM2ZkeCFsl4BFzB2cLnMywu66wuEP5mvmHOugNdMMP2zhykGA7ey9vJ7WgrElWHwdgTKS+8uOS4l6RN+yqgZC9Wvzkg0+h8KrBywwGzpYf7ovlyBheAXEt3qRLci3wQRS1CBE8jNvgfGg025ze90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0sf8Y8T; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0sf8Y8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707172845; x=1738708845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FnZVGo+SlHrjxLsUW0nHFrWUFKeHt03/KfcQsqKbZM=;
  b=Y0sf8Y8TBTEjgjSq5AWrfzRxkhaMbQtSkRxYs4reloMmqPj7c7jAXXKT
   3Of98gIya1+F9DDZty+49TUpgAc3Y5LTrAucSPfCyE+bnsR+9MW7vTa+b
   ++SxP5n9u5u7RpiLWQ9q9m5ttyX20I4/lHy/d8PjVBJAAyZ0yeAASk6zB
   t0LoPixuh+SVol29Z3ofihtEB0o/TnxhBECBSxuLTg6SbEKJrzXoUYcD7
   eWXyQXWt9OoThegpOhv34LqlbjUBzOPKx+NLgEXdKJQSFvCrz9nqpBmBr
   G/n3n7Qrpq8W6YpQ2V6ArCDBiHx+GkwH023h2GYAoWgNhdb3hNWrE/8k4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="395044719"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="395044719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 14:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="861173"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2024 14:40:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX7dp-0000s0-16;
	Mon, 05 Feb 2024 22:40:41 +0000
Date: Tue, 6 Feb 2024 06:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21252/21616]
 drivers/i2c/busses/i2c-phytium-master.c:39:5-17: duplicated argument to &&
 or ||
Message-ID: <202402060635.Qq2zY5CQ-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 777b12afb6187fc712f365df57982275e9ef244f [21252/21616] i2c: add Phytium i2c driver
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-103-20240206 (https://download.01.org/0day-ci/archive/20240206/202402060635.Qq2zY5CQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402060635.Qq2zY5CQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-phytium-master.c:39:5-17: duplicated argument to && or ||

vim +39 drivers/i2c/busses/i2c-phytium-master.c

777b12afb6187f Jiakun Shuai 2023-10-26  24  
777b12afb6187f Jiakun Shuai 2023-10-26  25  static int i2c_phytium_init_master(struct phytium_i2c_dev *dev)
777b12afb6187f Jiakun Shuai 2023-10-26  26  {
777b12afb6187f Jiakun Shuai 2023-10-26  27  	/* Disable the adapter */
777b12afb6187f Jiakun Shuai 2023-10-26  28  	__i2c_phytium_disable(dev);
777b12afb6187f Jiakun Shuai 2023-10-26  29  
777b12afb6187f Jiakun Shuai 2023-10-26  30  	/* Write standard speed timing parameters */
777b12afb6187f Jiakun Shuai 2023-10-26  31  	phytium_writel(dev, dev->ss_hcnt, IC_SS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  32  	phytium_writel(dev, dev->ss_lcnt, IC_SS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  33  
777b12afb6187f Jiakun Shuai 2023-10-26  34  	/* Write fast mode/fast mode plus timing parameters */
777b12afb6187f Jiakun Shuai 2023-10-26  35  	phytium_writel(dev, dev->fs_hcnt, IC_FS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  36  	phytium_writel(dev, dev->fs_lcnt, IC_FS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  37  
777b12afb6187f Jiakun Shuai 2023-10-26  38  	/* Write high speed timing parameters if supported */
777b12afb6187f Jiakun Shuai 2023-10-26 @39  	if (dev->hs_hcnt && dev->hs_hcnt) {
777b12afb6187f Jiakun Shuai 2023-10-26  40  		phytium_writel(dev, dev->hs_hcnt, IC_HS_SCL_HCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  41  		phytium_writel(dev, dev->hs_lcnt, IC_HS_SCL_LCNT);
777b12afb6187f Jiakun Shuai 2023-10-26  42  	}
777b12afb6187f Jiakun Shuai 2023-10-26  43  
777b12afb6187f Jiakun Shuai 2023-10-26  44  	/* Write SDA hold time if supported */
777b12afb6187f Jiakun Shuai 2023-10-26  45  	if (dev->sda_hold_time)
777b12afb6187f Jiakun Shuai 2023-10-26  46  		phytium_writel(dev, dev->sda_hold_time, IC_SDA_HOLD);
777b12afb6187f Jiakun Shuai 2023-10-26  47  
777b12afb6187f Jiakun Shuai 2023-10-26  48  	/* Configure Tx/Rx FIFO threshold levels */
777b12afb6187f Jiakun Shuai 2023-10-26  49  	phytium_writel(dev, dev->tx_fifo_depth >> 1, IC_TX_TL);
777b12afb6187f Jiakun Shuai 2023-10-26  50  	phytium_writel(dev, 0, IC_RX_TL);
777b12afb6187f Jiakun Shuai 2023-10-26  51  
777b12afb6187f Jiakun Shuai 2023-10-26  52  	/* Configure the I2C master */
777b12afb6187f Jiakun Shuai 2023-10-26  53  	phytium_writel(dev, dev->master_cfg, IC_CON);
777b12afb6187f Jiakun Shuai 2023-10-26  54  
777b12afb6187f Jiakun Shuai 2023-10-26  55  	return 0;
777b12afb6187f Jiakun Shuai 2023-10-26  56  }
777b12afb6187f Jiakun Shuai 2023-10-26  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
