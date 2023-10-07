Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550E33992
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Oct 2023 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAwobKJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696714716; x=1728250716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GLGxrqM4iFhEmsjqQ9SHrUBkE9Hx9C6qXZeUWOdXOgA=;
  b=NAwobKJ0V2NKMXP0kh3SWNLT+7hA3uc4GPJQ/K8R1WXt/bgTBi8KAq1U
   eTopHEkYvu3jDhvG+FLi3KSNJKeN40tNvuhaXftysVqot9KTPpy/9zWpp
   GlpQiz3lOqc889iQMywCAogNQ/83MB40OoA55DH66hqgKG7LzgF0/GM3z
   nIQD219K/JJJrVRGNaNs1gBcfmk3zvMqyXQ/uPvwWBJD8rH3ANMckMJJh
   Sl81CFEQ2ppxdaJhIqKt1wIDhGQq/fMMU73a/nwNGZ2ZBuCRVGPs0VLlQ
   1j+dckY7Li/uZkjLFIdufuagA34TxsbD8MaMyMkEDC6icLhu9cuc09ytF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="382829542"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="382829542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 14:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="876384224"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="876384224"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Oct 2023 14:38:33 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpF0I-0004pB-1y;
	Sat, 07 Oct 2023 21:38:30 +0000
Date: Sun, 8 Oct 2023 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/12] arch/x86/lib/delay.c:92:31: sparse: sparse:
 too many errors
Message-ID: <202310080532.XG4RCaqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/lib/delay.c:92:31: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   ca4256348660cb2162668ec3d13d1f921d05374a
commit: 9a462b9eafa6dda16ea8429b151edb1fb535d744 [11/12] x86/percpu: Use compiler segment prefix qualifier
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-122-20231007 (https://download.01.org/0day-ci/archive/20231008/202310080532.XG4RCaqV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310080532.XG4RCaqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310080532.XG4RCaqV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/lib/delay.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   arch/x86/lib/delay.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, arch/x86/include/asm/timer.h):
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
   arch/x86/lib/delay.c: note: in included file (through arch/x86/include/asm/timer.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:69:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:69:15: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:69:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:69:15: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:69:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:69:15: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:69:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:69:15: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:90:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:90:21: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:90:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:90:21: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:90:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:90:21: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:90:21: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:90:21: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:92:31: sparse: sparse: Expected ) at end of cast operator
   arch/x86/lib/delay.c:92:31: sparse: sparse: got __seg_gs
   arch/x86/lib/delay.c:92:31: sparse: sparse: Expected ) at end of cast operator
>> arch/x86/lib/delay.c:92:31: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/lib/usercopy_64.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/lib/usercopy_64.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   arch/x86/lib/usercopy_64.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   arch/x86/lib/usercopy_64.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   arch/x86/kernel/cpu/intel.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, arch/x86/include/asm/pgtable.h, ...):
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
   arch/x86/kernel/cpu/intel.c: note: in included file (through include/linux/mm_types.h, include/asm-generic/fixmap.h, arch/x86/include/asm/fixmap.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   arch/x86/kernel/cpu/intel.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h):
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
   arch/x86/kernel/cpu/intel.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/adxl34x-spi.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/adxl34x.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/apanel.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/input/misc/apanel.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/apanel.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/input/misc/apanel.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/apanel.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/apanel.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/apanel.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/atc260x-onkey.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/da9052_onkey.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/gpio-vibra.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/mc13783-pwrbutton.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/swait.h, ...):
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
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/ims-pcu.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/pcf8574_keypad.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   drivers/input/misc/xen-kbdfront.c: note: in included file (through include/linux/fs.h, include/linux/input.h):
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
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/bpf/btf.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   kernel/bpf/btf.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ptrace.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   kernel/bpf/btf.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/bpf/btf.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h, include/linux/pid_namespace.h, ...):
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
   drivers/cpuidle/governors/ladder.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/ladder.c: note: in included file (through include/linux/hrtimer.h, include/linux/cpuidle.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/cpuidle/governors/ladder.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/ladder.c: note: in included file (through include/linux/cpuidle.h):
   include/linux/context_tracking.h:122:34: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking.h:122:34: sparse: sparse: got __seg_gs
   include/linux/context_tracking.h:131:45: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking.h:131:45: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/ladder.c: note: in included file:
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/cpuidle.h:204:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/haltpoll.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/haltpoll.c: note: in included file (through include/linux/hrtimer.h, include/linux/cpuidle.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   drivers/cpuidle/governors/haltpoll.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/haltpoll.c: note: in included file (through include/linux/cpuidle.h):
   include/linux/context_tracking.h:122:34: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking.h:122:34: sparse: sparse: got __seg_gs
   include/linux/context_tracking.h:131:45: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking.h:131:45: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/haltpoll.c: note: in included file:
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:121:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:121:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   include/linux/cpuidle.h:204:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/cpuidle.h:204:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/time/timer.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/kernel_stat.h):
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
   kernel/time/timer.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/kernel_stat.h):
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
   kernel/time/timer.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/hardirq.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   kernel/time/timer.c: note: in included file (through include/linux/kernel_stat.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   kernel/time/timer.c: note: in included file:
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/kernel_stat.h:63:9: sparse: sparse: got __seg_gs
   include/linux/kernel_stat.h:63:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/kernel_stat.h:63:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
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
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mce/inject.c: note: in included file (through include/linux/fs.h, include/linux/debugfs.h):
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

vim +92 arch/x86/lib/delay.c

6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  61  
6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  62  /* TSC based delay: */
e8824890249355 arch/x86/lib/delay.c    Thomas Gleixner 2020-04-24  63  static void delay_tsc(u64 cycles)
6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  64  {
e8824890249355 arch/x86/lib/delay.c    Thomas Gleixner 2020-04-24  65  	u64 bclock, now;
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  66  	int cpu;
6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  67  
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  68  	preempt_disable();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  69  	cpu = smp_processor_id();
03b9730b769fc4 arch/x86/lib/delay.c    Andy Lutomirski 2015-06-25  70  	bclock = rdtsc_ordered();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  71  	for (;;) {
03b9730b769fc4 arch/x86/lib/delay.c    Andy Lutomirski 2015-06-25  72  		now = rdtsc_ordered();
e8824890249355 arch/x86/lib/delay.c    Thomas Gleixner 2020-04-24  73  		if ((now - bclock) >= cycles)
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  74  			break;
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  75  
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  76  		/* Allow RT tasks to run */
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  77  		preempt_enable();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  78  		rep_nop();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  79  		preempt_disable();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  80  
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  81  		/*
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  82  		 * It is possible that we moved to another CPU, and
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  83  		 * since TSC's are per-cpu we need to calculate
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  84  		 * that. The delay must guarantee that we wait "at
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  85  		 * least" the amount of time. Being moved to another
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  86  		 * CPU could make the wait longer but we just need to
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  87  		 * make sure we waited long enough. Rebalance the
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  88  		 * counter for this CPU.
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  89  		 */
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  90  		if (unlikely(cpu != smp_processor_id())) {
e8824890249355 arch/x86/lib/delay.c    Thomas Gleixner 2020-04-24  91  			cycles -= (now - bclock);
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25 @92  			cpu = smp_processor_id();
03b9730b769fc4 arch/x86/lib/delay.c    Andy Lutomirski 2015-06-25  93  			bclock = rdtsc_ordered();
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  94  		}
5c1ea08215f1f8 arch/x86/lib/delay_32.c Steven Rostedt  2008-05-25  95  	}
35d5d08a085c56 arch/x86/lib/delay_32.c Andrew Morton   2007-11-14  96  	preempt_enable();
6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  97  }
6f84fa2f3edc89 arch/i386/lib/delay.c   John Stultz     2006-06-26  98  

:::::: The code at line 92 was first introduced by commit
:::::: 5c1ea08215f1f830dfaf4819a5f22efca41c3832 x86: enable preemption in delay

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
