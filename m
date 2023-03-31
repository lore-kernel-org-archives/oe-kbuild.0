Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D6256F
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680263092; x=1711799092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W3KseKJzDP4DiU/NzprWesdHJwWsWlwEaF4fDt5mr7w=;
  b=D/zunKwCgWpDO0bsW9EWOxX8iXkCgzdcRg2Hp+QroGkVINkT5DGbL/jB
   p6JOsmv5W0bO1XZ+V9K2jfhff4DkEI4AuzEZSIVJwGdDJvk5ji7ty55ym
   NijAVWhBhCYo+R35BTweZEbxWkE3NoJwgayhg2h1JFjIrDwoRpozEyofG
   5aZg3JWLk0Xqjr20l1ja3TtWUSwuLbCR9cJ4Vd7NFXQFWP8LsO++ggkPx
   5zQP2iLdgmrBQjhf6VEbzEBZ4twycWGaqQW11Al9PPzKYzV5jp6PEONQc
   uKSB/0qpu5bCa8epU+RxNWjac0vJfsWeoRV8ibTg1q1nrKNCTkLkTFDwb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338928345"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="338928345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="809006531"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="809006531"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 04:44:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piDBK-000Ljy-0O;
	Fri, 31 Mar 2023 11:44:34 +0000
Date: Fri, 31 Mar 2023 19:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [driver-core:class_cleanup 7/105] drivers/iio/filter/admv8818.c:600
 admv8818_clk_setup() warn: 'st->clkin' from clk_prepare_enable() not
 released on lines: 598.
Message-ID: <202303311935.sat08kpL-lkp@intel.com>
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
CC: devel@driverdev.osuosl.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   2569c581e82dd4702270e610be157aa73f813f65
commit: 410e7088e971ad656170fe9768b072b267a95310 [7/105] devres: Pass unique name of the resource to devm_add_action_or_reset()
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311935.sat08kpL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303311935.sat08kpL-lkp@intel.com/

New smatch warnings:
drivers/iio/filter/admv8818.c:600 admv8818_clk_setup() warn: 'st->clkin' from clk_prepare_enable() not released on lines: 598.

Old smatch warnings:
drivers/iio/filter/admv8818.c:270 __admv8818_read_hpf_freq() warn: missing error code? 'ret'
drivers/iio/filter/admv8818.c:308 __admv8818_read_lpf_freq() warn: missing error code? 'ret'

vim +600 drivers/iio/filter/admv8818.c

f34fe888ad0546 Antoniu Miclaus 2021-12-07  574  
f34fe888ad0546 Antoniu Miclaus 2021-12-07  575  static int admv8818_clk_setup(struct admv8818_state *st)
f34fe888ad0546 Antoniu Miclaus 2021-12-07  576  {
f34fe888ad0546 Antoniu Miclaus 2021-12-07  577  	struct spi_device *spi = st->spi;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  578  	int ret;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  579  
f34fe888ad0546 Antoniu Miclaus 2021-12-07  580  	st->clkin = devm_clk_get_optional(&spi->dev, "rf_in");
f34fe888ad0546 Antoniu Miclaus 2021-12-07  581  	if (IS_ERR(st->clkin))
f34fe888ad0546 Antoniu Miclaus 2021-12-07  582  		return dev_err_probe(&spi->dev, PTR_ERR(st->clkin),
f34fe888ad0546 Antoniu Miclaus 2021-12-07  583  				     "failed to get the input clock\n");
f34fe888ad0546 Antoniu Miclaus 2021-12-07  584  	else if (!st->clkin)
f34fe888ad0546 Antoniu Miclaus 2021-12-07  585  		return 0;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  586  
f34fe888ad0546 Antoniu Miclaus 2021-12-07  587  	ret = clk_prepare_enable(st->clkin);
f34fe888ad0546 Antoniu Miclaus 2021-12-07  588  	if (ret)
f34fe888ad0546 Antoniu Miclaus 2021-12-07  589  		return ret;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  590  
f34fe888ad0546 Antoniu Miclaus 2021-12-07  591  	ret = devm_add_action_or_reset(&spi->dev, admv8818_clk_disable, st);
f34fe888ad0546 Antoniu Miclaus 2021-12-07  592  	if (ret)
f34fe888ad0546 Antoniu Miclaus 2021-12-07  593  		return ret;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  594  
f34fe888ad0546 Antoniu Miclaus 2021-12-07  595  	st->nb.notifier_call = admv8818_freq_change;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  596  	ret = clk_notifier_register(st->clkin, &st->nb);
f34fe888ad0546 Antoniu Miclaus 2021-12-07  597  	if (ret < 0)
f34fe888ad0546 Antoniu Miclaus 2021-12-07  598  		return ret;
f34fe888ad0546 Antoniu Miclaus 2021-12-07  599  
f34fe888ad0546 Antoniu Miclaus 2021-12-07 @600  	return devm_add_action_or_reset(&spi->dev, admv8818_clk_notifier_unreg, st);
f34fe888ad0546 Antoniu Miclaus 2021-12-07  601  }
f34fe888ad0546 Antoniu Miclaus 2021-12-07  602  

:::::: The code at line 600 was first introduced by commit
:::::: f34fe888ad0546dacf678aa604435d442934984f iio:filter:admv8818: add support for ADMV8818

:::::: TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
