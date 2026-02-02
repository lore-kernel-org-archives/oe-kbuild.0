Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD3318EF6
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 21:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770069568; cv=none; b=SdPzVoPnUbCu+wTdIpqrNbZuurI+xFw6CjbuSNIhPOAbHkxVEQCchdmE1KNPp11ibcYc3QJGD9hvawuYBrMYYEqShBmXU2XXFksHegYGX8n0VNrY3RFZwcdhMhLRPWaU2DHRNUcvnJlhtldXxu6j9/vpYwevoxFtRhSUOm4RePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770069568; c=relaxed/simple;
	bh=Sk7UPKsJHtoXQy6rj+ckLsiLEBoFYHt7B08QnYrVl3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfbyhbaNboSdn6U0avq51/v7uvGPlpFvudH+wy2a9Vp0P6zGGRTVpKB3f4OENSgPEWbbOKErbzCyvrWjDGyH1W0fjUSsJsDm8Ex9W2utfN+/XuaGcWLEfGCqhbmP3fJznbrLPaFCDKomgI13dEA/TytRDb+jpnfh9LlWxpN8/00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWKd9IWr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWKd9IWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770069567; x=1801605567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sk7UPKsJHtoXQy6rj+ckLsiLEBoFYHt7B08QnYrVl3M=;
  b=iWKd9IWrPkE8d5Lo+dpVtXYWQefW4RpRr2Brxgq3Z4WYA5cohiTrFoep
   RurKqwS0XRfu0EYAxAovhtcbuGpQCxakfBC9YflxdFz4iuW5KjqzuTHQR
   /otvunhAbQKecwx17P7XsU0s6ydlA0IVLyxojqTaRmrNBISx9BXaiq0dN
   HcVv9Q9Hy4ri8c6RJekKn4gic0xWybmwBn0AZyUaJAnm9FggvUP0Mc/Oy
   wo6UfZs7vhXIKFHJr/YDZ8eovUDWDnAxDe1lVV84WOg7mIyAFsWgmsVOg
   KS96WrIi8hx2Md4BVvgl3wvAVpvbJiBv0lLdF1C5BhslDkk+siD0pFSOJ
   Q==;
X-CSE-ConnectionGUID: PEwhh5BfSVeXaIq4cg3iTw==
X-CSE-MsgGUID: RgrszehRRWeHnvdSQsVjEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71318196"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71318196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 13:59:27 -0800
X-CSE-ConnectionGUID: BQASxZkOSEWQk9xqVxUnyA==
X-CSE-MsgGUID: JitYlNr8SyWo26VST5qFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209864294"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Feb 2026 13:59:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn1x5-00000000g04-0VzS;
	Mon, 02 Feb 2026 21:59:23 +0000
Date: Tue, 3 Feb 2026 05:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
Message-ID: <202602030502.rQEjzv5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/irqchip/irq-loongarch-ir.c:206:21: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260202091041.2278271-5-zhangtianyang@loongson.cn>
References: <20260202091041.2278271-5-zhangtianyang@loongson.cn>
TO: Tianyang Zhang <zhangtianyang@loongson.cn>
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: corbet@lwn.net
TO: alexs@kernel.org
TO: si.yanteng@linux.dev
TO: tglx@linutronix.de
TO: jiaxun.yang@flygoat.com
TO: maobibo@loongson.cn
CC: loongarch@lists.linux.dev
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tianyang Zhang <zhangtianyang@loongson.cn>
CC: Liupu Wang <wangliupu@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.19-rc8 next-20260202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/Docs-LoongArch-Add-Advanced-Extended-Redirect-IRQ-model-description/20260202-171607
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260202091041.2278271-5-zhangtianyang%40loongson.cn
patch subject: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip support
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-r111-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030502.rQEjzv5G-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030502.rQEjzv5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602030502.rQEjzv5G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-loongarch-ir.c:159:9: sparse: sparse: context imbalance in 'invalid_enqueue' - wrong count at exit
>> drivers/irqchip/irq-loongarch-ir.c:206:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/irqchip/irq-loongarch-ir.c: note: in included file (through include/linux/cpumask.h, arch/loongarch/include/asm/processor.h, arch/loongarch/include/asm/thread_info.h, ...):
   include/linux/bitmap.h:718:32: sparse: signed value source
   include/linux/bitmap.h:712:5: sparse: sparse: context imbalance in 'redirect_table_alloc' - wrong count at exit

vim +206 drivers/irqchip/irq-loongarch-ir.c

dbaee479dc4803 Tianyang Zhang 2026-02-02  192  
dbaee479dc4803 Tianyang Zhang 2026-02-02  193  static int redirect_table_alloc(int node, u32 nr_irqs)
dbaee479dc4803 Tianyang Zhang 2026-02-02  194  {
dbaee479dc4803 Tianyang Zhang 2026-02-02  195  	struct redirect_table *ird_table = &irde_descs[node].ird_table;
dbaee479dc4803 Tianyang Zhang 2026-02-02  196  	unsigned int index, order = 0;
dbaee479dc4803 Tianyang Zhang 2026-02-02  197  
dbaee479dc4803 Tianyang Zhang 2026-02-02  198  	if (nr_irqs > 1) {
dbaee479dc4803 Tianyang Zhang 2026-02-02  199  		nr_irqs = __roundup_pow_of_two(nr_irqs);
dbaee479dc4803 Tianyang Zhang 2026-02-02  200  		order = ilog2(nr_irqs);
dbaee479dc4803 Tianyang Zhang 2026-02-02  201  	}
dbaee479dc4803 Tianyang Zhang 2026-02-02  202  
dbaee479dc4803 Tianyang Zhang 2026-02-02  203  	guard(raw_spinlock_irqsave)(&ird_table->lock);
dbaee479dc4803 Tianyang Zhang 2026-02-02  204  
dbaee479dc4803 Tianyang Zhang 2026-02-02  205  	index = bitmap_find_free_region(ird_table->bitmap, IRD_ENTRIES, order);
dbaee479dc4803 Tianyang Zhang 2026-02-02 @206  	if (index < 0) {
dbaee479dc4803 Tianyang Zhang 2026-02-02  207  		pr_err("No redirect entry to use\n");
dbaee479dc4803 Tianyang Zhang 2026-02-02  208  		return -EINVAL;
dbaee479dc4803 Tianyang Zhang 2026-02-02  209  	}
dbaee479dc4803 Tianyang Zhang 2026-02-02  210  
dbaee479dc4803 Tianyang Zhang 2026-02-02  211  	return index;
dbaee479dc4803 Tianyang Zhang 2026-02-02  212  }
dbaee479dc4803 Tianyang Zhang 2026-02-02  213  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
