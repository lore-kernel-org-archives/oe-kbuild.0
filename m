Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCA22B8D3
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427429; cv=none; b=PVQGo+HHnBglHNdYO38SGwmkqUHvSzuUl+MP2zUHP/dz50Y+iWuLFcsvJ3Zac1qpFDe1TSMqpC4QxXkDMr5RIVM/tNoJqeenJYB6s+RTre5mhVU6qwFMNxhDWT8L4vaazRrcd9lb4+1HV8F8XIXbqT/ITbj4BshJ0aH9CwCI0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427429; c=relaxed/simple;
	bh=KWbuDItAm7PSjZNRmyYe6uKxw2nV/aDHE9LTAyRpH/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwcYqH4ls7/oyNavcf/2gClEgd0MkbMPkcmMJIjONaXMSX2YL52V4NXGpH00lJJf69ou+X4IzUdozAxxm7u6r8n7S6HcXWNbjKavqfNouZdee0H5C83479MYhTf4G24bIQj5NRlrlZd3447aJkdz2wLWkWD5J9wYINuYw9Nbj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svpn9H6R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svpn9H6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733427427; x=1764963427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWbuDItAm7PSjZNRmyYe6uKxw2nV/aDHE9LTAyRpH/k=;
  b=Svpn9H6RR9IrYp0uo06Kv727iOdLpP5D8uDMwpGMJma+CuFrNgVmxy4t
   n1qi26jr9p27fHu/mD2cml1o8Q+2qENN0jrJmO8Sw6uFuVrHHhFj1lQvk
   iFpgrMrswzHBEdDBfi3etpzoMoRx7Dl8gWCML7I2cS0oqwy1cFFaChf0Y
   MoGYwMQuq4Alt3GeOkUgg1GhzOGfGdljbbP/bYxAtGvf9OQz/OBKP4jy1
   V+AFF6khHn2zt+KtIk84qq7CK/NH9ume8l3KP3kRXP4cmgfzo/aBz4BHu
   516bfbLzhz/MHRMrx+4Is4Td1h5gAoYNCuLvxiV8Pnn/SqiF66ACu7I0E
   A==;
X-CSE-ConnectionGUID: 2zUGD+BZSse/4tyGBF74zg==
X-CSE-MsgGUID: j/scWBZgRsCMGVfv5L4YXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37549041"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="37549041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 11:37:07 -0800
X-CSE-ConnectionGUID: 3xMrL2T/TvyL6XIit2Lg4A==
X-CSE-MsgGUID: a1jK4QZTRseU20+Ka+gOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="94270143"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Dec 2024 11:37:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJHeo-0000LR-38;
	Thu, 05 Dec 2024 19:37:02 +0000
Date: Fri, 6 Dec 2024 03:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/ath11k/ce.c:375
 ath11k_ce_srng_msi_ring_params_setup() error: uninitialized symbol
 'addr_lo'.
Message-ID: <202412060325.Pvm5LKPT-lkp@intel.com>
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
TO: Govind Singh <govinds@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: c4eacabee22415194e8cc7e8dd4913897b058927 ath11k: configure copy engine msi address in CE srng
date:   4 years, 4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 years, 4 months ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241206/202412060325.Pvm5LKPT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412060325.Pvm5LKPT-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath11k/ce.c:375 ath11k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_lo'.
drivers/net/wireless/ath/ath11k/ce.c:376 ath11k_ce_srng_msi_ring_params_setup() error: uninitialized symbol 'addr_hi'.

vim +/addr_lo +375 drivers/net/wireless/ath/ath11k/ce.c

d5c65159f28953 Kalle Valo   2019-11-23  355  
c4eacabee22415 Govind Singh 2020-08-14  356  static void ath11k_ce_srng_msi_ring_params_setup(struct ath11k_base *ab, u32 ce_id,
c4eacabee22415 Govind Singh 2020-08-14  357  						 struct hal_srng_params *ring_params)
c4eacabee22415 Govind Singh 2020-08-14  358  {
c4eacabee22415 Govind Singh 2020-08-14  359  	u32 msi_data_start;
c4eacabee22415 Govind Singh 2020-08-14  360  	u32 msi_data_count;
c4eacabee22415 Govind Singh 2020-08-14  361  	u32 msi_irq_start;
c4eacabee22415 Govind Singh 2020-08-14  362  	u32 addr_lo;
c4eacabee22415 Govind Singh 2020-08-14  363  	u32 addr_hi;
c4eacabee22415 Govind Singh 2020-08-14  364  	int ret;
c4eacabee22415 Govind Singh 2020-08-14  365  
c4eacabee22415 Govind Singh 2020-08-14  366  	ret = ath11k_get_user_msi_vector(ab, "CE",
c4eacabee22415 Govind Singh 2020-08-14  367  					 &msi_data_count, &msi_data_start,
c4eacabee22415 Govind Singh 2020-08-14  368  					 &msi_irq_start);
c4eacabee22415 Govind Singh 2020-08-14  369  
c4eacabee22415 Govind Singh 2020-08-14  370  	if (ret)
c4eacabee22415 Govind Singh 2020-08-14  371  		return;
c4eacabee22415 Govind Singh 2020-08-14  372  
c4eacabee22415 Govind Singh 2020-08-14  373  	ath11k_get_msi_address(ab, &addr_lo, &addr_hi);
c4eacabee22415 Govind Singh 2020-08-14  374  
c4eacabee22415 Govind Singh 2020-08-14 @375  	ring_params->msi_addr = addr_lo;
c4eacabee22415 Govind Singh 2020-08-14 @376  	ring_params->msi_addr |= (dma_addr_t)(((uint64_t)addr_hi) << 32);
c4eacabee22415 Govind Singh 2020-08-14  377  	ring_params->msi_data = (ce_id % msi_data_count) + msi_data_start;
c4eacabee22415 Govind Singh 2020-08-14  378  	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
c4eacabee22415 Govind Singh 2020-08-14  379  }
c4eacabee22415 Govind Singh 2020-08-14  380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
