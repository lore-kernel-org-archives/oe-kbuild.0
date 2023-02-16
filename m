Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D72917D7
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676521758; x=1708057758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6+bDhU3Eh3lwiFlbn+HdrKjwg6R7QldBSMJZXrPO6E=;
  b=kpXhpvYjp5L3gYl71k8FD9scNoVGLl1tdoacOsx9pEmKcB3fA1oRqRqo
   iMVoCWfwJAHGz3EH98d6qD/WZAqjgY0EMkIzhJugnQMXZ4I+isnRiIeaj
   sxgqFcfteI9/+tmdAUzVXYA7CNsi+y0Qye+wAha3eA+olH5JbpfHGa5Ah
   1D6/9xwNbiSXJFvqDd+uYRuxdvgwmi6SgsdOYoQUYqn7UAlhRfc4gKCE1
   ySB8ufNzk49zo5Mnt4mJSeNiravKUSHwoZ8is2dduH0NFndI5Qf9lSuFH
   sn+Z9pD+PvvuXkeHYwU1/AafR9IcaDO2FQPB4BNv8P529wc3EL2L4e2/R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="359049757"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="359049757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 20:29:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="619860745"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="619860745"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 20:29:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSVtT-000A0b-0A;
	Thu, 16 Feb 2023 04:29:15 +0000
Date: Thu, 16 Feb 2023 12:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_hwmon.c:69 hwm_in_read() error:
 uninitialized symbol 'reg_value'.
Message-ID: <202302161256.eeoRFhSo-lkp@intel.com>
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
TO: Riana Tauro <riana.tauro@intel.com>
CC: Anshuman Gupta <anshuman.gupta@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   033c40a89f55525139fd5b6342281b09b97d05bf
commit: f8572bb675250ee527d9ba35fa1ce17480407399 drm/i915/hwmon: Add HWMON current voltage support
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302161256.eeoRFhSo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302161256.eeoRFhSo-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/i915_hwmon.c:69 hwm_in_read() error: uninitialized symbol 'reg_value'.

vim +/reg_value +69 drivers/gpu/drm/i915/i915_hwmon.c

f8572bb675250e Riana Tauro 2022-10-13  56  
f8572bb675250e Riana Tauro 2022-10-13  57  static int
f8572bb675250e Riana Tauro 2022-10-13  58  hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
f8572bb675250e Riana Tauro 2022-10-13  59  {
f8572bb675250e Riana Tauro 2022-10-13  60  	struct i915_hwmon *hwmon = ddat->hwmon;
f8572bb675250e Riana Tauro 2022-10-13  61  	intel_wakeref_t wakeref;
f8572bb675250e Riana Tauro 2022-10-13  62  	u32 reg_value;
f8572bb675250e Riana Tauro 2022-10-13  63  
f8572bb675250e Riana Tauro 2022-10-13  64  	switch (attr) {
f8572bb675250e Riana Tauro 2022-10-13  65  	case hwmon_in_input:
f8572bb675250e Riana Tauro 2022-10-13  66  		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
f8572bb675250e Riana Tauro 2022-10-13  67  			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
f8572bb675250e Riana Tauro 2022-10-13  68  		/* HW register value in units of 2.5 millivolt */
f8572bb675250e Riana Tauro 2022-10-13 @69  		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
f8572bb675250e Riana Tauro 2022-10-13  70  		return 0;
f8572bb675250e Riana Tauro 2022-10-13  71  	default:
f8572bb675250e Riana Tauro 2022-10-13  72  		return -EOPNOTSUPP;
f8572bb675250e Riana Tauro 2022-10-13  73  	}
f8572bb675250e Riana Tauro 2022-10-13  74  }
f8572bb675250e Riana Tauro 2022-10-13  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
