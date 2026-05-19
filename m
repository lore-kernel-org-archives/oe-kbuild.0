Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B42370ADB
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187206; cv=none; b=S46z7U8rltJWrvNmz/SmjUxRlbQwDY/KKnmfoddG1uFJlqk+I61uuIhzvgBEf7Gy7jYPNzmyX63w4ueuzwWp+/NZPOCQR4QExGoerd0AmPR2QTNHI7wO6DHPPDZw3jIUEIT3N3YNADwVTBXbkAe1p/u4IhRgcBV9ws5Cz2ZeqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187206; c=relaxed/simple;
	bh=N1L7S0zT4hM55Yg5tE/yXxJZz4BQsGmZXWCsrEKs4yU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/X3//9/iIqNQWho1w1oZMVX5WK84P55BpDK8zwnWAjvuxbhByi+df9JqVfHUMdJwBme0YEFVM24gCWaHFG7ge0p6h5GzZIug5UErkkUC4yPLtLpFhWVxU99YtV7PpI3H6dHZcvTkM1xBFSb49mPcmDZlfq10QbpYbudxFfC9lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvMwwk6T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvMwwk6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779187204; x=1810723204;
  h=date:from:to:cc:subject:message-id;
  bh=N1L7S0zT4hM55Yg5tE/yXxJZz4BQsGmZXWCsrEKs4yU=;
  b=NvMwwk6TicvD05AhWq8Nm1Ww0JwgUoL20rxBUaTa+c0hbqWO8d+u+Mw+
   fUC8M56j06PJJQvCb9XH0V5ni3B7eN63zrgJ3gG0uMB5BcicaEYGlcI1L
   AtCB40ylCGn5fnVsayd1ZZ45Z/wHWBT66hO6hrfIG40ozWHHzm5GiAxSv
   OtRb7jMAEAuhlGIbS0aD6ZlI3CqG0vVmvgteY6khQnY2KnszEwpCUh/KB
   3VpeZx4ddRXh9vGgMtoGsAwmYjcU7hB2za4M8bt/M11WU87sk7IH1rj+D
   3WU2rTgr+/gx+d5SY3dAJOJ5vmQoihjxZxSwUyqgU9JF+0CZAH32b/VKB
   Q==;
X-CSE-ConnectionGUID: xBNstpW+QdW/6UyAQ1h+Nw==
X-CSE-MsgGUID: N774uy9NQ0mBFLJPMJN5xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="82625092"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82625092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:40:04 -0700
X-CSE-ConnectionGUID: RZo2j3JtS+uamehY6yvPog==
X-CSE-MsgGUID: mBLx753DSFKDOwAFVaQ/XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="241565008"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 May 2026 03:40:02 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPHrE-000000000tf-3BK3;
	Tue, 19 May 2026 10:39:38 +0000
Date: Tue, 19 May 2026 18:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 71/79] include/linux/fs.h:2310:55:
 error: use of undeclared identifier 'sb'
Message-ID: <202605191850.CMy8S3Ra-lkp@intel.com>
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
head:   916c5e42c31adc90cfa8e12478da3a52e12f7811
commit: a1732ee5f5a09679c7999659823cc53bda866b20 [71/79] block: Enable lock context analysis for all block drivers
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605191850.CMy8S3Ra-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191850.CMy8S3Ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605191850.CMy8S3Ra-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/floppy.c:164:
   In file included from include/linux/async.h:14:
   In file included from include/linux/device.h:34:
   In file included from arch/sparc/include/asm/device.h:8:
   In file included from arch/sparc/include/asm/openprom.h:15:
   In file included from include/linux/of.h:252:
   In file included from arch/sparc/include/asm/prom.h:18:
   In file included from include/linux/proc_fs.h:10:
>> include/linux/fs.h:2310:55: error: use of undeclared identifier 'sb'
    2310 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/floppy.c:166:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:166:
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
   In file included from drivers/block/floppy.c:166:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:166:
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
   In file included from drivers/block/floppy.c:166:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/sparc/include/uapi/asm/signal.h:113:8: note: array 'sig' declared here
     113 |        unsigned long sig[_NSIG_WORDS];
         |        ^
   In file included from drivers/block/floppy.c:166:
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
   In file included from drivers/block/floppy.c:181:
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
   In file included from drivers/block/floppy.c:250:
   In file included from include/linux/blk-mq.h:5:
>> include/linux/blkdev.h:1753:15: error: use of undeclared identifier 'bdev'
    1753 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1759:15: error: use of undeclared identifier 'bdev'
    1759 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1765:15: error: use of undeclared identifier 'bdev'
    1765 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1771:15: error: use of undeclared identifier 'bdev'
    1771 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   drivers/block/floppy.c:230:23: warning: variable 'virtual_dma_port' set but not used [-Wunused-but-set-global]
     230 | static unsigned short virtual_dma_port = 0x3f0;
         |                       ^
   17 warnings and 5 errors generated.
--
   In file included from drivers/block/brd.c:17:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
>> include/linux/fs.h:2310:55: error: use of undeclared identifier 'sb'
    2310 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/brd.c:17:
>> include/linux/blkdev.h:1753:15: error: use of undeclared identifier 'bdev'
    1753 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1759:15: error: use of undeclared identifier 'bdev'
    1759 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1765:15: error: use of undeclared identifier 'bdev'
    1765 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1771:15: error: use of undeclared identifier 'bdev'
    1771 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   5 errors generated.
--
   In file included from drivers/block/loop.c:8:
>> include/linux/fs.h:2310:55: error: use of undeclared identifier 'sb'
    2310 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
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
>> include/linux/blkdev.h:1753:15: error: use of undeclared identifier 'bdev'
    1753 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1759:15: error: use of undeclared identifier 'bdev'
    1759 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1765:15: error: use of undeclared identifier 'bdev'
    1765 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1771:15: error: use of undeclared identifier 'bdev'
    1771 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   12 warnings and 5 errors generated.
--
   In file included from drivers/block/nbd.c:18:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
>> include/linux/fs.h:2310:55: error: use of undeclared identifier 'sb'
    2310 |         void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
         |                                                              ^~
   In file included from drivers/block/nbd.c:18:
>> include/linux/blkdev.h:1753:15: error: use of undeclared identifier 'bdev'
    1753 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1759:15: error: use of undeclared identifier 'bdev'
    1759 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1765:15: error: use of undeclared identifier 'bdev'
    1765 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1771:15: error: use of undeclared identifier 'bdev'
    1771 |                 __releases(&bdev->bd_holder_lock);
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


vim +/sb +2310 include/linux/fs.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  2294  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2295  struct file_system_type {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2296  	const char *name;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2297  	int fs_flags;
bbc1096ad8e9875 David Howells     2012-10-15  2298  #define FS_REQUIRES_DEV		1 
bbc1096ad8e9875 David Howells     2012-10-15  2299  #define FS_BINARY_MOUNTDATA	2
bbc1096ad8e9875 David Howells     2012-10-15  2300  #define FS_HAS_SUBTYPE		4
0c55cfc4166d9a0 Eric W. Biederman 2012-07-26  2301  #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
0b3b094ac9a7bb1 Jan Kara          2019-05-15  2302  #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
a6435940b62f81a Christian Brauner 2021-01-21  2303  #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
4e40eff0b5737c0 Jeff Layton       2024-10-02  2304  #define FS_MGTIME		64	/* FS uses multigrain timestamps */
a64e5a596067bdd Luis Chamberlain  2025-03-06  2305  #define FS_LBS			128	/* FS supports LBS */
a3f8f8662771285 Christian Brauner 2025-11-05  2306  #define FS_POWER_FREEZE		256	/* Always freeze on suspend/hibernate */
bbc1096ad8e9875 David Howells     2012-10-15  2307  #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
f3a09c92018a91a Al Viro           2018-12-23  2308  	int (*init_fs_context)(struct fs_context *);
d7167b149943e38 Al Viro           2019-09-07  2309  	const struct fs_parameter_spec *parameters;
d75af071e79c4b9 Bart Van Assche   2026-01-21 @2310  	void (*kill_sb) (struct super_block *sb) __releases(&sb->s_umount);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2311  	struct module *owner;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2312  	struct file_system_type * next;
a5166169f9b920c Al Viro           2011-12-12  2313  	struct hlist_head fs_supers;
d475fd428ce77aa Peter Zijlstra    2007-10-15  2314  
cf51624999e56c8 Ingo Molnar       2006-07-03  2315  	struct lock_class_key s_lock_key;
897c6ff9568bcb1 Arjan van de Ven  2006-07-03  2316  	struct lock_class_key s_umount_key;
51ee049e771c14a Roland Dreier     2010-04-27  2317  	struct lock_class_key s_vfs_rename_key;
5accdf82ba25cac Jan Kara          2012-06-12  2318  	struct lock_class_key s_writers_key[SB_FREEZE_LEVELS];
d475fd428ce77aa Peter Zijlstra    2007-10-15  2319  
d475fd428ce77aa Peter Zijlstra    2007-10-15  2320  	struct lock_class_key i_lock_key;
d475fd428ce77aa Peter Zijlstra    2007-10-15  2321  	struct lock_class_key i_mutex_key;
730633f0b7f9517 Jan Kara          2021-01-28  2322  	struct lock_class_key invalidate_lock_key;
14358e6ddaed274 Peter Zijlstra    2007-10-14  2323  	struct lock_class_key i_mutex_dir_key;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2324  };
^1da177e4c3f415 Linus Torvalds    2005-04-16  2325  

:::::: The code at line 2310 was first introduced by commit
:::::: d75af071e79c4b9022d0bb41302128329b7ccd81 treewide: Add lock context annotations in all include files

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Bart Van Assche <bvanassche@acm.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
