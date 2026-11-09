Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249035;
	b=GcQqzB5cIUhhv2ellkWIbljszm0Wm5OCBlLZC9dcpDlAXEgnHJLcnVudVlqUy50qU/A+
	 hksYNYB7RyVTqhyZc49liAeBkCoI+iLIxo/1ABv0NyzN8Qdmnj/6c8m3OMq1b7oNpsEpY
	 xgJKiRtMTxu5dAzc6Htt8Q1jwbXQN/9ZhxfKEF50xUqKxxPMcenNM9t+rpa4T+EWXGoGr
	 h5c0moL59dy3AHem+93b29glLNhs7fXzZiRK9o73cwZw7fO9oQSPv1f/iOZFFrwMHBW6r
	 ycETowniHg1PcSV1R388iYLFWvko0pMEeBBfhb5IwIqrXs4RZY4Vqn9RB+72GEGwrdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PCT6Hm6+cIpbFOUC0ncVwKEu2Q7X9QikZncYiNlcJYc=;
	b=xWwB3bj8mHs0lqbeefH6eTSJXJCWkzKGPR0VCYDVFCUjzeS9OcpMV69o3yaFxNlKlJPO
	 kiN3VQd6hOtV3RGJzA4O4K7W50YD6nATjPu2oKBM4009zHz/qLzmc2i/A0WzytIIQ1bHf
	 XLTREOrWLov54Yeo4SAdx9NPAcoXb7L9nkLZ9yzWC3ZODS8RuC33GNv5+qeIdKhrRJtNE
	 8gURr/vPUki9JCXo+RiLHzJavJbfAKSuRIzCPdKYHmsjLiHa8eXI6Q9qoy95uEbJ3E3E7
	 AsnETYjrQW/5KeWT7TaRa04jZb2iRY8WDxcg8bmtIgIKBXvZKlczlsLiAty3XriLUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWe5E5Kc;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8B7606A5DC
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 18:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8B7606A5DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWe5E5Kc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794249033; x=1825785033;
  h=date:from:to:cc:subject:message-id;
  bh=e4mINk60HOP0O5C7x97w/WOcA2qIyJwKufQ58GO5JY8=;
  b=bWe5E5Kc0i/7VleOGnF7dZb1rySQLpZbZNKf/2hQsSMKlBHSyJaL1arw
   rLxYga+xGJAO4vHV+8U+QGbH0RarWIufvECCG5DAbL/SOfADH1fF9UF8A
   ayz1RDC0yNUOKxefo1tM0EMqYV6prma5Gm2z1qRYQKSfrW+kQcwmbuZQw
   YH0o7g0y3XNdopICw7hL/hCCQ3LBnj5edPU152C4e6RBFDhPLMevPpITS
   FJT/MjBpn5C4YfjE2cyqeg9Zkzujl1mPEgUbjVCUX9ReHES5sZHQImzij
   21jsEMmgrbnyhQpBxINzwjtEMK+dptPt6htf+S0YKyficGL9x59Z5aAOz
   g==;
X-CSE-ConnectionGUID: NxNUVsYBRnSGIONXHhxosg==
X-CSE-MsgGUID: BEbsrUG4SgShdImVBT80Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2983272"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2983272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:30:32 -0800
X-CSE-ConnectionGUID: LEj6Pt+bRTaXCynXjd2fOg==
X-CSE-MsgGUID: WGkw6OemTb2ZkWFSOMFlHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8252203"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2026 10:30:30 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQU8S-000000000RD-0yMA;
	Mon, 09 Nov 2026 18:30:28 +0000
Date: Mon, 09 Nov 2026 19:29:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sudeep-holla:for-next/arm_fw/updates 2/2]
 drivers/firmware/arm/rmm/rmi.c:535 rmi_sro_donate_noncontig() error: buffer
 overflow 'sro->addr_list' 256 <= s32max
Message-ID: <202611091947.OFBRJdT4-lkp@intel.com>
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
TO: Sudeep Holla <sudeep.holla@kernel.org>
CC: Yeoreum Yun <yeoreum.yun@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/arm_fw/updates
head:   49c49ca0c4d02848a9576f72c4741c38c5ba09de
commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de [2/2] firmware: arm: Group interface drivers under arm/
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091947.OFBRJdT4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611091947.OFBRJdT4-lkp@intel.com/

smatch warnings:
drivers/firmware/arm/rmm/rmi.c:535 rmi_sro_donate_noncontig() error: buffer overflow 'sro->addr_list' 256 <= s32max
drivers/firmware/arm/rmm/rmi.c:535 rmi_sro_donate_noncontig() error: buffer overflow 'sro->addr_list' 256 <= s32max

vim +535 drivers/firmware/arm/rmm/rmi.c

bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  398  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  399  static int rmi_sro_donate_noncontig(struct rmi_sro_state *sro,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  400  				    unsigned long sro_handle,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  401  				    unsigned long donatereq,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  402  				    struct arm_smccc_1_2_regs *out_regs,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  403  				    gfp_t gfp)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  404  {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  405  	unsigned long block_size_fld = RMI_DONATE_BLOCK_SIZE(donatereq);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  406  	unsigned long block_size = rmi_addr_block_size_to_bytes(block_size_fld);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  407  	unsigned long count = RMI_DONATE_COUNT(donatereq);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  408  	unsigned long state = RMI_DONATE_STATE(donatereq);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  409  	unsigned long found = 0;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  410  	unsigned long donated_granules;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  411  	unsigned long granules_per_block = block_size >> PAGE_SHIFT;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  412  	unsigned long consumed_blocks;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  413  	int addr_list_start = sro->addr_count;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  414  	int ret, i, src;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  415  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  416  	/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  417  	 * We can't allocate blocks more than what the buddy allocator can
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  418  	 * satisfy. TODO: Add support for larger allocations.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  419  	 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  420  	if (get_order(block_size) > MAX_PAGE_ORDER)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  421  		return -ENOMEM;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  422  	/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  423  	 * Maximum value of RmiOpMemDonateReq:count is 2^(PAGE_SHIFT-2) - 1.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  424  	 * But we further clamp it down by the number of entries we can do
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  425  	 * in one go. The RMM can request  the remaining in the next iteration.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  426  	 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  427  	if (count > RMI_MAX_ADDR_LIST)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  428  		count = RMI_MAX_ADDR_LIST;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  429  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  430  	/* Gather the suitable entries to the end of the list */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  431  	i = 0;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  432  	while (i <  addr_list_start && found < count) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  433  		unsigned long entry = sro->addr_list[i];
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  434  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  435  		if (RMI_ADDR_RANGE_BLOCK_SIZE(entry) == block_size_fld &&
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  436  		    RMI_ADDR_RANGE_COUNT(entry) == 1 &&
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  437  		    RMI_ADDR_RANGE_STATE(entry) == state) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  438  			addr_list_start--;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  439  			swap(sro->addr_list[addr_list_start],
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  440  			     sro->addr_list[i]);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  441  			found++;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  442  			/* Continue from the swapped in entry */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  443  			continue;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  444  		}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  445  		/* Skip past the entry */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  446  		i++;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  447  	}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  448  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  449  	ret = rmi_sro_ensure_capacity(sro, count - found);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  450  	if (ret) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  451  		/* If we have found some entries, donate them and try again */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  452  		if (found)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  453  			goto mem_donate;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  454  		/* Otherwise free up the list and start again */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  455  		rmi_sro_free(sro);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  456  		/* Reset the addr_list_start to match sro->addr_count */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  457  		addr_list_start = 0;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  458  	}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  459  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  460  	for (; found < count; found++) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  461  		unsigned long addr_range;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  462  		void *virt = alloc_pages_exact(block_size, gfp);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  463  		phys_addr_t phys;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  464  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  465  		if (!virt)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  466  			return -ENOMEM;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  467  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  468  		phys = virt_to_phys(virt);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  469  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  470  		if (state == RMI_OP_MEM_DELEGATED) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  471  			phys_addr_t delegated_phys;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  472  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  473  			if (rmi_delegate_range(phys, block_size, &delegated_phys)) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  474  				if (!rmi_undelegate_range(phys, delegated_phys - phys))
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  475  					free_pages_exact(virt, block_size);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  476  				return -ENXIO;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  477  			}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  478  		}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  479  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  480  		addr_range = phys & RMI_ADDR_RANGE_ADDR_MASK;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  481  		FIELD_MODIFY(RMI_ADDR_RANGE_BLOCK_SIZE_MASK, &addr_range, block_size_fld);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  482  		FIELD_MODIFY(RMI_ADDR_RANGE_COUNT_MASK, &addr_range, 1);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  483  		FIELD_MODIFY(RMI_ADDR_RANGE_STATE_MASK, &addr_range, state);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  484  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  485  		sro->addr_list[sro->addr_count++] = addr_range;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  486  	}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  487  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  488  mem_donate:
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  489  	rmi_op_mem_donate(sro_handle,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  490  			  virt_to_phys(&sro->addr_list[addr_list_start]),
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  491  			  found, 0, out_regs);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  492  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  493  	donated_granules = out_regs->a1;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  494  	/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  495  	 * The RMM shouldn't report more granules than we provided, but clamp
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  496  	 * just in case.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  497  	 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  498  	if (WARN_ON_ONCE(donated_granules > found * granules_per_block))
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  499  		donated_granules = found * granules_per_block;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  500  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  501  	/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  502  	 * The RMM reports the consumed memory in terms of granules, but we
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  503  	 * track in the address lists in block-sized ranges. So divide to get
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  504  	 * the number of (complete) consumed blocks.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  505  	 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  506  	consumed_blocks = donated_granules / granules_per_block;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  507  	if (donated_granules % granules_per_block) {
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  508  		/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  509  		 * A block has been partially consumed, the start is owned by
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  510  		 * the RMM, the tail is owned by the host
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  511  		 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  512  		unsigned long entry =
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  513  			sro->addr_list[addr_list_start + consumed_blocks];
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  514  		unsigned long donated_size =
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  515  			(donated_granules % granules_per_block) << PAGE_SHIFT;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  516  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  517  		free_addr_range(entry, donated_size);
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  518  		/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  519  		 * This block is now fully 'consumed' (either held by the RMM or
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  520  		 * freed)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  521  		 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  522  		consumed_blocks++;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  523  	}
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  524  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  525  	/*
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  526  	 * Keep just the blocks the RMM didn't use in addr_list
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  527  	 * RMM claimed consumed_blocks entries from addr_list_start.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  528  	 * Move the entries left out at the end i.e.,
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  529  	 * [ addr_list_start + consumed_blocks, addr_list_start + found)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  530  	 * to the rest of the valid entries and adjust the addr_count to
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  531  	 * reflect the available entries.
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  532  	 */
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  533  	for (i = 0, src = addr_list_start + consumed_blocks;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  534  		i < found - consumed_blocks; i++)
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02 @535  		sro->addr_list[addr_list_start + i] = sro->addr_list[src + i];
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  536  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  537  	sro->addr_count -= consumed_blocks;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  538  
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  539  	return 0;
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  540  }
bc1360cabe27388 drivers/firmware/arm_rmm/rmi.c Steven Price 2026-10-02  541  

:::::: The code at line 535 was first introduced by commit
:::::: bc1360cabe273886c502d8b6b2da7f05474cb923 firmware: arm_rmm: Add support for SRO

:::::: TO: Steven Price <steven.price@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
