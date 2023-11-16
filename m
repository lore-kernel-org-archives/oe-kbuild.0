Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38048C2F0
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7g0Qc/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700112162; x=1731648162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRLhHwaXaPvTtCOXbaOrW5Fpga/VHkO+COOR0MUcRqo=;
  b=F7g0Qc/hCKjjWwaBJRfqybBO007n3iNNv5fJhgefSIIaqG/Pc39PRGDh
   ut6W8Ie/27tv8HNMsDAoOfXG1bVL7PDRqC7YeqiMMS08DKGpi5QumTv3N
   7AnN0eQqDQ2vCZYWFnNvcT9cxZNDa0FTb0NuGM8PYEvRfh/bFo/HejRfs
   0vfXGZmHUZXTni/boAdpY5jwFzd1V9LEBPUfbZIYfecOU8NdWJtClMdTp
   WQ34zvSzyFUza6TnrPlS7H8uJg+xBlNrcK20phbJJWXVyF29l4fBEUeBW
   0m4MENGrUK9VQAqC3mBMsoxVb45XigurLCyUJrSx6qne6n7Q+4YvvxLRz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371200846"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="371200846"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758711978"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="758711978"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 21:22:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Upo-0001KU-1j;
	Thu, 16 Nov 2023 05:22:36 +0000
Date: Thu, 16 Nov 2023 13:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Message-ID: <202311161318.pH043qET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Hu <nick.hu@sifive.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ben Dooks <ben.dooks@codethink.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspend and resume operations
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231116/202311161318.pH043qET-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161318.pH043qET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161318.pH043qET-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_pm_ops' was not declared. Should it be static?
   drivers/tty/serial/sifive.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035  
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
