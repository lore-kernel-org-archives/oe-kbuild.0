Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16E21FF47
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058704; cv=none; b=krBU3mfKkv7kbyexV9EweD6Ls8B6dc6KTli7QKV8zVcwU7UKjLVH5dX0mS/UusmRF2AM+blNUDgYCtjCZZnkunlXD6Zc0GaKf+COP/jbtSQEKoPpwnZI6H8hYZ03zfNkCfnE4u9GEWg7N5jP05LyxDotznU42YlnGsw21/8dejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058704; c=relaxed/simple;
	bh=42+WgQ4U4h43/vNQd5ucoVus3eWFgXReNRaTkIAWRwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecpRPtJUH9mSJUyjUG8tOSt7rhHejUrO1Z8EXrLQVOIg+W22txCv7rVjAMTkNi6kOkJa4cqy7VUXRqO2Rj0TJ4abLelI6lBa0EI478hi735Z0YDz+kj0KF3w/DuU+ltDf5jLWVZsMpJNVvIXodrip4D0orxG8z3BuQGu1Ea1uOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGZm7lsz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGZm7lsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756058702; x=1787594702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42+WgQ4U4h43/vNQd5ucoVus3eWFgXReNRaTkIAWRwE=;
  b=UGZm7lsz66H8zQaHqbFvPG7Vbxp19Y/wNKU5/iWIkUO3lbVkBY1f5BWH
   jVW0mmOQq3ULV4a/MT9PseH18bDpoQPxn1vdidmbcOgKiJRMSxtafPcBH
   XT3dHCGDLDPBOWC0xvYDSRYax25ObKzaU92/8YP4jCCkFmvVG2DHYQWNA
   gihoHAlQISaosNyaL2l3n44+MdNzjI3kjHTrMRPB/GuCa25ryatGu9wn3
   0+DTWXrNvjh4I98K+2Y0nfuKoJnbtrTNsctUeBUQMTMnAt+iY+DUoLBoR
   gOOHwT2scE45OCs1FUjfpTKDmTyuuvFz0uRo2ukUrRnpEvJheHvG4tAcv
   A==;
X-CSE-ConnectionGUID: uE1tkhsKQx6rBufR1FUVOQ==
X-CSE-MsgGUID: tOkLCUVcTgm2jrR0yBJplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58341713"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58341713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 11:05:01 -0700
X-CSE-ConnectionGUID: x2YKBhInTDSM6KHYiUntvg==
X-CSE-MsgGUID: RJcVWIqaQ+WTD0Za/mIGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173399092"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2025 11:04:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqF4s-000N8F-1m;
	Sun, 24 Aug 2025 18:04:38 +0000
Date: Mon, 25 Aug 2025 02:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 4/6] iio: adc: add ade9000 support
Message-ID: <202508250158.KQ6WdkKh-lkp@intel.com>
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
In-Reply-To: <20250822160157.5092-5-antoniu.miclaus@analog.com>
References: <20250822160157.5092-5-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: jic23@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/iio-add-IIO_ALTCURRENT-channel-type/20250823-001017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250822160157.5092-5-antoniu.miclaus%40analog.com
patch subject: [PATCH v5 4/6] iio: adc: add ade9000 support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250158.KQ6WdkKh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508250158.KQ6WdkKh-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ade9000.c:1009 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1505 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1554 ade9000_write_event_config() error: uninitialized symbol 'interrupts'.

Old smatch warnings:
drivers/iio/adc/ade9000.c:1018 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1027 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1036 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1045 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1054 ade9000_irq1_thread() warn: right shifting more than type allows 16 vs 20
drivers/iio/adc/ade9000.c:1507 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1524 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1527 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1546 ade9000_write_event_config() error: uninitialized symbol 'tmp'.
drivers/iio/adc/ade9000.c:1549 ade9000_write_event_config() error: uninitialized symbol 'tmp'.

vim +1009 drivers/iio/adc/ade9000.c

b695e630eecec70 Antoniu Miclaus 2025-08-22   878  
b695e630eecec70 Antoniu Miclaus 2025-08-22   879  static irqreturn_t ade9000_irq1_thread(int irq, void *data)
b695e630eecec70 Antoniu Miclaus 2025-08-22   880  {
b695e630eecec70 Antoniu Miclaus 2025-08-22   881  	struct iio_dev *indio_dev = data;
b695e630eecec70 Antoniu Miclaus 2025-08-22   882  	struct ade9000_state *st = iio_priv(indio_dev);
b695e630eecec70 Antoniu Miclaus 2025-08-22   883  	unsigned int bit = ADE9000_ST1_CROSSING_FIRST;
b695e630eecec70 Antoniu Miclaus 2025-08-22   884  	s64 timestamp = iio_get_time_ns(indio_dev);
b695e630eecec70 Antoniu Miclaus 2025-08-22   885  	u32 handled_irq = 0;
b695e630eecec70 Antoniu Miclaus 2025-08-22   886  	u32 interrupts;
b695e630eecec70 Antoniu Miclaus 2025-08-22   887  	u32 result;
b695e630eecec70 Antoniu Miclaus 2025-08-22   888  	u32 status;
b695e630eecec70 Antoniu Miclaus 2025-08-22   889  	u32 tmp;
b695e630eecec70 Antoniu Miclaus 2025-08-22   890  	unsigned long interrupt_bits;
b695e630eecec70 Antoniu Miclaus 2025-08-22   891  	int ret;
b695e630eecec70 Antoniu Miclaus 2025-08-22   892  
b695e630eecec70 Antoniu Miclaus 2025-08-22   893  	if (!completion_done(&st->reset_completion)) {
b695e630eecec70 Antoniu Miclaus 2025-08-22   894  		ret = regmap_read(st->regmap, ADE9000_REG_STATUS1, &result);
b695e630eecec70 Antoniu Miclaus 2025-08-22   895  		if (ret) {
b695e630eecec70 Antoniu Miclaus 2025-08-22   896  			dev_err(&st->spi->dev, "IRQ1 read status fail\n");
b695e630eecec70 Antoniu Miclaus 2025-08-22   897  			return ret;
b695e630eecec70 Antoniu Miclaus 2025-08-22   898  		}
b695e630eecec70 Antoniu Miclaus 2025-08-22   899  
b695e630eecec70 Antoniu Miclaus 2025-08-22   900  		if (result & ADE9000_ST1_RSTDONE_BIT)
b695e630eecec70 Antoniu Miclaus 2025-08-22   901  			complete(&st->reset_completion);
b695e630eecec70 Antoniu Miclaus 2025-08-22   902  		else
b695e630eecec70 Antoniu Miclaus 2025-08-22   903  			dev_err(&st->spi->dev, "Error testing reset done\n");
b695e630eecec70 Antoniu Miclaus 2025-08-22   904  
b695e630eecec70 Antoniu Miclaus 2025-08-22   905  		return IRQ_HANDLED;
b695e630eecec70 Antoniu Miclaus 2025-08-22   906  	}
b695e630eecec70 Antoniu Miclaus 2025-08-22   907  
b695e630eecec70 Antoniu Miclaus 2025-08-22   908  	ret = regmap_read(st->regmap, ADE9000_REG_STATUS1, &status);
b695e630eecec70 Antoniu Miclaus 2025-08-22   909  	if (ret) {
b695e630eecec70 Antoniu Miclaus 2025-08-22   910  		dev_err(&st->spi->dev, "IRQ1 read status fail\n");
b695e630eecec70 Antoniu Miclaus 2025-08-22   911  		return IRQ_HANDLED;
b695e630eecec70 Antoniu Miclaus 2025-08-22   912  	}
b695e630eecec70 Antoniu Miclaus 2025-08-22   913  
b695e630eecec70 Antoniu Miclaus 2025-08-22   914  	ret = regmap_read(st->regmap, ADE9000_REG_MASK1, &interrupts);
b695e630eecec70 Antoniu Miclaus 2025-08-22   915  	if (ret) {
b695e630eecec70 Antoniu Miclaus 2025-08-22   916  		dev_err(&st->spi->dev, "IRQ1 read status fail\n");
b695e630eecec70 Antoniu Miclaus 2025-08-22   917  		return IRQ_HANDLED;
b695e630eecec70 Antoniu Miclaus 2025-08-22   918  	}
b695e630eecec70 Antoniu Miclaus 2025-08-22   919  
b695e630eecec70 Antoniu Miclaus 2025-08-22   920  	interrupt_bits = interrupts;
b695e630eecec70 Antoniu Miclaus 2025-08-22   921  	for_each_set_bit_from(bit, &interrupt_bits,
b695e630eecec70 Antoniu Miclaus 2025-08-22   922  			      ADE9000_ST1_CROSSING_DEPTH){
b695e630eecec70 Antoniu Miclaus 2025-08-22   923  		tmp = status & BIT(bit);
b695e630eecec70 Antoniu Miclaus 2025-08-22   924  
b695e630eecec70 Antoniu Miclaus 2025-08-22   925  		switch (tmp) {
b695e630eecec70 Antoniu Miclaus 2025-08-22   926  		case ADE9000_ST1_ZXVA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   927  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   928  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   929  							    ADE9000_ST1_ZXVA_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   930  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   931  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   932  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   933  			handled_irq |= ADE9000_ST1_ZXVA_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   934  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   935  		case ADE9000_ST1_ZXTOVA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   936  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   937  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   938  							    ADE9000_ST1_ZXTOVA_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   939  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   940  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   941  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   942  			handled_irq |= ADE9000_ST1_ZXTOVA_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   943  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   944  		case ADE9000_ST1_ZXIA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   945  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   946  				       IIO_UNMOD_EVENT_CODE(IIO_CURRENT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   947  							    ADE9000_ST1_ZXIA_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   948  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   949  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   950  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   951  			handled_irq |= ADE9000_ST1_ZXIA_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   952  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   953  		case ADE9000_ST1_ZXVB_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   954  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   955  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   956  							    ADE9000_ST1_ZXVB_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   957  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   958  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   959  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   960  			handled_irq |= ADE9000_ST1_ZXVB_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   961  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   962  		case ADE9000_ST1_ZXTOVB_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   963  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   964  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   965  							    ADE9000_ST1_ZXTOVB_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   966  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   967  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   968  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   969  			handled_irq |= ADE9000_ST1_ZXTOVB_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   970  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   971  		case ADE9000_ST1_ZXIB_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   972  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   973  				       IIO_UNMOD_EVENT_CODE(IIO_CURRENT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   974  							    ADE9000_ST1_ZXIB_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   975  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   976  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   977  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   978  			handled_irq |= ADE9000_ST1_ZXIB_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   979  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   980  		case ADE9000_ST1_ZXVC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   981  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   982  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   983  							    ADE9000_ST1_ZXVC_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   984  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   985  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   986  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   987  			handled_irq |= ADE9000_ST1_ZXVC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   988  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   989  		case ADE9000_ST1_ZXTOVC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   990  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22   991  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22   992  							    ADE9000_ST1_ZXTOVC_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22   993  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22   994  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22   995  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22   996  			handled_irq |= ADE9000_ST1_ZXTOVC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22   997  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22   998  		case ADE9000_ST1_ZXIC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22   999  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1000  				       IIO_UNMOD_EVENT_CODE(IIO_CURRENT,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1001  							    ADE9000_ST1_ZXIC_BIT,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1002  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1003  							    IIO_EV_DIR_EITHER),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1004  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1005  			handled_irq |= ADE9000_ST1_ZXIC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1006  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1007  		case ADE9000_ST1_SWELLA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1008  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22 @1009  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1010  							    ADE9000_ST1_SWELLA_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1011  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1012  							    IIO_EV_DIR_RISING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1013  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1014  			handled_irq |= ADE9000_ST1_SWELLA_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1015  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1016  		case ADE9000_ST1_SWELLB_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1017  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1018  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1019  							    ADE9000_ST1_SWELLB_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1020  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1021  							    IIO_EV_DIR_RISING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1022  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1023  			handled_irq |= ADE9000_ST1_SWELLB_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1024  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1025  		case ADE9000_ST1_SWELLC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1026  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1027  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1028  							    ADE9000_ST1_SWELLC_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1029  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1030  							    IIO_EV_DIR_RISING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1031  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1032  			handled_irq |= ADE9000_ST1_SWELLC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1033  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1034  		case ADE9000_ST1_DIPA_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1035  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1036  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1037  							    ADE9000_ST1_DIPA_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1038  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1039  							    IIO_EV_DIR_FALLING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1040  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1041  			handled_irq |= ADE9000_ST1_DIPA_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1042  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1043  		case ADE9000_ST1_DIPB_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1044  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1045  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1046  							    ADE9000_ST1_DIPB_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1047  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1048  							    IIO_EV_DIR_FALLING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1049  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1050  			handled_irq |= ADE9000_ST1_DIPB_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1051  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1052  		case ADE9000_ST1_DIPC_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1053  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1054  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1055  							    ADE9000_ST1_DIPC_BIT >> 20,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1056  							    IIO_EV_TYPE_THRESH,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1057  							    IIO_EV_DIR_FALLING),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1058  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1059  			handled_irq |= ADE9000_ST1_DIPC_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1060  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1061  		case ADE9000_ST1_SEQERR_BIT:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1062  			iio_push_event(indio_dev,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1063  				       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1064  							    ADE9000_ST1_SEQERR_BIT >> 12,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1065  							    IIO_EV_TYPE_CHANGE,
b695e630eecec70 Antoniu Miclaus 2025-08-22  1066  							    IIO_EV_DIR_NONE),
b695e630eecec70 Antoniu Miclaus 2025-08-22  1067  				       timestamp);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1068  			handled_irq |= ADE9000_ST1_SEQERR_BIT;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1069  			break;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1070  		default:
b695e630eecec70 Antoniu Miclaus 2025-08-22  1071  			return IRQ_HANDLED;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1072  		}
b695e630eecec70 Antoniu Miclaus 2025-08-22  1073  	}
b695e630eecec70 Antoniu Miclaus 2025-08-22  1074  
b695e630eecec70 Antoniu Miclaus 2025-08-22  1075  	ret = regmap_write(st->regmap, ADE9000_REG_STATUS1, handled_irq);
b695e630eecec70 Antoniu Miclaus 2025-08-22  1076  	if (ret)
b695e630eecec70 Antoniu Miclaus 2025-08-22  1077  		return ret;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1078  
b695e630eecec70 Antoniu Miclaus 2025-08-22  1079  	return IRQ_HANDLED;
b695e630eecec70 Antoniu Miclaus 2025-08-22  1080  }
b695e630eecec70 Antoniu Miclaus 2025-08-22  1081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
