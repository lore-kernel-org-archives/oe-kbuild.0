Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655A2C375F
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628888; cv=none; b=ThNb1kvocbaYmQo5NJ7wJPQHTzzGh3SbWrMOQUqzaNxDIBMxXn8LZbeCoVs8Vi4NwQtZDhbA7BJRMMHmrwJ69RNTJ3eA/zMRmgToYFK9nc7kai+C7mWQXaqMcnrUb74UDXniCmaHsfmtktjE/5zN6/iZczppvgTkR04h+/OiBvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628888; c=relaxed/simple;
	bh=xkuoqRBAMaszJogfwOZMOF36fqeCEjsZFhUcygllJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rO9hP2N088eXi6n+QE45vZXnjPGfAvdV24AWSW8S//+ftv315t9WJItxp1AWx0OjzB+EdiJ2gkxbUjTeQBSO3S6UtY2sniG2xk9MFeDsmHpQmFuD8RcaBrPv9BXNRJGpOgLMBbbXwkr6B6k+Dr8+IEeoffSmzx3cAqda5JZCYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvJ5bBRd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvJ5bBRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751628886; x=1783164886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkuoqRBAMaszJogfwOZMOF36fqeCEjsZFhUcygllJHY=;
  b=mvJ5bBRdzYsKIc3aUoQyQ1KIphSK44iO5UVxhZkDeibVca/GfgVhS4nX
   CRC8UBXJ5TK4a5hN9RKVdHPi34kQgdMEMPDYvpCnJX274aCFXDMMxuS9g
   fNIRA3CCQsKz8yHGXou6eRqbwA77MEk9AexP/S4dfDcnb/ynVcC7wOsjX
   g7+fDyvVKlhV4QMTEZa7jJ5EboZ3CJh9P8s83hROGtB1mSBVreh0ZN5Te
   Vt93wa+g1r324dM0y6kk5uYchZhhCBCYxrMchU/TduyFGpXcRDPUi2OqL
   Y6N2MnH9y1pQXl1oTjS4Xivbq323YYy/updW4OxTJJOBkSRIL6tHKlsTG
   A==;
X-CSE-ConnectionGUID: FDJ/SkYuSOSWL95GGz7eVA==
X-CSE-MsgGUID: OEUxt0siS1ys6HoOqHooFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53095356"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53095356"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 04:34:46 -0700
X-CSE-ConnectionGUID: R/JKXGFPS+auIUgBNZCoIg==
X-CSE-MsgGUID: A38TiWioRoyNkdW1p0jA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155204187"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2025 04:34:44 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXegk-0003eH-2J;
	Fri, 04 Jul 2025 11:34:42 +0000
Date: Fri, 4 Jul 2025 19:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/light/opt4001.c:215:9: error: call to
 '__compiletime_assert_604' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <202507041903.TeW18RtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Justin Stitt <justinstitt@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4c06e63b92038fadb566b652ec3ec04e228931e8
commit: 47f4af43e7c0cf702d6a6321542f0c0d9c4216e3 ubsan/overflow: Enable ignorelist parsing and add type filter
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r051-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041903.TeW18RtM-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041903.TeW18RtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507041903.TeW18RtM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/light/opt4001.c:215:9: error: call to '__compiletime_assert_604' declared with 'error' attribute: FIELD_PREP: value too large for the field
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
   <scratch space>:36:1: note: expanded from here
      36 | __compiletime_assert_604
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
