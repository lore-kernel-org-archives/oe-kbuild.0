Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE552147E0
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 17:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787490; cv=none; b=uRHgT4E8/u24V29vn2D2qbkFLfhT/8CGU0TQqvIzs1c15wr0Rl8RYQGExcdAhJBupaxcYs/nPro3vU41vvUA4orEFqXoVvHoknoWlQC/gT0y8IIiarXzET6qM6yCLdMR6A2sj2pW7yNcQ/WEGEJ+xY9qti1Wup+SRwQjTVPOT+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787490; c=relaxed/simple;
	bh=VXOUurJJ/i2+0Q1Om0VlyeNgAjVlA1pVN+tX4ozSBaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+TWoA7qeCC1bo1ytxi84odCSucjf47G7QwMmkuWb4w/REzMzJI4Av89iBPPWMBjUcYw/M02CLM0b2oMgoxqDIyKYuFwncaUwbMRNVoNuH/AAW4eAAN8keXb5Tuk2eoa9sy3OJ6tK/IYedaVB+aZ6T2Lz8OVrkbBTcizMnNm71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz6b6NoS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mz6b6NoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743787489; x=1775323489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXOUurJJ/i2+0Q1Om0VlyeNgAjVlA1pVN+tX4ozSBaE=;
  b=mz6b6NoSmsng6I8pF58gxjK14qHd/cYr+1lSO35N/rEHHTFD2UWV6EC5
   nqXGlg6V6TyJzlwCsISa3bfxNbWGVlBgOL8zN34xx3UhxubcPCEpiHTAD
   ro7yV6XMgge1QYHqntMnlNAI8HTAvpzAak11/n4N3hq4SQ6uMuuZVloo2
   k9zEI3H/Jf9l97y6VYmFBXBPEf8jCf3WJk4678NaBtFV4kQzobegLcnLt
   MA3AQmaeRjaXn4uwXlSq0625mGZcuNkMigNKTGndFD9908IqEmHDiVLqv
   FTglL42RXIpHB6qHGIubuTmt4IlIOCgE7NjJP0Lck2/3tGLUcWQIYGhCW
   g==;
X-CSE-ConnectionGUID: geo7otdhQLS4MV2Iv8kCZw==
X-CSE-MsgGUID: LfdGB+Q3RFyob8pEuTXU9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45325986"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45325986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:24:46 -0700
X-CSE-ConnectionGUID: CDhzLW6uTiOZXy9XmdoB0w==
X-CSE-MsgGUID: H3lHNIMFT7qUuaGKOop2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127880518"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 10:24:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kmY-0001Pz-2h;
	Fri, 04 Apr 2025 17:24:42 +0000
Date: Sat, 5 Apr 2025 01:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:ufs-lrbp-as-priv-data 16/25]
 drivers/ufs/core/ufs-mcq.c:171:9: error: call to '__compiletime_assert_387'
 declared with 'error' attribute: min(mac, ufs_dev_qd) signedness error
Message-ID: <202504050113.j08txwm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@google.com>

tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
head:   64402c397d056783699e6297d4631c9185a14c04
commit: 3400bc469519aedfe0726bf992e9743619634f5c [16/25] scsi: ufs: core: Add an argument to ufshcd_mcq_decide_queue_depth()
:::::: branch date: 21 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-003-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050113.j08txwm4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050113.j08txwm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504050113.j08txwm4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ufs/core/ufs-mcq.c:171:9: error: call to '__compiletime_assert_387' declared with 'error' attribute: min(mac, ufs_dev_qd) signedness error
     171 |         return min(mac, ufs_dev_qd);
         |                ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:48:1: note: expanded from here
      48 | __compiletime_assert_387
         | ^
   1 error generated.


vim +171 drivers/ufs/core/ufs-mcq.c

175d1825ca4d22 Minwoo Im       2024-06-01  131  
7224c806876e46 Asutosh Das     2023-01-13  132  /**
7224c806876e46 Asutosh Das     2023-01-13  133   * ufshcd_mcq_decide_queue_depth - decide the queue depth
b62c8292d223c8 Bart Van Assche 2023-02-02  134   * @hba: per adapter instance
3400bc469519ae Bart Van Assche 2025-03-05  135   * @ufs_dev_qd: maximum queue depth supported by the UFS device
7224c806876e46 Asutosh Das     2023-01-13  136   *
3a17fefe0f1960 Bart Van Assche 2023-07-27  137   * Return: queue-depth on success, non-zero on error
7224c806876e46 Asutosh Das     2023-01-13  138   *
7224c806876e46 Asutosh Das     2023-01-13  139   * MAC - Max. Active Command of the Host Controller (HC)
7224c806876e46 Asutosh Das     2023-01-13  140   * HC wouldn't send more than this commands to the device.
7224c806876e46 Asutosh Das     2023-01-13  141   * Calculates and adjusts the queue depth based on the depth
7224c806876e46 Asutosh Das     2023-01-13  142   * supported by the HC and ufs device.
7224c806876e46 Asutosh Das     2023-01-13  143   */
3400bc469519ae Bart Van Assche 2025-03-05  144  int ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba, u32 ufs_dev_qd)
7224c806876e46 Asutosh Das     2023-01-13  145  {
7224c806876e46 Asutosh Das     2023-01-13  146  	int mac;
7224c806876e46 Asutosh Das     2023-01-13  147  
af568c7e8292bd Bart Van Assche 2024-07-08  148  	if (!hba->vops || !hba->vops->get_hba_mac) {
af568c7e8292bd Bart Van Assche 2024-07-08  149  		/*
af568c7e8292bd Bart Van Assche 2024-07-08  150  		 * Extract the maximum number of active transfer tasks value
af568c7e8292bd Bart Van Assche 2024-07-08  151  		 * from the host controller capabilities register. This value is
af568c7e8292bd Bart Van Assche 2024-07-08  152  		 * 0-based.
af568c7e8292bd Bart Van Assche 2024-07-08  153  		 */
af568c7e8292bd Bart Van Assche 2024-07-08  154  		hba->capabilities =
af568c7e8292bd Bart Van Assche 2024-07-08  155  			ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
af568c7e8292bd Bart Van Assche 2024-07-08  156  		mac = hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS_MCQ;
af568c7e8292bd Bart Van Assche 2024-07-08  157  		mac++;
af568c7e8292bd Bart Van Assche 2024-07-08  158  	} else {
5e2053a41984f6 Bart Van Assche 2024-07-08  159  		mac = hba->vops->get_hba_mac(hba);
7224c806876e46 Asutosh Das     2023-01-13  160  	}
5e2053a41984f6 Bart Van Assche 2024-07-08  161  	if (mac < 0)
5e2053a41984f6 Bart Van Assche 2024-07-08  162  		goto err;
7224c806876e46 Asutosh Das     2023-01-13  163  
7224c806876e46 Asutosh Das     2023-01-13  164  	/*
3400bc469519ae Bart Van Assche 2025-03-05  165  	 * According to the UFS standard, the UFS device queue depth
3400bc469519ae Bart Van Assche 2025-03-05  166  	 * (bQueueDepth) must be in the range 1..255 if the shared queueing
3400bc469519ae Bart Van Assche 2025-03-05  167  	 * architecture is supported. bQueueDepth is zero if the shared queueing
3400bc469519ae Bart Van Assche 2025-03-05  168  	 * architecture is not supported.
7224c806876e46 Asutosh Das     2023-01-13  169  	 */
3400bc469519ae Bart Van Assche 2025-03-05  170  	WARN_ON_ONCE(!ufs_dev_qd);
3400bc469519ae Bart Van Assche 2025-03-05 @171  	return min(mac, ufs_dev_qd);
5e2053a41984f6 Bart Van Assche 2024-07-08  172  
5e2053a41984f6 Bart Van Assche 2024-07-08  173  err:
5e2053a41984f6 Bart Van Assche 2024-07-08  174  	dev_err(hba->dev, "Failed to get mac, err=%d\n", mac);
5e2053a41984f6 Bart Van Assche 2024-07-08  175  	return mac;
7224c806876e46 Asutosh Das     2023-01-13  176  }
7224c806876e46 Asutosh Das     2023-01-13  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
