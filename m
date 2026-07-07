Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197E800
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 00:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783382894; cv=none; b=t2FJSaNCljU9K/B2PHPJSsaxTcIWiiMaHioOkSNwrOdms6V3W8d7Yh+XeNZAMAHZ2kmzNDQMB3aDkgdL0k5uEy5Iwo856uxblIXoUNy00NPiXJvjiUjNVHQFmtWb9nhLd9WNuOWbJWiv/hwq/zIvpVLb2v4/KeHZil+/2JBwmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783382894; c=relaxed/simple;
	bh=5GphsDroBMFQY+TEFCBlCCpFaH1mE6wwZDRfJaT+ZUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/jToEw1FsoBi4fbClqzcIjDyUFSQTnmL5a7rbPeWBP+igHgUb84rxFM6/7ajy2GO2XxkPRJDuq/9jJISpXtGdD1jdPhO2urk9yy4p2FJRVO0CxH7OT8qs/itadNLISP16KlqAIaC2Mf0GnW2Q22J4ryFD3FQlQ8eVLtoPZapYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dq/OUqY9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq/OUqY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783382892; x=1814918892;
  h=date:from:to:cc:subject:message-id;
  bh=5GphsDroBMFQY+TEFCBlCCpFaH1mE6wwZDRfJaT+ZUg=;
  b=dq/OUqY9RMsu6fKqibgUrI2ZUa/7slikpAUVoneXB+opZTuuy2PsE5rS
   MDAUH7jZpOPQXF6na/PTCiy0XZvOL9W37+m0QXrsrCNq81uyYm+JXwqj+
   Vqm3rWuQ5mqafKXieV1hReS/ca2gxbMyF0nxpskM0SkMXxKlsiAHTKNaO
   cxgsuGMCnSDe4PLFfXIRSMzWR8Hj1lC7YyRzgB0vu4P4GGu69BIU30ind
   me3WTyBVlbwXhiH8/u4Sz/WhaxC26CcdASlmv8NKifUtgaqTvs4J22NC+
   SLSKAAvH9/4gZXEE6HaDPphrv1nK2E85HM8l+dbpuRtU+QfT7VuQQ8ISs
   Q==;
X-CSE-ConnectionGUID: P8upmAcvSgiNCLBx4GRJPQ==
X-CSE-MsgGUID: UPttKg7wQda2g3r9tHv/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95405822"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="95405822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 17:08:12 -0700
X-CSE-ConnectionGUID: nduP21ZWTl2AxOmKGIvf+g==
X-CSE-MsgGUID: RUSfBO3iRk68nlO0G04DpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="258767890"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2026 17:08:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgtM8-00000000Etf-26Yl;
	Tue, 07 Jul 2026 00:08:08 +0000
Date: Tue, 07 Jul 2026 08:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/instrumented.h:62:(.xiptext+0x580): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 warn_slowpath_fmt
Message-ID: <202607070717.X5nBqsrv-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Finn Thain <fthain@linux-m68k.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: xtensa-randconfig-r132-20260705 (https://download.01.org/0day-ci/archive/20260707/202607070717.X5nBqsrv-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070717.X5nBqsrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80047d84eed2 ("atomic: add alignment check to instrumented atomic operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607070717.X5nBqsrv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0xa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbc)
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0xc5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
   include/linux/slab.h:961:(.xiptext+0xe1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0xf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x104): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x123): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x14f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbc)
   drivers/mtd/chips/cfi_probe.o: in function `__fswab16':
   include/uapi/linux/swab.h:51:(.xiptext+0x172): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x18f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x1ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x1ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x204): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.o: in function `__fswab32':
   include/uapi/linux/swab.h:60:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x29c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x2b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x2cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x2e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x2eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x48)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x2f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x48)
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbc)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x326): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbc)
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x39e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x430): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x475): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:143:(.xiptext+0x4f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:144:(.xiptext+0x502): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x534): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:156:(.xiptext+0x546): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `instrument_atomic_check_alignment':
>> include/linux/instrumented.h:62:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:170:(.xiptext+0x5c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:172:(.xiptext+0x5e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0xe0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0xed0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x135e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x1378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x191c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x194a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x21c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2766:(.text+0x1c08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2775:(.text+0x1c36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x21c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x1f0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x1f56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x20d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x20ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x2343): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x2ada): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf90)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x2cfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf90)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x2d7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf90)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x2eec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf90)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x2fd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x764)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x306a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1084)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x138): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x14e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x17f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x18e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x1a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x23a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x292): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x2a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x326): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x354): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x37a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x398): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x3a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x3a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x3b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x3c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x3df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x403): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc14)
   drivers/mtd/chips/cfi_cmdset_0002.c:1132:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x4b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x4ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x4e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x4f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1108:(.xiptext+0x504): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:587:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x596): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x5c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0x5db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x5e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x5ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x5f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0x606): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x62e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0x64c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0x68a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x420)
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0x6a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0x6ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0x6ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0x6dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xda8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0x6ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0x703): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3b8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2030:(.xiptext+0x77c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2031:(.xiptext+0x78a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xda8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2037:(.xiptext+0x79f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2740)
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x7c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x7cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.c:2044:(.xiptext+0x7f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2a10)
   drivers/mtd/chips/cfi_cmdset_0002.c:2046:(.xiptext+0x80c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x824): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x838): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x847): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2056:(.xiptext+0x86e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2056:(.xiptext+0x87f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy


vim +62 include/linux/instrumented.h

00047c2e6d7c57 Marco Elver    2020-07-24  58  
80047d84eed25e Peter Zijlstra 2026-01-13  59  static __always_inline void instrument_atomic_check_alignment(const volatile void *v, size_t size)
80047d84eed25e Peter Zijlstra 2026-01-13  60  {
80047d84eed25e Peter Zijlstra 2026-01-13  61  #ifndef __DISABLE_EXPORTS
80047d84eed25e Peter Zijlstra 2026-01-13 @62  	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
80047d84eed25e Peter Zijlstra 2026-01-13  63  #endif
80047d84eed25e Peter Zijlstra 2026-01-13  64  }
80047d84eed25e Peter Zijlstra 2026-01-13  65  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
