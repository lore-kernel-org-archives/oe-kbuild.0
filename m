Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070473F6C33
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289464; cv=none; b=QI6XjfPXsmk09+Kd9RPn4zdPlcnoNgmb+Idxw6RXq61UP1Ki/TPpoC6CEnLmz4kbZtS0uK79EL3nSmrMdGvtmArozYTy6RJ5qmekgShOHEPpzQB5AME0axYUIjOyHBk31TI2+XkNhyrmfidtn9Z25XeMu3VqN78LeAl3skZw83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289464; c=relaxed/simple;
	bh=U5ba/FSDYd7UUZwpCOOb2L7LhJ+/BPn178abfVHDwtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pY3SADggfxitRS6CriF9N+82BMLlJhhyEVVA5WVG7nsyUstgv+HyNSd1RBXx8BD9pchV+CpCHkqj9OmUXGfxAFJ3V8zw9suQU3sgHS4aDh+7cXzyPxTZxjApiZSRKbKPVYimlRhzwparKLer62w8ZDTpIG+hquYXCSCiMdDIbNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AC/lQm0S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC/lQm0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784289459; x=1815825459;
  h=date:from:to:cc:subject:message-id;
  bh=U5ba/FSDYd7UUZwpCOOb2L7LhJ+/BPn178abfVHDwtQ=;
  b=AC/lQm0SynZo7lGhmLeCg5IvchT0Dgn88n4CIe6MAeUAbL568BLxA6Tl
   s1/koa49aSGKHtY8LZmHO0Urf2zyzGYjQ2oxCLOk+l5xgx2Njv+epX41x
   iSj5S512XMnzHJ1+0mRJsietvrsPmsiyUcm5HTu0exj31gtchMYJWsy75
   7jlaNyiGao8/+hLmFwCX8ELq3fw67CbmOXUmSMMl+BGjPQR9WS2iLCh+5
   wXlhqJgeuOsjUfGR3NzczjF8knGRcZylUyF5sZNQiWEC6Ovad6qpcXuU9
   OTwBPysCFLH1RVFPDx1InoFs6iHdJ6DxEJxKDZxGvHGbh+g7UA5cwmNQr
   A==;
X-CSE-ConnectionGUID: 2E5NXI0eTWmZZ0UhWoPRpA==
X-CSE-MsgGUID: NEwt+nLeQeWBzCIGztBnEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96472377"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96472377"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:57:35 -0700
X-CSE-ConnectionGUID: ZvetfokuSQWJe0Zl2bJqcw==
X-CSE-MsgGUID: 79LWF6SBQDeOVJGAYsPcsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="260587184"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2026 04:57:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhC4-00000000Si9-265T;
	Fri, 17 Jul 2026 11:57:29 +0000
Date: Fri, 17 Jul 2026 19:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/yt921x.c:1601:9: error: call to
 '__compiletime_assert_831' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202607171943.fpVdQXCs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Yang <mmyangfl@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: 186623f4aa724c46cbb4dbd5235cf6942215f5b5 net: dsa: yt921x: Add support for Motorcomm YT921x
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: um-randconfig-r134-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171943.fpVdQXCs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171943.fpVdQXCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607171943.fpVdQXCs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/yt921x.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/dsa/yt921x.c:1601:9: error: call to '__compiletime_assert_831' declared with 'error' attribute: FIELD_PREP: value too large for the field
    1601 |         ctrl = YT921X_PORT_VLAN_CTRL_CVID(vid);
         |                ^
   drivers/net/dsa/yt921x.h:363:43: note: expanded from macro 'YT921X_PORT_VLAN_CTRL_CVID'
     363 | #define   YT921X_PORT_VLAN_CTRL_CVID(x)                 FIELD_PREP(YT921X_PORT_VLAN_CTRL_CVID_M, (x))
         |                                                         ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_831
         | ^
   1 warning and 1 error generated.


vim +1601 drivers/net/dsa/yt921x.c

186623f4aa724c David Yang 2025-10-17  1593  
186623f4aa724c David Yang 2025-10-17  1594  static int
186623f4aa724c David Yang 2025-10-17  1595  yt921x_port_set_pvid(struct yt921x_priv *priv, int port, u16 vid)
186623f4aa724c David Yang 2025-10-17  1596  {
186623f4aa724c David Yang 2025-10-17  1597  	u32 mask;
186623f4aa724c David Yang 2025-10-17  1598  	u32 ctrl;
186623f4aa724c David Yang 2025-10-17  1599  
186623f4aa724c David Yang 2025-10-17  1600  	mask = YT921X_PORT_VLAN_CTRL_CVID_M;
186623f4aa724c David Yang 2025-10-17 @1601  	ctrl = YT921X_PORT_VLAN_CTRL_CVID(vid);
186623f4aa724c David Yang 2025-10-17  1602  	return yt921x_reg_update_bits(priv, YT921X_PORTn_VLAN_CTRL(port),
186623f4aa724c David Yang 2025-10-17  1603  				      mask, ctrl);
186623f4aa724c David Yang 2025-10-17  1604  }
186623f4aa724c David Yang 2025-10-17  1605  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
