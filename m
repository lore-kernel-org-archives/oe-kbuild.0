Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3611EA29
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676798674; x=1708334674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OL4+WK9/gEd7fQz8fraDeTHO0GPyWmhdf3S1zp9azJM=;
  b=XoB8FVoWs/75T8iweFLfkGjtURNKNmGm/ooEj6VXvFzoVAUqkk+hxxFx
   PsNxzV7wSLsmWgakdhocIzFPdbW06aTntIOwyz0patn6odq+3fLyhW0Qr
   PMyck2OeoRDY1/Rby9aaulTf55svr0IDoFLOV4+pXa4SShofgiDkdluAR
   ZCcb2lLpLH3I8dVzOvb/mrSxEDBUmhS5kzuhnGz3AfMsVsiAQzRWQzGoi
   Kv+C/QknNK5IjKZ+zG2QXeVI58DxDb/V10clN4MUIhJ3FKtJEKPX2QjOd
   aKrLA4X7dme1Q/LcxI+N3vzF33OpAKtRAsBTf+K15LGJ1HKkAZwBHbPwy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="329950364"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="329950364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 01:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="999961432"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="999961432"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2023 01:24:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTfvr-000DD3-1O;
	Sun, 19 Feb 2023 09:24:31 +0000
Date: Sun, 19 Feb 2023 17:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_hwmon.c:178 hwm_power1_max_interval_show()
 error: uninitialized symbol 'r'.
Message-ID: <202302191750.tXj8H5c8-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Anshuman Gupta <anshuman.gupta@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 4c2572fe0ae742c2fa25b6fbb06ef4b3cd08b454 drm/i915/hwmon: Expose power1_max_interval
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230219/202302191750.tXj8H5c8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191750.tXj8H5c8-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:178 hwm_power1_max_interval_show() error: uninitialized symbol 'r'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:93 hwm_field_read_and_scale() error: uninitialized symbol 'reg_value'.
drivers/gpu/drm/i915/i915_hwmon.c:154 hwm_energy() error: uninitialized symbol 'reg_val'.
drivers/gpu/drm/i915/i915_hwmon.c:324 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/r +178 drivers/gpu/drm/i915/i915_hwmon.c

c41b8bdcc2973c Dale B Stimson 2022-10-13  164  
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  165  static ssize_t
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  166  hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  167  			     char *buf)
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  168  {
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  169  	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  170  	struct i915_hwmon *hwmon = ddat->hwmon;
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  171  	intel_wakeref_t wakeref;
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  172  	u32 r, x, y, x_w = 2; /* 2 bits */
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  173  	u64 tau4, out;
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  174  
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  175  	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  176  		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  177  
4c2572fe0ae742 Ashutosh Dixit 2022-10-13 @178  	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  179  	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  180  	/*
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  181  	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  182  	 *     = (4 | x) << (y - 2)
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  183  	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  184  	 * However because y can be < 2, we compute
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  185  	 *     tau4 = (4 | x) << y
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  186  	 * but add 2 when doing the final right shift to account for units
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  187  	 */
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  188  	tau4 = ((1 << x_w) | x) << y;
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  189  	/* val in hwmon interface units (millisec) */
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  190  	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  191  
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  192  	return sysfs_emit(buf, "%llu\n", out);
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  193  }
4c2572fe0ae742 Ashutosh Dixit 2022-10-13  194  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
