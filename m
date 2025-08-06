Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3993A926
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508844; cv=none; b=XWmhXgkM2oSiz8VE2aVOaCziYZryqfVGqh9s5TRwPQ6AB31jDaBbFPskx2MJF2CwaicfCo/VVYI5bGVxtuWeDS86/CWHAB6c+sQdf/jv3zvSpvn18kE1RhEIeq+2eRpxvzI/hgpMZdtJumzrBnOSTgDaqWQ8WdpT2Fuf1si133E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508844; c=relaxed/simple;
	bh=fUWh4a57UbjOQel+MMmOy5hS8hWdo142G7FH+e9gNjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+DY0FNTuT+fNk4U5gtJIC1C5HzY2xB99i47OuOxVKZ7hEOkzbZKNlwdyQ5PO14ugaWmladLhz6vQYzZ4xEOqmMaN3rom72EESIYIZ5UBSHvz+iTgQso6J2GD/2Qky31OYc1ILSjQYmFRESRnW5/2imUjZXkYzqTwBRTSW1iC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzJB8QL6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzJB8QL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754508844; x=1786044844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUWh4a57UbjOQel+MMmOy5hS8hWdo142G7FH+e9gNjM=;
  b=XzJB8QL6wdTN4QaWx1PwPV3TR8jDZdbr063Ck1Ci9aMlXfattva0/O1N
   R1kJbVPzoVqnr+dIU4afLIqaFKcJp7lR7LYRdbDHEA34JVr2kdLk3wLp/
   LD+rBM8bKk8z1qIyjxUqH3Q5/mUczUzul5MaBpdFlWFvj0a2OTAZQIKCK
   l1vhnFHrvjE8xGk9hEOvAd3J8mTBfHDvODcP/JVEjHYCKdHzRbCOLi2Ry
   QOm+QxQlWJWaLqHzdyZruUGtU7tC91/PMtvC6l2MdAeF8sidC6Ix5FTVa
   iZ+sG4mo+TxC1miLlRLDkk0f0Z/RlD17gdTEGrnA3Am0OlXZO1WTdBOk0
   w==;
X-CSE-ConnectionGUID: uM99zRofRLm/4rSVQ1yYbQ==
X-CSE-MsgGUID: /w1yZaNiRgiYpZCJkVEYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60468477"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60468477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 12:34:03 -0700
X-CSE-ConnectionGUID: tSYHpl7pQGyCDch4c9eV2g==
X-CSE-MsgGUID: +UiB8WeKQO+G2SANKvI6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169294471"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2025 12:34:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujjtf-00021i-2Q;
	Wed, 06 Aug 2025 19:33:59 +0000
Date: Thu, 7 Aug 2025 03:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] hwmon: (ina780) Add driver for TI INA780
Message-ID: <202508070329.wHfhXUNK-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250806005127.542298-2-chris.packham@alliedtelesis.co.nz>
References: <20250806005127.542298-2-chris.packham@alliedtelesis.co.nz>
TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
TO: jdelvare@suse.com
TO: linux@roeck-us.net
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chris Packham <chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.16 next-20250806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/hwmon-ina780-Add-driver-for-TI-INA780/20250806-115131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250806005127.542298-2-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH 2/2] hwmon: (ina780) Add driver for TI INA780
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-013-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070329.wHfhXUNK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070329.wHfhXUNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508070329.wHfhXUNK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/ina780.c:282:27: warning: implicit conversion from 'long long' to 'typeof (val)' (aka 'long') changes value from 8052940800 to -536993792 [-Wconstant-conversion]
     282 |                 val = clamp_val(val, 0, 8052940800);
         |                       ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/minmax.h:231:70: note: expanded from macro 'clamp_val'
     231 | #define clamp_val(val, lo, hi) __careful_clamp(typeof(val), val, lo, hi)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/minmax.h:195:30: note: expanded from macro '__careful_clamp'
     195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |                                     ^~                                    ~~~~~~~~~~~~~~~
   include/linux/minmax.h:187:14: note: expanded from macro '__clamp_once'
     187 |         type uhi = (hi);                                                        \
         |              ~~~    ^~
   drivers/hwmon/ina780.c:293:11: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     293 |         int reg, mask;
         |                  ^
>> drivers/hwmon/ina780.c:282:9: error: call to '__compiletime_assert_531' declared with 'error' attribute: clamp() low limit 0 greater than high limit 8052940800
     282 |                 val = clamp_val(val, 0, 8052940800);
         |                       ^
   include/linux/minmax.h:231:32: note: expanded from macro 'clamp_val'
     231 | #define clamp_val(val, lo, hi) __careful_clamp(typeof(val), val, lo, hi)
         |                                ^
   include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
     195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^
   include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
     188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:112:1: note: expanded from here
     112 | __compiletime_assert_531
         | ^
   2 warnings and 1 error generated.


vim +282 drivers/hwmon/ina780.c

9f62cec21205c9 Chris Packham 2025-08-06  274  
9f62cec21205c9 Chris Packham 2025-08-06  275  static int ina780_write_power(struct device *dev, u32 attr, long val)
9f62cec21205c9 Chris Packham 2025-08-06  276  {
9f62cec21205c9 Chris Packham 2025-08-06  277  	struct ina780_data *data = dev_get_drvdata(dev);
9f62cec21205c9 Chris Packham 2025-08-06  278  	int regval;
9f62cec21205c9 Chris Packham 2025-08-06  279  
9f62cec21205c9 Chris Packham 2025-08-06  280  	switch (attr) {
9f62cec21205c9 Chris Packham 2025-08-06  281  	case hwmon_power_max:
9f62cec21205c9 Chris Packham 2025-08-06 @282  		val = clamp_val(val, 0, 8052940800);
9f62cec21205c9 Chris Packham 2025-08-06  283  		regval = div_u64(val * 1000ULL, INA780_PWR_LIMIT_LSB);
9f62cec21205c9 Chris Packham 2025-08-06  284  		return regmap_write(data->regmap, INA780_PWR_LIMIT, regval);
9f62cec21205c9 Chris Packham 2025-08-06  285  	default:
9f62cec21205c9 Chris Packham 2025-08-06  286  		return -EOPNOTSUPP;
9f62cec21205c9 Chris Packham 2025-08-06  287  	}
9f62cec21205c9 Chris Packham 2025-08-06  288  }
9f62cec21205c9 Chris Packham 2025-08-06  289  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
