Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649419BBC
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728107522; cv=none; b=nqKDsHKjgabeV93j1uXsprqEBIyojECchc1bMAJGgHi/gCETx8v8au3MZsPvvAn9FPrKNPQxJXfVTjt1KZUtSCWNVXFS9LzTgm5KJKtq8yUcWQr94yFcHwZqUDhGYOSMTv2KN+8OUDdPWF9FYKRVC3amzZ7v6CUwlt11C9kXBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728107522; c=relaxed/simple;
	bh=rfSr7/nTcEmY4z6zrRxin8UK8AW52h3t5r0CqTWXCQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUZ9KzaoyO469mINpZqQkHWWpsUEKFSu9o70t9F+WuufUymVQtgH0U2G0mxO6ef0ATQlEnz2vXcbzEaRZPaQVRttRWANa433qocwCov83+o4ONUVMO2eJSPiFW44FrBfBoxZsQJsuthDjw1PbdMzNnHN7HGBmUu6ZKk3wdXRBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df/o04v3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df/o04v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728107520; x=1759643520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfSr7/nTcEmY4z6zrRxin8UK8AW52h3t5r0CqTWXCQg=;
  b=df/o04v3XDjP6wpm90AoUNUKdm3FQ9ni59e/FMmrFgCnem6cesWS8jth
   QLfpK+JTr+CmcZm5zvwENe0o/MD5seWWzIMbFPoo8mtisvegFT2OlSBVa
   plqf1OekHbX4txOixeWKEB4OLljOk7/0qhacWBK45ESdbUOks6H2ro0td
   EvEol37rfIFQ8Y0Xk9sGdAaCh7xizFmyh8gKBPwsiH1AbHVpzHrAEO/gI
   YntqdJ3kWAYfJxDzpWks3Tqhrasf/gvljjxVaJU1FFSo8uXawrhf7UYgN
   66q2q8EGQ+Gj39HwZ1LY7tto6WD+r8coV3Jyorl753yQe6PYO7kUDAUNJ
   w==;
X-CSE-ConnectionGUID: CZgwGFZfRHajMqoQDxyohg==
X-CSE-MsgGUID: +mpAt1clQsOKUgcTjjcfDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37934342"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37934342"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 22:51:59 -0700
X-CSE-ConnectionGUID: 48e1V3xrRhub4oh5XBvm0A==
X-CSE-MsgGUID: 0fbwHIbbQnugirZ3gwj5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="112381966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2024 22:51:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxhq-0002cc-2n;
	Sat, 05 Oct 2024 05:51:54 +0000
Date: Sat, 5 Oct 2024 13:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-loongarch-avec.c:182 complete_irq_moving()
 error: uninitialized symbol 'isr'.
Message-ID: <202410051320.MOgkWixE-lkp@intel.com>
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
head:   27cc6fdf720183dce1dbd293483ec5a9cb6b595e
commit: ae16f05c928a1336d5d9d19fd805d7bf29c3f0c8 irqchip/loongarch-avec: Add AVEC irqchip support
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241005/202410051320.MOgkWixE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410051320.MOgkWixE-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-loongarch-avec.c:182 complete_irq_moving() error: uninitialized symbol 'isr'.

Old smatch warnings:
internal error: ../lib/gcc/loongarch64-linux/14.1.0/include/larchintrin.h:291 SQL error #2: near "and": syntax error
internal error: ../lib/gcc/loongarch64-linux/14.1.0/include/larchintrin.h:291 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

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
