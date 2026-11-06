Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949603;
	b=Rsp32PspDqxZv/mnH65T1SQphoOnviJWU5h12xLVHu7XMOJwQTvlPSllSyY3qIArDjR3
	 E3I+bNSaZ/TPhoSN71uiLfS3bhdRtUx1yeoxZjjcFf4AFDq/91gz8h2CM8CujYC+W9LOE
	 9FFTHqzVNsuDFSUxfO62j0kbrA5EjeJOEjaNTiWmqKvQxqGWTFuucc+KyA6wkw9e2O54X
	 O52qZsqC8tvfRvvgyLch3jzQqZWFQH4ieIbBmKjRPpKMMoY8nQ2yA/9B6TxaxqxsCWujM
	 XcSoJvAFtgNI1RuRgAh2u/a39IUj2fMt1BPtkalPDC36vthDk1OE6zAg26JVWMwTcIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ETmHZJsiArU7Z007YAwLBsP1vXDgaEWExIPjm66qzzw=;
	b=s4bwvm6F6csZ1uO5FOPbbNoCBM/wviubYSZo+CJdbEghMp6+z2aOyh7cxAVF4tNJLv3l
	 KpM/29wC+oAzwPAN/6vcA2ARkakjkjsIx9Y0SSHqUG6OZx1pKTjC74lXz6c8Vx3BjuEMD
	 BU/VDX5rHMMH71OAsOiRBgkg94PrMrdg8oq1biNK+K8tnIQcriQWmb3Ll5G3rp/goxm8v
	 1IfJpfDdoRY2sqSYDR9pSsr1rgtS65c9j59DlpeNTnjrUFd87JumZeIv+I5/FVHaiHItG
	 R4RzJ+FX6O7+J5Rykdf4tiNE8kqTewFygIQcXz/UrCO44FlXjvOfgDe1xQmpIJgpN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2enKmLI;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4B606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 07:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE4B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2enKmLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793949602; x=1825485602;
  h=date:from:to:cc:subject:message-id;
  bh=mXaTsjMtm+0vtHLbZAlg3Ttc/jt8LrRpZDpDMR6AkRY=;
  b=B2enKmLIgUuGEceQjWUQ7fGSRKtBbyyu/gX/MKc3bE80t7LXicZWuq2j
   Re8RXpt4m+w1iEEnlF5HP5A3hO0Hb4/Mmlerbyi4OLLxM3eIcYYBx9kTs
   /u4c6dj2UZfS5EPb6FY9sEUJakiXNxaw3Vj8+V7Y2oz+KOu4UN4qLKGrH
   7llH8K8IbAcdyU4k1t4RLMzokP3cWBB8tq/DKMe5vLHbGm6r/G1BPBQbL
   H+mpuIErIk893u7PGI7MBSxZ8mSlnpxJSKNnx/KwM1vLb6pJD7jMFhibJ
   wqd4c9TErs6QZSbcLxoFoMj/kLDCtlL7rdJXwOlkUrFuRTIF1aQoSxllz
   A==;
X-CSE-ConnectionGUID: rEfCvw7sRHyJzPEfxBTwcw==
X-CSE-MsgGUID: 8smwJtndScKsNEBEV5aVwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2660242"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2660242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:20:02 -0800
X-CSE-ConnectionGUID: rswrKwo1SZW9zBhtEQiY6w==
X-CSE-MsgGUID: TD7MeIy8ScaEY50H90SQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7638973"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2026 23:20:01 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPEEx-00000000A7j-01yr;
	Fri, 06 Nov 2026 07:19:59 +0000
Date: Fri, 06 Nov 2026 08:19:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 303/303]
 drivers/iio/adc/at91-sama5d2_adc.c:1968 at91_adc_resume() warn: 'st->per_clk'
 from clk_prepare_enable() not released on lines: 1968.
Message-ID: <202611060840.yLhM3kMd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f012a641c30644ec5bf95cf64d8835854b997f86
commit: 44ec4b04fc9950678e266f1ad07a4868120fcb7b [303/303] iio: adc: at91-sama5d2_adc: disable/prepare buffer on suspend/resume
:::::: branch date: 34 hours ago
:::::: commit date: 4 years ago
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060840.yLhM3kMd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060840.yLhM3kMd-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/at91-sama5d2_adc.c:1968 at91_adc_resume() warn: 'st->per_clk' from clk_prepare_enable() not released on lines: 1968.

Old smatch warnings:
drivers/iio/adc/at91-sama5d2_adc.c:1794 at91_adc_probe() warn: platform_get_irq() does not return zero

vim +1968 drivers/iio/adc/at91-sama5d2_adc.c

500a2eefd6b16b Eugen Hristev      2017-06-23  1927  
500a2eefd6b16b Eugen Hristev      2017-06-23  1928  static __maybe_unused int at91_adc_resume(struct device *dev)
500a2eefd6b16b Eugen Hristev      2017-06-23  1929  {
e3faedf71d8817 Kefeng Wang        2019-04-23  1930  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
500a2eefd6b16b Eugen Hristev      2017-06-23  1931  	struct at91_adc_state *st = iio_priv(indio_dev);
500a2eefd6b16b Eugen Hristev      2017-06-23  1932  	int ret;
500a2eefd6b16b Eugen Hristev      2017-06-23  1933  
500a2eefd6b16b Eugen Hristev      2017-06-23  1934  	ret = pinctrl_pm_select_default_state(dev);
500a2eefd6b16b Eugen Hristev      2017-06-23  1935  	if (ret)
500a2eefd6b16b Eugen Hristev      2017-06-23  1936  		goto resume_failed;
500a2eefd6b16b Eugen Hristev      2017-06-23  1937  
500a2eefd6b16b Eugen Hristev      2017-06-23  1938  	ret = regulator_enable(st->reg);
500a2eefd6b16b Eugen Hristev      2017-06-23  1939  	if (ret)
500a2eefd6b16b Eugen Hristev      2017-06-23  1940  		goto resume_failed;
500a2eefd6b16b Eugen Hristev      2017-06-23  1941  
500a2eefd6b16b Eugen Hristev      2017-06-23  1942  	ret = regulator_enable(st->vref);
500a2eefd6b16b Eugen Hristev      2017-06-23  1943  	if (ret)
500a2eefd6b16b Eugen Hristev      2017-06-23  1944  		goto reg_disable_resume;
500a2eefd6b16b Eugen Hristev      2017-06-23  1945  
500a2eefd6b16b Eugen Hristev      2017-06-23  1946  	ret = clk_prepare_enable(st->per_clk);
500a2eefd6b16b Eugen Hristev      2017-06-23  1947  	if (ret)
500a2eefd6b16b Eugen Hristev      2017-06-23  1948  		goto vref_disable_resume;
500a2eefd6b16b Eugen Hristev      2017-06-23  1949  
ebf35aad0baa05 Alexandru Ardelean 2020-05-25  1950  	at91_adc_hw_init(indio_dev);
500a2eefd6b16b Eugen Hristev      2017-06-23  1951  
500a2eefd6b16b Eugen Hristev      2017-06-23  1952  	/* reconfiguring trigger hardware state */
23ec2774f1cc16 Eugen Hristev      2018-05-22  1953  	if (!iio_buffer_enabled(indio_dev))
23ec2774f1cc16 Eugen Hristev      2018-05-22  1954  		return 0;
23ec2774f1cc16 Eugen Hristev      2018-05-22  1955  
44ec4b04fc9950 Claudiu Beznea     2022-08-03  1956  	ret = at91_adc_buffer_prepare(indio_dev);
44ec4b04fc9950 Claudiu Beznea     2022-08-03  1957  	if (ret)
44ec4b04fc9950 Claudiu Beznea     2022-08-03  1958  		goto vref_disable_resume;
500a2eefd6b16b Eugen Hristev      2017-06-23  1959  
44ec4b04fc9950 Claudiu Beznea     2022-08-03  1960  	return at91_adc_configure_trigger(st->trig, true);
500a2eefd6b16b Eugen Hristev      2017-06-23  1961  
500a2eefd6b16b Eugen Hristev      2017-06-23  1962  vref_disable_resume:
500a2eefd6b16b Eugen Hristev      2017-06-23  1963  	regulator_disable(st->vref);
500a2eefd6b16b Eugen Hristev      2017-06-23  1964  reg_disable_resume:
500a2eefd6b16b Eugen Hristev      2017-06-23  1965  	regulator_disable(st->reg);
500a2eefd6b16b Eugen Hristev      2017-06-23  1966  resume_failed:
500a2eefd6b16b Eugen Hristev      2017-06-23  1967  	dev_err(&indio_dev->dev, "failed to resume\n");
500a2eefd6b16b Eugen Hristev      2017-06-23 @1968  	return ret;
500a2eefd6b16b Eugen Hristev      2017-06-23  1969  }
500a2eefd6b16b Eugen Hristev      2017-06-23  1970  

:::::: The code at line 1968 was first introduced by commit
:::::: 500a2eefd6b16ba141a8fb777ea6962d2eb65e3b iio: adc: at91-sama5d2_adc: add support for suspend/resume functionality

:::::: TO: Eugen Hristev <eugen.hristev@microchip.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
