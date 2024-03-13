Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382318BE0
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Mar 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710297217; cv=none; b=KkI9enLeFxdN1gV54nR2YBv3/EgjKz2BJ1MHw7iRCVDFph8yiKTCVGKMnIh1ZmMFtlY5mwRpB+V1UcjgdiH7xpTvzWy8gdyrJG/0fIxUmlTV9qikwLA0e/fPmDFMt8C1UdpKBfCVBSswiG/7+Z3njNVGAcbjvydsIlXaN2mk6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710297217; c=relaxed/simple;
	bh=jJFVzDEnQ05RIqRnYdxiR8HWS93QYVESqufL+UvIDRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUzek6/VvbqV9TUKdOoc9mu4QS9mD53Ly1Z3xWgBcgImsDUE1MTU99kvdCDoFHOJ8/xY07QDFY9lcyv//mrz0y9doixVm4ON///JtFU1iaWdVvR4Q7PDsNZlbVZkSEsYg3oSRByH520gYinri3kXHe+0M3Mi4UWkZlLEsEIY178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrNF6yF8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrNF6yF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710297216; x=1741833216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJFVzDEnQ05RIqRnYdxiR8HWS93QYVESqufL+UvIDRs=;
  b=RrNF6yF8Ht6whR+r0RP30xZ5jZMu+Wm/ju161W0gk+SuhWOvs0ql4js5
   0tg/scvfyLUVvgvGKH3SwqRxmnl3IQgPXQZXRGbacmiQG0xdUPf447ynC
   t87srn68jUBjT7T87/nfbYOyyZDdKyeFyTihXVEf+ZOoZfUOrTjxrkAX1
   +Gx7tlXkgeFAnPwDWPn/V64mBw4G2u4io8wF6+jLKSVEg3qZe7H5K5MzG
   g5+/GSXQkGMeeVwiT7QydM6+PYRLz+111VqWqIukrzE/7ociML9+e8txn
   bfH8BW8NKvtQIfTFVaIkpwe9HMw2/i7if30Q3JL0tmMpsbiYbRHHgQWeA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4969824"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4969824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 19:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="34895394"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2024 19:33:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkEQp-000Bv5-2y;
	Wed, 13 Mar 2024 02:33:27 +0000
Date: Wed, 13 Mar 2024 10:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_acpi_b2_v4 54/92]
 drivers/irqchip/irq-riscv-imsic-state.c:135:7-8: ERROR: iterator variable
 bound on line 134 cannot be NULL
Message-ID: <202403131035.Qg6Opbir-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v4
head:   9fcc7e2c57babd40cba3ba3a489982ff1b0f91bc
commit: f1b82f19f69fa78eaac6b2a9a7c7ea13c55a84ee [54/92] RISC-V: Select APLIC and IMSIC drivers
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r053-20240313 (https://download.01.org/0day-ci/archive/20240313/202403131035.Qg6Opbir-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403131035.Qg6Opbir-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-riscv-imsic-state.c:135:7-8: ERROR: iterator variable bound on line 134 cannot be NULL

vim +135 drivers/irqchip/irq-riscv-imsic-state.c

9208d3747a0eba Anup Patel 2023-08-02  125  
9208d3747a0eba Anup Patel 2023-08-02  126  static void __imsic_local_sync(struct imsic_local_priv *lpriv)
9208d3747a0eba Anup Patel 2023-08-02  127  {
9208d3747a0eba Anup Patel 2023-08-02  128  	struct imsic_local_config *mlocal;
9208d3747a0eba Anup Patel 2023-08-02  129  	struct imsic_vector *vec, *mvec;
9208d3747a0eba Anup Patel 2023-08-02  130  	int i;
9208d3747a0eba Anup Patel 2023-08-02  131  
9208d3747a0eba Anup Patel 2023-08-02  132  	lockdep_assert_held(&lpriv->lock);
9208d3747a0eba Anup Patel 2023-08-02  133  
9208d3747a0eba Anup Patel 2023-08-02 @134  	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
9208d3747a0eba Anup Patel 2023-08-02 @135  		if (!i || i == IMSIC_IPI_ID)
9208d3747a0eba Anup Patel 2023-08-02  136  			goto skip;
9208d3747a0eba Anup Patel 2023-08-02  137  		vec = &lpriv->vectors[i];
9208d3747a0eba Anup Patel 2023-08-02  138  
9208d3747a0eba Anup Patel 2023-08-02  139  		if (READ_ONCE(vec->enable))
9208d3747a0eba Anup Patel 2023-08-02  140  			__imsic_id_set_enable(i);
9208d3747a0eba Anup Patel 2023-08-02  141  		else
9208d3747a0eba Anup Patel 2023-08-02  142  			__imsic_id_clear_enable(i);
9208d3747a0eba Anup Patel 2023-08-02  143  
9208d3747a0eba Anup Patel 2023-08-02  144  		/*
9208d3747a0eba Anup Patel 2023-08-02  145  		 * If the ID was being moved to a new ID on some other CPU
9208d3747a0eba Anup Patel 2023-08-02  146  		 * then we can get a MSI during the movement so check the
9208d3747a0eba Anup Patel 2023-08-02  147  		 * ID pending bit and re-trigger the new ID on other CPU
9208d3747a0eba Anup Patel 2023-08-02  148  		 * using MMIO write.
9208d3747a0eba Anup Patel 2023-08-02  149  		 */
9208d3747a0eba Anup Patel 2023-08-02  150  		mvec = READ_ONCE(vec->move);
9208d3747a0eba Anup Patel 2023-08-02  151  		WRITE_ONCE(vec->move, NULL);
9208d3747a0eba Anup Patel 2023-08-02  152  		if (mvec && mvec != vec) {
9208d3747a0eba Anup Patel 2023-08-02  153  			if (__imsic_id_read_clear_pending(i)) {
9208d3747a0eba Anup Patel 2023-08-02  154  				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
9208d3747a0eba Anup Patel 2023-08-02  155  				writel_relaxed(mvec->local_id, mlocal->msi_va);
9208d3747a0eba Anup Patel 2023-08-02  156  			}
9208d3747a0eba Anup Patel 2023-08-02  157  
9208d3747a0eba Anup Patel 2023-08-02  158  			imsic_vector_free(&lpriv->vectors[i]);
9208d3747a0eba Anup Patel 2023-08-02  159  		}
9208d3747a0eba Anup Patel 2023-08-02  160  
9208d3747a0eba Anup Patel 2023-08-02  161  skip:
9208d3747a0eba Anup Patel 2023-08-02  162  		bitmap_clear(lpriv->dirty_bitmap, i, 1);
9208d3747a0eba Anup Patel 2023-08-02  163  	}
9208d3747a0eba Anup Patel 2023-08-02  164  }
9208d3747a0eba Anup Patel 2023-08-02  165  

:::::: The code at line 135 was first introduced by commit
:::::: 9208d3747a0eba5d05cd3dec979e9f1519e62852 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
