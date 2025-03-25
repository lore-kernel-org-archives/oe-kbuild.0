Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C3205E11
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742937369; cv=none; b=XqZozwpqsS1N7qUgZga/9RjZoRyncTAavAnjmkUPh9XyGv44eE18chkNBcqGCQeylcVG3KR34hJq6x+DagA/9qMhICarE6Nq+w1xfVWRALVDB6yue1ddRvNCNUPxAnxSTCU5m1RLx6s1+4/o4q7fiptMNRO5rBbbSWcrZoFkmes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742937369; c=relaxed/simple;
	bh=um1i78t70JQN8Vw+ar1F7wRXwxjaX50d9CNsf+wczJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GKVREprlUYSXCurWlvGs7EVThcbaU1+O5BCybjcD7yMlBEiVdr5LzRwv1Hf9F4PBc2vBIqHTz90XioGFt9JKEy7lBJ9CFLc2L5w36+zA6UiaOlJFPJBzs23jm896DtCyCt/51Pgqwv7VDmgmOXBi5VmSLGZtIZrwh/DECudJ6c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iR668CB/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iR668CB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742937366; x=1774473366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=um1i78t70JQN8Vw+ar1F7wRXwxjaX50d9CNsf+wczJM=;
  b=iR668CB/OEqYDxO+u79upZDUkvSL/WPUofFtWNKoRnVLOGv0XNf/o63e
   KjMCt7IuWOYsnn2kpUXAnw+NOm7/TxullLVwKFzpwfE6SyZJf1Dy3+Arh
   fQJeiYI8AyvVvS4cC2KZ4blVdNKtRiF9tzopnugqBgApXRgPJtlrKjdNk
   1w8SHiNlllMS2sngqfrwGdhI8cY9JRc1e3R7Ga027eN9G25pb7lZd5O0A
   uf8PVyOyyRGvpFEK5d27CDboQC1FDo1hq34mpI50qvGLzcC3reFbGQ9FV
   AF/GhsFiluDqjqcIbmEUNy/UAjw/LWh6GiJZGElODS7U5CTKU3NfAVgZX
   g==;
X-CSE-ConnectionGUID: +STW0KtURWyDilbo+cTHUA==
X-CSE-MsgGUID: /Y68KTc9T7qIfzDOvVoC2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48082158"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="48082158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 14:16:05 -0700
X-CSE-ConnectionGUID: Sef/FgH/RzKwRs0QosYxXg==
X-CSE-MsgGUID: fwF5bD84QMq/diDpZ3WurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="161716299"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2025 14:16:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txBct-0005Bo-0b;
	Tue, 25 Mar 2025 21:16:00 +0000
Date: Wed, 26 Mar 2025 05:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/mtd/map.h:432:(.xiptext+0x182): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
Message-ID: <202503260511.BtJk5aCb-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d09a9449ecd9a2b9fdac62408c12ee20b6307d2
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   5 months ago
:::::: branch date: 56 minutes ago
:::::: commit date: 5 months ago
config: xtensa-randconfig-r123-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260511.BtJk5aCb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250326/202503260511.BtJk5aCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503260511.BtJk5aCb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0x77c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2022:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2033:(.xiptext+0x830): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x85c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2041:(.xiptext+0x86a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2041:(.xiptext+0x88f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2044:(.xiptext+0x8a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2045:(.xiptext+0x8d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2058:(.xiptext+0x952): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2062:(.xiptext+0x95a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2081:(.xiptext+0x9be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2081:(.xiptext+0x9d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x9e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3080)
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x9fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2088:(.xiptext+0xa0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2092:(.xiptext+0xa40): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2092:(.xiptext+0xa5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2513:(.xiptext+0xab2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2516:(.xiptext+0xad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0xae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2519:(.xiptext+0xafb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2524:(.xiptext+0xb10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2525:(.xiptext+0xb24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2533:(.xiptext+0xb96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xb9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xba5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xbb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2535:(.xiptext+0xbbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2541:(.xiptext+0xc1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2550:(.xiptext+0xc6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0xc9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2574:(.xiptext+0xd0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2574:(.xiptext+0xd12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2580:(.xiptext+0xd3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2575:(.xiptext+0xd53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0xd67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2581:(.xiptext+0xd7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2596:(.xiptext+0xdbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:2603:(.xiptext+0xdde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdf1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2605:(.xiptext+0xe12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xe57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xe62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xe92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0xf52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0xf6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0xfba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1709:(.xiptext+0xff7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0x105e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x107a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x109a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1776:(.xiptext+0x112e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1777:(.xiptext+0x1144): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x1158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3080)
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x1166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1782:(.xiptext+0x1174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1790:(.xiptext+0x11a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1795:(.xiptext+0x11c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1800:(.xiptext+0x1217): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1804:(.xiptext+0x1232): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1807:(.xiptext+0x1246): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1812:(.xiptext+0x125b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1812:(.xiptext+0x1270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1812:(.xiptext+0x1284): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1812:(.xiptext+0x1298): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0x1302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0x130b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0x1311): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2416:(.xiptext+0x131e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2416:(.xiptext+0x132a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2430:(.xiptext+0x1386): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2433:(.xiptext+0x13d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0x140b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2443:(.xiptext+0x1476): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2443:(.xiptext+0x147e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o:(.xiptext+0x26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:426:(.xiptext+0x9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   drivers/mtd/maps/map_funcs.c:21:(.xiptext+0xc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   include/linux/mtd/map.h:398:(.xiptext+0x132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:397:(.xiptext+0x13b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   include/linux/mtd/map.h:406:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
>> drivers/mtd/maps/map_funcs.c:24:(.xiptext+0x16f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
>> include/linux/mtd/map.h:432:(.xiptext+0x182): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   include/linux/mtd/map.h:433:(.xiptext+0x196): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
>> include/linux/mtd/map.h:435:(.xiptext+0x1a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio


vim +432 include/linux/mtd/map.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  429  
^1da177e4c3f41 Linus Torvalds 2005-04-16  430  static inline void inline_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
^1da177e4c3f41 Linus Torvalds 2005-04-16  431  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @432  	if (map->cached)
^1da177e4c3f41 Linus Torvalds 2005-04-16  433  		memcpy(to, (char *)map->cached + from, len);
^1da177e4c3f41 Linus Torvalds 2005-04-16  434  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16 @435  		memcpy_fromio(to, map->virt + from, len);
^1da177e4c3f41 Linus Torvalds 2005-04-16  436  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  437  

:::::: The code at line 432 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
