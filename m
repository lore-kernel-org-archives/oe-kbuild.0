Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FB405C0
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbR0UnTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699970117; x=1731506117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZsPLqLfVvO+Mi0HMPd6e1aUbzOB/80TXs6ihvQaNvTU=;
  b=VbR0UnTFM0ugoY4RQv9EfEe40rpQg/JzOVxTsIoHyp5Y2zLkPxHkAm8c
   Y0XWwW0D9JrSfRk8XXE3QXCED2v00e9+oVMmi9b+rsdTeZk/036odxOri
   65JEAE5Qz4Ga++IEU5sr/75sDP3a0asOolWccO/WNja+gsCIASzjsHoBF
   UGd9Ta4EVR87ytfxZRSdoal+8SMX2BSQNkEkMT7P9P/vYq6/zqv+BcGld
   L6yqJTxrd+lR1H63LFzylkCnR9osXlOyEKvw5FoRmTcHriiYeXaqTr1vK
   0A7Fw8HJsa7Zt+/K8EzThNQN8WW25c6NFpptjBt7z8o1DqZ5hZJYrt+LX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="387819663"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="387819663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855282728"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855282728"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 05:55:15 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2tsn-0000Hr-1n;
	Tue, 14 Nov 2023 13:55:13 +0000
Date: Tue, 14 Nov 2023 21:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/list.h:83:21: sparse: sparse: self-comparison always
 evaluates to true
Message-ID: <202311142104.yI5FYjWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc aa9f10d57056cea51d41283d3785bccbbb9f459e and parent aebc7b0d8d91bbc69e976909963046bc48bca4fd have different kconfig"
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: aa9f10d57056cea51d41283d3785bccbbb9f459e hardening: Move BUG_ON_DATA_CORRUPTION to hardening options
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-061-20231114 (https://download.01.org/0day-ci/archive/20231114/202311142104.yI5FYjWk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311142104.yI5FYjWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311142104.yI5FYjWk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/plist.c: note: in included file (through include/linux/plist.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/klist.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/klist.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/bug.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/bug.c: note: in included file:
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/kobject.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/kobject.c: note: in included file (through include/linux/kobject.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/logic_pio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/logic_pio.c: note: in included file (through include/linux/kobject.h, include/linux/of.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/kobject_uevent.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/kobject_uevent.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/rhashtable.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/rhashtable.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/genalloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/genalloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/percpu_counter.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/percpu_counter.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/percpu_counter.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/error-inject.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/error-inject.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/irq_poll.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/irq_poll.c: note: in included file (through include/linux/module.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/dynamic_debug.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/dynamic_debug.c: note: in included file (through include/linux/module.h):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/kunit/resource.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/kunit/resource.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   lib/kunit/string-stream.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/kunit/string-stream.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +83 include/linux/list.h

aebc7b0d8d91bb Marco Elver 2023-08-11  48  
b16c42c8fde808 Marco Elver 2023-08-11  49  /*
b16c42c8fde808 Marco Elver 2023-08-11  50   * Performs the full set of list corruption checks before __list_add().
b16c42c8fde808 Marco Elver 2023-08-11  51   * On list corruption reports a warning, and returns false.
b16c42c8fde808 Marco Elver 2023-08-11  52   */
aebc7b0d8d91bb Marco Elver 2023-08-11  53  extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
d7c816733d501b Kees Cook   2016-08-17  54  							     struct list_head *prev,
d7c816733d501b Kees Cook   2016-08-17  55  							     struct list_head *next);
b16c42c8fde808 Marco Elver 2023-08-11  56  
b16c42c8fde808 Marco Elver 2023-08-11  57  /*
b16c42c8fde808 Marco Elver 2023-08-11  58   * Performs list corruption checks before __list_add(). Returns false if a
b16c42c8fde808 Marco Elver 2023-08-11  59   * corruption is detected, true otherwise.
aebc7b0d8d91bb Marco Elver 2023-08-11  60   *
aebc7b0d8d91bb Marco Elver 2023-08-11  61   * With CONFIG_LIST_HARDENED only, performs minimal list integrity checking
aebc7b0d8d91bb Marco Elver 2023-08-11  62   * inline to catch non-faulting corruptions, and only if a corruption is
aebc7b0d8d91bb Marco Elver 2023-08-11  63   * detected calls the reporting function __list_add_valid_or_report().
b16c42c8fde808 Marco Elver 2023-08-11  64   */
b16c42c8fde808 Marco Elver 2023-08-11  65  static __always_inline bool __list_add_valid(struct list_head *new,
b16c42c8fde808 Marco Elver 2023-08-11  66  					     struct list_head *prev,
b16c42c8fde808 Marco Elver 2023-08-11  67  					     struct list_head *next)
b16c42c8fde808 Marco Elver 2023-08-11  68  {
aebc7b0d8d91bb Marco Elver 2023-08-11  69  	bool ret = true;
aebc7b0d8d91bb Marco Elver 2023-08-11  70  
aebc7b0d8d91bb Marco Elver 2023-08-11  71  	if (!IS_ENABLED(CONFIG_DEBUG_LIST)) {
aebc7b0d8d91bb Marco Elver 2023-08-11  72  		/*
aebc7b0d8d91bb Marco Elver 2023-08-11  73  		 * With the hardening version, elide checking if next and prev
aebc7b0d8d91bb Marco Elver 2023-08-11  74  		 * are NULL, since the immediate dereference of them below would
aebc7b0d8d91bb Marco Elver 2023-08-11  75  		 * result in a fault if NULL.
aebc7b0d8d91bb Marco Elver 2023-08-11  76  		 *
aebc7b0d8d91bb Marco Elver 2023-08-11  77  		 * With the reduced set of checks, we can afford to inline the
aebc7b0d8d91bb Marco Elver 2023-08-11  78  		 * checks, which also gives the compiler a chance to elide some
aebc7b0d8d91bb Marco Elver 2023-08-11  79  		 * of them completely if they can be proven at compile-time. If
aebc7b0d8d91bb Marco Elver 2023-08-11  80  		 * one of the pre-conditions does not hold, the slow-path will
aebc7b0d8d91bb Marco Elver 2023-08-11  81  		 * show a report which pre-condition failed.
aebc7b0d8d91bb Marco Elver 2023-08-11  82  		 */
aebc7b0d8d91bb Marco Elver 2023-08-11 @83  		if (likely(next->prev == prev && prev->next == next && new != prev && new != next))
aebc7b0d8d91bb Marco Elver 2023-08-11  84  			return true;
aebc7b0d8d91bb Marco Elver 2023-08-11  85  		ret = false;
aebc7b0d8d91bb Marco Elver 2023-08-11  86  	}
aebc7b0d8d91bb Marco Elver 2023-08-11  87  
aebc7b0d8d91bb Marco Elver 2023-08-11  88  	ret &= __list_add_valid_or_report(new, prev, next);
aebc7b0d8d91bb Marco Elver 2023-08-11  89  	return ret;
b16c42c8fde808 Marco Elver 2023-08-11  90  }
b16c42c8fde808 Marco Elver 2023-08-11  91  

:::::: The code at line 83 was first introduced by commit
:::::: aebc7b0d8d91bbc69e976909963046bc48bca4fd list: Introduce CONFIG_LIST_HARDENED

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
