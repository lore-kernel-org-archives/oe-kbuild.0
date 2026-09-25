Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775FE3B05AA
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368686; cv=none; b=umYB3N9wWK9HnB9/5tyu51LbzWV76bX+kPTaJ47nAoD64f/HTC5A3WdUtbKVktsw79R2iME/NwEp5DO0q1U1GuQmxl+dW0So2OFMd3icozdXLybzbhiT6SBAc9yCH0z1Mc28fxQUBAr7z4c0gl31aPn6RXon82eZh98HRGIMpzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368686; c=relaxed/simple;
	bh=Bh65mH887OLgi7yOL8P98f3vSpK9qzF3DoPvk+dRkFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cML4gfSoirgxKWY71PzOGlmuHE8B/0ssfwIrOTvYMa88dFEXRDASIo5yJb5AbALV1icJ82eO20dPHTfYcEJnwxAF5OBEDkheKrRsRGiUYYJA/G9MZ9nF4kfMZ7djFAppE/0P9R52XadVvee5epRxKJbepslvznVxJ0mK0SVS5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boAhsMqb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boAhsMqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790368685; x=1821904685;
  h=date:from:to:cc:subject:message-id;
  bh=Bh65mH887OLgi7yOL8P98f3vSpK9qzF3DoPvk+dRkFg=;
  b=boAhsMqbe7RHowMVGB13c5WTVBXMevONPO2T5e4BChsnPtTyEEYbFTXF
   E/p0womfh8gJGB8eRLuuUGRVqAQE+UwRtZGwgkbzhxJadOlEBODiy2UCF
   /UGxdVA/OjRPpnKa9uNqFPEVxEcO7sr6++kep4/llyYj7aAuVuDIUWFJv
   ZVoLS49m5zsJBJK3knsmrCQh3RH5I9q3Y9vE3zlHlujGbFwyrqhKOOpWc
   6zucNRhHgLWZazQDWxjdpT1I/LHjHN1d2WtwHtiAJ+cyK1jnHa5jvCZh1
   oli6L21ySbFGolBbtNSB7Q/ra+oIWqbE/aWqXsuXfQlB1N3pU7ShDqNcX
   Q==;
X-CSE-ConnectionGUID: pFZHTDKTTgGG8i2yBtARMQ==
X-CSE-MsgGUID: sf7IwQb4QkymVqGPo15cSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90065216"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90065216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:38:04 -0700
X-CSE-ConnectionGUID: LbEFck7mTsGmJ7yo/C6L8A==
X-CSE-MsgGUID: khDmuDUITyG4ZbY8YEJhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273940168"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 13:38:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xACgC-00000000LB8-29iL;
	Fri, 25 Sep 2026 20:38:00 +0000
Date: Sat, 26 Sep 2026 04:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:randconfig-7.3-next 448/673]
 fs/exfat/file.c:606:6: warning: stack frame size (820) exceeds limit (768) in
 'exfat_ioctl'
Message-ID: <202609260428.23Gq7ldd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 9c85f63886c9ecf71773bacb7ed5524bc5dfce52 [448/673] Kbuild: rework stack frame warn logic
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: i386-buildonly-randconfig-1005-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260428.23Gq7ldd-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260428.23Gq7ldd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260428.23Gq7ldd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/exfat/file.c:606:6: warning: stack frame size (820) exceeds limit (768) in 'exfat_ioctl' [-Wframe-larger-than]
     606 | long exfat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
         |      ^
   1 warning generated.
--
>> drivers/char/ipmi/ipmi_msghandler.c:5329:13: warning: stack frame size (944) exceeds limit (768) in '_ipmi_panic_request_and_wait' [-Wframe-larger-than]
    5329 | static void _ipmi_panic_request_and_wait(struct ipmi_smi *intf,
         |             ^
   1 warning generated.
--
>> kernel/trace/ftrace.c:5643:1: warning: stack frame size (804) exceeds limit (768) in 'unregister_ftrace_function_probe_func' [-Wframe-larger-than]
    5643 | unregister_ftrace_function_probe_func(char *glob, struct trace_array *tr,
         | ^
   1 warning generated.


vim +/exfat_ioctl +606 fs/exfat/file.c

d01579d590f72d2 Ethan Ferguson 2025-09-30  605  
654762df2ec7d61 Hyeongseok Kim 2021-03-04 @606  long exfat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
654762df2ec7d61 Hyeongseok Kim 2021-03-04  607  {
654762df2ec7d61 Hyeongseok Kim 2021-03-04  608  	struct inode *inode = file_inode(filp);
0ab8ba71868594a Jan Cincera    2023-10-30  609  	u32 __user *user_attr = (u32 __user *)arg;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  610  
654762df2ec7d61 Hyeongseok Kim 2021-03-04  611  	switch (cmd) {
0ab8ba71868594a Jan Cincera    2023-10-30  612  	case FAT_IOCTL_GET_ATTRIBUTES:
0ab8ba71868594a Jan Cincera    2023-10-30  613  		return exfat_ioctl_get_attributes(inode, user_attr);
0ab8ba71868594a Jan Cincera    2023-10-30  614  	case FAT_IOCTL_SET_ATTRIBUTES:
0ab8ba71868594a Jan Cincera    2023-10-30  615  		return exfat_ioctl_set_attributes(filp, user_attr);
f761fcdd289d07e Dongliang Cui  2024-09-18  616  	case EXFAT_IOC_SHUTDOWN:
f761fcdd289d07e Dongliang Cui  2024-09-18  617  		return exfat_ioctl_shutdown(inode->i_sb, arg);
654762df2ec7d61 Hyeongseok Kim 2021-03-04  618  	case FITRIM:
654762df2ec7d61 Hyeongseok Kim 2021-03-04  619  		return exfat_ioctl_fitrim(inode, arg);
d01579d590f72d2 Ethan Ferguson 2025-09-30  620  	case FS_IOC_GETFSLABEL:
d01579d590f72d2 Ethan Ferguson 2025-09-30  621  		return exfat_ioctl_get_volume_label(inode->i_sb, arg);
d01579d590f72d2 Ethan Ferguson 2025-09-30  622  	case FS_IOC_SETFSLABEL:
d01579d590f72d2 Ethan Ferguson 2025-09-30  623  		return exfat_ioctl_set_volume_label(inode->i_sb, arg);
654762df2ec7d61 Hyeongseok Kim 2021-03-04  624  	default:
654762df2ec7d61 Hyeongseok Kim 2021-03-04  625  		return -ENOTTY;
654762df2ec7d61 Hyeongseok Kim 2021-03-04  626  	}
654762df2ec7d61 Hyeongseok Kim 2021-03-04  627  }
654762df2ec7d61 Hyeongseok Kim 2021-03-04  628  

:::::: The code at line 606 was first introduced by commit
:::::: 654762df2ec7d61b05acc788afbffaba52d658fe exfat: add support ioctl and FITRIM function

:::::: TO: Hyeongseok Kim <hyeongseok@gmail.com>
:::::: CC: Namjae Jeon <namjae.jeon@samsung.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
