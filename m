Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5341BC07E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Sep 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216906; cv=none; b=PV1mlYSqsLu2BrpIgjFBeSkPUIbI9iiZTcLPfxXmjPs7TLkt3d9uNGBfW5YZogwv8hMNl0zcl8S518Xj/ZW/XW8Gnh2A/XZRemAWGjLtqcMsjpxExOc0banv7fF41F30BXwJTIcakydCmWQv19KPc6EpbWgIXXjSzNbuMxRbwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216906; c=relaxed/simple;
	bh=0D1k8KmeusV+jcdejI/fevuIDoMzjhBsViZuyMNYp1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+wsITJ0RyJ2QwRuXbtof2t8PRloQtZGDEbljimqyPm6cFkfsNRRYlAbnO2WxeI/WzD7FiLeAWXFrXBBNk/uBVnqzLwsF+wxfo44nOTalcccZ34wkLDB30ENh1FMRrqWtofpolquh7hBJo7uIdbmSWhOs6xumc73hqais151zQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SssbLyYq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SssbLyYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726216905; x=1757752905;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0D1k8KmeusV+jcdejI/fevuIDoMzjhBsViZuyMNYp1A=;
  b=SssbLyYqlHbX3pPtiqoqBilXs4nIHECNjL4idEggafTTwlEURxUA/Gpu
   uTCPAfsN5NugI0/aKNk04MYxjRTYC4sHbDb8+gLxaxrZ3W7WqMqKco/m0
   jNo2NiE8YeaXA9PYMlDzG5PoeBy3Bd71fVEuQkWLNVg/IAg3WO6L5YPi4
   C8B1Yp1KsLXf9ZRK+pVVdWEL0L6gEp43PiSubColPBf2QL6EI1QcAvMIu
   pg4nU908I+adbkJQP3pIzRWGg2FPCsEDsrc9HjQ6D5vGjS4BvYEcJ8rM/
   sodsxKyDJwqZuMRBbbGqaugVy27SXVfYLRc5vJmHFRWlcppT3+M5w1M/v
   w==;
X-CSE-ConnectionGUID: Ia3UjpEEQQCyDfVQIdz8+w==
X-CSE-MsgGUID: 4c7RV6ktQbSSPJNALFT+GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28022861"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28022861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:41:44 -0700
X-CSE-ConnectionGUID: UHHk7r6LR4ydoWYsaZ7FkA==
X-CSE-MsgGUID: FMqapVlDQaqC/npy2ZcJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68293976"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 01:41:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp1s5-0006EV-08;
	Fri, 13 Sep 2024 08:41:41 +0000
Date: Fri, 13 Sep 2024 16:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-riscv-imsic-state.c:135:7-8: ERROR: iterator
 variable bound on line 134 cannot be NULL
Message-ID: <202409131618.q80EjKwl-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   196145c606d0f816fd3926483cb1ff87e09c2c0b
commit: 0eebc69db358fd2f6fe34cc4db6428df6a540dd7 RISC-V: Select APLIC and IMSIC drivers
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r051-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131618.q80EjKwl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409131618.q80EjKwl-lkp@intel.com/

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
