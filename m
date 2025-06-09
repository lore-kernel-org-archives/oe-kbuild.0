Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB682E571
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Jun 2025 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749496918; cv=none; b=GdhYGfLCvj4aPtg2xUwscg+ZgiBd5gupIQ8CIHLKZoU3BGk1Bt1rGKLsYLLMsPmicQS1sJAidZvv9M2LVX6iuslTFlJ2OnC4sKjpiGSIqZoWpZfXqkMpKZWSxeE9uPNhpkkgWbUT/meyNp7rm3k06HgMlEEjExn2BY+vW8vVbTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749496918; c=relaxed/simple;
	bh=BKGUfKQk7SxCpyXrcq84MYgth0YLFV/TwTPddoO4toU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e88KvNdCLQ8NIx0+SUehVnf0UInKaJdSN2sWbHK5XhoDNYnhBZ1/ANe6OPFItFgRf9sKyJxyfdMebb9ilmlNvQ29Nu7KrrLzopJaBytoV/44IOWYqZgtywSJbedciLL8DuiL+RE7dE9GLHhZD/KwDQfD6hc6XRxuql3NZnZH5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnHmYWRo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnHmYWRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749496916; x=1781032916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BKGUfKQk7SxCpyXrcq84MYgth0YLFV/TwTPddoO4toU=;
  b=NnHmYWRoyXxyBMyooF6pGzZ5Xfg0XCv50QS3oUNXk9FcjX6+JwhPnUl8
   8IkmMED/MuL+ZDbu8s707ZghvfWMqu7o2Z3UlfjqC2dPaJYtBZD0oeg47
   RP2CFzPRBbFpSzvTohKYEfOl0tJ675GnmRltfiUSon8FW059CB2qCgJru
   XYeF7T/ghMpjbO4JUX/Eh7O3QoGVeyibYJf/QKTT900Ud146rrIqsNnx7
   FfFuNQZasjFxQDsFqjek8UmnYtdVpn4fsVo057GBGkXbohz2VdByBiiRQ
   9CN05Ob5TNBOpjtFyVelG7va/tI/V8IJAik96EH5h03Zj3gxrSk373/+h
   Q==;
X-CSE-ConnectionGUID: idgEEQRITGmmmPYLZE0rGg==
X-CSE-MsgGUID: gZR63ym/SV65o4rK4jmA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51498027"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51498027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:21:54 -0700
X-CSE-ConnectionGUID: Mc/dBh0bQ4y40/ccHPfbEA==
X-CSE-MsgGUID: j6d+biK9Q6+m+UBB8d69dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="183784736"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jun 2025 12:21:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOi46-0007LW-2K;
	Mon, 09 Jun 2025 19:21:50 +0000
Date: Tue, 10 Jun 2025 03:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/mtd/map.h:435:(.xiptext+0xf7): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
Message-ID: <202506100334.qKSAmVes-lkp@intel.com>
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
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: b660d0a2acb9053d627befbb259a397d26aa9582 New implementation for IO memcpy and IO memset
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: xtensa-randconfig-r112-20250609 (https://download.01.org/0day-ci/archive/20250610/202506100334.qKSAmVes-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506100334.qKSAmVes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506100334.qKSAmVes-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0001.c:1250:(.xiptext+0x266): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2098:(.xiptext+0x314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2099:(.xiptext+0x323): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   include/uapi/linux/swab.h:51:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:60:(.xiptext+0x395): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_read':
   drivers/mtd/chips/cfi_cmdset_0001.c:2249:(.xiptext+0x3d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2250:(.xiptext+0x3e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12ec)
   drivers/mtd/chips/cfi_cmdset_0001.c:2259:(.xiptext+0x406): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2261:(.xiptext+0x41c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2270:(.xiptext+0x45c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:2271:(.xiptext+0x464): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0001.c:1583:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1589:(.xiptext+0x506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1590:(.xiptext+0x514): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12ec)
   drivers/mtd/chips/cfi_cmdset_0001.c:1598:(.xiptext+0x53f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1609:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1615:(.xiptext+0x59a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1626:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1629:(.xiptext+0x5ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1638:(.xiptext+0x5e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:1639:(.xiptext+0x5ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1616:(.xiptext+0x5fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1619:(.xiptext+0x60a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1620:(.xiptext+0x622): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1963:(.xiptext+0x6d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1964:(.xiptext+0x6de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12ec)
   drivers/mtd/chips/cfi_cmdset_0001.c:1972:(.xiptext+0x708): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1975:(.xiptext+0x717): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1978:(.xiptext+0x72f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1979:(.xiptext+0x747): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1990:(.xiptext+0x786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1993:(.xiptext+0x7a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1998:(.xiptext+0x7b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0x7d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2012:(.xiptext+0x7f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2019:(.xiptext+0x812): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2022:(.xiptext+0x830): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2024:(.xiptext+0x846): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:2025:(.xiptext+0x84e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2028:(.xiptext+0x862): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2037:(.xiptext+0x87e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:2038:(.xiptext+0x886): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2004:(.xiptext+0x896): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:2007:(.xiptext+0x8a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2008:(.xiptext+0x8be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2131:(.xiptext+0x947): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2132:(.xiptext+0x957): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12ec)
   drivers/mtd/chips/cfi_cmdset_0001.c:2139:(.xiptext+0x974): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2141:(.xiptext+0x986): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2143:(.xiptext+0x9a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2146:(.xiptext+0x9cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2149:(.xiptext+0x9f5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2149:(.xiptext+0x9fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0001.c:2167:(.xiptext+0xa42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2170:(.xiptext+0xa66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2176:(.xiptext+0xa8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:2177:(.xiptext+0xa92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1748:(.xiptext+0xb81): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1750:(.xiptext+0xb92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1751:(.xiptext+0xba0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12ec)
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0xbca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1766:(.xiptext+0xbde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1770:(.xiptext+0xc04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1784:(.xiptext+0xc47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1787:(.xiptext+0xc73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1788:(.xiptext+0xc8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1790:(.xiptext+0xcb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1803:(.xiptext+0xce8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1f48)
   drivers/mtd/chips/cfi_cmdset_0001.c:1807:(.xiptext+0xd00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1820:(.xiptext+0xd3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1f48)
   drivers/mtd/chips/cfi_cmdset_0001.c:1822:(.xiptext+0xd5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1844:(.xiptext+0xdb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1852:(.xiptext+0xde6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1855:(.xiptext+0xe07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1861:(.xiptext+0xe24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1872:(.xiptext+0xe46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1875:(.xiptext+0xe56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1884:(.xiptext+0xe6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe30)
   drivers/mtd/chips/cfi_cmdset_0001.c:1885:(.xiptext+0xe76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1862:(.xiptext+0xe86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1865:(.xiptext+0xe96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1866:(.xiptext+0xeae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1772:(.xiptext+0xee2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1773:(.xiptext+0xeec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xde8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1774:(.xiptext+0xefa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1775:(.xiptext+0xf13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x55): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:426:(.xiptext+0x5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   include/linux/mtd/map.h:406:(.xiptext+0xc1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:406:(.xiptext+0xca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
>> include/linux/mtd/map.h:433:(.xiptext+0xea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
>> include/linux/mtd/map.h:435:(.xiptext+0xf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_to':
>> include/linux/mtd/map.h:440:(.xiptext+0x10f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   drivers/mtd/maps/physmap-bt1-rom.o: in function `bt1_rom_map_copy_from':
   drivers/mtd/maps/physmap-bt1-rom.c:80:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/maps/physmap-bt1-rom.c:81:(.xiptext+0x4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/physmap-bt1-rom.c:88:(.xiptext+0x60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/maps/physmap-bt1-rom.c:89:(.xiptext+0x6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/physmap-bt1-rom.c:96:(.xiptext+0x84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/maps/physmap-bt1-rom.c:97:(.xiptext+0x92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/physmap-bt1-rom.o: in function `bt1_rom_map_read':
   drivers/mtd/maps/physmap-bt1-rom.c:39:(.xiptext+0xb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/maps/physmap-bt1-rom.c:51:(.xiptext+0xdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_from':
   drivers/mtd/maps/physmap-gemini.c:106:(.xiptext+0x13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_from':
   include/linux/mtd/map.h:433:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:435:(.xiptext+0x36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_from':
   drivers/mtd/maps/physmap-gemini.c:108:(.xiptext+0x3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x54)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_write':
   drivers/mtd/maps/physmap-gemini.c:97:(.xiptext+0x67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0xa9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:426:(.xiptext+0xb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_write':
   drivers/mtd/maps/physmap-gemini.c:99:(.xiptext+0xbb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x54)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_read':
   drivers/mtd/maps/physmap-gemini.c:86:(.xiptext+0xe7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_read':
   include/linux/mtd/map.h:406:(.xiptext+0x128): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:406:(.xiptext+0x131): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_read':
   drivers/mtd/maps/physmap-gemini.c:88:(.xiptext+0x137): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x54)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_to':
   drivers/mtd/maps/physmap-gemini.c:115:(.xiptext+0x14f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_to':
   include/linux/mtd/map.h:440:(.xiptext+0x15e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   drivers/mtd/maps/physmap-gemini.o: in function `gemini_flash_map_copy_to':
   drivers/mtd/maps/physmap-gemini.c:117:(.xiptext+0x164): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x54)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +435 include/linux/mtd/map.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  429  
^1da177e4c3f41 Linus Torvalds 2005-04-16  430  static inline void inline_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
^1da177e4c3f41 Linus Torvalds 2005-04-16  431  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  432  	if (map->cached)
^1da177e4c3f41 Linus Torvalds 2005-04-16 @433  		memcpy(to, (char *)map->cached + from, len);
^1da177e4c3f41 Linus Torvalds 2005-04-16  434  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16 @435  		memcpy_fromio(to, map->virt + from, len);
^1da177e4c3f41 Linus Torvalds 2005-04-16  436  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  437  
^1da177e4c3f41 Linus Torvalds 2005-04-16  438  static inline void inline_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
^1da177e4c3f41 Linus Torvalds 2005-04-16  439  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @440  	memcpy_toio(map->virt + to, from, len);
^1da177e4c3f41 Linus Torvalds 2005-04-16  441  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  442  

:::::: The code at line 435 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
