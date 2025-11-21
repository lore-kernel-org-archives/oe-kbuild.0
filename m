Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461E2D97BD
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 22:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765606; cv=none; b=qmPay6tlnRdqlGDuy8BGd2jvhVVpweJV3Z2VAJCs8bUEtl2yYDjP2d22OxBeDv5TqMlu37wy/E9MupZcEdzeQkuc/0JpUD9DOicSOrsDaV6bcCSrt4hMsBZ9wkAl3fUPx8A1ji3KtwiNWM2Q2aaBbWykJDVAU6v6i7m0VLB+jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765606; c=relaxed/simple;
	bh=cOoYqiUTXATN8xVfL9KtnDrhfgy96hoh/oHaQaHWqIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnygg94c9y54NgfQQjE6zKbFidHMSj6VeU2Vig/kBhZZ7YOer4WcUG7etvI4hPy1CBKwGWWvyS2YTFv6iP4uk3J+lbLaxPN2LeDsEq5BRYPVEC+J8L4qbY7JeCPLk0SiuQQ3XG/Z2AaO5AdWujSaWVNexOyy6ari1aQfBnvcQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ii7EBvHj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ii7EBvHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763765603; x=1795301603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cOoYqiUTXATN8xVfL9KtnDrhfgy96hoh/oHaQaHWqIY=;
  b=Ii7EBvHjnJEW5l1/e9t9+iOdwBn/8aqKNgPIM09yYEZLKonZ2qcb42nK
   IqPwMlMZjMSwqIZfdYdYsXYUKwJFcSPrKbi0qrmN1QYfss/GPvkd0fh/L
   sWyhl7V+M/koseSo7mxy4kxIZEY/vKagISvOYntJpRw2grltO1cdVyVKv
   l0C0iUmsnF/lSGp0E1p0jb8NLeAtzo4bfgHCDkLR+yNmhr4EXkpJ7TyiM
   IBEFMV93+XLwhw3txZdeLVSjyjw3ssTPaRVZzhOSdr/vX7gQsrMESM24J
   kV3V32ee8wMTatHaog22T3GuaK/7OcuFo9h8bWUtA7GimIJOBP0E5HfUm
   Q==;
X-CSE-ConnectionGUID: Lr74UtWHSeKtZZRQFmIh8A==
X-CSE-MsgGUID: JBh4srI3Ramp2X1isFFnSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="66025054"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="66025054"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:53:21 -0800
X-CSE-ConnectionGUID: 5vitoEBtQYuGrFH6GZFEzQ==
X-CSE-MsgGUID: JyRZaRgKS4u9iM8QIlccQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222755292"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2025 14:53:20 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMa0E-000000001vz-1BW7;
	Fri, 21 Nov 2025 22:53:18 +0000
Date: Fri, 21 Nov 2025 23:52:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9003/11041] tools/include/nolibc/arch.h:41:2:
 error: #error Unsupported Architecture
Message-ID: <202511212331.pYBUDx2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 169ebcbb90829bec0429ff9f6012a0313169e45f [9003/11041] tools: Remove s390 compat support
:::::: branch date: 17 hours ago
:::::: commit date: 5 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212331.pYBUDx2S-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/stdio.h:8,
                    from nolibc-test.c:12:
>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
      41 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/errno.h:8,
                    from nolibc-test-linkage.c:5:
>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
      41 | #error Unsupported Architecture
         |  ^~~~~


vim +41 tools/include/nolibc/arch.h

271661c1cde5ff Willy Tarreau    2022-02-07  17  
cc6dc5fbecfdf2 Willy Tarreau    2025-06-18  18  #if defined(__x86_64__) || defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
cc6dc5fbecfdf2 Willy Tarreau    2025-06-18  19  #include "arch-x86.h"
271661c1cde5ff Willy Tarreau    2022-02-07  20  #elif defined(__ARM_EABI__)
271661c1cde5ff Willy Tarreau    2022-02-07  21  #include "arch-arm.h"
271661c1cde5ff Willy Tarreau    2022-02-07  22  #elif defined(__aarch64__)
01e8a6d0c39ca0 Thomas Weiﬂschuh 2025-06-23  23  #include "arch-arm64.h"
aa68a5a83a0acc Thomas Weiﬂschuh 2023-10-20  24  #elif defined(__mips__)
271661c1cde5ff Willy Tarreau    2022-02-07  25  #include "arch-mips.h"
0cb0675ec37e16 Zhangjin Wu      2023-08-06  26  #elif defined(__powerpc__)
0cb0675ec37e16 Zhangjin Wu      2023-08-06  27  #include "arch-powerpc.h"
271661c1cde5ff Willy Tarreau    2022-02-07  28  #elif defined(__riscv)
271661c1cde5ff Willy Tarreau    2022-02-07  29  #include "arch-riscv.h"
169ebcbb90829b Heiko Carstens   2025-11-10  30  #elif defined(__s390x__)
18a5a09d90a75f Sven Schnelle    2023-01-09  31  #include "arch-s390.h"
73f12c6da77a7c Feiyang Chen     2023-03-04  32  #elif defined(__loongarch__)
73f12c6da77a7c Feiyang Chen     2023-03-04  33  #include "arch-loongarch.h"
8e1930296f921d Thomas Weiﬂschuh 2025-02-26  34  #elif defined(__sparc__)
8e1930296f921d Thomas Weiﬂschuh 2025-02-26  35  #include "arch-sparc.h"
66a4f9bb1e895a Daniel Palmer    2025-04-27  36  #elif defined(__m68k__)
66a4f9bb1e895a Daniel Palmer    2025-04-27  37  #include "arch-m68k.h"
02217ad447d7b1 Thomas Weiﬂschuh 2025-06-23  38  #elif defined(__sh__)
02217ad447d7b1 Thomas Weiﬂschuh 2025-06-23  39  #include "arch-sh.h"
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05  40  #else
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05 @41  #error Unsupported Architecture
271661c1cde5ff Willy Tarreau    2022-02-07  42  #endif
271661c1cde5ff Willy Tarreau    2022-02-07  43  

:::::: The code at line 41 was first introduced by commit
:::::: 48946c5aa7a848c7dfc2151267af92956f492f58 tools/nolibc: error out on unsupported architecture

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Thomas Weiﬂschuh <linux@weissschuh.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
