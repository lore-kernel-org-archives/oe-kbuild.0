Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B17C1B0F1A
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315224; cv=none; b=YsB1Ykmase6KJ2ymBsFp3eIrqSpdlLQYwGCqvbQqs4bSnGqXpnmnZo4utA5HQx3sI/V9llnOxBJ25KnQ/+yC8JK7geXAp1ctzNOPF9XV52fAMQtRLxtumI2C8/97+QZDd8SZGT2ildrmN3Bt5ZLV4IQJY3HzRZAfdlz9WLyWmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315224; c=relaxed/simple;
	bh=dnz1cWBglVtMixpPW1AZlms4HL/KtjncpN/eTf73VIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdkXG6qtfW15k4/P55hgP2a+iebq0RR5U9hLPiJr8YyO4X9GeNtsOETn1TLnFLHvr54ckMASFmh8/Zg2ODXH+QM3O+DtNj7OrNq4WgJBLKMwBkWqAAPQzUGh1jPOokJdviofETUxdERltJQoUy0AR/1NEBTtwzHoqzuHzi9J5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vulwmrzx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vulwmrzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733315222; x=1764851222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dnz1cWBglVtMixpPW1AZlms4HL/KtjncpN/eTf73VIw=;
  b=Vulwmrzxh2MFnqnHp3k6FTyB9QUp28oqwtVQEF8CtdEm4Dsk0+AtN3tI
   +KAtWPBdr7zOyO9iWPDPzGbWIULV3M/vQMNsb0sHUPX+mKt3Qf6+i5gcc
   /bAx4LK+lRhKVEZCm5aVlCt5KmSRwAZLMluaqRxoAd4nykYeslMSNIIhz
   PepI9DqGn4RSHt4iOyXUBS4meH7kOUkpfDy7PwZRuqdjcvEZAnNeYC3pz
   xwI1ebNbJq6qkMImKSAlRfc7Rsv3NJojdEnHacU9nBC1FmKe2XrJ9t6hD
   fThedXnvJj1Wca1RMdU/Pb3ndfvpO+e5Sd7Dh7KInscxrSZENJqqdoqNO
   g==;
X-CSE-ConnectionGUID: AMcrgxhGSP+FHSd4vXewGg==
X-CSE-MsgGUID: WHvg/I1NRWmCt+4zNJu1iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44054714"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44054714"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 04:27:02 -0800
X-CSE-ConnectionGUID: lgzI4ExwQn6xMOI+4aHUdw==
X-CSE-MsgGUID: YwvFvKG4QAOABAWFZmnBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94582864"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 04:27:01 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIoT4-00030w-0A;
	Wed, 04 Dec 2024 12:26:58 +0000
Date: Wed, 4 Dec 2024 20:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn:
 variable dereferenced before IS_ERR check 'rproc' (see line 335)
Message-ID: <202412042058.zwL1rOlr-lkp@intel.com>
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
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: e752f9b924a1fd1afcf36e51b03dfa9c3096a3bd soc: ti: pruss: Allow compile-testing
date:   1 year, 7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 7 months ago
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241204/202412042058.zwL1rOlr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412042058.zwL1rOlr-lkp@intel.com/

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
