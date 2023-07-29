Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282738C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 03:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690602896; x=1722138896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPYaUl0Pf8tMnZweYk3XsjrRGZBoJO2tEW3uOmdg2o8=;
  b=Rf3TpWH0Udr+s89FfcQJUmWWKJr+FQ3PUf/MrvkApWv+3CZRTfzNWAJw
   6fYvnMxj9DwepD33lYHAz9SBzXxdxw6/eDV7AI76xDwxWbx7X/AORzOl6
   7CixLJWM4vFog9hcwqB3SU/oY4/SvwXIGkUV+BCHtYGR1NpiqSqeOJo70
   rDENVmCh0WDKLk4l0NJo1/pSPHOqwzyBF5Xlx5WXlcDcWPF7/GRCqrw/f
   yCca9lIOFVKyV6X8u58p3EIq/sTdXJL6thXOkLEqviRewrx2ztH1b+uDc
   myYc6uQhOOh+Mdde+FVFFnkK6otrY3uwM+ATVQDUJ0lsYhY/yVcnYPjzf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="435017930"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="435017930"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 20:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="762783454"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="762783454"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 20:54:53 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPb2a-0003oF-0L;
	Sat, 29 Jul 2023 03:54:52 +0000
Date: Sat, 29 Jul 2023 11:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307291147.WJTQQTUk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/thermal/sprd_thermal.c:204:16: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: parisc-randconfig-r083-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291147.WJTQQTUk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291147.WJTQQTUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307291147.WJTQQTUk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/sprd_thermal.c:204:16: sparse: sparse: bad integer constant expression
>> drivers/thermal/sprd_thermal.c:204:16: sparse: sparse: static assertion failed: "clamp() low limit val greater than high limit (u32)(1000 - 1)"
--
>> drivers/media/dvb-frontends/rtl2832_sdr.c:1087:30: sparse: sparse: bad integer constant expression
>> drivers/media/dvb-frontends/rtl2832_sdr.c:1087:30: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(bands_adc[band].rangelow) greater than high limit (unsigned int)(bands_adc[band].rangehigh)"
   drivers/media/dvb-frontends/rtl2832_sdr.c:1097:32: sparse: sparse: bad integer constant expression
>> drivers/media/dvb-frontends/rtl2832_sdr.c:1097:32: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(bands_fm[0].rangelow) greater than high limit (unsigned int)(bands_fm[0].rangehigh)"
   drivers/media/dvb-frontends/rtl2832_sdr.c:1266:31: sparse: sparse: bad integer constant expression
>> drivers/media/dvb-frontends/rtl2832_sdr.c:1266:31: sparse: sparse: static assertion failed: "clamp() low limit (s32)(dev->bandwidth->minimum) greater than high limit (s32)(dev->bandwidth->maximum)"

vim +204 drivers/thermal/sprd_thermal.c

554fdbaf19b1882 Freeman Liu 2020-02-18  190  
554fdbaf19b1882 Freeman Liu 2020-02-18  191  static int sprd_thm_temp_to_rawdata(int temp, struct sprd_thermal_sensor *sen)
554fdbaf19b1882 Freeman Liu 2020-02-18  192  {
554fdbaf19b1882 Freeman Liu 2020-02-18  193  	u32 val;
554fdbaf19b1882 Freeman Liu 2020-02-18  194  
554fdbaf19b1882 Freeman Liu 2020-02-18  195  	clamp(temp, (int)SPRD_THM_TEMP_LOW, (int)SPRD_THM_TEMP_HIGH);
554fdbaf19b1882 Freeman Liu 2020-02-18  196  
554fdbaf19b1882 Freeman Liu 2020-02-18  197  	/*
554fdbaf19b1882 Freeman Liu 2020-02-18  198  	 * According to the thermal datasheet, the formula of converting
554fdbaf19b1882 Freeman Liu 2020-02-18  199  	 * adc value to the temperature value should be:
554fdbaf19b1882 Freeman Liu 2020-02-18  200  	 * T_final = k_cal * x - b_cal.
554fdbaf19b1882 Freeman Liu 2020-02-18  201  	 */
554fdbaf19b1882 Freeman Liu 2020-02-18  202  	val = (temp + sen->cal_offset) / sen->cal_slope;
554fdbaf19b1882 Freeman Liu 2020-02-18  203  
554fdbaf19b1882 Freeman Liu 2020-02-18 @204  	return clamp(val, val, (u32)(SPRD_THM_RAW_DATA_HIGH - 1));
554fdbaf19b1882 Freeman Liu 2020-02-18  205  }
554fdbaf19b1882 Freeman Liu 2020-02-18  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
