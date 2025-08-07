Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0533F17A2E0
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754591451; cv=none; b=sPtYPbETgWXDBEenqufquZhglgJK/a9g4wJZRS2rNJkJQIAk3JJTlilXZJpSFUj1wlyT28LMFaeuEw71crXseuZiRCzn+8Xm6WuOtpZqI0ZSgqeaeK/Vza3vxvuG1y3+J0jUNlsqbM6exPH3bv96ys/+jQetVlHHavSxWOGPAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754591451; c=relaxed/simple;
	bh=+9PW/bivegGu6FMaDyAu+y/0eMjJY4t8vhjAtD5Gu8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLY7FWv2QjPe/vs0LYZ+82oY1unM5VRURpxqXpW/CpPN/IcdFTcMNJ/H92AqlMbZ2rEe8BXEJvvKaTTHU9bbPtWQUOvZu8g+EoMHmb2ZA/vQVLq4FESNxUlef5CTH8Y32Z8xvS/Tp83o/Dm6RqjY73YSdCrbeiCqS0VjsrI1iwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rdoodp7h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rdoodp7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754591449; x=1786127449;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+9PW/bivegGu6FMaDyAu+y/0eMjJY4t8vhjAtD5Gu8U=;
  b=Rdoodp7hazFVexn6z9pxOa1QeBTf/U0EPy+b9BBwPHsYlgyfMpEZvMlk
   KYZAhsH7vcPkXs8R35nTozhSEzI6UD9rQP07XzDdJ1IGpVeBjFnPhpgf2
   s6KSCbevDnbD4FTFZliRr3KAc472lJqZOCpDMHUarkfw5s3l84u2lhmcW
   VXcxpggYQSYkDMNtxk5bcG5fSTaCel/Wcf0wwJlkDKfwsv9Sgz6UfJJ+C
   JZgUR+T+kCNITZYbnzYgANwLVW31J5j7qgLFjIsHmp3xtgkjMbz1tVrQz
   i6dCXx7+9ZJJBuxnzpfRjWN63+MZrhmCneO512BXqgVNyumGym1RnRlxe
   A==;
X-CSE-ConnectionGUID: uibNbJrkTpGgPeiTKCNu8A==
X-CSE-MsgGUID: TOQ5hqlATLys89j/PTOzFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56145114"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56145114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 11:30:48 -0700
X-CSE-ConnectionGUID: LsJb+91zSc+8XPQGxV10hQ==
X-CSE-MsgGUID: m+va9j9gSDiGfDzsyitmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165033745"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 11:30:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk5O1-00036M-0Y;
	Thu, 07 Aug 2025 18:30:45 +0000
Date: Fri, 8 Aug 2025 02:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13558/13560] ERROR: modpost: __ex_table+0x1498
 references non-executable section
 '.data.rel.local.f2fs_attr_reserved_blocks'
Message-ID: <202508080201.nCHDEECD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Mickaël Salaün" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   442d93313caebc8ccd6d53f4572c50732a95bc48
commit: 435cc558a23cc42baf921ef1b700250cb0af0d5c [13558/13560] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
:::::: branch date: 13 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080201.nCHDEECD-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080201.nCHDEECD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080201.nCHDEECD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: cpumask_local_spread+0x26 (section: .text.cpumask_local_spread) -> .LVL265 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_local_spread+0x3c (section: .text.cpumask_local_spread) -> .LVL266 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_local_spread+0x4c (section: .text.cpumask_local_spread) -> .LVL267 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_local_spread+0x52 (section: .text.cpumask_local_spread) -> .LVL275 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_local_spread+0x66 (section: .text.cpumask_local_spread) -> .LVL282 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock+0x18 (section: .text._atomic_dec_and_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock+0x24 (section: .text._atomic_dec_and_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock+0x2a (section: .text._atomic_dec_and_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock+0x52 (section: .text._atomic_dec_and_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock_irqsave+0x1a (section: .text._atomic_dec_and_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock_irqsave+0x26 (section: .text._atomic_dec_and_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock_irqsave+0x2c (section: .text._atomic_dec_and_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock_irqsave+0x5c (section: .text._atomic_dec_and_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_lock_irqsave+0x70 (section: .text._atomic_dec_and_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock+0x18 (section: .text._atomic_dec_and_raw_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock+0x24 (section: .text._atomic_dec_and_raw_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock+0x2a (section: .text._atomic_dec_and_raw_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock+0x52 (section: .text._atomic_dec_and_raw_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock_irqsave+0x1a (section: .text._atomic_dec_and_raw_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock_irqsave+0x26 (section: .text._atomic_dec_and_raw_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock_irqsave+0x2c (section: .text._atomic_dec_and_raw_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock_irqsave+0x5c (section: .text._atomic_dec_and_raw_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _atomic_dec_and_raw_lock_irqsave+0x70 (section: .text._atomic_dec_and_raw_lock_irqsave) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1a6 (section: .text.find_cpio_data) -> miscdev_test_can_open.isra.1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1ce (section: .text.find_cpio_data) -> miscdev_test_can_open.isra.1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1d4 (section: .text.find_cpio_data) -> miscdev_test_conflict_reverse (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x208 (section: .text.find_cpio_data) -> miscdev_test_conflict_reverse (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0x86 (section: .text.ida_find_first_range) -> hmc6352_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0x90 (section: .text.ida_find_first_range) -> hmc6352_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x32 (section: .text.ida_free) -> hmc6352_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x122 (section: .text.ida_free) -> hmc6352_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_free.part.5+0x18 (section: .text.objpool_free.part.5) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x1ec (section: .text.objpool_fini) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x1fc (section: .text.objpool_fini) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x238 (section: .text.objpool_fini) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: objpool_fini+0x248 (section: .text.objpool_fini) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x1a8 (section: .text.delete_node) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x1ce (section: .text.resource_string.isra.12) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x252 (section: .text.resource_string.isra.12) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x270 (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x28e (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x2e6 (section: .text.resource_string.isra.12) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_or_range+0x1e (section: .text.resource_or_range) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_or_range+0x2a (section: .text.resource_or_range) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2c (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x80 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xa0 (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xc6 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xde (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xf4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x10e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x112 (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x138 (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x152 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x16a (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x178 (section: .text.pointer) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x18c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1a4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1ba (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1d2 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1e8 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x206 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x21c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x234 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x24c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x264 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x27c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x292 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2aa (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2b6 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2d8 (section: .text.pointer) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x314 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x32c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x346 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x35e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x376 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x38c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x39e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3ce (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3e4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: va_format+0x28 (section: .text.va_format) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vscnprintf+0x0 (section: .text.vscnprintf) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vscnprintf+0x16 (section: .text.vscnprintf) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vscnprintf+0x2c (section: .text.vscnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: scnprintf+0x20 (section: .text.scnprintf) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x98 (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0xac (section: .text.xas_find_conflict) -> lp87565_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0xb8 (section: .text.xas_find_conflict) -> lp87565_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0xf6 (section: .text.xas_find_conflict) -> lp873x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x12c (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x146 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x14e (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x152 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x27a (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x280 (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x2dc (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x2f0 (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> f2fs_attr_readdir_ra (section: .data.rel.local.f2fs_attr_readdir_ra)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.data.rel.local.f2fs_attr_readdir_ra'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> f2fs_attr_reserved_blocks (section: .data.rel.local.f2fs_attr_reserved_blocks)
>> ERROR: modpost: __ex_table+0x1498 references non-executable section '.data.rel.local.f2fs_attr_reserved_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> f2fs_attr_reserved_segments (section: .data.rel.local.f2fs_attr_reserved_segments)
>> ERROR: modpost: __ex_table+0x14a0 references non-executable section '.data.rel.local.f2fs_attr_reserved_segments'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> f2fs_attr_sb_block_zoned (section: .data.rel.local.f2fs_attr_sb_block_zoned)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.data.rel.local.f2fs_attr_sb_block_zoned'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> f2fs_attr_sb_compression (section: .data.rel.local.f2fs_attr_sb_compression)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.data.rel.local.f2fs_attr_sb_compression'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> f2fs_attr_sb_encryption (section: .data.rel.local.f2fs_attr_sb_encryption)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.data.rel.local.f2fs_attr_sb_encryption'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> f2fs_attr_sb_flexible_inline_xattr (section: .data.rel.local.f2fs_attr_sb_flexible_inline_xattr)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.data.rel.local.f2fs_attr_sb_flexible_inline_xattr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> f2fs_attr_sb_project_quota (section: .data.rel.local.f2fs_attr_sb_project_quota)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.data.rel.local.f2fs_attr_sb_project_quota'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> f2fs_attr_sb_sb_checksum (section: .data.rel.local.f2fs_attr_sb_sb_checksum)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.data.rel.local.f2fs_attr_sb_sb_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> f2fs_attr_seq_file_ra_mul (section: .data.rel.local.f2fs_attr_seq_file_ra_mul)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.data.rel.local.f2fs_attr_seq_file_ra_mul'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> f2fs_attr_unusable (section: .data.rel.local.f2fs_attr_unusable)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.data.rel.local.f2fs_attr_unusable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> f2fs_attrs (section: .data.rel.local.f2fs_attrs)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.data.rel.local.f2fs_attrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> f2fs_base_attr_casefold (section: .data.rel.local.f2fs_base_attr_casefold)
>> ERROR: modpost: __ex_table+0x14f4 references non-executable section '.data.rel.local.f2fs_base_attr_casefold'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> f2fs_base_attr_encryption (section: .data.rel.local.f2fs_base_attr_encryption)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.data.rel.local.f2fs_base_attr_encryption'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> f2fs_base_attr_inode_checksum (section: .data.rel.local.f2fs_base_attr_inode_checksum)
ERROR: modpost: __ex_table+0x150c references non-executable section '.data.rel.local.f2fs_base_attr_inode_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> f2fs_base_attr_lost_found (section: .data.rel.local.f2fs_base_attr_lost_found)
>> ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.f2fs_base_attr_lost_found'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> f2fs_base_attr_project_quota (section: .data.rel.local.f2fs_base_attr_project_quota)
>> ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.f2fs_base_attr_project_quota'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> f2fs_base_attr_readonly (section: .data.rel.local.f2fs_base_attr_readonly)
ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.f2fs_base_attr_readonly'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> f2fs_base_attr_sb_checksum (section: .data.rel.local.f2fs_base_attr_sb_checksum)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.f2fs_base_attr_sb_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> f2fs_base_attr_verity (section: .data.rel.local.f2fs_base_attr_verity)
>> ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.local.f2fs_base_attr_verity'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> f2fs_feat_groups (section: .data.rel.local.f2fs_feat_groups)
>> ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.local.f2fs_feat_groups'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> f2fs_kset (section: .data.rel.local.f2fs_kset)
>> ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.local.f2fs_kset'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> f2fs_sb_feat_groups (section: .data.rel.local.f2fs_sb_feat_groups)
>> ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.local.f2fs_sb_feat_groups'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> f2fs_stat_groups (section: .data.rel.local.f2fs_stat_groups)
>> ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.local.f2fs_stat_groups'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> f2fs_tune_attrs (section: .data.rel.local.f2fs_tune_attrs)
>> ERROR: modpost: __ex_table+0x1554 references non-executable section '.data.rel.local.f2fs_tune_attrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> f2fs_feat_attr_ops (section: .data.rel.ro.local.f2fs_feat_attr_ops)
>> ERROR: modpost: __ex_table+0x1560 references non-executable section '.data.rel.ro.local.f2fs_feat_attr_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> f2fs_feat_ktype (section: .data.rel.ro.local.f2fs_feat_ktype)
>> ERROR: modpost: __ex_table+0x1564 references non-executable section '.data.rel.ro.local.f2fs_feat_ktype'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> f2fs_feature_list_ktype (section: .data.rel.ro.local.f2fs_feature_list_ktype)
>> ERROR: modpost: __ex_table+0x156c references non-executable section '.data.rel.ro.local.f2fs_feature_list_ktype'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> f2fs_ktype (section: .data.rel.ro.local.f2fs_ktype)
>> ERROR: modpost: __ex_table+0x1570 references non-executable section '.data.rel.ro.local.f2fs_ktype'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> f2fs_sb_ktype (section: .data.rel.ro.local.f2fs_sb_ktype)
>> ERROR: modpost: __ex_table+0x1578 references non-executable section '.data.rel.ro.local.f2fs_sb_ktype'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x157c references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> f2fs_stat_ktype (section: .data.rel.ro.local.f2fs_stat_ktype)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.data.rel.ro.local.f2fs_stat_ktype'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> f2fs_tune_group (section: .data.rel.ro.local.f2fs_tune_group)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.data.rel.ro.local.f2fs_tune_group'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> print_fmt_devres (section: .data.print_fmt_devres)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.data.print_fmt_devres'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> event_devres_log (section: .data.rel.local.event_devres_log)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.data.rel.local.event_devres_log'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF1009 (section: .debug_str)
ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF1011 (section: .debug_str)
ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF1013 (section: .debug_str)
ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF1015 (section: .debug_str)
ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF1017 (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF1019 (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF1021 (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF1023 (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF1025 (section: .debug_str)
ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF1027 (section: .debug_str)
ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF1029 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF1031 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF1033 (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF1035 (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF1037 (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF1035 (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF1040 (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF1035 (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF1043 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1045 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1047 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1049 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1552 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF1556 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF1559 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF1562 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF1565 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF1568 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF1571 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF1573 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF1575 (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF1577 (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF1579 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1581 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1583 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF1585 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1587 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1589 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF1591 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF1593 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF1595 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF1597 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .LASF1599 (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x178c (section: __ex_table) -> .LASF1601 (section: .debug_str)
ERROR: modpost: __ex_table+0x178c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
