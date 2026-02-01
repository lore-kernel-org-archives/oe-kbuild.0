Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633D31B81C
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769936089; cv=none; b=Z/0B7Cb2Huj7ar6qQWYrvL3JMvRbfRlrosVl3HA5E4kGnwD5+JF0UfyYwCFzbrHxVB20UUmFHvitWSk5sPAGUo+s082nH8bpGYopYwhDThHwd19zeYSHuRxilpRP38aSpjgH+korb8nw/cudCjncK+sKVgBjNePiBHnHohUSzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769936089; c=relaxed/simple;
	bh=cUon6Fzg1ml2ctwNRsqOKklmqCsy+9Yn1M4axbFwq/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l3Lzb+mxp6pzJ1AAqlemC5nWbqKTvNJzWbN5muXTTpYQ2E2M7ZoRRWZEMm795LcdGSE4M587KUv6bsRarHdtATj4hePw0t1Q+NeP2rm3UaetDuVcFDT9cAxk9Kl7QCC34aha4p6N732+xfR3a3unJ9OXlc3gj6pknHdIwPpYnW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m56SnA7/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m56SnA7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769936088; x=1801472088;
  h=date:from:to:cc:subject:message-id;
  bh=cUon6Fzg1ml2ctwNRsqOKklmqCsy+9Yn1M4axbFwq/I=;
  b=m56SnA7/leAvEflGSjXxW6hi6UfihAsReoEi/dSzq/uzXctPHD1pJjjZ
   2FKveKHLQcz2LnLTuuFWu96tSoLe8pNA7PZo5Vo93eU/yXvl3be0TPnJ7
   T+Y96GexypF+p6TJYNEM89iWZm+3TqV/gHSgEBaw18KeNeVX6lwiGdCAQ
   t4aKa+z0YV2CeLq7bJLRVyPFf/LbTK9iogng/iI/JliD21zP8VJnYz4rG
   MjoiibiB2ImbXeDXDJ/oPhZinwOG7KeG2GXe+gjN5VXqDcHw0VGGORQ7f
   Wg2FHJYxyvNBf23GihuuGTegfJuoDW3LXml/cSBf1XrErugY8t7qAxHJs
   A==;
X-CSE-ConnectionGUID: lVk8JjN0StCHdtoG7AOA8g==
X-CSE-MsgGUID: jll33gMST6qsW1fZapHz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81438365"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="81438365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:54:47 -0800
X-CSE-ConnectionGUID: KMORk8vOSjev8MhGibS80w==
X-CSE-MsgGUID: paL3lTe1RbmjPUP69MPHxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213323633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 00:54:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmTEB-00000000egC-4AeX;
	Sun, 01 Feb 2026 08:54:43 +0000
Date: Sun, 01 Feb 2026 16:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/light/opt4001.c:215:9: error: call to
 '__compiletime_assert_499' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202602011602.nA16Kavb-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: Justin Stitt <justinstitt@google.com>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   162b42445b585cd89f45475848845db353539605
commit: 47f4af43e7c0cf702d6a6321542f0c0d9c4216e3 ubsan/overflow: Enable ignorelist parsing and add type filter
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r123-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011602.nA16Kavb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011602.nA16Kavb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602011602.nA16Kavb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/light/opt4001.c:215:9: error: call to '__compiletime_assert_499' declared with 'error' attribute: FIELD_PREP: value too large for the field
     215 |         reg |= FIELD_PREP(OPT4001_CTRL_CONV_TIME_MASK, chip->int_time);
         |                ^
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
   include/linux/compiler_types.h:533:2: note: expanded from macro '_compiletime_assert'
     533 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:526:4: note: expanded from macro '__compiletime_assert'
     526 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:14:1: note: expanded from here
      14 | __compiletime_assert_499
         | ^
   1 error generated.


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
