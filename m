Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C2E55B
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726397565; cv=none; b=fV8sJEO10DLY3+hrpKYUmCoplWiHruNCAJi/188ScbvOzNTELcOPjd4yz0wvQ23sPd+MOyFbqEcLbhDA44cmQUeG8AAQupoglFJ4XoRW5BND8mEX93KiNB3RqLqvuOPZYG+TxoFEFr480VRW4leu3MN1ffgJ+A2M52ecVSUf8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726397565; c=relaxed/simple;
	bh=P9+nZCBh5jAAE0ksKWkik94SLApucl0ZRJy32iYgaQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sE0ohH5bDsU4iyxfY9TwrPc23Yx9fAzENgmh87OzKHzI5E9qr9GPohzbNvKZ0sQxPoLNpnNpB7mHZ+kOeM9Z1Bn0UkhpDWeMAZNVLVhxsC7z48NUMBMbVIs+b/jDDzBZdpQMCzilohfeyZwTw11wEuuNdyCxZpAeKPuiWdS44GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCI8eT0z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCI8eT0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726397562; x=1757933562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9+nZCBh5jAAE0ksKWkik94SLApucl0ZRJy32iYgaQQ=;
  b=PCI8eT0z/jnyxHAOE9LuEQlMtix6ePI+cKbK3qDbZEJVKG3FJNc/j3wd
   nOTnFgheM60zmlZ/AyckNT96SXvOMu3+l0PXE+WanpzLS3nZvlaydGI6f
   sdKEQCTBylkv09+eOiwe8PpwN3zr7Zly35/6PaYFqs26dHPOsvbTpAwU/
   HH5IcTm6MXhx6k7C5iQ0AVmyDlIBW1ZwpsWwHkc3/jd1uA9RWscMc4A5I
   YyYqBbev46qahfcpaJtfDjq9f7/Wbcz2dzdNqDZXqOwg88lK5MYrljnAz
   rz3QMF+uQNvoZiErhM89RZkQAbn/EOQTwaQ1AFzmpCUYzIlTbW+dUubco
   w==;
X-CSE-ConnectionGUID: HT456TN7TY+ZwIWokiXNQQ==
X-CSE-MsgGUID: w4vJ6zZPTQGWGIs8mFKLRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35823025"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35823025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 03:52:41 -0700
X-CSE-ConnectionGUID: rxRD7i4qS1GeZypQBK9+Rw==
X-CSE-MsgGUID: jPU7TFvpRoah9SAtQ4pp7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="68557609"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2024 03:52:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spmru-0008cc-0Q;
	Sun, 15 Sep 2024 10:52:38 +0000
Date: Sun, 15 Sep 2024 18:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21252/23714]
 drivers/i2c/busses/i2c-phytium-master.c:39:5-17: duplicated argument to &&
 or ||
Message-ID: <202409151803.TxkWDq73-lkp@intel.com>
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
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 777b12afb6187fc712f365df57982275e9ef244f [21252/23714] i2c: add Phytium i2c driver
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-r051-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151803.TxkWDq73-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409151803.TxkWDq73-lkp@intel.com/

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
