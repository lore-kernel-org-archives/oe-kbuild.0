Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CA2350D4A
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761427; cv=none; b=DMrjDiQpRr3Pc2gfIECGOeWGOG4SriCkp7QDG33mPuq0D6SFUoXRIxHoO9KVpj+iWsQh9MPlthaNBoHB0Qf5TWi+Jm1V0/Lx2Y3rs1QgpJcF38wXCv5W3VLMorf/rekvXtIjIJxL2ale/gaTy1XN/sp3puTm+Yk71RkSNN6grYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761427; c=relaxed/simple;
	bh=aO+6yW5An46Yhzd/PHo/ApLQ/YCCTM4DWUUT4UwsW8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWfaHcxYDcw+hDkJNjSuAYXTGhwmxWOXQq14iY+sCgX/YMdzpLxHGzMfIpCJEYq6Nncm1qx0THle2vL1TFqnS2zDbUM2uXPfCkKGFIWx6yh1rvePpjCAlYSqzZlgdefMo8Ix4e0NImqFD3Anz8eAyjEeht1PIf8veNcAQWv8FDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQGFjcyf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQGFjcyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769761424; x=1801297424;
  h=date:from:to:cc:subject:message-id;
  bh=aO+6yW5An46Yhzd/PHo/ApLQ/YCCTM4DWUUT4UwsW8A=;
  b=QQGFjcyffwJzs4NEnpNrQa7NKKzG8onXYZvUeD7JZ4SQbpQu3BsgCqI1
   5RXIZsxxDOlBwEVE+uShYgXa/KwU5bCcG0xudT5PN6WO8hTKRMMja8Us2
   8zjpjH0wWYklafIiFdS51zY7TswljwCDqzFj8lztmLcQEIyPjWJPhbllr
   Ey9S1c6KRm9jriPBsjylfOTNb832b8dHJyQEi4F5hZqGkPay3DGbGfNfI
   nr4EnHM9vod7MpJpPKBWTNDmBoTWhkO0GvCLGRZ8XpketMZ1zts1BUWoL
   IiIQvc3LwNmAAOky2C/HKCLjE1vt8Pxwh1UxAC1BMQ6ansruvua4WW2Uj
   g==;
X-CSE-ConnectionGUID: EBx7HNt2SvuC0lDnPKp8RA==
X-CSE-MsgGUID: TCi6UUKpTjC6HIM2ICgVVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82121715"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="82121715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:23:43 -0800
X-CSE-ConnectionGUID: 0aqBzfI8SQavW3J2bZ1z4A==
X-CSE-MsgGUID: hG9SdYZHQ7Wq+biX6VisNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="209157836"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2026 00:23:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vljn1-00000000cNA-1Bj1;
	Fri, 30 Jan 2026 08:23:39 +0000
Date: Fri, 30 Jan 2026 16:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 10/10] lib/kunit/test.c:922:34:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202601301636.uXVoajBS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/kunit/test.c:922:34: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   239c1891617b7346a47522f0a6a8586ce0d18bb7
commit: 239c1891617b7346a47522f0a6a8586ce0d18bb7 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: m68k-randconfig-r113-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301636.uXVoajBS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301636.uXVoajBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601301636.uXVoajBS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kunit/test.c:922:34: sparse: sparse: unsigned value that used to be signed checked against zero?
   lib/kunit/test.c:913:17: sparse: signed value source
--
   drivers/scsi/hptiop.c:150:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:172:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:172:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:172:35: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:208:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:208:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:208:34: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:209:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:209:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:209:35: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:244:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] result @@     got int @@
   drivers/scsi/hptiop.c:244:44: sparse:     expected restricted __le32 [usertype] result
   drivers/scsi/hptiop.c:244:44: sparse:     got int
   drivers/scsi/hptiop.c:289:35: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:276:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:277:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cur_rptr @@     got restricted __le32 [usertype] outlist_rptr @@
   drivers/scsi/hptiop.c:277:34: sparse:     expected unsigned int [usertype] cur_rptr
   drivers/scsi/hptiop.c:277:34: sparse:     got restricted __le32 [usertype] outlist_rptr
   drivers/scsi/hptiop.c:283:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] _tag @@     got restricted __le32 [usertype] val @@
   drivers/scsi/hptiop.c:283:38: sparse:     expected unsigned int [usertype] _tag
   drivers/scsi/hptiop.c:283:38: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/hptiop.c:288:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] outlist_rptr @@     got unsigned int [assigned] [usertype] cur_rptr @@
   drivers/scsi/hptiop.c:288:52: sparse:     expected restricted __le32 [usertype] outlist_rptr
   drivers/scsi/hptiop.c:288:52: sparse:     got unsigned int [assigned] [usertype] cur_rptr
   drivers/scsi/hptiop.c:369:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:369:52: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:369:52: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:370:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:370:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:370:25: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:453:64: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct hpt_iop_request_get_config *info @@     got struct hpt_iop_request_get_config [noderef] __iomem *config @@
   drivers/scsi/hptiop.c:453:64: sparse:     expected struct hpt_iop_request_get_config *info
   drivers/scsi/hptiop.c:453:64: sparse:     got struct hpt_iop_request_get_config [noderef] __iomem *config
   drivers/scsi/hptiop.c:455:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:558:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:558:27: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:558:27: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:637:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hpt_iopmv_regs *regs @@     got void [noderef] __iomem * @@
   drivers/scsi/hptiop.c:637:24: sparse:     expected struct hpt_iopmv_regs *regs
   drivers/scsi/hptiop.c:637:24: sparse:     got void [noderef] __iomem *
>> drivers/scsi/hptiop.c:643:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got struct hpt_iopmv_regs *regs @@
   drivers/scsi/hptiop.c:643:34: sparse:     expected void [noderef] __iomem *addr
   drivers/scsi/hptiop.c:643:34: sparse:     got struct hpt_iopmv_regs *regs
   drivers/scsi/hptiop.c:667:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got struct hpt_iopmv_regs *regs @@
   drivers/scsi/hptiop.c:667:26: sparse:     expected void [noderef] __iomem *addr
   drivers/scsi/hptiop.c:667:26: sparse:     got struct hpt_iopmv_regs *regs
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:933:27: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:938:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:939:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:943:43: sparse: sparse: invalid assignment: &=
   drivers/scsi/hptiop.c:943:43: sparse:    left side has type restricted __le32
   drivers/scsi/hptiop.c:943:43: sparse:    right side has type int
   drivers/scsi/hptiop.c:944:43: sparse: sparse: invalid assignment: ^=
   drivers/scsi/hptiop.c:944:43: sparse:    left side has type restricted __le32
   drivers/scsi/hptiop.c:944:43: sparse:    right side has type int
   drivers/scsi/hptiop.c:949:57: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/hptiop.c:949:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] intrfc_len @@     got unsigned int @@
   drivers/scsi/hptiop.c:949:48: sparse:     expected restricted __le32 [usertype] intrfc_len
   drivers/scsi/hptiop.c:949:48: sparse:     got unsigned int
   drivers/scsi/hptiop.c:950:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] inlist_wptr @@
   drivers/scsi/hptiop.c:950:29: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:950:29: sparse:     got restricted __le32 [usertype] inlist_wptr
   drivers/scsi/hptiop.c:975:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:975:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:975:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:977:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:977:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:977:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:980:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:980:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:980:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:982:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:982:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:982:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:985:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:985:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:985:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:987:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/hptiop.c:987:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/hptiop.c:987:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/hptiop.c:990:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] inlist_wptr @@     got unsigned int @@
   drivers/scsi/hptiop.c:990:35: sparse:     expected restricted __le32 [usertype] inlist_wptr
   drivers/scsi/hptiop.c:990:35: sparse:     got unsigned int
   drivers/scsi/hptiop.c:991:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/scsi/hptiop.c:991:37: sparse:     expected restricted __le32 [usertype]
   drivers/scsi/hptiop.c:991:37: sparse:     got unsigned int
   drivers/scsi/hptiop.c:992:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] outlist_rptr @@     got unsigned int @@
   drivers/scsi/hptiop.c:992:36: sparse:     expected restricted __le32 [usertype] outlist_rptr
   drivers/scsi/hptiop.c:992:36: sparse:     got unsigned int
   drivers/scsi/hptiop.c:1531:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:1531:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:1531:29: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:1532:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/scsi/hptiop.c:1532:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/hptiop.c:1532:25: sparse:     got restricted __le32 *
   drivers/scsi/hptiop.c:150:51: sparse: sparse: dereference of noderef expression
   drivers/scsi/hptiop.c:150:51: sparse: sparse: dereference of noderef expression
--
>> drivers/tty/serial/mcf.c:513:30: sparse: sparse: Using plain integer as NULL pointer
--
   drivers/video/fbdev/imsttfb.c:1521:30: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1521:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char [usertype] * @@
   drivers/video/fbdev/imsttfb.c:1521:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/imsttfb.c:1521:27: sparse:     got unsigned char [usertype] *
   drivers/video/fbdev/imsttfb.c:1530:27: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/video/fbdev/imsttfb.c:1542:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned char [usertype] *cmap_regs @@
   drivers/video/fbdev/imsttfb.c:1542:20: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/imsttfb.c:1542:20: sparse:     got unsigned char [usertype] *cmap_regs
   drivers/video/fbdev/imsttfb.c:1561:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned char [usertype] *cmap_regs @@
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     got unsigned char [usertype] *cmap_regs
   drivers/video/fbdev/imsttfb.c:1363:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1364:16: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/mtd/nand/raw/nand_base.c:3485:43: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/mtd/nand/raw/nand_base.c:3620:16: sparse: signed value source
   drivers/mtd/nand/raw/nand_base.c:4371:43: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/mtd/nand/raw/nand_base.c:4429:16: sparse: signed value source
--
   drivers/video/fbdev/riva/fbdev.c:484:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:484:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:484:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:484:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:485:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:485:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:485:14: sparse: sparse: cast to restricted __le16
   drivers/video/fbdev/riva/fbdev.c:485:14: sparse: sparse: cast to restricted __le16
>> drivers/video/fbdev/riva/fbdev.c:2062:42: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __iomem *addr @@     got unsigned int volatile [noderef] [usertype] __iomem *[usertype] PRAMIN @@
   drivers/video/fbdev/riva/fbdev.c:2062:42: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/riva/fbdev.c:2062:42: sparse:     got unsigned int volatile [noderef] [usertype] __iomem *[usertype] PRAMIN
   drivers/video/fbdev/riva/fbdev.c:2095:34: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __iomem *addr @@     got unsigned int volatile [noderef] [usertype] __iomem *[usertype] PRAMIN @@
   drivers/video/fbdev/riva/fbdev.c:2095:34: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/riva/fbdev.c:2095:34: sparse:     got unsigned int volatile [noderef] [usertype] __iomem *[usertype] PRAMIN
--
>> drivers/video/fbdev/nvidia/nvidia.c:1434:17: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __iomem *addr @@     got unsigned int volatile [noderef] [usertype] __iomem *[assigned] REGS @@
   drivers/video/fbdev/nvidia/nvidia.c:1434:17: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/nvidia/nvidia.c:1434:17: sparse:     got unsigned int volatile [noderef] [usertype] __iomem *[assigned] REGS
>> drivers/video/fbdev/nvidia/nvidia.c:1452:20: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __iomem *addr @@     got unsigned int volatile [noderef] [usertype] __iomem *REGS @@
   drivers/video/fbdev/nvidia/nvidia.c:1452:20: sparse:     expected void [noderef] __iomem *addr
   drivers/video/fbdev/nvidia/nvidia.c:1452:20: sparse:     got unsigned int volatile [noderef] [usertype] __iomem *REGS
--
>> drivers/pci/controller/pcie-mediatek.c:408:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:408:40: sparse:     expected void *address
   drivers/pci/controller/pcie-mediatek.c:408:40: sparse:     got void [noderef] __iomem *
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse:     expected void *address
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse:     got void [noderef] __iomem *
--
   drivers/scsi/aic7xxx/aic79xx_osm.c:2261:16: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2261:16: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2261:16: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2261:16: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2280:37: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2280:37: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2280:37: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:2280:37: sparse: sparse: cast to restricted __le16
>> drivers/scsi/aic7xxx/aic79xx_osm.c:1346:45: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void [noderef] __iomem *addr @@     got unsigned char volatile [noderef] [usertype] __iomem *maddr @@
   drivers/scsi/aic7xxx/aic79xx_osm.c:1346:45: sparse:     expected void [noderef] __iomem *addr
   drivers/scsi/aic7xxx/aic79xx_osm.c:1346:45: sparse:     got unsigned char volatile [noderef] [usertype] __iomem *maddr
   drivers/scsi/aic7xxx/aic79xx_osm.c:1765:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:1765:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:1765:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/aic7xxx/aic79xx_osm.c:1765:17: sparse: sparse: cast to restricted __le16

vim +922 lib/kunit/test.c

3d6e44623841c8b Jeremy Kerr        2022-07-09  909  
3d6e44623841c8b Jeremy Kerr        2022-07-09  910  static void kunit_module_exit(struct module *mod)
3d6e44623841c8b Jeremy Kerr        2022-07-09  911  {
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  912  	struct kunit_suite_set suite_set = {
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  913  		mod->kunit_suites, mod->kunit_suites + mod->num_kunit_suites,
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  914  	};
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  915  	const char *action = kunit_action();
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  916  
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  917  	/*
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  918  	 * Check if the start address is a valid virtual address to detect
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  919  	 * if the module load sequence has failed and the suite set has not
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  920  	 * been initialized and filtered.
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  921  	 */
a1af6a2bfa0cb46 Marco Pagani       2024-01-10 @922  	if (!suite_set.start || !virt_addr_valid(suite_set.start))
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  923  		return;
a1af6a2bfa0cb46 Marco Pagani       2024-01-10  924  
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  925  	if (!action)
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  926  		__kunit_test_suites_exit(mod->kunit_suites,
18258c60f8a74b9 Janusz Krzysztofik 2023-08-07  927  					 mod->num_kunit_suites);
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  928  
b67abaad4d25b5d Janusz Krzysztofik 2023-08-07  929  	kunit_free_suite_set(suite_set);
3d6e44623841c8b Jeremy Kerr        2022-07-09  930  }
3d6e44623841c8b Jeremy Kerr        2022-07-09  931  

:::::: The code at line 922 was first introduced by commit
:::::: a1af6a2bfa0cb46d70b7df5352993e750da6c79b kunit: run test suites only after module initialization completes

:::::: TO: Marco Pagani <marpagan@redhat.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
