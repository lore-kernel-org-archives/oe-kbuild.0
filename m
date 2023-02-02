Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382E1875
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 10:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675333466; x=1706869466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=320GxDjfYUny+lell/uHvEM60yqHBym4YIAFxCclPqI=;
  b=V5X+bt2U0EJx0XVof0ByyKbo1H++8ONiO7x8LDNt27FvirroGU5BUES+
   B3lehTN+V5dGsUzfnSU2vUl97RGM/8U+P2I/WjUb5u7vrErayxmNddWcC
   NzhS7xouqPPc+hiBbFsxxeWCmsCUcCrPIlb8qHSM01X5nWQBTBEDiCnKL
   qfnnoSXU/ePpFxEotYbwisOkgFR8XkEkZQkY514maVOp8dW2Bevr1lMMu
   bi+w5Ad8F+IT8mUWZNIrDlLuGKg92THWbp/mAqGLensrhS8Z01Yec6YYn
   SZ6QnJkFz5akIhWyRvkzA4rWCDLrjQuSwzr4qVhxXgFTvSlahVHx1iDQ0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327062132"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327062132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 02:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807925305"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="807925305"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 02:24:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNWlT-0006Q0-32;
	Thu, 02 Feb 2023 10:24:23 +0000
Date: Thu, 2 Feb 2023 18:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/thermal_helpers.c:79:6: warning: Redundant
 initialization for 'ret'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202302021854.IhllliHg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/thermal_helpers.c:79:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f266ccaa2f5228bfe67ad58a94ca4e0109b954a
commit: a930da9bf583b2add01fb0e086913664dadaffd0 thermal/core: Move the mutex inside the thermal_zone_device_update() function
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a930da9bf583b2add01fb0e086913664dadaffd0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_sysfs.c:620:6: warning: %ld in format string (no. 1) requires 'long *' but the argument type is 'unsigned long *'. [invalidScanfArgType_int]
    if (sscanf(buf, "%ldn", &state) != 1)
        ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/thermal_helpers.c:79:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = tz->ops->get_temp(tz, temp);
        ^
   drivers/thermal/thermal_helpers.c:69:10: note: ret is initialized
    int ret = -EINVAL;
            ^
   drivers/thermal/thermal_helpers.c:79:6: note: ret is overwritten
    ret = tz->ops->get_temp(tz, temp);
        ^
   drivers/thermal/thermal_of.c:146:27: warning: Parameter 'sensor_np' can be declared as pointer to const [constParameter]
         struct device_node *sensor_np,
                             ^
>> drivers/thermal/thermal_of.c:179:72: warning: Parameter 'trip' can be declared as pointer to const [constParameter]
   static int of_find_trip_id(struct device_node *np, struct device_node *trip)
                                                                          ^
>> drivers/thermal/thermal_of.c:717:17: warning: Parameter 'data' can be declared as pointer to const [constParameter]
             void *data)
                   ^
--
>> drivers/thermal/thermal_sysfs.c:596:9: warning: %ld in format string (no. 1) requires 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%ldn", state);
           ^
   drivers/thermal/thermal_sysfs.c:609:9: warning: %ld in format string (no. 1) requires 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%ldn", state);
           ^
>> drivers/thermal/thermal_sysfs.c:902:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%dn", instance->weight);
           ^
>> drivers/thermal/thermal_sysfs.c:728:10: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
     len += sprintf(buf + len, "state%ut%llun", i,
            ^
   drivers/thermal/thermal_sysfs.c:772:10: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
     len += snprintf(buf + len, PAGE_SIZE - len, "state%2u  ", i);
            ^
   drivers/thermal/thermal_sysfs.c:783:10: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
     len += snprintf(buf + len, PAGE_SIZE - len, "state%2u:", i);
            ^

vim +/ret +79 drivers/thermal/thermal_helpers.c

cd221c7b638f83 Eduardo Valentin 2016-11-07   66  
a930da9bf583b2 Daniel Lezcano   2022-08-05   67  int __thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   68  {
cd221c7b638f83 Eduardo Valentin 2016-11-07   69  	int ret = -EINVAL;
cd221c7b638f83 Eduardo Valentin 2016-11-07   70  	int count;
cd221c7b638f83 Eduardo Valentin 2016-11-07   71  	int crit_temp = INT_MAX;
cd221c7b638f83 Eduardo Valentin 2016-11-07   72  	enum thermal_trip_type type;
cd221c7b638f83 Eduardo Valentin 2016-11-07   73  
a930da9bf583b2 Daniel Lezcano   2022-08-05   74  	lockdep_assert_held(&tz->lock);
cd221c7b638f83 Eduardo Valentin 2016-11-07   75  
a930da9bf583b2 Daniel Lezcano   2022-08-05   76  	if (!tz || IS_ERR(tz) || !tz->ops->get_temp)
a930da9bf583b2 Daniel Lezcano   2022-08-05   77  		return -EINVAL;
cd221c7b638f83 Eduardo Valentin 2016-11-07   78  
cd221c7b638f83 Eduardo Valentin 2016-11-07  @79  	ret = tz->ops->get_temp(tz, temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07   80  
cd221c7b638f83 Eduardo Valentin 2016-11-07   81  	if (IS_ENABLED(CONFIG_THERMAL_EMULATION) && tz->emul_temperature) {
e5bfcd30f88fdb Daniel Lezcano   2022-07-22   82  		for (count = 0; count < tz->num_trips; count++) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   83  			ret = tz->ops->get_trip_type(tz, count, &type);
cd221c7b638f83 Eduardo Valentin 2016-11-07   84  			if (!ret && type == THERMAL_TRIP_CRITICAL) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   85  				ret = tz->ops->get_trip_temp(tz, count,
cd221c7b638f83 Eduardo Valentin 2016-11-07   86  						&crit_temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07   87  				break;
cd221c7b638f83 Eduardo Valentin 2016-11-07   88  			}
cd221c7b638f83 Eduardo Valentin 2016-11-07   89  		}
cd221c7b638f83 Eduardo Valentin 2016-11-07   90  
cd221c7b638f83 Eduardo Valentin 2016-11-07   91  		/*
cd221c7b638f83 Eduardo Valentin 2016-11-07   92  		 * Only allow emulating a temperature when the real temperature
cd221c7b638f83 Eduardo Valentin 2016-11-07   93  		 * is below the critical temperature so that the emulation code
cd221c7b638f83 Eduardo Valentin 2016-11-07   94  		 * cannot hide critical conditions.
cd221c7b638f83 Eduardo Valentin 2016-11-07   95  		 */
cd221c7b638f83 Eduardo Valentin 2016-11-07   96  		if (!ret && *temp < crit_temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   97  			*temp = tz->emul_temperature;
cd221c7b638f83 Eduardo Valentin 2016-11-07   98  	}
cd221c7b638f83 Eduardo Valentin 2016-11-07   99  
cd221c7b638f83 Eduardo Valentin 2016-11-07  100  	return ret;
cd221c7b638f83 Eduardo Valentin 2016-11-07  101  }
cd221c7b638f83 Eduardo Valentin 2016-11-07  102  

:::::: The code at line 79 was first introduced by commit
:::::: cd221c7b638f83193ffcacf9c2e3f087033fd4cf thermal: core: introduce thermal_helpers.c

:::::: TO: Eduardo Valentin <edubezval@gmail.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
