Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2618786D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345172; cv=none; b=ql4zptfr4gNpvdjiP6fFe1mp3pOcTtcibLmh24HIgqFE5p+jMZzi3PwBRVankl1xVRmU+ZjL1otVkyTZ3aY7Tmj0VnVLdBtf9Knvs36gRtqEyyhnNU7te2lFtYQO4Av/KOYVFHCMmceZtD9pu+6rmMOoVw3IAzwQoYThE/FsWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345172; c=relaxed/simple;
	bh=Jubw/O97R/ls6cCWSZU0E3ebOEEkmNtdVdKO95UkGvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9GWNlsRmKIBT2TVPrFk3SNrIcJUZPSUeoKAALgRcJfQ4chOHXGCoH9sNSZDW5VSuijmvCPfgA+hP+pvIp7XiUKLU5NwgljHRsUL2Z2fU3sAEJ4X/9Oqnvz/C7kd0cHTd2BLONU5xXl6hoOzf91Q0ZG9x6cRYe6s86Tl6v3z9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZUjXWlz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZUjXWlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727345170; x=1758881170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jubw/O97R/ls6cCWSZU0E3ebOEEkmNtdVdKO95UkGvs=;
  b=DZUjXWlzSziLAfUr7xqP92jxSFEW+0DY3FxT8NRJLg+dIvzpYIO+uFOw
   D+tkOMEFRd918edydrfp5HvKGFql0dJ8hTk5rSaw/jtt0YzOF1mxewCh6
   1BI3qPwGQWzLqlGNsdkrZu8/cE+lksoelILp5lMbglS6ZTo7YNplENC5Y
   /PYJvOAtEhqtY4AId2m+ahYkTjnE3NW6wYjp5tbaIdmHZnNhltr6uAKzb
   l0gerjU3Czr2Bo26oo2PIMFJK37yw9czVpbF1m+9rAp3U+eu7hvHllEMd
   +se5R79pJH0kNop1yh9lRj9yeC0cZEGIlZXHe0lZTm8MUTEUD5HH61ryU
   g==;
X-CSE-ConnectionGUID: iU9yseiCSBWfkB6+vx+1nA==
X-CSE-MsgGUID: DseTFDAHQUe102HNpp1BKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26294201"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="26294201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:06:07 -0700
X-CSE-ConnectionGUID: twfyIkyXQFeWOPOXdyM+ag==
X-CSE-MsgGUID: 6QDLbc5gQn2YxPMMyJczxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="109566751"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2024 03:06:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stlNs-000KXd-0d;
	Thu, 26 Sep 2024 10:06:04 +0000
Date: Thu, 26 Sep 2024 18:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 144/30000] mm/swap.c:55:30: warning:
 'rotate_lock' defined but not used
Message-ID: <202409261717.deAk8RzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 7fc2755b27b504eec4c86d9dec7285466cdbe214 [144/30000] mm/swap: Convert to percpu locked
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261717.deAk8RzY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261717.deAk8RzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261717.deAk8RzY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swap.h:15,
                    from mm/swap.c:19:
>> mm/swap.c:55:30: warning: 'rotate_lock' defined but not used [-Wunused-const-variable=]
      55 | static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
         |                              ^~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/rotate_lock +55 mm/swap.c

^1da177e4c3f41 Linus Torvalds   2005-04-16 @19  #include <linux/swap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  20  #include <linux/mman.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  21  #include <linux/pagemap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  22  #include <linux/pagevec.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  23  #include <linux/init.h>
b95f1b31b75588 Paul Gortmaker   2011-10-16  24  #include <linux/export.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  25  #include <linux/mm_inline.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  26  #include <linux/percpu_counter.h>
3565fce3a6597e Dan Williams     2016-01-15  27  #include <linux/memremap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  28  #include <linux/percpu.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  29  #include <linux/cpu.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  30  #include <linux/notifier.h>
e0bf68ddec4f4f Peter Zijlstra   2007-10-16  31  #include <linux/backing-dev.h>
e7638488434415 Dan Williams     2018-05-16  32  #include <linux/memremap.h>
66e1707bc34609 Balbir Singh     2008-02-07  33  #include <linux/memcontrol.h>
5a0e3ad6af8660 Tejun Heo        2010-03-24  34  #include <linux/gfp.h>
a27bb332c04cec Kent Overstreet  2013-05-07  35  #include <linux/uio.h>
7fc2755b27b504 Ingo Molnar      2009-07-03  36  #include <linux/locallock.h>
822fc61367f062 Naoya Horiguchi  2015-04-15  37  #include <linux/hugetlb.h>
33c3fc71c8cfa3 Vladimir Davydov 2015-09-09  38  #include <linux/page_idle.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  39  
64d6519dda3905 Lee Schermerhorn 2008-10-18  40  #include "internal.h"
64d6519dda3905 Lee Schermerhorn 2008-10-18  41  
c6286c983900c7 Mel Gorman       2013-07-03  42  #define CREATE_TRACE_POINTS
c6286c983900c7 Mel Gorman       2013-07-03  43  #include <trace/events/pagemap.h>
c6286c983900c7 Mel Gorman       2013-07-03  44  
^1da177e4c3f41 Linus Torvalds   2005-04-16  45  /* How many pages do we try to swap or page in/out together? */
^1da177e4c3f41 Linus Torvalds   2005-04-16  46  int page_cluster;
^1da177e4c3f41 Linus Torvalds   2005-04-16  47  
13f7f78981e49f Mel Gorman       2013-07-03  48  static DEFINE_PER_CPU(struct pagevec, lru_add_pvec);
f84f9504bddeec Vegard Nossum    2008-07-23  49  static DEFINE_PER_CPU(struct pagevec, lru_rotate_pvecs);
cc5993bd7b8cff Minchan Kim      2015-04-15  50  static DEFINE_PER_CPU(struct pagevec, lru_deactivate_file_pvecs);
f7ad2a6cb9f7c4 Shaohua Li       2017-05-03  51  static DEFINE_PER_CPU(struct pagevec, lru_lazyfree_pvecs);
a4a921aa5c7a1a Ming Li          2016-05-20  52  #ifdef CONFIG_SMP
a4a921aa5c7a1a Ming Li          2016-05-20  53  static DEFINE_PER_CPU(struct pagevec, activate_page_pvecs);
a4a921aa5c7a1a Ming Li          2016-05-20  54  #endif
7fc2755b27b504 Ingo Molnar      2009-07-03 @55  static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
7fc2755b27b504 Ingo Molnar      2009-07-03  56  DEFINE_LOCAL_IRQ_LOCK(swapvec_lock);
902aaed0d983df Hisashi Hifumi   2007-10-16  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
