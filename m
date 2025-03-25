Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81596253F1C
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742904518; cv=none; b=fvzC86B7r37m1BtDokRZr5nzDgz177cjPKxbTXzfhyJz/Ug0jU6dTTnkx2YTQOAlbYCuGNA9akL2r5HEB/0h8anYMr5KrB552f50UKkUh+ixzlC8a9XWBQHCGAzBoe6VFtQoZD3Yz/iWPejseiweL6EcVL6T/DdnkDivCGF9ea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742904518; c=relaxed/simple;
	bh=LlyrtBuHcEB+TJfCdU0YRDOiJoYMlJI53AQYhMlxkbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8g8qqk+GXoQ8iPSSNTRuvym44Y93ugZTW0wE19UJ013pOhSW624NfNZJiMWuWonCLFjG0+RFYaxcEN+mmPBrwyJFipTRzwI9yqyGpqsyTCIVXCW9OXaIE35iPjYeErBjrZDGXP/L5jAr2t8c6V5GHvtdiAwV+NLe04sRu98c5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH0GUQ/l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH0GUQ/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742904517; x=1774440517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlyrtBuHcEB+TJfCdU0YRDOiJoYMlJI53AQYhMlxkbc=;
  b=dH0GUQ/lpj6IRK2loQSi7FuimSq/a//RJOCiaSBPFOMrmQ+1zRL212el
   CxYiYceDRrvGxfiJgvX5nsRZ7FIabO+pD2jlX6tdKJv+dJFyjgUyacMoj
   tM0/0COHc3E/UTGNvK+oq4hdxXdSjCpEjqQ59oIDxOVFBO5L91SAi3Hwd
   6+LPYm8/ZY9FFPu72654+PKa/QtL8q/+nmE3ajy9nDmwUvRa0yER2nDCJ
   0n6Ejm0gjwalfY8tksOxrvGhcCxji1wAU1lqWXMJstA8NegtPtl55NhkT
   ndkURlM02cJT26YFg1cCLhDCI+0bO9R8pOMPxxnu0CZ1o2xuT7vyHPZhP
   w==;
X-CSE-ConnectionGUID: JN5eOLhFQIS298png2sXoA==
X-CSE-MsgGUID: EMI+t8HmQb6zJVdnORYBMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54809529"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="54809529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 05:08:36 -0700
X-CSE-ConnectionGUID: xjSrp5lGQuaIgGYnOHyliA==
X-CSE-MsgGUID: 5HjXP4E1QqSY9U1XCoa3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="125138805"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2025 05:08:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx354-0004LN-17;
	Tue, 25 Mar 2025 12:08:31 +0000
Date: Tue, 25 Mar 2025 20:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0xc4): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 __kmalloc_noprof
Message-ID: <202503251950.V4PdsX51-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2df0c02dab829dd89360d98a8a1abaa026ef5798
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-r123-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251950.V4PdsX51-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250325/202503251950.V4PdsX51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503251950.V4PdsX51-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x99): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
>> drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0xc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:211:(.xiptext+0xf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x142): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x183): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x1a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x1be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x1db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x1f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/uapi/linux/swab.h:51:(.xiptext+0x236): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x2a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:252:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:202:(.xiptext+0x2ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x2e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x2ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x324): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc)
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x332): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc)
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x36b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x13c)
   drivers/mtd/chips/cfi_probe.c:276:(.xiptext+0x38c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:285:(.xiptext+0x3d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x43a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x47c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:123:(.xiptext+0x528): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:120:(.xiptext+0x53a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:136:(.xiptext+0x578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:139:(.xiptext+0x58a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:154:(.xiptext+0x5e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x604): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0x2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:222:(.xiptext+0x3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:244:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x127): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x157): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x16c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x183): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x1ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x1f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x227): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x272): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x288): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x29e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:272:(.xiptext+0x2b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x2ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:278:(.xiptext+0x31b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x357): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x38e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x3c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.c:294:(.xiptext+0x3ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x3fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x477): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x488): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   include/linux/mtd/cfi.h:311:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0020.o: in function `cfi_cmdset_0020':
   drivers/mtd/chips/cfi_cmdset_0020.c:128:(.text+0x26bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0x132e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0x1410): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x19ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x19d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x208f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x20de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x248)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2768:(.text+0x238a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2777:(.text+0x23d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x248)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2190:(.text+0x2750): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2207:(.text+0x2792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2271:(.text+0x299a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2277:(.text+0x29d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x2ce7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x34b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1064)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1860:(.text+0x3693): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1064)
   drivers/mtd/chips/cfi_cmdset_0002.c:1884:(.text+0x371c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1064)


vim +204 drivers/mtd/chips/cfi_probe.c

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
^1da177e4c3f41 Linus Torvalds   2005-04-16 @204  	xip_enable(base, map, cfi);
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
^1da177e4c3f41 Linus Torvalds   2005-04-16  215  	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
^1da177e4c3f41 Linus Torvalds   2005-04-16  216  
^1da177e4c3f41 Linus Torvalds   2005-04-16  217  	cfi->cfi_mode = CFI_MODE_CFI;
^1da177e4c3f41 Linus Torvalds   2005-04-16  218  
08968041bef437 Guillaume LECERF 2010-10-26  219  	cfi->sector_erase_cmd = CMD(0x30);
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

:::::: The code at line 204 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
