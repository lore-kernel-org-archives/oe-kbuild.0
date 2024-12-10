Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D143ACB
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 04:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733804263; cv=none; b=pzWVX7N/nx/4KuGcNwL5mnOO47MjUiAmaSpBADN+PDWpizNV6rdXHqoOHSeIXuZf29gUq3JGDCQWCe4ewIPQnlEPtwjydBWNzkx6vmhp9jDJVYYhKDAfrZMGS2VjTzy5HvAqYV0LfAc5u+0a2fTz4wyWkw0s1cHBvGKTCVKToVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733804263; c=relaxed/simple;
	bh=sVJScvi+g75eL5iul3/b+9lgMoBNmImtcJoxsezvw9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqvQvV6zUAdjap75rz8htVatpJ27T33WD8qRpzDrF8JLTohyJ2RX6keV3/7iO4j1YZVv7DTTn/fZyi3vt97rBzanJ+jYMw+SmT2WdBI82MzoNrlzwcz0g5NiLv+GqfpPlY5XOxSPswolI8bpmLFhfm1pmaEvKKULIOwbdtRfQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcQ4HGxM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcQ4HGxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733804260; x=1765340260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVJScvi+g75eL5iul3/b+9lgMoBNmImtcJoxsezvw9E=;
  b=JcQ4HGxMSs9s5aOwU825oEBhTOImMnR00izHZkiajJlgxFPNUMOiJ5M+
   Ipc8Lsq1p3DAEYUL/aGWoYZc1ixaDCkeW7uTSG0jtDn/lT0FCbZDUdS1o
   JPpj/yOOLyNWs0toEi3hNPWA796yqaIvbz4+fCZOkFs04xSJDh4SoIceA
   0Fil/EGwSBUPOLXczhtOkE3gdy0e16PXuNiPr5tDwHwJCeg45dpVkH88G
   6aMnc1ugI7zWELrrFQHQY4drHj1DQGpkGQP56rFe0C5mnyAm/hsJGO9KY
   u68+/PYYdukq0Q4u7f2u8bg0vAG2VgZQKNxV6CXLhfP3S7XrE1uu64pSf
   w==;
X-CSE-ConnectionGUID: r/7puVPTTXK56QL5X5RyKQ==
X-CSE-MsgGUID: 1CyqFnpyQuKf14ZgbddMuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37916018"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="37916018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 20:17:40 -0800
X-CSE-ConnectionGUID: /HvlmZqhRx+v15ThTXrNtQ==
X-CSE-MsgGUID: RiNmzsiXREuw6r+jidIadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100095334"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2024 20:17:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKrgm-000569-1e;
	Tue, 10 Dec 2024 04:17:36 +0000
Date: Tue, 10 Dec 2024 12:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 10/10] iio: accel: adxl345: add FIFO with watermark
 events
Message-ID: <202412101132.Kj6R6i3h-lkp@intel.com>
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
In-Reply-To: <20241205171343.308963-11-l.rubusch@gmail.com>
References: <20241205171343.308963-11-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: lars@metafoo.de
TO: Michael.Hennerich@analog.com
TO: jic23@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: eraretuya@gmail.com
CC: l.rubusch@gmail.com

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.13-rc2 next-20241209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/iio-accel-adxl345-refrase-comment-on-probe/20241206-011802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241205171343.308963-11-l.rubusch%40gmail.com
patch subject: [PATCH v5 10/10] iio: accel: adxl345: add FIFO with watermark events
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101132.Kj6R6i3h-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412101132.Kj6R6i3h-lkp@intel.com/

smatch warnings:
drivers/iio/accel/adxl345_core.c:321 adxl345_fifo_transfer() error: uninitialized symbol 'ret'.
drivers/iio/accel/adxl345_core.c:441 adxl345_event_handler() warn: unsigned 'int_stat' is never less than zero.

vim +/ret +321 drivers/iio/accel/adxl345_core.c

55d2386488598bb Lothar Rubusch 2024-12-05  296  
55d2386488598bb Lothar Rubusch 2024-12-05  297  /**
55d2386488598bb Lothar Rubusch 2024-12-05  298   * adxl345_fifo_transfer() - Read samples number of elements.
55d2386488598bb Lothar Rubusch 2024-12-05  299   * @st: The instance of the state object of this sensor.
55d2386488598bb Lothar Rubusch 2024-12-05  300   * @samples: The number of lines in the FIFO referred to as fifo_entry,
55d2386488598bb Lothar Rubusch 2024-12-05  301   * a fifo_entry has 3 elements for X, Y and Z direction of 2 bytes each.
55d2386488598bb Lothar Rubusch 2024-12-05  302   *
55d2386488598bb Lothar Rubusch 2024-12-05  303   * It is recommended that a multiple-byte read of all registers be performed to
55d2386488598bb Lothar Rubusch 2024-12-05  304   * prevent a change in data between reads of sequential registers. That is to
55d2386488598bb Lothar Rubusch 2024-12-05  305   * read out the data registers X0, X1, Y0, Y1, Z0, Z1 at once.
55d2386488598bb Lothar Rubusch 2024-12-05  306   *
55d2386488598bb Lothar Rubusch 2024-12-05  307   * Return: 0 or error value.
55d2386488598bb Lothar Rubusch 2024-12-05  308   */
55d2386488598bb Lothar Rubusch 2024-12-05  309  static int adxl345_fifo_transfer(struct adxl345_state *st, int samples)
55d2386488598bb Lothar Rubusch 2024-12-05  310  {
55d2386488598bb Lothar Rubusch 2024-12-05  311  	size_t count;
55d2386488598bb Lothar Rubusch 2024-12-05  312  	int i, ret;
55d2386488598bb Lothar Rubusch 2024-12-05  313  
55d2386488598bb Lothar Rubusch 2024-12-05  314  	count = sizeof(st->fifo_buf[0]) * ADXL345_DIRS;
55d2386488598bb Lothar Rubusch 2024-12-05  315  	for (i = 0; i < samples; i++) {
55d2386488598bb Lothar Rubusch 2024-12-05  316  		ret = regmap_noinc_read(st->regmap, ADXL345_REG_XYZ_BASE,
55d2386488598bb Lothar Rubusch 2024-12-05  317  				st->fifo_buf + (i * count / 2), count);
55d2386488598bb Lothar Rubusch 2024-12-05  318  		if (ret < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  319  			return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  320  	}
55d2386488598bb Lothar Rubusch 2024-12-05 @321  	return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  322  }
55d2386488598bb Lothar Rubusch 2024-12-05  323  
55d2386488598bb Lothar Rubusch 2024-12-05  324  /**
55d2386488598bb Lothar Rubusch 2024-12-05  325   * adxl345_fifo_reset() - Empty the FIFO in error condition.
55d2386488598bb Lothar Rubusch 2024-12-05  326   * @st: The instance to the state object of the sensor.
55d2386488598bb Lothar Rubusch 2024-12-05  327   *
55d2386488598bb Lothar Rubusch 2024-12-05  328   * Read all elements of the FIFO. Reading the interrupt source register
55d2386488598bb Lothar Rubusch 2024-12-05  329   * resets the sensor.
55d2386488598bb Lothar Rubusch 2024-12-05  330   */
55d2386488598bb Lothar Rubusch 2024-12-05  331  static void adxl345_fifo_reset(struct adxl345_state *st)
55d2386488598bb Lothar Rubusch 2024-12-05  332  {
55d2386488598bb Lothar Rubusch 2024-12-05  333  	int regval;
55d2386488598bb Lothar Rubusch 2024-12-05  334  	int samples;
55d2386488598bb Lothar Rubusch 2024-12-05  335  
55d2386488598bb Lothar Rubusch 2024-12-05  336  	adxl345_set_measure_en(st, false);
55d2386488598bb Lothar Rubusch 2024-12-05  337  
55d2386488598bb Lothar Rubusch 2024-12-05  338  	samples = adxl345_get_samples(st);
55d2386488598bb Lothar Rubusch 2024-12-05  339  	if (samples > 0)
55d2386488598bb Lothar Rubusch 2024-12-05  340  		adxl345_fifo_transfer(st, samples);
55d2386488598bb Lothar Rubusch 2024-12-05  341  
55d2386488598bb Lothar Rubusch 2024-12-05  342  	regmap_read(st->regmap, ADXL345_REG_INT_SOURCE, &regval);
55d2386488598bb Lothar Rubusch 2024-12-05  343  
55d2386488598bb Lothar Rubusch 2024-12-05  344  	adxl345_set_measure_en(st, true);
55d2386488598bb Lothar Rubusch 2024-12-05  345  }
55d2386488598bb Lothar Rubusch 2024-12-05  346  
55d2386488598bb Lothar Rubusch 2024-12-05  347  static int adxl345_buffer_postenable(struct iio_dev *indio_dev)
55d2386488598bb Lothar Rubusch 2024-12-05  348  {
55d2386488598bb Lothar Rubusch 2024-12-05  349  	struct adxl345_state *st = iio_priv(indio_dev);
55d2386488598bb Lothar Rubusch 2024-12-05  350  	int ret;
55d2386488598bb Lothar Rubusch 2024-12-05  351  
55d2386488598bb Lothar Rubusch 2024-12-05  352  	ret = adxl345_set_interrupts(st);
55d2386488598bb Lothar Rubusch 2024-12-05  353  	if (ret < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  354  		return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  355  
55d2386488598bb Lothar Rubusch 2024-12-05  356  	st->fifo_mode = ADXL345_FIFO_STREAM;
55d2386488598bb Lothar Rubusch 2024-12-05  357  	return adxl345_set_fifo(st);
55d2386488598bb Lothar Rubusch 2024-12-05  358  }
55d2386488598bb Lothar Rubusch 2024-12-05  359  
55d2386488598bb Lothar Rubusch 2024-12-05  360  static int adxl345_buffer_predisable(struct iio_dev *indio_dev)
55d2386488598bb Lothar Rubusch 2024-12-05  361  {
55d2386488598bb Lothar Rubusch 2024-12-05  362  	struct adxl345_state *st = iio_priv(indio_dev);
55d2386488598bb Lothar Rubusch 2024-12-05  363  	int ret;
55d2386488598bb Lothar Rubusch 2024-12-05  364  
55d2386488598bb Lothar Rubusch 2024-12-05  365  	st->int_map = 0x00;
55d2386488598bb Lothar Rubusch 2024-12-05  366  
55d2386488598bb Lothar Rubusch 2024-12-05  367  	ret = adxl345_set_interrupts(st);
55d2386488598bb Lothar Rubusch 2024-12-05  368  	if (ret < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  369  		return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  370  
55d2386488598bb Lothar Rubusch 2024-12-05  371  	st->fifo_mode = ADXL345_FIFO_BYPASS;
55d2386488598bb Lothar Rubusch 2024-12-05  372  	return adxl345_set_fifo(st);
55d2386488598bb Lothar Rubusch 2024-12-05  373  }
55d2386488598bb Lothar Rubusch 2024-12-05  374  
55d2386488598bb Lothar Rubusch 2024-12-05  375  static const struct iio_buffer_setup_ops adxl345_buffer_ops = {
55d2386488598bb Lothar Rubusch 2024-12-05  376  	.postenable = adxl345_buffer_postenable,
55d2386488598bb Lothar Rubusch 2024-12-05  377  	.predisable = adxl345_buffer_predisable,
55d2386488598bb Lothar Rubusch 2024-12-05  378  };
55d2386488598bb Lothar Rubusch 2024-12-05  379  
55d2386488598bb Lothar Rubusch 2024-12-05  380  static int adxl345_get_status(struct adxl345_state *st)
55d2386488598bb Lothar Rubusch 2024-12-05  381  {
55d2386488598bb Lothar Rubusch 2024-12-05  382  	int ret;
55d2386488598bb Lothar Rubusch 2024-12-05  383  	unsigned int regval;
55d2386488598bb Lothar Rubusch 2024-12-05  384  
55d2386488598bb Lothar Rubusch 2024-12-05  385  	ret = regmap_read(st->regmap, ADXL345_REG_INT_SOURCE, &regval);
55d2386488598bb Lothar Rubusch 2024-12-05  386  	if (ret < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  387  		return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  388  
55d2386488598bb Lothar Rubusch 2024-12-05  389  	return (0xff & regval);
55d2386488598bb Lothar Rubusch 2024-12-05  390  }
55d2386488598bb Lothar Rubusch 2024-12-05  391  
55d2386488598bb Lothar Rubusch 2024-12-05  392  static int adxl345_fifo_push(struct iio_dev *indio_dev,
55d2386488598bb Lothar Rubusch 2024-12-05  393  				  int samples)
55d2386488598bb Lothar Rubusch 2024-12-05  394  {
55d2386488598bb Lothar Rubusch 2024-12-05  395  	struct adxl345_state *st = iio_priv(indio_dev);
55d2386488598bb Lothar Rubusch 2024-12-05  396  	int i, ret;
55d2386488598bb Lothar Rubusch 2024-12-05  397  
55d2386488598bb Lothar Rubusch 2024-12-05  398  	if (samples <= 0)
55d2386488598bb Lothar Rubusch 2024-12-05  399  		return -EINVAL;
55d2386488598bb Lothar Rubusch 2024-12-05  400  
55d2386488598bb Lothar Rubusch 2024-12-05  401  	ret = adxl345_fifo_transfer(st, samples);
55d2386488598bb Lothar Rubusch 2024-12-05  402  	if (ret)
55d2386488598bb Lothar Rubusch 2024-12-05  403  		return ret;
55d2386488598bb Lothar Rubusch 2024-12-05  404  
55d2386488598bb Lothar Rubusch 2024-12-05  405  	for (i = 0; i < ADXL345_DIRS * samples; i += ADXL345_DIRS) {
55d2386488598bb Lothar Rubusch 2024-12-05  406  		/*
55d2386488598bb Lothar Rubusch 2024-12-05  407  		 * To ensure that the FIFO has completely popped, there must be at least 5
55d2386488598bb Lothar Rubusch 2024-12-05  408  		 * us between the end of reading the data registers, signified by the
55d2386488598bb Lothar Rubusch 2024-12-05  409  		 * transition to register 0x38 from 0x37 or the CS pin going high, and the
55d2386488598bb Lothar Rubusch 2024-12-05  410  		 * start of new reads of the FIFO or reading the FIFO_STATUS register. For
55d2386488598bb Lothar Rubusch 2024-12-05  411  		 * SPI operation at 1.5 MHz or lower, the register addressing portion of the
55d2386488598bb Lothar Rubusch 2024-12-05  412  		 * transmission is sufficient delay to ensure the FIFO has completely
55d2386488598bb Lothar Rubusch 2024-12-05  413  		 * popped. It is necessary for SPI operation greater than 1.5 MHz to
55d2386488598bb Lothar Rubusch 2024-12-05  414  		 * de-assert the CS pin to ensure a total of 5 us, which is at most 3.4 us
55d2386488598bb Lothar Rubusch 2024-12-05  415  		 * at 5 MHz operation.
55d2386488598bb Lothar Rubusch 2024-12-05  416  		 */
55d2386488598bb Lothar Rubusch 2024-12-05  417  		if (st->fifo_delay && (samples > 1))
55d2386488598bb Lothar Rubusch 2024-12-05  418  			udelay(3);
55d2386488598bb Lothar Rubusch 2024-12-05  419  
55d2386488598bb Lothar Rubusch 2024-12-05  420  		iio_push_to_buffers(indio_dev, &st->fifo_buf[i]);
55d2386488598bb Lothar Rubusch 2024-12-05  421  	}
55d2386488598bb Lothar Rubusch 2024-12-05  422  
55d2386488598bb Lothar Rubusch 2024-12-05  423  	return 0;
55d2386488598bb Lothar Rubusch 2024-12-05  424  }
55d2386488598bb Lothar Rubusch 2024-12-05  425  
55d2386488598bb Lothar Rubusch 2024-12-05  426  /**
55d2386488598bb Lothar Rubusch 2024-12-05  427   * adxl345_event_handler() - Handle events of the ADXL345.
55d2386488598bb Lothar Rubusch 2024-12-05  428   * @irq: The irq being handled.
55d2386488598bb Lothar Rubusch 2024-12-05  429   * @p: The struct iio_device pointer for the device.
55d2386488598bb Lothar Rubusch 2024-12-05  430   *
55d2386488598bb Lothar Rubusch 2024-12-05  431   * Return: The interrupt was handled.
55d2386488598bb Lothar Rubusch 2024-12-05  432   */
55d2386488598bb Lothar Rubusch 2024-12-05  433  static irqreturn_t adxl345_event_handler(int irq, void *p)
55d2386488598bb Lothar Rubusch 2024-12-05  434  {
55d2386488598bb Lothar Rubusch 2024-12-05  435  	struct iio_dev *indio_dev = p;
55d2386488598bb Lothar Rubusch 2024-12-05  436  	struct adxl345_state *st = iio_priv(indio_dev);
55d2386488598bb Lothar Rubusch 2024-12-05  437  	u8 int_stat;
55d2386488598bb Lothar Rubusch 2024-12-05  438  	int samples;
55d2386488598bb Lothar Rubusch 2024-12-05  439  
55d2386488598bb Lothar Rubusch 2024-12-05  440  	int_stat = adxl345_get_status(st);
55d2386488598bb Lothar Rubusch 2024-12-05 @441  	if (int_stat < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  442  		return IRQ_NONE;
55d2386488598bb Lothar Rubusch 2024-12-05  443  
55d2386488598bb Lothar Rubusch 2024-12-05  444  	if (int_stat == 0x0)
55d2386488598bb Lothar Rubusch 2024-12-05  445  		goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  446  
55d2386488598bb Lothar Rubusch 2024-12-05  447  	if (int_stat & ADXL345_INT_OVERRUN)
55d2386488598bb Lothar Rubusch 2024-12-05  448  		goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  449  
55d2386488598bb Lothar Rubusch 2024-12-05  450  	if (int_stat & (ADXL345_INT_DATA_READY | ADXL345_INT_WATERMARK)) {
55d2386488598bb Lothar Rubusch 2024-12-05  451  		samples = adxl345_get_samples(st);
55d2386488598bb Lothar Rubusch 2024-12-05  452  		if (samples < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  453  			goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  454  
55d2386488598bb Lothar Rubusch 2024-12-05  455  		if (adxl345_fifo_push(indio_dev, samples) < 0)
55d2386488598bb Lothar Rubusch 2024-12-05  456  			goto err;
55d2386488598bb Lothar Rubusch 2024-12-05  457  
55d2386488598bb Lothar Rubusch 2024-12-05  458  	}
55d2386488598bb Lothar Rubusch 2024-12-05  459  	return IRQ_HANDLED;
55d2386488598bb Lothar Rubusch 2024-12-05  460  
55d2386488598bb Lothar Rubusch 2024-12-05  461  err:
55d2386488598bb Lothar Rubusch 2024-12-05  462  	adxl345_fifo_reset(st);
55d2386488598bb Lothar Rubusch 2024-12-05  463  
55d2386488598bb Lothar Rubusch 2024-12-05  464  	return IRQ_HANDLED;
55d2386488598bb Lothar Rubusch 2024-12-05  465  }
55d2386488598bb Lothar Rubusch 2024-12-05  466  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
