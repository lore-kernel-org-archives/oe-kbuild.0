Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88318C17
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVAWoyP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698708654; x=1730244654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iv6I64xezHzc4kp8hgaDlZuDesrvGad2/GsYjJ+BwbU=;
  b=DVAWoyP0omjEUNH0eukzrKXLnb8acNf5eXue0XqLb5nqzupz9uu5+PqX
   9vj5oh4IfQq19N/L040UQR766H4tZ3apgmQIKOlhp1znu0/CjGibKVfIx
   SWzsUqN1pG1T3ExCJVuzP0AbwEJgpiuTLNmTl/iISv9X20jrgGPE7XI8w
   Xt5Us2dvFwNEHSf3P6YYSztY6oB/cnUbF78q3kfYmB3XQayc13AiywXrH
   LK+OeiZ1Wfk3HgCtGtCcYtOerPb0vLj/nYhg8hDpr2MP9xD7v9DPbxtSG
   ge8GZO2DF0Y90LvxV3Eyvhy5lRvlX0rsEEixe1vgmkPxSrm7QdQHStNhG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387062525"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="387062525"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 16:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="795399400"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="795399400"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Oct 2023 16:30:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxbia-000DeZ-1x;
	Mon, 30 Oct 2023 23:30:48 +0000
Date: Tue, 31 Oct 2023 07:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer()
 error: uninitialized symbol 'retval'.
Message-ID: <202310310756.PQQF7PBr-lkp@intel.com>
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
TO: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   14ab6d425e80674b6a0145f05719b11e82e64824
commit: 3616936972493923afa4a11dc9f707b117e2bdf4 i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-r024-20230822 (https://download.01.org/0day-ci/archive/20231031/202310310756.PQQF7PBr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310310756.PQQF7PBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310310756.PQQF7PBr-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer() error: uninitialized symbol 'retval'.

Old smatch warnings:
drivers/i2c/busses/i2c-mchp-pci1xxxx.c:714 pci1xxxx_i2c_init() warn: impossible condition '(ret == -1) => (0-255 == (-1))'

vim +/retval +1030 drivers/i2c/busses/i2c-mchp-pci1xxxx.c

36169369724939 Tharun Kumar P 2022-09-27   991  
36169369724939 Tharun Kumar P 2022-09-27   992  static int pci1xxxx_i2c_xfer(struct i2c_adapter *adap,
36169369724939 Tharun Kumar P 2022-09-27   993  			     struct i2c_msg *msgs, int num)
36169369724939 Tharun Kumar P 2022-09-27   994  {
36169369724939 Tharun Kumar P 2022-09-27   995  	struct pci1xxxx_i2c *i2c = i2c_get_adapdata(adap);
36169369724939 Tharun Kumar P 2022-09-27   996  	u8 slaveaddr;
36169369724939 Tharun Kumar P 2022-09-27   997  	int retval;
36169369724939 Tharun Kumar P 2022-09-27   998  	u32 i;
36169369724939 Tharun Kumar P 2022-09-27   999  
36169369724939 Tharun Kumar P 2022-09-27  1000  	i2c->i2c_xfer_in_progress = true;
36169369724939 Tharun Kumar P 2022-09-27  1001  	for (i = 0; i < num; i++) {
36169369724939 Tharun Kumar P 2022-09-27  1002  		slaveaddr = i2c_8bit_addr_from_msg(&msgs[i]);
36169369724939 Tharun Kumar P 2022-09-27  1003  
36169369724939 Tharun Kumar P 2022-09-27  1004  		/*
36169369724939 Tharun Kumar P 2022-09-27  1005  		 * Send the STOP bit if the transfer is the final one or
36169369724939 Tharun Kumar P 2022-09-27  1006  		 * if the I2C_M_STOP flag is set.
36169369724939 Tharun Kumar P 2022-09-27  1007  		 */
36169369724939 Tharun Kumar P 2022-09-27  1008  		if ((i == num - 1) || (msgs[i].flags & I2C_M_STOP))
36169369724939 Tharun Kumar P 2022-09-27  1009  			i2c->flags |= I2C_FLAGS_STOP;
36169369724939 Tharun Kumar P 2022-09-27  1010  		else
36169369724939 Tharun Kumar P 2022-09-27  1011  			i2c->flags &= ~I2C_FLAGS_STOP;
36169369724939 Tharun Kumar P 2022-09-27  1012  
36169369724939 Tharun Kumar P 2022-09-27  1013  		if (msgs[i].flags & I2C_M_RECV_LEN)
36169369724939 Tharun Kumar P 2022-09-27  1014  			i2c->flags |= I2C_FLAGS_SMB_BLK_READ;
36169369724939 Tharun Kumar P 2022-09-27  1015  		else
36169369724939 Tharun Kumar P 2022-09-27  1016  			i2c->flags &= ~I2C_FLAGS_SMB_BLK_READ;
36169369724939 Tharun Kumar P 2022-09-27  1017  
36169369724939 Tharun Kumar P 2022-09-27  1018  		if (msgs[i].flags & I2C_M_RD)
36169369724939 Tharun Kumar P 2022-09-27  1019  			retval = pci1xxxx_i2c_read(i2c, slaveaddr,
36169369724939 Tharun Kumar P 2022-09-27  1020  						   msgs[i].buf, msgs[i].len);
36169369724939 Tharun Kumar P 2022-09-27  1021  		else
36169369724939 Tharun Kumar P 2022-09-27  1022  			retval = pci1xxxx_i2c_write(i2c, slaveaddr,
36169369724939 Tharun Kumar P 2022-09-27  1023  						    msgs[i].buf, msgs[i].len);
36169369724939 Tharun Kumar P 2022-09-27  1024  
36169369724939 Tharun Kumar P 2022-09-27  1025  		if (retval < 0)
36169369724939 Tharun Kumar P 2022-09-27  1026  			break;
36169369724939 Tharun Kumar P 2022-09-27  1027  	}
36169369724939 Tharun Kumar P 2022-09-27  1028  	i2c->i2c_xfer_in_progress = false;
36169369724939 Tharun Kumar P 2022-09-27  1029  
36169369724939 Tharun Kumar P 2022-09-27 @1030  	if (retval < 0)
36169369724939 Tharun Kumar P 2022-09-27  1031  		return retval;
36169369724939 Tharun Kumar P 2022-09-27  1032  
36169369724939 Tharun Kumar P 2022-09-27  1033  	return num;
36169369724939 Tharun Kumar P 2022-09-27  1034  }
36169369724939 Tharun Kumar P 2022-09-27  1035  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
