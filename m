Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD68155738
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724494203; cv=none; b=i7OXKte9kK25xp1LZFggeGmHvCVli2ymnjGgDopImey/R9RtprM3WSjhZ7DivCUPoCjHGH83gC11DMqKy2GXgElk0Ylec3BLIBUffJL3taDCaKCC0FOdZDY6gKjliLUYL5QsJasWTp4gCvds2KwJoYaWmPzpUMVCNCSqWSSSrPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724494203; c=relaxed/simple;
	bh=T7jeO59YzVsx1iGUGMpMj636ajcrWbQvzFKdYv1Nos4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlGi2YONgT4EgM9lXwL9fRDyj6aIe56chIrAYhPwfUkUFHKzSV0BF1G9szq+1F1LXn//NDzQkEpjgFoQ4YLEv/yO2QRqkHvaFkKGERYUXVvrOlAMzn1wHAHXc5Amh+2ngE2/HVmwQmDmb3YnoQUtci45bVAyxv2QZ4gQyQ48XPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bvo2m8GP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bvo2m8GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724494201; x=1756030201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T7jeO59YzVsx1iGUGMpMj636ajcrWbQvzFKdYv1Nos4=;
  b=Bvo2m8GPPQjsXzjQHNcXQX3MxN1DLpZ6aVWn9xZ/GWKW4dsBAvzCbQUE
   Ko1BbwPewCXBeuoKsDPVtLgfEuqx4xaoVD0Q4Auwojan6s0W+JpU7wIvg
   ua+nEDyTuayrhiDL+4FTEeyFqH3ME1+r0qNhTyiQ/aJHw/xlg3C1lTBD+
   jiw6r+UCvIjTwRbaNGHFXTWx1EPpHbiuw8pgpN3rkkiPYu+POO2g/J9cr
   s74mRBTxsrwIUL4JyJduQ9oApu7dC8FU0UJcmKu+c0p9kbYBAKLJfB2K2
   OSYb/pkBSIDjgKp0V0hhGVhJzhPmZVrxMyrMeymFikwwqi1q05Qj3KCuC
   g==;
X-CSE-ConnectionGUID: sBaes9czR0yJSE1bQyUpMw==
X-CSE-MsgGUID: x++2XYvzTne6LN9tEOm3QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26768116"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="26768116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 03:10:01 -0700
X-CSE-ConnectionGUID: T+pUI7v+TES9YCS/jDFL3Q==
X-CSE-MsgGUID: 2bDxIQ7oQ+C51t1F+SgmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="61893986"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2024 03:10:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shniX-000EP1-1o;
	Sat, 24 Aug 2024 10:09:57 +0000
Date: Sat, 24 Aug 2024 18:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] iio: imu: smi240: imu driver
Message-ID: <202408241748.uhnv8MWU-lkp@intel.com>
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
In-Reply-To: <20240815152545.7705-3-Jianping.Shen@de.bosch.com>
References: <20240815152545.7705-3-Jianping.Shen@de.bosch.com>
TO: Jianping.Shen@de.bosch.com
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dima.fedrau@gmail.com
TO: marcelo.schmitt1@gmail.com
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Jianping.Shen@de.bosch.com
TO: Christian.Lorenz3@de.bosch.com
TO: Ulrike.Frauendorf@de.bosch.com
TO: Kai.Dolde@de.bosch.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianping-Shen-de-bosch-com/dt-bindings-iio-imu-smi240-devicetree-binding/20240815-234739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240815152545.7705-3-Jianping.Shen%40de.bosch.com
patch subject: [PATCH v3 2/2] iio: imu: smi240: imu driver
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: csky-randconfig-r072-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241748.uhnv8MWU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241748.uhnv8MWU-lkp@intel.com/

smatch warnings:
drivers/iio/imu/smi240/smi240_core.c:217 smi240_trigger_handler() error: uninitialized symbol 'ret'.

vim +/ret +217 drivers/iio/imu/smi240/smi240_core.c

c7a602e2256971 Shen Jianping 2024-08-15  197  
c7a602e2256971 Shen Jianping 2024-08-15  198  static irqreturn_t smi240_trigger_handler(int irq, void *p)
c7a602e2256971 Shen Jianping 2024-08-15  199  {
c7a602e2256971 Shen Jianping 2024-08-15  200  	struct iio_poll_func *pf = p;
c7a602e2256971 Shen Jianping 2024-08-15  201  	struct iio_dev *indio_dev = pf->indio_dev;
c7a602e2256971 Shen Jianping 2024-08-15  202  	struct smi240_data *data = iio_priv(indio_dev);
c7a602e2256971 Shen Jianping 2024-08-15  203  	int ret, sample, chan, i = 0;
c7a602e2256971 Shen Jianping 2024-08-15  204  
c7a602e2256971 Shen Jianping 2024-08-15  205  	data->capture = SMI240_CAPTURE_ON;
c7a602e2256971 Shen Jianping 2024-08-15  206  
c7a602e2256971 Shen Jianping 2024-08-15  207  	for_each_set_bit(chan, indio_dev->active_scan_mask,
c7a602e2256971 Shen Jianping 2024-08-15  208  			 indio_dev->masklength) {
c7a602e2256971 Shen Jianping 2024-08-15  209  		ret = regmap_read(data->regmap,
c7a602e2256971 Shen Jianping 2024-08-15  210  				  SMI240_DATA_CAP_FIRST_REG + chan, &sample);
c7a602e2256971 Shen Jianping 2024-08-15  211  		data->capture = SMI240_CAPTURE_OFF;
c7a602e2256971 Shen Jianping 2024-08-15  212  		if (ret)
c7a602e2256971 Shen Jianping 2024-08-15  213  			break;
c7a602e2256971 Shen Jianping 2024-08-15  214  		data->buf[i++] = sample;
c7a602e2256971 Shen Jianping 2024-08-15  215  	}
c7a602e2256971 Shen Jianping 2024-08-15  216  
c7a602e2256971 Shen Jianping 2024-08-15 @217  	if (ret == 0)
c7a602e2256971 Shen Jianping 2024-08-15  218  		iio_push_to_buffers_with_timestamp(indio_dev, data->buf,
c7a602e2256971 Shen Jianping 2024-08-15  219  						   pf->timestamp);
c7a602e2256971 Shen Jianping 2024-08-15  220  
c7a602e2256971 Shen Jianping 2024-08-15  221  	iio_trigger_notify_done(indio_dev->trig);
c7a602e2256971 Shen Jianping 2024-08-15  222  	return IRQ_HANDLED;
c7a602e2256971 Shen Jianping 2024-08-15  223  }
c7a602e2256971 Shen Jianping 2024-08-15  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
