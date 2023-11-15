Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8F433C0
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iifPk3g+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700063443; x=1731599443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pH92SFHpeRWXgaIi3R8RQP832EEpEamk3orp/wvJz08=;
  b=iifPk3g+qEkO0MHzyrXcJ0yrPuwFW7itzI4xabzbudvvA2ztZfCQM3L5
   H4Dgq7ZDN7wIuesr0iFwapSY2PfQ0LMvym77hC6XUJ43p1kGwNoBC9PR+
   pBgzSGk6QLKbQJGnrg+kVazAIxWZV12gcxbN4ZkRhn7+rpr/xspRixmgB
   IqrLBJ8y4HAleN40gHHALGfJg5fYTFeL+/zDdqoP3q/lC+WfXpy6lk5pO
   Od2LJcALdWUrIQKnyX2vGAR+KPVFaAzNDagoI2MU8c4Vj8gD540lUo8JW
   CuuE0/3z/R9QMJCdA1x9GBStWsDbNEthDbXcIk07Vmli44QNCWUkq43gM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477119240"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477119240"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908818540"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908818540"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 07:50:41 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3IA3-0000Ui-2U;
	Wed, 15 Nov 2023 15:50:39 +0000
Date: Wed, 15 Nov 2023 23:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/sprd_thermal.c:204:16: sparse: sparse:
 self-comparison always evaluates to true
Message-ID: <202311152303.p8IuapTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/thermal/sprd_thermal.c:204:16: sparse: sparse: self-comparison always evaluates to true"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 2122e2a4efc2cd139474079e11939b6e07adfacd minmax: clamp more efficiently by avoiding extra comparison
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: sh-randconfig-r113-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152303.p8IuapTB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152303.p8IuapTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152303.p8IuapTB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/sprd_thermal.c:204:16: sparse: sparse: self-comparison always evaluates to true

vim +204 drivers/thermal/sprd_thermal.c

554fdbaf19b188 Freeman Liu 2020-02-18  190  
554fdbaf19b188 Freeman Liu 2020-02-18  191  static int sprd_thm_temp_to_rawdata(int temp, struct sprd_thermal_sensor *sen)
554fdbaf19b188 Freeman Liu 2020-02-18  192  {
554fdbaf19b188 Freeman Liu 2020-02-18  193  	u32 val;
554fdbaf19b188 Freeman Liu 2020-02-18  194  
554fdbaf19b188 Freeman Liu 2020-02-18  195  	clamp(temp, (int)SPRD_THM_TEMP_LOW, (int)SPRD_THM_TEMP_HIGH);
554fdbaf19b188 Freeman Liu 2020-02-18  196  
554fdbaf19b188 Freeman Liu 2020-02-18  197  	/*
554fdbaf19b188 Freeman Liu 2020-02-18  198  	 * According to the thermal datasheet, the formula of converting
554fdbaf19b188 Freeman Liu 2020-02-18  199  	 * adc value to the temperature value should be:
554fdbaf19b188 Freeman Liu 2020-02-18  200  	 * T_final = k_cal * x - b_cal.
554fdbaf19b188 Freeman Liu 2020-02-18  201  	 */
554fdbaf19b188 Freeman Liu 2020-02-18  202  	val = (temp + sen->cal_offset) / sen->cal_slope;
554fdbaf19b188 Freeman Liu 2020-02-18  203  
554fdbaf19b188 Freeman Liu 2020-02-18 @204  	return clamp(val, val, (u32)(SPRD_THM_RAW_DATA_HIGH - 1));
554fdbaf19b188 Freeman Liu 2020-02-18  205  }
554fdbaf19b188 Freeman Liu 2020-02-18  206  

:::::: The code at line 204 was first introduced by commit
:::::: 554fdbaf19b188224d52d2fa80c049e4d42002e8 thermal: sprd: Add Spreadtrum thermal driver support

:::::: TO: Freeman Liu <freeman.liu@unisoc.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
