Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50D2D8395
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365332; cv=none; b=WVy1GUM+8/IIq3s9QgDId854DB6JZbjPxUhLYYZ2piFUt6AaB1zmzpm5kJ83Euz0YzRr787+ff/kQNYqN66WvcnDuxxWVLTDq9UhKy51JuxzZvmgcXj7l/rRf9DnBA1Di5sdepaxXTO3DgZykfNCGNcKOHRPKAXnZK4FE4e0ow8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365332; c=relaxed/simple;
	bh=tMU5EWqBDYNt20lomyaUyi6+T3SXwm0D7lRfPWAHFLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrjO8P0AfDtZ6sTOKAbY/EBQyfcJJISBRjeZkNs8fmZGumfz9xBfEx7zi5hfG+2PCyzI056QwDjSZ1jMRLnl4DOXZCinZI/M/6xTQ6vy2FWyv8cUwEclTNT6eON30/AXV8HxbpXXjV9se6wWzgZyFq7F4ITQCNZBK9IguuIV5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7gdeOAg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7gdeOAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753365330; x=1784901330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tMU5EWqBDYNt20lomyaUyi6+T3SXwm0D7lRfPWAHFLw=;
  b=L7gdeOAgxCEWBYnOVmtCbfhLBSIm81y2MRRb5wXzZiUhj5Bz0YyPSius
   mNSC2nUR3dyDPRgd+kMaoFL7KiOJ1ca9whMFYkOMLejZX2Vodxf/Jvqx0
   gNlsiRrv3I4l/fCRgOm3aqKE0OKliEA+RXDn6ocPKEnxf6qExlLWQ0Swe
   47XV0tXoLG6aKMw8zp1v9RRauIRhJkht8Y0Y3iBFdjTdvPruDt+lW7W6L
   kxRsD/JPImxiyvEwhVR+r/FQ93e9pTT+SAAEKwiJNPl3v9+cA9zISxOxL
   q5Cg2o0RU/2fiRGliRN2V/H3tuFa4o/ucbxfwDq6ubj1iBm7azUtuPh45
   Q==;
X-CSE-ConnectionGUID: Pdfu+Y36RzWb+2km5LaDuw==
X-CSE-MsgGUID: 9hha8X1bQWOWnnhsR2HgdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67118730"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="67118730"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 06:55:30 -0700
X-CSE-ConnectionGUID: qb0zcBbGQ8OdPR41ljLT7w==
X-CSE-MsgGUID: kRgXXJUiStyJcZzcz+fNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="159490698"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2025 06:55:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uewPu-000KV1-1y;
	Thu, 24 Jul 2025 13:55:26 +0000
Date: Thu, 24 Jul 2025 21:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: map_funcs.c:(.xiptext+0xf): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: memcpy_toio
Message-ID: <202507242106.NuiqCw5H-lkp@intel.com>
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
head:   25fae0b93d1d7ddb25958bcb90c3c0e5e0e202bd
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-r123-20250724 (https://download.01.org/0day-ci/archive/20250724/202507242106.NuiqCw5H-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250724/202507242106.NuiqCw5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507242106.NuiqCw5H-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0002.c:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x714): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x830)
   cfi_cmdset_0002.c:(.xiptext+0x732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0x77c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x847): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x850): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x856): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x863): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x86c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x8a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1220)
   cfi_cmdset_0002.c:(.xiptext+0x8bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x8e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x92f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x798)
   cfi_cmdset_0002.c:(.xiptext+0x93a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x94b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x96f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x9aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x9b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x9bd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x9c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x9fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xa1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1220)
   cfi_cmdset_0002.c:(.xiptext+0xa46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0xa76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xab0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xb06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb19): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xb24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xb6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0xb9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1220)
   cfi_cmdset_0002.c:(.xiptext+0xbc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0xc36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xc76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xc9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcaf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xcf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0xd2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0xd4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xdf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xe08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xe16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x830)
   cfi_cmdset_0002.c:(.xiptext+0xe36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0xe8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xea0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xeb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xecb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xedf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xeef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xf52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xf5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xf60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xf6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xf76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xfae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1220)
   cfi_cmdset_0002.c:(.xiptext+0xfc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xfec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1007): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x103a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x798)
   cfi_cmdset_0002.c:(.xiptext+0x1046): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1057): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x1090): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x109e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x830)
   cfi_cmdset_0002.c:(.xiptext+0x1117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x64)
   cfi_cmdset_0002.c:(.xiptext+0x1132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x114b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x119a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1204): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1217): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x128e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0x129e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x12b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x12e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x12f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1323): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1362): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x798)
   cfi_cmdset_0002.c:(.xiptext+0x136b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x137e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_to':
>> map_funcs.c:(.xiptext+0xf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   map_funcs.c:(.xiptext+0x42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   map_funcs.c:(.xiptext+0x8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   map_funcs.c:(.xiptext+0xa1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0xaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0xba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   map_funcs.c:(.xiptext+0xd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
>> map_funcs.c:(.xiptext+0xe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   map_funcs.c:(.xiptext+0x13a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   map_funcs.c:(.xiptext+0x151): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0x15a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   map_funcs.c:(.xiptext+0x173): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
