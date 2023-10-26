Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E001262B1
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXHlAtGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698312202; x=1729848202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+YYF2EHOeBHNDGFhuz+cjINxNWw2KyM688UJQbWxj60=;
  b=ZXHlAtGFbwn4xDm/98f/M7ilcY+3nnN12OwK4lCkfVLbeJymRksFqEh2
   kOa9OQOzlSWuhLTBafDSCgrbKyldYw+nUnyfaPIwlimuZK6qC4hairOtd
   Vt/yDXi8mIVgZbMcl/ftbs5hH5/8nzOFo75VO2bKzUqfJLjxz5TWRdy+R
   9/FiUmv53s+Gaxwl+nvdjVcUz+RTkLYwQ+pDt++irbsk4VMZRvDUKNgUD
   iSeGa3bF6FBzH2tUjxrxVjPdw0BivlXCSdJpnWq2/I3Kr47WejNVENYjp
   q6sSHqBch1fE4uyzlb5p6xj6XNABDWntps0WBHepCitncMI6T4xlS90Os
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377863913"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377863913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 02:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752652405"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752652405"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 02:23:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvwa7-0009g3-2N;
	Thu, 26 Oct 2023 09:23:11 +0000
Date: Thu, 26 Oct 2023 17:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 21/22] include/linux/radix-tree.h:260:9: sparse:
 sparse: too many errors
Message-ID: <202310261724.zZmDpiSp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/radix-tree.h:260:9: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Nadav Amit <namit@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   0548eb067ed664b93043e033295ca71e3e706245
commit: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e [21/22] x86/percpu: Introduce const-qualified const_pcpu_hot to micro-optimize code generation
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-122-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261724.zZmDpiSp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261724.zZmDpiSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310261724.zZmDpiSp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/hardirq.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:103:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:103:9: sparse: sparse: got __seg_gs
   include/linux/topology.h:103:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:103:9: sparse: sparse: got __seg_gs
   include/linux/topology.h:103:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:103:9: sparse: sparse: got __seg_gs
   include/linux/topology.h:103:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:103:9: sparse: sparse: got __seg_gs
   net/ipv6/datagram.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/radix-tree.h:260:9: sparse: sparse: too many errors

vim +260 include/linux/radix-tree.h

^1da177e4c3f41 Linus Torvalds            2005-04-16  257  
^1da177e4c3f41 Linus Torvalds            2005-04-16  258  static inline void radix_tree_preload_end(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  259  {
cfa6705d89b656 Sebastian Andrzej Siewior 2020-05-27 @260  	local_unlock(&radix_tree_preloads.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  261  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  262  

:::::: The code at line 260 was first introduced by commit
:::::: cfa6705d89b6562f79c40c249f8d94073c4276e4 radix-tree: Use local_lock for protection

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
