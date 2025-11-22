Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D582C11ED
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843247; cv=none; b=TF0BHH/ll9e2zOXb+42TwkVDwvX339KDVOSemc46Hlo3fegYHliUhcEXX5iUMh2skUL1nt0Wf3eZ6dPyc4px2recl3Pclqfnc7LpZB5h6EJ2mLAZ07W19w8iiCugxcT7T0IE+f8curRMaUgpaubFgOKmH7mmddd6LuwqJ6e5Kus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843247; c=relaxed/simple;
	bh=pZzE4USgyQfUhncCb8JjsmnYafK81wJLOhyWbe8et80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mj9Y01dWGBjX8Yyodl7wkrI2H/1zNLg1Gkd0jGE0EJCJgoLu9DTgFNe7W0R+ULpYU35uR6y/fY/81Qr/ZrjQe6liBHcHJhjZkaJhs7s+XYB90A8X69wXUc7H5ZAyRrf9jpUNomgKMh3VHdgDztGWDXjDeGy3YGuDhnOoZpK9yHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSiO63Dt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSiO63Dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763843245; x=1795379245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZzE4USgyQfUhncCb8JjsmnYafK81wJLOhyWbe8et80=;
  b=KSiO63DtC3VKz60TSzRDbXTcJDwEUEVLe12hJHhtsxiZq+lQv9jLSiBc
   wOE/3qvyf3S8bEL6WKtcm3sM+gQy5+yyyAb2k+vFKwbRvMLrDz8yz+9M0
   g2xOY3k3d7NG6MStr5GyTjIKjXiGku31Y6CvwRbWU8ScbNhm0lI5GHfxf
   aF3OIRcUPh097j8PMt562JnWLAg5XzRRU1r0LSkqhtWRrfIyLgHiaht6s
   E6yDhyY1xzTyNcRnhGumds6kOYf1O1DRhmCAOU3YPoZfp4FGi4BuqLbqZ
   yG94gcj1NK+xaxHgrpfKeXHgZWAAyQ6wSqp/hy9q0RfR5l3rCOfoXw76H
   Q==;
X-CSE-ConnectionGUID: AlHD8cZwTDG+uftEjj5pjQ==
X-CSE-MsgGUID: RDpqmcEtTjuP6MYXl6vOlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83292222"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="83292222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 12:27:24 -0800
X-CSE-ConnectionGUID: k+HM7ZddR7eJLXYgiY5t9w==
X-CSE-MsgGUID: nWUdSImtQn6fX4+1ahLzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="196267375"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2025 12:27:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMuCW-0007oJ-2d;
	Sat, 22 Nov 2025 20:27:20 +0000
Date: Sun, 23 Nov 2025 04:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] mmc: dw_mmc: add dw_mci_prepare_desc() for both of
 32bit and 64bit DMA
Message-ID: <202511230424.HoqupIig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mmc/host/dw_mmc.c:609:29: sparse: sparse: cannot dereference this type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1763540498-84315-2-git-send-email-shawn.lin@rock-chips.com>
References: <1763540498-84315-2-git-send-email-shawn.lin@rock-chips.com>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
CC: linux-mmc@vger.kernel.org
CC: Jaehoon Chung <jh80.chung@samsung.com>
CC: Shawn Lin <shawn.lin@rock-chips.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/mmc-dw_mmc-add-dw_mci_prepare_desc-for-both-of-32bit-and-64bit-DMA/20251119-163950
base:   linus/master
patch link:    https://lore.kernel.org/r/1763540498-84315-2-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 2/2] mmc: dw_mmc: add dw_mci_prepare_desc() for both of 32bit and 64bit DMA
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-r132-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230424.HoqupIig-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230424.HoqupIig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230424.HoqupIig-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mmc/host/dw_mmc.c:609:29: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/mmc/host/dw_mmc.c:609:29: sparse:    unsigned int *
   drivers/mmc/host/dw_mmc.c:609:29: sparse:    restricted __le32 *
   drivers/mmc/host/dw_mmc.c:609:29: sparse: sparse: cast from unknown type
>> drivers/mmc/host/dw_mmc.c:609:29: sparse: sparse: cannot dereference this type

vim +609 drivers/mmc/host/dw_mmc.c

3b2a067b98b45f Shawn Lin         2016-09-02  577  
c4eee1cd5533e3 Shawn Lin         2025-11-19  578  static inline int dw_mci_prepare_desc(struct dw_mci *host, struct mmc_data *data,
c4eee1cd5533e3 Shawn Lin         2025-11-19  579  				      unsigned int sg_len, bool is_64bit)
f95f3850f7a9e1 Will Newton       2011-01-02  580  {
5959b32e3636f9 Alexey Brodkin    2015-06-25  581  	unsigned int desc_len;
c4eee1cd5533e3 Shawn Lin         2025-11-19  582  	struct idmac_desc *desc_first, *desc_last, *desc;
c4eee1cd5533e3 Shawn Lin         2025-11-19  583  	struct idmac_desc_64addr *desc64_first, *desc64_last, *desc64;
c4eee1cd5533e3 Shawn Lin         2025-11-19  584  	u32 val, des0;
ec0baaa6b33932 Shawn Lin         2016-09-02  585  	int i;
5959b32e3636f9 Alexey Brodkin    2015-06-25  586  
c4eee1cd5533e3 Shawn Lin         2025-11-19  587  	if (is_64bit)
c4eee1cd5533e3 Shawn Lin         2025-11-19  588  		desc64_first = desc64_last = desc64 = host->sg_cpu;
c4eee1cd5533e3 Shawn Lin         2025-11-19  589  	else
5959b32e3636f9 Alexey Brodkin    2015-06-25  590  		desc_first = desc_last = desc = host->sg_cpu;
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  591  
5959b32e3636f9 Alexey Brodkin    2015-06-25  592  	for (i = 0; i < sg_len; i++) {
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  593  		unsigned int length = sg_dma_len(&data->sg[i]);
0e3a22c044478b Shawn Lin         2015-08-03  594  
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  595  		u64 mem_addr = sg_dma_address(&data->sg[i]);
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  596  
5959b32e3636f9 Alexey Brodkin    2015-06-25  597  		for ( ; length ; desc++) {
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
c4eee1cd5533e3 Shawn Lin         2025-11-19 @609  			if (readl_poll_timeout_atomic(is_64bit ? &desc64->des0 : &desc->des0,
c4eee1cd5533e3 Shawn Lin         2025-11-19  610  						val, IDMAC_OWN_CLR64(val), 10, 100 * USEC_PER_MSEC))
3b2a067b98b45f Shawn Lin         2016-09-02  611  				goto err_own_bit;
3b2a067b98b45f Shawn Lin         2016-09-02  612  
c4eee1cd5533e3 Shawn Lin         2025-11-19  613  			des0 = IDMAC_DES0_OWN | IDMAC_DES0_DIC | IDMAC_DES0_CH;
c4eee1cd5533e3 Shawn Lin         2025-11-19  614  			if (is_64bit)
c4eee1cd5533e3 Shawn Lin         2025-11-19  615  				desc64->des0 = des0;
c4eee1cd5533e3 Shawn Lin         2025-11-19  616  			else
c4eee1cd5533e3 Shawn Lin         2025-11-19  617  				desc->des0 = cpu_to_le32(des0);
3b2a067b98b45f Shawn Lin         2016-09-02  618  
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  619  			/*
c4eee1cd5533e3 Shawn Lin         2025-11-19  620  			 * 1. Set OWN bit and disable interrupts for this descriptor
c4eee1cd5533e3 Shawn Lin         2025-11-19  621  			 * 2. Set Buffer length
c4eee1cd5533e3 Shawn Lin         2025-11-19  622  			 * Set physical address to DMA to/from
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  623  			 */
c4eee1cd5533e3 Shawn Lin         2025-11-19  624  			if (is_64bit) {
c4eee1cd5533e3 Shawn Lin         2025-11-19  625  				desc64->des0 = IDMAC_DES0_OWN | IDMAC_DES0_DIC | IDMAC_DES0_CH;
c4eee1cd5533e3 Shawn Lin         2025-11-19  626  				IDMAC_64ADDR_SET_BUFFER1_SIZE(desc64, desc_len);
c4eee1cd5533e3 Shawn Lin         2025-11-19  627  				desc64->des4 = mem_addr & 0xffffffff;
c4eee1cd5533e3 Shawn Lin         2025-11-19  628  				desc64->des5 = mem_addr >> 32;
c4eee1cd5533e3 Shawn Lin         2025-11-19  629  			} else {
5959b32e3636f9 Alexey Brodkin    2015-06-25  630  				IDMAC_SET_BUFFER1_SIZE(desc, desc_len);
6687c42fa71acd Ben Dooks         2015-03-25  631  				desc->des2 = cpu_to_le32(mem_addr);
c4eee1cd5533e3 Shawn Lin         2025-11-19  632  			}
5959b32e3636f9 Alexey Brodkin    2015-06-25  633  
5959b32e3636f9 Alexey Brodkin    2015-06-25  634  			/* Update physical address for the next desc */
5959b32e3636f9 Alexey Brodkin    2015-06-25  635  			mem_addr += desc_len;
5959b32e3636f9 Alexey Brodkin    2015-06-25  636  
5959b32e3636f9 Alexey Brodkin    2015-06-25  637  			/* Save pointer to the last descriptor */
c4eee1cd5533e3 Shawn Lin         2025-11-19  638  			if (is_64bit)
c4eee1cd5533e3 Shawn Lin         2025-11-19  639  				desc64_last = desc64;
c4eee1cd5533e3 Shawn Lin         2025-11-19  640  			else
5959b32e3636f9 Alexey Brodkin    2015-06-25  641  				desc_last = desc;
5959b32e3636f9 Alexey Brodkin    2015-06-25  642  		}
f95f3850f7a9e1 Will Newton       2011-01-02  643  	}
f95f3850f7a9e1 Will Newton       2011-01-02  644  
c4eee1cd5533e3 Shawn Lin         2025-11-19  645  	/* Set the first descriptor and the last descriptor */
c4eee1cd5533e3 Shawn Lin         2025-11-19  646  	if (is_64bit) {
c4eee1cd5533e3 Shawn Lin         2025-11-19  647  		desc64_first->des0 |= IDMAC_DES0_FD;
c4eee1cd5533e3 Shawn Lin         2025-11-19  648  		desc64_last->des0 &= ~(IDMAC_DES0_CH | IDMAC_DES0_DIC);
c4eee1cd5533e3 Shawn Lin         2025-11-19  649  		desc64_last->des0 |= IDMAC_DES0_LD;
c4eee1cd5533e3 Shawn Lin         2025-11-19  650  	} else {
5959b32e3636f9 Alexey Brodkin    2015-06-25  651  		desc_first->des0 |= cpu_to_le32(IDMAC_DES0_FD);
c4eee1cd5533e3 Shawn Lin         2025-11-19  652  		desc_last->des0 &= cpu_to_le32(~(IDMAC_DES0_CH | IDMAC_DES0_DIC));
5959b32e3636f9 Alexey Brodkin    2015-06-25  653  		desc_last->des0 |= cpu_to_le32(IDMAC_DES0_LD);
c4eee1cd5533e3 Shawn Lin         2025-11-19  654  	}
3b2a067b98b45f Shawn Lin         2016-09-02  655  
3b2a067b98b45f Shawn Lin         2016-09-02  656  	return 0;
3b2a067b98b45f Shawn Lin         2016-09-02  657  err_own_bit:
3b2a067b98b45f Shawn Lin         2016-09-02  658  	/* restore the descriptor chain as it's polluted */
26be9d705f4452 Colin Ian King    2016-11-16  659  	dev_dbg(host->dev, "descriptor is still owned by IDMAC.\n");
cc190d4c6499b1 Shawn Lin         2016-09-02  660  	memset(host->sg_cpu, 0, DESC_RING_BUF_SZ);
3b2a067b98b45f Shawn Lin         2016-09-02  661  	dw_mci_idmac_init(host);
3b2a067b98b45f Shawn Lin         2016-09-02  662  	return -EINVAL;
69d99fdcfd7815 Prabu Thangamuthu 2014-10-20  663  }
f95f3850f7a9e1 Will Newton       2011-01-02  664  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
