Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90983185D
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Mar 2023 04:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679374273; x=1710910273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jse4uAFmg+pV6kWCMRnkGIetA9+fZ7DsKg+ZLWy55rA=;
  b=gII+omP+bpwWcCbDzsvRQ/PBqwTaEoG9UGasDgLptaimCIKv7cJZBzj1
   Cz4ewd0NPgVHud8uEK33wfWxDpo+gckLAl7MZidECpm0NyJSpG9pwe2qw
   awKUUNrHMNsdokYqL/voxhMHFlXu1CXjsan8tPJhWm4tsO4bEX0KMmi9L
   brHG0+n9RolPixF71x74VoIJriv0oH5RpTzSvb//mT4upPS441Wq5hMLS
   oHQPkTW4fEK1zFBRMOAUIkZBqgqcu+U4g2gRAAKXvN7MvTsSBuFNuql7P
   QNI0UdJTAkQ8qP9B+EEhMbmVgG5SY+pmlFnmrKu77pCNmo5yFXSunmBSF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403720458"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="403720458"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 21:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927262263"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="927262263"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2023 21:51:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peTxn-000BbO-0h;
	Tue, 21 Mar 2023 04:51:11 +0000
Date: Tue, 21 Mar 2023 12:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 18/23] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <202303211207.mUCSt3CK-lkp@intel.com>
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
In-Reply-To: <20230320144356.803762-19-robdclark@gmail.com>
References: <20230320144356.803762-19-robdclark@gmail.com>
TO: Rob Clark <robdclark@gmail.com>
TO: dri-devel@lists.freedesktop.org
CC: Rob Clark <robdclark@chromium.org>
CC: Len Brown <len.brown@intel.com>
CC: Pavel Machek <pavel@ucw.cz>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>
CC: open list <linux-kernel@vger.kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: freedreno@lists.freedesktop.org

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on rafael-pm/linux-next]
[cannot apply to chanwoo/devfreq-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Pre-allocate-hw_fence/20230320-224826
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230320144356.803762-19-robdclark%40gmail.com
patch subject: [PATCH v2 18/23] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-m041-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211207.mUCSt3CK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303211207.mUCSt3CK-lkp@intel.com/

smatch warnings:
drivers/base/power/qos.c:947 dev_pm_qos_update_user_latency_tolerance() error: uninitialized symbol 'req'.
drivers/base/power/qos.c:975 dev_pm_qos_update_user_latency_tolerance() warn: possible memory leak of 'req'

vim +/req +947 drivers/base/power/qos.c

2d984ad132a87c Rafael J. Wysocki 2014-02-11  917  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  918  /**
2d984ad132a87c Rafael J. Wysocki 2014-02-11  919   * dev_pm_qos_update_user_latency_tolerance - Update user space latency tolerance.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  920   * @dev: Device to update the user space latency tolerance for.
2d984ad132a87c Rafael J. Wysocki 2014-02-11  921   * @val: New user space latency tolerance for @dev (negative values disable).
2d984ad132a87c Rafael J. Wysocki 2014-02-11  922   */
2d984ad132a87c Rafael J. Wysocki 2014-02-11  923  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val)
2d984ad132a87c Rafael J. Wysocki 2014-02-11  924  {
2d7e4629d7265d Rob Clark         2023-03-20  925  	struct dev_pm_qos_request *req = NULL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  926  	int ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  927  
00dd582e52a535 Rob Clark         2023-03-20  928  	ret = dev_pm_qos_constraints_ensure_allocated(dev);
00dd582e52a535 Rob Clark         2023-03-20  929  	if (ret)
00dd582e52a535 Rob Clark         2023-03-20  930  		return ret;
00dd582e52a535 Rob Clark         2023-03-20  931  
2d7e4629d7265d Rob Clark         2023-03-20  932  	if (!dev->power.qos->latency_tolerance_req)
2d7e4629d7265d Rob Clark         2023-03-20  933  		req = kzalloc(sizeof(*req), GFP_KERNEL);
2d7e4629d7265d Rob Clark         2023-03-20  934  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  935  	mutex_lock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  936  
00dd582e52a535 Rob Clark         2023-03-20  937  	if (!dev->power.qos->latency_tolerance_req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  938  		struct dev_pm_qos_request *req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  939  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  940  		if (val < 0) {
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  941  			if (val == PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT)
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  942  				ret = 0;
80a6f7c79b7822 Andrew Lutomirski 2016-11-29  943  			else
2d984ad132a87c Rafael J. Wysocki 2014-02-11  944  				ret = -EINVAL;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  945  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  946  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @947  		if (!req) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  948  			ret = -ENOMEM;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  949  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  950  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  951  		ret = __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LATENCY_TOLERANCE, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  952  		if (ret < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  953  			kfree(req);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  954  			goto out;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  955  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  956  		dev->power.qos->latency_tolerance_req = req;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  957  	} else {
2d7e4629d7265d Rob Clark         2023-03-20  958  		/*
2d7e4629d7265d Rob Clark         2023-03-20  959  		 * If we raced with another thread to allocate the request,
2d7e4629d7265d Rob Clark         2023-03-20  960  		 * simply free the redundant allocation and move on.
2d7e4629d7265d Rob Clark         2023-03-20  961  		 */
2d7e4629d7265d Rob Clark         2023-03-20  962  		if (req)
2d7e4629d7265d Rob Clark         2023-03-20  963  			kfree(req);
2d7e4629d7265d Rob Clark         2023-03-20  964  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  965  		if (val < 0) {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  966  			__dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LATENCY_TOLERANCE);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  967  			ret = 0;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  968  		} else {
2d984ad132a87c Rafael J. Wysocki 2014-02-11  969  			ret = __dev_pm_qos_update_request(dev->power.qos->latency_tolerance_req, val);
2d984ad132a87c Rafael J. Wysocki 2014-02-11  970  		}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  971  	}
2d984ad132a87c Rafael J. Wysocki 2014-02-11  972  
2d984ad132a87c Rafael J. Wysocki 2014-02-11  973   out:
2d984ad132a87c Rafael J. Wysocki 2014-02-11  974  	mutex_unlock(&dev_pm_qos_mtx);
2d984ad132a87c Rafael J. Wysocki 2014-02-11 @975  	return ret;
2d984ad132a87c Rafael J. Wysocki 2014-02-11  976  }
034e7906211c18 Andrew Lutomirski 2016-11-29  977  EXPORT_SYMBOL_GPL(dev_pm_qos_update_user_latency_tolerance);
13b2c4a0c3b1cd Mika Westerberg   2015-07-27  978  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
