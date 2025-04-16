Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DD822FE1F
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Apr 2025 22:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840978; cv=none; b=qz2lBzJHKRPe1q3oTjxcN+L97MEf4DKON5J7bfZD2DNw3T8lbd5RmopiVLh9bYDp+KSMbup+kJt+IHP0KFaIafxhlZI9Mgwc9mo2LEuLhSDbxeXEKZnUkqB04azVlPA/l8MTG8u+lQAMm6Tci7z9wCU8W5e1TQd+q9f8aSxAzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840978; c=relaxed/simple;
	bh=wYtyJWjkedygKxSb3tdUFn5PZgMhtsey36XNt7b9HD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouk8MUo91D7euNLDhKjCoSaBHivOOEd9GTh6e6kJ4b8I1w9ZC4yLvGdgTbBJTvp7V91QC9WFYKeJrUZOIjQELIQ5QQyPEsRzwp+geFqHCfBw7cawpoo4QDGTJ1NzGz3LwqA/LYECKTAkdLsN+HoqTK4lp9LESfAUQtozaTqOUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAcc97gx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAcc97gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744840974; x=1776376974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYtyJWjkedygKxSb3tdUFn5PZgMhtsey36XNt7b9HD8=;
  b=mAcc97gx2C4z6i1ivyp3joCTg5x1kmmsq2iuojbAVOZH7DOQMK8alnH3
   Qoi47KpWBWeqRiN4uo0zKdg4/sEUhNMe1uFQpgOGE9gzU2Lwkv3QQs6L0
   mR11mcpckIlMR3SBNS5CNerL+/ehsR+ih/pUCnrJ0RjTIWjVQF2NEz8za
   /1cosjxMG0H+DonqwfCUrlHplNXNs9thY32JsYQEWmROeQFxcL0l0wWEG
   4VPD8n2HYn+icfXpg5RQM5OvaSPu6vfZ+6J8WF83lMuMXHfHWK/LT4bJ7
   Xk21WIyD9wcP110D3rD+Cruhw0df8Y0Zw1K4p5lNRDrNTcK4xvdFggf9Q
   w==;
X-CSE-ConnectionGUID: p+nl+A4nQH6B0bMmEtV7hA==
X-CSE-MsgGUID: HVuyvrKRTBaMDdBS2b7VuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46578747"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="46578747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 15:02:54 -0700
X-CSE-ConnectionGUID: axcPEYewTmWMSjLcFfqXcg==
X-CSE-MsgGUID: 3/MIhzg/S2uKHvuJhYu09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="131144187"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2025 15:02:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5AqI-000KMG-31;
	Wed, 16 Apr 2025 22:02:50 +0000
Date: Thu, 17 Apr 2025 06:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: map_funcs.c:(.xiptext+0xf0): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: memcpy_fromio
Message-ID: <202504170552.wwxNCnCH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Julian Vetter <jvetter@kalrayinc.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Yann Sionneau <ysionneau@kalrayinc.com>

Hi Julian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c62f4b82d57155f35befb5c8bbae176614b87623
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-r051-20250416 (https://download.01.org/0day-ci/archive/20250417/202504170552.wwxNCnCH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170552.wwxNCnCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504170552.wwxNCnCH-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0002.c:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x422): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x44a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x968)
   cfi_cmdset_0002.c:(.xiptext+0x4ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x404)
   cfi_cmdset_0002.c:(.xiptext+0x4c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb98)
   cfi_cmdset_0002.c:(.xiptext+0x4cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x504): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc2c)
   cfi_cmdset_0002.c:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x52b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3a8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x570): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc2c)
   cfi_cmdset_0002.c:(.xiptext+0x590): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x20fc)
   cfi_cmdset_0002.c:(.xiptext+0x5ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x5cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2300)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0x5e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x60f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x633): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x64a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x20fc)
   cfi_cmdset_0002.c:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x6d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb98)
   cfi_cmdset_0002.c:(.xiptext+0x6d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x71e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x20dc)
   cfi_cmdset_0002.c:(.xiptext+0x740): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x750): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc2c)
   cfi_cmdset_0002.c:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x790): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2300)
   cfi_cmdset_0002.c:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0x7f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x804): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x873): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x87b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x881): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x890): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x89a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x8d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x968)
   cfi_cmdset_0002.c:(.xiptext+0x8f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x91a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x952): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb98)
   cfi_cmdset_0002.c:(.xiptext+0x95a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x992): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0xa1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xa31): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xa3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xa7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xa8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2300)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0xaa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x968)
   cfi_cmdset_0002.c:(.xiptext+0xb1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2300)
   cfi_cmdset_0002.c:(.xiptext+0xb64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xbbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0xc1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0xc30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x20dc)
   cfi_cmdset_0002.c:(.xiptext+0xc3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xc4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc2c)
   cfi_cmdset_0002.c:(.xiptext+0xc6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xc8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2300)
   cfi_cmdset_0002.c:(.xiptext+0xca8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0xce8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd77): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xd7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xd85): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xd94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xd9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xdd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x968)
   cfi_cmdset_0002.c:(.xiptext+0xdf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xe1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb98)
   cfi_cmdset_0002.c:(.xiptext+0xe60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   map_funcs.c:(.xiptext+0x51): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0x5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   map_funcs.c:(.xiptext+0xb1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0xba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0xe2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
>> map_funcs.c:(.xiptext+0xf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
>> map_funcs.c:(.xiptext+0x10f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
