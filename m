Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C880AFED
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Apr 2023 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681848910; x=1713384910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IsuuODVZkmhyMgRbU3Dsnal3tevOq5VGVh1sU6g+zxE=;
  b=hv8jCIQNNFkdphZE4dsbjYcvQpijPTXa48YvRBjwVVG2ikp/thdTi7lV
   1/Zdsd46dLvsO0M77ur/co2OoOEDz3qsgMJocLtQZtNSXkOM8Dhj5n4ZI
   QOsIhmNN6k1rsWlxSoL75Vh90a6mpoI3HvFFTi3iR6g9OPfjcGqS0bU0w
   gFh29GYvvB/sT3Dqh13Ilz5OZMiQ2eUwDMK7uns6JfatrTotzT9w5ey5V
   iURutu1lNMB/oIFUZrBWshsDRTxJ9XVNCYuKabqpZ5vzb+kDsmi6coFfd
   sFo+9yMwQ2Dpp42iY//I2YBKnJG7U/mdtLS75F2NQaTbZVtATxM30Hj9C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344026081"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="344026081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 13:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802662849"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="802662849"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2023 13:15:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1porjG-000e02-1D;
	Tue, 18 Apr 2023 20:15:06 +0000
Date: Wed, 19 Apr 2023 04:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <202304190429.UOH2nE9u-lkp@intel.com>
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
In-Reply-To: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
References: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
TO: devicetree@vger.kernel.org
CC: git@amd.com
CC: linux-clk@vger.kernel.org
CC: robh+dt@kernel.org
CC: sboyd@kernel.org
CC: mturquette@baylibre.com
CC: krzysztof.kozlowski+dt@linaro.org
CC: michal.simek@xilinx.com

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20230417]
[cannot apply to xilinx-xlnx/master robh/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230418102855.6791-3-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-m041-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190429.UOH2nE9u-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304190429.UOH2nE9u-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:264 clk_wzrd_dynamic_reconfig() error: uninitialized symbol 'value'.

vim +/value +264 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  225  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  226  static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  227  				     unsigned long parent_rate)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  228  {
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  229  	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  230  	void __iomem *div_addr = divider->base + divider->offset;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  231  	u32 value, regh, edged, p5en, p5fedge, regval, regval1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  232  	unsigned long flags = 0;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  233  	int err;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  234  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  235  	if (divider->lock)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  236  		spin_lock_irqsave(divider->lock, flags);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  237  	else
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  238  		__acquire(divider->lock);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  239  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  240  	if (!divider->is_versal) {
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  241  		value = DIV_ROUND_CLOSEST(parent_rate, rate);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  242  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  243  		/* Cap the value to max */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  244  		min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  245  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  246  		/* Set divisor and clear phase offset */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  247  		writel(value, div_addr);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  248  		writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  249  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  250  		/* Check status register */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  251  		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  252  					 value, value & WZRD_DR_LOCK_BIT_MASK,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  253  					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  254  		if (err)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  255  			goto err_reconfig;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  256  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  257  		/* Initiate reconfiguration */
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  258  		writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  259  		       divider->base + WZRD_DR_INIT_REG_OFFSET);
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  260  		writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  261  		       divider->base + WZRD_DR_INIT_REG_OFFSET);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  262  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  263  	} else {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18 @264  		regh = (value / 4);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  265  		regval1 = readl(div_addr);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  266  		regval1 |= WZRD_CLKFBOUT_PREDIV2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  267  		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  268  		if (value % 4 > 1) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  269  			edged = 1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  270  			regval1 |= (edged << WZRD_EDGE_SHIFT);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  271  		}
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  272  		p5fedge = value % 2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  273  		p5en = value % 2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  274  		regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  275  		writel(regval1, div_addr);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  276  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  277  		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  278  		writel(regval, div_addr + 4);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  279  		/* Check status register */
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  280  		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  281  					 value, value & WZRD_DR_LOCK_BIT_MASK,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  282  					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  283  		if (err)
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  284  			goto err_reconfig;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  285  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  286  		/* Initiate reconfiguration */
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  287  		writel(WZRD_DR_BEGIN_DYNA_RECONF,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  288  		       divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  289  	}
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  290  	/* Check status register */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  291  	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  292  				 value, value & WZRD_DR_LOCK_BIT_MASK,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  293  				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  294  err_reconfig:
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  295  	if (divider->lock)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  296  		spin_unlock_irqrestore(divider->lock, flags);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  297  	else
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  298  		__release(divider->lock);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  299  	return err;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  300  }
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
