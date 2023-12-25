Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B3537F1
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Dec 2023 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UI5vEj9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703532533; x=1735068533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NZk34X4w4jNuXvCVP3cc9hugiz/qW4PUjw/uIdMM64=;
  b=UI5vEj9vTJrfr09eXTJkyXVFVird8xLiSVv1b0eAb23CgtQsvo/NXwEr
   y/la7NfCq1L8bgi630hNV8q21tQTVEEQhld3mTKj/JWqdzWP4jejTdBWr
   EIh2irqpSCIE1TUrZPseS1io+hSBVBZ2HQb4wjlC1I33QLEp5mYWymYHB
   t3fdGkkHg+651cpUFzvKZXxKo+RJLj0hTp5SaOdatm/+gpu9l7IsNe4bq
   f24Ed9YHa9apS+EZ4+gO8yOtIIWPYvaxbDuIcDgjMA+4K+NkDq5cwrgNn
   157dtXULBmbDkD5W6ZTPj20hPW3EBMftejLy8nhKBW4eaJwkMax7PJ/pD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="17865619"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="17865619"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 11:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="26119973"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2023 11:28:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHqcb-000DdH-0w;
	Mon, 25 Dec 2023 19:28:33 +0000
Date: Tue, 26 Dec 2023 03:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous
 get_voltage for disabled PWM
Message-ID: <202312260315.7T6URo2z-lkp@intel.com>
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
In-Reply-To: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
References: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Hi Martin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Blumenstingl/regulator-pwm-regulator-Fix-continuous-get_voltage-for-disabled-PWM/20231222-181508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20231221211222.1380658-1-martin.blumenstingl%40googlemail.com
patch subject: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous get_voltage for disabled PWM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-101-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260315.7T6URo2z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312260315.7T6URo2z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/pwm-regulator.c:162:22-23: WARNING opportunity for min()

vim +162 drivers/regulator/pwm-regulator.c

1de7d80246a047 Boris Brezillon     2015-09-21  144  
4773be185a0f7c Lee Jones           2015-07-07  145  static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
4773be185a0f7c Lee Jones           2015-07-07  146  {
4773be185a0f7c Lee Jones           2015-07-07  147  	struct pwm_regulator_data *drvdata = rdev_get_drvdata(rdev);
ea398e28739e25 Boris Brezillon     2016-06-14  148  	unsigned int min_uV_duty = drvdata->continuous.min_uV_dutycycle;
ea398e28739e25 Boris Brezillon     2016-06-14  149  	unsigned int max_uV_duty = drvdata->continuous.max_uV_dutycycle;
ea398e28739e25 Boris Brezillon     2016-06-14  150  	unsigned int duty_unit = drvdata->continuous.dutycycle_unit;
d9070fdbe40a04 Boris Brezillon     2016-06-14  151  	int min_uV = rdev->constraints->min_uV;
ea398e28739e25 Boris Brezillon     2016-06-14  152  	int max_uV = rdev->constraints->max_uV;
ea398e28739e25 Boris Brezillon     2016-06-14  153  	int diff_uV = max_uV - min_uV;
d9070fdbe40a04 Boris Brezillon     2016-06-14  154  	struct pwm_state pstate;
ea398e28739e25 Boris Brezillon     2016-06-14  155  	unsigned int diff_duty;
ea398e28739e25 Boris Brezillon     2016-06-14  156  	unsigned int voltage;
4773be185a0f7c Lee Jones           2015-07-07  157  
d9070fdbe40a04 Boris Brezillon     2016-06-14  158  	pwm_get_state(drvdata->pwm, &pstate);
d9070fdbe40a04 Boris Brezillon     2016-06-14  159  
cfddc54c737afb Martin Blumenstingl 2023-12-21  160  	if (pstate.enabled)
ea398e28739e25 Boris Brezillon     2016-06-14  161  		voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
cfddc54c737afb Martin Blumenstingl 2023-12-21 @162  	else if (max_uV_duty < min_uV_duty)
cfddc54c737afb Martin Blumenstingl 2023-12-21  163  		voltage = max_uV_duty;
cfddc54c737afb Martin Blumenstingl 2023-12-21  164  	else
cfddc54c737afb Martin Blumenstingl 2023-12-21  165  		voltage = min_uV_duty;
ea398e28739e25 Boris Brezillon     2016-06-14  166  
ea398e28739e25 Boris Brezillon     2016-06-14  167  	/*
ea398e28739e25 Boris Brezillon     2016-06-14  168  	 * The dutycycle for min_uV might be greater than the one for max_uV.
ea398e28739e25 Boris Brezillon     2016-06-14  169  	 * This is happening when the user needs an inversed polarity, but the
ea398e28739e25 Boris Brezillon     2016-06-14  170  	 * PWM device does not support inversing it in hardware.
ea398e28739e25 Boris Brezillon     2016-06-14  171  	 */
ea398e28739e25 Boris Brezillon     2016-06-14  172  	if (max_uV_duty < min_uV_duty) {
ea398e28739e25 Boris Brezillon     2016-06-14  173  		voltage = min_uV_duty - voltage;
ea398e28739e25 Boris Brezillon     2016-06-14  174  		diff_duty = min_uV_duty - max_uV_duty;
ea398e28739e25 Boris Brezillon     2016-06-14  175  	} else {
ea398e28739e25 Boris Brezillon     2016-06-14  176  		voltage = voltage - min_uV_duty;
ea398e28739e25 Boris Brezillon     2016-06-14  177  		diff_duty = max_uV_duty - min_uV_duty;
ea398e28739e25 Boris Brezillon     2016-06-14  178  	}
ea398e28739e25 Boris Brezillon     2016-06-14  179  
ea398e28739e25 Boris Brezillon     2016-06-14  180  	voltage = DIV_ROUND_CLOSEST_ULL((u64)voltage * diff_uV, diff_duty);
ea398e28739e25 Boris Brezillon     2016-06-14  181  
ea398e28739e25 Boris Brezillon     2016-06-14  182  	return voltage + min_uV;
4773be185a0f7c Lee Jones           2015-07-07  183  }
4773be185a0f7c Lee Jones           2015-07-07  184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
