Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D97E
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678029453; x=1709565453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Smvu0rFaL0rf5ALZ9g791RtFOUqOPHxRmRRQutt9v0U=;
  b=lF8MhhBAIm9/PJWKrzQZ2tR/GYEPcRq5OoviswudwQ15OXQJTmBWcg9C
   f6cbjb8djw89KBeTPYRAKDg3zCYMOQP8RWf8jESqv/sllK008myBnyVmt
   X1mv/jY4WX8mAxShKPm3NErd5vAzOR5AKJdcWFIyeYdhIG2S53r7fjDfO
   nD4zFQo5a58gFMJWwgFNoEfpKOlipLeM1qTsKSs9xIhb7IsapU/+gFoqg
   alClo13U3WbYe7E0pa1uAnHVZQc7GtNwzuMf6Ax6nguVwRwl0RQ9QsZzc
   hSj9VU/LG3lEuI25qgcaLNzQ1gzjMwCpTlnSX9UPuqq23E8YVSdEkul0U
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="336902458"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="336902458"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 07:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="764968074"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="764968074"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2023 07:17:31 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYq78-0002qU-1h;
	Sun, 05 Mar 2023 15:17:30 +0000
Date: Sun, 5 Mar 2023 23:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/thermal_helpers.c:79:6: warning: Redundant
 initialization for 'ret'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202303052339.igee5PrW-lkp@intel.com>
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
head:   b01fe98d34f3bed944a93bd8119fed80c856fad8
commit: a930da9bf583b2add01fb0e086913664dadaffd0 thermal/core: Move the mutex inside the thermal_zone_device_update() function
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a930da9bf583b2add01fb0e086913664dadaffd0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303052339.igee5PrW-lkp@intel.com/


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
