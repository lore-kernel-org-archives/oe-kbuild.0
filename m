Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F71EFFB7
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470626; cv=none; b=fJsuF3Yow70dNtuvEMTE685vxycI/DcHUytDzS6NpcAd2hy0yeba/hjiyyE6zXzT6egaW70dXuGEIRf28wsWTgdedCO6o5x9YE5l6bPOGSeQpAygPdHno5JIF8969Ol5PDF5OWfU8ruYqhYnBffYta2F1vWRivuVMami3h4zW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470626; c=relaxed/simple;
	bh=WlIL8jMEVqca4ATi79AtU/W6FfEWQO+O4QUnDGq2zus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VN6TYKJGX7qKsMEOHdS9hPnWQzLFNEv6Wez7qiXO6X5HhOjdR+OYvKaC3Y4un6kgWqAX0ZrMOxSJ6kD+aJsJ3TGQPESswXmCwirQ1LKmwB1SgrCr6bbKEpK/W9zs4YPTJJKWfL458e+mUVFSUwopjthYiPborSrJbe74Fv89GPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd2s3slp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd2s3slp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770470626; x=1802006626;
  h=date:from:to:cc:subject:message-id;
  bh=WlIL8jMEVqca4ATi79AtU/W6FfEWQO+O4QUnDGq2zus=;
  b=Rd2s3slpIKhQY3+HZyNixS5pnt55c7v4/G3UZzFi5cLy+X62UgA36b3n
   cb234rB/zl8/yhDxAdeviuDRXwIGbmT4xyqTVs0q0wPvXgNxc+PViie4m
   FZeeiawYQmG4ka7xSnZXPT0w8sVYph7GsrXTNHGcgfkZlcZI3pBArSsx3
   +NE2loaW1c9xLrFdv94JoQ7Mu+GVQ4zAwJnVjrP6ZzG1i/i5KBqJ32Xeq
   pqU/yFM4plJfJCbokyrDucjRShp87d7czy1L/OIEpirDY6yY1NYt17x6Q
   76SGdH3FnYY6wGofpatJJuVehaUdeSJTgMcfJJwMnaq42jW2lHTK96nOq
   A==;
X-CSE-ConnectionGUID: xyLGo8IiRPeZIUnYHg5tmA==
X-CSE-MsgGUID: 5cLOiFYhTnmbeOw0PCzkEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71839187"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71839187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:23:46 -0800
X-CSE-ConnectionGUID: k5wMINXaS7O2BP7r0u+UhQ==
X-CSE-MsgGUID: D7CH91XWSC2DrOEMkOfyJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210216493"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2026 05:23:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voiHm-00000000lfI-1BXd;
	Sat, 07 Feb 2026 13:23:42 +0000
Date: Sat, 07 Feb 2026 21:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0xb34): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: dump_stack
Message-ID: <202602072100.TScBOsam-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ye Bin <yebin10@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Ye,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 6c2e6e2c1af1809d1d9cdbd50ac80f54f5995bdb dynamic_debug: add support for print stack
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-r053-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072100.TScBOsam-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072100.TScBOsam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602072100.TScBOsam-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0002.c:(.xiptext+0x44b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x45e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x4b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x4be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0x4cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1bd4)
   cfi_cmdset_0002.c:(.xiptext+0x4d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x4e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x543): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x554): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x5a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x5db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x5e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x5f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x607): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x614): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x621): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x62f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x63e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x651): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x65a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x66d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x676): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x685): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x68b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x98)
   cfi_cmdset_0002.c:(.xiptext+0x691): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x6fd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x715): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x71b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x70)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x721): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x730): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x756): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x767): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x778): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x787): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x798): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7d9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x7ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x807): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x816): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x823): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19b4)
   cfi_cmdset_0002.c:(.xiptext+0x83c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x851): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x87a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x882): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x888): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x892): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x89a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x8b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x8c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x8d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x8e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x8f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x8fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x924): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x930): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x939): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x94a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x959): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x964): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x975): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x983): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x98e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x99a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x9b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xabc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xac5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xad8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1bd4)
   cfi_cmdset_0002.c:(.xiptext+0xaf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xaf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb01): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xb2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> cfi_cmdset_0002.c:(.xiptext+0xb34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xb3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xb9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xbaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xbb5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xbbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x70)
   cfi_cmdset_0002.c:(.xiptext+0xbc1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xbd1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xbea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xca2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xcbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xcc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xccd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xcdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xce3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xcec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xcf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd11): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2ffc)
   cfi_cmdset_0002.c:(.xiptext+0xd40): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xd64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xd88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdb5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdd5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xdf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x98)
   cfi_cmdset_0002.c:(.xiptext+0xdfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a8c)
   cfi_cmdset_0002.c:(.xiptext+0xe4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xe54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xe9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0xeac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xeb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xee3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xeee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xef4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xf0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xf14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xf50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2ffc)
   cfi_cmdset_0002.c:(.xiptext+0xf80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xf94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0xfe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1002): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x1010): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1bd4)
   cfi_cmdset_0002.c:(.xiptext+0x101c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1024): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x102d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1038): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1045): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x104e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1065): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x106e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1095): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x109b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0xc0)
   cfi_cmdset_0002.c:(.xiptext+0x10a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x10ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x10da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x10ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x110c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x111a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x112a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1145): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x114e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
