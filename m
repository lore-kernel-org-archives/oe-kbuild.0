Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF2E29C351
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452122; cv=none; b=KYmnvqM69UPj63BS+tdPxcHUIaHdOBvkImUq9CUH4yXYAdQy/rv+5XeD9WKr94eBj6SaB7pyK+wp7c3+gKd7EAwldzjK4XurOKLwWwtt0c0SHNI2te2euMu9VEIVBx2tTNNKH0Zna1dptfEAf69n5P48UugYQfK01XIEdcqrcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452122; c=relaxed/simple;
	bh=vSzgMZdVekgdREKmm/JrexGKDu6IDqN6vdz4IbMGsdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWd09qmQd6GbNpFjm0M4rDfyA5Ybx6TXF7M1JAsJ/Wws9M8Qt6eXr0LiDYF6kTXsBzcsamG6sRxQLqtlMKZg6JHP3HzKfNq3CZhF9vXR/aYSPwBJFcOVg7iZwYqOq1lli7ZjeJDFCAxcNEpLMSKQx6bGtT+MALtktKf3z3Eyt6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nv7OLf5a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nv7OLf5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765452119; x=1796988119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSzgMZdVekgdREKmm/JrexGKDu6IDqN6vdz4IbMGsdI=;
  b=nv7OLf5aCnZz+Hl/Wf65k5TL43busZOPaWyJ3HJK3IdscFqpbJZcloTP
   E9bIZhxloMCL9c0f2YYy0z53HYoeP1wdxgfMUWq3g1fgCuSGvEYcyxYDh
   uexRvQaBxhD+sUCM6nryRiLHOnBZtCHEMIwYGc/E7m6fgMdxLY6wzULRM
   dtUZR8OEYKPOhF38cZ9O0Qx0B3RoiD2y9IyllZm8NP9Quof73Xz9l292g
   VpIfPDqAS7lHEgRSdkOxniSnVK6zXKjGAMD2kElEpw/ntvIoGWc4rn2wv
   JIAVBV/Q4JXayxJgZssneEfR3Ay2+7H9Vns46N0C5efCvbJBnsd9Knxp6
   w==;
X-CSE-ConnectionGUID: CWlQiVfCTBGdcszPR84UrQ==
X-CSE-MsgGUID: qY9TFZsITqagLF68SJBMyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78135508"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78135508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:21:59 -0800
X-CSE-ConnectionGUID: KtZsSBLhSoOZVQ1yyk0HkQ==
X-CSE-MsgGUID: i3FprgfQS1C3f+sWZ7L3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227427639"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 03:21:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTek7-000000004a9-12sh;
	Thu, 11 Dec 2025 11:21:55 +0000
Date: Thu, 11 Dec 2025 19:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13137/13171] drivers/ufs/core/ufs-rpmb.c:253:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512111919.zAJA7Ufs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: James Bottomley <James.Bottomley@HansenPartnership.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5ce74bc1b7cb2732b22f9c93082545bc655d6547
commit: 083143f26ea630c72c450fdd5bf2543dfdc8d772 [13137/13171] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
:::::: branch date: 9 hours ago
:::::: commit date: 10 days ago
config: xtensa-randconfig-r121-20251205 (https://download.01.org/0day-ci/archive/20251211/202512111919.zAJA7Ufs-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111919.zAJA7Ufs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111919.zAJA7Ufs-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0001.c:(.xiptext+0x74e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x78c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xea0)
   cfi_cmdset_0001.c:(.xiptext+0x794): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_read':
   cfi_cmdset_0001.c:(.xiptext+0x7f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x7fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x13b0)
   cfi_cmdset_0001.c:(.xiptext+0x82b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b40)
   cfi_cmdset_0001.c:(.xiptext+0x83e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x84f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x867): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x87a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x893): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x8a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x8ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x8ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x91e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x933): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x942): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x986): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x9ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x9c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x9e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xa03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xa12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xa37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xa4f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xa6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xa82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xea0)
   cfi_cmdset_0001.c:(.xiptext+0xa8b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0xa9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xaba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xea0)
   cfi_cmdset_0001.c:(.xiptext+0xac3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0xb57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xb76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x13b0)
   cfi_cmdset_0001.c:(.xiptext+0xba2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b40)
   cfi_cmdset_0001.c:(.xiptext+0xbb4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xbcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xbfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xc3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xc6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xc7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   cfi_cmdset_0001.c:(.xiptext+0xc94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xea0)
   cfi_cmdset_0001.c:(.xiptext+0xc9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0xcb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xcb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0xcd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xcdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xcf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xe0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xe23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xe32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x13b0)
   cfi_cmdset_0001.c:(.xiptext+0xe62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b40)
   cfi_cmdset_0001.c:(.xiptext+0xe80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xe8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xedb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xf50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xf8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   cfi_cmdset_0001.c:(.xiptext+0xf9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xfba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xfcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0xfea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x102a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a6c)
   cfi_cmdset_0001.c:(.xiptext+0x1043): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1056): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x109f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a6c)
   cfi_cmdset_0001.c:(.xiptext+0x10c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x10d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1ac0)
   cfi_cmdset_0001.c:(.xiptext+0x10df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x110c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x1158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x119c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x11aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x11ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x1206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1232): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x1242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x125a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xea0)
   cfi_cmdset_0001.c:(.xiptext+0x1263): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x128a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x1290): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x12a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x12b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x12cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x12da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x1311): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x131c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b40)
   cfi_cmdset_0001.c:(.xiptext+0x132c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x133a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0001.c:(.xiptext+0x1354): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1363): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
>> (.exception.text+0x247): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0xfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x13a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x14f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x164): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x188): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x22e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0x2f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x342): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_util.c:(.xiptext+0x350): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_util.c:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x3a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_util.c:(.xiptext+0x3c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_util.c:(.xiptext+0x3ed): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   map_funcs.c:(.xiptext+0x22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   map_funcs.c:(.xiptext+0x46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   map_funcs.c:(.xiptext+0x5d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0x66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0x8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
   map_funcs.c:(.xiptext+0x9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   map_funcs.c:(.xiptext+0xde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   map_funcs.c:(.xiptext+0xf5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0xfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0x10a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   map_funcs.c:(.xiptext+0x12b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   drivers/mtd/hyperbus/hbmc-am654.o: in function `am654_hbmc_calibrate':
   hbmc-am654.c:(.text+0xd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_present
   hbmc-am654.c:(.text+0xef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off

sparse warnings: (new ones prefixed by >>)
   drivers/ufs/core/ufs-rpmb.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: bad integer constant expression
   drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/ufs/core/ufs-rpmb.c:254:1: sparse: sparse: bad integer constant expression
   drivers/ufs/core/ufs-rpmb.c:254:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +253 drivers/ufs/core/ufs-rpmb.c

b06b8c421485e0 Bean Huo 2025-11-08  252  
b06b8c421485e0 Bean Huo 2025-11-08 @253  MODULE_LICENSE("GPL v2");

:::::: The code at line 253 was first introduced by commit
:::::: b06b8c421485e0e96d7fd6aa614fb0b6f2778a03 scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices

:::::: TO: Bean Huo <beanhuo@micron.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
