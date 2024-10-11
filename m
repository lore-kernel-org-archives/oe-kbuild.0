Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493571CEE86
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Oct 2024 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728686388; cv=none; b=oDrvxIkFtx09CMdr35r+tw70gBIlzvMYYnzk++QyW/yE8ovH6Mq1uYiVwY0ATn5AboT6B+dnEQQsQVGB1/VXca8IXqw0Nb99j+h8NS+chMtZEXZ8VciEm5OB4gStnwkBqv7u74/4m85M6zNSgwqouEY2VrPvW5irVI2og25kcxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728686388; c=relaxed/simple;
	bh=/IND745LvSGH216GGUfy9YD9WfC8dRgXvAaQqZjXAMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7K8JgJHqeoaJzkD81LY+hTr9XTGkAnnpTpq5xDMRGu/i6ckRS4ZlsKz9xM28KQhr25mSKhOhgor/W1cT1/gYrar7/ySgH8Sh277DU7TlViP6cziq53RbFzMpbtPtJ3EyUG4NpAp9/ZS0urmilUQt/cEWCxjuCWprlXrO0E6Bhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWHUAnao; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWHUAnao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728686383; x=1760222383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/IND745LvSGH216GGUfy9YD9WfC8dRgXvAaQqZjXAMI=;
  b=OWHUAnaofXkujKjcISM6+5G36PjWNp3uBCUTN0Fck13lkAhYvz/PPJVg
   +OvI8I4jJRSkF9545tQ+24n7v78vhrvyIbA24ZP0DHkayPYYkYdPJ1rHz
   UQMQ8ETAGVj1l6HUuKzX3DRv6xCgU4FJUKc+eBqhpgHR3DxHUQfZxb0ac
   B/JctQM5OA3ovEevrXcniv9flUCCEUbH2eX+W2IGXr+T2TaiemeaTp1CU
   DuBC6Br9V/zgfvqRSzPWUdj1NAfKqxRjL/ZEq2HVbhetgT8E811tDUHLa
   MqxGLcIc6bz9U9S9/qBW0huGoGS36G6Ewh8WpIW6QwdQIbfuCJda6e4BI
   w==;
X-CSE-ConnectionGUID: tNBoKJ1kQjmWYfLA+oY7zw==
X-CSE-MsgGUID: OuDHA1tdQYqP6uehJs08dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27910971"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="27910971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 15:39:43 -0700
X-CSE-ConnectionGUID: CfzQI5gKRemP7N1VlkAwDQ==
X-CSE-MsgGUID: R+SMzayLT0KbW9bNNouFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="81851272"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 15:39:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szOIN-000Co7-19;
	Fri, 11 Oct 2024 22:39:39 +0000
Date: Sat, 12 Oct 2024 06:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/slab.h:664:(.xiptext+0xcb): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
Message-ID: <202410120617.W1aKtvJA-lkp@intel.com>
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
head:   9e4c6c1ad9a195f28ec3d3d5054e25f6bdde87bd
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120617.W1aKtvJA-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120617.W1aKtvJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410120617.W1aKtvJA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0x8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0xa9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> include/linux/slab.h:664:(.xiptext+0xcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0xeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0xff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/uapi/linux/swab.h:51:(.xiptext+0x146): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x163): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x180): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x19e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x1bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:60:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x272): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x287): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x2b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x50)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x50)
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x2f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x315): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x40c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x435): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:156:(.xiptext+0x4ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:170:(.xiptext+0x520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:172:(.xiptext+0x53c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0xe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x137): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x170): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x187): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x1ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:268:(.xiptext+0x1c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x1db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x1f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x216): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x22c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x258): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x298): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x2b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x2ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:309:(.xiptext+0x344): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   include/linux/slab.h:664:(.xiptext+0x352): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x36a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   include/uapi/linux/swab.h:51:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:60:(.xiptext+0x3c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:333:(.xiptext+0x3ed): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2190:(.text+0xc33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2207:(.text+0xc66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2271:(.text+0xd48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2277:(.text+0xd5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0xf5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0x12ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0x1373): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x181f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x1837): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2768:(.text+0x1cd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2777:(.text+0x1d02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1d4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x2070): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x209e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1d4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x24b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc4c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1860:(.text+0x2622): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1884:(.text+0x267a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1927:(.text+0x2762): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc4c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2139:(.text+0x2856): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x5d0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2629:(.text+0x28fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xcfc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x58)
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd


vim +664 include/linux/slab.h

a0c3b940023eef Hyeonggon Yoo         2022-08-17  596  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  597  /**
838de63b101147 Vlastimil Babka       2022-11-10  598   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  599   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka       2022-11-10  600   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter     2013-09-04  601   *
f1b6eb6e6be149 Christoph Lameter     2013-09-04  602   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  603   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap          2013-11-22  604   *
59bb47985c1db2 Vlastimil Babka       2019-10-06  605   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka       2019-10-06  606   * bytes. For @size of power of two bytes, the alignment is also guaranteed
59bb47985c1db2 Vlastimil Babka       2019-10-06  607   * to be at least to the size.
59bb47985c1db2 Vlastimil Babka       2019-10-06  608   *
01598ba6b1a863 Mike Rapoport         2018-11-11  609   * The @flags argument may be one of the GFP flags defined at
e9d198f2be851f Thorsten Scherer      2023-03-12  610   * include/linux/gfp_types.h and described at
01598ba6b1a863 Mike Rapoport         2018-11-11  611   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap          2013-11-22  612   *
01598ba6b1a863 Mike Rapoport         2018-11-11  613   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab 2020-04-10  614   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap          2013-11-22  615   *
01598ba6b1a863 Mike Rapoport         2018-11-11  616   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap          2013-11-22  617   *
01598ba6b1a863 Mike Rapoport         2018-11-11  618   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport         2018-11-11  619   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  620   *
01598ba6b1a863 Mike Rapoport         2018-11-11  621   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport         2018-11-11  622   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  623   *
01598ba6b1a863 Mike Rapoport         2018-11-11  624   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport         2018-11-11  625   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  626   *
7e3528c3660a2e Randy Dunlap          2013-11-22  627   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap          2013-11-22  628   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap          2013-11-22  629   *
838de63b101147 Vlastimil Babka       2022-11-10  630   * %__GFP_ZERO
838de63b101147 Vlastimil Babka       2022-11-10  631   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka       2022-11-10  632   *
01598ba6b1a863 Mike Rapoport         2018-11-11  633   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport         2018-11-11  634   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  635   *
01598ba6b1a863 Mike Rapoport         2018-11-11  636   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  637   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap          2013-11-22  638   *	(think twice before using).
7e3528c3660a2e Randy Dunlap          2013-11-22  639   *
01598ba6b1a863 Mike Rapoport         2018-11-11  640   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport         2018-11-11  641   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap          2013-11-22  642   *	then give up at once.
7e3528c3660a2e Randy Dunlap          2013-11-22  643   *
01598ba6b1a863 Mike Rapoport         2018-11-11  644   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport         2018-11-11  645   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap          2013-11-22  646   *
01598ba6b1a863 Mike Rapoport         2018-11-11  647   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  648   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko          2017-07-12  649   *	eventually.
f1b6eb6e6be149 Christoph Lameter     2013-09-04  650   */
7bd230a26648ac Suren Baghdasaryan    2024-03-21  651  static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter     2013-09-04  652  {
6fa57d78aa7f21 Kees Cook             2022-11-17  653  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka       2018-10-26  654  		unsigned int index;
3bf019334fbbb5 Kees Cook             2022-11-17  655  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  656  		if (size > KMALLOC_MAX_CACHE_SIZE)
7bd230a26648ac Suren Baghdasaryan    2024-03-21  657  			return kmalloc_large_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  658  
cc252eae85e095 Vlastimil Babka       2018-10-26  659  		index = kmalloc_index(size);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  660  		return kmalloc_trace_noprof(
3c615294058429 GONG, Ruiqi           2023-07-14  661  				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
f1b6eb6e6be149 Christoph Lameter     2013-09-04  662  				flags, size);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  663  	}
7bd230a26648ac Suren Baghdasaryan    2024-03-21 @664  	return __kmalloc_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  665  }
7bd230a26648ac Suren Baghdasaryan    2024-03-21  666  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
ce6a50263d4dde Christoph Lameter     2013-01-10  667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
