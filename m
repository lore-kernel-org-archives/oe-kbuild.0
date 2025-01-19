Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D8290F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737253059; cv=none; b=gxNodeP+XNnXW4hvSB1LuF+oRISnWEMGU30JbzXSr0yeQeRG0xtB88iGwsgZFq2s26kI+toy/po4ks7PgU2kDZ2XZ4QafyhE6ghIJgRmGemJBz9xuSKOdWDyk1CSxheqdRre4C6bYnbg/oJkdXqiNMTqVaxuZf+POZc8j40v/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737253059; c=relaxed/simple;
	bh=ZyGSyYP0RQRc0ME6G/9DyHtFwsgfqrDoqb9HPtMUTSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q28+s4ijsCFs7Dr78xyn5IMiP7vg18vuOVkcifd5P6+LuvkW3oFhcery7dzrKuKnoCUwvG97ApLw6c6ORZvcxD7dguiauRDdxIZcGoYfu7JpTBBnvhTshv2aViX58PFlSxgHZJKoFwo9JK+VMure2YMXopgcTnoZwKMwWxrhMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6kpnqSn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6kpnqSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737253058; x=1768789058;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZyGSyYP0RQRc0ME6G/9DyHtFwsgfqrDoqb9HPtMUTSw=;
  b=W6kpnqSno9D8zK5yV3M0tY2+w0l255/7gF0Dg+3AqYgW4g8RgE7vJsbA
   DHAEsk+4CICC6nG+Uu+Nmk+lne2inpI7lUbxbcZ1ikhjNO9qw4l3HArN6
   98HHPso/Tdyrn5EEx9Na/GteEUgzu5Yb3np6x0A+5B7lfE46HQnR0KULT
   p1a9v4/lmSICaNCiLUmiZvGYW4/Wu7uOXHf9sCs21xgnh5x6XdHu4X/Bv
   7C1sN/WFi+rAasDFBsVrBjfBGF0PfVvktmEhZboRvyazG/6ElCjMqKaWI
   BOBfhTfwfNZsJQb2ES37qNVdzl+kMhJFH6YQxnNZlW0lPDRqbuUmg2gNi
   g==;
X-CSE-ConnectionGUID: pVJdQ2srRhGrX9A2IT1lvw==
X-CSE-MsgGUID: O9rvNJfTSPykzD1MSgW4Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="60118769"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="60118769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 18:17:37 -0800
X-CSE-ConnectionGUID: QQLQ110pSvWZ4BtOxCFGGg==
X-CSE-MsgGUID: RpyXjhK2QEa2pIcgs2WMWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="105955324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2025 18:17:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZKsX-000V1H-2W;
	Sun, 19 Jan 2025 02:17:33 +0000
Date: Sun, 19 Jan 2025 10:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/light/opt4001.c:215:9: error: call to
 '__compiletime_assert_324' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <202501191017.4tkmOnIt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Michał Winiarski" <michal.winiarski@intel.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fda5e3f284002ea55dac1c98c1498d6dd684046e
commit: 32a84cfc6caf830431375c5182391284986d4066 arch: um: Add Clang coverage support
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: um-randconfig-r112-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191017.4tkmOnIt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191017.4tkmOnIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501191017.4tkmOnIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/light/opt4001.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/light/opt4001.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/light/opt4001.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/iio/light/opt4001.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/light/opt4001.c:215:9: error: call to '__compiletime_assert_324' declared with 'error' attribute: FIELD_PREP: value too large for the field
     215 |         reg |= FIELD_PREP(OPT4001_CTRL_CONV_TIME_MASK, chip->int_time);
         |                ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_324
         | ^
   13 warnings and 1 error generated.


vim +215 drivers/iio/light/opt4001.c

9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  207  
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  208  static int opt4001_set_conf(struct opt4001_chip *chip)
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  209  {
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  210  	struct device *dev = &chip->client->dev;
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  211  	u16 reg;
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  212  	int ret;
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  213  
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  214  	reg = FIELD_PREP(OPT4001_CTRL_RANGE_MASK, OPT4001_CTRL_LIGHT_SCALE_AUTO);
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26 @215  	reg |= FIELD_PREP(OPT4001_CTRL_CONV_TIME_MASK, chip->int_time);
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  216  	reg |= FIELD_PREP(OPT4001_CTRL_OPER_MODE_MASK, OPT4001_CTRL_OPER_MODE_CONTINUOUS);
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  217  
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  218  	ret = regmap_write(chip->regmap, OPT4001_CTRL, reg);
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  219  	if (ret)
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  220  		dev_err(dev, "Failed to set configuration\n");
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  221  
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  222  	return ret;
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  223  }
9a9608418292bb Stefan Windfeldt-Prytz 2023-04-26  224  

:::::: The code at line 215 was first introduced by commit
:::::: 9a9608418292bb8733805c3f3123dfe0454fadac iio: light: Add support for TI OPT4001 light sensor

:::::: TO: Stefan Windfeldt-Prytz <stefan.windfeldt-prytz@axis.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
