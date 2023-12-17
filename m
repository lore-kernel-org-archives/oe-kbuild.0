Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E40495E7
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHAysXhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702847449; x=1734383449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSBzqYLqGJnabRTUqx6tNMTx4CCuSbM1r3GeRJkHnDE=;
  b=bHAysXhqONkcIZGUUomOlHo/3rzQ7O1R4tLI3fz0/a7KUWdOz2RcaCMh
   R8TinLoR5uLCzmXHvbeTMo0u2S1IrQ2j+AKFlE0icwaD+HeWg2e26IbcD
   JUXDxEli+VtvM0LzLMlUdN7YYlWysptwpj63PLcmfUNvfczCNrB1IJfVL
   pXLWtI1Xf3xwUbeOIVQrLq6cTmD2IkdqZMm26xQdGX3+y6W77ubogFC2X
   MXLhPPFnr41wgklzLDb8HUQJ/KXIHpJtByELA2gkMUcxud1dki37aiaRq
   30Iv3IYW1HEkZntSu2sBnuGac2hwjFtDDbDNWMiTYFc6Co0vCRvAXPnuX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8789547"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="8789547"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 13:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="775347586"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="775347586"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Dec 2023 13:10:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEyPN-0003Qa-0q;
	Sun, 17 Dec 2023 21:10:45 +0000
Date: Mon, 18 Dec 2023 05:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: isp116x-hcd.c:(.text+0x1ba): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312180511.c3bwN7Y5-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e389834672c723435a44818ed2cabc4dad24429
commit: 9b378f6ad48cfa195ed868db9123c09ee7ec5ea2 btrfs: fix infinite directory reads
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: csky-buildonly-randconfig-r006-20220717 (https://download.01.org/0day-ci/archive/20231218/202312180511.c3bwN7Y5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180511.c3bwN7Y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312180511.c3bwN7Y5-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   drivers/usb/host/isp116x-hcd.o: in function `isp116x_show_regs_log':
>> isp116x-hcd.c:(.text+0x1ba): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x1ce): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x1dc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x1f0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x1fe): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x212): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x220): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x234): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x242): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x256): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   isp116x-hcd.c:(.text+0x264): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
