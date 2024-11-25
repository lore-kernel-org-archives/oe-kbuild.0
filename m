Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9061552E3
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537440; cv=none; b=mAmPs/SEeY5tcYGYnXtDVWMVKjuF8PQgZANJ5UIf0Q0Q/tgtTOdNPcncBnKe3yF0mLGrWsuFzysuTqWmPtsRp9YQrG8dU7ptSqE6waByfEl9XSUBXxwaDqjeG7CnHnBeL3WJn6D/QHKIZKvEmSoH2zWK8Ab2mykkwhnNxr1U8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537440; c=relaxed/simple;
	bh=Mx/GoT4OMCSmJ93OymRW37hWF+6ptoJ/maJx0Hd2Wq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IM2efGg9QsEvAbL7a1DS4iNdMAOiJcVFzmLXQ69w41bmalQ9hF3QqoKYO+xvTdVPxNrhKP8Mc+a65D93XyOtIctmym9k96Me+LSVR2xKRfZcLmczsxf07H0156dcMEsrTudg++p7a/y53Ogiq6AspQTnjuxWkwbzroARp91AuHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJMfEpk0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJMfEpk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732537437; x=1764073437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mx/GoT4OMCSmJ93OymRW37hWF+6ptoJ/maJx0Hd2Wq4=;
  b=JJMfEpk0e1rnjUgW42y9ozJ1Ro8hneIMKsbLOGIHQ2J3y0H6RdjtE/IJ
   XojsNJx5TEAnC/Q3kHtGN/toO48quGVCXBo9E8TkFPb4yvZMba6Wq6Li+
   D63aYLOzNbJvd/QSc6yYaWnewT6ya4a6QBb8276sdQTQk1J6GqkzTIAy9
   8tChx7qZ8D7yoyYr/MkKuzFD30hEL0nQvsjiaOIxppijHOuUUMcNeORfU
   9fQBrEZzPrvil+XRCPZtCBRHJ503mzxYD8lF04cmTYRewAd/oQl1nVICS
   MPjgYETSJZyXk7cxstooaUvlKYroFOe89Q/d25SiTi/1ccC5mBh24VTEH
   A==;
X-CSE-ConnectionGUID: ppUcKb72TvC358R5vcR46Q==
X-CSE-MsgGUID: LGRfxx7qQYe2WyU7ZLJx+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="44034621"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="44034621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 04:23:56 -0800
X-CSE-ConnectionGUID: uNIFCN0vQeip0AKaIYn/nA==
X-CSE-MsgGUID: cHIvnV3WSJapViRxraEeVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="114520277"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2024 04:23:54 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFY88-0006NV-0S;
	Mon, 25 Nov 2024 12:23:52 +0000
Date: Mon, 25 Nov 2024 20:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x113): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
Message-ID: <202411252026.LVbeSiOh-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 03ce34cf8f50e4c62f9a4b62caffdba1165ca977 xtensa: add XIP-aware MTD support
date:   1 year, 3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 3 months ago
config: xtensa-randconfig-r113-20241114 (https://download.01.org/0day-ci/archive/20241125/202411252026.LVbeSiOh-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241125/202411252026.LVbeSiOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411252026.LVbeSiOh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `kmalloc':
   include/linux/slab.h:586:(.xiptext+0xe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0xf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x104): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
>> drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x32e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
>> drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x162): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x18a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x1ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x212): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:268:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x23e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x278): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x28f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x2a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x34b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `kmalloc':
   include/linux/slab.h:586:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2191:(.text+0x74f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2208:(.text+0x797): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2272:(.text+0x9fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2278:(.text+0xa12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:643:(.text+0xe07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:889:(.text+0x11e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:928:(.text+0x12a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2630:(.text+0x175b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2769:(.text+0x19a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2778:(.text+0x19bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x240)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1405:(.text+0x21f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa9c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1517:(.text+0x2303): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1519:(.text+0x236f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1459:(.text+0x2e5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:1467:(.text+0x2e76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x240)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1861:(.text+0x317a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa9c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1885:(.text+0x326a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa9c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1928:(.text+0x33f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa9c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2140:(.text+0x350f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe7c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1036:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1036:(.xiptext+0x32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:840:(.xiptext+0x8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:845:(.xiptext+0xa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2007:(.xiptext+0x1a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2009:(.xiptext+0x1bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2011:(.xiptext+0x1d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1062:(.xiptext+0x262): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x2ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1099:(.xiptext+0x366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x3b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1107:(.xiptext+0x3f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1109:(.xiptext+0x402): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2099:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1131:(.xiptext+0x45e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x102c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1133:(.xiptext+0x470): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x4c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x4c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x4d5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1125:(.xiptext+0x4e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x5ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1665:(.xiptext+0x5e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1666:(.xiptext+0x5f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x653): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1682:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x668): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1684:(.xiptext+0x673): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1686:(.xiptext+0x683): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1704:(.xiptext+0x6ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1777:(.xiptext+0x7ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1780:(.xiptext+0x7cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
--
   drivers/mtd/chips/cfi_cmdset_0002.c:1300:(.xiptext+0x98b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1302:(.xiptext+0x99f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1745:(.xiptext+0x9c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x109c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0x9cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1722:(.xiptext+0xa0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xa18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1178)
   drivers/mtd/chips/cfi_cmdset_0002.c:1726:(.xiptext+0xa26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1281:(.xiptext+0xa4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1283:(.xiptext+0xa5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1285:(.xiptext+0xa73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1808:(.xiptext+0xabf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_ff':
   include/linux/mtd/map.h:386:(.xiptext+0xbc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2424:(.xiptext+0xbe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2425:(.xiptext+0xbef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1178)
   drivers/mtd/chips/cfi_cmdset_0002.c:2427:(.xiptext+0xbfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0xc50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0xc64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0xc7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2442:(.xiptext+0xc8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2443:(.xiptext+0xca3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2444:(.xiptext+0xcb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2461:(.xiptext+0xd22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2462:(.xiptext+0xd2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2463:(.xiptext+0xd31): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2464:(.xiptext+0xd3d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0xd48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2476:(.xiptext+0xd82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2494:(.xiptext+0xdbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2494:(.xiptext+0xdce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2506:(.xiptext+0xe06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x109c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xe0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2033:(.xiptext+0xe96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2034:(.xiptext+0xea4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1178)
   drivers/mtd/chips/cfi_cmdset_0002.c:2036:(.xiptext+0xeb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:336:(.xiptext+0xf2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:340:(.xiptext+0xf3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2049:(.xiptext+0xf83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0xf9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2053:(.xiptext+0xfaf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2053:(.xiptext+0xfbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0xfe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0xff3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:336:(.xiptext+0x106c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:338:(.xiptext+0x1078): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   include/linux/mtd/map.h:340:(.xiptext+0x1086): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2064:(.xiptext+0x1097): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2074:(.xiptext+0x10d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2074:(.xiptext+0x10de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2081:(.xiptext+0x1102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2089:(.xiptext+0x113e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x109c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_ff':
   include/linux/mtd/map.h:386:(.xiptext+0x1237): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2524:(.xiptext+0x124c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2525:(.xiptext+0x125a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1178)
   drivers/mtd/chips/cfi_cmdset_0002.c:2527:(.xiptext+0x1267): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x12c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x12da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2541:(.xiptext+0x12ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2542:(.xiptext+0x1304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2543:(.xiptext+0x131a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2544:(.xiptext+0x132b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2561:(.xiptext+0x1396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2562:(.xiptext+0x139f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2563:(.xiptext+0x13a5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2564:(.xiptext+0x13b1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2565:(.xiptext+0x13bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2576:(.xiptext+0x13f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2594:(.xiptext+0x142b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2594:(.xiptext+0x143b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1472): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x109c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2607:(.xiptext+0x147b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   drivers/mtd/chips/cfi_cmdset_0001.c:401:(.text+0x788): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0001.c:2272:(.text+0x1578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2297:(.text+0x1b33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   drivers/mtd/chips/cfi_cmdset_0001.c:1650:(.text+0x21d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1671:(.text+0x22ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1695:(.text+0x2427): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   drivers/mtd/chips/cfi_cmdset_0001.c:1900:(.text+0x25c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc98)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0001.c:2379:(.text+0x2792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13d8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1121:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
>> drivers/mtd/chips/cfi_cmdset_0001.c:1121:(.xiptext+0x32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1148:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1175:(.xiptext+0x192): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1175:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x1d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1194:(.xiptext+0x267): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1199:(.xiptext+0x2bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1205:(.xiptext+0x30f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1205:(.xiptext+0x324): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1209:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1211:(.xiptext+0x35a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `_cond_resched':
   include/linux/sched.h:2099:(.xiptext+0x360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1219:(.xiptext+0x36a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1233:(.xiptext+0x3bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1233:(.xiptext+0x3cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1234:(.xiptext+0x3e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1234:(.xiptext+0x3f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1223:(.xiptext+0x442): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1224:(.xiptext+0x44b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1225:(.xiptext+0x451): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.c:1226:(.xiptext+0x45d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1227:(.xiptext+0x468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2083:(.xiptext+0x533): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2083:(.xiptext+0x542): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0001.c:1564:(.xiptext+0x642): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1564:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1567:(.xiptext+0x673): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1573:(.xiptext+0x688): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1574:(.xiptext+0x697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x115c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1576:(.xiptext+0x6a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1583:(.xiptext+0x6e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1584:(.xiptext+0x703): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1599:(.xiptext+0x763): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1622:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1623:(.xiptext+0x7bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1600:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1600:(.xiptext+0x7e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1603:(.xiptext+0x7f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1603:(.xiptext+0x80a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1604:(.xiptext+0x824): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1604:(.xiptext+0x833): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1947:(.xiptext+0x8f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1948:(.xiptext+0x907): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x115c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1950:(.xiptext+0x916): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1959:(.xiptext+0x964): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1959:(.xiptext+0x972): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1962:(.xiptext+0x990): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1962:(.xiptext+0x99e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1963:(.xiptext+0x9be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1963:(.xiptext+0x9ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1974:(.xiptext+0xa1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1974:(.xiptext+0xa2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1982:(.xiptext+0xa5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1982:(.xiptext+0xa72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1987:(.xiptext+0xabe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1988:(.xiptext+0xafe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1988:(.xiptext+0xb04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1991:(.xiptext+0xb17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1991:(.xiptext+0xb2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1992:(.xiptext+0xb43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1992:(.xiptext+0xb58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2008:(.xiptext+0xb96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2009:(.xiptext+0xb9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2021:(.xiptext+0xbd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2022:(.xiptext+0xbdd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1732:(.xiptext+0xd0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1732:(.xiptext+0xd2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1734:(.xiptext+0xd3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1735:(.xiptext+0xd4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x115c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1737:(.xiptext+0xd5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1750:(.xiptext+0xdaf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1750:(.xiptext+0xdc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1754:(.xiptext+0xe1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1763:(.xiptext+0xe5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1768:(.xiptext+0xe97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1768:(.xiptext+0xeaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1771:(.xiptext+0xedc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1771:(.xiptext+0xeea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1772:(.xiptext+0xf06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1772:(.xiptext+0xf16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `map_word_ff':
   include/linux/mtd/map.h:386:(.xiptext+0xfa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1791:(.xiptext+0xfc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1791:(.xiptext+0xfd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `map_word_ff':
   include/linux/mtd/map.h:386:(.xiptext+0x1052): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1806:(.xiptext+0x1067): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `map_word_load_partial':
   include/linux/mtd/map.h:350:(.xiptext+0x1086): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:364:(.xiptext+0x10d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1828:(.xiptext+0x1136): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1828:(.xiptext+0x1147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1836:(.xiptext+0x117c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1836:(.xiptext+0x118e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1845:(.xiptext+0x11db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1868:(.xiptext+0x1226): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1869:(.xiptext+0x122f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1846:(.xiptext+0x124a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1846:(.xiptext+0x1250): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1849:(.xiptext+0x1263): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1849:(.xiptext+0x1277): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1850:(.xiptext+0x128e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1850:(.xiptext+0x129e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1813:(.xiptext+0x12ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1813:(.xiptext+0x130b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1758:(.xiptext+0x1360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1758:(.xiptext+0x136e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0x138c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0x139a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_read':
   drivers/mtd/chips/cfi_cmdset_0001.c:2233:(.xiptext+0x13f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0001.c:1017:(.xiptext+0x1404): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe44)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_read':
   drivers/mtd/chips/cfi_cmdset_0001.c:2245:(.xiptext+0x1446): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2245:(.xiptext+0x1457): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2254:(.xiptext+0x1496): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2255:(.xiptext+0x149f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2115:(.xiptext+0x1512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0001.c:1017:(.xiptext+0x1522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe44)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2118:(.xiptext+0x1532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2125:(.xiptext+0x156e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2125:(.xiptext+0x157e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2127:(.xiptext+0x159f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2127:(.xiptext+0x15ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2130:(.xiptext+0x15d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2130:(.xiptext+0x15e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2133:(.xiptext+0x15f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0001.c:2151:(.xiptext+0x162c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2151:(.xiptext+0x163a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0001.c:2160:(.xiptext+0x1672): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbe4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2161:(.xiptext+0x167b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o: in function `memcpy_toio':
   include/asm-generic/io.h:1220:(.xiptext+0xf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `memcpy_fromio':
   include/asm-generic/io.h:1203:(.xiptext+0x36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
>> drivers/mtd/maps/map_funcs.c:20:(.xiptext+0x62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `memcpy_toio':
   include/asm-generic/io.h:1220:(.xiptext+0xaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `inline_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0xb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `memcpy_fromio':
   include/asm-generic/io.h:1203:(.xiptext+0x117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `inline_map_read':
   include/linux/mtd/map.h:406:(.xiptext+0x123): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   include/linux/mtd/map.h:408:(.xiptext+0x12f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy


vim +219 drivers/mtd/chips/cfi_probe.c

b1c97e2335f24d Aaron Sierra     2018-04-30   77  
b1c97e2335f24d Aaron Sierra     2018-04-30   78  static void cfi_early_fixup(struct cfi_private *cfi,
b1c97e2335f24d Aaron Sierra     2018-04-30   79  			    const struct cfi_early_fixup *fixups)
b1c97e2335f24d Aaron Sierra     2018-04-30   80  {
b1c97e2335f24d Aaron Sierra     2018-04-30   81  	const struct cfi_early_fixup *f;
b1c97e2335f24d Aaron Sierra     2018-04-30   82  
b1c97e2335f24d Aaron Sierra     2018-04-30   83  	for (f = fixups; f->fixup; f++) {
b1c97e2335f24d Aaron Sierra     2018-04-30   84  		if (((f->mfr == CFI_MFR_ANY) || (f->mfr == cfi->mfr)) &&
b1c97e2335f24d Aaron Sierra     2018-04-30   85  		    ((f->id == CFI_ID_ANY) || (f->id == cfi->id))) {
b1c97e2335f24d Aaron Sierra     2018-04-30  @86  			f->fixup(cfi);
b1c97e2335f24d Aaron Sierra     2018-04-30   87  		}
b1c97e2335f24d Aaron Sierra     2018-04-30   88  	}
b1c97e2335f24d Aaron Sierra     2018-04-30   89  }
b1c97e2335f24d Aaron Sierra     2018-04-30   90  
^1da177e4c3f41 Linus Torvalds   2005-04-16   91  /* check for QRY.
^1da177e4c3f41 Linus Torvalds   2005-04-16   92     in: interleave,type,mode
^1da177e4c3f41 Linus Torvalds   2005-04-16   93     ret: table index, <0 for error
^1da177e4c3f41 Linus Torvalds   2005-04-16   94   */
^1da177e4c3f41 Linus Torvalds   2005-04-16   95  
^1da177e4c3f41 Linus Torvalds   2005-04-16   96  static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
^1da177e4c3f41 Linus Torvalds   2005-04-16   97  				   unsigned long *chip_map, struct cfi_private *cfi)
^1da177e4c3f41 Linus Torvalds   2005-04-16   98  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   99  	int i;
^1da177e4c3f41 Linus Torvalds   2005-04-16  100  
^1da177e4c3f41 Linus Torvalds   2005-04-16  101  	if ((base + 0) >= map->size) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  102  		printk(KERN_NOTICE
^1da177e4c3f41 Linus Torvalds   2005-04-16  103  			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  104  			(unsigned long)base, map->size -1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  105  		return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  106  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  107  	if ((base + 0xff) >= map->size) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  108  		printk(KERN_NOTICE
^1da177e4c3f41 Linus Torvalds   2005-04-16  109  			"Probe at base[0x55](0x%08lx) past the end of the map(0x%08lx)\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  110  			(unsigned long)base + 0x55, map->size -1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  111  		return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  112  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  113  
^1da177e4c3f41 Linus Torvalds   2005-04-16  114  	xip_disable();
c314dfdc358847 David Woodhouse  2008-08-07  115  	if (!cfi_qry_mode_on(base, map, cfi)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  116  		xip_enable(base, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  117  		return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  118  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  119  
^1da177e4c3f41 Linus Torvalds   2005-04-16  120  	if (!cfi->numchips) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  121  		/* This is the first time we're called. Set up the CFI
^1da177e4c3f41 Linus Torvalds   2005-04-16  122  		   stuff accordingly and return */
^1da177e4c3f41 Linus Torvalds   2005-04-16  123  		return cfi_chip_setup(map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  124  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  125  
^1da177e4c3f41 Linus Torvalds   2005-04-16  126  	/* Check each previous chip to see if it's an alias */
^1da177e4c3f41 Linus Torvalds   2005-04-16  127   	for (i=0; i < (base >> cfi->chipshift); i++) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  128   		unsigned long start;
^1da177e4c3f41 Linus Torvalds   2005-04-16  129   		if(!test_bit(i, chip_map)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  130  			/* Skip location; no valid chip at this address */
^1da177e4c3f41 Linus Torvalds   2005-04-16  131   			continue;
^1da177e4c3f41 Linus Torvalds   2005-04-16  132   		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  133   		start = i << cfi->chipshift;
^1da177e4c3f41 Linus Torvalds   2005-04-16  134  		/* This chip should be in read mode if it's one
^1da177e4c3f41 Linus Torvalds   2005-04-16  135  		   we've already touched. */
c314dfdc358847 David Woodhouse  2008-08-07  136  		if (cfi_qry_present(map, start, cfi)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  137  			/* Eep. This chip also had the QRY marker.
^1da177e4c3f41 Linus Torvalds   2005-04-16  138  			 * Is it an alias for the new one? */
c314dfdc358847 David Woodhouse  2008-08-07  139  			cfi_qry_mode_off(start, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  140  
^1da177e4c3f41 Linus Torvalds   2005-04-16  141  			/* If the QRY marker goes away, it's an alias */
c314dfdc358847 David Woodhouse  2008-08-07  142  			if (!cfi_qry_present(map, start, cfi)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  143  				xip_allowed(base, map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  144  				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  145  				       map->name, base, start);
^1da177e4c3f41 Linus Torvalds   2005-04-16  146  				return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  147  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  148  			/* Yes, it's actually got QRY for data. Most
^1da177e4c3f41 Linus Torvalds   2005-04-16  149  			 * unfortunate. Stick the new chip in read mode
^1da177e4c3f41 Linus Torvalds   2005-04-16  150  			 * too and if it's the same, assume it's an alias. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  151  			/* FIXME: Use other modes to do a proper check */
c314dfdc358847 David Woodhouse  2008-08-07  152  			cfi_qry_mode_off(base, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  153  
c314dfdc358847 David Woodhouse  2008-08-07  154  			if (cfi_qry_present(map, base, cfi)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  155  				xip_allowed(base, map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  156  				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  157  				       map->name, base, start);
^1da177e4c3f41 Linus Torvalds   2005-04-16  158  				return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  159  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  160  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  161  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  162  
^1da177e4c3f41 Linus Torvalds   2005-04-16  163  	/* OK, if we got to here, then none of the previous chips appear to
^1da177e4c3f41 Linus Torvalds   2005-04-16  164  	   be aliases for the current one. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  165  	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
^1da177e4c3f41 Linus Torvalds   2005-04-16  166  	cfi->numchips++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  167  
^1da177e4c3f41 Linus Torvalds   2005-04-16  168  	/* Put it back into Read Mode */
c314dfdc358847 David Woodhouse  2008-08-07  169  	cfi_qry_mode_off(base, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  170  	xip_allowed(base, map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  171  
^1da177e4c3f41 Linus Torvalds   2005-04-16  172  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  173  	       map->name, cfi->interleave, cfi->device_type*8, base,
^1da177e4c3f41 Linus Torvalds   2005-04-16  174  	       map->bankwidth*8);
^1da177e4c3f41 Linus Torvalds   2005-04-16  175  
^1da177e4c3f41 Linus Torvalds   2005-04-16  176  	return 1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  177  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  178  
0fe3ede7941dfc Aaron Sierra     2018-04-30  179  static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
0fe3ede7941dfc Aaron Sierra     2018-04-30  180  {
0fe3ede7941dfc Aaron Sierra     2018-04-30  181  	/*
0fe3ede7941dfc Aaron Sierra     2018-04-30  182  	 * S70GL02GS flash reports a single 256 MiB chip, but is really made up
0fe3ede7941dfc Aaron Sierra     2018-04-30  183  	 * of two 128 MiB chips with 1024 sectors each.
0fe3ede7941dfc Aaron Sierra     2018-04-30  184  	 */
0fe3ede7941dfc Aaron Sierra     2018-04-30  185  	cfi->cfiq->DevSize = 27;
0fe3ede7941dfc Aaron Sierra     2018-04-30  186  	cfi->cfiq->EraseRegionInfo[0] = 0x20003ff;
0fe3ede7941dfc Aaron Sierra     2018-04-30  187  	pr_warn("Bad S70GL02GS CFI data; adjust to detect 2 chips\n");
0fe3ede7941dfc Aaron Sierra     2018-04-30  188  }
0fe3ede7941dfc Aaron Sierra     2018-04-30  189  
b1c97e2335f24d Aaron Sierra     2018-04-30  190  static const struct cfi_early_fixup cfi_early_fixup_table[] = {
0fe3ede7941dfc Aaron Sierra     2018-04-30  191  	{ CFI_MFR_AMD, 0x4801, fixup_s70gl02gs_chips },
b1c97e2335f24d Aaron Sierra     2018-04-30  192  	{ },
b1c97e2335f24d Aaron Sierra     2018-04-30  193  };
b1c97e2335f24d Aaron Sierra     2018-04-30  194  
^1da177e4c3f41 Linus Torvalds   2005-04-16  195  static int __xipram cfi_chip_setup(struct map_info *map,
^1da177e4c3f41 Linus Torvalds   2005-04-16  196  				   struct cfi_private *cfi)
^1da177e4c3f41 Linus Torvalds   2005-04-16  197  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  198  	int ofs_factor = cfi->interleave*cfi->device_type;
^1da177e4c3f41 Linus Torvalds   2005-04-16  199  	__u32 base = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  200  	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
^1da177e4c3f41 Linus Torvalds   2005-04-16  201  	int i;
ad7026fef6c771 Guillaume LECERF 2010-04-24  202  	int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
^1da177e4c3f41 Linus Torvalds   2005-04-16  203  
^1da177e4c3f41 Linus Torvalds   2005-04-16  204  	xip_enable(base, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  205  #ifdef DEBUG_CFI
^1da177e4c3f41 Linus Torvalds   2005-04-16  206  	printk("Number of erase regions: %d\n", num_erase_regions);
^1da177e4c3f41 Linus Torvalds   2005-04-16  207  #endif
^1da177e4c3f41 Linus Torvalds   2005-04-16  208  	if (!num_erase_regions)
^1da177e4c3f41 Linus Torvalds   2005-04-16  209  		return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  210  
^1da177e4c3f41 Linus Torvalds   2005-04-16  211  	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
5c8b1fbb2e1bfa Jingoo Han       2014-02-06  212  	if (!cfi->cfiq)
^1da177e4c3f41 Linus Torvalds   2005-04-16  213  		return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  214  
^1da177e4c3f41 Linus Torvalds   2005-04-16 @215  	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
^1da177e4c3f41 Linus Torvalds   2005-04-16  216  
^1da177e4c3f41 Linus Torvalds   2005-04-16  217  	cfi->cfi_mode = CFI_MODE_CFI;
^1da177e4c3f41 Linus Torvalds   2005-04-16  218  
08968041bef437 Guillaume LECERF 2010-10-26 @219  	cfi->sector_erase_cmd = CMD(0x30);
08968041bef437 Guillaume LECERF 2010-10-26  220  
^1da177e4c3f41 Linus Torvalds   2005-04-16  221  	/* Read the CFI info structure */
^1da177e4c3f41 Linus Torvalds   2005-04-16  222  	xip_disable_qry(base, map, cfi);
^1da177e4c3f41 Linus Torvalds   2005-04-16  223  	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
^1da177e4c3f41 Linus Torvalds   2005-04-16  224  		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
^1da177e4c3f41 Linus Torvalds   2005-04-16  225  
^1da177e4c3f41 Linus Torvalds   2005-04-16  226  	/* Do any necessary byteswapping */
^1da177e4c3f41 Linus Torvalds   2005-04-16  227  	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
^1da177e4c3f41 Linus Torvalds   2005-04-16  228  
^1da177e4c3f41 Linus Torvalds   2005-04-16  229  	cfi->cfiq->P_ADR = le16_to_cpu(cfi->cfiq->P_ADR);
^1da177e4c3f41 Linus Torvalds   2005-04-16  230  	cfi->cfiq->A_ID = le16_to_cpu(cfi->cfiq->A_ID);
^1da177e4c3f41 Linus Torvalds   2005-04-16  231  	cfi->cfiq->A_ADR = le16_to_cpu(cfi->cfiq->A_ADR);
^1da177e4c3f41 Linus Torvalds   2005-04-16  232  	cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
^1da177e4c3f41 Linus Torvalds   2005-04-16  233  	cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
^1da177e4c3f41 Linus Torvalds   2005-04-16  234  

:::::: The code at line 219 was first introduced by commit
:::::: 08968041bef437ec363623cd3218c2b083537ada mtd: cfi_cmdset_0002: make sector erase command variable

:::::: TO: Guillaume LECERF <glecerf@gmail.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
