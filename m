Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339E1863
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Dec 2022 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672240342; x=1703776342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0zIWWna2peTUJvMINTEXKtmW533EcQGYYgVfw11AJVs=;
  b=MP2a6pwzI6P4fLJiJchaEOD1JrhIlce4zPGCdboNRXvSk+W07OLgWLK6
   aVe7YfRaCVhaP3Bj7scYN1/U66F76qvPKlpc4k1dj6qvueqvrIoY6YEkp
   qydXt2gVQH/XDE1LTmLKh+3tuKUOCuTfp0k706VOVdtHsbOb/S+pgwDa0
   WjLn/sBxxXXqfMfk1hE7XQvFw/wc4PFEn93Gx3ClNwb7RBaNLkkhEKeTi
   qLyoZ7DZkFKRMbWCHV1NRy2O4CSzAYFR0DXQSTSBI53otfV5d+Qc+z5hU
   VScCb+AaCeAJZByFwH5dqDsIu4e4nta1N/v1nran9KlfTCAckNdTMxRoh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="407150748"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="407150748"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 07:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="742051890"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="742051890"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2022 07:12:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAY6N-000Fkh-2q;
	Wed, 28 Dec 2022 15:12:19 +0000
Date: Wed, 28 Dec 2022 23:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/misc/habanalabs/gaudi2/gaudi2.c:4852:2: warning: Operator
 '|' with one operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202212282320.7tAYp5H2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/misc/habanalabs/gaudi2/gaudi2.c:4852:2: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b929c02afd37871d5afb9d498426f83432e71c2
commit: d7bb1ac89b2f5e230ec87659dabd2600897e49ef habanalabs: add gaudi2 asic-specific code
date:   6 months ago
:::::: branch date: 3 days ago
:::::: commit date: 6 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d7bb1ac89b2f5e230ec87659dabd2600897e49ef
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/misc/habanalabs/gaudi2/gaudi2.c:4852:2: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    RMWREG32(stlb_base + STLB_HOP_CONFIGURATION_OFFSET,
    ^
>> drivers/misc/habanalabs/gaudi2/gaudi2.c:2522:24: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if ((fw_boot_status & CPU_BOOT_DEV_STS0_ENABLED) &&
                          ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4019:3: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     WREG32(reg_base + QM_PQC_LBW_WDATA_0_OFFSET + pq_offset, QM_PQC_LBW_WDATA);
     ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:5866:6: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     (1 << GAUDI2_PKT_CTL_MB_SHIFT) |
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:9097:8: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
       (1 << CQ_ENTRY_READY_SHIFT) | index;
          ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:2522:24: warning: Signed integer overflow for expression '1<<CPU_BOOT_DEV_STS_ENABLED'. [integerOverflow]
    if ((fw_boot_status & CPU_BOOT_DEV_STS0_ENABLED) &&
                          ^
>> drivers/misc/habanalabs/gaudi2/gaudi2.c:4019:3: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     WREG32(reg_base + QM_PQC_LBW_WDATA_0_OFFSET + pq_offset, QM_PQC_LBW_WDATA);
     ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:5866:6: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     (1 << GAUDI2_PKT_CTL_MB_SHIFT) |
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:9097:8: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
       (1 << CQ_ENTRY_READY_SHIFT) | index;
          ^
>> drivers/misc/habanalabs/gaudi2/gaudi2.c:4612:6: warning: Using argument inv_params that points at uninitialized variable invld_params [ctuuninitvar]
    if (inv_params->range_invalidation) {
        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4707:38: note: Calling function gaudi2_mmu_invalidate_cache_trigger, 3rd argument is uninitialized
     gaudi2_mmu_invalidate_cache_trigger(hdev, mmPMMU_HBW_STLB_BASE, &invld_params);
                                        ^
   drivers/misc/habanalabs/gaudi2/gaudi2.c:4612:6: note: Using argument inv_params
    if (inv_params->range_invalidation) {
        ^

vim +4852 drivers/misc/habanalabs/gaudi2/gaudi2.c

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4839  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4840  static int gaudi2_pci_mmu_init(struct hl_device *hdev)
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4841  {
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4842  	struct gaudi2_device *gaudi2 = hdev->asic_specific;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4843  	u32 mmu_base, stlb_base;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4844  	int rc;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4845  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4846  	if (gaudi2->hw_cap_initialized & HW_CAP_PMMU)
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4847  		return 0;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4848  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4849  	mmu_base = mmPMMU_HBW_MMU_BASE;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4850  	stlb_base = mmPMMU_HBW_STLB_BASE;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4851  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26 @4852  	RMWREG32(stlb_base + STLB_HOP_CONFIGURATION_OFFSET,
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4853  		(0 << PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_HOP_SHIFT) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4854  		(5 << PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_LOOKUP_HOP_SMALL_P_SHIFT) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4855  		(4 << PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_LOOKUP_HOP_LARGE_P_SHIFT) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4856  		(5 << PMMU_HBW_STLB_HOP_CONFIGURATION_LAST_HOP_SHIFT) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4857  		(5 << PMMU_HBW_STLB_HOP_CONFIGURATION_FOLLOWER_HOP_SHIFT),
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4858  		PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_HOP_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4859  		PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_LOOKUP_HOP_SMALL_P_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4860  		PMMU_HBW_STLB_HOP_CONFIGURATION_FIRST_LOOKUP_HOP_LARGE_P_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4861  		PMMU_HBW_STLB_HOP_CONFIGURATION_LAST_HOP_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4862  		PMMU_HBW_STLB_HOP_CONFIGURATION_FOLLOWER_HOP_MASK);
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4863  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4864  	WREG32(stlb_base + STLB_LL_LOOKUP_MASK_63_32_OFFSET, 0);
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4865  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4866  	if (PAGE_SIZE == SZ_64K) {
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4867  		/* Set page sizes to 64K on hop5 and 16M on hop4 + enable 8 bit hops */
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4868  		RMWREG32(mmu_base + MMU_STATIC_MULTI_PAGE_SIZE_OFFSET,
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4869  			FIELD_PREP(DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_HOP5_PAGE_SIZE_MASK, 4) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4870  			FIELD_PREP(DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_HOP4_PAGE_SIZE_MASK, 3) |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4871  			FIELD_PREP(
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4872  				DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_CFG_8_BITS_HOP_MODE_EN_MASK,
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4873  				1),
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4874  			DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_HOP5_PAGE_SIZE_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4875  			DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_HOP4_PAGE_SIZE_MASK |
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4876  			DCORE0_HMMU0_MMU_STATIC_MULTI_PAGE_SIZE_CFG_8_BITS_HOP_MODE_EN_MASK);
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4877  	}
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4878  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4879  	rc = gaudi2_mmu_init_common(hdev, mmu_base, stlb_base);
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4880  	if (rc)
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4881  		return rc;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4882  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4883  	gaudi2->hw_cap_initialized |= HW_CAP_PMMU;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4884  
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4885  	return 0;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4886  }
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  4887  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
