Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4389EC4
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738632837; cv=none; b=NWOm5lkpJptoDf29ZvfDhCj1SugwekvykFwomdnMuTGvqXta7oQUyH6APgkxne/hK+Wob0dib+z9CtXA9ExrXdAflhZbN/8SWIUGhzEAyS2ckG1VZrVX1aGSjDPDBjX7oIcTDh4OP00jg5OFV/0XghkQWQAsFaztSnZrrDe0NqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738632837; c=relaxed/simple;
	bh=DMMuzrzQipJ6xBzrybP/cs9MZ4fdMG7zPM4F7D84yyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSD2VpiKbTqBmKvacVOp0JfM9jWjHCfvge+BhHPVCXwOfhi9mw7PtsJpq9Q/NGd3TaP40trLEN2zF7/i/xtOhX0R581TaWNPJrl9IBs1nf7TNi38zUHO0+U5rd48VOZ3BYE1zdd4HawUhPxCQYLpCHn+VraZEJ4Toau7wn47CVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mo0wOg/W; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mo0wOg/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738632835; x=1770168835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMMuzrzQipJ6xBzrybP/cs9MZ4fdMG7zPM4F7D84yyw=;
  b=Mo0wOg/WUkqsR1Rmy6iwV4espRpIBoLjJ1HouMOpWrAYKzyNyrGKYxiX
   JsCyifq/7w9v3iDwoAowoBAJO7DfIPQ0W/LZHEJNtL7eBrh5dqC2dQ/Bo
   xp5NSIo2SP+eoEtPGVuEdco3jUDdULOc9P3wST6zdf/y/sAbG/G4W8NCb
   s39LbcnRa5N9JwKXrg+k2hSTrfMnt/ghkhrLIM209P2lgC30T3xHylimh
   N1kA8d6Dg77BoCQPFb0UXD5miA8Pci+j3VFJHmhxwSI7Wrd0wwbA4GSbr
   rJMzsoqf+20iwMTeyf8VPAyA7VaAE3nt6g+v4Q6TiGblGE4upflY0vYTE
   A==;
X-CSE-ConnectionGUID: mPF5htmOTBKPvqBLQ4a1jQ==
X-CSE-MsgGUID: dNtuHnKPQ2GNRklEL6ZiyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42798351"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="42798351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 17:33:54 -0800
X-CSE-ConnectionGUID: f5zgkU6/Qiq26pvgEkrqnA==
X-CSE-MsgGUID: SNkW664yS8uF7YMhtDdTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110624459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 17:33:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf7p0-000roB-2X;
	Tue, 04 Feb 2025 01:33:50 +0000
Date: Tue, 4 Feb 2025 09:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:sparse-friendly-direct-mode 90/166]
 drivers/iio/adc/stm32-dfsdm-adc.c:1320 __stm32_dfsdm_read_info_raw() error:
 uninitialized symbol 'ret'.
Message-ID: <202502040918.N96TGHTV-lkp@intel.com>
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
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git sparse-friendly-direct-mode
head:   2d042931355bda7a2fd9e7f81d0be99c3669af4f
commit: 92540659cab57f14a1fc6615b93e4adb97b51acd [90/166] iio: adc: stm32-dfsdm: Factor out core of reading INFO_RAW
:::::: branch date: 4 hours ago
:::::: commit date: 29 hours ago
config: m68k-randconfig-r071-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040918.N96TGHTV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502040918.N96TGHTV-lkp@intel.com/

smatch warnings:
drivers/iio/adc/stm32-dfsdm-adc.c:1320 __stm32_dfsdm_read_info_raw() error: uninitialized symbol 'ret'.

vim +/ret +1320 drivers/iio/adc/stm32-dfsdm-adc.c

e2e6771c646251 Arnaud Pouliquen 2018-01-10  1308  
92540659cab57f Jonathan Cameron 2025-01-19  1309  static int __stm32_dfsdm_read_info_raw(struct iio_dev *indio_dev,
92540659cab57f Jonathan Cameron 2025-01-19  1310  				       struct iio_chan_spec const *chan,
92540659cab57f Jonathan Cameron 2025-01-19  1311  				       int *val)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1312  {
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1313  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1314  	int ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1315  
3208fa0cd91914 Olivier Moysan   2024-07-30  1316  	if (adc->hwc)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1317  		ret = iio_hw_consumer_enable(adc->hwc);
6fc839dc320cd6 Olivier Moysan   2024-07-30  1318  	if (adc->backend)
92540659cab57f Jonathan Cameron 2025-01-19  1319  		ret = iio_backend_enable(adc->backend[chan->scan_index]);
e2e6771c646251 Arnaud Pouliquen 2018-01-10 @1320  	if (ret < 0) {
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1321  		dev_err(&indio_dev->dev,
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1322  			"%s: IIO enable failed (channel %d)\n",
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1323  			__func__, chan->channel);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1324  		return ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1325  	}
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1326  	ret = stm32_dfsdm_single_conv(indio_dev, chan, val);
3208fa0cd91914 Olivier Moysan   2024-07-30  1327  	if (adc->hwc)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1328  		iio_hw_consumer_disable(adc->hwc);
6fc839dc320cd6 Olivier Moysan   2024-07-30  1329  	if (adc->backend)
92540659cab57f Jonathan Cameron 2025-01-19  1330  		iio_backend_disable(adc->backend[chan->scan_index]);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1331  	if (ret < 0) {
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1332  		dev_err(&indio_dev->dev,
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1333  			"%s: Conversion failed (channel %d)\n",
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1334  			__func__, chan->channel);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1335  		return ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1336  	}
92540659cab57f Jonathan Cameron 2025-01-19  1337  
92540659cab57f Jonathan Cameron 2025-01-19  1338  	return 0;
92540659cab57f Jonathan Cameron 2025-01-19  1339  }
92540659cab57f Jonathan Cameron 2025-01-19  1340  

:::::: The code at line 1320 was first introduced by commit
:::::: e2e6771c646251657fafb2a78db566d5c2c70635 IIO: ADC: add STM32 DFSDM sigma delta ADC support

:::::: TO: Arnaud Pouliquen <arnaud.pouliquen@st.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
