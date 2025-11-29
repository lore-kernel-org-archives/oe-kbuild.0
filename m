Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC258635D
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764440654; cv=none; b=s7I5ThNrUT5dMysq1aCmE/9qqJysesiNZP0u4wmur+ZVp+khWZ9gU1cXgtZN71XrisUWTulbv+IxEA1GgKLVwa9yVJ2pNt5Lw/D/fUuYr5f2W2hiHuj9I7WOsfru2MYf6VgciI6+KC5OPVXJfN9r1w1Tn+34AfD/YIeCKMNyCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764440654; c=relaxed/simple;
	bh=+Zn72k4hQIKzSuygd5zSZ6dfc8FQmxJY5YAHV9GOy/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yn2XYcMcp4w3BkD6vhTHqPgSDGxIOOSa2nvYd8j8h88FJM1EFAd57oQblsumeT0k9YHCaYVOoatN+8X3+NtvuxhBZr4BYOkizh4KE7Y/31ZmpMYKSIUJvXxB2JJfIpX7oIhVj6AnzjVFg7cA144shwGbFR3QlFS3CaDetD/SrFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZK5lmkg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZK5lmkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764440652; x=1795976652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Zn72k4hQIKzSuygd5zSZ6dfc8FQmxJY5YAHV9GOy/U=;
  b=QZK5lmkgHRcsl02Dto/6YSEjEKW+V4YgUIs9rxVvszxG1Dv2gZZWeDg2
   Fia7K9K1d9HZM1p9fUfeS+gzGEv3pQcLgl6CA+9jLsoisnUSpGeE8OXxD
   obLd2pd38+exyYwOQdrVLeRUpnVnhn/XjbtshgwLTB2I5btjF66CTmp+g
   5tBzfPRGBANYpJgQ9BC4lx5DCr8rfStUPaRo1YYDG+eJp22le8IUyEsKB
   CbSl36LmbYI4y436ArlGFQIXVZWycZePg+PhyjQjiFXylvTG81TFN9jkj
   m9qlbkoRCn6r2A9qPu/fUbuNEX6JhDYGAJ9bGAKJ8A3908K584y2ZYP2f
   A==;
X-CSE-ConnectionGUID: Y5r8fecPSAOjhpsFAz12zA==
X-CSE-MsgGUID: IYRjdDJbTPqyRE0epdRYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="83818182"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="83818182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 10:24:11 -0800
X-CSE-ConnectionGUID: DemwsghCREqjml9sKdHxIg==
X-CSE-MsgGUID: esJiJa+hRHWDJSsB8xTM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="198632482"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2025 10:24:11 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPPc8-000000002NB-2B4R;
	Sat, 29 Nov 2025 18:24:08 +0000
Date: Sat, 29 Nov 2025 19:23:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5]
 drivers/power/supply/power_supply_sysfs.c:111:57: warning:
 initializer-string for array of 'char' truncates NUL terminator but
 destination lacks 'nonstring' attribute (32 chars into 31 available)
Message-ID: <202511291917.EK0WwXIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Mathew,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 34b830881d43fb698761c1c45df62cf19c6aa363 [5/5] UPSTREAM: power: supply: core: Cleanup power supply sysfs attribute list
:::::: branch date: 5 days ago
:::::: commit date: 5 years ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251129/202511291917.EK0WwXIc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291917.EK0WwXIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511291917.EK0WwXIc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/power_supply_sysfs.c:111:57: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (32 chars into 31 available) [-Wunterminated-string-initialization]
     111 |         POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
         |                                                         ^
   drivers/power/supply/power_supply_sysfs.c:33:23: note: in definition of macro 'POWER_SUPPLY_ATTR'
      33 |         .attr_name = #_name "\0",       \
         |                       ^~~~~


vim +111 drivers/power/supply/power_supply_sysfs.c

105df60f207301 David Lechner 2017-05-15   73  
34b830881d43fb Mathew King   2020-05-04   74  static struct power_supply_attr power_supply_attrs[] = {
34b830881d43fb Mathew King   2020-05-04   75  	/* Properties of type `int' */
34b830881d43fb Mathew King   2020-05-04   76  	POWER_SUPPLY_ATTR(STATUS),
34b830881d43fb Mathew King   2020-05-04   77  	POWER_SUPPLY_ATTR(CHARGE_TYPE),
34b830881d43fb Mathew King   2020-05-04   78  	POWER_SUPPLY_ATTR(HEALTH),
34b830881d43fb Mathew King   2020-05-04   79  	POWER_SUPPLY_ATTR(PRESENT),
34b830881d43fb Mathew King   2020-05-04   80  	POWER_SUPPLY_ATTR(ONLINE),
34b830881d43fb Mathew King   2020-05-04   81  	POWER_SUPPLY_ATTR(AUTHENTIC),
34b830881d43fb Mathew King   2020-05-04   82  	POWER_SUPPLY_ATTR(TECHNOLOGY),
34b830881d43fb Mathew King   2020-05-04   83  	POWER_SUPPLY_ATTR(CYCLE_COUNT),
34b830881d43fb Mathew King   2020-05-04   84  	POWER_SUPPLY_ATTR(VOLTAGE_MAX),
34b830881d43fb Mathew King   2020-05-04   85  	POWER_SUPPLY_ATTR(VOLTAGE_MIN),
34b830881d43fb Mathew King   2020-05-04   86  	POWER_SUPPLY_ATTR(VOLTAGE_MAX_DESIGN),
34b830881d43fb Mathew King   2020-05-04   87  	POWER_SUPPLY_ATTR(VOLTAGE_MIN_DESIGN),
34b830881d43fb Mathew King   2020-05-04   88  	POWER_SUPPLY_ATTR(VOLTAGE_NOW),
34b830881d43fb Mathew King   2020-05-04   89  	POWER_SUPPLY_ATTR(VOLTAGE_AVG),
34b830881d43fb Mathew King   2020-05-04   90  	POWER_SUPPLY_ATTR(VOLTAGE_OCV),
34b830881d43fb Mathew King   2020-05-04   91  	POWER_SUPPLY_ATTR(VOLTAGE_BOOT),
34b830881d43fb Mathew King   2020-05-04   92  	POWER_SUPPLY_ATTR(CURRENT_MAX),
34b830881d43fb Mathew King   2020-05-04   93  	POWER_SUPPLY_ATTR(CURRENT_NOW),
34b830881d43fb Mathew King   2020-05-04   94  	POWER_SUPPLY_ATTR(CURRENT_AVG),
34b830881d43fb Mathew King   2020-05-04   95  	POWER_SUPPLY_ATTR(CURRENT_BOOT),
34b830881d43fb Mathew King   2020-05-04   96  	POWER_SUPPLY_ATTR(POWER_NOW),
34b830881d43fb Mathew King   2020-05-04   97  	POWER_SUPPLY_ATTR(POWER_AVG),
34b830881d43fb Mathew King   2020-05-04   98  	POWER_SUPPLY_ATTR(CHARGE_FULL_DESIGN),
34b830881d43fb Mathew King   2020-05-04   99  	POWER_SUPPLY_ATTR(CHARGE_EMPTY_DESIGN),
34b830881d43fb Mathew King   2020-05-04  100  	POWER_SUPPLY_ATTR(CHARGE_FULL),
34b830881d43fb Mathew King   2020-05-04  101  	POWER_SUPPLY_ATTR(CHARGE_EMPTY),
34b830881d43fb Mathew King   2020-05-04  102  	POWER_SUPPLY_ATTR(CHARGE_NOW),
34b830881d43fb Mathew King   2020-05-04  103  	POWER_SUPPLY_ATTR(CHARGE_AVG),
34b830881d43fb Mathew King   2020-05-04  104  	POWER_SUPPLY_ATTR(CHARGE_COUNTER),
34b830881d43fb Mathew King   2020-05-04  105  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_CURRENT),
34b830881d43fb Mathew King   2020-05-04  106  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_CURRENT_MAX),
34b830881d43fb Mathew King   2020-05-04  107  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_VOLTAGE),
34b830881d43fb Mathew King   2020-05-04  108  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_VOLTAGE_MAX),
34b830881d43fb Mathew King   2020-05-04  109  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_LIMIT),
34b830881d43fb Mathew King   2020-05-04  110  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_LIMIT_MAX),
34b830881d43fb Mathew King   2020-05-04 @111  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
34b830881d43fb Mathew King   2020-05-04  112  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_END_THRESHOLD),
34b830881d43fb Mathew King   2020-05-04  113  	POWER_SUPPLY_ATTR(INPUT_CURRENT_LIMIT),
34b830881d43fb Mathew King   2020-05-04  114  	POWER_SUPPLY_ATTR(INPUT_VOLTAGE_LIMIT),
34b830881d43fb Mathew King   2020-05-04  115  	POWER_SUPPLY_ATTR(INPUT_POWER_LIMIT),
34b830881d43fb Mathew King   2020-05-04  116  	POWER_SUPPLY_ATTR(ENERGY_FULL_DESIGN),
34b830881d43fb Mathew King   2020-05-04  117  	POWER_SUPPLY_ATTR(ENERGY_EMPTY_DESIGN),
34b830881d43fb Mathew King   2020-05-04  118  	POWER_SUPPLY_ATTR(ENERGY_FULL),
34b830881d43fb Mathew King   2020-05-04  119  	POWER_SUPPLY_ATTR(ENERGY_EMPTY),
34b830881d43fb Mathew King   2020-05-04  120  	POWER_SUPPLY_ATTR(ENERGY_NOW),
34b830881d43fb Mathew King   2020-05-04  121  	POWER_SUPPLY_ATTR(ENERGY_AVG),
34b830881d43fb Mathew King   2020-05-04  122  	POWER_SUPPLY_ATTR(CAPACITY),
34b830881d43fb Mathew King   2020-05-04  123  	POWER_SUPPLY_ATTR(CAPACITY_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  124  	POWER_SUPPLY_ATTR(CAPACITY_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  125  	POWER_SUPPLY_ATTR(CAPACITY_LEVEL),
34b830881d43fb Mathew King   2020-05-04  126  	POWER_SUPPLY_ATTR(TEMP),
34b830881d43fb Mathew King   2020-05-04  127  	POWER_SUPPLY_ATTR(TEMP_MAX),
34b830881d43fb Mathew King   2020-05-04  128  	POWER_SUPPLY_ATTR(TEMP_MIN),
34b830881d43fb Mathew King   2020-05-04  129  	POWER_SUPPLY_ATTR(TEMP_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  130  	POWER_SUPPLY_ATTR(TEMP_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  131  	POWER_SUPPLY_ATTR(TEMP_AMBIENT),
34b830881d43fb Mathew King   2020-05-04  132  	POWER_SUPPLY_ATTR(TEMP_AMBIENT_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  133  	POWER_SUPPLY_ATTR(TEMP_AMBIENT_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  134  	POWER_SUPPLY_ATTR(TIME_TO_EMPTY_NOW),
34b830881d43fb Mathew King   2020-05-04  135  	POWER_SUPPLY_ATTR(TIME_TO_EMPTY_AVG),
34b830881d43fb Mathew King   2020-05-04  136  	POWER_SUPPLY_ATTR(TIME_TO_FULL_NOW),
34b830881d43fb Mathew King   2020-05-04  137  	POWER_SUPPLY_ATTR(TIME_TO_FULL_AVG),
34b830881d43fb Mathew King   2020-05-04  138  	POWER_SUPPLY_ATTR(TYPE),
34b830881d43fb Mathew King   2020-05-04  139  	POWER_SUPPLY_ATTR(USB_TYPE),
34b830881d43fb Mathew King   2020-05-04  140  	POWER_SUPPLY_ATTR(SCOPE),
34b830881d43fb Mathew King   2020-05-04  141  	POWER_SUPPLY_ATTR(PRECHARGE_CURRENT),
34b830881d43fb Mathew King   2020-05-04  142  	POWER_SUPPLY_ATTR(CHARGE_TERM_CURRENT),
34b830881d43fb Mathew King   2020-05-04  143  	POWER_SUPPLY_ATTR(CALIBRATE),
34b830881d43fb Mathew King   2020-05-04  144  	/* Properties of type `const char *' */
34b830881d43fb Mathew King   2020-05-04  145  	POWER_SUPPLY_ATTR(MODEL_NAME),
34b830881d43fb Mathew King   2020-05-04  146  	POWER_SUPPLY_ATTR(MANUFACTURER),
34b830881d43fb Mathew King   2020-05-04  147  	POWER_SUPPLY_ATTR(SERIAL_NUMBER),
34b830881d43fb Mathew King   2020-05-04  148  };
34b830881d43fb Mathew King   2020-05-04  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
