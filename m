Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468975;
	b=Eg0vF3H1Bp8PEC/lk+RKy4DZdj8j2ATurRZDe88m6VlcVF+rNC/mKkIel2ByttNex88a
	 sBwxiEOH3hwFIYbzBfKor/4YVL9rkKcjhTjbh5m1ciiFbUfpSyCkNdOZiUMugeY4Rpf1q
	 PG/v1SjF2+mHJ8Wcx7MDmHWeeepyMMe3WK5plw8HGA5TLd9knvfefBGztoxOJ6g9g6/zy
	 F9cKW43RJKDB15Z6Ag34mhP+/nSEN2DAIvNkxF6g6j8KjOlj0csxJnNQPVR0GCTpn5cjn
	 c2zoWq97K7GdxRtdI8BkVazMze5JcY0GesDieNGoSrNa1Rc9rn4J5f5iuiPXBuwVgww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468975;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fQI9c7UFENsLMXFunuCHAmGjmD5m9vFWd1O1KI46uYw=;
	b=s1mNQo4i09cUCZRg6hTxjnFBQl8JSJyB2Mi6tr9hoPMLXEcMXg6GFZbAYy3EuRGf510h
	 eWo3/KxHCGkkPUs5Qa3Mh0B94w1KrC46WBS+gXkau0IM9e9Ie7nOhr+dVzTgGDkU0b7Oc
	 bL/pKd5sBO+eUMTTFtd66gJSmATxKXDB9dPws6esRuiUyE5dKiAI4TtjBsi0yewLxENfx
	 p4G9lAZz02mWkUZCIiO5XtABw6cisF4hXhDpyVh/Q2npXWjRdCudls3L7rO2UWTqRmqVU
	 HJl1/qV5iyk6Wata3OBP4UlHaQSOssjY9M8+GicEFJqwqOf53LVzrdEItTgTQKjV0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXw2zoRS;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC38606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 17:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXw2zoRS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793468973; x=1825004973;
  h=date:from:to:cc:subject:message-id;
  bh=scaNjXTOsJkw42ni6QzVIRqvKFcA0NPl1fnlha7tcGg=;
  b=DXw2zoRSsrym4dAz6Iaui1Q4ol7hFmsp6vsGUf8PHu8O6vhyS0iS1gPU
   r9f4cV51mbGFM9AwjIS3yi6j/MzNCZkPDOaOLJ0Fd6b/oK/G9QWGYNtNW
   GkndRvZRdoY2b/7SiUhjp4JU+Okv8i7CZO6wmoFyk5n/lksw4Maij3R5w
   +B6NcjedbJm1Qmr8jH6ST1ya+umxS+FWD6MSki1mPFnTo2zcTeCswXzEj
   4/dPZ8om9+mGo7s3BhxNpgE9r08OJL6n5km87ZiuAvLgqmrYn9mTO1uv4
   VbhD9n6rAadreczYqbjcc02+qEcSU3Av/XEyeyaQLmt+L5+FjBFkAWIN9
   A==;
X-CSE-ConnectionGUID: X5EOg8i0TseHzt/faMwPmw==
X-CSE-MsgGUID: XQ/dFCqkT8+xd8zp1l5rPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2100664"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2100664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 10:49:32 -0700
X-CSE-ConnectionGUID: YQ+VaxZwTMKUXVI+/R7w3g==
X-CSE-MsgGUID: iUKzrXJTSOW9Rox2eIMgqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5712287"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2026 10:49:30 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNDCp-0000000064F-2oPQ;
	Sat, 31 Oct 2026 17:49:27 +0000
Date: Sat, 31 Oct 2026 18:48:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/arm_rmm/rmi.c:515
 rmi_sro_donate_noncontig() error: buffer overflow 'sro->addr_list' 256 <=
 s32max
Message-ID: <202610311827.Ynz87YuS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Steven Price <steven.price@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: Gavin Shan <gshan@redhat.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: bc1360cabe273886c502d8b6b2da7f05474cb923 firmware: arm_rmm: Add support for SRO
date:   4 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r2200-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311827.Ynz87YuS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc1360cabe27 ("firmware: arm_rmm: Add support for SRO")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311827.Ynz87YuS-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_rmm/rmi.c:515 rmi_sro_donate_noncontig() error: buffer overflow 'sro->addr_list' 256 <= s32max
drivers/firmware/arm_rmm/rmi.c:515 rmi_sro_donate_noncontig() error: buffer overflow 'sro->addr_list' 256 <= s32max

vim +515 drivers/firmware/arm_rmm/rmi.c

bc1360cabe27388 Steven Price 2026-10-02  378  
bc1360cabe27388 Steven Price 2026-10-02  379  static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
bc1360cabe27388 Steven Price 2026-10-02  380  				    unsigned long sro_handle,
bc1360cabe27388 Steven Price 2026-10-02  381  				    unsigned long donatereq,
bc1360cabe27388 Steven Price 2026-10-02  382  				    struct arm_smccc_1_2_regs *out_regs,
bc1360cabe27388 Steven Price 2026-10-02  383  				    gfp_t gfp)
bc1360cabe27388 Steven Price 2026-10-02  384  {
bc1360cabe27388 Steven Price 2026-10-02  385  	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
bc1360cabe27388 Steven Price 2026-10-02  386  	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
bc1360cabe27388 Steven Price 2026-10-02  387  	unsigned long count = RMI_DONATE_COUNT(donatereq);
bc1360cabe27388 Steven Price 2026-10-02  388  	unsigned long state = RMI_DONATE_STATE(donatereq);
bc1360cabe27388 Steven Price 2026-10-02  389  	unsigned long found = 0;
bc1360cabe27388 Steven Price 2026-10-02  390  	unsigned long donated_granules;
bc1360cabe27388 Steven Price 2026-10-02  391  	unsigned long granules_per_block = block_size >> PAGE_SHIFT;
bc1360cabe27388 Steven Price 2026-10-02  392  	unsigned long consumed_blocks;
bc1360cabe27388 Steven Price 2026-10-02  393  	int addr_list_start = sro->addr_count;
bc1360cabe27388 Steven Price 2026-10-02  394  	int ret, i, src;
bc1360cabe27388 Steven Price 2026-10-02  395  
bc1360cabe27388 Steven Price 2026-10-02  396  	/*
bc1360cabe27388 Steven Price 2026-10-02  397  	 * We can't allocate blocks more than what the buddy allocator can
bc1360cabe27388 Steven Price 2026-10-02  398  	 * satisfy. TODO: Add support for larger allocations.
bc1360cabe27388 Steven Price 2026-10-02  399  	 */
bc1360cabe27388 Steven Price 2026-10-02  400  	if (get_order(block_size) > MAX_PAGE_ORDER)
bc1360cabe27388 Steven Price 2026-10-02  401  		return -ENOMEM;
bc1360cabe27388 Steven Price 2026-10-02  402  	/*
bc1360cabe27388 Steven Price 2026-10-02  403  	 * Maximum value of RmiOpMemDonateReq:count is 2^(PAGE_SHIFT-2) - 1.
bc1360cabe27388 Steven Price 2026-10-02  404  	 * But we further clamp it down by the number of entries we can do
bc1360cabe27388 Steven Price 2026-10-02  405  	 * in one go. The RMM can request  the remaining in the next iteration.
bc1360cabe27388 Steven Price 2026-10-02  406  	 */
bc1360cabe27388 Steven Price 2026-10-02  407  	if (count > RMI_MAX_ADDR_LIST)
bc1360cabe27388 Steven Price 2026-10-02  408  		count = RMI_MAX_ADDR_LIST;
bc1360cabe27388 Steven Price 2026-10-02  409  
bc1360cabe27388 Steven Price 2026-10-02  410  	/* Gather the suitable entries to the end of the list */
bc1360cabe27388 Steven Price 2026-10-02  411  	i = 0;
bc1360cabe27388 Steven Price 2026-10-02  412  	while (i <  addr_list_start && found < count) {
bc1360cabe27388 Steven Price 2026-10-02  413  		unsigned long entry = sro->addr_list[i];
bc1360cabe27388 Steven Price 2026-10-02  414  
bc1360cabe27388 Steven Price 2026-10-02  415  		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
bc1360cabe27388 Steven Price 2026-10-02  416  		    RMI_ADDR_RANGE_COUNT(entry) == 1 &&
bc1360cabe27388 Steven Price 2026-10-02  417  		    RMI_ADDR_RANGE_STATE(entry) == state) {
bc1360cabe27388 Steven Price 2026-10-02  418  			addr_list_start--;
bc1360cabe27388 Steven Price 2026-10-02  419  			swap(sro->addr_list[addr_list_start],
bc1360cabe27388 Steven Price 2026-10-02  420  			     sro->addr_list[i]);
bc1360cabe27388 Steven Price 2026-10-02  421  			found++;
bc1360cabe27388 Steven Price 2026-10-02  422  			/* Continue from the swapped in entry */
bc1360cabe27388 Steven Price 2026-10-02  423  			continue;
bc1360cabe27388 Steven Price 2026-10-02  424  		}
bc1360cabe27388 Steven Price 2026-10-02  425  		/* Skip past the entry */
bc1360cabe27388 Steven Price 2026-10-02  426  		i++;
bc1360cabe27388 Steven Price 2026-10-02  427  	}
bc1360cabe27388 Steven Price 2026-10-02  428  
bc1360cabe27388 Steven Price 2026-10-02  429  	ret = rmi_sro_ensure_capacity(sro, count - found);
bc1360cabe27388 Steven Price 2026-10-02  430  	if (ret) {
bc1360cabe27388 Steven Price 2026-10-02  431  		/* If we have found some entries, donate them and try again */
bc1360cabe27388 Steven Price 2026-10-02  432  		if (found)
bc1360cabe27388 Steven Price 2026-10-02  433  			goto mem_donate;
bc1360cabe27388 Steven Price 2026-10-02  434  		/* Otherwise free up the list and start again */
bc1360cabe27388 Steven Price 2026-10-02  435  		rmi_sro_free(sro);
bc1360cabe27388 Steven Price 2026-10-02  436  		/* Reset the addr_list_start to match sro->addr_count */
bc1360cabe27388 Steven Price 2026-10-02  437  		addr_list_start = 0;
bc1360cabe27388 Steven Price 2026-10-02  438  	}
bc1360cabe27388 Steven Price 2026-10-02  439  
bc1360cabe27388 Steven Price 2026-10-02  440  	for (; found < count; found++) {
bc1360cabe27388 Steven Price 2026-10-02  441  		unsigned long addr_range;
bc1360cabe27388 Steven Price 2026-10-02  442  		void *virt = alloc_pages_exact(block_size, gfp);
bc1360cabe27388 Steven Price 2026-10-02  443  		phys_addr_t phys;
bc1360cabe27388 Steven Price 2026-10-02  444  
bc1360cabe27388 Steven Price 2026-10-02  445  		if (!virt)
bc1360cabe27388 Steven Price 2026-10-02  446  			return -ENOMEM;
bc1360cabe27388 Steven Price 2026-10-02  447  
bc1360cabe27388 Steven Price 2026-10-02  448  		phys = virt_to_phys(virt);
bc1360cabe27388 Steven Price 2026-10-02  449  
bc1360cabe27388 Steven Price 2026-10-02  450  		if (state == RMI_OP_MEM_DELEGATED) {
bc1360cabe27388 Steven Price 2026-10-02  451  			phys_addr_t delegated_phys;
bc1360cabe27388 Steven Price 2026-10-02  452  
bc1360cabe27388 Steven Price 2026-10-02  453  			if (rmi_delegate_range(phys, block_size, &delegated_phys)) {
bc1360cabe27388 Steven Price 2026-10-02  454  				if (!rmi_undelegate_range(phys, delegated_phys - phys))
bc1360cabe27388 Steven Price 2026-10-02  455  					free_pages_exact(virt, block_size);
bc1360cabe27388 Steven Price 2026-10-02  456  				return -ENXIO;
bc1360cabe27388 Steven Price 2026-10-02  457  			}
bc1360cabe27388 Steven Price 2026-10-02  458  		}
bc1360cabe27388 Steven Price 2026-10-02  459  
bc1360cabe27388 Steven Price 2026-10-02  460  		addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
bc1360cabe27388 Steven Price 2026-10-02  461  		FIELD_MODIFY(RMI_ADDR_RANGE_BLOCK_SIZE_MASK, &addr_range, block_size_fld);
bc1360cabe27388 Steven Price 2026-10-02  462  		FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, 1);
bc1360cabe27388 Steven Price 2026-10-02  463  		FIELD_MODIFY(RMI_ADDR_RANGE_STATE_MASK, &addr_range, state);
bc1360cabe27388 Steven Price 2026-10-02  464  
bc1360cabe27388 Steven Price 2026-10-02  465  		sro->addr_list[sro->addr_count++] = addr_range;
bc1360cabe27388 Steven Price 2026-10-02  466  	}
bc1360cabe27388 Steven Price 2026-10-02  467  
bc1360cabe27388 Steven Price 2026-10-02  468  mem_donate:
bc1360cabe27388 Steven Price 2026-10-02  469  	rmi_op_mem_donate(sro_handle,
bc1360cabe27388 Steven Price 2026-10-02  470  			  virt_to_phys(&sro->addr_list[addr_list_start]),
bc1360cabe27388 Steven Price 2026-10-02  471  			  found, 0, out_regs);
bc1360cabe27388 Steven Price 2026-10-02  472  
bc1360cabe27388 Steven Price 2026-10-02  473  	donated_granules = out_regs->a1;
bc1360cabe27388 Steven Price 2026-10-02  474  	/*
bc1360cabe27388 Steven Price 2026-10-02  475  	 * The RMM shouldn't report more granules than we provided, but clamp
bc1360cabe27388 Steven Price 2026-10-02  476  	 * just in case.
bc1360cabe27388 Steven Price 2026-10-02  477  	 */
bc1360cabe27388 Steven Price 2026-10-02  478  	if (WARN_ON_ONCE(donated_granules > found * granules_per_block))
bc1360cabe27388 Steven Price 2026-10-02  479  		donated_granules = found * granules_per_block;
bc1360cabe27388 Steven Price 2026-10-02  480  
bc1360cabe27388 Steven Price 2026-10-02  481  	/*
bc1360cabe27388 Steven Price 2026-10-02  482  	 * The RMM reports the consumed memory in terms of granules, but we
bc1360cabe27388 Steven Price 2026-10-02  483  	 * track in the address lists in block-sized ranges. So divide to get
bc1360cabe27388 Steven Price 2026-10-02  484  	 * the number of (complete) consumed blocks.
bc1360cabe27388 Steven Price 2026-10-02  485  	 */
bc1360cabe27388 Steven Price 2026-10-02  486  	consumed_blocks = donated_granules / granules_per_block;
bc1360cabe27388 Steven Price 2026-10-02  487  	if (donated_granules % granules_per_block) {
bc1360cabe27388 Steven Price 2026-10-02  488  		/*
bc1360cabe27388 Steven Price 2026-10-02  489  		 * A block has been partially consumed, the start is owned by
bc1360cabe27388 Steven Price 2026-10-02  490  		 * the RMM, the tail is owned by the host
bc1360cabe27388 Steven Price 2026-10-02  491  		 */
bc1360cabe27388 Steven Price 2026-10-02  492  		unsigned long entry =
bc1360cabe27388 Steven Price 2026-10-02  493  			sro->addr_list[addr_list_start + consumed_blocks];
bc1360cabe27388 Steven Price 2026-10-02  494  		unsigned long donated_size =
bc1360cabe27388 Steven Price 2026-10-02  495  			(donated_granules % granules_per_block) << PAGE_SHIFT;
bc1360cabe27388 Steven Price 2026-10-02  496  
bc1360cabe27388 Steven Price 2026-10-02  497  		free_addr_range(entry, donated_size);
bc1360cabe27388 Steven Price 2026-10-02  498  		/*
bc1360cabe27388 Steven Price 2026-10-02  499  		 * This block is now fully 'consumed' (either held by the RMM or
bc1360cabe27388 Steven Price 2026-10-02  500  		 * freed)
bc1360cabe27388 Steven Price 2026-10-02  501  		 */
bc1360cabe27388 Steven Price 2026-10-02  502  		consumed_blocks++;
bc1360cabe27388 Steven Price 2026-10-02  503  	}
bc1360cabe27388 Steven Price 2026-10-02  504  
bc1360cabe27388 Steven Price 2026-10-02  505  	/*
bc1360cabe27388 Steven Price 2026-10-02  506  	 * Keep just the blocks the RMM didn't use in addr_list
bc1360cabe27388 Steven Price 2026-10-02  507  	 * RMM claimed consumed_blocks entries from addr_list_start.
bc1360cabe27388 Steven Price 2026-10-02  508  	 * Move the entries left out at the end i.e.,
bc1360cabe27388 Steven Price 2026-10-02  509  	 * [ addr_list_start + consumed_blocks, addr_list_start + found)
bc1360cabe27388 Steven Price 2026-10-02  510  	 * to the rest of the valid entries and adjust the addr_count to
bc1360cabe27388 Steven Price 2026-10-02  511  	 * reflect the available entries.
bc1360cabe27388 Steven Price 2026-10-02  512  	 */
bc1360cabe27388 Steven Price 2026-10-02  513  	for (i = 0, src = addr_list_start + consumed_blocks;
bc1360cabe27388 Steven Price 2026-10-02  514  		i < found - consumed_blocks; i++)
bc1360cabe27388 Steven Price 2026-10-02 @515  		sro->addr_list[addr_list_start + i] = sro->addr_list[src + i];
bc1360cabe27388 Steven Price 2026-10-02  516  
bc1360cabe27388 Steven Price 2026-10-02  517  	sro->addr_count -= consumed_blocks;
bc1360cabe27388 Steven Price 2026-10-02  518  
bc1360cabe27388 Steven Price 2026-10-02  519  	return 0;
bc1360cabe27388 Steven Price 2026-10-02  520  }
bc1360cabe27388 Steven Price 2026-10-02  521  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
