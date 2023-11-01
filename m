Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A331119A
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Nov 2023 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7J7kpkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698838129; x=1730374129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0IWsOwthjERY0dW1YnQvzTfNrS2coghmEyFJuoDxXk=;
  b=a7J7kpkEo6s7YKTihX04k1GTKKA9WcJc7I4x5xsBF2E8gtg8gwoNEO6H
   JQWtO/5WvKr3hTgCLYrTc6mHARMXkGw+t+T540JY+j0H8TiQoU5eepAWe
   s8rEDrhPOsTDpt7/U/2P/3RfzIunmQefn5toi1zZH4R3KPKJ3+VvUcIZU
   JIRCDsj+Bs22eEPUsEkySE9pNOacd9AOKDrljEtbphSOHi6swNXY087Es
   x7rqMarMVIwn7TbkotTxwBVCdJ462LEgpHRXpHNXhkkaAjxAK03G945ho
   ZxJkRU/F0vSEV7xwmjZmg2lGDMr7B4oJP3opm53m9xCqw0edB1ryUt7IS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388296465"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="388296465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851548059"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="851548059"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2023 04:28:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy9Ov-0000mE-1B;
	Wed, 01 Nov 2023 11:28:45 +0000
Date: Wed, 1 Nov 2023 19:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer()
 error: uninitialized symbol 'retval'.
Message-ID: <202311011945.yGkqOqj5-lkp@intel.com>
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
head:   8bc9e6515183935fa0cccaf67455c439afe4982b
commit: 3616936972493923afa4a11dc9f707b117e2bdf4 i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch
date:   1 year, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-x013-20230723 (https://download.01.org/0day-ci/archive/20231101/202311011945.yGkqOqj5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231101/202311011945.yGkqOqj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311011945.yGkqOqj5-lkp@intel.com/

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
