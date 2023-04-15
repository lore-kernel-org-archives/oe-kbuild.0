Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32563CB
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Apr 2023 18:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681582973; x=1713118973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Esqgf1mAaVLYTpvsyWxbmPo5obqxrMr0k+ezeP3gUyI=;
  b=Tc1IpJF+OhjjB90+zXM+voeEyqaU8rJl8tmN/YqVN8pU8rpwcT+9AD5C
   FzNdYeMZbrHn0u2Z3sSb4cnbibQ5NIaufRyyWe/XI804revMIpPGJiXQH
   xAHQPSQfqTpCQGDAKWe9T0ORkfhYInMTQqzjQSeWPLQn/ZEFjEoPjpGPX
   wRJ4Mt/ET5EID2LLsTt6AG2iww4qLEVJYNe08Gh0+vgF5ZuiUuD3eO3sm
   XrpU8WAhSaxvWwAloTvyuLJz+cjc/QBaQYNtLGk9sdkwZYq5pRyz0GXxn
   3vO9hF38KQcX3zQfA7/pVHNgMT70tidDmiO6dFaEBWmVY1gQuz+JapLfX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="343426550"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="343426550"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 11:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="833953593"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="833953593"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2023 11:22:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnkXy-000bGi-2B;
	Sat, 15 Apr 2023 18:22:50 +0000
Date: Sun, 16 Apr 2023 02:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/parisc/kernel/smp.c:330 smp_callin() warn: ignoring unreachable
 code.
Message-ID: <202304160232.yzjWaZDd-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
commit: d4e5268a08b211b536fed29beb24271ecd85187e x86,objtool: Mark cpu_startup_entry() __noreturn
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
config: parisc-randconfig-m031-20230415 (https://download.01.org/0day-ci/archive/20230416/202304160232.yzjWaZDd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304160232.yzjWaZDd-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/smp.c:330 smp_callin() warn: ignoring unreachable code.

vim +330 arch/parisc/kernel/smp.c

0ed1fe4ad394e5 Helge Deller    2018-01-12  319  
^1da177e4c3f41 Linus Torvalds  2005-04-16  320  	smp_cpu_init(slave_id);
^1da177e4c3f41 Linus Torvalds  2005-04-16  321  
^1da177e4c3f41 Linus Torvalds  2005-04-16  322  	flush_cache_all_local(); /* start with known state */
1b2425e3c79984 Matthew Wilcox  2006-01-10  323  	flush_tlb_all_local(NULL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  324  
^1da177e4c3f41 Linus Torvalds  2005-04-16  325  	local_irq_enable();  /* Interrupts have been off until now */
^1da177e4c3f41 Linus Torvalds  2005-04-16  326  
fc6d73d67436e7 Thomas Gleixner 2016-02-26  327  	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
^1da177e4c3f41 Linus Torvalds  2005-04-16  328  
^1da177e4c3f41 Linus Torvalds  2005-04-16  329  	/* NOTREACHED */
^1da177e4c3f41 Linus Torvalds  2005-04-16 @330  	panic("smp_callin() AAAAaaaaahhhh....\n");
^1da177e4c3f41 Linus Torvalds  2005-04-16  331  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  332  

:::::: The code at line 330 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
