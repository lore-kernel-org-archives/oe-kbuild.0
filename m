Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18731C15
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Dec 2022 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672247665; x=1703783665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mHpj0h12AuMlFFmyHDnn+IlhkKn9jiN3LLy1ycq56G0=;
  b=ZGxIXwWxKhpt6bmRnzjXtM03awFRaI7YNYwYf1UkRShHL9lT124FBLEG
   HZOrPVKmI7rC9WxZKHPopiYn87/iCkeIsQ84NlGDbIgKLdhKe7zcOJcAg
   PSi1v8V0P8r1V9FFviNl2Wl1OAPkQCuBUonColEvvESmmIWzVQZCQtHU0
   8r6IEqI2QMWgIGOBI3iTqBbIQf3Vty1JBpg8dQ7Wa0LmT4za7ULk1p0Gq
   YICAHL12OGUK/M8nBd18tRWo/RJRIw0i3j6fwA9chvQjxemq6kizcCpDD
   Vf4/ZDSNO5a6O2FXLrn7RKmL3+AdYvqqk/9Kxy5NStxzy5DDczl+v31L+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="320985468"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="320985468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 09:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="742078450"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="742078450"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2022 09:14:23 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAa0V-000Fpx-0t;
	Wed, 28 Dec 2022 17:14:23 +0000
Date: Thu, 29 Dec 2022 01:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/misc/habanalabs/gaudi2/gaudi2.c:9203:6: warning: Variable
 'edma_queues_id' can be declared as const array [constVariable]
Message-ID: <202212290148.qtAQ2zIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/misc/habanalabs/gaudi2/gaudi2.c:9203:6: warning: Variable 'edma_queues_id' can be declared as const array [constVariable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: farah kassabri <fkassabri@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b929c02afd37871d5afb9d498426f83432e71c2
commit: 18cd948204fffa61660d3f8454fc9d275c1f6c94 habanalabs/gaudi2: change memory scrub mechanism
date:   5 weeks ago
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 18cd948204fffa61660d3f8454fc9d275c1f6c94
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/misc/habanalabs/gaudi2/gaudi2.c:5055:2: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    RMWREG32(stlb_base + STLB_HOP_CONFIGURATION_OFFSET,
    ^
>> drivers/misc/habanalabs/gaudi2/gaudi2.c:9203:6: warning: Variable 'edma_queues_id' can be declared as const array [constVariable]
    u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4138:3: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     WREG32(reg_base + QM_PQC_LBW_WDATA_0_OFFSET + pq_offset, QM_PQC_LBW_WDATA);
     ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:6094:6: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     (1 << GAUDI2_PKT_CTL_MB_SHIFT) |
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:9801:8: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
       (1 << CQ_ENTRY_READY_SHIFT) | index;
          ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4138:3: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     WREG32(reg_base + QM_PQC_LBW_WDATA_0_OFFSET + pq_offset, QM_PQC_LBW_WDATA);
     ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:6094:6: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     (1 << GAUDI2_PKT_CTL_MB_SHIFT) |
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:9801:8: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
       (1 << CQ_ENTRY_READY_SHIFT) | index;
          ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4817:6: warning: Using argument inv_params that points at uninitialized variable invld_params [ctuuninitvar]
    if (inv_params->range_invalidation) {
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4912:38: note: Calling function gaudi2_mmu_invalidate_cache_trigger, 3rd argument is uninitialized
     gaudi2_mmu_invalidate_cache_trigger(hdev, mmPMMU_HBW_STLB_BASE, &invld_params);
                                        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4817:6: note: Using argument inv_params
    if (inv_params->range_invalidation) {
        ^

vim +/edma_queues_id +9203 drivers/misc/habanalabs/gaudi2/gaudi2.c

18cd948204fffa farah kassabri 2022-11-08  9200  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9201  static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 size, u64 val)
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9202  {
18cd948204fffa farah kassabri 2022-11-08 @9203  	u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
18cd948204fffa farah kassabri 2022-11-08  9204  					GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
18cd948204fffa farah kassabri 2022-11-08  9205  					GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
18cd948204fffa farah kassabri 2022-11-08  9206  					GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0};
18cd948204fffa farah kassabri 2022-11-08  9207  	u32 chunk_size, dcore, edma_idx, sob_offset, sob_addr, comp_val,
18cd948204fffa farah kassabri 2022-11-08  9208  		old_mmubp, mmubp, num_of_pkts, busy, pkt_size;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9209  	u64 comp_addr, cur_addr = addr, end_addr = addr + size;
18cd948204fffa farah kassabri 2022-11-08  9210  	struct asic_fixed_properties *prop = &hdev->asic_prop;
18cd948204fffa farah kassabri 2022-11-08  9211  	void *lin_dma_pkts_arr;
18cd948204fffa farah kassabri 2022-11-08  9212  	dma_addr_t pkt_dma_addr;
18cd948204fffa farah kassabri 2022-11-08  9213  	int rc = 0, dma_num = 0;
18cd948204fffa farah kassabri 2022-11-08  9214  
18cd948204fffa farah kassabri 2022-11-08  9215  	if (prop->edma_enabled_mask == 0) {
18cd948204fffa farah kassabri 2022-11-08  9216  		dev_info(hdev->dev, "non of the EDMA engines is enabled - skip dram scrubbing\n");
18cd948204fffa farah kassabri 2022-11-08  9217  		return -EIO;
18cd948204fffa farah kassabri 2022-11-08  9218  	}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9219  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9220  	sob_offset = hdev->asic_prop.first_available_user_sob[0] * 4;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9221  	sob_addr = mmDCORE0_SYNC_MNGR_OBJS_SOB_OBJ_0 + sob_offset;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9222  	comp_addr = CFG_BASE + sob_addr;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9223  	comp_val = FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_INC_MASK, 1) |
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9224  		FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_VAL_MASK, 1);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9225  	mmubp = FIELD_PREP(ARC_FARM_KDMA_CTX_AXUSER_HB_MMU_BP_WR_MASK, 1) |
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9226  		FIELD_PREP(ARC_FARM_KDMA_CTX_AXUSER_HB_MMU_BP_RD_MASK, 1);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9227  
18cd948204fffa farah kassabri 2022-11-08  9228  	/* Calculate how many lin dma pkts we'll need */
18cd948204fffa farah kassabri 2022-11-08  9229  	num_of_pkts = div64_u64(round_up(size, SZ_2G), SZ_2G);
18cd948204fffa farah kassabri 2022-11-08  9230  	pkt_size = sizeof(struct packet_lin_dma);
18cd948204fffa farah kassabri 2022-11-08  9231  
18cd948204fffa farah kassabri 2022-11-08  9232  	lin_dma_pkts_arr = hl_asic_dma_alloc_coherent(hdev, pkt_size * num_of_pkts,
18cd948204fffa farah kassabri 2022-11-08  9233  					&pkt_dma_addr, GFP_KERNEL);
18cd948204fffa farah kassabri 2022-11-08  9234  	if (!lin_dma_pkts_arr)
18cd948204fffa farah kassabri 2022-11-08  9235  		return -ENOMEM;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9236  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9237  	/*
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9238  	 * set mmu bypass for the scrubbing - all ddmas are configured the same so save
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9239  	 * only the first one to restore later
18cd948204fffa farah kassabri 2022-11-08  9240  	 * also set the sob addr for all edma cores for completion.
18cd948204fffa farah kassabri 2022-11-08  9241  	 * set QM as trusted to allow it to access physical address with MMU bp.
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9242  	 */
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9243  	old_mmubp = RREG32(mmDCORE0_EDMA0_CORE_CTX_AXUSER_HB_MMU_BP);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9244  	for (dcore = 0 ; dcore < NUM_OF_DCORES ; dcore++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9245  		for (edma_idx = 0 ; edma_idx < NUM_OF_EDMA_PER_DCORE ; edma_idx++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9246  			u32 edma_offset = dcore * DCORE_OFFSET + edma_idx * DCORE_EDMA_OFFSET;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9247  			u32 edma_bit = dcore * NUM_OF_EDMA_PER_DCORE + edma_idx;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9248  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9249  			if (!(prop->edma_enabled_mask & BIT(edma_bit)))
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9250  				continue;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9251  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9252  			WREG32(mmDCORE0_EDMA0_CORE_CTX_AXUSER_HB_MMU_BP +
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9253  					edma_offset, mmubp);
18cd948204fffa farah kassabri 2022-11-08  9254  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_ADDR_LO + edma_offset,
18cd948204fffa farah kassabri 2022-11-08  9255  					lower_32_bits(comp_addr));
18cd948204fffa farah kassabri 2022-11-08  9256  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_ADDR_HI + edma_offset,
18cd948204fffa farah kassabri 2022-11-08  9257  					upper_32_bits(comp_addr));
18cd948204fffa farah kassabri 2022-11-08  9258  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_WDATA + edma_offset,
18cd948204fffa farah kassabri 2022-11-08  9259  					comp_val);
18cd948204fffa farah kassabri 2022-11-08  9260  			gaudi2_qman_set_test_mode(hdev,
18cd948204fffa farah kassabri 2022-11-08  9261  					edma_queues_id[dcore] + 4 * edma_idx, true);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9262  		}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9263  	}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9264  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9265  	WREG32(sob_addr, 0);
18cd948204fffa farah kassabri 2022-11-08  9266  
18cd948204fffa farah kassabri 2022-11-08  9267  	while (cur_addr < end_addr) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9268  		for (dcore = 0 ; dcore < NUM_OF_DCORES ; dcore++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9269  			for (edma_idx = 0 ; edma_idx < NUM_OF_EDMA_PER_DCORE ; edma_idx++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9270  				u32 edma_bit = dcore * NUM_OF_EDMA_PER_DCORE + edma_idx;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9271  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9272  				if (!(prop->edma_enabled_mask & BIT(edma_bit)))
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9273  					continue;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9274  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9275  				chunk_size = min_t(u64, SZ_2G, end_addr - cur_addr);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9276  
18cd948204fffa farah kassabri 2022-11-08  9277  				rc = gaudi2_memset_memory_chunk_using_edma_qm(hdev,
18cd948204fffa farah kassabri 2022-11-08  9278  					(struct packet_lin_dma *)lin_dma_pkts_arr + dma_num,
18cd948204fffa farah kassabri 2022-11-08  9279  					pkt_dma_addr + dma_num * pkt_size,
18cd948204fffa farah kassabri 2022-11-08  9280  					edma_queues_id[dcore] + edma_idx * 4,
18cd948204fffa farah kassabri 2022-11-08  9281  					chunk_size, cur_addr, val);
18cd948204fffa farah kassabri 2022-11-08  9282  				if (rc)
18cd948204fffa farah kassabri 2022-11-08  9283  					goto end;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9284  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9285  				dma_num++;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9286  				cur_addr += chunk_size;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9287  				if (cur_addr == end_addr)
18cd948204fffa farah kassabri 2022-11-08  9288  					break;
18cd948204fffa farah kassabri 2022-11-08  9289  			}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9290  		}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9291  	}
18cd948204fffa farah kassabri 2022-11-08  9292  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9293  	rc = hl_poll_timeout(hdev, sob_addr, busy, (busy == dma_num), 1000, 1000000);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9294  	if (rc) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9295  		dev_err(hdev->dev, "DMA Timeout during HBM scrubbing\n");
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9296  		goto end;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9297  	}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9298  end:
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9299  	for (dcore = 0 ; dcore < NUM_OF_DCORES ; dcore++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9300  		for (edma_idx = 0 ; edma_idx < NUM_OF_EDMA_PER_DCORE ; edma_idx++) {
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9301  			u32 edma_offset = dcore * DCORE_OFFSET + edma_idx * DCORE_EDMA_OFFSET;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9302  			u32 edma_bit = dcore * NUM_OF_EDMA_PER_DCORE + edma_idx;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9303  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9304  			if (!(prop->edma_enabled_mask & BIT(edma_bit)))
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9305  				continue;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9306  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9307  			WREG32(mmDCORE0_EDMA0_CORE_CTX_AXUSER_HB_MMU_BP + edma_offset, old_mmubp);
18cd948204fffa farah kassabri 2022-11-08  9308  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_ADDR_LO + edma_offset, 0);
18cd948204fffa farah kassabri 2022-11-08  9309  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_ADDR_HI + edma_offset, 0);
18cd948204fffa farah kassabri 2022-11-08  9310  			WREG32(mmDCORE0_EDMA0_CORE_CTX_WR_COMP_WDATA + edma_offset, 0);
18cd948204fffa farah kassabri 2022-11-08  9311  			gaudi2_qman_set_test_mode(hdev,
18cd948204fffa farah kassabri 2022-11-08  9312  					edma_queues_id[dcore] + 4 * edma_idx, false);
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9313  		}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9314  	}
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9315  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9316  	WREG32(sob_addr, 0);
18cd948204fffa farah kassabri 2022-11-08  9317  	hl_asic_dma_free_coherent(hdev, pkt_size * num_of_pkts, lin_dma_pkts_arr, pkt_dma_addr);
18cd948204fffa farah kassabri 2022-11-08  9318  
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9319  	return rc;
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9320  }
d7bb1ac89b2f5e Oded Gabbay    2022-06-26  9321  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
