Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0052ED843
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586003; cv=none; b=F6Up53+RJ2KOkcnBGzWVotOXngXz0+CgGqE8mOfyNMXVsKTEX1oOzVjQfefQ8U5U+h4ZEy8bDvqRlCIJVwhH+TDLlzB6VABdX8AYxivM3tQJXhPWutlu/9WOwydllHQpNEJiUK4ZUBiaNqETlpQNNRMF0uvtxLhdRq/jjBY477I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586003; c=relaxed/simple;
	bh=LglxTPmXFe9NuLTQ/Ex3rJ90iYl4epGbkC6y82CMJv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ITZ848JBCweig8O7PUAx4YgkowIbkUf27zJfri5uGDfu9xOPtlydtjMWatMJEw3ESCPINemHXMH9Dbd8p+yw4ZGR8vTOZxx4a28oCbELjt3IaMg20MSZnKYLwYU+nzTz2sG0Q2Nvy3lSMZbTAW8jO11uBeaa6RDq55wZAm/TyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHppGz0H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHppGz0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777586002; x=1809122002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LglxTPmXFe9NuLTQ/Ex3rJ90iYl4epGbkC6y82CMJv4=;
  b=dHppGz0HKCGFgAZ26QjXKyeLfnsnwRzNdQ1ffbyrDEl56F5QMbXnFvgJ
   UcMkFtiJ6m+nDYLPAUGNqrRWCop5mKa6Z/f+BzCmeU7zJktFnpFm5ml2G
   DbzJwJoTfvrDv8FEfigdcj20PZ6jvdLqzTj1LVtjaHUsv0693BnoIFc2t
   xFM+JBlPtBx8jP9KIU/YWGwvZfLdCvrQMcdaYgJcRCjFEpTwTiLKI9ymY
   v6VYX0WN1BHGjb5KijAqXwp0AM+ueYSgTuk3iQXKBpL37UO8PaRig7QeY
   O3h/T8+X1zFZDZ6DB17xM9/R4k/0spVjxgC4IonGZjpWEtuF8hH/bSeZm
   g==;
X-CSE-ConnectionGUID: 3wY7VfAMR4acQDZ041eBuA==
X-CSE-MsgGUID: vIkPfZpWSYyH5HJZCdjOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82407826"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82407826"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 14:53:21 -0700
X-CSE-ConnectionGUID: FeXnV1XgQSuiNaFSaKzM4Q==
X-CSE-MsgGUID: RAu/ZnsQTsunAzzqGnNkHA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2026 14:53:19 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIZJt-00000000D08-0vKR;
	Thu, 30 Apr 2026 21:53:17 +0000
Date: Fri, 1 May 2026 05:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] bitfield: wire __bf_shf to __builtin_ctzll
Message-ID: <202605010505.v5SNy2xv-lkp@intel.com>
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
In-Reply-To: <20260427225705.418802-1-ynorov@nvidia.com>
References: <20260427225705.418802-1-ynorov@nvidia.com>
TO: Yury Norov <ynorov@nvidia.com>
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
CC: Frank Binns <frank.binns@imgtec.com>
CC: Alessio Belle <alessio.belle@imgtec.com>
CC: Brajesh Gupta <brajesh.gupta@imgtec.com>
CC: Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: Vincent Mailhol <mailhol@kernel.org>
CC: Matt Coster <matt.coster@imgtec.com>

Hi Yury,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitfield-wire-__bf_shf-to-__builtin_ctzll/20260428-114754
base:   linus/master
patch link:    https://lore.kernel.org/r/20260427225705.418802-1-ynorov%40nvidia.com
patch subject: [PATCH] bitfield: wire __bf_shf to __builtin_ctzll
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r072-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010505.v5SNy2xv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605010505.v5SNy2xv-lkp@intel.com/

New smatch warnings:
drivers/iio/pressure/rohm-bm1390.c:386 __bm1390_fifo_flush() error: buffer overflow 'buffer' 4 <= 2147483646

Old smatch warnings:
drivers/iio/pressure/rohm-bm1390.c:401 __bm1390_fifo_flush() error: buffer overflow 'buffer' 4 <= 2147483646
drivers/iio/pressure/rohm-bm1390.c:419 __bm1390_fifo_flush() error: buffer overflow 'buffer' 4 <= 2147483646
drivers/iio/pressure/rohm-bm1390.c:420 __bm1390_fifo_flush() error: buffer overflow 'buffer' 4 <= 2147483646

vim +/buffer +386 drivers/iio/pressure/rohm-bm1390.c

81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  335  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  336  static int __bm1390_fifo_flush(struct iio_dev *idev, unsigned int samples,
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  337  			       s64 timestamp)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  338  {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  339  	/* BM1390_FIFO_LENGTH is small so we shouldn't run out of stack */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  340  	struct bm1390_data_buf buffer[BM1390_FIFO_LENGTH];
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  341  	struct bm1390_data *data = iio_priv(idev);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  342  	int smp_lvl, ret, i, warn, dummy;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  343  	u64 sample_period;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  344  	__be16 temp = 0;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  345  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  346  	ret = regmap_read(data->regmap, BM1390_REG_FIFO_LVL, &smp_lvl);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  347  	if (ret)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  348  		return ret;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  349  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  350  	smp_lvl = FIELD_GET(BM1390_MASK_FIFO_LVL, smp_lvl);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  351  	if (!smp_lvl)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  352  		return 0;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  353  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  354  	if (smp_lvl > BM1390_FIFO_LENGTH) {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  355  		/*
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  356  		 * The fifo holds maximum of 4 samples so valid values
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  357  		 * should be 0, 1, 2, 3, 4 - rest are probably bit errors
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  358  		 * in I2C line. Don't overflow if this happens.
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  359  		 */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  360  		dev_err(data->dev, "bad FIFO level %d\n", smp_lvl);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  361  		smp_lvl = BM1390_FIFO_LENGTH;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  362  	}
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  363  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  364  	sample_period = timestamp - data->old_timestamp;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  365  	do_div(sample_period, smp_lvl);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  366  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  367  	if (samples && smp_lvl > samples)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  368  		smp_lvl = samples;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  369  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  370  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  371  	/*
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  372  	 * After some testing it appears that the temperature is not readable
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  373  	 * until the FIFO access has been done after the WMI. Thus, we need
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  374  	 * to read the all pressure values to memory and read the temperature
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  375  	 * only after that.
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  376  	 */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  377  	for (i = 0; i < smp_lvl; i++) {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  378  		/*
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  379  		 * When we start reading data from the FIFO the sensor goes to
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  380  		 * special FIFO reading mode. If any other register is accessed
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  381  		 * during the FIFO read, samples can be dropped. Prevent access
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  382  		 * until FIFO_LVL is read. We have mutex locked and we do also
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  383  		 * go performing reading of FIFO_LVL even if this read fails.
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  384  		 */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  385  		if (test_bit(BM1390_CHAN_PRESSURE, idev->active_scan_mask)) {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27 @386  			ret = bm1390_pressure_read(data, &buffer[i].pressure);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  387  			if (ret)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  388  				break;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  389  		}
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  390  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  391  		/*
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  392  		 * Old timestamp is either the previous sample IRQ time,
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  393  		 * previous flush-time or, if this was first sample, the enable
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  394  		 * time. When we add a sample period to that we should get the
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  395  		 * best approximation of the time-stamp we are handling.
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  396  		 *
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  397  		 * Idea is to always keep the "old_timestamp" matching the
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  398  		 * timestamp which we are currently handling.
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  399  		 */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  400  		data->old_timestamp += sample_period;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  401  		buffer[i].ts = data->old_timestamp;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  402  	}
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  403  	/* Reading the FIFO_LVL closes the FIFO access sequence */
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  404  	warn = regmap_read(data->regmap, BM1390_REG_FIFO_LVL, &dummy);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  405  	if (warn)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  406  		dev_warn(data->dev, "Closing FIFO sequence failed\n");
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  407  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  408  	if (ret)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  409  		return ret;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  410  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  411  	if (test_bit(BM1390_CHAN_TEMP, idev->active_scan_mask)) {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  412  		ret = regmap_bulk_read(data->regmap, BM1390_REG_TEMP_HI, &temp,
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  413  				       sizeof(temp));
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  414  		if (ret)
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  415  			return ret;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  416  	}
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  417  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  418  	for (i = 0; i < smp_lvl; i++) {
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  419  		buffer[i].temp = temp;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  420  		iio_push_to_buffers(idev, &buffer[i]);
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  421  	}
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  422  
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  423  	return smp_lvl;
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  424  }
81ca5979b6ed9a2 Matti Vaittinen 2023-09-27  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
