Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F56FA3
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673888332; x=1705424332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pdrVpC/O2wEeKLgJ9M4WhbjkbItQzOENjHWfh1h8Hc=;
  b=k7NJUx3YGb1Fy9XBzPe7ieQt98zrh8iInimRe+QOtIhOzPzWPrqB39tM
   lcYOFZ3gmJBwx5wxRDfwImIGUI7NfiORsQ+se6ZtXkoUOcQzfnad/4qX+
   ANQFNJMKRFuO/kREXtyQ9V59zgWuwoazpV/5wIY3qUjDnqBY71FXdfXlk
   bls0srwWGEi/4uZnfeC/0FN2ewlYCL//xZGkJBYsddWziLieYBJbbtfXK
   rbFV+xJAPueymV4MNaKNkls0PSp4sfk1iTeKMaJnk0ZkNr2C97r6QNRfA
   QLaZ+kN2EnN65yjDHTvzOmDlGS1LycX6RBc0pTx6sohscpdyaui4xxHCM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351752538"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="351752538"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 08:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="987856060"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="987856060"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jan 2023 08:58:50 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHSor-0000Zw-2u;
	Mon, 16 Jan 2023 16:58:49 +0000
Date: Tue, 17 Jan 2023 00:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/thermal_of.c:674:72: warning: Parameter 'trip' can
 be declared as pointer to const [constParameter]
Message-ID: <202301170028.4q63EVhq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/thermal_of.c:674:72: warning: Parameter 'trip' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linexp.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5dc4c995db9eb45f6373a956eb1f69460e69e6d4
commit: a3193edcbdf9a8ae73b6e1f2da96e920582c1849 thermal/of: Replace device node match with device node search
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a3193edcbdf9a8ae73b6e1f2da96e920582c1849
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/thermal/thermal_of.c:440:27: warning: Parameter 'sensor_np' can be declared as pointer to const [constParameter]
         struct device_node *sensor_np,
                             ^
   drivers/thermal/thermal_of.c:562:55: warning: Parameter 'dev' can be declared as pointer to const [constParameter]
   void thermal_zone_of_sensor_unregister(struct device *dev,
                                                         ^
   drivers/thermal/thermal_of.c:598:17: warning: Parameter 'data' can be declared as pointer to const [constParameter]
             void *data)
                   ^
>> drivers/thermal/thermal_of.c:674:72: warning: Parameter 'trip' can be declared as pointer to const [constParameter]
   static int of_find_trip_id(struct device_node *np, struct device_node *trip)
                                                                          ^

vim +/trip +674 drivers/thermal/thermal_of.c

4e5e4705bf69ea drivers/thermal/of-thermal.c Eduardo Valentin 2013-07-03  673  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22 @674  static int of_find_trip_id(struct device_node *np, struct device_node *trip)
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  675  {
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  676  	struct device_node *trips;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  677  	struct device_node *t;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  678  	int i = 0;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  679  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  680  	trips = of_get_child_by_name(np, "trips");
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  681  	if (!trips) {
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  682  		pr_err("Failed to find 'trips' node\n");
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  683  		return -EINVAL;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  684  	}
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  685  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  686  	/*
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  687  	 * Find the trip id point associated with the cooling device map
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  688  	 */
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  689  	for_each_child_of_node(trips, t) {
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  690  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  691  		if (t == trip)
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  692  			goto out;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  693  		i++;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  694  	}
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  695  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  696  	i = -ENXIO;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  697  out:
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  698  	of_node_put(trips);
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  699  
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  700  	return i;
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  701  }
a3193edcbdf9a8 drivers/thermal/thermal_of.c Daniel Lezcano   2022-07-22  702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
