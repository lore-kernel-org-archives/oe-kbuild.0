Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE9134C6
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbQnUNeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699006557; x=1730542557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RTauSB2RCkx5toKOJEP7MPV3MY4jv72Y3QY6TRY9sBc=;
  b=SbQnUNeTMU2RmuelCV0Rr+D1SQSwDX+yJm/26BSksz8svemTxOeP35m9
   Qwlre0xfpS9Wu6HsIXsTLxAVzliAXMvFpfWcGpqvdBAlKuBUOpoETkBLB
   PIMazUlq8tc2OrBnjfMiLNx3kurbFwEVLBZC9qHuws6NO0yYf5zWYBU4g
   lYDyj8VEiUHY+OahsWeB2E19TxNHtMThjwmcFmHVBUkGm3QIikTYgDOCR
   hpCgJogwM60NFhIPAcnNezzaSwCz3kApgXaoCozMeXQ8/woT7AIWOZsty
   JJIj1c9GnlIGhciIUxgCs2AbCvvFHnkR6Egv87GltZTQaMEvkvw5cQ4/+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10454054"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="10454054"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 03:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1093027156"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1093027156"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 03:15:49 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyrDP-0002Rc-18;
	Fri, 03 Nov 2023 10:15:47 +0000
Date: Fri, 3 Nov 2023 18:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/pmbus/pmbus_core.c:970:20: sparse: sparse: too long
 token expansion
Message-ID: <202311031827.eGfoBPYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hwmon/pmbus/pmbus_core.c:970:20: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-r133-20231103 (https://download.01.org/0day-ci/archive/20231103/202311031827.eGfoBPYK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031827.eGfoBPYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311031827.eGfoBPYK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/pmbus_core.c:970:20: sparse: sparse: too long token expansion

vim +970 drivers/hwmon/pmbus/pmbus_core.c

442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  914  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  915  static u16 pmbus_data2reg_linear(struct pmbus_data *data,
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25  916  				 struct pmbus_sensor *sensor, s64 val)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  917  {
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  918  	s16 exponent = 0, mantissa;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  919  	bool negative = false;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  920  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  921  	/* simple case */
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  922  	if (val == 0)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  923  		return 0;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  924  
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  925  	if (sensor->class == PSC_VOLTAGE_OUT) {
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  926  		/* LINEAR16 does not support negative voltages */
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  927  		if (val < 0)
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  928  			return 0;
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  929  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  930  		/*
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  931  		 * For a static exponents, we don't have a choice
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  932  		 * but to adjust the value to it.
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  933  		 */
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  934  		if (data->exponent[sensor->page] < 0)
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  935  			val <<= -data->exponent[sensor->page];
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  936  		else
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  937  			val >>= data->exponent[sensor->page];
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25  938  		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25  939  		return clamp_val(val, 0, 0xffff);
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  940  	}
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  941  
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  942  	if (val < 0) {
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  943  		negative = true;
9f6ad1ce6484a9 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-03-07  944  		val = -val;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  945  	}
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  946  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  947  	/* Power is in uW. Convert to mW before converting. */
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  948  	if (sensor->class == PSC_POWER)
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25  949  		val = DIV_ROUND_CLOSEST_ULL(val, 1000);
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  950  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  951  	/*
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  952  	 * For simplicity, convert fan data to milli-units
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  953  	 * before calculating the exponent.
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  954  	 */
daa436e67cd2dc drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2014-01-30  955  	if (sensor->class == PSC_FAN)
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25  956  		val = val * 1000LL;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  957  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  958  	/* Reduce large mantissa until it fits into 10 bit */
4036a48e20e849 drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2019-03-13  959  	while (val >= MAX_LIN_MANTISSA && exponent < 15) {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  960  		exponent++;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  961  		val >>= 1;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  962  	}
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  963  	/* Increase small mantissa to improve precision */
4036a48e20e849 drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck 2019-03-13  964  	while (val < MIN_LIN_MANTISSA && exponent > -15) {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  965  		exponent--;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  966  		val <<= 1;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  967  	}
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  968  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  969  	/* Convert mantissa from milli-units to units */
8ba75b20284967 drivers/hwmon/pmbus/pmbus_core.c Josh Lehan    2020-06-25 @970  	mantissa = clamp_val(DIV_ROUND_CLOSEST_ULL(val, 1000), 0, 0x3ff);
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  971  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  972  	/* restore sign */
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  973  	if (negative)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  974  		mantissa = -mantissa;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  975  
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  976  	/* Convert to 5 bit exponent, 11 bit mantissa */
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  977  	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  978  }
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck 2011-01-26  979  

:::::: The code at line 970 was first introduced by commit
:::::: 8ba75b2028496777a7d595ed5ba03cc85f86bdbb hwmon: (pmbus/core) Use s64 instead of long for calculations

:::::: TO: Josh Lehan <krellan@google.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
