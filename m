Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE61E5711
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962927; cv=none; b=QZLKGdOWqYJWR9rFChaY/LNxf9yNEqTM51m2+5jiLPNAWyAYf+Xkc6Gxs/6tB7ta/KaUVoNUu8XYpyUymMNW0zI+fN7SpCuhOZbnp29x4w37ZTWg6cGnuX94nFR9W/H3OQgvRMbn5k089iL51CLcIL35EcQ6TcCXqLepgQPS3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962927; c=relaxed/simple;
	bh=nNh0LpVVOaJeLnJwXcy+omTgLn60MpPhrcntB2Ypwr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UsZ+Lg/EZIXj2em1R7v6yiYNjF4cOodRcoAoXFUg5/5NEq9cNpl8UlkEPe4uYq1uFtEKoajNwu7UwxuOKdDGr8l99n++PP/FtfpybH5rO7+G8sF1qlQs0poHnmMoycpDhLgAfwKBz1GS2UAVx/Ol9wtOtnyybuA1LQ9SuKB8T4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAy7V4Cd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAy7V4Cd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731962925; x=1763498925;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nNh0LpVVOaJeLnJwXcy+omTgLn60MpPhrcntB2Ypwr4=;
  b=XAy7V4Cde1q6TEe4N8NG6VyBvqGuBjxp8iWkkISZgYx+gdTVUYnfD8Gf
   ERK+RVX1pJWS27MnhNAD/irb9swCZ0/zrjSV8wJkJB9fc2+x1Aa/zfPcw
   Xu2wgu/HUJdBIVyaffyClKo1dI2stEoMkmNtHYujtzVzfUVwvLrVcOvFQ
   f0t22jyGBUowSAEAHHqMVhX5ySc0M3d7BAwRclnQdcly8qVn4D98jRA4f
   FJKjTjicw6mYm+5aL0bJjkmyctbzsi31yc88EX+8SWCHTP6ey5qgZVDvW
   CR+whF8j1qkkSHzo8yUr4A0L2nxmb6qZe0F0f01I0vuE/3Tq4sDXspf4B
   A==;
X-CSE-ConnectionGUID: vCcgLtX8Sie6DURipLUM7A==
X-CSE-MsgGUID: bHe89b0CQ0WGTiqRjMpKhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31996508"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31996508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 12:48:23 -0800
X-CSE-ConnectionGUID: 0NwmYV+NTyqnsZ9oNa3p2Q==
X-CSE-MsgGUID: FYZTAxRTT7aW68lZXjSCVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="120288262"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2024 12:48:21 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD8fS-0002e5-2c;
	Mon, 18 Nov 2024 20:48:18 +0000
Date: Tue, 19 Nov 2024 04:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-c23-extensions 2/2] clang diag:
 warning: unknown warning option '-Wno-c23-extensions'; did you mean
 '-Wno-c2x-extensions'?
Message-ID: <202411190410.dav92Y9o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weißschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-c23-extensions
head:   e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c
commit: e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c [2/2] kbuild: disable -Wc23-extensions
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: um-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190410.dav92Y9o-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190410.dav92Y9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190410.dav92Y9o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   1 warning generated.
   warning: warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   1 warning generated.
   1 warning generated.
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   1 warning generated.
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   1 warning generated.
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   1 warning generated.
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   val = __raw_readb(PCI_IOBASE + addr);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
   ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
   ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
   ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
   ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   __raw_writeb(value, PCI_IOBASE + addr);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   readsb(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   readsw(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   readsl(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   writesb(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   writesw(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   writesl(PCI_IOBASE + addr, buffer, count);
   ~~~~~~~~~~ ^
   13 warnings generated.
>> clang diag: warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   clang diag: include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   clang diag: include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
   clang diag: include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   warning: unused import: `ffi::c_void`
   --> rust/kernel/kunit.rs:9:12
   |
   9 | use core::{ffi::c_void, fmt};
   |            ^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
