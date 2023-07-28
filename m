Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB41BB2D
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690578157; x=1722114157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7hRzuBXBvZcbyShVQZNfv5h4fWHR/yGIMNaI4KEIL/Q=;
  b=apWu9+ebuWIKlaVNi2952o4LfZnTHIW1HT0Ji3nO5YsOIxYxYAf1Pttj
   629K9qDE247aQHOoSaH0o58T6vWzFV9eYqs9gHZldymw72vJRdV69E/LH
   4v7yerzVq/IlDDlfGwnUTSPYnWd2kMbeO2+gQIJC/OXnI1moBhrFvKI60
   jcQfTlf3LSDXjp/nfe86xFlLwuqtzqvw+86L0IigUGALXkNXM1UA31fMs
   Yo8HNKX75yc8dV9Rf1ssTlYRO95kP5A8V+5Zl1X+K++QnX67v/RE3QoT1
   soogj3JXo7f2Y+K8TyDTM7EkttuV6HRwI3gG8HLPjsjDzej0v9sv+LvHc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="372313651"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="372313651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 14:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="797553821"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="797553821"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 14:02:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPUba-0003Zg-1C;
	Fri, 28 Jul 2023 21:02:34 +0000
Date: Sat, 29 Jul 2023 05:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn:
 variable dereferenced before IS_ERR check 'rproc' (see line 335)
Message-ID: <202307290417.hrgfPCcg-lkp@intel.com>
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
TO: Simon Horman <horms@kernel.org>

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f837f0a3c94882a29e38ff211a36c1c8a0f07804
commit: e752f9b924a1fd1afcf36e51b03dfa9c3096a3bd soc: ti: pruss: Allow compile-testing
date:   2 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 months ago
config: csky-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230729/202307290417.hrgfPCcg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290417.hrgfPCcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307290417.hrgfPCcg-lkp@intel.com/

smatch warnings:
drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn: variable dereferenced before IS_ERR check 'rproc' (see line 335)

vim +/rproc +341 drivers/remoteproc/pru_rproc.c

919e8942548aa87 MD Danish Anwar 2023-01-06  324  
102853400321bae Roger Quadros   2023-01-06  325  /**
102853400321bae Roger Quadros   2023-01-06  326   * pru_rproc_set_ctable() - set the constant table index for the PRU
102853400321bae Roger Quadros   2023-01-06  327   * @rproc: the rproc instance of the PRU
102853400321bae Roger Quadros   2023-01-06  328   * @c: constant table index to set
102853400321bae Roger Quadros   2023-01-06  329   * @addr: physical address to set it to
102853400321bae Roger Quadros   2023-01-06  330   *
102853400321bae Roger Quadros   2023-01-06  331   * Return: 0 on success, or errno in error case.
102853400321bae Roger Quadros   2023-01-06  332   */
102853400321bae Roger Quadros   2023-01-06  333  int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
102853400321bae Roger Quadros   2023-01-06  334  {
102853400321bae Roger Quadros   2023-01-06 @335  	struct pru_rproc *pru = rproc->priv;
102853400321bae Roger Quadros   2023-01-06  336  	unsigned int reg;
102853400321bae Roger Quadros   2023-01-06  337  	u32 mask, set;
102853400321bae Roger Quadros   2023-01-06  338  	u16 idx;
102853400321bae Roger Quadros   2023-01-06  339  	u16 idx_mask;
102853400321bae Roger Quadros   2023-01-06  340  
102853400321bae Roger Quadros   2023-01-06 @341  	if (IS_ERR_OR_NULL(rproc))
102853400321bae Roger Quadros   2023-01-06  342  		return -EINVAL;
102853400321bae Roger Quadros   2023-01-06  343  
102853400321bae Roger Quadros   2023-01-06  344  	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
102853400321bae Roger Quadros   2023-01-06  345  		return -ENODEV;
102853400321bae Roger Quadros   2023-01-06  346  
102853400321bae Roger Quadros   2023-01-06  347  	/* pointer is 16 bit and index is 8-bit so mask out the rest */
102853400321bae Roger Quadros   2023-01-06  348  	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
102853400321bae Roger Quadros   2023-01-06  349  
102853400321bae Roger Quadros   2023-01-06  350  	/* ctable uses bit 8 and upwards only */
102853400321bae Roger Quadros   2023-01-06  351  	idx = (addr >> 8) & idx_mask;
102853400321bae Roger Quadros   2023-01-06  352  
102853400321bae Roger Quadros   2023-01-06  353  	/* configurable ctable (i.e. C24) starts at PRU_CTRL_CTBIR0 */
102853400321bae Roger Quadros   2023-01-06  354  	reg = PRU_CTRL_CTBIR0 + 4 * (c >> 1);
102853400321bae Roger Quadros   2023-01-06  355  	mask = idx_mask << (16 * (c & 1));
102853400321bae Roger Quadros   2023-01-06  356  	set = idx << (16 * (c & 1));
102853400321bae Roger Quadros   2023-01-06  357  
102853400321bae Roger Quadros   2023-01-06  358  	pru_control_set_reg(pru, reg, mask, set);
102853400321bae Roger Quadros   2023-01-06  359  
102853400321bae Roger Quadros   2023-01-06  360  	return 0;
102853400321bae Roger Quadros   2023-01-06  361  }
102853400321bae Roger Quadros   2023-01-06  362  EXPORT_SYMBOL_GPL(pru_rproc_set_ctable);
102853400321bae Roger Quadros   2023-01-06  363  

:::::: The code at line 341 was first introduced by commit
:::::: 102853400321baea2527917e6e89be33508c3e18 remoteproc: pru: Add pru_rproc_set_ctable() function

:::::: TO: Roger Quadros <rogerq@ti.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
