Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A610F7
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 19:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897443; cv=none; b=l5JCvvF0HuxeYkMOmEKf+lqtmWKeTV1LaoQQ0LGoALHi7r36aCydZ0v1ua4/NLEohwM9MDPFT1FcTDIEoMZwMdmAGolP67cmLQ3z8D7Z+JlEjaYF2ubHzCwZDCr9AFii+87wyOVkpGIspC21ArPjlF56YBJsxOiNIBRqd+zZ2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897443; c=relaxed/simple;
	bh=gNeb7H5QWFiPNPLbszCJR1lFGUePceR1JqQC4M8lKNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOvWswyxQvpFD9tybx4D490rFx1tMSJY6/efCAlj0JxaWCcl/oAlNrmsvglNq5B0eN7fEczIiGAEEzmU8ZSRcZZrLhU/Gyv+9pLU4GnBT9ztXOrDN12PTvQgJw+ASjnz0cJtzoXO8BRw05siSltVH7A42+FL9uijW+Sko0QnsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2wubJ71; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2wubJ71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734897442; x=1766433442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNeb7H5QWFiPNPLbszCJR1lFGUePceR1JqQC4M8lKNM=;
  b=i2wubJ718KMDlBJuaJkSI1KajdNXGRCni8saHJG6Dh5L1Gpy6PJqQEt6
   3+dNXJY/BS9kYJnfw7moMbAcYyjZbcpTZIqZG4J2TSp0tmlz7uKaYs0CY
   kdG/54CdGeucgNNfMf87ntSr1sPFPfgTVYNJwmUXgtec/kic6qRXUIBrK
   H3PKMfW0w4M3lt6/kyCmj3JahtG7ZfaPbFyrhdOkMsYxb9hJhxyYadOM2
   NDGggr9kFrWSFW5X5xKXUDb+rNLrM7+a8j1mm8SEjFTu9eOEHPswv3JoI
   v9TBZc46EP+sr+kUfB8klS4zljJXSVh2yHPvkZ2gAgGJ8LSsL0SzDkZs4
   A==;
X-CSE-ConnectionGUID: UcSN2zVrQOeybYXRtX0CcA==
X-CSE-MsgGUID: swl4FcxUTYaRGOfiM/1/SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35082978"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35082978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 11:57:21 -0800
X-CSE-ConnectionGUID: WOOLY9XeSS6/ptzKW8XvTw==
X-CSE-MsgGUID: UaF+MlkyTdOVmS6507mkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122303178"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 11:57:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPS4j-00038T-1m;
	Sun, 22 Dec 2024 19:57:17 +0000
Date: Mon, 23 Dec 2024 03:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-loongarch-avec.c:182 complete_irq_moving()
 error: uninitialized symbol 'isr'.
Message-ID: <202412230303.rTJL316D-lkp@intel.com>
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
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: ae16f05c928a1336d5d9d19fd805d7bf29c3f0c8 irqchip/loongarch-avec: Add AVEC irqchip support
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r071-20241222 (https://download.01.org/0day-ci/archive/20241223/202412230303.rTJL316D-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412230303.rTJL316D-lkp@intel.com/

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
