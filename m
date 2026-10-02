Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6BB3EFFBD
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922393; cv=none; b=OiWAYXr3crLrHhCsxbZNOCb8SHaEVwgm545HKzHNVXjpWZ+0866t/72wWdUJVgRpo0/eiIBhqX0b5RZ56YblVEF4XL2zluaEZd0zlUuTjIkfSLRBqv6f2/m1jgtxqiVkaEJSAgnFBYe8p4xWEf0rhwkDNHbDD5nr3twq3xVeNXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922393; c=relaxed/simple;
	bh=0T6W67Bvj7R5gO3ufoP8pvGw6QgyoC30ro+U3tdFGQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvNGmZECO7sEVo9h6pyBNa95yLUYF8K+/J0GIZW/xn2CE6RdWwehr8Jbc/lGOeOhWguCwlOh18TkzlE6lpsXhEdZis/tj6PE4QmL/L8PYKQZzAUyKTz4iDh++wGSwu9M0CxnsmKOaO+wpzsOyehZxakjKo+3Zv04bgWMm0UI64o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eigd9AIw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eigd9AIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790922392; x=1822458392;
  h=date:from:to:cc:subject:message-id;
  bh=0T6W67Bvj7R5gO3ufoP8pvGw6QgyoC30ro+U3tdFGQs=;
  b=Eigd9AIwRT5BXulYE5iwsOutZQmrIUyJqRv9GRnKvt9YLp0KZ3riLjhN
   OHWWg9xFeHCG2nK+Ey6b7y4Udy8QQNqGNb0p2P51d8P0NxB+jywpx8Jvy
   k5igGY2zsImKGqoMX7Gu0U9hRRVFXM6X40WW6LQM+DQARJYzy0S/KUamu
   ziCvBRPahO0yPeGpqo/tvxYUDLNhfnSj3thslYyuV1K1iEvuIAtVxlDwd
   K5gxOBvfA/PHSX2KlHc6evuqNBuLQZ6/bGxGLkls3Wi+3x81IDJcqFmlo
   QE0V6LGcwjgenBei9Iga0t03il6r6Mr3EB9XrbkNsbxCLCwIyWhcVVrdp
   Q==;
X-CSE-ConnectionGUID: 91XTH6/UStOcKFspvIRffA==
X-CSE-MsgGUID: QFEv6K1IQ1u/61XL9KGpnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90744201"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90744201"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:26:31 -0700
X-CSE-ConnectionGUID: dxMTGYZhQH+fJzHteOX6cw==
X-CSE-MsgGUID: gr9CjEPlSWqJrxo42krbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="260399"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 01 Oct 2026 23:26:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCWix-00000000Sh8-1krd;
	Fri, 02 Oct 2026 06:26:27 +0000
Date: Fri, 02 Oct 2026 14:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/stm32-mdf-adc.c:2047:12: warning:
 'stm32_mdf_adc_resume' defined but not used
Message-ID: <202610021438.gxPsdPBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Olivier-Moysan/dt-bindings-iio-adc-add-bindings-for-stm32-mdf-filter/20261001-165645, commit: 093a1f109deefe2285de38fae696822eabdd6338"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Olivier Moysan <olivier.moysan@foss.st.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Olivier-Moysan/dt-bindings-iio-adc-add-bindings-for-stm32-mdf-filter/20261001-165645
head:   45194ccfe8e4b43c0d49821b0839686030e0d99b
commit: 093a1f109deefe2285de38fae696822eabdd6338 iio: adc: add stm32 mdf support
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261002/202610021438.gxPsdPBI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021438.gxPsdPBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021438.gxPsdPBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/stm32-mdf-adc.c:2047:12: warning: 'stm32_mdf_adc_resume' defined but not used [-Wunused-function]
    2047 | static int stm32_mdf_adc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-adc.c:2032:12: warning: 'stm32_mdf_adc_suspend' defined but not used [-Wunused-function]
    2032 | static int stm32_mdf_adc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/iio/adc/stm32-mdf-core.c:833:12: warning: 'stm32_mdf_core_runtime_resume' defined but not used [-Wunused-function]
     833 | static int stm32_mdf_core_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:828:12: warning: 'stm32_mdf_core_runtime_suspend' defined but not used [-Wunused-function]
     828 | static int stm32_mdf_core_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:793:12: warning: 'stm32_mdf_core_resume' defined but not used [-Wunused-function]
     793 | static int stm32_mdf_core_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:774:12: warning: 'stm32_mdf_core_suspend' defined but not used [-Wunused-function]
     774 | static int stm32_mdf_core_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/iio/adc/stm32-mdf-serial.c:279:12: warning: 'stm32_mdf_sitf_runtime_resume' defined but not used [-Wunused-function]
     279 | static int stm32_mdf_sitf_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:274:12: warning: 'stm32_mdf_sitf_runtime_suspend' defined but not used [-Wunused-function]
     274 | static int stm32_mdf_sitf_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:265:12: warning: 'stm32_mdf_sitf_resume' defined but not used [-Wunused-function]
     265 | static int stm32_mdf_sitf_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:253:12: warning: 'stm32_mdf_sitf_suspend' defined but not used [-Wunused-function]
     253 | static int stm32_mdf_sitf_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/stm32_mdf_adc_resume +2047 drivers/iio/adc/stm32-mdf-adc.c

093a1f109deefe Olivier Moysan 2026-10-01  2031  
093a1f109deefe Olivier Moysan 2026-10-01 @2032  static int stm32_mdf_adc_suspend(struct device *dev)
093a1f109deefe Olivier Moysan 2026-10-01  2033  {
093a1f109deefe Olivier Moysan 2026-10-01  2034  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
093a1f109deefe Olivier Moysan 2026-10-01  2035  	struct stm32_mdf_adc *adc = iio_priv(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2036  	int ret = 0;
093a1f109deefe Olivier Moysan 2026-10-01  2037  
093a1f109deefe Olivier Moysan 2026-10-01  2038  	if (iio_buffer_enabled(indio_dev))
093a1f109deefe Olivier Moysan 2026-10-01  2039  		ret = stm32_mdf_adc_predisable(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2040  
093a1f109deefe Olivier Moysan 2026-10-01  2041  	regcache_cache_only(adc->regmap, true);
093a1f109deefe Olivier Moysan 2026-10-01  2042  	regcache_mark_dirty(adc->regmap);
093a1f109deefe Olivier Moysan 2026-10-01  2043  
093a1f109deefe Olivier Moysan 2026-10-01  2044  	return ret;
093a1f109deefe Olivier Moysan 2026-10-01  2045  }
093a1f109deefe Olivier Moysan 2026-10-01  2046  
093a1f109deefe Olivier Moysan 2026-10-01 @2047  static int stm32_mdf_adc_resume(struct device *dev)
093a1f109deefe Olivier Moysan 2026-10-01  2048  {
093a1f109deefe Olivier Moysan 2026-10-01  2049  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
093a1f109deefe Olivier Moysan 2026-10-01  2050  	struct stm32_mdf_adc *adc = iio_priv(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2051  	int ret;
093a1f109deefe Olivier Moysan 2026-10-01  2052  
093a1f109deefe Olivier Moysan 2026-10-01  2053  	regcache_cache_only(adc->regmap, false);
093a1f109deefe Olivier Moysan 2026-10-01  2054  	ret = regcache_sync(adc->regmap);
093a1f109deefe Olivier Moysan 2026-10-01  2055  
093a1f109deefe Olivier Moysan 2026-10-01  2056  	if (!ret && iio_buffer_enabled(indio_dev))
093a1f109deefe Olivier Moysan 2026-10-01  2057  		ret = stm32_mdf_adc_postenable(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2058  
093a1f109deefe Olivier Moysan 2026-10-01  2059  	return ret;
093a1f109deefe Olivier Moysan 2026-10-01  2060  }
093a1f109deefe Olivier Moysan 2026-10-01  2061  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
