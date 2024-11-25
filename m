Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4561AF0B6
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543150; cv=none; b=LnMvSDlAjKM2y9X+A2qfbtbCTgK9qebiPYzyGer4W1D+eaGZ+1Vi5m9vPUgbaBjUN3kLZSHVw0C4msZwpYepqrPNtM7zWCGa3kGG06IDMB3CeYlPZhaohJljD15JeFo994wfYqjtnPvYboaEFv3ncmMvvm8s6LUh1P16PrWVc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543150; c=relaxed/simple;
	bh=9btdhEQ6vC+MDex1fX6p9pNvPUc40vblFDvHwtmrJhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+NlFuSBrxgjyQNOYbk2+saoLI62UCQdPf2LjbcTIb1cUAr0ubFugy8QyQlDMKwDi1jD+LKDC28lQ2GxF4ARQUwCczi9+yRYmmhWFophkSus8rbNN2oiQAzc0g1JZXK5WILYluBdycH0kkriqYGf0Ye6GrnM/pouCs1RVo3v4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkodDuXk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkodDuXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732543149; x=1764079149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9btdhEQ6vC+MDex1fX6p9pNvPUc40vblFDvHwtmrJhs=;
  b=kkodDuXkJyxzeeSE/z/P7n2aZCDPVRfrtGOxiHaaY9fSeKJeimm/7m8c
   P8PoZxyvO6tgsPcFmmsRd/4ShBaey7CE4oahwQ/o1kFljKD23YWf75E02
   ICXPcFCvfjWGn+KT1EwKjAV5W1r9regDwlmkf1BLwYfzoN7wwIhvC5Yew
   +T88L5adOJ4rTy9MXG0Iqjyqj2MVSdKzV9ArYXReH5lOWTaKjyS1nPIHA
   V8vxjltbp7Tz7WquMClDT6NeVVbu5+HNx9ylYvy+TlSwmyMmiTZXrhQAz
   2PewapJVeRWldJajv8y3oTJRiNCb1RXnUEMu3+wzQQorMVqhBddGwFIPw
   A==;
X-CSE-ConnectionGUID: ekoLt2V9QQm4vXrSLwKdBg==
X-CSE-MsgGUID: 2IZ912uERhW1kr/OUuXP9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32390981"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32390981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:59:08 -0800
X-CSE-ConnectionGUID: /muY7yN8TxKdPBnjGgzOmg==
X-CSE-MsgGUID: PABBdm1lS0SdMTNcYp6J9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91176239"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Nov 2024 05:59:07 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZcG-0006Sh-2U;
	Mon, 25 Nov 2024 13:59:04 +0000
Date: Mon, 25 Nov 2024 21:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 5/16] mm/vmscan.c:3679 reset_ctrl_pos()
 error: buffer overflow 'lrugen->nr_pages[next_gen][type]' 3 <= 3
Message-ID: <202411252126.fpKorPPx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b2b621a35c99ae939056ecf51631858aff950acc
commit: 31ee01d6177c6425cac96c3a479ac109013f5755 [5/16] CHROMIUM: mm/mglru: age at different rates
:::::: branch date: 4 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241125/202411252126.fpKorPPx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411252126.fpKorPPx-lkp@intel.com/

smatch warnings:
mm/vmscan.c:3679 reset_ctrl_pos() error: buffer overflow 'lrugen->nr_pages[next_gen][type]' 3 <= 3

vim +3679 mm/vmscan.c

2b29ac9f92f57d7 David Stevens 2024-07-12  3652  
2b29ac9f92f57d7 David Stevens 2024-07-12  3653  static void reset_ctrl_pos(struct lruvec *lruvec, int type)
2b29ac9f92f57d7 David Stevens 2024-07-12  3654  {
2b29ac9f92f57d7 David Stevens 2024-07-12  3655  	int hist, tier;
2b29ac9f92f57d7 David Stevens 2024-07-12  3656  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
31ee01d6177c642 David Stevens 2024-06-06  3657  	unsigned long carry_from_seq = lrugen->min_seq[type];
31ee01d6177c642 David Stevens 2024-06-06  3658  	unsigned long next_seq = carry_from_seq + 1;
31ee01d6177c642 David Stevens 2024-06-06  3659  	unsigned long next_gen = lru_gen_from_seq(next_seq);
31ee01d6177c642 David Stevens 2024-06-06  3660  	long total_nr_pages = 0;
2b29ac9f92f57d7 David Stevens 2024-07-12  3661  
2b29ac9f92f57d7 David Stevens 2024-07-12  3662  	lockdep_assert_held(&lruvec->lru_lock);
ac35a490237446b Yu Zhao       2022-09-18  3663  
31ee01d6177c642 David Stevens 2024-06-06  3664  	hist = lru_hist_from_seq(carry_from_seq);
ac35a490237446b Yu Zhao       2022-09-18  3665  
ac35a490237446b Yu Zhao       2022-09-18  3666  	for (tier = 0; tier < MAX_NR_TIERS; tier++) {
ac35a490237446b Yu Zhao       2022-09-18  3667  		unsigned long sum;
ac35a490237446b Yu Zhao       2022-09-18  3668  
ac35a490237446b Yu Zhao       2022-09-18  3669  		sum = lrugen->avg_refaulted[type][tier] +
ac35a490237446b Yu Zhao       2022-09-18  3670  		      atomic_long_read(&lrugen->refaulted[hist][type][tier]);
ac35a490237446b Yu Zhao       2022-09-18  3671  		WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum / 2);
ac35a490237446b Yu Zhao       2022-09-18  3672  
ac35a490237446b Yu Zhao       2022-09-18  3673  		sum = lrugen->avg_total[type][tier] +
ac35a490237446b Yu Zhao       2022-09-18  3674  		      atomic_long_read(&lrugen->evicted[hist][type][tier]);
ac35a490237446b Yu Zhao       2022-09-18  3675  		if (tier)
ac35a490237446b Yu Zhao       2022-09-18  3676  			sum += lrugen->protected[hist][type][tier - 1];
ac35a490237446b Yu Zhao       2022-09-18  3677  		WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2);
ac35a490237446b Yu Zhao       2022-09-18  3678  
31ee01d6177c642 David Stevens 2024-06-06 @3679  		total_nr_pages += lrugen->nr_pages[next_gen][type][tier];
ac35a490237446b Yu Zhao       2022-09-18  3680  	}
31ee01d6177c642 David Stevens 2024-06-06  3681  	/* nr_pages is eventually consistent, so fix up the estimate if it's negative. */
31ee01d6177c642 David Stevens 2024-06-06  3682  	total_nr_pages = max(total_nr_pages, 0);
2b29ac9f92f57d7 David Stevens 2024-07-12  3683  
2b29ac9f92f57d7 David Stevens 2024-07-12  3684  	if (NR_HIST_GENS == 1)
31ee01d6177c642 David Stevens 2024-06-06  3685  		reset_histograms(lruvec, type, carry_from_seq);
31ee01d6177c642 David Stevens 2024-06-06  3686  
31ee01d6177c642 David Stevens 2024-06-06  3687  	hist = lru_hist_from_seq(next_seq);
31ee01d6177c642 David Stevens 2024-06-06  3688  	WRITE_ONCE(lrugen->victim_seq[hist][type], READ_ONCE(lrugen->min_seq[!type]));
31ee01d6177c642 David Stevens 2024-06-06  3689  	WRITE_ONCE(lrugen->oldest_gen_size[hist][type], total_nr_pages);
31ee01d6177c642 David Stevens 2024-06-06  3690  }
31ee01d6177c642 David Stevens 2024-06-06  3691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
