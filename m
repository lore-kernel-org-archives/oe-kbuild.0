Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6897E
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkF+MrX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698982411; x=1730518411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6DH6ct5T0EqhuyzBIcbSv4O/f88c5iG0JRnvFVQGhI=;
  b=OkF+MrX9eNcxw3ra/vs+JA0b3G9obWbP1ABYKT5UiGSzA8vBNSs3qH8n
   srDHQ4Qxwso3eep7dGT/12Us8e5lcG2TRQwApShE7OE2blJM3QHu3n/ca
   0f3NXcqjBc2B9UAJpgfQh6q1baL2kBH5ExV3DvfpRo3/kraVtEPjlaXwB
   ENbIhsIEdt8lj+hBOX05Al23TD1VYs6pvB9PKiXqRyeYcZ3KO8LbrmjgA
   iaMuMCcDq2FCEmeVZZgy9LIRNRwlZEH1mVuaVcTZ+ZPPBSeqBp9q1ysXR
   V8kXWhd8aPJQv4QVw3WwXpW+l0iycaujnLpIqmY+1MyVPWs8rS7Cv2YRV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388696551"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="388696551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 20:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2655733"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Nov 2023 20:33:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qykw2-0002AM-23;
	Fri, 03 Nov 2023 03:33:26 +0000
Date: Fri, 3 Nov 2023 11:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/22] include/linux/topology.h:89:16: sparse:
 sparse: too many errors
Message-ID: <202311031118.xY8kc5AK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/topology.h:89:16: sparse: sparse: too many errors"
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
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231103/202311031118.xY8kc5AK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031118.xY8kc5AK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311031118.xY8kc5AK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/sysfs.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/sysfs.c: note: in included file (through include/linux/hrtimer.h, include/linux/cpuidle.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/sysfs.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/sysfs.c: note: in included file:
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
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/sysfs.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   drivers/cpuidle/governors/menu.c: note: in included file (through include/linux/preempt.h, include/linux/percpu.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/menu.c: note: in included file (through include/linux/hrtimer.h, include/linux/cpuidle.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/menu.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h, include/linux/cpuidle.h):
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
   drivers/cpuidle/governors/menu.c: note: in included file:
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
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/menu.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   include/linux/cpuidle.h:204:9: sparse: sparse: got __seg_gs
   drivers/cpuidle/governors/haltpoll.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/radix-tree.h, ...):
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
   kernel/events/callchain.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   kernel/events/callchain.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ptrace.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/events/callchain.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/events/callchain.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h, include/linux/pid_namespace.h, ...):
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
   kernel/events/ring_buffer.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   kernel/events/ring_buffer.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ptrace.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/events/ring_buffer.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/events/ring_buffer.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h, include/linux/pid_namespace.h, ...):
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
   kernel/events/hw_breakpoint.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   kernel/events/hw_breakpoint.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ptrace.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/events/hw_breakpoint.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/events/hw_breakpoint.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h, include/linux/pid_namespace.h, ...):
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
   kernel/events/uprobes.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   kernel/events/uprobes.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h, include/linux/highmem.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/events/uprobes.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   kernel/events/uprobes.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h, ...):
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
   kernel/events/uprobes.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/events/core.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
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
   kernel/events/core.c: note: in included file (through include/linux/dcache.h, include/linux/fs.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/events/core.c: note: in included file (through include/linux/gfp.h, include/linux/xarray.h, include/linux/list_lru.h, ...):
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
   kernel/events/core.c: note: in included file (through include/linux/xarray.h, include/linux/list_lru.h, include/linux/fs.h):
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
   kernel/events/core.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/module/sysfs.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   kernel/module/sysfs.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/module/sysfs.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   kernel/module/sysfs.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   kernel/module/sysfs.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
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
   kernel/module/kmod.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
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
   kernel/module/kmod.c: note: in included file (through include/linux/mm_types.h, include/linux/buildid.h, include/linux/module.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   kernel/module/kmod.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
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
   kernel/module/kmod.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
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
   kernel/module/kmod.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h):
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

vim +89 include/linux/topology.h

7281201922a006 Lee Schermerhorn  2010-05-26  84  
7281201922a006 Lee Schermerhorn  2010-05-26  85  #ifndef numa_node_id
7281201922a006 Lee Schermerhorn  2010-05-26  86  /* Returns the number of the current Node. */
7281201922a006 Lee Schermerhorn  2010-05-26  87  static inline int numa_node_id(void)
7281201922a006 Lee Schermerhorn  2010-05-26  88  {
dc322a99d31fff Christoph Lameter 2014-04-07 @89  	return raw_cpu_read(numa_node);
7281201922a006 Lee Schermerhorn  2010-05-26  90  }
7281201922a006 Lee Schermerhorn  2010-05-26  91  #endif
7281201922a006 Lee Schermerhorn  2010-05-26  92  

:::::: The code at line 89 was first introduced by commit
:::::: dc322a99d31fff5d3f8acfa061ad033953efdebe mm: use raw_cpu ops for determining current NUMA node

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
