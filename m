Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82E30C61A
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Sep 2025 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495160; cv=none; b=ALrmJr3Rt1IBaB8ZE56YlPhHz4SqAy4QlQu/7Oz8UceBSUqEzokI79q23BqZHfxb1fZXMT0gfAAPtNtD6I0d13HfIskz/acgro7xttlyj1jKS24XCE9jfkR02ozgg+bAwi3OpIE7MDH6kmzcvQDeqwLgcgR57HZ0Y8F3AaT07Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495160; c=relaxed/simple;
	bh=Zwe8N3li7Bybn3MxbHk1j1QiHp56UYIQLguJeVo7NlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSI9Wn62NmfKWVhf5YjMaFxINHmO0M9rVUX9e5z3ikkbTY/4iyh28nzfo771vM/kOfR/BsAKbu9LKFEl9Ahv7pljP1rKxp0xqBxhj04+dOK5OeoGktBTQB9FCR95MSNfvtHKS9KNLuNNRl6mXQmHi2mUEn/VUNa0Yqni/n07Tjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioDZjTnI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioDZjTnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757495158; x=1789031158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zwe8N3li7Bybn3MxbHk1j1QiHp56UYIQLguJeVo7NlI=;
  b=ioDZjTnIbvD8oylnXx7GDCTjBuVFqnFJT8yPgVyMgH4lWQjj82iyK82T
   bl+v8wFsqe6tP3ODrVBWHex0doprQh57KI0fj2zjyyYE+3/Z5qrZfJcWp
   dfI3V1nY6r3AA+Do4LtYfwUQQGpe4B/8nIg0R4dFSDyYpVC8gig5Viv4n
   oM0zG9Ote8yLgV6I4t0RXsmvoaVkeVnMoVRRVuZKlhCdvmJiC3tlRJIiX
   3yQxz059HV3UmJpSvCG2R1/SIVeZTPevqNSjKgN4i7G8BGYB4G1YV7/ru
   gN3G4lXwJC7aGf3vQUao1x70f+jVfmd0FUpUAsQn0Ak1fx57wgY75WeWB
   Q==;
X-CSE-ConnectionGUID: VnaUjMBaTfCsLeoiyBSDFA==
X-CSE-MsgGUID: 9aA4lR96RYqBQS9mw05TTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82389292"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82389292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 02:05:56 -0700
X-CSE-ConnectionGUID: SOHCfaiURsKVafC7Xui1ag==
X-CSE-MsgGUID: m/cxLUX7RhaC1s16GEykKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="178553313"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 02:05:55 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwGlz-0005jP-32;
	Wed, 10 Sep 2025 09:05:51 +0000
Date: Wed, 10 Sep 2025 17:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on
 rapid events
Message-ID: <202509101620.yI0HZ5gT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250907035154.223983-1-luogf2025@163.com>
References: <20250907035154.223983-1-luogf2025@163.com>
TO: GuangFei Luo <luogf2025@163.com>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Len Brown <lenb@kernel.org>
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org
CC: luogf2025@163.com

Hi GuangFei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.17-rc5 next-20250909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GuangFei-Luo/ACPI-battery-prevent-sysfs_add_battery-re-entry-on-rapid-events/20250907-115505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250907035154.223983-1-luogf2025%40163.com
patch subject: [PATCH] ACPI: battery: prevent sysfs_add_battery re-entry on rapid events
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250909 (https://download.01.org/0day-ci/archive/20250910/202509101620.yI0HZ5gT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509101620.yI0HZ5gT-lkp@intel.com/

smatch warnings:
drivers/acpi/battery.c:1046 acpi_battery_update() warn: inconsistent returns '&battery->sysfs_lock'.

vim +1046 drivers/acpi/battery.c

557d58687dcdee6 Zhang Rui               2010-10-22  1000  
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1001  static int acpi_battery_update(struct acpi_battery *battery, bool resume)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1002  {
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1003  	int result = acpi_battery_get_status(battery);
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1004  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1005  	if (result)
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1006  		return result;
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1007  
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1008  	if (!acpi_battery_present(battery)) {
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1009  		sysfs_remove_battery(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1010  		battery->update_time = 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1011  		return 0;
508df92d1f8d192 Andrey Borzenkov        2007-10-28  1012  	}
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1013  
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1014  	if (resume)
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1015  		return 0;
9e50bc14a7f58b5 Lan Tianyu              2014-05-04  1016  
82f2d30570b7ecd Lucas Rangit Magasweran 2018-07-14  1017  	if (!battery->update_time) {
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1018  		result = acpi_battery_get_info(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1019  		if (result)
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1020  			return result;
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1021  		acpi_battery_init_alarm(battery);
97749cd9adbb298 Alexey Starikovskiy     2008-01-01  1022  	}
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1023  
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1024  	result = acpi_battery_get_state(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1025  	if (result)
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1026  		return result;
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1027  	acpi_battery_quirks(battery);
12c78ca2ab5e64b Carlos Garnacho         2016-08-10  1028  
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1029  	mutex_lock(&battery->sysfs_lock);
297d716f6260cc9 Krzysztof Kozlowski     2015-03-12  1030  	if (!battery->bat) {
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1031  		result = sysfs_add_battery(battery);
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1032  		if (result)
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1033  			return result;
eb03cb02b74df6d Stefan Hajnoczi         2011-07-12  1034  	}
ce5e61beaad5c5a GuangFei Luo            2025-09-07  1035  	mutex_unlock(&battery->sysfs_lock);
e0d1f09e311fafa Zhang Rui               2014-05-28  1036  
e0d1f09e311fafa Zhang Rui               2014-05-28  1037  	/*
e0d1f09e311fafa Zhang Rui               2014-05-28  1038  	 * Wakeup the system if battery is critical low
e0d1f09e311fafa Zhang Rui               2014-05-28  1039  	 * or lower than the alarm level
e0d1f09e311fafa Zhang Rui               2014-05-28  1040  	 */
e0d1f09e311fafa Zhang Rui               2014-05-28  1041  	if ((battery->state & ACPI_BATTERY_STATE_CRITICAL) ||
e0d1f09e311fafa Zhang Rui               2014-05-28  1042  	    (test_bit(ACPI_BATTERY_ALARM_PRESENT, &battery->flags) &&
e0d1f09e311fafa Zhang Rui               2014-05-28  1043  	     (battery->capacity_now <= battery->alarm)))
33e4f80ee69b516 Rafael J. Wysocki       2017-06-12  1044  		acpi_pm_wakeup_event(&battery->device->dev);
e0d1f09e311fafa Zhang Rui               2014-05-28  1045  
557d58687dcdee6 Zhang Rui               2010-10-22 @1046  	return result;
4bd35cdb1e2d1a1 Vladimir Lebedev        2007-02-10  1047  }
4bd35cdb1e2d1a1 Vladimir Lebedev        2007-02-10  1048  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
