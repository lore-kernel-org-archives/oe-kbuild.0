Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C9156F9
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1F34H1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697526231; x=1729062231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPd81m+2AmqvQVLVvxPp4rp/fEZOvKvncZ2CzfT3RIo=;
  b=G1F34H1EqR4VR4XMV1Gm6ddoMYyijCzDl9HiHgKaQMdpbLy3+C0ozRnX
   dqZnJlkksHwpn/Pep8D40sxHbi/fV4Ihiom8+8qZk1GkP0Sq5mQ3Ru6JZ
   pOqA4petiAa9SgWdFyZFj/QjPJpmuMzu/9IMmCD11uqoDXYjIABRLY2/K
   u03u1CmvEZhGcWetKKJl9shusKJmQTJ0wjB5/ZCBq40kPcF6EgAkDcBtp
   j75W4ms+1ph6hmCkPkSHGb+SXm0nU51HKADboaefFiEbowv6hwxtGRXU1
   S6B+Y0Tozs9j0S8b4CZCyOnOWJZuEC0wIMEzsSTg5S43AOu3j8dIKJCp+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389585489"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="389585489"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 00:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879707349"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="879707349"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Oct 2023 00:03:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qse6m-0009CP-2G;
	Tue, 17 Oct 2023 07:03:29 +0000
Date: Tue, 17 Oct 2023 15:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:master 22/24] arch/x86/include/asm/preempt.h:27:16: sparse:
 sparse: too many errors
Message-ID: <202310171412.KHeSzz3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/include/asm/preempt.h:27:16: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   0c09c1d70838475762255844b72fa0e7fd6ace7c
commit: af03acef263b1e44862ba59233b3c206e38f1bbe [22/24] Merge branch into tip/master: 'x86/percpu'
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-121-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171412.KHeSzz3D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171412.KHeSzz3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310171412.KHeSzz3D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/xen/suspend_hvm.c: note: in included file (through arch/x86/include/asm/xen/hypervisor.h, include/xen/xen.h):
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:519:9: sparse: sparse: got __seg_gs
   arch/x86/xen/suspend_hvm.c: note: in included file (through include/xen/xen.h):
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:79:39: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:82:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:88:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:93:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:95:13: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:96:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/xen/hypervisor.h:98:17: sparse: sparse: got __seg_gs
   arch/x86/xen/suspend_hvm.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, arch/x86/include/asm/xen/hypercall.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: Expected ) at end of cast operator
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: too many errors

vim +27 arch/x86/include/asm/preempt.h

ba1f14fbe70965 Peter Zijlstra  2013-11-28  20  
c2daa3bed53a81 Peter Zijlstra  2013-08-14  21  /*
c2daa3bed53a81 Peter Zijlstra  2013-08-14  22   * We mask the PREEMPT_NEED_RESCHED bit so as not to confuse all current users
c2daa3bed53a81 Peter Zijlstra  2013-08-14  23   * that think a non-zero value indicates we cannot preempt.
c2daa3bed53a81 Peter Zijlstra  2013-08-14  24   */
c2daa3bed53a81 Peter Zijlstra  2013-08-14  25  static __always_inline int preempt_count(void)
c2daa3bed53a81 Peter Zijlstra  2013-08-14  26  {
64701838bf0575 Thomas Gleixner 2022-09-15 @27  	return raw_cpu_read_4(pcpu_hot.preempt_count) & ~PREEMPT_NEED_RESCHED;
c2daa3bed53a81 Peter Zijlstra  2013-08-14  28  }
c2daa3bed53a81 Peter Zijlstra  2013-08-14  29  

:::::: The code at line 27 was first introduced by commit
:::::: 64701838bf0575ef8acb1ad2db5934e864f3e6c3 x86/percpu: Move preempt_count next to current_task

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
