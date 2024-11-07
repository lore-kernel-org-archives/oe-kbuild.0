Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20677212F13
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993003; cv=none; b=WTt7Si+427+iUVaecihkvIHvkZ1k8MRrqNLP9pi7ovM07JE9If/apIcAjkq4PUHK7BRS8M7c7GVOfFwgX6LdTCAFs6UcFM98KkYT0rgCCCWvMY4pvuj8R76Rjt4GlQlu+g/qI6lSrWF7AlQXxkW55R2TR9lE3fW+d60SeBE10Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993003; c=relaxed/simple;
	bh=5lX4P66dYU5/OZJnC+HDTJhY38siEw98qe4iTfthwH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kbv6kSsTuYrb3NXqDi68g8itDkbg6AwMqEa1bKraNucgUtMJubDNv5iDw1mYiDnY44ibQt9+958ykrTlX94g3eNg/667Me3q2Cj4UtwmejYreusHi0GYLas4cHo3/G2nyf2AsPzuDdEUteS4cEqFuY4DUO3Sb2nzi1Um4zCRaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKNOu/jM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKNOu/jM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730993001; x=1762529001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5lX4P66dYU5/OZJnC+HDTJhY38siEw98qe4iTfthwH8=;
  b=XKNOu/jMkMZITL6Fp5EC3Vd5p9sxpNz4iJAGnxh8Sr6XqUoQTfMGfF6Z
   drdNfAc+XQ6CZOENkocgSH1yLBr1zwb753nYHDWEHjThJ0pzvML2nHqSv
   6guJcSKn8znwjQZz3edybu9Pu+fCaItnJ/ZVkxc9ILERgfGOZxELI/G5i
   rfzvV4Ge1B8GbHweUI8+bL4sKGlXwSAbrEKVU8AGEZ7e0Mja2foYPDEeQ
   GRoUNZGakhNSiNsalEDV3/hAgepvqWUQsExv9Mmf+CX3g7KVKNinVpZl/
   ZWG+ywCM+IlK1/LSk4L+WGyMMxK2GA8Qk3xiRZCQefEcpi162R/7vuLUZ
   g==;
X-CSE-ConnectionGUID: NJluEDmoRs+Z/mMBrAwJuQ==
X-CSE-MsgGUID: 1CH6PtSfSomV3Pmj4UMPVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34533320"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34533320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 07:23:21 -0800
X-CSE-ConnectionGUID: O0jxM1DrTVqjxEc1v7S62Q==
X-CSE-MsgGUID: poBpUzZ8R06og5W1IbYbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="85453737"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2024 07:23:19 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t94Lt-000qRI-0U;
	Thu, 07 Nov 2024 15:23:17 +0000
Date: Thu, 7 Nov 2024 23:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-loongarch-avec.c:182 complete_irq_moving()
 error: uninitialized symbol 'isr'.
Message-ID: <202411072324.f1s5oPfe-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tianyang Zhang <zhangtianyang@loongson.cn>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Jianmin Lv <lvjianmin@loongson.cn>
CC: Liupu Wang <wangliupu@loongson.cn>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
commit: ae16f05c928a1336d5d9d19fd805d7bf29c3f0c8 irqchip/loongarch-avec: Add AVEC irqchip support
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241107/202411072324.f1s5oPfe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411072324.f1s5oPfe-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-loongarch-avec.c:182 complete_irq_moving() error: uninitialized symbol 'isr'.

Old smatch warnings:
internal error: ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:291 SQL error #2: near "and": syntax error
internal error: ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:291 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +/isr +182 drivers/irqchip/irq-loongarch-avec.c

ae16f05c928a13 Tianyang Zhang 2024-08-23  153  
ae16f05c928a13 Tianyang Zhang 2024-08-23  154  void complete_irq_moving(void)
ae16f05c928a13 Tianyang Zhang 2024-08-23  155  {
ae16f05c928a13 Tianyang Zhang 2024-08-23  156  	struct pending_list *plist = this_cpu_ptr(&pending_list);
ae16f05c928a13 Tianyang Zhang 2024-08-23  157  	struct avecintc_data *adata, *tdata;
ae16f05c928a13 Tianyang Zhang 2024-08-23  158  	int cpu, vector, bias;
ae16f05c928a13 Tianyang Zhang 2024-08-23  159  	uint64_t isr;
ae16f05c928a13 Tianyang Zhang 2024-08-23  160  
ae16f05c928a13 Tianyang Zhang 2024-08-23  161  	guard(raw_spinlock)(&loongarch_avec.lock);
ae16f05c928a13 Tianyang Zhang 2024-08-23  162  
ae16f05c928a13 Tianyang Zhang 2024-08-23  163  	list_for_each_entry_safe(adata, tdata, &plist->head, entry) {
ae16f05c928a13 Tianyang Zhang 2024-08-23  164  		cpu = adata->prev_cpu;
ae16f05c928a13 Tianyang Zhang 2024-08-23  165  		vector = adata->prev_vec;
ae16f05c928a13 Tianyang Zhang 2024-08-23  166  		bias = vector / VECTORS_PER_REG;
ae16f05c928a13 Tianyang Zhang 2024-08-23  167  		switch (bias) {
ae16f05c928a13 Tianyang Zhang 2024-08-23  168  		case 0:
ae16f05c928a13 Tianyang Zhang 2024-08-23  169  			isr = csr_read64(LOONGARCH_CSR_ISR0);
ae16f05c928a13 Tianyang Zhang 2024-08-23  170  			break;
ae16f05c928a13 Tianyang Zhang 2024-08-23  171  		case 1:
ae16f05c928a13 Tianyang Zhang 2024-08-23  172  			isr = csr_read64(LOONGARCH_CSR_ISR1);
ae16f05c928a13 Tianyang Zhang 2024-08-23  173  			break;
ae16f05c928a13 Tianyang Zhang 2024-08-23  174  		case 2:
ae16f05c928a13 Tianyang Zhang 2024-08-23  175  			isr = csr_read64(LOONGARCH_CSR_ISR2);
ae16f05c928a13 Tianyang Zhang 2024-08-23  176  			break;
ae16f05c928a13 Tianyang Zhang 2024-08-23  177  		case 3:
ae16f05c928a13 Tianyang Zhang 2024-08-23  178  			isr = csr_read64(LOONGARCH_CSR_ISR3);
ae16f05c928a13 Tianyang Zhang 2024-08-23  179  			break;
ae16f05c928a13 Tianyang Zhang 2024-08-23  180  		}
ae16f05c928a13 Tianyang Zhang 2024-08-23  181  
ae16f05c928a13 Tianyang Zhang 2024-08-23 @182  		if (isr & (1UL << (vector % VECTORS_PER_REG))) {
ae16f05c928a13 Tianyang Zhang 2024-08-23  183  			mp_ops.send_ipi_single(cpu, ACTION_CLEAR_VECTOR);
ae16f05c928a13 Tianyang Zhang 2024-08-23  184  			continue;
ae16f05c928a13 Tianyang Zhang 2024-08-23  185  		}
ae16f05c928a13 Tianyang Zhang 2024-08-23  186  		list_del(&adata->entry);
ae16f05c928a13 Tianyang Zhang 2024-08-23  187  		irq_matrix_free(loongarch_avec.vector_matrix, cpu, vector, false);
ae16f05c928a13 Tianyang Zhang 2024-08-23  188  		this_cpu_write(irq_map[vector], NULL);
ae16f05c928a13 Tianyang Zhang 2024-08-23  189  		adata->moving = 0;
ae16f05c928a13 Tianyang Zhang 2024-08-23  190  		adata->prev_cpu = adata->cpu;
ae16f05c928a13 Tianyang Zhang 2024-08-23  191  		adata->prev_vec = adata->vec;
ae16f05c928a13 Tianyang Zhang 2024-08-23  192  	}
ae16f05c928a13 Tianyang Zhang 2024-08-23  193  }
ae16f05c928a13 Tianyang Zhang 2024-08-23  194  #endif
ae16f05c928a13 Tianyang Zhang 2024-08-23  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
