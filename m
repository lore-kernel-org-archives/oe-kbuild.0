Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A395628
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 00:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678322767; x=1709858767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2j2sx+RQrfZW7MBTTwimNBxHfR1MxxntGsH1e8jw+mc=;
  b=VqWt8E22K9OnoOd4jgmYSo2VUFDWuVHqwYbn3RLHTyXUez48vLt3N4Ua
   Vc1CJ4PLQxlVT4k9tLcj1414amm4wtM0bOl9eubiFTv4BLGJRcA1F/F0g
   6JeCg93LUib2iwJ9s2yF+5V98R4BjYGbuNShYPTLtfJb9kMA6McxfOMJl
   v6WV90H7jWkhkS0x0LQDIaDwvXyyM2tDvzhHbyA/xCxm3PfMj7PdzgQ78
   DFexpq9TkYpvu75zfo5le328PD2Nh7Z+GAEqpdgpwN+zxCzM5LghHDNVa
   DNFqiZ0s/K6xsYXvRU+AtGF6YbK/4yEzjydGcC1ODrtGePIEvgqKfx6qZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315976012"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315976012"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 16:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707398936"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="707398936"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 16:46:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa4Q0-0002Wp-14;
	Thu, 09 Mar 2023 00:46:04 +0000
Date: Thu, 9 Mar 2023 08:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/thermal_helpers.c:79:6: warning: Redundant
 initialization for 'ret'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202303090839.k0ohgwT9-lkp@intel.com>
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
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: a930da9bf583b2add01fb0e086913664dadaffd0 thermal/core: Move the mutex inside the thermal_zone_device_update() function
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a930da9bf583b2add01fb0e086913664dadaffd0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303090839.k0ohgwT9-lkp@intel.com/


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
