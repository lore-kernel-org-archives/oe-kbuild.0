Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120EB18FDAF
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734277494; cv=none; b=C4gokteoYRrakqo0vwBEfKnoQi8dBIIaEmE4717ZB/NSuaQyAr4YQPITAjxamnCXVSxp3uGd5DG0K+/lCujmg3iMYuVMxghqvmaxTZGvln27dM+lOyfbQ7BL4Z9xONz98q4OVqb40X8FxOkIxJapg0CZE7F3HNXtFSC1Ebh1dXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734277494; c=relaxed/simple;
	bh=Yh/t2LPp18ZRqNsnENaq7d705ORpkzl2iJG2R2lwXpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RlKfP00HxCWDKA12d/Il/hHwUJ5Iq4Ilw2jAV6vdbjlAcbMj7Fj+UEethd/1vcV3O0eowiLwWEUY3S1vnnd0WTEr/miadenPRPRDl7pJ+KNISFLUkbwybsPm3vsq8A4iNOpJDX3YLcgpXnyFxl8gkf/t+7nriMsTc8ToYayJxPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELkwlCoJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELkwlCoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734277492; x=1765813492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yh/t2LPp18ZRqNsnENaq7d705ORpkzl2iJG2R2lwXpE=;
  b=ELkwlCoJqN4+JR0eHEF8ajA371swPFYhP9aFzEUma2JDSqhemKPzuLVF
   SjQY1TRxnBNmXM55301dsbEHD/ka4UAsuaapUw7WGCNJTHxVdjssiKPqI
   o8P8HQ2fudfMLTrII3FiAmYlzuqw2f9SueMxp1Cu2za1/SKMtCH5o09jQ
   3D7O+VfV2f08v91INBMhNjtpypXYWIpHyPuW91iR1ph86AY3JvmaBytna
   ftAyd5rKCxBsd8wXeFPIIrQ/Lg3nbm3BireXsTKY42Ya9j5+y8tkAik3c
   5sqJvFbNOGcTDHrgxKypPOBnhH67USMYMZwRuNFXd4jT1PGhk3OMWRLxe
   Q==;
X-CSE-ConnectionGUID: OKQVkgzfRtCiBuJ5tUdYkA==
X-CSE-MsgGUID: /yR68ah3QWSRq2mLicnTlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34816522"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34816522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 07:44:51 -0800
X-CSE-ConnectionGUID: ixRls94HTvK7vepcnjO6uQ==
X-CSE-MsgGUID: iSXdLd1kSi+44NYc4ilQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="101830256"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Dec 2024 07:44:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMqnY-000Dh2-19;
	Sun, 15 Dec 2024 15:44:48 +0000
Date: Sun, 15 Dec 2024 23:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/include/asm/pgtable_32.h:68:5: warning: "PTRS_PER_PMD" is
 not defined, evaluates to 0
Message-ID: <202412152358.l9RJiVaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
date:   2 years ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 years ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412152358.l9RJiVaH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152358.l9RJiVaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412152358.l9RJiVaH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/head_32.S:29:
>> arch/x86/include/asm/pgtable_32.h:68:5: warning: "PTRS_PER_PMD" is not defined, evaluates to 0 [-Wundef]
      68 | #if PTRS_PER_PMD > 1
         |     ^~~~~~~~~~~~


vim +/PTRS_PER_PMD +68 arch/x86/include/asm/pgtable_32.h

^1da177e4c3f415 include/asm-i386/pgtable.h        Linus Torvalds  2005-04-16  58  
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  59  /*
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  60   * This is used to calculate the .brk reservation for initial pagetables.
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  61   * Enough space is reserved to allocate pagetables sufficient to cover all
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  62   * of LOWMEM_PAGES, which is an upper bound on the size of the direct map of
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  63   * lowmem.
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  64   *
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  65   * With PAE paging (PTRS_PER_PMD > 1), we allocate PTRS_PER_PGD == 4 pages for
ea3186b9572a1b0 arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  66   * the PMD's in addition to the pages required for the last level pagetables.
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  67   */
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08 @68  #if PTRS_PER_PMD > 1
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  69  #define PAGE_TABLE_SIZE(pages) (((pages) / PTRS_PER_PMD) + PTRS_PER_PGD)
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  70  #else
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  71  #define PAGE_TABLE_SIZE(pages) ((pages) / PTRS_PER_PGD)
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  72  #endif
1e620f9b23e598a arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  73  

:::::: The code at line 68 was first introduced by commit
:::::: 1e620f9b23e598ab936ece12233e98e97930b692 x86/boot/32: Convert the 32-bit pgtable setup code from assembly to C

:::::: TO: Boris Ostrovsky <boris.ostrovsky@oracle.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
