Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21030210A
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eChVd/ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699076493; x=1730612493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLcpz5M420nNp23nfcVfkxnpBHHhSJ+7tySHApGUetc=;
  b=eChVd/ulIEmS45y81a4S+i3u0jsGOVfJ+3aL/VKBEWt9mNIk0M6rO85W
   uBi9UXhxNjCvTmVYP8IrEQBCt5hJqOIjarpXWc8xyyA42R3EWGT7HOyr7
   bZuTQ9qyWlYIfcuxwv2EiZW+0UKroQttOu2cbv1f+UUVzPqeHfOa20EH5
   fPv+EbrlUJ5SmwM7Qxq3jDafc83me3Pdp++zClU2j5VqjkvJE/Xi1FR8K
   OgPunz5FcmeSgrnTGkKQw29DPsyUUDC4AHXzFMCNQnZn0bLlL5TOkVYaj
   C8ToGPcwT9C028jh5REpQ60taxUrMQyp05XOFq2UNt/3UYWYmW4HWL9Ua
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391933611"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="391933611"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885407469"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885407469"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 22:41:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz9PU-0003Vc-2o;
	Sat, 04 Nov 2023 05:41:28 +0000
Date: Sat, 4 Nov 2023 13:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 21/22] arch/x86/include/asm/current.h:46:38: sparse:
 sparse: too many errors
Message-ID: <202311041354.1B6d70ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/include/asm/current.h:46:38: sparse: sparse: too many errors"
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
:::::: branch date: 11 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231104/202311041354.1B6d70ch-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041354.1B6d70ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311041354.1B6d70ch-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/waitwake.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/futex/waitwake.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   kernel/futex/waitwake.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/task.h):
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
   kernel/futex/waitwake.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:397:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:404:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:406:9: sparse: sparse: got __seg_gs
   kernel/futex/waitwake.c: note: in included file (through include/linux/sched.h, include/linux/sched/task.h):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: undefined identifier 'const_pcpu_hot'
   arch/x86/include/asm/current.h:46:38: sparse: sparse: expected structure or union
   arch/x86/include/asm/current.h:46:38: sparse: sparse: expected structure or union
>> arch/x86/include/asm/current.h:46:38: sparse: sparse: too many errors

vim +46 arch/x86/include/asm/current.h

f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  38  
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  39  /* const-qualified alias to pcpu_hot, aliased by linker. */
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  40  DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  41  			const_pcpu_hot);
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  42  
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  43  static __always_inline struct task_struct *get_current(void)
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  44  {
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  45  	if (IS_ENABLED(CONFIG_USE_X86_SEG_SUPPORT))
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20 @46  		return const_pcpu_hot.current_task;
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  47  
e57ef2ed97c1d0 arch/x86/include/asm/current.h Thomas Gleixner   2022-09-15  48  	return this_cpu_read_stable(pcpu_hot.current_task);
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  49  }
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
