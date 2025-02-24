Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575C2641FC
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416372; cv=none; b=dhhD4e0BQofNIiDHuN5oD3ew2xPyf3F/tSQ9JWQIMhug7QLakdCO7uN4XaRj7ieppI4S2BxOX11I7IUluq9OyECf3v4HtgCZvo5MqjzePEeWyJhL3qTLWLqFDWYZx0RuOUU5yp+z47hXdq4bLfmCJqt0h8PEeL/2V5vwhrN3H0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416372; c=relaxed/simple;
	bh=8Vde+ZzPWREP1Ef8m3E8dFlULUcTkwWC4jJHFJrbHGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bU9xXMdRST1ScG7lLqWLZt1oDDz+tzyo+aCJplcTwch6/6+RJEjsdp27YwSWMfoands0vCIcMvITvGXuEHbv2HwNDfyuGS0VM+zSDtjK8D/8JcI/4O5Rh73WJDEAVQzuWsJgcda1haZ96/lfinhAFVdRM8w2bWEhFxJaYCNkRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRaAMM0u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRaAMM0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740416370; x=1771952370;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8Vde+ZzPWREP1Ef8m3E8dFlULUcTkwWC4jJHFJrbHGw=;
  b=YRaAMM0uusOBCP+6hBFnjOCTn6JgVqkVdrZAXnBtffvK3MOH5m4rmzDo
   6cLlAbEilzBxRlFnN/qZ0/fZ8uEakJQDNXua358Wl34kAMXP7u2ZpILJ8
   zSffZ6sgEnzQWo3/wh4H8hVbd0O41JxoQsjQsloOIow/j9eoUVwXWSyKf
   PWrBnLTi6P/1xQsOOOzlYzGVfZ9GBnDLvAccKkOzklaQe7m1leDnAZYcm
   iYEbQw5qeBwWMtfZY2N2BP1IoqNKom3jV13sdD4aM/sDo4GEt5dm5iI4t
   McQ+UPARR64msmvzOuDEJtJQrZlEkTtpx6+wb5g6XfkQS0hrojn9rKr1A
   A==;
X-CSE-ConnectionGUID: SJ+chm0FRD60i1Fwd4bfHg==
X-CSE-MsgGUID: Up6kZGHMRFWDvx6b1tBAyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52586172"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="52586172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 08:59:28 -0800
X-CSE-ConnectionGUID: BxK60ZtvQhSjrNaSIWHqKw==
X-CSE-MsgGUID: XCqrehesQvezJhSnwAT6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116603550"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 08:59:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmbnh-00093K-0o;
	Mon, 24 Feb 2025 16:59:25 +0000
Date: Tue, 25 Feb 2025 00:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-riscv-imsic-state.c:135:7-8: ERROR: iterator
 variable bound on line 134 cannot be NULL
Message-ID: <202502250002.cD2qXFRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: "Björn Töpel" <bjorn@rivosinc.com>

Hi Anup,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: 0eebc69db358fd2f6fe34cc4db6428df6a540dd7 RISC-V: Select APLIC and IMSIC drivers
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-r064-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250002.cD2qXFRN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502250002.cD2qXFRN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-riscv-imsic-state.c:135:7-8: ERROR: iterator variable bound on line 134 cannot be NULL

vim +135 drivers/irqchip/irq-riscv-imsic-state.c

21a8f8a0eb35ce Anup Patel 2024-03-07  125  
21a8f8a0eb35ce Anup Patel 2024-03-07  126  static void __imsic_local_sync(struct imsic_local_priv *lpriv)
21a8f8a0eb35ce Anup Patel 2024-03-07  127  {
21a8f8a0eb35ce Anup Patel 2024-03-07  128  	struct imsic_local_config *mlocal;
21a8f8a0eb35ce Anup Patel 2024-03-07  129  	struct imsic_vector *vec, *mvec;
21a8f8a0eb35ce Anup Patel 2024-03-07  130  	int i;
21a8f8a0eb35ce Anup Patel 2024-03-07  131  
21a8f8a0eb35ce Anup Patel 2024-03-07  132  	lockdep_assert_held(&lpriv->lock);
21a8f8a0eb35ce Anup Patel 2024-03-07  133  
21a8f8a0eb35ce Anup Patel 2024-03-07 @134  	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
21a8f8a0eb35ce Anup Patel 2024-03-07 @135  		if (!i || i == IMSIC_IPI_ID)
21a8f8a0eb35ce Anup Patel 2024-03-07  136  			goto skip;
21a8f8a0eb35ce Anup Patel 2024-03-07  137  		vec = &lpriv->vectors[i];
21a8f8a0eb35ce Anup Patel 2024-03-07  138  
21a8f8a0eb35ce Anup Patel 2024-03-07  139  		if (READ_ONCE(vec->enable))
21a8f8a0eb35ce Anup Patel 2024-03-07  140  			__imsic_id_set_enable(i);
21a8f8a0eb35ce Anup Patel 2024-03-07  141  		else
21a8f8a0eb35ce Anup Patel 2024-03-07  142  			__imsic_id_clear_enable(i);
21a8f8a0eb35ce Anup Patel 2024-03-07  143  
21a8f8a0eb35ce Anup Patel 2024-03-07  144  		/*
21a8f8a0eb35ce Anup Patel 2024-03-07  145  		 * If the ID was being moved to a new ID on some other CPU
21a8f8a0eb35ce Anup Patel 2024-03-07  146  		 * then we can get a MSI during the movement so check the
21a8f8a0eb35ce Anup Patel 2024-03-07  147  		 * ID pending bit and re-trigger the new ID on other CPU
21a8f8a0eb35ce Anup Patel 2024-03-07  148  		 * using MMIO write.
21a8f8a0eb35ce Anup Patel 2024-03-07  149  		 */
21a8f8a0eb35ce Anup Patel 2024-03-07  150  		mvec = READ_ONCE(vec->move);
21a8f8a0eb35ce Anup Patel 2024-03-07  151  		WRITE_ONCE(vec->move, NULL);
21a8f8a0eb35ce Anup Patel 2024-03-07  152  		if (mvec && mvec != vec) {
21a8f8a0eb35ce Anup Patel 2024-03-07  153  			if (__imsic_id_read_clear_pending(i)) {
21a8f8a0eb35ce Anup Patel 2024-03-07  154  				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
21a8f8a0eb35ce Anup Patel 2024-03-07  155  				writel_relaxed(mvec->local_id, mlocal->msi_va);
21a8f8a0eb35ce Anup Patel 2024-03-07  156  			}
21a8f8a0eb35ce Anup Patel 2024-03-07  157  
21a8f8a0eb35ce Anup Patel 2024-03-07  158  			imsic_vector_free(&lpriv->vectors[i]);
21a8f8a0eb35ce Anup Patel 2024-03-07  159  		}
21a8f8a0eb35ce Anup Patel 2024-03-07  160  
21a8f8a0eb35ce Anup Patel 2024-03-07  161  skip:
21a8f8a0eb35ce Anup Patel 2024-03-07  162  		bitmap_clear(lpriv->dirty_bitmap, i, 1);
21a8f8a0eb35ce Anup Patel 2024-03-07  163  	}
21a8f8a0eb35ce Anup Patel 2024-03-07  164  }
21a8f8a0eb35ce Anup Patel 2024-03-07  165  

:::::: The code at line 135 was first introduced by commit
:::::: 21a8f8a0eb35ceb21e2c9ddd87468bc3b5ac87c0 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
