Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ACA7C
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Nov 2022 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667306873; x=1698842873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOjSAlc2V2rQ6zjmoHEPylc0NV1DyS6mjsI3pm8wtbc=;
  b=kWPQazYfXJcMygygo9vzrJjMDHK+oZ6x/Cc/pbu7umeNq2YTI3w87jBO
   1OquNhqpAhbzlQ/2D++Q5laqKRmjkJrJOupCF8i3Z1hjez2GzOJ8nA/y9
   vGG3ROXA7Hk9aPI3hTw/bWttkf820zzhQzT0CMBX/UyCpk63nWw1p4eun
   Vb6hsaOcUhSVfy1oV7/E4SwLMmF9O1PHh8NDsAB6kf3ui0UXfYhm546Sd
   0xd9aJRIcfWpTxdv8uISP4JYFvkn1FDiOFqtpxG9OBHhW1IfrADpxJtPo
   eMyzptZJbq5W3d65mQgoD1ddFjlMDtrB6/cdAKbIi2WD/td4IYSS7AUYp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="309123806"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; 
   d="scan'208";a="309123806"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 05:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="697386549"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; 
   d="scan'208";a="697386549"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 01 Nov 2022 05:47:51 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opqgJ-000Dci-0W;
	Tue, 01 Nov 2022 12:47:51 +0000
Date: Tue, 1 Nov 2022 20:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thunderbolt/tmu.c:17:6: warning: Variable 'freq_meas_wind'
 can be declared as const array [constVariable]
Message-ID: <202211012037.38bqjbwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thunderbolt/tmu.c:17:6: warning: Variable 'freq_meas_wind' can be declared as const array [constVariable]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gil Fine <gil.fine@intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5aaef24b5c6d4246b2cac1be949869fa36577737
commit: b017a46d486cd4113b1856f3fd611f54cd0f9c03 thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b017a46d486cd4113b1856f3fd611f54cd0f9c03
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thunderbolt/tmu.c:17:6: warning: Variable 'freq_meas_wind' can be declared as const array [constVariable]
    u32 freq_meas_wind[2] = { 30, 800 };
        ^
>> drivers/thunderbolt/tmu.c:18:6: warning: Variable 'avg_const' can be declared as const array [constVariable]
    u32 avg_const[2] = { 4, 8 };
        ^

vim +/freq_meas_wind +17 drivers/thunderbolt/tmu.c

cf29b9afb12149 Rajmohan Mani 2019-12-17  13  
b017a46d486cd4 Gil Fine      2022-05-26  14  static int tb_switch_set_tmu_mode_params(struct tb_switch *sw,
b017a46d486cd4 Gil Fine      2022-05-26  15  					 enum tb_switch_tmu_rate rate)
b017a46d486cd4 Gil Fine      2022-05-26  16  {
b017a46d486cd4 Gil Fine      2022-05-26 @17  	u32 freq_meas_wind[2] = { 30, 800 };
b017a46d486cd4 Gil Fine      2022-05-26 @18  	u32 avg_const[2] = { 4, 8 };
b017a46d486cd4 Gil Fine      2022-05-26  19  	u32 freq, avg, val;
b017a46d486cd4 Gil Fine      2022-05-26  20  	int ret;
b017a46d486cd4 Gil Fine      2022-05-26  21  
b017a46d486cd4 Gil Fine      2022-05-26  22  	if (rate == TB_SWITCH_TMU_RATE_NORMAL) {
b017a46d486cd4 Gil Fine      2022-05-26  23  		freq = freq_meas_wind[0];
b017a46d486cd4 Gil Fine      2022-05-26  24  		avg = avg_const[0];
b017a46d486cd4 Gil Fine      2022-05-26  25  	} else if (rate == TB_SWITCH_TMU_RATE_HIFI) {
b017a46d486cd4 Gil Fine      2022-05-26  26  		freq = freq_meas_wind[1];
b017a46d486cd4 Gil Fine      2022-05-26  27  		avg = avg_const[1];
b017a46d486cd4 Gil Fine      2022-05-26  28  	} else {
b017a46d486cd4 Gil Fine      2022-05-26  29  		return 0;
b017a46d486cd4 Gil Fine      2022-05-26  30  	}
b017a46d486cd4 Gil Fine      2022-05-26  31  
b017a46d486cd4 Gil Fine      2022-05-26  32  	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
b017a46d486cd4 Gil Fine      2022-05-26  33  			 sw->tmu.cap + TMU_RTR_CS_0, 1);
b017a46d486cd4 Gil Fine      2022-05-26  34  	if (ret)
b017a46d486cd4 Gil Fine      2022-05-26  35  		return ret;
b017a46d486cd4 Gil Fine      2022-05-26  36  
b017a46d486cd4 Gil Fine      2022-05-26  37  	val &= ~TMU_RTR_CS_0_FREQ_WIND_MASK;
b017a46d486cd4 Gil Fine      2022-05-26  38  	val |= FIELD_PREP(TMU_RTR_CS_0_FREQ_WIND_MASK, freq);
b017a46d486cd4 Gil Fine      2022-05-26  39  
b017a46d486cd4 Gil Fine      2022-05-26  40  	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
b017a46d486cd4 Gil Fine      2022-05-26  41  			  sw->tmu.cap + TMU_RTR_CS_0, 1);
b017a46d486cd4 Gil Fine      2022-05-26  42  	if (ret)
b017a46d486cd4 Gil Fine      2022-05-26  43  		return ret;
b017a46d486cd4 Gil Fine      2022-05-26  44  
b017a46d486cd4 Gil Fine      2022-05-26  45  	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
b017a46d486cd4 Gil Fine      2022-05-26  46  			 sw->tmu.cap + TMU_RTR_CS_15, 1);
b017a46d486cd4 Gil Fine      2022-05-26  47  	if (ret)
b017a46d486cd4 Gil Fine      2022-05-26  48  		return ret;
b017a46d486cd4 Gil Fine      2022-05-26  49  
b017a46d486cd4 Gil Fine      2022-05-26  50  	val &= ~TMU_RTR_CS_15_FREQ_AVG_MASK &
b017a46d486cd4 Gil Fine      2022-05-26  51  		~TMU_RTR_CS_15_DELAY_AVG_MASK &
b017a46d486cd4 Gil Fine      2022-05-26  52  		~TMU_RTR_CS_15_OFFSET_AVG_MASK &
b017a46d486cd4 Gil Fine      2022-05-26  53  		~TMU_RTR_CS_15_ERROR_AVG_MASK;
b017a46d486cd4 Gil Fine      2022-05-26  54  	val |=  FIELD_PREP(TMU_RTR_CS_15_FREQ_AVG_MASK, avg) |
b017a46d486cd4 Gil Fine      2022-05-26  55  		FIELD_PREP(TMU_RTR_CS_15_DELAY_AVG_MASK, avg) |
b017a46d486cd4 Gil Fine      2022-05-26  56  		FIELD_PREP(TMU_RTR_CS_15_OFFSET_AVG_MASK, avg) |
b017a46d486cd4 Gil Fine      2022-05-26  57  		FIELD_PREP(TMU_RTR_CS_15_ERROR_AVG_MASK, avg);
b017a46d486cd4 Gil Fine      2022-05-26  58  
b017a46d486cd4 Gil Fine      2022-05-26  59  	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
b017a46d486cd4 Gil Fine      2022-05-26  60  			   sw->tmu.cap + TMU_RTR_CS_15, 1);
b017a46d486cd4 Gil Fine      2022-05-26  61  }
b017a46d486cd4 Gil Fine      2022-05-26  62  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
