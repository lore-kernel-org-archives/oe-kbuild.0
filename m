Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC2A55
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725708217; cv=none; b=ELyOjlrAEYFFt9nvyojdR0f+Zz2jOym/OiuMykvOZcaoehpyldzBEQVk3+q2XvswwprMM/gAv9MbFmpT70NU2qvXmLZt5FPqDoAfcxyZ/EJhcoc+T9fB8GUd62gGz95WFs4RH2tKYwjANO+AES8jCbCIRSXLpFee3SgoAPr8Pqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725708217; c=relaxed/simple;
	bh=/e2gi66D+ZdzojyI0DhPMUEWiPeUzf/CuKNz4OcwwwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUN0N1knRwTLyATfSIKO4YPsKdwAJQDj5L/ZSU90n70pEGxWX16iYXC4heD1V2H5c/8Il5/iA0tOH65PCVXSocrpQ9qKpcz3/PWO5QMUk3epxGCFJxQDyFhUFbGn0x2BSF4Qer3C9ECX0iTQrPdIQfeRMefM4EhFfoeA0p+DBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7/2Rhhc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7/2Rhhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725708215; x=1757244215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/e2gi66D+ZdzojyI0DhPMUEWiPeUzf/CuKNz4OcwwwA=;
  b=D7/2RhhciM3sNRF8z91TwASsYLEZyGVclDiJODKnqjcVCgbPA9fUCTA4
   Bulby6PP6bfcuJADzHHFDjkK6Zeds5piC8ocyspY3I7vC2ProScbbj0WQ
   hxH04QP4MPtiR+o6NL1KJOPYaATxIwH0udT38XTzDg/QAKumWmbmgDAKx
   cle7+YJ40FsCziQcksNX+4lISwTIrYzRx7t3JPu1jVWrZ7l7EuSHRqhmG
   mnyyb1FnV1xmKU/laMNrC9ANuL5AlPQ8kMSfg3FepIKvJ2HFmts0fORxE
   eeoyRabqg5wdKvWAvOEIGZqDE2N5wVScTXwmBFPXwz4UZcNdeSnhS/s6Q
   Q==;
X-CSE-ConnectionGUID: T78ErNd9RQSJcGZuCwYe/A==
X-CSE-MsgGUID: 6El/MRJ1RVChtUFZ+nohVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35034965"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35034965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:23:34 -0700
X-CSE-ConnectionGUID: vLsqR6ZeSwmb+2HmT8h1pA==
X-CSE-MsgGUID: Fr4cl41HRVKVuQgCuF9kVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70598241"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2024 04:23:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smtXO-000CVX-10;
	Sat, 07 Sep 2024 11:23:30 +0000
Date: Sat, 7 Sep 2024 19:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_util.c:(.xiptext+0x44b): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: __tsan_write4
Message-ID: <202409071944.0GogPfvH-lkp@intel.com>
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
head:   b31c4492884252a8360f312a0ac2049349ddf603
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071944.0GogPfvH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071944.0GogPfvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409071944.0GogPfvH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_util.o:(.xiptext+0x12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o:(.xiptext+0x1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0xe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0xfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x118): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x148): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x16e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x183): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x19a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x1b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x1ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x1fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x21a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x222): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x23a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x286): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x28e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x2a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x2c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x2e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x306): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0x310): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x327): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x32f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x350): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x35e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x383): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x39a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0x3e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0x3fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x412): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x423): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_util.c:(.xiptext+0x432): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x43f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
>> cfi_util.c:(.xiptext+0x44b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   cfi_util.c:(.xiptext+0x460): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_util.c:(.xiptext+0x46b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x476): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   cfi_util.c:(.xiptext+0x48e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_util.c:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x4ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x4e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x4ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_util.c:(.xiptext+0x51b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_util.c:(.xiptext+0x528): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   cfi_util.c:(.xiptext+0x54e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_util.c:(.xiptext+0x55d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_check_err_status':
   cfi_cmdset_0002.c:(.text+0x12cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1312): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `kmalloc_array_noprof':
   cfi_cmdset_0002.c:(.text+0x146f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x147f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0x17d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x1db7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1eb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x2583): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x259c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `fwh_xxlock_oneblock':
   cfi_cmdset_0002.c:(.text+0x2b9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x2bd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2c4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x30bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x30f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2c4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x36c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_ppb_unlock':
   cfi_cmdset_0002.c:(.text+0x386a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c0)
   cfi_cmdset_0002.c:(.text+0x38f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c0)
   cfi_cmdset_0002.c:(.text+0x3a46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x3bb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x804)
   cfi_cmdset_0002.c:(.text+0x3cea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1218)
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0xa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0xa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0xdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x10b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x162): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x172): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x187): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x190): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x19c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0x1ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x1cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x1d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x1eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x20a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x216): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x234): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x243): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   cfi_cmdset_0002.c:(.xiptext+0x263): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x274): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x2ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x2d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x2e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x2f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x320): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x333): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   cfi_cmdset_0002.c:(.xiptext+0x346): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x358): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x3ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x3c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   cfi_cmdset_0002.c:(.xiptext+0x3da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   cfi_cmdset_0002.c:(.xiptext+0x3fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x400): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_cmdset_0002.c:(.xiptext+0x40b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
