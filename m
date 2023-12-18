Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214DEFBF4
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUSB/bHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702887762; x=1734423762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ei1YCkAS5gzYdWSkuGnfEeRY3KZcxPP+4s8PdrjGl38=;
  b=VUSB/bHeXX1R4Wa5W9i6R/jFhCZUkjGgJFj2dBC+i9AoY7mollv/P+2G
   R5O/VWSUS1LUCpXTSPHpdw8ZQVfI4iTTwlo9/MCkA+dz0BduKLJEwFhqJ
   nzLfnCoFxDeR5EhlBpVSsC+ss3Emg5KCnV5WhYZ2T7zKuvsp+sX6rE+u4
   BotWi74842RIAHpv1JP6p4hV7CbzSaAJH8NrrSY6zDP778dys2DSuw6dP
   h00FVOFZQM3gRXY6gwZve2bpGdPuAZb2umb//9+ufSRWfsQZiVxfCeWyE
   aoZDw9TpTwF6l9PGHmknQoSfiIYRQrhzgYK8quFgG10vQl3rVNuwol/6P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2325153"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2325153"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="919175598"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="919175598"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2023 00:22:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF8ta-0003uj-05;
	Mon, 18 Dec 2023 08:22:38 +0000
Date: Mon, 18 Dec 2023 16:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: pci.c:(.text+0x704): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312181644.XpjZQzVi-lkp@intel.com>
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
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: 7f946e6d830fbdf411cd0641314edf11831efc88 Merge branch 'for-6.7/cxl-rch-eh' into cxl/next
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: csky-randconfig-s031-20220213 (https://download.01.org/0day-ci/archive/20231218/202312181644.XpjZQzVi-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181644.XpjZQzVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312181644.XpjZQzVi-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   drivers/cxl/pci.o: in function `cxl_pci_probe':
>> pci.c:(.text+0x704): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x70c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x71c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x722): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x74e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x762): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x772): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x77c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x788): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x798): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   pci.c:(.text+0x7ac): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
