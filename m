Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772053C943A
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829433; cv=none; b=ZgC4XfMH1gNJljpQiDft72ycC+zJl6RILb/99MR8n8YnSNJgOTc2Hum1hqx4aBR6SMPQmLBdBgq+cxHykPfRczmsmHjgZhlUC0e4Y6HeYb/ai7sMhYI/HF2p/V1h/FkFEiPGOLQIKxC/n/yavzgLkC+pHBRcPfyzMn0ImiWoA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829433; c=relaxed/simple;
	bh=yRTurqru9GCHwLSa590H7mhxX4ZVdZlpgdop8RvocFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RtplOKz6DOo16Hsx7n6GUDWMNinOiFB1MhyqLXOs6MwCpls2JG8O1SI4I2OL6M7E9vGhnKj79KU/0Q38tXpjARoroVthg3sc49TYbbXh7ApPfwIaRvH/eIkXTm1KekDgB63B5cRePowdp9QDj1jtFzh43WfhtFg48wSLRhHesLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJXz/kZt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJXz/kZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775829431; x=1807365431;
  h=date:from:to:cc:subject:message-id;
  bh=yRTurqru9GCHwLSa590H7mhxX4ZVdZlpgdop8RvocFs=;
  b=lJXz/kZtl+BZya7DIhYEK8rzFq1p1JYlK0Nt7G5uzi+ahv5lXt67q5Kc
   ffCoAK5jgo2Gylr5QasfLeZmeRpBjQjJeqppYcr5eC7IzmbsXFpwdC2RN
   W/yC6/IORitWEnq2612kEA17Al1R9Rj7pbw7q5VFXdT7YWRvpeuvvtDnH
   K3pBvNkAL57lMKox/AWLATu1sPeEH2foiKnjsir13qc8m8jNIAK+PqdVt
   gDM4wR2C8XYs+/eoidbYB0mD+hLHcWPGgRvz/+pwW4ksde0+ZWsGNNsDA
   cH97J7ANezS5rCR51HMpBNOiZXCYtD6zDnt+yjBapYDJFr1lUoVDS9H6n
   Q==;
X-CSE-ConnectionGUID: rQFaFIEBSmmk7px100sghQ==
X-CSE-MsgGUID: TfnAt2WoSUSRpzx+JEgRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94426782"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="94426782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:57:11 -0700
X-CSE-ConnectionGUID: 0E3oJC8FSTSLrVGZR3TE9g==
X-CSE-MsgGUID: CQVcwOMvTiy8kxVm6/JHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226371931"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 06:57:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBCM8-00000000Au9-084F;
	Fri, 10 Apr 2026 13:57:08 +0000
Date: Fri, 10 Apr 2026 15:56:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:cleanups 18/38]
 ../../../lib/rbtree_test.c:246:9: error: unknown type name 'ktime_t'; did you
 mean 'time_t'?
Message-ID: <202604101523.TsaqAHVI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4334f669c43ca5506bf51471e81f18deb659410f
commit: 54c7fdc5e9c41063e1c76e8b23d52653e9d5beba [18/38] lib/tests: Replace get_cycles() with ktime_get()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260410/202604101523.TsaqAHVI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101523.TsaqAHVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604101523.TsaqAHVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rbtree_test.c:11:
   ../../../lib/rbtree_test.c: In function 'basic_check':
>> ../../../lib/rbtree_test.c:246:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
     246 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
>> ../../../lib/rbtree_test.c:253:17: error: implicit declaration of function 'ktime_get' [-Wimplicit-function-declaration]
     253 |         time1 = ktime_get();
         |                 ^~~~~~~~~
   ../../../lib/rbtree_test.c: In function 'augmented_check':
   ../../../lib/rbtree_test.c:348:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
     348 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
   ../../../lib/rbtree_test.c: In function 'rbtree_test_init':
   ../../../lib/rbtree_test.c:402:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     402 |         nodes = kmalloc_objs(*nodes, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/rbtree_test.c:402:15: error: assignment to 'struct test_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     402 |         nodes = kmalloc_objs(*nodes, nnodes);
         |               ^
--
   In file included from interval_tree_test.c:11:
   ../../../lib/interval_tree_test.c: In function 'basic_check':
>> ../../../lib/interval_tree_test.c:68:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
      68 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
>> ../../../lib/interval_tree_test.c:74:17: error: implicit declaration of function 'ktime_get' [-Wimplicit-function-declaration]
      74 |         time1 = ktime_get();
         |                 ^~~~~~~~~
   ../../../lib/interval_tree_test.c: In function 'search_check':
   ../../../lib/interval_tree_test.c:96:9: error: unknown type name 'ktime_t'; did you mean 'time_t'?
      96 |         ktime_t time1, time2, time;
         |         ^~~~~~~
         |         time_t
   ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
   ../../../lib/interval_tree_test.c:314:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     314 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/interval_tree_test.c:314:30: error: expected expression before 'struct'
     314 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                              ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
