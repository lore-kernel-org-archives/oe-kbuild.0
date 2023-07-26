Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9466EBE5C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 23:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690415263; x=1721951263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PkTgHQQKG+TlCbd6XICvfcUsd826+QdMsCZs5Tydu9w=;
  b=aURudN2/kOdePNvMPYw0ZzlWNRGicsOB4Uuru/5Ipdi7ehV2mLBepWBN
   xQFoDVYNpZeGi/ZVNKoBYKgBwl//z4vCPY84GtMxt6c0wUNL9wJA4oVH0
   rAvivVcsd8QxhIgpe7D6UPv1Asyq1uFhcwfJHKGcWnqTG0sIKKHThVu6w
   HGTquhBevVdE3K7dCbiCg+40lLBl77RuPzLE+g1FZCo1krc3ouJHSYK2C
   9ieUY7M0gpgGlpZi/ex7+wTKWZOYWR/osEpMojz24a0uttqqcGO1mrHVw
   WkhGT2jqM/qV04NwKnKZxNoQHkkdr0uFEXgYy0MlRFQYZKlVqLEYOrQj0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348439871"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="348439871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 16:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792084725"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="792084725"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 16:47:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOoEF-0001S8-0S;
	Wed, 26 Jul 2023 23:47:39 +0000
Date: Thu, 27 Jul 2023 07:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307270701.pbyoBrgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pwm/pwm-lpss.c:143:21: sparse: sparse: bad integer constant expression"
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
[also build test WARNING on linus/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: um-randconfig-r072-20230725 (https://download.01.org/0day-ci/archive/20230727/202307270701.pbyoBrgu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270701.pbyoBrgu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307270701.pbyoBrgu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-lpss.c:143:21: sparse: sparse: bad integer constant expression
>> drivers/pwm/pwm-lpss.c:143:21: sparse: sparse: static assertion failed: "clamp() low limit (typeof(base_unit))(1) greater than high limit (typeof(base_unit))(base_unit_range - 1)"
--
>> drivers/media/i2c/mt9m111.c:474:21: sparse: sparse: bad integer constant expression
>> drivers/media/i2c/mt9m111.c:474:21: sparse: sparse: static assertion failed: "clamp() low limit 26 greater than high limit 26 + 1280 - (__s32)rect.width"
   drivers/media/i2c/mt9m111.c:477:20: sparse: sparse: bad integer constant expression
>> drivers/media/i2c/mt9m111.c:477:20: sparse: sparse: static assertion failed: "clamp() low limit 8 greater than high limit 8 + 1024 - (__s32)rect.height"
--
>> drivers/spi/spi-stm32.c:482:18: sparse: sparse: bad integer constant expression
>> drivers/spi/spi-stm32.c:482:18: sparse: sparse: static assertion failed: "clamp() low limit 1U greater than high limit spi->fifo_size / 2"
--
>> drivers/spi/spi-ep93xx.c:123:16: sparse: sparse: bad integer constant expression
>> drivers/spi/spi-ep93xx.c:123:16: sparse: sparse: static assertion failed: "clamp() low limit master->min_speed_hz greater than high limit master->max_speed_hz"
--
>> drivers/spi/spi-bcm-qspi.c:687:16: sparse: sparse: bad integer constant expression
>> drivers/spi/spi-bcm-qspi.c:687:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(spbr))(bcm_qspi_spbr_min(qspi)) greater than high limit (typeof(spbr))(255U)"
--
>> drivers/thermal/gov_step_wise.c:48:39: sparse: sparse: bad integer constant expression
>> drivers/thermal/gov_step_wise.c:48:39: sparse: sparse: static assertion failed: "clamp() low limit instance->lower greater than high limit instance->upper"
   drivers/thermal/gov_step_wise.c:58:39: sparse: sparse: bad integer constant expression
   drivers/thermal/gov_step_wise.c:58:39: sparse: sparse: static assertion failed: "clamp() low limit instance->lower greater than high limit instance->upper"
   drivers/thermal/gov_step_wise.c:64:47: sparse: sparse: bad integer constant expression
   drivers/thermal/gov_step_wise.c:64:47: sparse: sparse: static assertion failed: "clamp() low limit instance->lower greater than high limit instance->upper"
--
>> drivers/i2c/busses/i2c-omap.c:619:27: sparse: sparse: bad integer constant expression
>> drivers/i2c/busses/i2c-omap.c:619:27: sparse: sparse: static assertion failed: "clamp() low limit (u8) 1 greater than high limit omap->fifo_size"
--
>> drivers/mtd/nand/raw/mtk_nand.c:1031:13: sparse: sparse: bad integer constant expression
>> drivers/mtd/nand/raw/mtk_nand.c:1031:13: sparse: sparse: static assertion failed: "clamp() low limit start greater than high limit end"
--
>> drivers/thermal/tegra/soctherm.c:451:16: sparse: sparse: bad integer constant expression
>> drivers/thermal/tegra/soctherm.c:451:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(trip_temp))(min_low_temp) greater than high limit (typeof(trip_temp))(max_high_temp)"

vim +143 drivers/pwm/pwm-lpss.c

37670676a122a3 Mika Westerberg 2015-11-18  123  
b14e8ceff03404 Andy Shevchenko 2017-01-28  124  static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm, struct pwm_device *pwm,
d16a5aa9e82163 Mika Westerberg 2014-03-20  125  			     int duty_ns, int period_ns)
d16a5aa9e82163 Mika Westerberg 2014-03-20  126  {
ab248b603960a4 Mika Westerberg 2016-06-10  127  	unsigned long long on_time_div;
d9cd4a73693bc7 Andy Shevchenko 2016-07-04  128  	unsigned long c = lpwm->info->clk_rate, base_unit_range;
883e4d070fe125 qipeng.zha      2015-11-17  129  	unsigned long long base_unit, freq = NSEC_PER_SEC;
d6d54bacb1dd02 Hans de Goede   2020-09-03  130  	u32 ctrl;
d16a5aa9e82163 Mika Westerberg 2014-03-20  131  
d16a5aa9e82163 Mika Westerberg 2014-03-20  132  	do_div(freq, period_ns);
d16a5aa9e82163 Mika Westerberg 2014-03-20  133  
883e4d070fe125 qipeng.zha      2015-11-17  134  	/*
883e4d070fe125 qipeng.zha      2015-11-17  135  	 * The equation is:
e5ca42458b6278 Dan O'Donovan   2016-06-01  136  	 * base_unit = round(base_unit_range * freq / c)
883e4d070fe125 qipeng.zha      2015-11-17  137  	 */
181f4d2f44463f Hans de Goede   2020-09-03  138  	base_unit_range = BIT(lpwm->info->base_unit_bits);
e5ca42458b6278 Dan O'Donovan   2016-06-01  139  	freq *= base_unit_range;
d16a5aa9e82163 Mika Westerberg 2014-03-20  140  
e5ca42458b6278 Dan O'Donovan   2016-06-01  141  	base_unit = DIV_ROUND_CLOSEST_ULL(freq, c);
ef9f60daab3095 Hans de Goede   2020-09-03  142  	/* base_unit must not be 0 and we also want to avoid overflowing it */
ef9f60daab3095 Hans de Goede   2020-09-03 @143  	base_unit = clamp_val(base_unit, 1, base_unit_range - 1);
d16a5aa9e82163 Mika Westerberg 2014-03-20  144  
ab248b603960a4 Mika Westerberg 2016-06-10  145  	on_time_div = 255ULL * duty_ns;
ab248b603960a4 Mika Westerberg 2016-06-10  146  	do_div(on_time_div, period_ns);
ab248b603960a4 Mika Westerberg 2016-06-10  147  	on_time_div = 255ULL - on_time_div;
d16a5aa9e82163 Mika Westerberg 2014-03-20  148  
d6d54bacb1dd02 Hans de Goede   2020-09-03  149  	ctrl = pwm_lpss_read(pwm);
883e4d070fe125 qipeng.zha      2015-11-17  150  	ctrl &= ~PWM_ON_TIME_DIV_MASK;
181f4d2f44463f Hans de Goede   2020-09-03  151  	ctrl &= ~((base_unit_range - 1) << PWM_BASE_UNIT_SHIFT);
883e4d070fe125 qipeng.zha      2015-11-17  152  	ctrl |= (u32) base_unit << PWM_BASE_UNIT_SHIFT;
d16a5aa9e82163 Mika Westerberg 2014-03-20  153  	ctrl |= on_time_div;
2153bbc12f77fb Hans de Goede   2018-10-14  154  
4e11f5acb25b0b Mika Westerberg 2015-10-20  155  	pwm_lpss_write(pwm, ctrl);
2153bbc12f77fb Hans de Goede   2018-10-14  156  	pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
2153bbc12f77fb Hans de Goede   2018-10-14  157  }
d16a5aa9e82163 Mika Westerberg 2014-03-20  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
