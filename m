Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFDC3986A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnUyX/ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697669974; x=1729205974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NrC9UaDy0h1Wlr/3m57nOfJ9J4eWdxerjxqlEEem+vY=;
  b=hnUyX/ID6Ic+aiz5C6uH/OBWa1VQeIy76ihkf3wyxh6ES3SY2UuMNWjd
   STbdeehRjwre0lg9+GpWoJaD2h3jjyf++83AAEmtL60GY6s5QtBQjcRoq
   I4a7G9O4Lyef4sRjYxiactzx6d4m1os552vfClbHu9SE1CFQBUokXgWWH
   pkBj3t+xypVy4Grru3HyzDeD+XJf0NWKhBNgzNNq3ba6mD0WXIA232KEk
   JSVboCo947T995e1UrgD3qmovumvbyxbB7e8GD/GegG0vEKJthuSqO/8O
   6IYrKulJcgUv7b1MLS0mgLXagUQA5djnfjKQpQ6dYaHgt1hzHC2aAumxx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="390009499"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="390009499"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="827097299"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="827097299"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 15:59:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtFVh-0001Cw-2N;
	Wed, 18 Oct 2023 22:59:29 +0000
Date: Thu, 19 Oct 2023 06:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/6] i3c: master: svc: add hot join support
Message-ID: <202310190611.b14M4mH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231018205929.3435110-3-Frank.Li@nxp.com>
References: <20231018205929.3435110-3-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: miquel.raynal@bootlin.com
CC: Frank.Li@nxp.com
CC: alexandre.belloni@bootlin.com
CC: conor.culhane@silvaco.com
CC: imx@lists.linux.dev
CC: joe@perches.com
CC: linux-i3c@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-master-add-enable-disable-hot-join-in-sys-entry/20231019-051444
base:   linus/master
patch link:    https://lore.kernel.org/r/20231018205929.3435110-3-Frank.Li%40nxp.com
patch subject: [PATCH v2 2/6] i3c: master: svc: add hot join support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190611.b14M4mH3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190611.b14M4mH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310190611.b14M4mH3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/svc-i3c-master.c:212: warning: Function parameter or member 'lock' not described in 'svc_i3c_master'
>> drivers/i3c/master/svc-i3c-master.c:212: warning: Function parameter or member 'enabled_events' not described in 'svc_i3c_master'
   2 warnings as Errors


vim +212 drivers/i3c/master/svc-i3c-master.c

1c5ee2a77b1bac Clark Wang    2023-05-17  157  
dd3c52846d5954 Miquel Raynal 2021-01-21  158  /**
dd3c52846d5954 Miquel Raynal 2021-01-21  159   * struct svc_i3c_master - Silvaco I3C Master structure
dd3c52846d5954 Miquel Raynal 2021-01-21  160   * @base: I3C master controller
dd3c52846d5954 Miquel Raynal 2021-01-21  161   * @dev: Corresponding device
dd3c52846d5954 Miquel Raynal 2021-01-21  162   * @regs: Memory mapping
5496eac6ad7428 Miquel Raynal 2023-08-17  163   * @saved_regs: Volatile values for PM operations
dd3c52846d5954 Miquel Raynal 2021-01-21  164   * @free_slots: Bit array of available slots
dd3c52846d5954 Miquel Raynal 2021-01-21  165   * @addrs: Array containing the dynamic addresses of each attached device
dd3c52846d5954 Miquel Raynal 2021-01-21  166   * @descs: Array of descriptors, one per attached device
dd3c52846d5954 Miquel Raynal 2021-01-21  167   * @hj_work: Hot-join work
dd3c52846d5954 Miquel Raynal 2021-01-21  168   * @ibi_work: IBI work
dd3c52846d5954 Miquel Raynal 2021-01-21  169   * @irq: Main interrupt
dd3c52846d5954 Miquel Raynal 2021-01-21  170   * @pclk: System clock
dd3c52846d5954 Miquel Raynal 2021-01-21  171   * @fclk: Fast clock (bus)
dd3c52846d5954 Miquel Raynal 2021-01-21  172   * @sclk: Slow clock (other events)
dd3c52846d5954 Miquel Raynal 2021-01-21  173   * @xferqueue: Transfer queue structure
dd3c52846d5954 Miquel Raynal 2021-01-21  174   * @xferqueue.list: List member
dd3c52846d5954 Miquel Raynal 2021-01-21  175   * @xferqueue.cur: Current ongoing transfer
dd3c52846d5954 Miquel Raynal 2021-01-21  176   * @xferqueue.lock: Queue lock
dd3c52846d5954 Miquel Raynal 2021-01-21  177   * @ibi: IBI structure
dd3c52846d5954 Miquel Raynal 2021-01-21  178   * @ibi.num_slots: Number of slots available in @ibi.slots
dd3c52846d5954 Miquel Raynal 2021-01-21  179   * @ibi.slots: Available IBI slots
dd3c52846d5954 Miquel Raynal 2021-01-21  180   * @ibi.tbq_slot: To be queued IBI slot
dd3c52846d5954 Miquel Raynal 2021-01-21  181   * @ibi.lock: IBI lock
dd3c52846d5954 Miquel Raynal 2021-01-21  182   */
dd3c52846d5954 Miquel Raynal 2021-01-21  183  struct svc_i3c_master {
dd3c52846d5954 Miquel Raynal 2021-01-21  184  	struct i3c_master_controller base;
dd3c52846d5954 Miquel Raynal 2021-01-21  185  	struct device *dev;
dd3c52846d5954 Miquel Raynal 2021-01-21  186  	void __iomem *regs;
1c5ee2a77b1bac Clark Wang    2023-05-17  187  	struct svc_i3c_regs_save saved_regs;
dd3c52846d5954 Miquel Raynal 2021-01-21  188  	u32 free_slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  189  	u8 addrs[SVC_I3C_MAX_DEVS];
dd3c52846d5954 Miquel Raynal 2021-01-21  190  	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
dd3c52846d5954 Miquel Raynal 2021-01-21  191  	struct work_struct hj_work;
dd3c52846d5954 Miquel Raynal 2021-01-21  192  	struct work_struct ibi_work;
dd3c52846d5954 Miquel Raynal 2021-01-21  193  	int irq;
dd3c52846d5954 Miquel Raynal 2021-01-21  194  	struct clk *pclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  195  	struct clk *fclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  196  	struct clk *sclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  197  	struct {
dd3c52846d5954 Miquel Raynal 2021-01-21  198  		struct list_head list;
dd3c52846d5954 Miquel Raynal 2021-01-21  199  		struct svc_i3c_xfer *cur;
dd3c52846d5954 Miquel Raynal 2021-01-21  200  		/* Prevent races between transfers */
dd3c52846d5954 Miquel Raynal 2021-01-21  201  		spinlock_t lock;
dd3c52846d5954 Miquel Raynal 2021-01-21  202  	} xferqueue;
dd3c52846d5954 Miquel Raynal 2021-01-21  203  	struct {
dd3c52846d5954 Miquel Raynal 2021-01-21  204  		unsigned int num_slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  205  		struct i3c_dev_desc **slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  206  		struct i3c_ibi_slot *tbq_slot;
dd3c52846d5954 Miquel Raynal 2021-01-21  207  		/* Prevent races within IBI handlers */
dd3c52846d5954 Miquel Raynal 2021-01-21  208  		spinlock_t lock;
dd3c52846d5954 Miquel Raynal 2021-01-21  209  	} ibi;
85bebb554b09b1 Frank Li      2023-10-16  210  	struct mutex lock;
e00571e38f466c Frank Li      2023-10-18  211  	int enabled_events;
dd3c52846d5954 Miquel Raynal 2021-01-21 @212  };
dd3c52846d5954 Miquel Raynal 2021-01-21  213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
