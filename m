Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CEEEC8
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382613; cv=none; b=Xyt83yiQ7noe7j5N7YrmbWSKrMCHfjwYTcjIpLvDZ87xDR2Qs/2RM6/8IYVaoW33VlpDeQ/o8J2OaQSPKnRipvY1qVKJjQBNIo2vepiOn67K6r6RNRUC+bEvCmqe/mRsg9c9Ph7se1eV6mDE8+7HAXVP/Xl55xwohhPinm4PJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382613; c=relaxed/simple;
	bh=DFwwp8Lhp6Lv7bwPT/cJ77pqMCQU8jkM1MW43TBGSMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8A3Q4/onfk89O4ptdDLGA3Fs4XAUUGFd02L3lyLcs5a+v1PFyVFhas0HvA3TEJmOHAyp9wJxLbjR5P9rAmYvPssE4Reld448MRscujgTQNGcUmwCKlRrgY4lO8TbtdNAEAQ0RkibhencUjG2fgA0zqmZPeclYuwOmEl+Sozrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGp0/jV/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGp0/jV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728382611; x=1759918611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFwwp8Lhp6Lv7bwPT/cJ77pqMCQU8jkM1MW43TBGSMI=;
  b=mGp0/jV/WfP2HvYqP69YDPv3q2WgujSLH6Omh3pOdeOSFIQn8uxqN4o0
   DNsx+ZPjDbnnTK7cOqcAv3ZcSYPiFW8JpH4Pw2DgPa+wvF1VyKsodVGDJ
   v5i1lQGHYQta7iPcJ+0ARIuJshIfsMyL+cbdpkCCSerDDG/e0/yib7/NT
   n6ZY6FFqo5IixewnlSu5KW3CnmTqEcVNBKTbVWHMs6ZNT+pbe6zbUK3Wg
   k6NV0Vb5His6LGh1ZE7h7hWrJqeQCL++B0GzonLzCRaDwkZ1fkjM9XrWg
   6wYLVdOiZ8WWaPOD5Tg8/YochmdO1QnmMj5AxgMxofprHSUQOoAETMHNg
   A==;
X-CSE-ConnectionGUID: v3rY+bwZQQ2p1R7u61q2Lg==
X-CSE-MsgGUID: Ku/8y8BVQ3ujHEuKFORuMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31353894"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="31353894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 03:16:51 -0700
X-CSE-ConnectionGUID: cgGYAHaoRMa2FffN2OcaWw==
X-CSE-MsgGUID: QBG0WFKHSbeA6jFYQ0QoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80218561"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2024 03:16:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy7Gp-0006F2-1X;
	Tue, 08 Oct 2024 10:16:47 +0000
Date: Tue, 8 Oct 2024 18:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 22/81]
 drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we
 previously assumed 'ab' could be null (see line 9389)
Message-ID: <202410081858.ShABiCCT-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Harshitha Prem <quic_hprem@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   4ad14f50820745f9c2f425ba07ca8431bf2409ed
commit: 6c252823bedb7f8f34d53dddadd65761f85bd3c4 [22/81] wifi: ath12k: move ath12k_hw from per device to group
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081858.ShABiCCT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410081858.ShABiCCT-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 9389)

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1427 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1415 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:4828 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:4830 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.

vim +/ab +9400 drivers/net/wireless/ath/ath12k/mac.c

8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9379  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9380  void ath12k_mac_destroy(struct ath12k_hw_group *ag)
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9381  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9382  	struct ath12k_pdev *pdev;
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9383  	struct ath12k_base *ab = ag->ab[0];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9384  	int i, j;
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9385  	struct ath12k_hw *ah;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9386  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9387  	for (i = 0; i < ag->num_devices; i++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9388  		ab = ag->ab[i];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12 @9389  		if (!ab)
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9390  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9391  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9392  		for (j = 0; j < ab->num_radios; j++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9393  			pdev = &ab->pdevs[j];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9394  			if (!pdev->ar)
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9395  				continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9396  			pdev->ar = NULL;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9397  		}
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9398  	}
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9399  
e46d266981a601 Karthikeyan Periyasamy 2024-04-12 @9400  	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9401  		ah = ath12k_ab_to_ah(ab, i);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9402  		if (!ah)
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9403  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9404  
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9405  		ath12k_mac_hw_destroy(ah);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9406  		ath12k_ab_set_ah(ab, i, NULL);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9407  	}
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9408  }
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9409  

:::::: The code at line 9400 was first introduced by commit
:::::: e46d266981a6010652a9faeed214067146408943 wifi: ath12k: Add ath12k_get_num_hw api

:::::: TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
