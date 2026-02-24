Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C52BE048
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935525; cv=none; b=GdxD6i+21m5J5e7dq2jubFT52O241eiaaXAGNZAANcziChoWZI9x+/LsuhxOgb99LNtCTGcgcx3HSg3O9hv5vvKBrYMWRZW27PO3+HZOj3p+7w/0QLqfYWvz60xOy8Ae+XwrhFnRNQ4fKmAOtmZ48DJqUInITYceBd6mzBbpO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935525; c=relaxed/simple;
	bh=voJaFGzGy7guSm5D8a7obqnzGEJT1zbNGzr3kDHMTLI=;
	h=Date:From:To:Subject:Message-ID; b=XsaNm0vvxNaBskHTZQ02rq2vhAjBtbWf9s2HaZPsaMwi64WJsYTByqumyHz/peTKqvNYQNHQ+sOydKupBRq/OXvrAKhJDD6zcByZlk6VwoecEpt/ZlVyNZzT7YLPlnwzGf0e+G8OXAIRxXTRxdi8C1Gmx7H6sTCVu7E0jprZxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMjpdny0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMjpdny0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935523; x=1803471523;
  h=date:from:to:subject:message-id;
  bh=voJaFGzGy7guSm5D8a7obqnzGEJT1zbNGzr3kDHMTLI=;
  b=lMjpdny0rn8SwIQ7PuyuuA6rc3KIt7JGSy59cT79w58ayjLZwxcU5l+3
   R8lJHHK96A25jqrmhLnJ9DrqIfhlWGT+XIfdmQ0alv4Jlpc1ZDPlYMgCs
   UogS6Q6VtMtSIViMEcLF6STm+D6UCBEM+JX0vOzWINtsFjvLeuPYnZp8B
   EDtLazXW5ly3VNlPA3cJ3KWJJZzAU+Ol8VCZyWEOl8QXmi5q+1F0XvOuZ
   iKjuC98jPy0PJ27n07VUtRCsLZfRXVM+mVPN9jXtWJ3q0tebl/8xt5dAd
   YLgre6Bd4D+XkhZr+LSU5J87DZkArxnYf2XIaxw9Wq8FA6u70S3ZR7gDF
   w==;
X-CSE-ConnectionGUID: GTE/gLgAT0KpFlyWdbbXnA==
X-CSE-MsgGUID: gDXA5wMcQmCkMFw+1vozVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72858737"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72858737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:18:42 -0800
X-CSE-ConnectionGUID: xgwcZSoxSBy8rt47X4JuHA==
X-CSE-MsgGUID: JgWWWkbnTtqhAPFg3cYV3w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 04:18:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurN9-000000005Fl-3igw
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:18:39 +0000
Date: Tue, 24 Feb 2026 13:18:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 510/733] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602241312.titQv7Xy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: b886993c68637434aacb9ae3258946a0bbe8526b [510/733] mmio: remove extraneous 'volatile' annotations'
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241312.titQv7Xy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#199: FILE: arch/powerpc/include/asm/eeh.h:435:
+static inline void eeh_readsb(const void __iomem *addr, void * buf,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#208: FILE: arch/powerpc/include/asm/eeh.h:443:
+static inline void eeh_readsw(const void __iomem *addr, void * buf,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#217: FILE: arch/powerpc/include/asm/eeh.h:451:
+static inline void eeh_readsl(const void __iomem *addr, void * buf,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#606: FILE: arch/powerpc/include/asm/io.h:877:
+static inline unsigned long virt_to_phys(const void * address)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#615: FILE: arch/powerpc/include/asm/io.h:911:
+static inline unsigned long virt_to_bus(void * address)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#823: FILE: arch/powerpc/platforms/powermac/feature.c:497:
+		struct dbdma_regs __iomem * chan = (void __iomem *)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#832: FILE: arch/powerpc/platforms/powermac/feature.c:513:
+		struct dbdma_regs __iomem * chan = (void __iomem *)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1258: FILE: drivers/atm/fore200e.h:773:
+    u32 __iomem * hcr;    /* address of host control register        */

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1259: FILE: drivers/atm/fore200e.h:774:
+    u32 __iomem * imr;    /* address of host interrupt mask register */

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1260: FILE: drivers/atm/fore200e.h:775:
+    u32 __iomem * psr;    /* address of PCI specific register        */

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2176: FILE: drivers/scsi/qla1280.c:3828:
+qla1280_debounce_register(u16 __iomem * addr)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2488: FILE: drivers/video/fbdev/kyro/STG4000Ramdac.c:22:
+int InitialiseRamdac(STG4000REG __iomem * pSTGReg,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2497: FILE: drivers/video/fbdev/kyro/STG4000Ramdac.c:147:
+void DisableRamdacOutput(STG4000REG __iomem * pSTGReg)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#2506: FILE: drivers/video/fbdev/kyro/STG4000Ramdac.c:156:
+void EnableRamdacOutput(STG4000REG __iomem * pSTGReg)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
