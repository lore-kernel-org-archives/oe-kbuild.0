Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D37EAD2F
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690361351; x=1721897351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZV/61G3RjYXQFciBStahbxnbfEwe/zDFzGeOw4UjyY0=;
  b=cV+S5dlD10joDlPE/svGekwrByYECfiNlH3b6kEHqbxynLl6qYJTMqS+
   NtJeJqnjyoggpN+moqdTCGaRxVFqNFb+CZBc4uQQQz+lRjm4wlh5sxNE6
   AKCRYLlO8Os3UYyRM/lfIvY8LcYU3OMDoEMMC1F8MYnfFWBr1ACw8Wki4
   GVXK6kyrQF3kXIfWHjgktCLJAIw4wucauNYmEDYMIvCOEL+lp0N3KZDv1
   QH7903RbQmFkDGG06QlVYQ8cHEomwru+LH7lj5vCTyWootU+N0EsiN35Z
   t39b5Q8o/rWNw8f3sePf/SARO+uEHLwDXlcfgzs7fmyipzq93OLO6+6Wg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371566859"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371566859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796497310"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="796497310"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 01:48:54 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOaBd-0000pR-1I;
	Wed, 26 Jul 2023 08:48:13 +0000
Date: Wed, 26 Jul 2023 16:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261635.7nht2dxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: block/blk-iocost.c:983:17: sparse: sparse: bad integer constant expression"
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
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: um-randconfig-r073-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261635.7nht2dxS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261635.7nht2dxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261635.7nht2dxS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-iocost.c:983:17: sparse: sparse: bad integer constant expression
>> block/blk-iocost.c:983:17: sparse: sparse: static assertion failed: "clamp() low limit vcomp_min greater than high limit vcomp_max"
   block/blk-iocost.c:990:26: sparse: sparse: bad integer constant expression
>> block/blk-iocost.c:990:26: sparse: sparse: static assertion failed: "clamp() low limit -vperiod greater than high limit vperiod"
   block/blk-iocost.c:1030:25: sparse: sparse: bad integer constant expression
>> block/blk-iocost.c:1030:25: sparse: sparse: static assertion failed: "clamp() low limit vrate_min greater than high limit vrate_max"
   block/blk-iocost.c:1101:25: sparse: sparse: bad integer constant expression
>> block/blk-iocost.c:1101:25: sparse: sparse: static assertion failed: "clamp() low limit (u32)(1) greater than high limit (u32)(active)"
   block/blk-iocost.c:1778:16: sparse: sparse: bad integer constant expression
>> block/blk-iocost.c:1778:16: sparse: sparse: static assertion failed: "clamp() low limit (s64)(1) greater than high limit (s64)(hwm)"
--
>> fs/xfs/xfs_dquot.c:109:16: sparse: sparse: bad integer constant expression
>> fs/xfs/xfs_dquot.c:109:16: sparse: sparse: static assertion failed: "clamp() low limit (time64_t)(qi->qi_expiry_min) greater than high limit (time64_t)(qi->qi_expiry_max)"
--
>> drivers/clk/clk-apple-nco.c:221:16: sparse: sparse: bad integer constant expression
>> drivers/clk/clk-apple-nco.c:221:16: sparse: sparse: static assertion failed: "clamp() low limit lo greater than high limit hi"
--
>> drivers/devfreq/mtk-cci-devfreq.c:65:21: sparse: sparse: bad integer constant expression
>> drivers/devfreq/mtk-cci-devfreq.c:65:21: sparse: sparse: static assertion failed: "clamp() low limit soc_data->sram_min_volt greater than high limit soc_data->sram_max_volt"
   drivers/devfreq/mtk-cci-devfreq.c:70:33: sparse: sparse: bad integer constant expression
>> drivers/devfreq/mtk-cci-devfreq.c:70:33: sparse: sparse: static assertion failed: "clamp() low limit soc_data->sram_min_volt greater than high limit new_vsram"
--
>> drivers/hid/hid-input.c:1565:25: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-input.c:1565:25: sparse: sparse: static assertion failed: "clamp() low limit field->logical_minimum greater than high limit field->logical_maximum"
--
>> drivers/hwmon/w83781d.c:185:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/w83781d.c:185:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(1) greater than high limit (typeof(val))(((type == w83781d || type == as99127f) ? 8 : 128))"
--
>> drivers/hwmon/adt7475.c:487:23: sparse: sparse: bad integer constant expression
>> drivers/hwmon/adt7475.c:487:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(temp - 15000) greater than high limit (typeof(val))(temp)"
   drivers/hwmon/adt7475.c:678:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/adt7475.c:678:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(temp + autorange_table[0]) greater than high limit (typeof(val))(temp + autorange_table[(sizeof(autorange_table) / sizeof((autorange_table)[0]) + (0)) - 1])"
--
>> drivers/hwmon/lm95234.c:304:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/lm95234.c:304:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(0) greater than high limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(index ? 255 : 127)"
--
>> drivers/hwmon/lm90.c:1368:23: sparse: sparse: bad integer constant expression
>> drivers/hwmon/lm90.c:1368:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(-64000) greater than high limit (typeof(val))(191000 + fraction)"
   drivers/hwmon/lm90.c:1371:23: sparse: sparse: bad integer constant expression
>> drivers/hwmon/lm90.c:1371:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(255000 + fraction)"
   drivers/hwmon/lm90.c:1373:23: sparse: sparse: bad integer constant expression
   drivers/hwmon/lm90.c:1373:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(127000 + fraction)"
   drivers/hwmon/lm90.c:1375:23: sparse: sparse: bad integer constant expression
   drivers/hwmon/lm90.c:1375:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(-128000) greater than high limit (typeof(val))(127000 + fraction)"
--
>> drivers/hwmon/nct7802.c:341:19: sparse: sparse: bad integer constant expression
>> drivers/hwmon/nct7802.c:341:19: sparse: sparse: static assertion failed: "clamp() low limit (typeof(voltage))(0) greater than high limit (typeof(voltage))(0x3ff * nct7802_vmul[nr])"
--
>> drivers/hwmon/stts751.c:488:16: sparse: sparse: bad integer constant expression
>> drivers/hwmon/stts751.c:488:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(temp))(-64000) greater than high limit (typeof(temp))(priv->therm)"
   drivers/hwmon/stts751.c:535:16: sparse: sparse: bad integer constant expression
>> drivers/hwmon/stts751.c:535:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(temp))(priv->event_min) greater than high limit (typeof(temp))(127937)"
   drivers/hwmon/stts751.c:569:16: sparse: sparse: bad integer constant expression
>> drivers/hwmon/stts751.c:569:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(temp))(-64000) greater than high limit (typeof(temp))(priv->event_max)"
--
>> drivers/hwmon/amc6821.c:518:28: sparse: sparse: bad integer constant expression
>> drivers/hwmon/amc6821.c:518:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val / 1000))(0) greater than high limit (typeof(val / 1000))(data->temp1_auto_point_temp[1])"
   drivers/hwmon/amc6821.c:520:28: sparse: sparse: bad integer constant expression
>> drivers/hwmon/amc6821.c:520:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(ptemp[0]))(0) greater than high limit (typeof(ptemp[0]))(data->temp2_auto_point_temp[1])"
   drivers/hwmon/amc6821.c:533:28: sparse: sparse: bad integer constant expression
>> drivers/hwmon/amc6821.c:533:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val / 1000))((ptemp[0] & 0x7C) + 4) greater than high limit (typeof(val / 1000))(124)"
   drivers/hwmon/amc6821.c:535:28: sparse: sparse: bad integer constant expression
>> drivers/hwmon/amc6821.c:535:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(ptemp[2]))(ptemp[1] + 1) greater than high limit (typeof(ptemp[2]))(255)"
   drivers/hwmon/amc6821.c:538:28: sparse: sparse: bad integer constant expression
>> drivers/hwmon/amc6821.c:538:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val / 1000))(ptemp[1]+1) greater than high limit (typeof(val / 1000))(255)"
--
>> drivers/hwmon/nct6775-core.c:2506:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/nct6775-core.c:2506:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(minval[index]) greater than high limit (typeof(val))(maxval[index])"
   drivers/hwmon/nct6775-core.c:2821:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/nct6775-core.c:2821:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(0) greater than high limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(data->target_temp_mask)"
   drivers/hwmon/nct6775-core.c:2902:15: sparse: sparse: bad integer constant expression
   drivers/hwmon/nct6775-core.c:2902:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(0) greater than high limit (typeof(( { typeof(val) __x = val; typeof(1000) __d = 1000; (((typeof(val))-1) > 0 || ((typeof(1000))-1) > 0 || (((__x) > 0) == ((__d) > 0))) ? (((__x) + ((__d) / 2)) / (__d)) : (((__x) - ((__d) / 2)) / (__d)); } )))(data->tolerance_mask)"
   drivers/hwmon/nct6775-core.c:2979:15: sparse: sparse: bad integer constant expression
>> drivers/hwmon/nct6775-core.c:2979:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(data->speed_tolerance_limit)"
--
>> drivers/input/mousedev.c:182:25: sparse: sparse: bad integer constant expression
>> drivers/input/mousedev.c:182:25: sparse: sparse: static assertion failed: "clamp() low limit min greater than high limit max"
   drivers/input/mousedev.c:196:25: sparse: sparse: bad integer constant expression
   drivers/input/mousedev.c:196:25: sparse: sparse: static assertion failed: "clamp() low limit min greater than high limit max"
   drivers/input/mousedev.c:292:33: sparse: sparse: bad integer constant expression
>> drivers/input/mousedev.c:292:33: sparse: sparse: static assertion failed: "clamp() low limit (typeof(client->pos_x))(0) greater than high limit (typeof(client->pos_x))(xres)"
   drivers/input/mousedev.c:295:33: sparse: sparse: bad integer constant expression
>> drivers/input/mousedev.c:295:33: sparse: sparse: static assertion failed: "clamp() low limit (typeof(client->pos_y))(0) greater than high limit (typeof(client->pos_y))(yres)"
--
   drivers/gpu/ipu-v3/ipu-image-convert.c: note: in included file (through include/video/imx-ipu-v3.h, include/video/imx-ipu-image-convert.h):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/gpu/ipu-v3/ipu-image-convert.c:1955:13: sparse: sparse: bad integer constant expression
>> drivers/gpu/ipu-v3/ipu-image-convert.c:1955:13: sparse: sparse: static assertion failed: "clamp() low limit (min + ~mask) & mask greater than high limit max & mask"
--
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1992:15: sparse: sparse: bad integer constant expression
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1992:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(1) greater than high limit (typeof(val))(hw->settings->fifo_ops.max_size)"
--
>> drivers/clk/bcm/clk-raspberrypi.c:234:21: sparse: sparse: bad integer constant expression
>> drivers/clk/bcm/clk-raspberrypi.c:234:21: sparse: sparse: static assertion failed: "clamp() low limit req->min_rate greater than high limit req->max_rate"
--
>> drivers/clk/bcm/clk-bcm2835.c:580:16: sparse: sparse: bad integer constant expression
>> drivers/clk/bcm/clk-bcm2835.c:580:16: sparse: sparse: static assertion failed: "clamp() low limit data->min_rate greater than high limit data->max_rate"
--
>> drivers/clk/ingenic/cgu.c:480:15: sparse: sparse: bad integer constant expression
>> drivers/clk/ingenic/cgu.c:480:15: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(clk_info->div.div) greater than high limit (unsigned int)(clk_info->div.div << clk_info->div.bits)"
--
>> drivers/clk/starfive/clk-starfive-jh71x0.c:81:30: sparse: sparse: bad integer constant expression
>> drivers/clk/starfive/clk-starfive-jh71x0.c:81:30: sparse: sparse: static assertion failed: "clamp() low limit req->min_rate greater than high limit req->max_rate"
   drivers/clk/starfive/clk-starfive-jh71x0.c:110:29: sparse: sparse: bad integer constant expression
>> drivers/clk/starfive/clk-starfive-jh71x0.c:110:29: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit (unsigned long)clk->max_div"
   drivers/clk/starfive/clk-starfive-jh71x0.c:132:30: sparse: sparse: bad integer constant expression
   drivers/clk/starfive/clk-starfive-jh71x0.c:132:30: sparse: sparse: static assertion failed: "clamp() low limit req->min_rate greater than high limit req->max_rate"

vim +983 block/blk-iocost.c

e33b93650fc5364 Breno Leitao 2023-02-28   955  
ac33e91e2daca40 Tejun Heo    2020-09-01   956  /*
ac33e91e2daca40 Tejun Heo    2020-09-01   957   * When an iocg accumulates too much vtime or gets deactivated, we throw away
ac33e91e2daca40 Tejun Heo    2020-09-01   958   * some vtime, which lowers the overall device utilization. As the exact amount
ac33e91e2daca40 Tejun Heo    2020-09-01   959   * which is being thrown away is known, we can compensate by accelerating the
ac33e91e2daca40 Tejun Heo    2020-09-01   960   * vrate accordingly so that the extra vtime generated in the current period
ac33e91e2daca40 Tejun Heo    2020-09-01   961   * matches what got lost.
ac33e91e2daca40 Tejun Heo    2020-09-01   962   */
ac33e91e2daca40 Tejun Heo    2020-09-01   963  static void ioc_refresh_vrate(struct ioc *ioc, struct ioc_now *now)
ac33e91e2daca40 Tejun Heo    2020-09-01   964  {
ac33e91e2daca40 Tejun Heo    2020-09-01   965  	s64 pleft = ioc->period_at + ioc->period_us - now->now;
ac33e91e2daca40 Tejun Heo    2020-09-01   966  	s64 vperiod = ioc->period_us * ioc->vtime_base_rate;
ac33e91e2daca40 Tejun Heo    2020-09-01   967  	s64 vcomp, vcomp_min, vcomp_max;
ac33e91e2daca40 Tejun Heo    2020-09-01   968  
ac33e91e2daca40 Tejun Heo    2020-09-01   969  	lockdep_assert_held(&ioc->lock);
ac33e91e2daca40 Tejun Heo    2020-09-01   970  
ac33e91e2daca40 Tejun Heo    2020-09-01   971  	/* we need some time left in this period */
ac33e91e2daca40 Tejun Heo    2020-09-01   972  	if (pleft <= 0)
ac33e91e2daca40 Tejun Heo    2020-09-01   973  		goto done;
ac33e91e2daca40 Tejun Heo    2020-09-01   974  
ac33e91e2daca40 Tejun Heo    2020-09-01   975  	/*
ac33e91e2daca40 Tejun Heo    2020-09-01   976  	 * Calculate how much vrate should be adjusted to offset the error.
ac33e91e2daca40 Tejun Heo    2020-09-01   977  	 * Limit the amount of adjustment and deduct the adjusted amount from
ac33e91e2daca40 Tejun Heo    2020-09-01   978  	 * the error.
ac33e91e2daca40 Tejun Heo    2020-09-01   979  	 */
ac33e91e2daca40 Tejun Heo    2020-09-01   980  	vcomp = -div64_s64(ioc->vtime_err, pleft);
ac33e91e2daca40 Tejun Heo    2020-09-01   981  	vcomp_min = -(ioc->vtime_base_rate >> 1);
ac33e91e2daca40 Tejun Heo    2020-09-01   982  	vcomp_max = ioc->vtime_base_rate;
ac33e91e2daca40 Tejun Heo    2020-09-01  @983  	vcomp = clamp(vcomp, vcomp_min, vcomp_max);
ac33e91e2daca40 Tejun Heo    2020-09-01   984  
ac33e91e2daca40 Tejun Heo    2020-09-01   985  	ioc->vtime_err += vcomp * pleft;
ac33e91e2daca40 Tejun Heo    2020-09-01   986  
ac33e91e2daca40 Tejun Heo    2020-09-01   987  	atomic64_set(&ioc->vtime_rate, ioc->vtime_base_rate + vcomp);
ac33e91e2daca40 Tejun Heo    2020-09-01   988  done:
ac33e91e2daca40 Tejun Heo    2020-09-01   989  	/* bound how much error can accumulate */
ac33e91e2daca40 Tejun Heo    2020-09-01  @990  	ioc->vtime_err = clamp(ioc->vtime_err, -vperiod, vperiod);
ac33e91e2daca40 Tejun Heo    2020-09-01   991  }
ac33e91e2daca40 Tejun Heo    2020-09-01   992  
926f75f6a9ef503 Baolin Wang  2020-11-26   993  static void ioc_adjust_base_vrate(struct ioc *ioc, u32 rq_wait_pct,
926f75f6a9ef503 Baolin Wang  2020-11-26   994  				  int nr_lagging, int nr_shortages,
926f75f6a9ef503 Baolin Wang  2020-11-26   995  				  int prev_busy_level, u32 *missed_ppm)
926f75f6a9ef503 Baolin Wang  2020-11-26   996  {
926f75f6a9ef503 Baolin Wang  2020-11-26   997  	u64 vrate = ioc->vtime_base_rate;
926f75f6a9ef503 Baolin Wang  2020-11-26   998  	u64 vrate_min = ioc->vrate_min, vrate_max = ioc->vrate_max;
926f75f6a9ef503 Baolin Wang  2020-11-26   999  
926f75f6a9ef503 Baolin Wang  2020-11-26  1000  	if (!ioc->busy_level || (ioc->busy_level < 0 && nr_lagging)) {
926f75f6a9ef503 Baolin Wang  2020-11-26  1001  		if (ioc->busy_level != prev_busy_level || nr_lagging)
63c9eac4b6d7585 Kemeng Shi   2022-10-18  1002  			trace_iocost_ioc_vrate_adj(ioc, vrate,
926f75f6a9ef503 Baolin Wang  2020-11-26  1003  						   missed_ppm, rq_wait_pct,
926f75f6a9ef503 Baolin Wang  2020-11-26  1004  						   nr_lagging, nr_shortages);
926f75f6a9ef503 Baolin Wang  2020-11-26  1005  
926f75f6a9ef503 Baolin Wang  2020-11-26  1006  		return;
926f75f6a9ef503 Baolin Wang  2020-11-26  1007  	}
926f75f6a9ef503 Baolin Wang  2020-11-26  1008  
926f75f6a9ef503 Baolin Wang  2020-11-26  1009  	/*
926f75f6a9ef503 Baolin Wang  2020-11-26  1010  	 * If vrate is out of bounds, apply clamp gradually as the
926f75f6a9ef503 Baolin Wang  2020-11-26  1011  	 * bounds can change abruptly.  Otherwise, apply busy_level
926f75f6a9ef503 Baolin Wang  2020-11-26  1012  	 * based adjustment.
926f75f6a9ef503 Baolin Wang  2020-11-26  1013  	 */
926f75f6a9ef503 Baolin Wang  2020-11-26  1014  	if (vrate < vrate_min) {
926f75f6a9ef503 Baolin Wang  2020-11-26  1015  		vrate = div64_u64(vrate * (100 + VRATE_CLAMP_ADJ_PCT), 100);
926f75f6a9ef503 Baolin Wang  2020-11-26  1016  		vrate = min(vrate, vrate_min);
926f75f6a9ef503 Baolin Wang  2020-11-26  1017  	} else if (vrate > vrate_max) {
926f75f6a9ef503 Baolin Wang  2020-11-26  1018  		vrate = div64_u64(vrate * (100 - VRATE_CLAMP_ADJ_PCT), 100);
926f75f6a9ef503 Baolin Wang  2020-11-26  1019  		vrate = max(vrate, vrate_max);
926f75f6a9ef503 Baolin Wang  2020-11-26  1020  	} else {
926f75f6a9ef503 Baolin Wang  2020-11-26  1021  		int idx = min_t(int, abs(ioc->busy_level),
926f75f6a9ef503 Baolin Wang  2020-11-26  1022  				ARRAY_SIZE(vrate_adj_pct) - 1);
926f75f6a9ef503 Baolin Wang  2020-11-26  1023  		u32 adj_pct = vrate_adj_pct[idx];
926f75f6a9ef503 Baolin Wang  2020-11-26  1024  
926f75f6a9ef503 Baolin Wang  2020-11-26  1025  		if (ioc->busy_level > 0)
926f75f6a9ef503 Baolin Wang  2020-11-26  1026  			adj_pct = 100 - adj_pct;
926f75f6a9ef503 Baolin Wang  2020-11-26  1027  		else
926f75f6a9ef503 Baolin Wang  2020-11-26  1028  			adj_pct = 100 + adj_pct;
926f75f6a9ef503 Baolin Wang  2020-11-26  1029  
926f75f6a9ef503 Baolin Wang  2020-11-26 @1030  		vrate = clamp(DIV64_U64_ROUND_UP(vrate * adj_pct, 100),
926f75f6a9ef503 Baolin Wang  2020-11-26  1031  			      vrate_min, vrate_max);
926f75f6a9ef503 Baolin Wang  2020-11-26  1032  	}
926f75f6a9ef503 Baolin Wang  2020-11-26  1033  
926f75f6a9ef503 Baolin Wang  2020-11-26  1034  	trace_iocost_ioc_vrate_adj(ioc, vrate, missed_ppm, rq_wait_pct,
926f75f6a9ef503 Baolin Wang  2020-11-26  1035  				   nr_lagging, nr_shortages);
926f75f6a9ef503 Baolin Wang  2020-11-26  1036  
926f75f6a9ef503 Baolin Wang  2020-11-26  1037  	ioc->vtime_base_rate = vrate;
926f75f6a9ef503 Baolin Wang  2020-11-26  1038  	ioc_refresh_margins(ioc);
926f75f6a9ef503 Baolin Wang  2020-11-26  1039  }
926f75f6a9ef503 Baolin Wang  2020-11-26  1040  
7caa47151ab2e64 Tejun Heo    2019-08-28  1041  /* take a snapshot of the current [v]time and vrate */
7caa47151ab2e64 Tejun Heo    2019-08-28  1042  static void ioc_now(struct ioc *ioc, struct ioc_now *now)
7caa47151ab2e64 Tejun Heo    2019-08-28  1043  {
7caa47151ab2e64 Tejun Heo    2019-08-28  1044  	unsigned seq;
6c31be320c52bad Kemeng Shi   2022-10-18  1045  	u64 vrate;
7caa47151ab2e64 Tejun Heo    2019-08-28  1046  
7caa47151ab2e64 Tejun Heo    2019-08-28  1047  	now->now_ns = ktime_get();
7caa47151ab2e64 Tejun Heo    2019-08-28  1048  	now->now = ktime_to_us(now->now_ns);
6c31be320c52bad Kemeng Shi   2022-10-18  1049  	vrate = atomic64_read(&ioc->vtime_rate);
7caa47151ab2e64 Tejun Heo    2019-08-28  1050  
7caa47151ab2e64 Tejun Heo    2019-08-28  1051  	/*
7caa47151ab2e64 Tejun Heo    2019-08-28  1052  	 * The current vtime is
7caa47151ab2e64 Tejun Heo    2019-08-28  1053  	 *
7caa47151ab2e64 Tejun Heo    2019-08-28  1054  	 *   vtime at period start + (wallclock time since the start) * vrate
7caa47151ab2e64 Tejun Heo    2019-08-28  1055  	 *
7caa47151ab2e64 Tejun Heo    2019-08-28  1056  	 * As a consistent snapshot of `period_at_vtime` and `period_at` is
7caa47151ab2e64 Tejun Heo    2019-08-28  1057  	 * needed, they're seqcount protected.
7caa47151ab2e64 Tejun Heo    2019-08-28  1058  	 */
7caa47151ab2e64 Tejun Heo    2019-08-28  1059  	do {
7caa47151ab2e64 Tejun Heo    2019-08-28  1060  		seq = read_seqcount_begin(&ioc->period_seqcount);
7caa47151ab2e64 Tejun Heo    2019-08-28  1061  		now->vnow = ioc->period_at_vtime +
6c31be320c52bad Kemeng Shi   2022-10-18  1062  			(now->now - ioc->period_at) * vrate;
7caa47151ab2e64 Tejun Heo    2019-08-28  1063  	} while (read_seqcount_retry(&ioc->period_seqcount, seq));
7caa47151ab2e64 Tejun Heo    2019-08-28  1064  }
7caa47151ab2e64 Tejun Heo    2019-08-28  1065  
7caa47151ab2e64 Tejun Heo    2019-08-28  1066  static void ioc_start_period(struct ioc *ioc, struct ioc_now *now)
7caa47151ab2e64 Tejun Heo    2019-08-28  1067  {
7caa47151ab2e64 Tejun Heo    2019-08-28  1068  	WARN_ON_ONCE(ioc->running != IOC_RUNNING);
7caa47151ab2e64 Tejun Heo    2019-08-28  1069  
7caa47151ab2e64 Tejun Heo    2019-08-28  1070  	write_seqcount_begin(&ioc->period_seqcount);
7caa47151ab2e64 Tejun Heo    2019-08-28  1071  	ioc->period_at = now->now;
7caa47151ab2e64 Tejun Heo    2019-08-28  1072  	ioc->period_at_vtime = now->vnow;
7caa47151ab2e64 Tejun Heo    2019-08-28  1073  	write_seqcount_end(&ioc->period_seqcount);
7caa47151ab2e64 Tejun Heo    2019-08-28  1074  
7caa47151ab2e64 Tejun Heo    2019-08-28  1075  	ioc->timer.expires = jiffies + usecs_to_jiffies(ioc->period_us);
7caa47151ab2e64 Tejun Heo    2019-08-28  1076  	add_timer(&ioc->timer);
7caa47151ab2e64 Tejun Heo    2019-08-28  1077  }
7caa47151ab2e64 Tejun Heo    2019-08-28  1078  
7caa47151ab2e64 Tejun Heo    2019-08-28  1079  /*
7caa47151ab2e64 Tejun Heo    2019-08-28  1080   * Update @iocg's `active` and `inuse` to @active and @inuse, update level
b0853ab4a238c54 Tejun Heo    2020-09-01  1081   * weight sums and propagate upwards accordingly. If @save, the current margin
b0853ab4a238c54 Tejun Heo    2020-09-01  1082   * is saved to be used as reference for later inuse in-period adjustments.
7caa47151ab2e64 Tejun Heo    2019-08-28  1083   */
b0853ab4a238c54 Tejun Heo    2020-09-01  1084  static void __propagate_weights(struct ioc_gq *iocg, u32 active, u32 inuse,
b0853ab4a238c54 Tejun Heo    2020-09-01  1085  				bool save, struct ioc_now *now)
7caa47151ab2e64 Tejun Heo    2019-08-28  1086  {
7caa47151ab2e64 Tejun Heo    2019-08-28  1087  	struct ioc *ioc = iocg->ioc;
7caa47151ab2e64 Tejun Heo    2019-08-28  1088  	int lvl;
7caa47151ab2e64 Tejun Heo    2019-08-28  1089  
7caa47151ab2e64 Tejun Heo    2019-08-28  1090  	lockdep_assert_held(&ioc->lock);
7caa47151ab2e64 Tejun Heo    2019-08-28  1091  
e9f4eee9a0023ba Tejun Heo    2021-05-11  1092  	/*
e9f4eee9a0023ba Tejun Heo    2021-05-11  1093  	 * For an active leaf node, its inuse shouldn't be zero or exceed
e9f4eee9a0023ba Tejun Heo    2021-05-11  1094  	 * @active. An active internal node's inuse is solely determined by the
e9f4eee9a0023ba Tejun Heo    2021-05-11  1095  	 * inuse to active ratio of its children regardless of @inuse.
e9f4eee9a0023ba Tejun Heo    2021-05-11  1096  	 */
e9f4eee9a0023ba Tejun Heo    2021-05-11  1097  	if (list_empty(&iocg->active_list) && iocg->child_active_sum) {
e9f4eee9a0023ba Tejun Heo    2021-05-11  1098  		inuse = DIV64_U64_ROUND_UP(active * iocg->child_inuse_sum,
e9f4eee9a0023ba Tejun Heo    2021-05-11  1099  					   iocg->child_active_sum);
e9f4eee9a0023ba Tejun Heo    2021-05-11  1100  	} else {
db84a72af6be422 Tejun Heo    2020-09-01 @1101  		inuse = clamp_t(u32, inuse, 1, active);
e9f4eee9a0023ba Tejun Heo    2021-05-11  1102  	}
db84a72af6be422 Tejun Heo    2020-09-01  1103  
b0853ab4a238c54 Tejun Heo    2020-09-01  1104  	iocg->last_inuse = iocg->inuse;
b0853ab4a238c54 Tejun Heo    2020-09-01  1105  	if (save)
b0853ab4a238c54 Tejun Heo    2020-09-01  1106  		iocg->saved_margin = now->vnow - atomic64_read(&iocg->vtime);
b0853ab4a238c54 Tejun Heo    2020-09-01  1107  
db84a72af6be422 Tejun Heo    2020-09-01  1108  	if (active == iocg->active && inuse == iocg->inuse)
db84a72af6be422 Tejun Heo    2020-09-01  1109  		return;
7caa47151ab2e64 Tejun Heo    2019-08-28  1110  
7caa47151ab2e64 Tejun Heo    2019-08-28  1111  	for (lvl = iocg->level - 1; lvl >= 0; lvl--) {
7caa47151ab2e64 Tejun Heo    2019-08-28  1112  		struct ioc_gq *parent = iocg->ancestors[lvl];
7caa47151ab2e64 Tejun Heo    2019-08-28  1113  		struct ioc_gq *child = iocg->ancestors[lvl + 1];
7caa47151ab2e64 Tejun Heo    2019-08-28  1114  		u32 parent_active = 0, parent_inuse = 0;
7caa47151ab2e64 Tejun Heo    2019-08-28  1115  
7caa47151ab2e64 Tejun Heo    2019-08-28  1116  		/* update the level sums */
7caa47151ab2e64 Tejun Heo    2019-08-28  1117  		parent->child_active_sum += (s32)(active - child->active);
7caa47151ab2e64 Tejun Heo    2019-08-28  1118  		parent->child_inuse_sum += (s32)(inuse - child->inuse);
e9f4eee9a0023ba Tejun Heo    2021-05-11  1119  		/* apply the updates */
7caa47151ab2e64 Tejun Heo    2019-08-28  1120  		child->active = active;
7caa47151ab2e64 Tejun Heo    2019-08-28  1121  		child->inuse = inuse;
7caa47151ab2e64 Tejun Heo    2019-08-28  1122  
7caa47151ab2e64 Tejun Heo    2019-08-28  1123  		/*
7caa47151ab2e64 Tejun Heo    2019-08-28  1124  		 * The delta between inuse and active sums indicates that
5ba1add216fe822 Baolin Wang  2020-11-26  1125  		 * much of weight is being given away.  Parent's inuse
7caa47151ab2e64 Tejun Heo    2019-08-28  1126  		 * and active should reflect the ratio.
7caa47151ab2e64 Tejun Heo    2019-08-28  1127  		 */
7caa47151ab2e64 Tejun Heo    2019-08-28  1128  		if (parent->child_active_sum) {
7caa47151ab2e64 Tejun Heo    2019-08-28  1129  			parent_active = parent->weight;
7caa47151ab2e64 Tejun Heo    2019-08-28  1130  			parent_inuse = DIV64_U64_ROUND_UP(
7caa47151ab2e64 Tejun Heo    2019-08-28  1131  				parent_active * parent->child_inuse_sum,
7caa47151ab2e64 Tejun Heo    2019-08-28  1132  				parent->child_active_sum);
7caa47151ab2e64 Tejun Heo    2019-08-28  1133  		}
7caa47151ab2e64 Tejun Heo    2019-08-28  1134  
7caa47151ab2e64 Tejun Heo    2019-08-28  1135  		/* do we need to keep walking up? */
7caa47151ab2e64 Tejun Heo    2019-08-28  1136  		if (parent_active == parent->active &&
7caa47151ab2e64 Tejun Heo    2019-08-28  1137  		    parent_inuse == parent->inuse)
7caa47151ab2e64 Tejun Heo    2019-08-28  1138  			break;
7caa47151ab2e64 Tejun Heo    2019-08-28  1139  
7caa47151ab2e64 Tejun Heo    2019-08-28  1140  		active = parent_active;
7caa47151ab2e64 Tejun Heo    2019-08-28  1141  		inuse = parent_inuse;
7caa47151ab2e64 Tejun Heo    2019-08-28  1142  	}
7caa47151ab2e64 Tejun Heo    2019-08-28  1143  
7caa47151ab2e64 Tejun Heo    2019-08-28  1144  	ioc->weights_updated = true;
7caa47151ab2e64 Tejun Heo    2019-08-28  1145  }
7caa47151ab2e64 Tejun Heo    2019-08-28  1146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
