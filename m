Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9EC39B
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2R6aZIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700012571; x=1731548571;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i5kr+DFNVJ0WAJT+89wNu1taDsOitAGU85CYC5YBQZo=;
  b=Z2R6aZIp5uxNgo07n5RIPTqEPYjlrBOGqGZsC/oIbOKWNfSZK2rEfTCf
   JEHf+dVO/JpuL7W3PHMCzJlUuakcO+Jsyuna7VtmHzS2nXE9kJb++VUHQ
   OgZOiep7mCcenR1JRp97YLdr1IQ/beII9GCCs7IQrGvn3yEboTRP24jJS
   VesXvFBOld1bXZYLlmFFDKJpo4MsyF624aL0irSfF08ZD3TcSubT+eSte
   FWxFCHg+kiN2VsLE6IcpeIHVDSeOo5Khe29bPBm9NSyzpeDzwR7y3y+uY
   0b2YPl68zKAo/QUYJyOmPIu5rp5t/Gj3BgwWA/QsBlWd6hom6B3H458CQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370138413"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="370138413"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 17:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768444724"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="768444724"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Nov 2023 17:42:50 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r34vX-0000tI-1e;
	Wed, 15 Nov 2023 01:42:47 +0000
Date: Wed, 15 Nov 2023 09:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kabel:realtek-sfp-work 8/20] drivers/net/phy/mdio_debugfs.c:53:5:
 warning: no previous prototype for 'mdiobus_register_debugfs'
Message-ID: <202311150909.QLgwVtTa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Marek Behún" <kabel@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git realtek-sfp-work
head:   a7931b1e7b8bdade3975606bc26446fdccc6a40e
commit: 1b9d6e195efad14934464c6d5285a3949ed0d898 [8/20] net: mdiobus: add support to access PHY registers via debugfs
:::::: branch date: 34 hours ago
:::::: commit date: 5 days ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231115/202311150909.QLgwVtTa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150909.QLgwVtTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150909.QLgwVtTa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/mdio_debugfs.c:53:5: warning: no previous prototype for 'mdiobus_register_debugfs' [-Wmissing-prototypes]
      53 | int mdiobus_register_debugfs(struct mii_bus *bus)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:75:6: warning: no previous prototype for 'mdiobus_unregister_debugfs' [-Wmissing-prototypes]
      75 | void mdiobus_unregister_debugfs(struct mii_bus *bus)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:86:5: warning: no previous prototype for 'mdiobus_debugfs_init' [-Wmissing-prototypes]
      86 | int mdiobus_debugfs_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:99:6: warning: no previous prototype for 'mdiobus_debugfs_exit' [-Wmissing-prototypes]
      99 | void mdiobus_debugfs_exit(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/mdiobus_register_debugfs +53 drivers/net/phy/mdio_debugfs.c

1b9d6e195efad1 Marek Behún 2021-05-31  52  
1b9d6e195efad1 Marek Behún 2021-05-31 @53  int mdiobus_register_debugfs(struct mii_bus *bus)
1b9d6e195efad1 Marek Behún 2021-05-31  54  {
1b9d6e195efad1 Marek Behún 2021-05-31  55  	struct dentry *dir, *entry;
1b9d6e195efad1 Marek Behún 2021-05-31  56  
1b9d6e195efad1 Marek Behún 2021-05-31  57  	dir = debugfs_create_dir(dev_name(&bus->dev), mdiobus_dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  58  	if (IS_ERR(dir))
1b9d6e195efad1 Marek Behún 2021-05-31  59  		return PTR_ERR(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  60  
1b9d6e195efad1 Marek Behún 2021-05-31  61  	debugfs_create_u32("addr", 0600, dir, &bus->debug_addr);
1b9d6e195efad1 Marek Behún 2021-05-31  62  	debugfs_create_u32("reg", 0600, dir, &bus->debug_reg);
1b9d6e195efad1 Marek Behún 2021-05-31  63  
1b9d6e195efad1 Marek Behún 2021-05-31  64  	entry = debugfs_create_file_unsafe("val", 0600, dir, bus, &val_fops);
1b9d6e195efad1 Marek Behún 2021-05-31  65  	if (IS_ERR(entry))
1b9d6e195efad1 Marek Behún 2021-05-31  66  		goto fail;
1b9d6e195efad1 Marek Behún 2021-05-31  67  
1b9d6e195efad1 Marek Behún 2021-05-31  68  	return 0;
1b9d6e195efad1 Marek Behún 2021-05-31  69  
1b9d6e195efad1 Marek Behún 2021-05-31  70  fail:
1b9d6e195efad1 Marek Behún 2021-05-31  71  	debugfs_remove_recursive(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  72  	return PTR_ERR(entry);
1b9d6e195efad1 Marek Behún 2021-05-31  73  }
1b9d6e195efad1 Marek Behún 2021-05-31  74  
1b9d6e195efad1 Marek Behún 2021-05-31 @75  void mdiobus_unregister_debugfs(struct mii_bus *bus)
1b9d6e195efad1 Marek Behún 2021-05-31  76  {
1b9d6e195efad1 Marek Behún 2021-05-31  77  	struct dentry *dir;
1b9d6e195efad1 Marek Behún 2021-05-31  78  
1b9d6e195efad1 Marek Behún 2021-05-31  79  	dir = debugfs_lookup(dev_name(&bus->dev), mdiobus_dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  80  	if (!dir)
1b9d6e195efad1 Marek Behún 2021-05-31  81  		return;
1b9d6e195efad1 Marek Behún 2021-05-31  82  
1b9d6e195efad1 Marek Behún 2021-05-31  83  	debugfs_remove_recursive(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  84  }
1b9d6e195efad1 Marek Behún 2021-05-31  85  
1b9d6e195efad1 Marek Behún 2021-05-31 @86  int mdiobus_debugfs_init(void)
1b9d6e195efad1 Marek Behún 2021-05-31  87  {
1b9d6e195efad1 Marek Behún 2021-05-31  88  	struct dentry *dentry;
1b9d6e195efad1 Marek Behún 2021-05-31  89  
1b9d6e195efad1 Marek Behún 2021-05-31  90  	dentry = debugfs_create_dir("mdio_bus", NULL);
1b9d6e195efad1 Marek Behún 2021-05-31  91  	if (IS_ERR(dentry))
1b9d6e195efad1 Marek Behún 2021-05-31  92  		return PTR_ERR(dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  93  
1b9d6e195efad1 Marek Behún 2021-05-31  94  	mdiobus_dentry = dentry;
1b9d6e195efad1 Marek Behún 2021-05-31  95  
1b9d6e195efad1 Marek Behún 2021-05-31  96  	return 0;
1b9d6e195efad1 Marek Behún 2021-05-31  97  }
1b9d6e195efad1 Marek Behún 2021-05-31  98  
1b9d6e195efad1 Marek Behún 2021-05-31 @99  void mdiobus_debugfs_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
