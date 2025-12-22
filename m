Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66417326937
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383638; cv=none; b=eBViAPnwB5pCFaQKZuTv5E0OoBxe8L18RS/qGIEYFdXTg94WOSIfm7S0pEAjwoEobzqEwVWW7t2nOEqNjv5higwjWs4o+Bqbc63vkzo0wyCJcAALISR8lnA867Xnfk8AUciWagUtLM/vOSJuUgQFPfwoW0Qsmh1ebgHnskDO/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383638; c=relaxed/simple;
	bh=dqDwJ0Wk2BpbOeDQi7x7DALi1m3Vq3/TH5+AZeeLw/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrH+ZVsiJE/BXz7dgXIceWxKQEQMzq+f7Bsrj3hDKmGqrM6y/LkQ0qqVyzRfPgwjvffAYrosx0U0JnB5rouD8ff1bGHyRYT7bFmichci4dGmSahfsTJFDIv1ib48prSE01kkqjuMx0y5Px6FOWp4/gduUxSltb8BifqtYPAYYtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOBZQ9mh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOBZQ9mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766383636; x=1797919636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqDwJ0Wk2BpbOeDQi7x7DALi1m3Vq3/TH5+AZeeLw/s=;
  b=HOBZQ9mhEwyw3+MtbM+o6hpvRmPM1nXw6YOtcqD29dOLFWDCAqlsk4Sh
   IfU3mtjYtgcayfeKch7C5NmZW42NAFwUz6N77J8AuxN8EY7sBvIZH+tHM
   9VYXjoRg2nX4aAqHiiWuVfH2BdeogSZnpnr2kfV1arCbWnVwEyeyOHZCd
   3ZcCVHs4lpoKGPlAAkOGAM+YiD2it1CVgKcNkfaaypI7wZob0WEPqYdZ/
   TnDh+RhEiNAYWq17pQo8vBafIBaWWm4aOblMWDL9Z3Vu7e5RAToX3dhth
   kxCeMZHyJpl8kDS4fhtru9ujcOK4XHMsPHjrOBDS3tZo4vn/Kc0p8Qim1
   w==;
X-CSE-ConnectionGUID: nTp5PC8WTvSPjr6K7ie8tA==
X-CSE-MsgGUID: ZpJZYLF9Teeh9fQ0jZUGyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67432579"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67432579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:07:15 -0800
X-CSE-ConnectionGUID: m8U45X8oQ1+LzsU2j9uCdg==
X-CSE-MsgGUID: 4Rac5L1gTxumkCGh7zB80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199413161"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 22:07:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZ4a-000000005Na-1QRS;
	Mon, 22 Dec 2025 06:07:12 +0000
Date: Mon, 22 Dec 2025 07:06:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1525/2671] fs/fuse/file.c:1326:9: error: call to
 '__compiletime_assert_654' declared with 'error' attribute: min(((pos + len
 - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <202512220711.8zRoTraA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Laight <david.laight.linux@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1525/2671] fs: use min() or umin() instead of min_t()
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220711.8zRoTraA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220711.8zRoTraA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220711.8zRoTraA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_654' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
    1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
         |                ^
   ./include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   ./include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   ./include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   ././include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   ././include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:105:1: note: expanded from here
     105 | __compiletime_assert_654
         | ^
>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_654' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
   ./include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   ./include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   ./include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   ././include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   ././include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:105:1: note: expanded from here
     105 | __compiletime_assert_654
         | ^
   2 errors generated.
--
   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:118:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:119:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
>> progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:117:39: note: passing argument to parameter 'wq' here
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:123:27: note: expanded from macro 'bpf_wq_set_callback'
     123 |         bpf_wq_set_callback_impl(timer, cb, flags, NULL)
         |                                  ^~~~~
   progs/hid_bpf_helpers.h:119:52: note: passing argument to parameter 'wq' here
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:118:40: note: passing argument to parameter 'wq' here
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
>> progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   8 errors generated.


vim +1326 fs/fuse/file.c

ea9b9907b82a09 Nicholas Piggin       2008-04-30  1322  
5da784cce4308a Constantine Shulyupin 2018-09-06  1323  static inline unsigned int fuse_wr_pages(loff_t pos, size_t len,
5da784cce4308a Constantine Shulyupin 2018-09-06  1324  				     unsigned int max_pages)
d07f09f509fb21 Maxim Patlasov        2012-10-26  1325  {
0f5bb0cfb0b40a David Laight          2025-11-19 @1326  	return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
5da784cce4308a Constantine Shulyupin 2018-09-06  1327  		   max_pages);
d07f09f509fb21 Maxim Patlasov        2012-10-26  1328  }
d07f09f509fb21 Maxim Patlasov        2012-10-26  1329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
