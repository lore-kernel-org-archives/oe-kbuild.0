Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E036D9EE
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184936; cv=none; b=KUfQDcXMwdDJHniZkrLuYXMhEuGAfA4q6lO3YH+zmYT+mueJdwxa+Od4zLSMU2qX+nFYD3I/9prqePeg+eMcqiy6dRxetfj9kfZc/1FH3pyCjiJPbs770iK4OlpNbCqASAXxtVswbk6SLd/+AOK2HDgZ8rg4wBwbqK3Q/XB77zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184936; c=relaxed/simple;
	bh=mBEeWuyRAOFV/uCo2rUQBMKjVgfhT04hSRssiHTuq1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K/jFpUQAYmdtzqk9H7cNgc8LAAonwZlZR8nLBu6G8hRrKAxHyxNplwWwZ65ic0iYPnG8Y+LA/LxL5oQyMuh9I3jJZCmzlKyot8pREXwmSzfkpQk9zs2u3byX+kclPbwufO4Go232pFFqYkNsH9ELkrt95yiWvAkse7X9kViYtyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZPE1txK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZPE1txK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791184934; x=1822720934;
  h=date:from:to:cc:subject:message-id;
  bh=mBEeWuyRAOFV/uCo2rUQBMKjVgfhT04hSRssiHTuq1I=;
  b=XZPE1txK4NDTgTkiJGRhYJhZRunWbCA7DzjA9pb+poizB1CxBHsNqidk
   Wc9g+HnU4FV6rOQ2CiseE/TCYDeAGT18r5tKfqBFZ+7qm5ebkTLRWFJj0
   VD795zhnE7vU5MVytTnD0rb26ksS8eM5p/xLJMEt1kNC5IL275KvdK+8J
   wtXNDSXDXbH+egrrciiiMlL/SklNVK07INyX8qxVI++nyClhMIAmVFVZ2
   h7PIBuLEgpMrH40ZOI6IGP3fN+q5tvrIi2oRwgpmINb9lWMRkmZFs5d4p
   sGj499gb/zlorEhR6ucZ/OKd/xG0meSEG1Ba99RU4pX9fR4bXyjBEXZQ0
   g==;
X-CSE-ConnectionGUID: c+YArpfWTB221CESDfEwMQ==
X-CSE-MsgGUID: nRBNXh9wT9eirPOIdrxgFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="113627361"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="113627361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 00:22:14 -0700
X-CSE-ConnectionGUID: 1VcU3dMYTGCN1LC+hlDYWw==
X-CSE-MsgGUID: jsvX6ZxQQfiQXaRryM5X6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280491885"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 00:22:13 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDd1W-0000000002m-2PY9;
	Mon, 05 Oct 2026 07:22:10 +0000
Date: Mon, 05 Oct 2026 09:22:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/instrumented.h:62:(.xiptext+0x627): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 warn_slowpath_fmt
Message-ID: <202610050911.YzEKCIXQ-lkp@intel.com>
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
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: xtensa-randconfig-r2305-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050911.YzEKCIXQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050911.YzEKCIXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80047d84eed2 ("atomic: add alignment check to instrumented atomic operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610050911.YzEKCIXQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/slab.h:961:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x135): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x145): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x333): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x348): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x35e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x374): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x37e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x84)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x38a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x84)
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x3ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x104)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x3ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x104)
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x427): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x436): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x4ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x4e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:144:(.xiptext+0x5b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:156:(.xiptext+0x5f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
>> include/linux/instrumented.h:62:(.xiptext+0x627): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:172:(.xiptext+0x67f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:951:(.text+0xc74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.c:922:(.text+0xd34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_read':
   drivers/mtd/chips/cfi_cmdset_0002.c:1270:(.text+0x1467): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xacc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:617:(.text+0x161f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.c:803:(.text+0x1a37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.c:758:(.text+0x1a6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2242:(.text+0x1b82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2255:(.text+0x1b93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1835:(.text+0x2084): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa40)
   drivers/mtd/chips/cfi_cmdset_0002.c:1865:(.text+0x214f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa40)
   drivers/mtd/chips/cfi_cmdset_0002.c:1906:(.text+0x2280): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa40)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2103:(.text+0x23a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1070)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.text+0x2864): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa40)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1484:(.text+0x29bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:542:(.text+0x2a2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1439:(.text+0x2f5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   include/linux/mtd/cfi.h:311:(.text+0x2f8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x278)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x1e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x1f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x20a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x297): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x346): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x39f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x3a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x3ad): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x3b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x3c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x348)
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x45b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x482): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1108:(.xiptext+0x490): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x49c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x550): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x568): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0x5de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x5eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1682:(.xiptext+0x5f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x5fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1696:(.xiptext+0x643): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0x670): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x964)
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0x69a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x730): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0x75c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   include/linux/jiffies.h:587:(.xiptext+0x7b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0x7fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x807): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x80d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x818): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0x82a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x852): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0x870): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x964)
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0x89a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0x8e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0x8f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc04)
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0x8fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0x922): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0x936): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.xiptext+0x94b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0x9b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0x9cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0x9e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0x9f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0xa1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0xa27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0xb1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0xb2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc04)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':


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
