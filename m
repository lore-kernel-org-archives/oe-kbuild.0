Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA225E806
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Mar 2025 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922300; cv=none; b=WCS8bmVJ7HUgneLeAPmFTG/ijZhNlPKQTOUBh2zToiqzocrhXG1EyGyJPQHRv+xdpaa1K+Kw0M/Lc/6zUZF52epe/+iB34obt8R2Tp70fyfgy3UlmhPXzXMQ86Etp+nCzvu0HR2uk4Nc65klQf7UqiK9lzyxqXcG6GIhNGGPxmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922300; c=relaxed/simple;
	bh=NyReKNpaRukcH3+0Cqj3kz8HMrFr4m14VPzj/DED2HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTwSFVPixmYFfzLaU+iD5tTXOpTmd5n4TmlXuDdLHB9BQQMHwZm2Ge9nwOo5HGDxXrRpt3kXafFngx0PEH9h+J4nWn7bMJ9iIVywgMI1GYBlrGxk6vw6jHVS9nrnS0QromCfVYre0OhnDRa1jVKiFOv1/dfmHOSRf/V4UmfjvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Id6Imn38; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Id6Imn38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742922297; x=1774458297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyReKNpaRukcH3+0Cqj3kz8HMrFr4m14VPzj/DED2HU=;
  b=Id6Imn383n4dgXPtiJoS3slPb2wy6cyKzs/2g1MvbDLlve/LMIncD8dI
   giMWaZZ0e8YV7vO95RTLlqM8oOnspOgsfKZ1J1ugKF/yBTzGEGIv85MC+
   9NShhvQo6IV0jebo242zkZOd/aVV39FkTwwsbFa4JDkDY6Ml9VAkymQYb
   LCJoogAMRI8K4/6ct5Wodcm9lTZspQlbnNxVKuDtJsH2/5vme+4yirAFn
   bP4SPNF9pWnNQlx9MG1EoqW7oq96DCFSEF5jf7HUrfnMDP47O1OF9qbTY
   UMJDecPsLuWTTZGITccrXfQ3KPJ8Jy/zv/Zr+2xHyoRyVfNqrFQKktxSg
   Q==;
X-CSE-ConnectionGUID: vyxx2eNYQ02d5SQpRaIceQ==
X-CSE-MsgGUID: IAAWmeBkToy1JfpNcQcy/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44363868"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44363868"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 10:04:54 -0700
X-CSE-ConnectionGUID: RfYAe7YjStC/Fryp06GEyQ==
X-CSE-MsgGUID: NbefuLWIRpOEh2vsblTqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="125232778"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2025 10:04:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx7hr-00052X-1J;
	Tue, 25 Mar 2025 17:04:51 +0000
Date: Wed, 26 Mar 2025 01:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/sched.h:2009:(.xiptext+0x3ef): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
Message-ID: <202503260045.MLLwWY5U-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2df0c02dab829dd89360d98a8a1abaa026ef5798
commit: 86e50ab6f8a0f5d5e933bece9d0b1d0ddaa4162e arch/xtensa: always_inline get_current() and current_thread_info()
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-r123-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260045.MLLwWY5U-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250326/202503260045.MLLwWY5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503260045.MLLwWY5U-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/mtd/chips/cfi_cmdset_0020.c:128:(.text+0x26ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0x1336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0x1418): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x19c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x19df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x209b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x20ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x244)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2768:(.text+0x2396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2777:(.text+0x23e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x244)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2190:(.text+0x275c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2207:(.text+0x279e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2271:(.text+0x29a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2277:(.text+0x29e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x2cf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x34be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1860:(.text+0x36a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:1884:(.text+0x3730): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:1927:(.text+0x3863): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2139:(.text+0x3a0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x74c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2629:(.text+0x3b26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1128)
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x44)
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x11a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x152): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1997:(.xiptext+0x16a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x17e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2010:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x1c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x1f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x24a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x262): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x2b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x36e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x39c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x3bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x3e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
>> include/linux/sched.h:2009:(.xiptext+0x3ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x3f5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x402): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x40c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x42e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x457): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x690)
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x4ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x4fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x51e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x542): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x54f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x555): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1942:(.xiptext+0x560): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   include/linux/jiffies.h:574:(.xiptext+0x572): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x5ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1965:(.xiptext+0x5da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1978:(.xiptext+0x62a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1981:(.xiptext+0x64a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7ec)
   drivers/mtd/chips/cfi_cmdset_0002.c:1982:(.xiptext+0x67e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x687): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0x6a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0x6b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0x6c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0x6da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0x702): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x76c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0x752): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0x77c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2022:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2033:(.xiptext+0x830): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x85c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2041:(.xiptext+0x86a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2041:(.xiptext+0x88f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2044:(.xiptext+0x8a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2045:(.xiptext+0x8d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2058:(.xiptext+0x952): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2062:(.xiptext+0x95a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2081:(.xiptext+0x9be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2081:(.xiptext+0x9d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x9e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3080)
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x9fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2088:(.xiptext+0xa0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2092:(.xiptext+0xa40): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2092:(.xiptext+0xa5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2513:(.xiptext+0xab2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2516:(.xiptext+0xad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0xae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2519:(.xiptext+0xafb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2524:(.xiptext+0xb10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2525:(.xiptext+0xb24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2533:(.xiptext+0xb96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xb9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xba5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2534:(.xiptext+0xbb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2535:(.xiptext+0xbbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2541:(.xiptext+0xc1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2550:(.xiptext+0xc6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0xc9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2574:(.xiptext+0xd0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11c0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2574:(.xiptext+0xd12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2580:(.xiptext+0xd3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2575:(.xiptext+0xd53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0xd67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2581:(.xiptext+0xd7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2596:(.xiptext+0xdbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:2603:(.xiptext+0xdde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdf1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0xdfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2605:(.xiptext+0xe12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xe57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xe62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xe92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xedc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0xf52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0xf6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0xfba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x33f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1709:(.xiptext+0xff7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0x105e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x107a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0x109a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1776:(.xiptext+0x112e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1777:(.xiptext+0x1144): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x1158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3080)
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x1166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1782:(.xiptext+0x1174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)


vim +2009 include/linux/sched.h

b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18  2005) 
b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18  2006) static inline int _cond_resched(void)
b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18  2007) {
e3ff7c609f3967 Josh Poimboeuf         2023-02-24  2008  	klp_sched_try_switch();
b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18 @2009) 	return __cond_resched();
b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18  2010) }
b965f1ddb47daa Peter Zijlstra (Intel  2021-01-18  2011) 

:::::: The code at line 2009 was first introduced by commit
:::::: b965f1ddb47daa5b8b2e2bc9c921431236830367 preempt/dynamic: Provide cond_resched() and might_resched() static calls

:::::: TO: Peter Zijlstra (Intel) <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
