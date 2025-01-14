Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ECC1FECC8
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736890008; cv=none; b=jrqcYeG93LI/HWdCiJRy+uqmlLXtRa6Bl2P6C0INJv8flLL9BmF82b99iIgEWvDoS9/jgPFy6cWUE31QX9IX66z2fRyyA8qv7n2xYsV/TeyHvmuEgLOBGY+y/nvMOkmzmkuvN6wSSyBwGhqmKT6V7SZLYOwgobzNJFgJ2E2A8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736890008; c=relaxed/simple;
	bh=154lv4mq2U5nWSIQfTRJvKH443Vw46deLqnqMSfzsN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVAvaGjUPLyqCwQNbSYK+wmFjTp40Lq/swMvyxKsMnfMrpZtFeIX8/nwgzvXGIKWfzr3zfM1wxkE2XdFcCM9SLvnl10S8HFMJda4TbFaqvBJMFIO8SCjH4SQFZcQZDoTPmuJkoOAfO01Q5srqxh5pM+vRCgp+y7doErVwnC8HfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPg1TqmG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPg1TqmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736890006; x=1768426006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=154lv4mq2U5nWSIQfTRJvKH443Vw46deLqnqMSfzsN8=;
  b=cPg1TqmGmASDVD65GDjqxDjnSbrSsqpRF/18Q6atXZ9MxWsJQCa8W3ag
   PYhqgOb7lX4HDz/8cLfRkKw/0vAN9ZzxknASbziGHOdG5ktVmDA/Gtn+l
   3Np/1omv2mbHzXHf8nVr7OtX2iqELlkIsG+W93Z5Pv2GeG7Y3991WqBfh
   7sa3gpTEraFzEAqtYy7MurGkL5diF/k/SmoYhTYjTSdTTdAdo6reU/Cc4
   tQ5KHVLZN/SKDs29v1wIzT47rbViiSAyP7xCe5RuGFuSXgsS04IyO8jiU
   Ad0AYRblI/IwnOL6lE3sz0o7TIdh4lhl+TZLGAvHRYvrZXAh6maG8s0uL
   g==;
X-CSE-ConnectionGUID: wOPWhvqOTPq8l+QLR7sPXw==
X-CSE-MsgGUID: r1rEuwkcR3+MrLh2vBEXDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37435914"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37435914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 13:26:45 -0800
X-CSE-ConnectionGUID: 59aQS4aZSpe3luYG8DBUWw==
X-CSE-MsgGUID: 83SYQWLtRCWsUjf2YsNYtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="104770610"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jan 2025 13:26:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXoQs-000P42-1k;
	Tue, 14 Jan 2025 21:26:42 +0000
Date: Wed, 15 Jan 2025 05:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/maps/map_funcs.o:(.xiptext+0x2f): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail:
 __sanitizer_cov_trace_const_cmp4
Message-ID: <202501150516.7HuIbzuo-lkp@intel.com>
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
head:   7f5b6a8ec18e3add4c74682f60b90c31bdf849f2
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-r123-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150516.7HuIbzuo-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250115/202501150516.7HuIbzuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501150516.7HuIbzuo-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_cmdset_0002.c:(.xiptext+0x121a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x1226): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c88)
   cfi_cmdset_0002.c:(.xiptext+0x1230): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x124f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x125c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x126e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xba8)
   cfi_cmdset_0002.c:(.xiptext+0x127a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x1288): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x12a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x12b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x12c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x12e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x1313): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x135f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x136b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x139c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x13a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c88)
   cfi_cmdset_0002.c:(.xiptext+0x13b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x13ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x13d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x13eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1402): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x1411): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1420): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1430): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x143e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x144d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x145f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x147b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x148a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x149c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x14c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x14ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x150f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x1527): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33c0)
   cfi_cmdset_0002.c:(.xiptext+0x1538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x1547): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1bf4)
   cfi_cmdset_0002.c:(.xiptext+0x1553): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x1560): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x156e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1579): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x158c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x15ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c88)
   cfi_cmdset_0002.c:(.xiptext+0x15f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1607): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x161b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1630): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x165a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x166e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x16b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x16bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x16c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x16ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x16f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x16fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x1707): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x170f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x1718): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x1736): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   cfi_cmdset_0002.c:(.xiptext+0x1743): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x176c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x177a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1793): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x17a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x17b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xba8)
   cfi_cmdset_0002.c:(.xiptext+0x17be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x17cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x17ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x17fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x180e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x182c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x183e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x1848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1867): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x187f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1898): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   cfi_cmdset_0002.c:(.xiptext+0x18a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0x18b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x18c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x18de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x18f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x1900): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   cfi_cmdset_0002.c:(.xiptext+0x190a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1ae8)
   cfi_cmdset_0002.c:(.xiptext+0x1912): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1918): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/maps/map_funcs.o:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/maps/map_funcs.o:(.xiptext+0x2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/maps/map_funcs.o:(.xiptext+0x3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   map_funcs.c:(.xiptext+0x54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   map_funcs.c:(.xiptext+0x72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   map_funcs.c:(.xiptext+0xaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0xc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0xe3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0xe9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x107): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   map_funcs.c:(.xiptext+0x11f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x138): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   map_funcs.c:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x170): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   map_funcs.c:(.xiptext+0x182): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   map_funcs.c:(.xiptext+0x18e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x1a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x1be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   map_funcs.c:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   map_funcs.c:(.xiptext+0x1cd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x1f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   map_funcs.c:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x226): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   map_funcs.c:(.xiptext+0x22c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x23b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   map_funcs.c:(.xiptext+0x24a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
