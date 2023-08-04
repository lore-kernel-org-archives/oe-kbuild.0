Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F58479
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691140830; x=1722676830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdDrjCyp3rx4hB2ZnaHiDZD1Z+xYVocMMHFjBIZcLq0=;
  b=djxRnD4Bqa36u2U+0n6mY17N9djdS9W3Vyp9jaPS3pm9NUoZMwD/LwOr
   aLThUEYegxaEEch4fCPWdOQMlPulRUu/pLXDZcCkegnvoECvClUP/JbqB
   N0yJ3ThgItPbfY5X621Hm9z91AQJ8+0uzV+JYTdLm+TACZ+XI+MPFnM7N
   y25EEbiehuJfw9WZ8tAElWllRMl2BThm1+xaxO5RndQOTXXZBqbhC8x6W
   6Cr9oIRSYUSvUJc4eCfdOWnqbqn6zYsvSKs6LHqk0mOG4v7y2lZvbz0u4
   WHgs1BcS7IT4bwjKa7refEJjFNovKKFsR4r8/zfv0sQg9Yvi7oFV3oeQT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349707075"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="349707075"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 02:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060676072"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="1060676072"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Aug 2023 02:20:14 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRqyj-0002lZ-2t;
	Fri, 04 Aug 2023 09:20:13 +0000
Date: Fri, 4 Aug 2023 17:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/9] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <202308041725.Npwswh0L-lkp@intel.com>
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
In-Reply-To: <20230803220202.78036-5-robdclark@gmail.com>
References: <20230803220202.78036-5-robdclark@gmail.com>
TO: Rob Clark <robdclark@gmail.com>
TO: dri-devel@lists.freedesktop.org
CC: Rob Clark <robdclark@chromium.org>
CC: Len Brown <len.brown@intel.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>
CC: open list <linux-kernel@vger.kernel.org>
CC: Pavel Machek <pavel@ucw.cz>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: freedreno@lists.freedesktop.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on rafael-pm/linux-next linus/master v6.5-rc4 next-20230804]
[cannot apply to chanwoo/devfreq-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/PM-devfreq-Drop-unneed-locking-to-appease-lockdep/20230804-060505
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230803220202.78036-5-robdclark%40gmail.com
patch subject: [PATCH v3 4/9] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230804/202308041725.Npwswh0L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041725.Npwswh0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308041725.Npwswh0L-lkp@intel.com/

smatch warnings:
drivers/base/power/qos.c:973 dev_pm_qos_update_user_latency_tolerance() warn: possible memory leak of 'req'

vim +/req +973 drivers/base/power/qos.c

2d984ad132a87c Rafael J. Wysocki 2014-02-11  917  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  918  /**
2d984ad132a87c Rafael J. Wysocki 2014-02-11  919   * dev_pm_qos_update_user_latency_tolerance - Update user space latency tolerance.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  920   * @dev: Device to update the user space latency tolerance for.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  921   * @val: New user space latency tolerance for @dev (negative values disable).
2d984ad132a87c Rafael J. Wysocki 2014-02-11  922   */
2d984ad132a87c Rafael J. Wysocki 2014-02-11  923  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
2d984ad132a87c Rafael J. Wysocki 2014-02-11  924  {
b5ac35ff4296f7 Rob Clark         2023-08-03  925  	struct dev_pm_qos_request *req = NULL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  926  	int ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  927  
211fb32e3a0547 Rob Clark         2023-08-03  928  	ret = dev_pm_qos_constraints_ensure_allocated(dev);
211fb32e3a0547 Rob Clark         2023-08-03  929  	if (ret)
211fb32e3a0547 Rob Clark         2023-08-03  930  		return ret;
211fb32e3a0547 Rob Clark         2023-08-03  931  
b5ac35ff4296f7 Rob Clark         2023-08-03  932  	if (!dev->power.qos->latency_tolerance_req)
b5ac35ff4296f7 Rob Clark         2023-08-03  933  		req = kzalloc(sizeof(*req), GFP_KERNEL);
b5ac35ff4296f7 Rob Clark         2023-08-03  934  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  935  	mutex_lock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  936  
211fb32e3a0547 Rob Clark         2023-08-03  937  	if (!dev->power.qos->latency_tolerance_req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  938  		if (val < 0) {
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  939  			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  940  				ret = 0;
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  941  			else
2d984ad132a87c Rafael J. Wysocki 2014-02-11  942  				ret = -EINVAL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  943  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  944  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  945  		if (!req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  946  			ret = -ENOMEM;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  947  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  948  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  949  		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  950  		if (ret < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  951  			kfree(req);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  952  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  953  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  954  		dev->power.qos->latency_tolerance_req = req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  955  	} else {
b5ac35ff4296f7 Rob Clark         2023-08-03  956  		/*
b5ac35ff4296f7 Rob Clark         2023-08-03  957  		 * If we raced with another thread to allocate the request,
b5ac35ff4296f7 Rob Clark         2023-08-03  958  		 * simply free the redundant allocation and move on.
b5ac35ff4296f7 Rob Clark         2023-08-03  959  		 */
b5ac35ff4296f7 Rob Clark         2023-08-03  960  		if (req)
b5ac35ff4296f7 Rob Clark         2023-08-03  961  			kfree(req);
b5ac35ff4296f7 Rob Clark         2023-08-03  962  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  963  		if (val < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  964  			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  965  			ret = 0;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  966  		} else {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  967  			ret = __dev_pm_qos_update_request(dev->power.qos->latency_tolerance_req, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  968  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  969  	}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  970  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  971   out:
2d984ad132a87c Rafael J. Wysocki 2014-02-11  972  	mutex_unlock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @973  	return ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  974  }
034e7906211c18 Andrew Lutomirski 2016-11-29  975  EXPORT_SYMBOL_GPL(dev_pm_qos_update_user_latency_tolerance);
13b2c4a0c3b1cd Mika Westerberg   2015-07-27  976  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
