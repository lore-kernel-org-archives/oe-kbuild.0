Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589BC19CC3E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786663; cv=none; b=UY6e/KZlDf8mP3AnNad0I22sE5Lk37bZm/ed4zSxT9HwuEJ+fMItk7qXI2a7jfKzm076aigfKsLvzeV/5QhsvNsGU9hQtwa+yu5Gt3lwTW714eTmQpF5hz3ZsnguDdxnpV8L4QOkRktarhLXmyhaE6Qty6OmIME5uucbtaTEyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786663; c=relaxed/simple;
	bh=NZwoJuJGIldoBaAh6QR/GSRAvvydflVSyTiWABGnYMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4XJ27WkuEnjuMBYJCnQYy794VOk9y4SYTLKefFIIh663In58CkKMKHNgxInc/4TR4akdNvk8/csHtjoCf8GrkqC1bZ4Ahifpgqhug2c/HrXPwPithC5ZcUFqGHfEgdv2Cv96qYTyjNMeWmJqqIZUSF7IzD7DTdSGPoWWqnEGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lehiCqT3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lehiCqT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786661; x=1771322661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZwoJuJGIldoBaAh6QR/GSRAvvydflVSyTiWABGnYMo=;
  b=lehiCqT33TCpdkJ0s30tFLniXYmH3pwX2lCxni/6FHe2A/fNep7UBkl+
   pbtZJnEX/Nzkn8Dg4IFVSNaxSu3sKZW4BBAX3O/lHfPlZc0xAuQBziXWy
   kcCagBNAayquJtyz1PcmhGKfvI9cVUhWFWuvi5s1BehQu4BbAD5dLxq1h
   jXIkgASL4rlUIp6c2QLgEcSK3aDld9LRfg0dBwdZEPO0S2TG0lftbwe5A
   mSrkguU2Ewcpv91k6WyIUqgnCxNLROhoM8NH58ZIIAhvaYJqlFPLHQost
   pLXQRZtEMqXDCsIlSvUXhgVHKTNr7avT1b+bw4dXXheiEWIV5Mj5BPrYp
   Q==;
X-CSE-ConnectionGUID: o2noXRZGSquDakOPHcf5DQ==
X-CSE-MsgGUID: mrdTlJsRR06GoVl32QDOfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40321835"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="40321835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:04:20 -0800
X-CSE-ConnectionGUID: zYtocaB1SqS58+YmJZ4Cag==
X-CSE-MsgGUID: YrbLqa7KSD2Gr7LLH2R3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="114279545"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 02:04:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjxz5-001CxR-1t;
	Mon, 17 Feb 2025 10:04:15 +0000
Date: Mon, 17 Feb 2025 18:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/mm/fault.c:37 show_pte() warn: unsigned '_x' is never
 less than zero.
Message-ID: <202502171816.QzkcxhJY-lkp@intel.com>
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
TO: Yunhui Cui <cuiyunhui@bytedance.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ad2507d5d93f39619fc42372c347d6006b64319
commit: b6de116e4636e1a45e5ee69264a66cfab721e581 riscv/mm/fault: add show_pte() before die()
date:   4 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250217/202502171816.QzkcxhJY-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502171816.QzkcxhJY-lkp@intel.com/

New smatch warnings:
arch/riscv/mm/fault.c:37 show_pte() warn: unsigned '_x' is never less than zero.

Old smatch warnings:
include/asm-generic/io.h:1065 virt_to_phys() warn: unsigned '_x' is never less than zero.

vim +/_x +37 arch/riscv/mm/fault.c

ffaee2728f9b27 Paul Walmsley 2019-10-17  24  
b6de116e4636e1 Yunhui Cui    2024-07-23  25  static void show_pte(unsigned long addr)
b6de116e4636e1 Yunhui Cui    2024-07-23  26  {
b6de116e4636e1 Yunhui Cui    2024-07-23  27  	pgd_t *pgdp, pgd;
b6de116e4636e1 Yunhui Cui    2024-07-23  28  	p4d_t *p4dp, p4d;
b6de116e4636e1 Yunhui Cui    2024-07-23  29  	pud_t *pudp, pud;
b6de116e4636e1 Yunhui Cui    2024-07-23  30  	pmd_t *pmdp, pmd;
b6de116e4636e1 Yunhui Cui    2024-07-23  31  	pte_t *ptep, pte;
b6de116e4636e1 Yunhui Cui    2024-07-23  32  	struct mm_struct *mm = current->mm;
b6de116e4636e1 Yunhui Cui    2024-07-23  33  
b6de116e4636e1 Yunhui Cui    2024-07-23  34  	if (!mm)
b6de116e4636e1 Yunhui Cui    2024-07-23  35  		mm = &init_mm;
b6de116e4636e1 Yunhui Cui    2024-07-23  36  
b6de116e4636e1 Yunhui Cui    2024-07-23 @37  	pr_alert("Current %s pgtable: %luK pagesize, %d-bit VAs, pgdp=0x%016llx\n",
b6de116e4636e1 Yunhui Cui    2024-07-23  38  		 current->comm, PAGE_SIZE / SZ_1K, VA_BITS,
b6de116e4636e1 Yunhui Cui    2024-07-23  39  		 mm == &init_mm ? (u64)__pa_symbol(mm->pgd) : virt_to_phys(mm->pgd));
b6de116e4636e1 Yunhui Cui    2024-07-23  40  
b6de116e4636e1 Yunhui Cui    2024-07-23  41  	pgdp = pgd_offset(mm, addr);
b6de116e4636e1 Yunhui Cui    2024-07-23  42  	pgd = pgdp_get(pgdp);
b6de116e4636e1 Yunhui Cui    2024-07-23  43  	pr_alert("[%016lx] pgd=%016lx", addr, pgd_val(pgd));
b6de116e4636e1 Yunhui Cui    2024-07-23  44  	if (pgd_none(pgd) || pgd_bad(pgd) || pgd_leaf(pgd))
b6de116e4636e1 Yunhui Cui    2024-07-23  45  		goto out;
b6de116e4636e1 Yunhui Cui    2024-07-23  46  
b6de116e4636e1 Yunhui Cui    2024-07-23  47  	p4dp = p4d_offset(pgdp, addr);
b6de116e4636e1 Yunhui Cui    2024-07-23  48  	p4d = p4dp_get(p4dp);
b6de116e4636e1 Yunhui Cui    2024-07-23  49  	pr_cont(", p4d=%016lx", p4d_val(p4d));
b6de116e4636e1 Yunhui Cui    2024-07-23  50  	if (p4d_none(p4d) || p4d_bad(p4d) || p4d_leaf(p4d))
b6de116e4636e1 Yunhui Cui    2024-07-23  51  		goto out;
b6de116e4636e1 Yunhui Cui    2024-07-23  52  
b6de116e4636e1 Yunhui Cui    2024-07-23  53  	pudp = pud_offset(p4dp, addr);
b6de116e4636e1 Yunhui Cui    2024-07-23  54  	pud = pudp_get(pudp);
b6de116e4636e1 Yunhui Cui    2024-07-23  55  	pr_cont(", pud=%016lx", pud_val(pud));
b6de116e4636e1 Yunhui Cui    2024-07-23  56  	if (pud_none(pud) || pud_bad(pud) || pud_leaf(pud))
b6de116e4636e1 Yunhui Cui    2024-07-23  57  		goto out;
b6de116e4636e1 Yunhui Cui    2024-07-23  58  
b6de116e4636e1 Yunhui Cui    2024-07-23  59  	pmdp = pmd_offset(pudp, addr);
b6de116e4636e1 Yunhui Cui    2024-07-23  60  	pmd = pmdp_get(pmdp);
b6de116e4636e1 Yunhui Cui    2024-07-23  61  	pr_cont(", pmd=%016lx", pmd_val(pmd));
b6de116e4636e1 Yunhui Cui    2024-07-23  62  	if (pmd_none(pmd) || pmd_bad(pmd) || pmd_leaf(pmd))
b6de116e4636e1 Yunhui Cui    2024-07-23  63  		goto out;
b6de116e4636e1 Yunhui Cui    2024-07-23  64  
b6de116e4636e1 Yunhui Cui    2024-07-23  65  	ptep = pte_offset_map(pmdp, addr);
b6de116e4636e1 Yunhui Cui    2024-07-23  66  	if (!ptep)
b6de116e4636e1 Yunhui Cui    2024-07-23  67  		goto out;
b6de116e4636e1 Yunhui Cui    2024-07-23  68  
b6de116e4636e1 Yunhui Cui    2024-07-23  69  	pte = ptep_get(ptep);
b6de116e4636e1 Yunhui Cui    2024-07-23  70  	pr_cont(", pte=%016lx", pte_val(pte));
b6de116e4636e1 Yunhui Cui    2024-07-23  71  	pte_unmap(ptep);
b6de116e4636e1 Yunhui Cui    2024-07-23  72  out:
b6de116e4636e1 Yunhui Cui    2024-07-23  73  	pr_cont("\n");
b6de116e4636e1 Yunhui Cui    2024-07-23  74  }
b6de116e4636e1 Yunhui Cui    2024-07-23  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
