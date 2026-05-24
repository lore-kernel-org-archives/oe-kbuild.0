Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DCE555
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779656125; cv=none; b=hzX8k/yKd2dZDEAFuoJVEJLM7WD9lvWS6WFRjeyQn70SJ1DkhTvOWT1MupiaJ/uE9Eu+UXLH9xxIZ/kKMbygSN331EyPJZjLtp/eCNiG0bNJYre3e8bqTHxMkpJLrdqcaQSgVGsenxWSp8L5ZKUuWbuNIHL1WMYStJu4jn4pp8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779656125; c=relaxed/simple;
	bh=9k2dsyOZ4qPjqmsFuylHkwYX+WGQAKThhwyFej+eh6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nEnOvn9sqgzaBKL1JFigqiBcAmHBzd4LYrJE1mfwM0a+q/odGcCMDactQEYQEp8atipi/743oTC97W0ONwqKDvsn0Qfe+dMhko0tMraBMpeorPulLGBOZ6sjHYzFadelAM0WijQPY+zN5Ab3i+2t8LoMYSCjHlt883C4iA/wTys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb8YBfer; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb8YBfer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779656124; x=1811192124;
  h=date:from:to:cc:subject:message-id;
  bh=9k2dsyOZ4qPjqmsFuylHkwYX+WGQAKThhwyFej+eh6Y=;
  b=Qb8YBferTVGFn8g47oO3yjfjIJiK14o55dmNKMEoLX2fxtjjZfmboj2P
   XNkbcWbzLgtoBLkWlXI6VsF4/uj+MpKCGuH7V8IxucMj3JBwVtusM/0od
   pWIWlgAMAlGRUW7iyMc0SyebiOsdzIdFkb7B3wBwpnInuCLXLPBbac+ig
   V6VsNh30L8Qu8rwj3B6AUmBL8LjOSKlKvx1M0udwUFM5gLOiGFMl0VG5c
   DVG0wngIVbkoVuqA3ZRhNjeJb4nupnoDyVkWbAY8ABSVVTXealpoqeXAk
   QviK6V7WU0in6n26PjQRpDZ4dZgCn6Yy7/j5o4DmFx6IWu//fuc/Z8SeF
   A==;
X-CSE-ConnectionGUID: O+pqwCSWR++X3fLVo2ENyQ==
X-CSE-MsgGUID: fGDEfTt3SzKhrIJ4F6/1pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="83066726"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="83066726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 13:55:23 -0700
X-CSE-ConnectionGUID: /5nrnAYHTa6xzL/A1wY/UA==
X-CSE-MsgGUID: mRpPcymRTQmWtzPkhGRrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="245699754"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2026 13:55:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRFqx-000000000a3-0Atq;
	Sun, 24 May 2026 20:55:19 +0000
Date: Mon, 25 May 2026 04:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/ad7949.c:286:3: error: call to
 '__compiletime_assert_351' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202605250455.GBXJziPv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a97c4d5262d02f04d1f41113b0d090ea51f08dd
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year, 1 month ago
:::::: branch date: 68 minutes ago
:::::: commit date: 1 year, 1 month ago
config: um-randconfig-r052-20260525 (https://download.01.org/0day-ci/archive/20260525/202605250455.GBXJziPv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250455.GBXJziPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250455.GBXJziPv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/adc/ad7949.c:12:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ad7949.c:12:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ad7949.c:12:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/iio/adc/ad7949.c:286:3: error: call to '__compiletime_assert_351' declared with 'error' attribute: FIELD_PREP: value too large for the field
     286 |                 FIELD_PREP(AD7949_CFG_MASK_INX, ad7949_adc->current_channel) |
         |                 ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:73:1: note: expanded from here
      73 | __compiletime_assert_351
         | ^
   12 warnings and 1 error generated.


vim +286 drivers/iio/adc/ad7949.c

7f40e0614317f2 Charles-Antoine Couret 2018-10-22  275  
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  276  static int ad7949_spi_init(struct ad7949_adc_chip *ad7949_adc)
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  277  {
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  278  	int ret;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  279  	int val;
595a0590f4fbcb Liam Beguin            2021-08-15  280  	u16 cfg;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  281  
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  282  	ad7949_adc->current_channel = 0;
595a0590f4fbcb Liam Beguin            2021-08-15  283  
595a0590f4fbcb Liam Beguin            2021-08-15  284  	cfg = FIELD_PREP(AD7949_CFG_MASK_OVERWRITE, 1) |
595a0590f4fbcb Liam Beguin            2021-08-15  285  		FIELD_PREP(AD7949_CFG_MASK_INCC, AD7949_CFG_VAL_INCC_UNIPOLAR_GND) |
595a0590f4fbcb Liam Beguin            2021-08-15 @286  		FIELD_PREP(AD7949_CFG_MASK_INX, ad7949_adc->current_channel) |
595a0590f4fbcb Liam Beguin            2021-08-15  287  		FIELD_PREP(AD7949_CFG_MASK_BW_FULL, 1) |
37930650604982 Liam Beguin            2021-08-15  288  		FIELD_PREP(AD7949_CFG_MASK_REF, ad7949_adc->refsel) |
595a0590f4fbcb Liam Beguin            2021-08-15  289  		FIELD_PREP(AD7949_CFG_MASK_SEQ, 0x0) |
595a0590f4fbcb Liam Beguin            2021-08-15  290  		FIELD_PREP(AD7949_CFG_MASK_RBN, 1);
595a0590f4fbcb Liam Beguin            2021-08-15  291  
595a0590f4fbcb Liam Beguin            2021-08-15  292  	ret = ad7949_spi_write_cfg(ad7949_adc, cfg, AD7949_CFG_MASK_TOTAL);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  293  
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  294  	/*
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  295  	 * Do two dummy conversions to apply the first configuration setting.
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  296  	 * Required only after the start up of the device.
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  297  	 */
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  298  	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  299  	ad7949_spi_read_channel(ad7949_adc, &val, ad7949_adc->current_channel);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  300  
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  301  	return ret;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  302  }
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  303  

:::::: The code at line 286 was first introduced by commit
:::::: 595a0590f4fbcb39d73a7c55c79a7e7921ec1614 iio: adc: ad7949: define and use bitfield names

:::::: TO: Liam Beguin <lvb@xiphos.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
