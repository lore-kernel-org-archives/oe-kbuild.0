Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBD156EE
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T80r6hTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702724136; x=1734260136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gez30dKaXE+cK6dndDRmIByI9+LSfmuFQiPLr3eStm4=;
  b=T80r6hTkOguZ7+IuMrI36PofDVUvUkdSR6/fJZSSEZgjWtj4x6MbJZMc
   GWX2l7daU0oFcn+yNfCCYmo/OeCIIf7d5ohOBJhVqaulM6Z1BA2W9J+53
   y4eUiEV2rA6BckkttR37L20wWhQ8HAME1B/dR52IAH4mR6kNf++PDyTKZ
   tiwzYs1RxAYRgtPLYaGw4cZGbMRNEOoXIAsvni3KO/xpoTU4BbOchynqy
   Ofm+kpT1zrvcU8cpcgM9xGmK+sAV4lleaV+RT+Ygxpp9alVBS0r/SZDv1
   zZ+4iEjHn5DFF1+Ktk+D7U6lPnCaFfi8AvVRhGNL08sqKl+otjBel9ojL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2546001"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2546001"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 02:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="893209692"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="893209692"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 02:55:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rESKR-0001UO-28;
	Sat, 16 Dec 2023 10:55:31 +0000
Date: Sat, 16 Dec 2023 18:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: softirq.c:(.text+0xf34): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312161826.SoW2EI0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Finn Thain <fthain@linux-m68k.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8e97fc6b4c057a350a9e9a1ad625e10cc9c39ee
commit: 87c3a5893e865739ce78aa7192d36011022e0af7 sched/core: Optimize in_task() and in_interrupt() a bit
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: csky-randconfig-r012-20230603 (https://download.01.org/0day-ci/archive/20231216/202312161826.SoW2EI0R-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161826.SoW2EI0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312161826.SoW2EI0R-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/softirq.o: in function `irq_enter':
>> softirq.c:(.text+0xf34): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0xf38): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/softirq.o: in function `irq_exit':
   softirq.c:(.text+0xf44): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0xfb4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0xfc0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/softirq.o: in function `irq_exit_rcu':
   softirq.c:(.text+0xfdc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0xfe0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/softirq.o: in function `__raise_softirq_irqoff':
   softirq.c:(.text+0xfec): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0x1028): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0x104e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   softirq.c:(.text+0x1084): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
