Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED228EF
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678784613; x=1710320613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vhGe7G1WGOOfJWFM/GS1oz0MCw0+Nmcjp7RAmMkfqA=;
  b=blnt0N2ybbxTMfk4BugPQ1M5YvwsER0GIlCGTQbRO7I/BnbnqUnUtTVH
   Ji3+QDllink7v706uQD70uzFPYRDnucVEV6H1D3g3woiE73BUvZaKfNti
   E4mS7jKKA2cNrGUc6mJy9doSQKNzsZJbhRzw4/ApcaujdClI4Jdfk2ULK
   H98+O7YzjbRClxGvNpmsmCpbhIJscecF+bSGF6bzGhhwk9MMbpqZ5HS5i
   3yifdjXUYvAHRu1J0EvCyNxH3+tKo2JnHqEPO+iiGBNyNDdMiAh0uepPn
   uP+RLnlj3Y52EanprvyD4/3L01EyKtxlKVQyk3o6xWppG766mf8qMtHw+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334851189"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="334851189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628974313"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="628974313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 02:03:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc0Z5-0006kO-0I;
	Tue, 14 Mar 2023 09:03:27 +0000
Date: Tue, 14 Mar 2023 17:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter
 'ref_table' can be declared as pointer to const [constParameter]
Message-ID: <202303141639.7guDliPu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter 'ref_table' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Keerthy <j-keerthy@ti.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: ffcb2fc86eb7ebc9f5524525fb57e1cccfbd1fc0 thermal: k3_j72xx_bandgap: Add the bandgap driver support
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ffcb2fc86eb7ebc9f5524525fb57e1cccfbd1fc0
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303141639.7guDliPu-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter 'ref_table' can be declared as pointer to const [constParameter]
         int *ref_table)
              ^
--
>> drivers/thermal/rockchip_thermal.c:665:21: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     writel_relaxed(0U | TSADCV2_AUTO_TSHUT_POLARITY_HIGH,
                       ^
   drivers/thermal/rockchip_thermal.c:739:21: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     writel_relaxed(0U | TSADCV2_AUTO_TSHUT_POLARITY_HIGH,
                       ^
   drivers/thermal/rockchip_thermal.c:766:21: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     writel_relaxed(0U | TSADCV2_AUTO_TSHUT_POLARITY_HIGH,
                       ^

vim +/ref_table +83 drivers/thermal/k3_j72xx_bandgap.c

ffcb2fc86eb7eb Keerthy 2022-05-17   81  
ffcb2fc86eb7eb Keerthy 2022-05-17   82  static void create_table_segments(struct err_values *err_vals, int seg,
ffcb2fc86eb7eb Keerthy 2022-05-17  @83  				  int *ref_table)
ffcb2fc86eb7eb Keerthy 2022-05-17   84  {
ffcb2fc86eb7eb Keerthy 2022-05-17   85  	int m = 0, c, num, den, i, err, idx1, idx2, err1, err2, ref1, ref2;
ffcb2fc86eb7eb Keerthy 2022-05-17   86  
ffcb2fc86eb7eb Keerthy 2022-05-17   87  	if (seg == 0)
ffcb2fc86eb7eb Keerthy 2022-05-17   88  		idx1 = 0;
ffcb2fc86eb7eb Keerthy 2022-05-17   89  	else
ffcb2fc86eb7eb Keerthy 2022-05-17   90  		idx1 = err_vals->refs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   91  
ffcb2fc86eb7eb Keerthy 2022-05-17   92  	idx2 = err_vals->refs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   93  	err1 = err_vals->errs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   94  	err2 = err_vals->errs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   95  	ref1 = err_vals->refs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   96  	ref2 = err_vals->refs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   97  
ffcb2fc86eb7eb Keerthy 2022-05-17   98  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17   99  	 * Calculate the slope with adc values read from the register
ffcb2fc86eb7eb Keerthy 2022-05-17  100  	 * as the y-axis param and err in adc value as x-axis param
ffcb2fc86eb7eb Keerthy 2022-05-17  101  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  102  	num = ref2 - ref1;
ffcb2fc86eb7eb Keerthy 2022-05-17  103  	den = err2 - err1;
ffcb2fc86eb7eb Keerthy 2022-05-17  104  	if (den)
ffcb2fc86eb7eb Keerthy 2022-05-17  105  		m = num / den;
ffcb2fc86eb7eb Keerthy 2022-05-17  106  	c = ref2 - m * err2;
ffcb2fc86eb7eb Keerthy 2022-05-17  107  
ffcb2fc86eb7eb Keerthy 2022-05-17  108  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17  109  	 * Take care of divide by zero error if error values are same
ffcb2fc86eb7eb Keerthy 2022-05-17  110  	 * Or when the slope is 0
ffcb2fc86eb7eb Keerthy 2022-05-17  111  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  112  	if (den != 0 && m != 0) {
ffcb2fc86eb7eb Keerthy 2022-05-17  113  		for (i = idx1; i <= idx2; i++) {
ffcb2fc86eb7eb Keerthy 2022-05-17  114  			err = (i - c) / m;
ffcb2fc86eb7eb Keerthy 2022-05-17  115  			if (((i + err) < 0) || ((i + err) >= TABLE_SIZE))
ffcb2fc86eb7eb Keerthy 2022-05-17  116  				continue;
ffcb2fc86eb7eb Keerthy 2022-05-17  117  			derived_table[i] = ref_table[i + err];
ffcb2fc86eb7eb Keerthy 2022-05-17  118  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  119  	} else { /* Constant error take care of divide by zero */
ffcb2fc86eb7eb Keerthy 2022-05-17  120  		for (i = idx1; i <= idx2; i++) {
ffcb2fc86eb7eb Keerthy 2022-05-17  121  			if (((i + err1) < 0) || ((i + err1) >= TABLE_SIZE))
ffcb2fc86eb7eb Keerthy 2022-05-17  122  				continue;
ffcb2fc86eb7eb Keerthy 2022-05-17  123  			derived_table[i] = ref_table[i + err1];
ffcb2fc86eb7eb Keerthy 2022-05-17  124  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  125  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  126  }
ffcb2fc86eb7eb Keerthy 2022-05-17  127  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
