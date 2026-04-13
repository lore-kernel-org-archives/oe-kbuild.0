Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE43CBE71
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088075; cv=none; b=lRDUbPo6klUDVgX5UzxB9wQnSKYbHDpz5i6j4S6PlrVl1GUqZ95OjDuC2QonqFoEMXCokXQYYX6FWunBIWtqyZNKBIsu7oeXov2qVkvn04x1KCon8Sj19VPG1YGyfH2uPFstzRHBPLogP7CNBWXhSySF1w5a0YebyFSG2NH4nvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088075; c=relaxed/simple;
	bh=ew6dg7bVqPDh9UWRTegiyrQyDPo3nwRgJNz0A6rE2X8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bNTdBh7xKlZJoCW2DjNy/OhEbpEbDQ4YEwBnz74/84WIkCLpB/bZTe/KWD7sF2HdcE6u5/c0Pbbk0frsu4gfrxYhaUCvU9hl1m07n2OrlP1ueBO6hhtjloC0HuGMY4gwqlutp7PbtuwYeHYPsPajyxMSdaeFYW9Av9C7HT2Nm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOlA3NER; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOlA3NER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776088073; x=1807624073;
  h=date:from:to:cc:subject:message-id;
  bh=ew6dg7bVqPDh9UWRTegiyrQyDPo3nwRgJNz0A6rE2X8=;
  b=lOlA3NERGKW2gvl5cPO8/wiR/3JK0NRyJm7yOEfxR9Dg4ep6IXjMUJi3
   o6dTGRH3dbMKzD7Bvuqt8O9IObuv5i9GAJYceV3DqRrLD1ClNi1rrfv14
   4PpRhc0y4VRKK0H/Z6gqjJ+JONXM9cMXV8BQfGi2Qbs6JJK2J3A7SuRWp
   T2qYxlcRRaANCZ/VpnEjGsnSZiCwjKoyJi2TSD6yl2b/HPp2knQGIQUCs
   iAtg+9lEDex7ca8eFDiEXC4cHu49r6OVR+EENDLY7uaEnzXhnZEXjwPJL
   HBIZGkgA3QhLuYEUNz3UOCXo+XMZTk170AwpBMVuad/0yMeyUaLPJM/9T
   A==;
X-CSE-ConnectionGUID: 1U7SXF/zSTaxjJPKpNAFKA==
X-CSE-MsgGUID: YccUWPdnQ4uRz4od0cXp6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="79605433"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="79605433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:47:08 -0700
X-CSE-ConnectionGUID: l7eXznraSY637sKj2T2t7Q==
X-CSE-MsgGUID: /oUCoEsFSmej1euOjjeAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="234709377"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Apr 2026 06:47:06 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCHd2-000000000Yr-11B8;
	Mon, 13 Apr 2026 13:47:04 +0000
Date: Mon, 13 Apr 2026 21:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 89/95] include/linux/fs.h:2309:55:
 error: use of undeclared identifier 'sb'
Message-ID: <202604132106.d2L3bdYs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   834588da5a3bc2696586cdc98024dcebec97aeed
commit: 17d214586b5a8428fd694848a621f1e83376cbcb [89/95] block: Enable lock context analysis for all block drivers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260413/202604132106.d2L3bdYs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132106.d2L3bdYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604132106.d2L3bdYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/floppy.c:166:
   In file included from include/linux/async.h:14:
   In file included from include/linux/device.h:34:
   In file included from arch/sparc/include/asm/device.h:8:
   In file included from arch/sparc/include/asm/openprom.h:15:
   In file included from include/linux/of.h:252:
   In file included from arch/sparc/include/asm/prom.h:18:
   In file included from include/linux/proc_fs.h:10:
>> include/linux/fs.h:2309:55: error: use of undeclared identifier 'sb'
    2309 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:168:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:183:
   In file included from include/linux/mc146818rtc.h:15:
   In file included from include/linux/rtc.h:40:
   include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   In file included from drivers/block/floppy.c:252:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1745:15: error: use of undeclared identifier 'bdev'
    1745 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1751:15: error: use of undeclared identifier 'bdev'
    1751 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1757:15: error: use of undeclared identifier 'bdev'
    1757 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1763:15: error: use of undeclared identifier 'bdev'
    1763 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   drivers/block/floppy.c:232:23: warning: variable 'virtual_dma_port' set but not used [-Wunused-but-set-global]
     232 | static unsigned short virtual_dma_port = 0x3f0;
         |                       ^
   17 warnings and 5 errors generated.
--
   In file included from drivers/block/brd.c:17:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
>> include/linux/fs.h:2309:55: error: use of undeclared identifier 'sb'
    2309 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/brd.c:17:
>> include/linux/blkdev.h:1745:15: error: use of undeclared identifier 'bdev'
    1745 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1751:15: error: use of undeclared identifier 'bdev'
    1751 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1757:15: error: use of undeclared identifier 'bdev'
    1757 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1763:15: error: use of undeclared identifier 'bdev'
    1763 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   5 errors generated.
--
   In file included from drivers/block/loop.c:8:
>> include/linux/fs.h:2309:55: error: use of undeclared identifier 'sb'
    2309 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:15:
   In file included from include/linux/blkpg.h:9:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/loop.c:36:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1745:15: error: use of undeclared identifier 'bdev'
    1745 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1751:15: error: use of undeclared identifier 'bdev'
    1751 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1757:15: error: use of undeclared identifier 'bdev'
    1757 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1763:15: error: use of undeclared identifier 'bdev'
    1763 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   12 warnings and 5 errors generated.
--
   In file included from drivers/block/nbd.c:18:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
>> include/linux/fs.h:2309:55: error: use of undeclared identifier 'sb'
    2309 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/nbd.c:18:
>> include/linux/blkdev.h:1745:15: error: use of undeclared identifier 'bdev'
    1745 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1751:15: error: use of undeclared identifier 'bdev'
    1751 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1757:15: error: use of undeclared identifier 'bdev'
    1757 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1763:15: error: use of undeclared identifier 'bdev'
    1763 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   In file included from drivers/block/nbd.c:35:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/nbd.c:35:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/nbd.c:35:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/nbd.c:35:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/nbd.c:35:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:44:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
..


vim +/sb +2309 include/linux/fs.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  2293  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2294  struct file_system_type {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2295  	const char *name;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2296  	int fs_flags;
bbc1096ad8e9875 David Howells     2012-10-15  2297  #define FS_REQUIRES_DEV		1 
bbc1096ad8e9875 David Howells     2012-10-15  2298  #define FS_BINARY_MOUNTDATA	2
bbc1096ad8e9875 David Howells     2012-10-15  2299  #define FS_HAS_SUBTYPE		4
0c55cfc4166d9a0 Eric W. Biederman 2012-07-26  2300  #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
0b3b094ac9a7bb1 Jan Kara          2019-05-15  2301  #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
a6435940b62f81a Christian Brauner 2021-01-21  2302  #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
4e40eff0b5737c0 Jeff Layton       2024-10-02  2303  #define FS_MGTIME		64	/* FS uses multigrain timestamps */
a64e5a596067bdd Luis Chamberlain  2025-03-06  2304  #define FS_LBS			128	/* FS supports LBS */
a3f8f8662771285 Christian Brauner 2025-11-05  2305  #define FS_POWER_FREEZE		256	/* Always freeze on suspend/hibernate */
bbc1096ad8e9875 David Howells     2012-10-15  2306  #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
f3a09c92018a91a Al Viro           2018-12-23  2307  	int (*init_fs_context)(struct fs_context *);
d7167b149943e38 Al Viro           2019-09-07  2308  	const struct fs_parameter_spec *parameters;
44ff19e9d08b29c Bart Van Assche   2026-01-21 @2309  	void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2310  	struct module *owner;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2311  	struct file_system_type * next;
a5166169f9b920c Al Viro           2011-12-12  2312  	struct hlist_head fs_supers;
d475fd428ce77aa Peter Zijlstra    2007-10-15  2313  
cf51624999e56c8 Ingo Molnar       2006-07-03  2314  	struct lock_class_key s_lock_key;
897c6ff9568bcb1 Arjan van de Ven  2006-07-03  2315  	struct lock_class_key s_umount_key;
51ee049e771c14a Roland Dreier     2010-04-27  2316  	struct lock_class_key s_vfs_rename_key;
5accdf82ba25cac Jan Kara          2012-06-12  2317  	struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
d475fd428ce77aa Peter Zijlstra    2007-10-15  2318  
d475fd428ce77aa Peter Zijlstra    2007-10-15  2319  	struct lock_class_key i_lock_key;
d475fd428ce77aa Peter Zijlstra    2007-10-15  2320  	struct lock_class_key i_mutex_key;
730633f0b7f9517 Jan Kara          2021-01-28  2321  	struct lock_class_key invalidate_lock_key;
14358e6ddaed274 Peter Zijlstra    2007-10-14  2322  	struct lock_class_key i_mutex_dir_key;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2323  };
^1da177e4c3f415 Linus Torvalds    2005-04-16  2324  

:::::: The code at line 2309 was first introduced by commit
:::::: 44ff19e9d08b29c0af9d3ca362d7f679bf03c0b9 treewide: Add lock context annotations in all include files

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Bart Van Assche <bvanassche@acm.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
