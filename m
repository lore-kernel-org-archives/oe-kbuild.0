Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CFD10F2
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770435571; cv=none; b=eZ6nuIBmcf5cRBCEif5D5fTNkuKUfqkGyJbgre6Ords4n8V2/s7RsQM6Sg7Si4c5QoC8mcvn2I4Ge6OGSE//VrhMdmjmCnEKpFNV9DkG2DBObIklEGSog90pdn4pnu8Dphc29R5xMsxwMA4dRWtHMDuzSRRHZooDNst2ONsTrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770435571; c=relaxed/simple;
	bh=+VXKOGkksM8J1901l9ktED2ssxW9rIqWFnlUbWnnQzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqNt3xsxqJ5qqehwxvUq9mF3htS67ts2f5elSyAySfsb/0ylSEAb9fhwN2dDHHyx1ZloFjTKY0UYDddKlZOnNlCUSwP97bFf0F7vYBN5ACnCaXdcXiKX4XDRnd5CvEZX7lrfR3twCmLXaCIk3PxIjioo73WpJiifiRq4yoRYP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJLoq7+V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJLoq7+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770435570; x=1801971570;
  h=date:from:to:cc:subject:message-id;
  bh=+VXKOGkksM8J1901l9ktED2ssxW9rIqWFnlUbWnnQzg=;
  b=hJLoq7+VAHV2edFSxTg0KJVQDwgCi6v1PF0o4y3wCdZbfWY58um27Dxt
   donCaUn+rUwAMT5lIoOdoZO+4zKoGTGVcc86X02Ac/dUAwwab8t95foy+
   2/Asj1pHAUJnmveNAIqtKGadxI/ZIBSgd3jeDsODZlrNwLJ7sbqKcwABs
   oralxVhHLzpJz6RfP3OKKM7ab46K3quOlkyO0R1XLpQNway0K6KBnu+mf
   qzhfHox6cOtNLQ7+wMq6HL78Z/r2WdQ3DNqLe/MXnNvLT5/7PuLSbNzv/
   UlqVb6+DbEdsyU5m7vlupc/uWaQBwFOBLbGbpvxo8p2J9UyRRfKXIiYX/
   A==;
X-CSE-ConnectionGUID: 1hsIyThrQkWd267j/W4xTA==
X-CSE-MsgGUID: cvFQfBFOS0WVC+yb3IChxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75492176"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75492176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 19:39:30 -0800
X-CSE-ConnectionGUID: NPTdMR8MSDyLrTwrBuvLZA==
X-CSE-MsgGUID: NghrsG1kQ8yzPOQe9hcJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210885559"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 19:39:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voZAL-00000000lMe-2uuC;
	Sat, 07 Feb 2026 03:39:25 +0000
Date: Sat, 07 Feb 2026 11:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6ba):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: __trace_set_current_state
Message-ID: <202602071135.GXNlIvXK-lkp@intel.com>
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
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071135.GXNlIvXK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071135.GXNlIvXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602071135.GXNlIvXK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x348e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x34fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x498)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x3790): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x37eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x3b3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x3b8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x466a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x4f1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe64)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x5027): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19a8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x53e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19a8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x54de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19a8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x573a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19a8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x5ad0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2238)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:834:(.xiptext+0x78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0xa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0xe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x110): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x140): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x153): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x171): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x185): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x18e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x19a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1a5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:864:(.xiptext+0x20e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:865:(.xiptext+0x214): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x227): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x238): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:871:(.xiptext+0x24c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:1995:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x284): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x2af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x2c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1032:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x317): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x31f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x33f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1038:(.xiptext+0x369): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x49e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1059:(.xiptext+0x4a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1066:(.xiptext+0x4c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x509): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x541): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x54c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x56c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x583): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x594): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1097:(.xiptext+0x5e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x5f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x602): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x62f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x648): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2105:(.xiptext+0x65c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x665): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x67d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x68a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x6d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x6ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x6f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x6fd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x70a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x71c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `arch_local_save_flags':
   arch/xtensa/include/asm/irqflags.h:22:(.xiptext+0x72e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x743): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x758): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x764): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x774): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x77a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x798): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b78)
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x7b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x7d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1141:(.xiptext+0x7dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1143:(.xiptext+0x7e5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x7ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x810): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x826): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x830): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x8f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1949:(.xiptext+0x8fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:587:(.xiptext+0x903): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x913): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x91e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x930): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x93e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x947): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x956): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x978): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x986): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x991): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x99f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0x9bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x9c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x9cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0x9ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0x9f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xa08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xa1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0xa2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xa38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xa56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xa68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1670)
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xa78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xa93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xaa4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1989:(.xiptext+0xab0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0xb06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0xb12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0xb1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0xb2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1e18)
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xb3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xb4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xb5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0xb62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0xb6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xb73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xb82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xb94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xba0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xba8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xbba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xbc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xc12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0xc4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0xc5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb54)
   drivers/mtd/chips/cfi_cmdset_0002.c:1742:(.xiptext+0xc67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xc76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xc87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xc96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xc9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0xcac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0xcb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1c0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0xcbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0xe6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2411:(.xiptext+0xe70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2414:(.xiptext+0xe87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:2417:(.xiptext+0xe9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b04)
   drivers/mtd/chips/cfi_cmdset_0002.c:2421:(.xiptext+0xeae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2422:(.xiptext+0xebc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1e18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2423:(.xiptext+0xeca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2423:(.xiptext+0xedd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2423:(.xiptext+0xeec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2424:(.xiptext+0xef6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2424:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xf08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xf22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xf2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xf46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xf50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0xf5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0xf6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0xf7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0xf8b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0xf93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0xfa4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0xfb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0xfc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0xfd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0xfda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2433:(.xiptext+0xfe9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2433:(.xiptext+0xff4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4de0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x1000): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x1018): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0x1030): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0x1047): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0x105e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0x1074): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0x108c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x10d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x10de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x10f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x1103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `raw_atomic_read':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x110f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0x1122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0x1132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0x113c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x114b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2458:(.xiptext+0x1167): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2459:(.xiptext+0x116f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2460:(.xiptext+0x1175): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2461:(.xiptext+0x1182): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2462:(.xiptext+0x118e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0x1199): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0x11aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0x11bd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0x11d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2468:(.xiptext+0x11da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2472:(.xiptext+0x11f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2472:(.xiptext+0x1213): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2473:(.xiptext+0x1227): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1670)
   drivers/mtd/chips/cfi_cmdset_0002.c:2472:(.xiptext+0x1235): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2473:(.xiptext+0x1256): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2473:(.xiptext+0x1266): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2489:(.xiptext+0x1272): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2478:(.xiptext+0x1280): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2479:(.xiptext+0x1296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2489:(.xiptext+0x129c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2478:(.xiptext+0x12aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2489:(.xiptext+0x12c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2489:(.xiptext+0x12dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2489:(.xiptext+0x12ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0x12f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0x1306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2494:(.xiptext+0x1320): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2494:(.xiptext+0x1331): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2500:(.xiptext+0x133d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2502:(.xiptext+0x1357): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2502:(.xiptext+0x136c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2502:(.xiptext+0x1378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2502:(.xiptext+0x1383): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2503:(.xiptext+0x1390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2503:(.xiptext+0x139a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1c0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2504:(.xiptext+0x13a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2506:(.xiptext+0x13ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0x1466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x146f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x1486): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x149a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x14af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x14dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x14e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x14f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x1506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x150f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x151e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1540): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x154e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1558): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x1566): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0x1582): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x158f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1682:(.xiptext+0x1595): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x15a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0x15b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x15c1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x15d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x15eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1696:(.xiptext+0x1606): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1697:(.xiptext+0x1612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4de0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x161c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1702:(.xiptext+0x163a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0x164c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1670)
   drivers/mtd/chips/cfi_cmdset_0002.c:1702:(.xiptext+0x165c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0x1677): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0x1688): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1712:(.xiptext+0x1694): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0x174e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0x175a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x1776): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x1788): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x1797): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x17a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0x17c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0x17cd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0x17e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0x17eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x17fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x180e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x181c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x1824): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x1834): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x1842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x1854): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x1860): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x1868): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1773:(.xiptext+0x1878): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
..


vim +1119 drivers/mtd/chips/cfi_cmdset_0002.c

02b15e343aeefb Todd Poynor      2005-06-07  1042  
02b15e343aeefb Todd Poynor      2005-06-07  1043  /*
02b15e343aeefb Todd Poynor      2005-06-07  1044   * When a delay is required for the flash operation to complete, the
02b15e343aeefb Todd Poynor      2005-06-07  1045   * xip_udelay() function is polling for both the given timeout and pending
02b15e343aeefb Todd Poynor      2005-06-07  1046   * (but still masked) hardware interrupts.  Whenever there is an interrupt
02b15e343aeefb Todd Poynor      2005-06-07  1047   * pending then the flash erase operation is suspended, array mode restored
02b15e343aeefb Todd Poynor      2005-06-07  1048   * and interrupts unmasked.  Task scheduling might also happen at that
02b15e343aeefb Todd Poynor      2005-06-07  1049   * point.  The CPU eventually returns from the interrupt or the call to
02b15e343aeefb Todd Poynor      2005-06-07  1050   * schedule() and the suspended flash operation is resumed for the remaining
02b15e343aeefb Todd Poynor      2005-06-07  1051   * of the delay period.
02b15e343aeefb Todd Poynor      2005-06-07  1052   *
02b15e343aeefb Todd Poynor      2005-06-07  1053   * Warning: this function _will_ fool interrupt latency tracing tools.
02b15e343aeefb Todd Poynor      2005-06-07  1054   */
02b15e343aeefb Todd Poynor      2005-06-07  1055  
02b15e343aeefb Todd Poynor      2005-06-07  1056  static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
02b15e343aeefb Todd Poynor      2005-06-07  1057  				unsigned long adr, int usec)
02b15e343aeefb Todd Poynor      2005-06-07  1058  {
02b15e343aeefb Todd Poynor      2005-06-07  1059  	struct cfi_private *cfi = map->fldrv_priv;
02b15e343aeefb Todd Poynor      2005-06-07  1060  	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
02b15e343aeefb Todd Poynor      2005-06-07  1061  	map_word status, OK = CMD(0x80);
02b15e343aeefb Todd Poynor      2005-06-07  1062  	unsigned long suspended, start = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1063  	flstate_t oldstate;
02b15e343aeefb Todd Poynor      2005-06-07  1064  
02b15e343aeefb Todd Poynor      2005-06-07  1065  	do {
02b15e343aeefb Todd Poynor      2005-06-07  1066  		cpu_relax();
02b15e343aeefb Todd Poynor      2005-06-07  1067  		if (xip_irqpending() && extp &&
02b15e343aeefb Todd Poynor      2005-06-07  1068  		    ((chip->state == FL_ERASING && (extp->EraseSuspend & 2))) &&
02b15e343aeefb Todd Poynor      2005-06-07  1069  		    (cfi_interleave_is_1(cfi) || chip->oldstate == FL_READY)) {
02b15e343aeefb Todd Poynor      2005-06-07  1070  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1071  			 * Let's suspend the erase operation when supported.
02b15e343aeefb Todd Poynor      2005-06-07  1072  			 * Note that we currently don't try to suspend
02b15e343aeefb Todd Poynor      2005-06-07  1073  			 * interleaved chips if there is already another
02b15e343aeefb Todd Poynor      2005-06-07  1074  			 * operation suspended (imagine what happens
02b15e343aeefb Todd Poynor      2005-06-07  1075  			 * when one chip was already done with the current
02b15e343aeefb Todd Poynor      2005-06-07  1076  			 * operation while another chip suspended it, then
02b15e343aeefb Todd Poynor      2005-06-07  1077  			 * we resume the whole thing at once).  Yes, it
02b15e343aeefb Todd Poynor      2005-06-07  1078  			 * can happen!
02b15e343aeefb Todd Poynor      2005-06-07  1079  			 */
02b15e343aeefb Todd Poynor      2005-06-07  1080  			map_write(map, CMD(0xb0), adr);
02b15e343aeefb Todd Poynor      2005-06-07  1081  			usec -= xip_elapsed_since(start);
02b15e343aeefb Todd Poynor      2005-06-07  1082  			suspended = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1083  			do {
02b15e343aeefb Todd Poynor      2005-06-07  1084  				if (xip_elapsed_since(suspended) > 100000) {
02b15e343aeefb Todd Poynor      2005-06-07  1085  					/*
02b15e343aeefb Todd Poynor      2005-06-07  1086  					 * The chip doesn't want to suspend
02b15e343aeefb Todd Poynor      2005-06-07  1087  					 * after waiting for 100 msecs.
02b15e343aeefb Todd Poynor      2005-06-07  1088  					 * This is a critical error but there
02b15e343aeefb Todd Poynor      2005-06-07  1089  					 * is not much we can do here.
02b15e343aeefb Todd Poynor      2005-06-07  1090  					 */
02b15e343aeefb Todd Poynor      2005-06-07  1091  					return;
02b15e343aeefb Todd Poynor      2005-06-07  1092  				}
02b15e343aeefb Todd Poynor      2005-06-07  1093  				status = map_read(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1094  			} while (!map_word_andequal(map, status, OK, OK));
02b15e343aeefb Todd Poynor      2005-06-07  1095  
02b15e343aeefb Todd Poynor      2005-06-07  1096  			/* Suspend succeeded */
02b15e343aeefb Todd Poynor      2005-06-07  1097  			oldstate = chip->state;
02b15e343aeefb Todd Poynor      2005-06-07  1098  			if (!map_word_bitsset(map, status, CMD(0x40)))
02b15e343aeefb Todd Poynor      2005-06-07  1099  				break;
02b15e343aeefb Todd Poynor      2005-06-07  1100  			chip->state = FL_XIP_WHILE_ERASING;
02b15e343aeefb Todd Poynor      2005-06-07  1101  			chip->erase_suspended = 1;
02b15e343aeefb Todd Poynor      2005-06-07  1102  			map_write(map, CMD(0xf0), adr);
02b15e343aeefb Todd Poynor      2005-06-07  1103  			(void) map_read(map, adr);
ca5c23c3b8882d Paulius Zaleckas 2008-02-27  1104  			xip_iprefetch();
02b15e343aeefb Todd Poynor      2005-06-07 @1105  			local_irq_enable();
c4e773764cead9 Stefani Seibold  2010-04-18  1106  			mutex_unlock(&chip->mutex);
ca5c23c3b8882d Paulius Zaleckas 2008-02-27  1107  			xip_iprefetch();
02b15e343aeefb Todd Poynor      2005-06-07  1108  			cond_resched();
02b15e343aeefb Todd Poynor      2005-06-07  1109  
02b15e343aeefb Todd Poynor      2005-06-07  1110  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1111  			 * We're back.  However someone else might have
02b15e343aeefb Todd Poynor      2005-06-07  1112  			 * decided to go write to the chip if we are in
02b15e343aeefb Todd Poynor      2005-06-07  1113  			 * a suspended erase state.  If so let's wait
02b15e343aeefb Todd Poynor      2005-06-07  1114  			 * until it's done.
02b15e343aeefb Todd Poynor      2005-06-07  1115  			 */
c4e773764cead9 Stefani Seibold  2010-04-18  1116  			mutex_lock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1117  			while (chip->state != FL_XIP_WHILE_ERASING) {
02b15e343aeefb Todd Poynor      2005-06-07  1118  				DECLARE_WAITQUEUE(wait, current);
02b15e343aeefb Todd Poynor      2005-06-07 @1119  				set_current_state(TASK_UNINTERRUPTIBLE);
02b15e343aeefb Todd Poynor      2005-06-07  1120  				add_wait_queue(&chip->wq, &wait);
c4e773764cead9 Stefani Seibold  2010-04-18  1121  				mutex_unlock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1122  				schedule();
02b15e343aeefb Todd Poynor      2005-06-07  1123  				remove_wait_queue(&chip->wq, &wait);
c4e773764cead9 Stefani Seibold  2010-04-18  1124  				mutex_lock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1125  			}
02b15e343aeefb Todd Poynor      2005-06-07  1126  			/* Disallow XIP again */
02b15e343aeefb Todd Poynor      2005-06-07  1127  			local_irq_disable();
02b15e343aeefb Todd Poynor      2005-06-07  1128  
420962884379bd Gerlando Falauto 2012-07-03  1129  			/* Correct Erase Suspend Hangups for M29EW */
420962884379bd Gerlando Falauto 2012-07-03  1130  			cfi_fixup_m29ew_erase_suspend(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1131  			/* Resume the write or erase operation */
08968041bef437 Guillaume LECERF 2010-10-26  1132  			map_write(map, cfi->sector_erase_cmd, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1133  			chip->state = oldstate;
02b15e343aeefb Todd Poynor      2005-06-07  1134  			start = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1135  		} else if (usec >= 1000000/HZ) {
02b15e343aeefb Todd Poynor      2005-06-07  1136  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1137  			 * Try to save on CPU power when waiting delay
02b15e343aeefb Todd Poynor      2005-06-07  1138  			 * is at least a system timer tick period.
02b15e343aeefb Todd Poynor      2005-06-07  1139  			 * No need to be extremely accurate here.
02b15e343aeefb Todd Poynor      2005-06-07  1140  			 */
02b15e343aeefb Todd Poynor      2005-06-07  1141  			xip_cpu_idle();
02b15e343aeefb Todd Poynor      2005-06-07  1142  		}
02b15e343aeefb Todd Poynor      2005-06-07  1143  		status = map_read(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1144  	} while (!map_word_andequal(map, status, OK, OK)
02b15e343aeefb Todd Poynor      2005-06-07  1145  		 && xip_elapsed_since(start) < usec);
02b15e343aeefb Todd Poynor      2005-06-07  1146  }
02b15e343aeefb Todd Poynor      2005-06-07  1147  

:::::: The code at line 1119 was first introduced by commit
:::::: 02b15e343aeefb49f8cac949be599d78250a568f [MTD] XIP for AMD CFI flash.

:::::: TO: Todd Poynor <tpoynor@mvista.com>
:::::: CC: Thomas Gleixner <tglx@mtd.linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
