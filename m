Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359EAD30A
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693918529; x=1725454529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yc6SXmbDPrVeNIondxpsuiKlWDeU8JyYW99TrIIgUEI=;
  b=T+rputiFsXPDrveDHZF8XOyhGFRFjMy2D2zYzzu+ioiKG/WcLm3N0sRL
   yVpBqmFB+BhYKM5a3b1SFqR9u0fR08ilE/U3CGOspsF1g5I2BvqjpujBt
   Wmu8IYtp/prxYdWCdIGjrje66gX/BZ/P5m3fRay4af7JX9BfJW4OYPIFy
   ke4L9hPmnfB0MMALcR04U/aLYeLrfUiNhBjGNoaw2oXuwqld7bh7ZmXRA
   0c/sOm4dHw5ejfMJ73153RY9hdREg7PyFora3UFchwt0xu8oSRhIOeZMB
   74AxPkSJazibxqPnlKvLdvOCF4b6VB0pZsLG0CgwZkz/ZegVJWO2Mt+2Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="357093352"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="357093352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 05:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="744261554"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="744261554"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Sep 2023 05:55:26 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdVaV-0001gd-2W;
	Tue, 05 Sep 2023 12:55:23 +0000
Date: Tue, 5 Sep 2023 20:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/fpu/xstate.c:1691: warning: Excess function
 parameter 'tsk' description in 'fpu_xstate_prctl'
Message-ID: <202309052029.TNyqXyIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "force check is set"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f86ed6ec0b390c033eae7f9c487a3fea268e027
commit: f5c0b4f30416c670408a77be94703d04d22b57df x86/prctl: Remove pointless task argument
date:   1 year, 4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 4 months ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230905/202309052029.TNyqXyIT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309052029.TNyqXyIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309052029.TNyqXyIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:1691: warning: Excess function parameter 'tsk' description in 'fpu_xstate_prctl'


vim +1691 arch/x86/kernel/fpu/xstate.c

980fe2fddcff21 Thomas Gleixner 2022-01-05  1671  
db8268df0983ad Chang S. Bae    2021-10-21  1672  /**
db8268df0983ad Chang S. Bae    2021-10-21  1673   * fpu_xstate_prctl - xstate permission operations
db8268df0983ad Chang S. Bae    2021-10-21  1674   * @tsk:	Redundant pointer to current
db8268df0983ad Chang S. Bae    2021-10-21  1675   * @option:	A subfunction of arch_prctl()
db8268df0983ad Chang S. Bae    2021-10-21  1676   * @arg2:	option argument
db8268df0983ad Chang S. Bae    2021-10-21  1677   * Return:	0 if successful; otherwise, an error code
db8268df0983ad Chang S. Bae    2021-10-21  1678   *
db8268df0983ad Chang S. Bae    2021-10-21  1679   * Option arguments:
db8268df0983ad Chang S. Bae    2021-10-21  1680   *
db8268df0983ad Chang S. Bae    2021-10-21  1681   * ARCH_GET_XCOMP_SUPP: Pointer to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1682   * ARCH_GET_XCOMP_PERM: Pointer to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1683   * ARCH_REQ_XCOMP_PERM: Facility number requested
db8268df0983ad Chang S. Bae    2021-10-21  1684   *
db8268df0983ad Chang S. Bae    2021-10-21  1685   * For facilities which require more than one XSTATE component, the request
db8268df0983ad Chang S. Bae    2021-10-21  1686   * must be the highest state component number related to that facility,
db8268df0983ad Chang S. Bae    2021-10-21  1687   * e.g. for AMX which requires XFEATURE_XTILE_CFG(17) and
db8268df0983ad Chang S. Bae    2021-10-21  1688   * XFEATURE_XTILE_DATA(18) this would be XFEATURE_XTILE_DATA(18).
db8268df0983ad Chang S. Bae    2021-10-21  1689   */
f5c0b4f30416c6 Thomas Gleixner 2022-05-12  1690  long fpu_xstate_prctl(int option, unsigned long arg2)
db8268df0983ad Chang S. Bae    2021-10-21 @1691  {
db8268df0983ad Chang S. Bae    2021-10-21  1692  	u64 __user *uptr = (u64 __user *)arg2;
db8268df0983ad Chang S. Bae    2021-10-21  1693  	u64 permitted, supported;
db8268df0983ad Chang S. Bae    2021-10-21  1694  	unsigned long idx = arg2;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1695  	bool guest = false;
db8268df0983ad Chang S. Bae    2021-10-21  1696  
db8268df0983ad Chang S. Bae    2021-10-21  1697  	switch (option) {
db8268df0983ad Chang S. Bae    2021-10-21  1698  	case ARCH_GET_XCOMP_SUPP:
db8268df0983ad Chang S. Bae    2021-10-21  1699  		supported = fpu_user_cfg.max_features |	fpu_user_cfg.legacy_features;
db8268df0983ad Chang S. Bae    2021-10-21  1700  		return put_user(supported, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1701  
db8268df0983ad Chang S. Bae    2021-10-21  1702  	case ARCH_GET_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1703  		/*
db8268df0983ad Chang S. Bae    2021-10-21  1704  		 * Lockless snapshot as it can also change right after the
db8268df0983ad Chang S. Bae    2021-10-21  1705  		 * dropping the lock.
db8268df0983ad Chang S. Bae    2021-10-21  1706  		 */
db8268df0983ad Chang S. Bae    2021-10-21  1707  		permitted = xstate_get_host_group_perm();
db8268df0983ad Chang S. Bae    2021-10-21  1708  		permitted &= XFEATURE_MASK_USER_SUPPORTED;
db8268df0983ad Chang S. Bae    2021-10-21  1709  		return put_user(permitted, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1710  
980fe2fddcff21 Thomas Gleixner 2022-01-05  1711  	case ARCH_GET_XCOMP_GUEST_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05  1712  		permitted = xstate_get_guest_group_perm();
980fe2fddcff21 Thomas Gleixner 2022-01-05  1713  		permitted &= XFEATURE_MASK_USER_SUPPORTED;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1714  		return put_user(permitted, uptr);
980fe2fddcff21 Thomas Gleixner 2022-01-05  1715  
980fe2fddcff21 Thomas Gleixner 2022-01-05  1716  	case ARCH_REQ_XCOMP_GUEST_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05  1717  		guest = true;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1718  		fallthrough;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1719  
db8268df0983ad Chang S. Bae    2021-10-21  1720  	case ARCH_REQ_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1721  		if (!IS_ENABLED(CONFIG_X86_64))
db8268df0983ad Chang S. Bae    2021-10-21  1722  			return -EOPNOTSUPP;
db8268df0983ad Chang S. Bae    2021-10-21  1723  
980fe2fddcff21 Thomas Gleixner 2022-01-05  1724  		return xstate_request_perm(idx, guest);
db8268df0983ad Chang S. Bae    2021-10-21  1725  
db8268df0983ad Chang S. Bae    2021-10-21  1726  	default:
db8268df0983ad Chang S. Bae    2021-10-21  1727  		return -EINVAL;
db8268df0983ad Chang S. Bae    2021-10-21  1728  	}
db8268df0983ad Chang S. Bae    2021-10-21  1729  }
db8268df0983ad Chang S. Bae    2021-10-21  1730  

:::::: The code at line 1691 was first introduced by commit
:::::: db8268df0983adc2bb1fb48c9e5f7bfbb5f617f3 x86/arch_prctl: Add controls for dynamic XSTATE components

:::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
