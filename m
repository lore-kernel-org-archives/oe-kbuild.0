Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBA43145
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVVA9NpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700089259; x=1731625259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNpIHkRIukcyICjIX52ET0N1ACmAclTbu5Vfv3+2E2g=;
  b=cVVA9NpO9wma+9meaqeRdQNVCjh7Uwst3PVihkPbFtxl+zNWgUBUChsQ
   ir+cs9EKsYjjtzq+RDkqAoyI4RLfVrLcSXiY/zcc7l/D1EL5FEVrEMxvi
   3L8XEhlQmFz8bYuFC1r670ey6z2g3nF7w6traycmXozfbb8rM7A/tOjK8
   qBYWWO42pbdlkMjUO7zWCHb+EHCNJe8yJXltUBtlJQl37LMnWFJElWoOy
   RIRZszHqXg8iDUVkqceBqylVDh1a929LmZMD02PPqy6ijVHHcw34fxu1L
   z4zVmeTgNh79XQykK1/3GBCf4EkJtil+NXMpq79zaJ/pjcuh70/IJYfGg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457468721"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="457468721"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 15:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908916145"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="908916145"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 15:00:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OsR-0000w4-0F;
	Wed, 15 Nov 2023 23:00:55 +0000
Date: Thu, 16 Nov 2023 07:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal
 constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202311160654.fZSfLrc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ccc4e6a061a21d75b96d82fc4b084a8d96df6eb4 clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231116/202311160654.fZSfLrc2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160654.fZSfLrc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160654.fZSfLrc2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/camcc-sm8550.c:49:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +49 drivers/clk/qcom/camcc-sm8550.c

ccc4e6a061a21d Jagadeesh Kona 2023-07-07  47  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  48  static const struct pll_vco lucid_ole_vco[] = {
ccc4e6a061a21d Jagadeesh Kona 2023-07-07 @49  	{ 249600000, 2300000000, 0 },
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  50  };
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
