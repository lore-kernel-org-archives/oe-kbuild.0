Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4912262E
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684016959; x=1715552959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mPgEEiigfqQH8rsxnLY42ffcXIFKVDxpfGZE5XPQws=;
  b=Pke4rGvNLeSgqlgTOkk4hgPCKQDmJIu5C0+dWycAL0Ts+E8Yhbn8yjPf
   Q7pyy3B3sZZclg14xy56xLvmc6cuv8oid6Dfq/x4wV2Sq7+csX4ei1iiV
   yIPKHftWai+x3eKpy/ZHdr9APm7mZX9TD+M1R0G0lj+d4ITakrKpEYhGM
   VgryuQfpb4Rly33VFeCiZVroyI4ffm5frNg68Jlu6+yx1POw+yeGzWKJs
   XaimDD5VgB6Xesxd08N80WfamacpC0SZkmGJSKDW0NNUTJYEric2Ycu33
   db8hBySGtzdJpIa1xezeaf1bSUcCIpyRyGubjC7dhvMCJQFQjot5soNDC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="414377071"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="414377071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="678035207"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="678035207"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2023 15:29:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxxjo-0005hm-30;
	Sat, 13 May 2023 22:29:16 +0000
Date: Sun, 14 May 2023 06:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/powerpc/lib/qspinlock.c:815:0-23: WARNING: fops_head_spins
 should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <202305140644.nX4gFJ5M-lkp@intel.com>
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
TO: Nicholas Piggin <npiggin@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4d58949a6eac1c45ab022562c8494725e1ac094
commit: 13959373e9c9021cc80730c7bd1242e07b10b328 powerpc/qspinlock: Fix 32-bit build
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: powerpc-randconfig-c034-20230514 (https://download.01.org/0day-ci/archive/20230514/202305140644.nX4gFJ5M-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305140644.nX4gFJ5M-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/lib/qspinlock.c:815:0-23: WARNING: fops_head_spins should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:975:0-23: WARNING: fops_pv_prod_head should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:879:0-23: WARNING: fops_pv_sleepy_lock should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:927:0-23: WARNING: fops_pv_sleepy_lock_factor should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:911:0-23: WARNING: fops_pv_sleepy_lock_interval_ns should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:895:0-23: WARNING: fops_pv_sleepy_lock_sticky should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:863:0-23: WARNING: fops_pv_spin_on_preempted_owner should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:847:0-23: WARNING: fops_pv_yield_allow_steal should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:831:0-23: WARNING: fops_pv_yield_owner should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:943:0-23: WARNING: fops_pv_yield_prev should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:959:0-23: WARNING: fops_pv_yield_propagate_owner should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:799:0-23: WARNING: fops_remote_steal_spins should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>> arch/powerpc/lib/qspinlock.c:783:0-23: WARNING: fops_steal_spins should be defined with DEFINE_DEBUGFS_ATTRIBUTE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
