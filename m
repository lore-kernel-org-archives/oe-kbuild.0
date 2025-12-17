Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC443344046
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961487; cv=none; b=sZPUXj3OT6ZfWya17yQZbym8JvZJX4uQ8Xj12TNN2kWgBc6wiWnbiGZAI6m0oMxuhFWuOjZNj7QA1m5oHJfT9ruKF+X+NZjaJYsZJeAzV1XC2K26GBLGYs400RL6RQfLWik6wwbqhjGmLZfuYmlvFKhB4brO/Fvr50n+Jj1jdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961487; c=relaxed/simple;
	bh=jmjJKejDxQEiSA6hoQUn/+LbW0W5AN7/i/9fZvUKnis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdfWGig6H1USwBq/yyKcWXJPg/+jZ54CyjeQNCA4nREnG7JwN30M8vu6QqPkmiupp07E9y44v3nxRYf4VmXhdbnDCSyKg7wrdL1YoJ3NIJR7K9l68sL4w4HWrIx0g4lUNFqcZ1HHZCoyFbhg6RQNzrupYRWfDR1PtzQLw4ov64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aww+IsOf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aww+IsOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765961485; x=1797497485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmjJKejDxQEiSA6hoQUn/+LbW0W5AN7/i/9fZvUKnis=;
  b=aww+IsOfXySK3CK7Eg+cHozqvGlmc3Rn6O3z9NT9NBXuaKnZjChTP938
   i8jV9dPlnuDtA5ddi+uBU3NVfOOXTUGguIrHvFDoQ+fsmaHDLYeFhzTZu
   oMcZprdHJqYmW/Hk7L9IzmhqyJsJav0H+4kTCS/gdPF55UEO1NnZCGKo9
   hqEAbrepuJGs7iFS8xb0UCpam9St59TzIqpweQmhdJ6rBjhIhQzzGPCwU
   gYKXbsl+Jst6vGnat5WXC1ZdmTKwjR24RsstYcM9ea2AM1SkKG/KEgQk3
   T7Bnp2D0mh0z3RQGRqdmDJYMFdSLDwpRj791zEtfIqtuJm2mgAaLZ37zQ
   Q==;
X-CSE-ConnectionGUID: 7OGl1HDpQbq8gsjSdlMvLA==
X-CSE-MsgGUID: SAy1yYLGROiUphlYxwbJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79263133"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="79263133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 00:51:24 -0800
X-CSE-ConnectionGUID: eyrb8YopRDe7gntmrU791w==
X-CSE-MsgGUID: miXEcASOTI+LUEDDmBXvqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198007589"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Dec 2025 00:51:23 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVnFg-000000000FJ-2lO1;
	Wed, 17 Dec 2025 08:51:20 +0000
Date: Wed, 17 Dec 2025 16:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1466/2012] drivers/mmc/host/dw_mmc.c:597
 dw_mci_prepare_desc() error: uninitialized symbol 'desc'.
Message-ID: <202512171601.RaFs0MBu-lkp@intel.com>
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
TO: Shawn Lin <shawn.lin@rock-chips.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

Hi Shawn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   12b95d29eb979e5c4f4f31bb05817bc935c52050
commit: af7dde31afcc1901f131ace6c7ec912218021363 [1466/2012] mmc: dw_mmc: add dw_mci_prepare_desc() for both of 32bit and 64bit DMA
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r073-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171601.RaFs0MBu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171601.RaFs0MBu-lkp@intel.com/

smatch warnings:
drivers/mmc/host/dw_mmc.c:597 dw_mci_prepare_desc() error: uninitialized symbol 'desc'.

vim +/desc +597 drivers/mmc/host/dw_mmc.c

3b2a067b98b45f Shawn Lin         2016-09-02  577  
af7dde31afcc19 Shawn Lin         2025-11-26  578  static inline int dw_mci_prepare_desc(struct dw_mci *host, struct mmc_data *data,
af7dde31afcc19 Shawn Lin         2025-11-26  579  				      unsigned int sg_len, bool is_64bit)
f95f3850f7a9e1 Will Newton       2011-01-02  580  {
5959b32e3636f9 Alexey Brodkin    2015-06-25  581  	unsigned int desc_len;
af7dde31afcc19 Shawn Lin         2025-11-26  582  	struct idmac_desc *desc_first, *desc_last, *desc;
af7dde31afcc19 Shawn Lin         2025-11-26  583  	struct idmac_desc_64addr *desc64_first, *desc64_last, *desc64;
af7dde31afcc19 Shawn Lin         2025-11-26  584  	u32 val, des0;
af7dde31afcc19 Shawn Lin         2025-11-26  585  	int i, err;
5959b32e3636f9 Alexey Brodkin    2015-06-25  586  
af7dde31afcc19 Shawn Lin         2025-11-26  587  	if (is_64bit)
af7dde31afcc19 Shawn Lin         2025-11-26  588  		desc64_first = desc64_last = desc64 = host->sg_cpu;
af7dde31afcc19 Shawn Lin         2025-11-26  589  	else
5959b32e3636f9 Alexey Brodkin    2015-06-25  590  		desc_first = desc_last = desc = host->sg_cpu;
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  591  
5959b32e3636f9 Alexey Brodkin    2015-06-25  592  	for (i = 0; i < sg_len; i++) {
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  593  		unsigned int length = sg_dma_len(&data->sg[i]);
0e3a22c044478b Shawn Lin         2015-08-03  594  
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  595  		u64 mem_addr = sg_dma_address(&data->sg[i]);
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  596  
5959b32e3636f9 Alexey Brodkin    2015-06-25 @597  		for ( ; length ; desc++) {
5959b32e3636f9 Alexey Brodkin    2015-06-25  598  			desc_len = (length <= DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9 Alexey Brodkin    2015-06-25  599  				   length : DW_MCI_DESC_DATA_LENGTH;
5959b32e3636f9 Alexey Brodkin    2015-06-25  600  
5959b32e3636f9 Alexey Brodkin    2015-06-25  601  			length -= desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  602  
3b2a067b98b45f Shawn Lin         2016-09-02  603  			/*
3b2a067b98b45f Shawn Lin         2016-09-02  604  			 * Wait for the former clear OWN bit operation
3b2a067b98b45f Shawn Lin         2016-09-02  605  			 * of IDMAC to make sure that this descriptor
3b2a067b98b45f Shawn Lin         2016-09-02  606  			 * isn't still owned by IDMAC as IDMAC's write
3b2a067b98b45f Shawn Lin         2016-09-02  607  			 * ops and CPU's read ops are asynchronous.
3b2a067b98b45f Shawn Lin         2016-09-02  608  			 */
af7dde31afcc19 Shawn Lin         2025-11-26  609  			if (is_64bit)
af7dde31afcc19 Shawn Lin         2025-11-26  610  				err = readl_poll_timeout_atomic(&desc64->des0, val,
af7dde31afcc19 Shawn Lin         2025-11-26  611  					IDMAC_OWN_CLR64(val), 10, 100 * USEC_PER_MSEC);
af7dde31afcc19 Shawn Lin         2025-11-26  612  			else
af7dde31afcc19 Shawn Lin         2025-11-26  613  				err = readl_poll_timeout_atomic(&desc->des0, val,
af7dde31afcc19 Shawn Lin         2025-11-26  614  					IDMAC_OWN_CLR64(val), 10, 100 * USEC_PER_MSEC);
af7dde31afcc19 Shawn Lin         2025-11-26  615  			if (err)
3b2a067b98b45f Shawn Lin         2016-09-02  616  				goto err_own_bit;
3b2a067b98b45f Shawn Lin         2016-09-02  617  
af7dde31afcc19 Shawn Lin         2025-11-26  618  			des0 = IDMAC_DES0_OWN | IDMAC_DES0_DIC | IDMAC_DES0_CH;
af7dde31afcc19 Shawn Lin         2025-11-26  619  			if (is_64bit)
af7dde31afcc19 Shawn Lin         2025-11-26  620  				desc64->des0 = des0;
af7dde31afcc19 Shawn Lin         2025-11-26  621  			else
af7dde31afcc19 Shawn Lin         2025-11-26  622  				desc->des0 = cpu_to_le32(des0);
3b2a067b98b45f Shawn Lin         2016-09-02  623  
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  624  			/*
af7dde31afcc19 Shawn Lin         2025-11-26  625  			 * 1. Set OWN bit and disable interrupts for this descriptor
af7dde31afcc19 Shawn Lin         2025-11-26  626  			 * 2. Set Buffer length
af7dde31afcc19 Shawn Lin         2025-11-26  627  			 * Set physical address to DMA to/from
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  628  			 */
af7dde31afcc19 Shawn Lin         2025-11-26  629  			if (is_64bit) {
af7dde31afcc19 Shawn Lin         2025-11-26  630  				desc64->des0 = IDMAC_DES0_OWN | IDMAC_DES0_DIC | IDMAC_DES0_CH;
af7dde31afcc19 Shawn Lin         2025-11-26  631  				IDMAC_64ADDR_SET_BUFFER1_SIZE(desc64, desc_len);
af7dde31afcc19 Shawn Lin         2025-11-26  632  				desc64->des4 = mem_addr & 0xffffffff;
af7dde31afcc19 Shawn Lin         2025-11-26  633  				desc64->des5 = mem_addr >> 32;
af7dde31afcc19 Shawn Lin         2025-11-26  634  			} else {
5959b32e3636f9 Alexey Brodkin    2015-06-25  635  				IDMAC_SET_BUFFER1_SIZE(desc, desc_len);
6687c42fa71acd Ben Dooks         2015-03-25  636  				desc->des2 = cpu_to_le32(mem_addr);
af7dde31afcc19 Shawn Lin         2025-11-26  637  			}
5959b32e3636f9 Alexey Brodkin    2015-06-25  638  
5959b32e3636f9 Alexey Brodkin    2015-06-25  639  			/* Update physical address for the next desc */
5959b32e3636f9 Alexey Brodkin    2015-06-25  640  			mem_addr += desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  641  
5959b32e3636f9 Alexey Brodkin    2015-06-25  642  			/* Save pointer to the last descriptor */
af7dde31afcc19 Shawn Lin         2025-11-26  643  			if (is_64bit)
af7dde31afcc19 Shawn Lin         2025-11-26  644  				desc64_last = desc64;
af7dde31afcc19 Shawn Lin         2025-11-26  645  			else
5959b32e3636f9 Alexey Brodkin    2015-06-25  646  				desc_last = desc;
5959b32e3636f9 Alexey Brodkin    2015-06-25  647  		}
f95f3850f7a9e1 Will Newton       2011-01-02  648  	}
f95f3850f7a9e1 Will Newton       2011-01-02  649  
af7dde31afcc19 Shawn Lin         2025-11-26  650  	/* Set the first descriptor and the last descriptor */
af7dde31afcc19 Shawn Lin         2025-11-26  651  	if (is_64bit) {
af7dde31afcc19 Shawn Lin         2025-11-26  652  		desc64_first->des0 |= IDMAC_DES0_FD;
af7dde31afcc19 Shawn Lin         2025-11-26  653  		desc64_last->des0 &= ~(IDMAC_DES0_CH | IDMAC_DES0_DIC);
af7dde31afcc19 Shawn Lin         2025-11-26  654  		desc64_last->des0 |= IDMAC_DES0_LD;
af7dde31afcc19 Shawn Lin         2025-11-26  655  	} else {
5959b32e3636f9 Alexey Brodkin    2015-06-25  656  		desc_first->des0 |= cpu_to_le32(IDMAC_DES0_FD);
af7dde31afcc19 Shawn Lin         2025-11-26  657  		desc_last->des0 &= cpu_to_le32(~(IDMAC_DES0_CH | IDMAC_DES0_DIC));
5959b32e3636f9 Alexey Brodkin    2015-06-25  658  		desc_last->des0 |= cpu_to_le32(IDMAC_DES0_LD);
af7dde31afcc19 Shawn Lin         2025-11-26  659  	}
3b2a067b98b45f Shawn Lin         2016-09-02  660  
3b2a067b98b45f Shawn Lin         2016-09-02  661  	return 0;
3b2a067b98b45f Shawn Lin         2016-09-02  662  err_own_bit:
3b2a067b98b45f Shawn Lin         2016-09-02  663  	/* restore the descriptor chain as it's polluted */
26be9d705f4452 Colin Ian King    2016-11-16  664  	dev_dbg(host->dev, "descriptor is still owned by IDMAC.\n");
cc190d4c6499b1 Shawn Lin         2016-09-02  665  	memset(host->sg_cpu, 0, DESC_RING_BUF_SZ);
3b2a067b98b45f Shawn Lin         2016-09-02  666  	dw_mci_idmac_init(host);
3b2a067b98b45f Shawn Lin         2016-09-02  667  	return -EINVAL;
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  668  }
f95f3850f7a9e1 Will Newton       2011-01-02  669  

:::::: The code at line 597 was first introduced by commit
:::::: 5959b32e3636f9bfe3f869d1e440bc4a4d660965 mmc: dw_mmc: handle data blocks > than 4kB if IDMAC is used

:::::: TO: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
