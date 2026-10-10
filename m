Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B865FDA7
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Oct 2026 23:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791676066; cv=none; b=AlWX3qzr3DPcBxt+HIJ4fMayljSj417KSWmoKA81LdqrIHavX0JRq1DGfouHpODf+iM/8q6F4fZAtGnE34a22WbracNxLCDkzMJrLOB5SblfubCiupUWrgaQ5dYsKOFKpdZa/iqYh3ReJ6qvFugVP3AV5ULKvpzu5DraIpv2qPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791676066; c=relaxed/simple;
	bh=gcZKnJEt6ZMednmYaJE5n8I8DUQEpZ0CBpF5GJ0yyAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K7wLDubCldiqqFA8HNR9KrNnbD3CdyVkCbTYxUWRzru3d5HLNjqctqDDbh2gzWwCMnxXqJR6L4VLnDNL2c93gVK1Pmcg/whO0EDg7a1X/U3E3ve4Q/zDfplEKhnSDuhtMk3TpB46DYPWTr677H9fN97/p+dv3bE1h9cADV0JDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRMYbx0H; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRMYbx0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791676064; x=1823212064;
  h=date:from:to:cc:subject:message-id;
  bh=gcZKnJEt6ZMednmYaJE5n8I8DUQEpZ0CBpF5GJ0yyAI=;
  b=fRMYbx0HvpcGfxQoUTnZls8kqsDG6gyJ6DTKRq9G/8+camiwMXhPE7xG
   s4DQK0dCjClYiRTzA0Aw5FpezUoHgUGpZi8/EqUmS2WE/8lA6ZDAI3jo+
   9Rx1L0TemEAH5hcTNHmDJO/xboCcPs0/LY81DzpwCx1o3Tt4Oir1KkWOd
   E2VUkwcKvTxaH+53zoYqE2Pe2GkN6KRb/piQv+IHdAN5zuPve5Bf8NoFC
   w0SfLK9xmOIEWA9g4ZZnxSxxGAD1pCc3RQ/D3sYSiiqiaDM3y1OeC9cV1
   8pNp5UVUnSGA4fkT0sbWkV9Fx7tkdJeSInxReYu+6A/jESBDpzyz3Hwco
   g==;
X-CSE-ConnectionGUID: kiShIaZWQDSJ4+S6H3pbnQ==
X-CSE-MsgGUID: Fsr1cvxzR9SV+hPlQDPrQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="541261"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="541261"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 16:47:37 -0700
X-CSE-ConnectionGUID: 6kuz1ZydRBKyLsmYArKvJQ==
X-CSE-MsgGUID: eWVs/cwzRAi6ihl/YYvWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="2420362"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 10 Oct 2026 16:47:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFgmq-000000009Il-3dw1;
	Sat, 10 Oct 2026 23:47:32 +0000
Date: Sun, 11 Oct 2026 01:46:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/overflow.h:53:(.xiptext+0x12c): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 ftrace_likely_update
Message-ID: <202610110150.oIjslj7L-lkp@intel.com>
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
TO: Gopi Krishna Menon <krishnagopi487@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

Hi Gopi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   1 year ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-r2300-20261009 (https://download.01.org/0day-ci/archive/20261011/202610110150.oIjslj7L-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110150.oIjslj7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d496b6f42eb0 ("mtd: cfi: use struct_size() helper for cfiq allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610110150.oIjslj7L-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x111): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `__must_check_overflow':
>> include/linux/overflow.h:53:(.xiptext+0x12c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   include/linux/overflow.h:53:(.xiptext+0x13a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
   include/linux/slab.h:909:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x15b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x16b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x17f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x384): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x39a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x3b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x3ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x3c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x3e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x100)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x3f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x100)
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x419): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x4d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x505): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:143:(.xiptext+0x598): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x5cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:170:(.xiptext+0x624): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x110): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x14e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x163): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x19c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x1b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x1d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:268:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x203): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x218): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x253): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x268): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x2e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x2f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x32a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `kmalloc_noprof':
   include/linux/slab.h:909:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x386): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.c:333:(.xiptext+0x3a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0xba3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0xc54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2766:(.text+0x13f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2775:(.text+0x140a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x23c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x14e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x78c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x16e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x1aeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x1b1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x1c3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x1c4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x237e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x2432): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x255c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x2638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfb0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x285b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x2cbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x2d28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x3412): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x342a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x23c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x120): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x134): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x19e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x1bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x2b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x35e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x36c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x376): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue


vim +53 include/linux/overflow.h

f0907827a8a9152 Rasmus Villemoes 2018-05-08  45  
9b80e4c4ddaca35 Kees Cook        2020-08-12  46  /*
9b80e4c4ddaca35 Kees Cook        2020-08-12  47   * Allows for effectively applying __must_check to a macro so we can have
9b80e4c4ddaca35 Kees Cook        2020-08-12  48   * both the type-agnostic benefits of the macros while also being able to
9b80e4c4ddaca35 Kees Cook        2020-08-12  49   * enforce that the return value is, in fact, checked.
9b80e4c4ddaca35 Kees Cook        2020-08-12  50   */
9b80e4c4ddaca35 Kees Cook        2020-08-12  51  static inline bool __must_check __must_check_overflow(bool overflow)
9b80e4c4ddaca35 Kees Cook        2020-08-12  52  {
9b80e4c4ddaca35 Kees Cook        2020-08-12 @53  	return unlikely(overflow);
9b80e4c4ddaca35 Kees Cook        2020-08-12  54  }
9b80e4c4ddaca35 Kees Cook        2020-08-12  55  

:::::: The code at line 53 was first introduced by commit
:::::: 9b80e4c4ddaca3501177ed41e49d0928ba2122a8 overflow: Add __must_check attribute to check_*() helpers

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
