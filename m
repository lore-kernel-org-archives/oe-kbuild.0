Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E3381
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Nov 2022 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668865407; x=1700401407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MWwXUomxXekU5zWDAJwKs946G1NiBRydKajk0SW/IMg=;
  b=a9xhOH7/XQjTtsxBMx0bvimVb9wN6665APZAqVr7l/bDWlDp/xX8jCOq
   3k7EA+Kd42QupjoYpZtwG2F4fYnvXoZYxvB/zUV44nrTcNoOJumLkJUwV
   AFp2fM+1upgX1nsV9V3VJfWErHNHZneVQwBEOKXCUfXrzep4L5pTKNG4u
   yl+zratyDGApAs2iKX+HeeTzLWItKFm9VESr3iEB7rQE88P8UWCJxJdjA
   BgsIOD/q3GBIZzvmDU/D4g8ddrQltdnM84VgohnM6Rbk9sLmkiMhhR5zB
   ESZlQ3DJN9Qorp8uikt038QW3+XkmGDmrSqeLq6u28tWmLazoEFspbgq2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="315137002"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="315137002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2022 05:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="885619652"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="885619652"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2022 05:43:26 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owO7x-0002EH-1J;
	Sat, 19 Nov 2022 13:43:25 +0000
Date: Sat, 19 Nov 2022 21:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/thermal_helpers.c:79:6: warning: Redundant
 initialization for 'ret'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202211192142.lsWv3SHs-lkp@intel.com>
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
head:   fe24a97cf2543e8832e7a2124802e5c32aac05aa
commit: a930da9bf583b2add01fb0e086913664dadaffd0 thermal/core: Move the mutex inside the thermal_zone_device_update() function
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a930da9bf583b2add01fb0e086913664dadaffd0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


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
https://01.org/lkp
