Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31471C280
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lmin0LxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698938101; x=1730474101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OFIFr+k315YwlR4jk6svogHxNo3abFYtdyIBCvdbQBQ=;
  b=Lmin0LxTKapFkCbCkjFHTvmmFMvs8OIWixebBqfrzkf452pu0M10mxVQ
   RyuGyi/1aif6hUNVK0Bmqa0LnLMKuolqNKl96oy8Id0w1FMYwgljOAurv
   mPYWGNwNbI+BL20eWzZkB6F+JxYKtQ0DgglMTD8HLL9HoQEfv7awWcUY2
   hnQ1ZVs2qKjwxI94y0RGL6mQNoabiHwnunon0+KWQkNtThoK0JFaIyROU
   H9LT685RVcPRRSmxrUJtiO/E7bDs6BvVs64dmEgw0W5lPlJhKgum2vU70
   psJUQBcjpyic4A2Fkufw+25GGa3vMKY76wQe51FDaWBw4fnyp18W3Tdi/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="474976635"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="474976635"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 08:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="851943499"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="851943499"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2023 08:14:58 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyZPM-0001YS-0B;
	Thu, 02 Nov 2023 15:14:56 +0000
Date: Thu, 2 Nov 2023 23:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/22] lib/flex_proportions.c:73:9: sparse: sparse:
 too many errors
Message-ID: <202311022311.SuSSgpd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/flex_proportions.c:73:9: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   0548eb067ed664b93043e033295ca71e3e706245
commit: 9a462b9eafa6dda16ea8429b151edb1fb535d744 [11/22] x86/percpu: Use compiler segment prefix qualifier
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-062-20231101 (https://download.01.org/0day-ci/archive/20231102/202311022311.SuSSgpd1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311022311.SuSSgpd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311022311.SuSSgpd1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/flex_proportions.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/percpu_counter.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: got __seg_fs
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: got __seg_fs
   lib/flex_proportions.c: note: in included file (through include/linux/flex_proportions.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_fs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
>> lib/flex_proportions.c:73:9: sparse: sparse: too many errors

vim +73 lib/flex_proportions.c

f3109a51f8dc88 Jan Kara                  2012-05-24  55  
f3109a51f8dc88 Jan Kara                  2012-05-24  56  /*
f3109a51f8dc88 Jan Kara                  2012-05-24  57   * Declare @periods new periods. It is upto the caller to make sure period
f3109a51f8dc88 Jan Kara                  2012-05-24  58   * transitions cannot happen in parallel.
f3109a51f8dc88 Jan Kara                  2012-05-24  59   *
f3109a51f8dc88 Jan Kara                  2012-05-24  60   * The function returns true if the proportions are still defined and false
f3109a51f8dc88 Jan Kara                  2012-05-24  61   * if aging zeroed out all events. This can be used to detect whether declaring
f3109a51f8dc88 Jan Kara                  2012-05-24  62   * further periods has any effect.
f3109a51f8dc88 Jan Kara                  2012-05-24  63   */
f3109a51f8dc88 Jan Kara                  2012-05-24  64  bool fprop_new_period(struct fprop_global *p, int periods)
f3109a51f8dc88 Jan Kara                  2012-05-24  65  {
a91befde350375 wuchi                     2022-06-04  66  	s64 events = percpu_counter_sum(&p->events);
f3109a51f8dc88 Jan Kara                  2012-05-24  67  
f3109a51f8dc88 Jan Kara                  2012-05-24  68  	/*
f3109a51f8dc88 Jan Kara                  2012-05-24  69  	 * Don't do anything if there are no events.
f3109a51f8dc88 Jan Kara                  2012-05-24  70  	 */
a91befde350375 wuchi                     2022-06-04  71  	if (events <= 1)
f3109a51f8dc88 Jan Kara                  2012-05-24  72  		return false;
9458e0a78c45bc Sebastian Andrzej Siewior 2022-08-25 @73  	preempt_disable_nested();
f3109a51f8dc88 Jan Kara                  2012-05-24  74  	write_seqcount_begin(&p->sequence);
f3109a51f8dc88 Jan Kara                  2012-05-24  75  	if (periods < 64)
f3109a51f8dc88 Jan Kara                  2012-05-24  76  		events -= events >> periods;
f3109a51f8dc88 Jan Kara                  2012-05-24  77  	/* Use addition to avoid losing events happening between sum and set */
f3109a51f8dc88 Jan Kara                  2012-05-24  78  	percpu_counter_add(&p->events, -events);
f3109a51f8dc88 Jan Kara                  2012-05-24  79  	p->period += periods;
f3109a51f8dc88 Jan Kara                  2012-05-24  80  	write_seqcount_end(&p->sequence);
9458e0a78c45bc Sebastian Andrzej Siewior 2022-08-25  81  	preempt_enable_nested();
f3109a51f8dc88 Jan Kara                  2012-05-24  82  
f3109a51f8dc88 Jan Kara                  2012-05-24  83  	return true;
f3109a51f8dc88 Jan Kara                  2012-05-24  84  }
f3109a51f8dc88 Jan Kara                  2012-05-24  85  

:::::: The code at line 73 was first introduced by commit
:::::: 9458e0a78c45bc6537ce11eb9f03489eab92f9c2 flex_proportions: Disable preemption entering the write section.

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
