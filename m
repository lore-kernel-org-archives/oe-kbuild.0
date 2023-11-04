Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076D17F3
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 03:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAXmTDCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699067913; x=1730603913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldq4Nr846Ubs4r30L2WqB2C6DAenoMZfAWeaCvmNGUA=;
  b=KAXmTDCIPAdiy5tdtMfVujTU7d4Ra43XhlTBBj1GOTGaDs5rjfGWPh1b
   34vgJuu8SabCp5G+mPky9eIBI6E6tA3xS+JeE/nmTpFDoY8arNa8XKFT0
   kT9lhut7mxUyoK4Q7G0U5XGd9DeXyhTi0iWaDDmn6t+9uakeEjCjSv40Q
   Z5OZ5WpCA/BuOCIpN/Bna2xiNZ+Icz43F8Vy2KBqdoTLwl089G5z4Hb18
   STUNsEdzeBypjNtnPBHJxmMI0hOPnTh58zAhnrKuGqJ5d0JyyuefZt5ng
   qfuqWApuFy5BaE2Mm9NmFz47lDNcC7B5trt7yNx+S0ztJUSUd4Oz+zKnY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="7688837"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="7688837"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093259957"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1093259957"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 20:18:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7B4-0003Ku-2o;
	Sat, 04 Nov 2023 03:18:26 +0000
Date: Sat, 4 Nov 2023 11:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/22] arch/x86/include/asm/tlbflush.h:262:45:
 sparse: sparse: too many errors
Message-ID: <202311041136.JIi90lRL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors"
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
:::::: branch date: 10 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231104/202311041136.JIi90lRL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041136.JIi90lRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311041136.JIi90lRL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/fadvise.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/fadvise.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/fadvise.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/fadvise.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/fadvise.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/readahead.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/readahead.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h, ...):
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
   mm/readahead.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/readahead.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/readahead.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/truncate.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/truncate.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/backing-dev.h):
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
   mm/truncate.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/truncate.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/truncate.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/backing-dev.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/backing-dev.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h, ...):
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
   mm/backing-dev.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/backing-dev.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/backing-dev.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/vmstat.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/vmstat.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/vmstat.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/vmstat.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/vmstat.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/oom_kill.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/oom_kill.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/signal.h, ...):
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
   mm/oom_kill.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   mm/oom_kill.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h, include/linux/oom.h):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/page-writeback.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
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
   mm/page-writeback.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/page-writeback.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/page-writeback.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/page-writeback.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/show_mem.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/show_mem.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h, ...):
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
   mm/show_mem.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/show_mem.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/show_mem.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/shmem_quota.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/shmem_quota.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/shmem_quota.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/shmem_quota.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/shmem_quota.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/shmem.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/shmem.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/shmem.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/shmem.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/shmem.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/workingset.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/workingset.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/workingset.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/workingset.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/workingset.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/msync.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/msync.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/msync.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/msync.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/msync.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/mmu_gather.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
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
   mm/mmu_gather.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h):
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
   mm/mmu_gather.c: note: in included file (through include/linux/gfp.h):
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
   mm/mmu_gather.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/mmu_gather.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/filemap.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/filemap.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/dax.h):
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
   mm/filemap.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/filemap.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/filemap.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/compaction.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/compaction.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   mm/compaction.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   mm/compaction.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/compaction.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/vmpressure.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/vmpressure.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h):
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
   mm/vmpressure.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/vmpressure.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/vmpressure.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/page_owner.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/page_owner.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   mm/page_owner.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/page_owner.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/page_owner.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/kmemleak.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/kmemleak.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/signal.h):
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
   mm/kmemleak.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   mm/kmemleak.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/hugetlb_cgroup.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/hugetlb_cgroup.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h):
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
   mm/hugetlb_cgroup.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/hugetlb_cgroup.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/hugetlb_cgroup.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/cma_debug.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/cma_debug.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   mm/cma_debug.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/cma_debug.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/cma_debug.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/percpu-stats.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/percpu-stats.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   mm/percpu-stats.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/percpu-stats.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/percpu-stats.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/memfd.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/memfd.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
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
   mm/memfd.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/memfd.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/memfd.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/memcontrol.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/memcontrol.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/memcontrol.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/memcontrol.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/memcontrol.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/net_failover.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
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
   drivers/net/net_failover.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/delay.h, ...):
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
   drivers/net/net_failover.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/net_failover.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/net_failover.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
>> include/linux/percpu-rwsem.h:63:17: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/virtio_net.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
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
   drivers/net/virtio_net.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/delay.h, ...):
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
   drivers/net/virtio_net.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/virtio_net.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/virtio_net.c: note: in included file (through include/linux/fs.h, include/linux/highmem.h, include/linux/bvec.h, ...):
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: got __seg_gs
   include/linux/percpu-rwsem.h:63:17: sparse: sparse: Expected ) at end of cast operator
>> include/linux/percpu-rwsem.h:63:17: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_aperture.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_aperture.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   drivers/gpu/drm/drm_aperture.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/gpu/drm/drm_aperture.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_aperture.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_bridge.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_bridge.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_atomic.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/sync_file.h):
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
   drivers/gpu/drm/drm_atomic.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/dma-fence.h, ...):
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
   drivers/gpu/drm/drm_atomic.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   drivers/gpu/drm/drm_atomic.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/drm/drm_modeset_lock.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_cache.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   drivers/gpu/drm/drm_cache.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h):
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
   drivers/gpu/drm/drm_cache.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_cache.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_cache.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_client.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/vmalloc.h, ...):
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
   drivers/gpu/drm/drm_client.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_client.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_client.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_client.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_color_mgmt.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/drm/drm_modeset_lock.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_displayid.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_displayid.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   drivers/gpu/drm/drm_displayid.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/gpu/drm/drm_displayid.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_displayid.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_drv.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_lease.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_lease.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_lease.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_lease.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_framebuffer.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/drm/drm_modeset_lock.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_mm.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
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
   drivers/gpu/drm/drm_mm.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/seq_file.h):
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
   drivers/gpu/drm/drm_mm.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_mm.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_mm.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_mode_object.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/drm/drm_modeset_lock.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_print.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/vmalloc.h, ...):
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
   drivers/gpu/drm/drm_print.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/seq_file.h):
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
   drivers/gpu/drm/drm_print.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_print.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_print.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_mode_config.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_property.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/drm_property.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_property.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   drivers/gpu/drm/drm_property.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/drm/drm_modeset_lock.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/seq_file.h, ...):
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
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_vblank_work.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/eventfd.h):
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
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_syncobj.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_ioc32.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   drivers/gpu/drm/drm_ioc32.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/gpu/drm/drm_ioc32.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_ioc32.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_ioc32.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_debugfs_crc.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/debugfs.h):
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
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_debugfs.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_kms_helper_common.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_rect.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   drivers/gpu/drm/drm_rect.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/seq_file.h, ...):
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
   drivers/gpu/drm/drm_rect.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/gpu/drm/drm_rect.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/drm_rect.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/phy/mii_timestamper.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/net/phy/mii_timestamper.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   drivers/net/phy/mii_timestamper.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/net/phy/mii_timestamper.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/phy/mii_timestamper.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/appletalk/ipddp.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   drivers/net/appletalk/ipddp.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/appletalk/ipddp.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   drivers/net/appletalk/ipddp.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/appletalk/ipddp.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/can/dev/calc_bittiming.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/net/can/dev/calc_bittiming.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/can/dev/calc_bittiming.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/can/dev/calc_bittiming.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/can/dev/calc_bittiming.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/can/dev/bittiming.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/net/can/dev/bittiming.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/can/dev/bittiming.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/can/dev/bittiming.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/can/dev/bittiming.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/can/dev/skb.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/net/can/dev/skb.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/can/dev/skb.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/can/dev/skb.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/can/dev/skb.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/can/dev/length.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/net/can/dev/length.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/can/dev/length.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/can/dev/length.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/can/dev/length.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/net/can/dev/netlink.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/net/can/dev/netlink.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   drivers/net/can/dev/netlink.c: note: in included file (through include/linux/gfp.h, include/linux/stackdepot.h, include/linux/ref_tracker.h, ...):
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
   drivers/net/can/dev/netlink.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/net/can/dev/netlink.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/init.c: note: in included file (through include/linux/preempt.h, include/linux/bottom_half.h, arch/x86/include/asm/fpu/api.h):
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
   arch/x86/kernel/fpu/init.c: note: in included file (through include/linux/mm_types.h, arch/x86/include/asm/tlbflush.h):
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
   arch/x86/kernel/fpu/init.c: note: in included file:
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
   arch/x86/kernel/fpu/init.c: note: in included file:
   arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: Expected ) at end of cast operator
>> arch/x86/kernel/fpu/xstate.h:155:21: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/task_stack.h):
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
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/regset.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/core.c: note: in included file (through include/linux/preempt.h, include/linux/bottom_half.h, arch/x86/include/asm/fpu/api.h):
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
   arch/x86/kernel/fpu/core.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h, ...):
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
   arch/x86/kernel/fpu/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/regset.h, ...):
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
   arch/x86/kernel/fpu/core.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/topology.h:89:16: sparse: sparse: got __seg_gs
   include/linux/topology.h:89:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/topology.h:89:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/signal.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   arch/x86/kernel/fpu/signal.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   arch/x86/kernel/fpu/signal.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   arch/x86/kernel/fpu/signal.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/signal.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/xstate.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   arch/x86/kernel/fpu/xstate.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   arch/x86/kernel/fpu/xstate.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   arch/x86/kernel/fpu/xstate.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/fpu/xstate.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/futex/core.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   kernel/futex/core.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   kernel/futex/core.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   kernel/futex/core.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   kernel/futex/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/futex/syscalls.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/ipc.h, ...):
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
   kernel/futex/syscalls.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, ...):
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
   kernel/futex/syscalls.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   kernel/futex/syscalls.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   kernel/futex/syscalls.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/damon/modules-common.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/damon/modules-common.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/damon/modules-common.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/damon/modules-common.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/damon/modules-common.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/damon/lru_sort.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/damon/lru_sort.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/damon/lru_sort.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/damon/lru_sort.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/damon/lru_sort.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/damon/vaddr.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   mm/damon/vaddr.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h):
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
   mm/damon/vaddr.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/damon/vaddr.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/damon/vaddr.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/damon/dbgfs.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/damon/dbgfs.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/damon/dbgfs.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/damon/dbgfs.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/damon/dbgfs.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   mm/damon/core.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   mm/damon/core.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/cgroup.h, ...):
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
   mm/damon/core.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   mm/damon/core.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   mm/damon/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/gpu/drm/display/drm_dp_aux_dev.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/gpu/drm/display/drm_dp_aux_dev.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   drivers/gpu/drm/display/drm_dp_aux_dev.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/gpu/drm/display/drm_dp_aux_dev.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   drivers/gpu/drm/display/drm_dp_aux_dev.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
>> arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: too many errors

vim +262 arch/x86/include/asm/tlbflush.h

5932c9fd19e6e5 arch/x86/include/asm/tlbflush.h Nadav Amit        2019-04-25  176  
1e02ce4cccdcb9 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  177  /* Initialize cr4 shadow for this CPU. */
1e02ce4cccdcb9 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  178  static inline void cr4_init_shadow(void)
1e02ce4cccdcb9 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  179  {
1ef55be16ed695 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2016-09-29 @180  	this_cpu_write(cpu_tlbstate.cr4, __read_cr4());
1e02ce4cccdcb9 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  181  }
1e02ce4cccdcb9 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  182  
375074cc736ab1 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  183  extern unsigned long mmu_cr4_features;
375074cc736ab1 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  184  extern u32 *trampoline_cr4_features;
375074cc736ab1 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2014-10-24  185  
72c0098d92cedb arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-09-06  186  extern void initialize_tlbstate_and_flush(void);
72c0098d92cedb arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-09-06  187  
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  188  /*
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  189   * TLB flushing:
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  190   *
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  191   *  - flush_tlb_all() flushes all processes TLBs
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  192   *  - flush_tlb_mm(mm) flushes the specified mm context TLB's
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  193   *  - flush_tlb_page(vma, vmaddr) flushes one page
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  194   *  - flush_tlb_range(vma, start, end) flushes a range of pages
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  195   *  - flush_tlb_kernel_range(start, end) flushes a range of kernel pages
4ce94eabac16b1 arch/x86/include/asm/tlbflush.h Nadav Amit        2021-02-20  196   *  - flush_tlb_multi(cpumask, info) flushes TLBs on multiple cpus
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  197   *
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  198   * ..but the i386 has somewhat limited tlb flushing capabilities,
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  199   * and page-granular flushes are available only on i486 and up.
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  200   */
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  201  struct flush_tlb_info {
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  202  	/*
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  203  	 * We support several kinds of flushes.
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  204  	 *
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  205  	 * - Fully flush a single mm.  .mm will be set, .end will be
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  206  	 *   TLB_FLUSH_ALL, and .new_tlb_gen will be the tlb_gen to
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  207  	 *   which the IPI sender is trying to catch us up.
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  208  	 *
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  209  	 * - Partially flush a single mm.  .mm will be set, .start and
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  210  	 *   .end will indicate the range, and .new_tlb_gen will be set
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  211  	 *   such that the changes between generation .new_tlb_gen-1 and
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  212  	 *   .new_tlb_gen are entirely contained in the indicated range.
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  213  	 *
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  214  	 * - Fully flush all mms whose tlb_gens have been updated.  .mm
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  215  	 *   will be NULL, .end will be TLB_FLUSH_ALL, and .new_tlb_gen
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  216  	 *   will be zero.
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  217  	 */
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  218  	struct mm_struct	*mm;
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  219  	unsigned long		start;
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  220  	unsigned long		end;
b0579ade7cd823 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-06-29  221  	u64			new_tlb_gen;
4c1ba3923e6c8a arch/x86/include/asm/tlbflush.h Nadav Amit        2021-02-20  222  	unsigned int		initiating_cpu;
4c1ba3923e6c8a arch/x86/include/asm/tlbflush.h Nadav Amit        2021-02-20  223  	u8			stride_shift;
4c1ba3923e6c8a arch/x86/include/asm/tlbflush.h Nadav Amit        2021-02-20  224  	u8			freed_tables;
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  225  };
a2055abe9c6789 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-28  226  
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  227  void flush_tlb_local(void);
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  228  void flush_tlb_one_user(unsigned long addr);
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  229  void flush_tlb_one_kernel(unsigned long addr);
4ce94eabac16b1 arch/x86/include/asm/tlbflush.h Nadav Amit        2021-02-20  230  void flush_tlb_multi(const struct cpumask *cpumask,
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  231  		      const struct flush_tlb_info *info);
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  232  
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  233  #ifdef CONFIG_PARAVIRT
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  234  #include <asm/paravirt.h>
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  235  #endif
bfe3d8f6313d1e arch/x86/include/asm/tlbflush.h Thomas Gleixner   2020-04-21  236  
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  237  #define flush_tlb_mm(mm)						\
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  238  		flush_tlb_mm_range(mm, 0UL, TLB_FLUSH_ALL, 0UL, true)
611ae8e3f5204f arch/x86/include/asm/tlbflush.h Alex Shi          2012-06-28  239  
611ae8e3f5204f arch/x86/include/asm/tlbflush.h Alex Shi          2012-06-28  240  #define flush_tlb_range(vma, start, end)				\
a31acd3ee8f7db arch/x86/include/asm/tlbflush.h Peter Zijlstra    2018-08-26  241  	flush_tlb_mm_range((vma)->vm_mm, start, end,			\
a31acd3ee8f7db arch/x86/include/asm/tlbflush.h Peter Zijlstra    2018-08-26  242  			   ((vma)->vm_flags & VM_HUGETLB)		\
a31acd3ee8f7db arch/x86/include/asm/tlbflush.h Peter Zijlstra    2018-08-26  243  				? huge_page_shift(hstate_vma(vma))	\
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  244  				: PAGE_SHIFT, false)
611ae8e3f5204f arch/x86/include/asm/tlbflush.h Alex Shi          2012-06-28  245  
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  246  extern void flush_tlb_all(void);
611ae8e3f5204f arch/x86/include/asm/tlbflush.h Alex Shi          2012-06-28  247  extern void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  248  				unsigned long end, unsigned int stride_shift,
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  249  				bool freed_tables);
effee4b9b3b0aa arch/x86/include/asm/tlbflush.h Alex Shi          2012-06-28  250  extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
d291cf83639a0e include/asm-x86/tlbflush.h      Thomas Gleixner   2008-01-30  251  
ca6c99c0794875 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-22  252  static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
ca6c99c0794875 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-22  253  {
016c4d92cd16f5 arch/x86/include/asm/tlbflush.h Rik van Riel      2018-09-25  254  	flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
ca6c99c0794875 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-22  255  }
ca6c99c0794875 arch/x86/include/asm/tlbflush.h Andy Lutomirski   2017-05-22  256  
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  257  static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  258  {
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  259  	bool should_defer = false;
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  260  
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  261  	/* If remote CPUs need to be flushed then defer batch the flush */
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17 @262  	if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  263  		should_defer = true;
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  264  	put_cpu();
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  265  
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  266  	return should_defer;
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  267  }
65c8d30e679bdf arch/x86/include/asm/tlbflush.h Anshuman Khandual 2023-07-17  268  

:::::: The code at line 262 was first introduced by commit
:::::: 65c8d30e679bdffeeaa0b84b7094a3c719aa6585 mm/tlbbatch: introduce arch_tlbbatch_should_defer()

:::::: TO: Anshuman Khandual <khandual@linux.vnet.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
