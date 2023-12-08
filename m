Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3931B26E
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWZMD0iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702035253; x=1733571253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPvdgXqiUZXU0ciWKXs37VO2Bu+VNsfSQpx3CZOW6OY=;
  b=PWZMD0iIZF/W74SWUdc7FvkUVlHtSZP/G8ksXs6eCFQRyq/MvChwcqD9
   EdiOoYn3jkFDWXFD6XjrJ88HSmT7PwfuRcoNJX/iZimqcKkzCNyuEp6IQ
   e5UbFE7T2SRl3WDvhh94NFMGRkRYSKJMTvROrG4TSuTCVEb/547tBCPcT
   LH6PAEkZIzmHXax1mYzcwiNi9xnCIYiDn3STV6X1b+Yc+B2cYnx5xB3yx
   WXFv1KxpOzBfk2Dq6Jk6rjTboH8lHjllOb4RGGLMygqGNSHR/j26UPuLT
   iiHLJvwE1LNTUCRqvnt9EXqW7BZlZy6PWKcIfLVxReyk++lKXISxLLedq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15944142"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="15944142"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019312486"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1019312486"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2023 03:34:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBZ7Q-000Dfn-0a;
	Fri, 08 Dec 2023 11:34:08 +0000
Date: Fri, 8 Dec 2023 19:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Message-ID: <202312081920.oIwWca3H-lkp@intel.com>
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
In-Reply-To: <20231207165027.2628302-2-enachman@marvell.com>
References: <20231207165027.2628302-2-enachman@marvell.com>
TO: Elad Nachman <enachman@marvell.com>
TO: gregory.clement@bootlin.com
TO: andi.shyti@kernel.org
TO: linux-i2c@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: enachman@marvell.com
CC: cyuval@marvell.com

Hi Elad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Nachman/i2c-busses-i2c-mv64xxx-fix-arb-loss-i2c-lock/20231208-005406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231207165027.2628302-2-enachman%40marvell.com
patch subject: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: csky-randconfig-r081-20231208 (https://download.01.org/0day-ci/archive/20231208/202312081920.oIwWca3H-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312081920.oIwWca3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312081920.oIwWca3H-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-mv64xxx.c:440 mv64xxx_i2c_do_action() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/i2c/busses/i2c-mv64xxx.c

4c5b38e881b1a9 Wolfram Sang        2014-02-13  367  
^1da177e4c3f41 Linus Torvalds      2005-04-16  368  static void
^1da177e4c3f41 Linus Torvalds      2005-04-16  369  mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
^1da177e4c3f41 Linus Torvalds      2005-04-16  370  {
8ea9d334890b12 Elad Nachman        2023-12-07  371  	struct pinctrl *pc;
8ea9d334890b12 Elad Nachman        2023-12-07  372  	int i, ret;
8ea9d334890b12 Elad Nachman        2023-12-07  373  
^1da177e4c3f41 Linus Torvalds      2005-04-16  374  	switch(drv_data->action) {
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  375  	case MV64XXX_I2C_ACTION_SEND_RESTART:
4243fa0bad551b Russell King        2013-05-16  376  		/* We should only get here if we have further messages */
4243fa0bad551b Russell King        2013-05-16  377  		BUG_ON(drv_data->num_msgs == 0);
4243fa0bad551b Russell King        2013-05-16  378  
930ab3d403ae43 Gregory CLEMENT     2013-08-22  379  		drv_data->msgs++;
930ab3d403ae43 Gregory CLEMENT     2013-08-22  380  		drv_data->num_msgs--;
4c5b38e881b1a9 Wolfram Sang        2014-02-13  381  		mv64xxx_i2c_send_start(drv_data);
4243fa0bad551b Russell King        2013-05-16  382  
c1d15b68aab86f Gregory CLEMENT     2013-08-22  383  		if (drv_data->errata_delay)
c1d15b68aab86f Gregory CLEMENT     2013-08-22  384  			udelay(5);
c1d15b68aab86f Gregory CLEMENT     2013-08-22  385  
4243fa0bad551b Russell King        2013-05-16  386  		/*
4243fa0bad551b Russell King        2013-05-16  387  		 * We're never at the start of the message here, and by this
4243fa0bad551b Russell King        2013-05-16  388  		 * time it's already too late to do any protocol mangling.
4243fa0bad551b Russell King        2013-05-16  389  		 * Thankfully, do not advertise support for that feature.
4243fa0bad551b Russell King        2013-05-16  390  		 */
4243fa0bad551b Russell King        2013-05-16  391  		drv_data->send_stop = drv_data->num_msgs == 1;
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  392  		break;
eda6bee6c7e67b Rodolfo Giometti    2010-11-26  393  
^1da177e4c3f41 Linus Torvalds      2005-04-16  394  	case MV64XXX_I2C_ACTION_CONTINUE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  395  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  396  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  397  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  398  
^1da177e4c3f41 Linus Torvalds      2005-04-16  399  	case MV64XXX_I2C_ACTION_SEND_ADDR_1:
^1da177e4c3f41 Linus Torvalds      2005-04-16  400  		writel(drv_data->addr1,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  401  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  402  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  403  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  404  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  405  
^1da177e4c3f41 Linus Torvalds      2005-04-16  406  	case MV64XXX_I2C_ACTION_SEND_ADDR_2:
^1da177e4c3f41 Linus Torvalds      2005-04-16  407  		writel(drv_data->addr2,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  408  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  409  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  410  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  411  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  412  
^1da177e4c3f41 Linus Torvalds      2005-04-16  413  	case MV64XXX_I2C_ACTION_SEND_DATA:
^1da177e4c3f41 Linus Torvalds      2005-04-16  414  		writel(drv_data->msg->buf[drv_data->byte_posn++],
004e8ed7cc67f4 Maxime Ripard       2013-06-12  415  			drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  416  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  417  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  418  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  419  
^1da177e4c3f41 Linus Torvalds      2005-04-16  420  	case MV64XXX_I2C_ACTION_RCV_DATA:
^1da177e4c3f41 Linus Torvalds      2005-04-16  421  		drv_data->msg->buf[drv_data->byte_posn++] =
004e8ed7cc67f4 Maxime Ripard       2013-06-12  422  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
^1da177e4c3f41 Linus Torvalds      2005-04-16  423  		writel(drv_data->cntl_bits,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  424  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  425  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  426  
8ea9d334890b12 Elad Nachman        2023-12-07  427  	case MV64XXX_I2C_ACTION_UNLOCK_BUS:
8ea9d334890b12 Elad Nachman        2023-12-07  428  		if (!drv_data->soft_reset)
8ea9d334890b12 Elad Nachman        2023-12-07  429  			break;
8ea9d334890b12 Elad Nachman        2023-12-07  430  
8ea9d334890b12 Elad Nachman        2023-12-07  431  		pc = devm_pinctrl_get(drv_data->adapter.dev.parent);
8ea9d334890b12 Elad Nachman        2023-12-07  432  		if (IS_ERR(pc)) {
8ea9d334890b12 Elad Nachman        2023-12-07  433  			dev_err(&drv_data->adapter.dev,
8ea9d334890b12 Elad Nachman        2023-12-07  434  				"failed to get pinctrl for bus unlock!\n");
8ea9d334890b12 Elad Nachman        2023-12-07  435  			break;
8ea9d334890b12 Elad Nachman        2023-12-07  436  		}
8ea9d334890b12 Elad Nachman        2023-12-07  437  
8ea9d334890b12 Elad Nachman        2023-12-07  438  		/* Change i2c MPPs state to act as GPIOs: */
8ea9d334890b12 Elad Nachman        2023-12-07  439  		if (pinctrl_select_state(pc, drv_data->i2c_gpio_state) >= 0) {
8ea9d334890b12 Elad Nachman        2023-12-07 @440  			if (!ret) {
8ea9d334890b12 Elad Nachman        2023-12-07  441  				/*
8ea9d334890b12 Elad Nachman        2023-12-07  442  				 * Toggle i2c scl (serial clock) 10 times.
8ea9d334890b12 Elad Nachman        2023-12-07  443  				 * 10 clocks are enough to transfer a full
8ea9d334890b12 Elad Nachman        2023-12-07  444  				 * byte plus extra as seen from tests with
8ea9d334890b12 Elad Nachman        2023-12-07  445  				 * Ubiquity SFP module causing the issue.
8ea9d334890b12 Elad Nachman        2023-12-07  446  				 * This allows the slave that occupies
8ea9d334890b12 Elad Nachman        2023-12-07  447  				 * the bus to transmit its remaining data,
8ea9d334890b12 Elad Nachman        2023-12-07  448  				 * so it can release the i2c bus:
8ea9d334890b12 Elad Nachman        2023-12-07  449  				 */
8ea9d334890b12 Elad Nachman        2023-12-07  450  				for (i = 0; i < 10; i++) {
8ea9d334890b12 Elad Nachman        2023-12-07  451  					gpio_set_value(drv_data->scl_gpio, 1);
8ea9d334890b12 Elad Nachman        2023-12-07  452  					udelay(100);
8ea9d334890b12 Elad Nachman        2023-12-07  453  					gpio_set_value(drv_data->scl_gpio, 0);
8ea9d334890b12 Elad Nachman        2023-12-07  454  				};
8ea9d334890b12 Elad Nachman        2023-12-07  455  			}
8ea9d334890b12 Elad Nachman        2023-12-07  456  
8ea9d334890b12 Elad Nachman        2023-12-07  457  			/* restore i2c pin state to MPPs: */
8ea9d334890b12 Elad Nachman        2023-12-07  458  			pinctrl_select_state(pc, drv_data->i2c_mpp_state);
8ea9d334890b12 Elad Nachman        2023-12-07  459  		}
8ea9d334890b12 Elad Nachman        2023-12-07  460  
8ea9d334890b12 Elad Nachman        2023-12-07  461  		/*
8ea9d334890b12 Elad Nachman        2023-12-07  462  		 * Trigger controller soft reset
8ea9d334890b12 Elad Nachman        2023-12-07  463  		 * This register is write only, with none of the bits defined.
8ea9d334890b12 Elad Nachman        2023-12-07  464  		 * So any value will do.
8ea9d334890b12 Elad Nachman        2023-12-07  465  		 * 0x1 just seems more intuitive than 0x0 ...
8ea9d334890b12 Elad Nachman        2023-12-07  466  		 */
8ea9d334890b12 Elad Nachman        2023-12-07  467  		writel(0x1, drv_data->reg_base + drv_data->reg_offsets.soft_reset);
8ea9d334890b12 Elad Nachman        2023-12-07  468  		/* wait for i2c controller to complete reset: */
8ea9d334890b12 Elad Nachman        2023-12-07  469  		udelay(100);
8ea9d334890b12 Elad Nachman        2023-12-07  470  		/*
8ea9d334890b12 Elad Nachman        2023-12-07  471  		 * need to proceed to the data stop condition generation clause.
8ea9d334890b12 Elad Nachman        2023-12-07  472  		 * This is needed after clock toggling to put the i2c slave
8ea9d334890b12 Elad Nachman        2023-12-07  473  		 * in the correct state.
8ea9d334890b12 Elad Nachman        2023-12-07  474  		 */
8ea9d334890b12 Elad Nachman        2023-12-07  475  		fallthrough;
8ea9d334890b12 Elad Nachman        2023-12-07  476  
^1da177e4c3f41 Linus Torvalds      2005-04-16  477  	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
^1da177e4c3f41 Linus Torvalds      2005-04-16  478  		drv_data->msg->buf[drv_data->byte_posn++] =
004e8ed7cc67f4 Maxime Ripard       2013-06-12  479  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
544a8d75f3d6e6 Chris Morgan        2022-03-30  480  		if (!drv_data->atomic)
^1da177e4c3f41 Linus Torvalds      2005-04-16  481  			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  482  		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  483  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  484  		drv_data->block = 0;
c1d15b68aab86f Gregory CLEMENT     2013-08-22  485  		if (drv_data->errata_delay)
c1d15b68aab86f Gregory CLEMENT     2013-08-22  486  			udelay(5);
c1d15b68aab86f Gregory CLEMENT     2013-08-22  487  
d295a86eab200b Russell King        2013-05-16  488  		wake_up(&drv_data->waitq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  489  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  490  
^1da177e4c3f41 Linus Torvalds      2005-04-16  491  	case MV64XXX_I2C_ACTION_INVALID:
^1da177e4c3f41 Linus Torvalds      2005-04-16  492  	default:
^1da177e4c3f41 Linus Torvalds      2005-04-16  493  		dev_err(&drv_data->adapter.dev,
^1da177e4c3f41 Linus Torvalds      2005-04-16  494  			"mv64xxx_i2c_do_action: Invalid action: %d\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16  495  			drv_data->action);
^1da177e4c3f41 Linus Torvalds      2005-04-16  496  		drv_data->rc = -EIO;
4db7e1786db505 Gustavo A. R. Silva 2020-07-21  497  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  498  	case MV64XXX_I2C_ACTION_SEND_STOP:
544a8d75f3d6e6 Chris Morgan        2022-03-30  499  		if (!drv_data->atomic)
^1da177e4c3f41 Linus Torvalds      2005-04-16  500  			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  501  		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
004e8ed7cc67f4 Maxime Ripard       2013-06-12  502  			drv_data->reg_base + drv_data->reg_offsets.control);
^1da177e4c3f41 Linus Torvalds      2005-04-16  503  		drv_data->block = 0;
d295a86eab200b Russell King        2013-05-16  504  		wake_up(&drv_data->waitq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  505  		break;
00d8689b85a7bb Thomas Petazzoni    2014-12-11  506  	}
00d8689b85a7bb Thomas Petazzoni    2014-12-11  507  }
00d8689b85a7bb Thomas Petazzoni    2014-12-11  508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
