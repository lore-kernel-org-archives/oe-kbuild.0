Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48115BA
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679455639; x=1710991639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vUEeb6XRIAWPBBwSI5GUg3gi+k3daAFrlKoCy9rHXcw=;
  b=Uh1UwxkQu/pSAVnW9KyWm8J2qQqNOEHP1JY6/h1bXWEnsYp0aAmQU2zR
   3UvaCv+ylsO19Y2/NI7Rn0wXE7Fg5WEpwAnJtdEELRjVJnsG9bH2R5jpj
   +uRrMvStf/1p+KVvilvZ5S7DcnR3MbHgwteVdj2br/kyiuA7zq4kkJclV
   /KBKyW7kBpPv2CEIdOUv89yVgL4Dx5cRiqBXnrzz8SnjXC1Yk5CVPiwu6
   0JyYyFk4uLB7ROHWwpOBv+MzvWNYaXRyahOXsrmasDgOYFfLr//VFSWLf
   ToCkh8rIKhCrNYyIyA9hGVUTNE5kRVx1qCXdrjP5WBKBHYjxNxwOoCAF2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319505110"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="319505110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011217642"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="1011217642"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2023 20:27:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pep84-000Cnj-0t;
	Wed, 22 Mar 2023 03:27:12 +0000
Date: Wed, 22 Mar 2023 11:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] thermal/core: update cooling device during thermal zone
 unregistration
Message-ID: <202303221159.6cdRxcUo-lkp@intel.com>
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
In-Reply-To: <20230321154627.17787-1-rui.zhang@intel.com>
References: <20230321154627.17787-1-rui.zhang@intel.com>
TO: Zhang Rui <rui.zhang@intel.com>
TO: linux-pm@vger.kernel.org
TO: rafael.j.wysocki@intel.com
TO: daniel.lezcano@linaro.org
CC: linux-kernel@vger.kernel.org

Hi Zhang,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Rui/thermal-core-update-cooling-device-during-thermal-zone-unregistration/20230321-234754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20230321154627.17787-1-rui.zhang%40intel.com
patch subject: [PATCH] thermal/core: update cooling device during thermal zone unregistration
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230322/202303221159.6cdRxcUo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221159.6cdRxcUo-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1436 thermal_zone_device_unregister() warn: iterator used outside loop: 'ti'

vim +/ti +1436 drivers/thermal/thermal_core.c

3034f859b90d49 drivers/thermal/thermal_core.c Daniel Lezcano   2023-03-01  1397  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1398  /**
a052b5118f13fe drivers/thermal/thermal_core.c Yang Yingliang   2021-05-17  1399   * thermal_zone_device_unregister - removes the registered thermal zone device
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1400   * @tz: the thermal zone device to remove
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1401   */
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1402  void thermal_zone_device_unregister(struct thermal_zone_device *tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1403  {
a5f785ce608caf drivers/thermal/thermal_core.c Dmitry Osipenko  2020-08-18  1404  	int i, tz_id;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1405  	const struct thermal_zone_params *tzp;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1406  	struct thermal_cooling_device *cdev;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1407  	struct thermal_zone_device *pos = NULL;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1408  	struct thermal_instance *ti;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1409  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1410  	if (!tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1411  		return;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1412  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1413  	tzp = tz->tzp;
a5f785ce608caf drivers/thermal/thermal_core.c Dmitry Osipenko  2020-08-18  1414  	tz_id = tz->id;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1415  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1416  	mutex_lock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1417  	list_for_each_entry(pos, &thermal_tz_list, node)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1418  		if (pos == tz)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1419  			break;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1420  	if (pos != tz) {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1421  		/* thermal zone device not found */
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1422  		mutex_unlock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1423  		return;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1424  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1425  	list_del(&tz->node);
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1426  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1427  	/* Unbind all cdevs associated with 'this' thermal zone */
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1428  	list_for_each_entry(cdev, &thermal_cdev_list, node) {
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1429  		mutex_lock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1430  		list_for_each_entry(ti, &tz->thermal_instances, tz_node) {
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1431  			if (ti->cdev == cdev)
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1432  				break;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1433  		}
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1434  
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1435  		/* The cooling device is not used by current thermal zone */
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21 @1436  		if (ti->cdev != cdev) {
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1437  			mutex_unlock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1438  			continue;
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1439  		}
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1440  		mutex_unlock(&tz->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1441  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1442  		if (tz->ops->unbind) {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1443  			tz->ops->unbind(tz, cdev);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1444  			goto deactivate_cdev;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1445  		}
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1446  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1447  		if (!tzp || !tzp->tbp)
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1448  			break;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1449  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1450  		for (i = 0; i < tzp->num_tbps; i++) {
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1451  			if (tzp->tbp[i].cdev == cdev) {
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1452  				__unbind(tz, tzp->tbp[i].trip_mask, cdev);
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1453  				tzp->tbp[i].cdev = NULL;
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1454  			}
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1455  		}
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1456  
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1457  deactivate_cdev:
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1458  		/*
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1459  		 * The thermal instances for current thermal zone has been
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1460  		 * removed. Update the cooling device in case it is activated
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1461  		 * by current thermal zone device.
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1462  		 */
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1463  		mutex_lock(&cdev->lock);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1464  		__thermal_cdev_update(cdev);
55a1117eebc62b drivers/thermal/thermal_core.c Zhang Rui        2023-03-21  1465  		mutex_unlock(&cdev->lock);
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1466  	}
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R      2012-09-18  1467  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1468  	mutex_unlock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1469  
163b00cde7cf22 drivers/thermal/thermal_core.c Wei Wang         2019-11-12  1470  	cancel_delayed_work_sync(&tz->poll_queue);
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett  2008-12-03  1471  
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino      2015-02-26  1472  	thermal_set_governor(tz, NULL);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1473  
e68b16abd91dca drivers/thermal/thermal.c      Zhang Rui        2008-04-21  1474  	thermal_remove_hwmon_sysfs(tz);
5a5b7d8d541684 drivers/thermal/thermal_core.c keliu            2022-05-27  1475  	ida_free(&thermal_tz_ida, tz->id);
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox   2016-12-21  1476  	ida_destroy(&tz->ida);
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1477  
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1478  	mutex_lock(&tz->lock);
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1479  	device_del(&tz->device);
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1480  	mutex_unlock(&tz->lock);
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1481  
30b2ae07d3d60a drivers/thermal/thermal_core.c Guenter Roeck    2022-11-10  1482  	put_device(&tz->device);
55cdf0a283b876 drivers/thermal/thermal_core.c Daniel Lezcano   2020-07-06  1483  
a5f785ce608caf drivers/thermal/thermal_core.c Dmitry Osipenko  2020-08-18  1484  	thermal_notify_tz_delete(tz_id);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1485  }
910cb1e34d2fb8 drivers/thermal/thermal_core.c Eduardo Valentin 2013-04-23  1486  EXPORT_SYMBOL_GPL(thermal_zone_device_unregister);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui        2008-01-17  1487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
