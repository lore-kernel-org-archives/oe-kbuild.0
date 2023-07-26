Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED11AD37
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690365081; x=1721901081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7iv6/7qGRULxfHhMM+nz0pV1aQbv9BONvTKTOc8Jp8=;
  b=IpLxvyJyt+SkR3mvb/RDdbZDlv7pwn8dNrjxYXOf89H7OizAXLU/hE40
   uTQb8RbMh507O84tbHvWSCLbfIvg2aeXGkXuNtv7IOBNf0hNdFa7IU6kT
   0RxJEbtMFl7WfoJX/EGDzMq6dQ0d3EFK9B7xVWvPMdIo73bx5UwHFnHNQ
   VW/6+/D59WwCHbJYddSGRveVZLkgCkIWVSo1QDSwDi3h8bJmpI5RMa86M
   1gxEf2qaOLbobxxbQrzXIMlinF5uq1N1KmJPBb50MDM3e0G6XMEKQuYDy
   v0Nv9ffDTR6yPX3pETSTEx+50YAwAjs7pxtt1NrAK4IFfXK58NhB2ziB4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="434233038"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="434233038"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720405042"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="720405042"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Jul 2023 02:51:19 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qObAe-0000s7-0T;
	Wed, 26 Jul 2023 09:51:08 +0000
Date: Wed, 26 Jul 2023 17:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261759.cFMqbOSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iio/adc/max11410.c:310:16: sparse: sparse: bad integer constant expression"
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
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-i062-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261759.cFMqbOSP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261759.cFMqbOSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261759.cFMqbOSP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/max11410.c:310:16: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/max11410.c:310:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(rate))(0) greater than high limit (typeof(rate))(max11410_sampling_len[MAX11410_FILTER_SINC4] - 1)"
--
>> drivers/gpu/drm/i915/gt/intel_rps.c:872:23: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/gt/intel_rps.c:872:23: sparse: sparse: static assertion failed: "clamp() low limit rps->min_freq_softlimit greater than high limit rps->max_freq_softlimit"
   drivers/gpu/drm/i915/gt/intel_rps.c:1194:33: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/gt/intel_rps.c:1194:33: sparse: sparse: static assertion failed: "clamp() low limit (u32)(rps->min_freq) greater than high limit (u32)(rps->max_freq)"
   drivers/gpu/drm/i915/gt/intel_rps.c:1874:20: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/gt/intel_rps.c:1874:20: sparse: sparse: static assertion failed: "clamp() low limit (int)(min) greater than high limit (int)(max)"
   drivers/gpu/drm/i915/gt/intel_rps.c:1961:20: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/i915/gt/intel_rps.c:1961:20: sparse: sparse: static assertion failed: "clamp() low limit rps->min_freq_softlimit greater than high limit rps->max_freq_softlimit"
   drivers/gpu/drm/i915/gt/intel_rps.c:2467:15: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/gt/intel_rps.c:2467:15: sparse: sparse: static assertion failed: "clamp() low limit (int)(rps->min_freq_softlimit) greater than high limit (int)(rps->max_freq_softlimit)"
   drivers/gpu/drm/i915/gt/intel_rps.c:2545:15: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/i915/gt/intel_rps.c:2545:15: sparse: sparse: static assertion failed: "clamp() low limit (int)(rps->min_freq_softlimit) greater than high limit (int)(rps->max_freq_softlimit)"
--
>> drivers/gpu/drm/i915/i915_hwmon.c:391:24: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/i915_hwmon.c:391:24: sparse: sparse: static assertion failed: "clamp() low limit (u64)(min) greater than high limit (u64)(max)"
--
   drivers/gpu/drm/i915/display/intel_color.c: note: in included file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/gpu/drm/i915/display/intel_color.c:584:13: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_color.c:584:13: sparse: sparse: static assertion failed: "clamp() low limit -(s64)((((1UL))) << (int_bits + frac_bits - 1)) greater than high limit (s64)(((((1UL))) << (int_bits + frac_bits - 1)) - 1)"
   drivers/gpu/drm/i915/display/intel_color.c:785:15: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_color.c:785:15: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
--
   drivers/gpu/drm/i915/display/intel_backlight.c: note: in included file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/gpu/drm/i915/display/intel_backlight.c:47:22: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_backlight.c:47:22: sparse: sparse: static assertion failed: "clamp() low limit source_min greater than high limit source_max"
   drivers/gpu/drm/i915/display/intel_backlight.c:69:20: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_backlight.c:69:20: sparse: sparse: static assertion failed: "clamp() low limit panel->backlight.min greater than high limit panel->backlight.max"
   drivers/gpu/drm/i915/display/intel_backlight.c:1332:15: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_backlight.c:1332:15: sparse: sparse: static assertion failed: "clamp() low limit panel->backlight.pwm_level_min greater than high limit panel->backlight.pwm_level_max"
--
   drivers/gpu/drm/i915/display/intel_dp_aux.c: note: in included file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, include/drm/drm_atomic.h, ...):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/gpu/drm/i915/display/intel_dp_aux.c:480:39: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/i915/display/intel_dp_aux.c:480:39: sparse: sparse: static assertion failed: "clamp() low limit (int)(0) greater than high limit (int)(msg->size)"

vim +310 drivers/iio/adc/max11410.c

a44ef7c4609724 Ibrahim Tilki 2022-10-03  296  
a44ef7c4609724 Ibrahim Tilki 2022-10-03  297  static ssize_t in_voltage_filter2_notch_center_show(struct device *dev,
a44ef7c4609724 Ibrahim Tilki 2022-10-03  298  						    struct device_attribute *devattr,
a44ef7c4609724 Ibrahim Tilki 2022-10-03  299  						    char *buf)
a44ef7c4609724 Ibrahim Tilki 2022-10-03  300  {
a44ef7c4609724 Ibrahim Tilki 2022-10-03  301  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
a44ef7c4609724 Ibrahim Tilki 2022-10-03  302  	struct max11410_state *state = iio_priv(indio_dev);
a44ef7c4609724 Ibrahim Tilki 2022-10-03  303  	int ret, reg, rate, filter;
a44ef7c4609724 Ibrahim Tilki 2022-10-03  304  
a44ef7c4609724 Ibrahim Tilki 2022-10-03  305  	ret = regmap_read(state->regmap, MAX11410_REG_FILTER, &reg);
a44ef7c4609724 Ibrahim Tilki 2022-10-03  306  	if (ret)
a44ef7c4609724 Ibrahim Tilki 2022-10-03  307  		return ret;
a44ef7c4609724 Ibrahim Tilki 2022-10-03  308  
a44ef7c4609724 Ibrahim Tilki 2022-10-03  309  	rate = FIELD_GET(MAX11410_FILTER_RATE_MASK, reg);
a44ef7c4609724 Ibrahim Tilki 2022-10-03 @310  	rate = clamp_val(rate, 0,
a44ef7c4609724 Ibrahim Tilki 2022-10-03  311  			 max11410_sampling_len[MAX11410_FILTER_SINC4] - 1);
a44ef7c4609724 Ibrahim Tilki 2022-10-03  312  	filter = max11410_sampling_rates[MAX11410_FILTER_SINC4][rate][0];
a44ef7c4609724 Ibrahim Tilki 2022-10-03  313  
a44ef7c4609724 Ibrahim Tilki 2022-10-03  314  	return sysfs_emit(buf, "%d\n", filter);
a44ef7c4609724 Ibrahim Tilki 2022-10-03  315  }
a44ef7c4609724 Ibrahim Tilki 2022-10-03  316  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
