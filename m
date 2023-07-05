Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F745231
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688559660; x=1720095660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1GpayeM7X0rXiO7pwoerx6L2fEVGABEeP8YD1Vpm2s=;
  b=ITens2skSikfOGsRmU2L0XwwDufAhuEOMXPTQeb4wU7CB7sjg1+L9ld4
   tZvH0M3Lvlcld1aR6GZL1seQv47a33qr6hjrNpomYuTVItXZpYpJEi5x0
   sisk7ZBaH44MKLBS8TdgpvydfhpUEmqgd4xQYe9n1GMr9311cS7dWOrgt
   CUJ2LbFysygmzv9YD8M4GojtJYdnNNESkQGuN0Y2bwzs5RhxZMJR+7QhK
   sisSksgI1QZLBcluoLortUPC4I2e3VnooM9HVdoCh+O0oXXE8++5ofLda
   gCfO4PryoHNM3Os8FWjZAw6G1/L7dzyw7El4U8UnTxvnNH1YE2F/Jfscm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="363355933"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="363355933"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 05:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696432950"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="696432950"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jul 2023 05:20:57 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH1VB-0000cs-0I;
	Wed, 05 Jul 2023 12:20:57 +0000
Date: Wed, 5 Jul 2023 20:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] iio: chemical: scd4x: Add pressure compensation
Message-ID: <202307052018.7DV5CAOH-lkp@intel.com>
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
In-Reply-To: <20230704084706.370637-1-roan@protonic.nl>
References: <20230704084706.370637-1-roan@protonic.nl>
TO: Roan van Dijk <roan@protonic.nl>
TO: jic23@kernel.org
CC: lars@metafoo.de
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: roan@protonic.nl

Hi Roan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.4 next-20230705]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roan-van-Dijk/iio-chemical-scd4x-Add-pressure-compensation/20230704-170621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20230704084706.370637-1-roan%40protonic.nl
patch subject: [PATCH] iio: chemical: scd4x: Add pressure compensation
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-m001-20230705 (https://download.01.org/0day-ci/archive/20230705/202307052018.7DV5CAOH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307052018.7DV5CAOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307052018.7DV5CAOH-lkp@intel.com/

smatch warnings:
drivers/iio/chemical/scd4x.c:385 scd4x_read_raw() error: uninitialized symbol 'ret'.
drivers/iio/chemical/scd4x.c:388 scd4x_read_raw() error: uninitialized symbol 'tmp'.

vim +/ret +385 drivers/iio/chemical/scd4x.c

49d22b695cbb69 Roan van Dijk 2021-10-08  334  
49d22b695cbb69 Roan van Dijk 2021-10-08  335  static int scd4x_read_raw(struct iio_dev *indio_dev,
49d22b695cbb69 Roan van Dijk 2021-10-08  336  			struct iio_chan_spec const *chan, int *val,
49d22b695cbb69 Roan van Dijk 2021-10-08  337  			int *val2, long mask)
49d22b695cbb69 Roan van Dijk 2021-10-08  338  {
49d22b695cbb69 Roan van Dijk 2021-10-08  339  	struct scd4x_state *state = iio_priv(indio_dev);
49d22b695cbb69 Roan van Dijk 2021-10-08  340  	int ret;
49d22b695cbb69 Roan van Dijk 2021-10-08  341  	__be16 tmp;
49d22b695cbb69 Roan van Dijk 2021-10-08  342  
49d22b695cbb69 Roan van Dijk 2021-10-08  343  	switch (mask) {
49d22b695cbb69 Roan van Dijk 2021-10-08  344  	case IIO_CHAN_INFO_RAW:
49d22b695cbb69 Roan van Dijk 2021-10-08  345  		ret = iio_device_claim_direct_mode(indio_dev);
49d22b695cbb69 Roan van Dijk 2021-10-08  346  		if (ret)
49d22b695cbb69 Roan van Dijk 2021-10-08  347  			return ret;
49d22b695cbb69 Roan van Dijk 2021-10-08  348  
49d22b695cbb69 Roan van Dijk 2021-10-08  349  		mutex_lock(&state->lock);
49d22b695cbb69 Roan van Dijk 2021-10-08  350  		ret = scd4x_read_channel(state, chan->address);
49d22b695cbb69 Roan van Dijk 2021-10-08  351  		mutex_unlock(&state->lock);
49d22b695cbb69 Roan van Dijk 2021-10-08  352  
49d22b695cbb69 Roan van Dijk 2021-10-08  353  		iio_device_release_direct_mode(indio_dev);
49d22b695cbb69 Roan van Dijk 2021-10-08  354  		if (ret < 0)
49d22b695cbb69 Roan van Dijk 2021-10-08  355  			return ret;
49d22b695cbb69 Roan van Dijk 2021-10-08  356  
49d22b695cbb69 Roan van Dijk 2021-10-08  357  		*val = ret;
49d22b695cbb69 Roan van Dijk 2021-10-08  358  		return IIO_VAL_INT;
49d22b695cbb69 Roan van Dijk 2021-10-08  359  	case IIO_CHAN_INFO_SCALE:
e46e2512ac84bd Roan van Dijk 2021-10-21  360  		if (chan->type == IIO_CONCENTRATION) {
e46e2512ac84bd Roan van Dijk 2021-10-21  361  			*val = 0;
e46e2512ac84bd Roan van Dijk 2021-10-21  362  			*val2 = 100;
e46e2512ac84bd Roan van Dijk 2021-10-21  363  			return IIO_VAL_INT_PLUS_MICRO;
e46e2512ac84bd Roan van Dijk 2021-10-21  364  		} else if (chan->type == IIO_TEMP) {
49d22b695cbb69 Roan van Dijk 2021-10-08  365  			*val = 175000;
49d22b695cbb69 Roan van Dijk 2021-10-08  366  			*val2 = 65536;
49d22b695cbb69 Roan van Dijk 2021-10-08  367  			return IIO_VAL_FRACTIONAL;
49d22b695cbb69 Roan van Dijk 2021-10-08  368  		} else if (chan->type == IIO_HUMIDITYRELATIVE) {
49d22b695cbb69 Roan van Dijk 2021-10-08  369  			*val = 100000;
49d22b695cbb69 Roan van Dijk 2021-10-08  370  			*val2 = 65536;
49d22b695cbb69 Roan van Dijk 2021-10-08  371  			return IIO_VAL_FRACTIONAL;
49d22b695cbb69 Roan van Dijk 2021-10-08  372  		}
49d22b695cbb69 Roan van Dijk 2021-10-08  373  		return -EINVAL;
49d22b695cbb69 Roan van Dijk 2021-10-08  374  	case IIO_CHAN_INFO_OFFSET:
49d22b695cbb69 Roan van Dijk 2021-10-08  375  		*val = -16852;
49d22b695cbb69 Roan van Dijk 2021-10-08  376  		*val2 = 114286;
49d22b695cbb69 Roan van Dijk 2021-10-08  377  		return IIO_VAL_INT_PLUS_MICRO;
49d22b695cbb69 Roan van Dijk 2021-10-08  378  	case IIO_CHAN_INFO_CALIBBIAS:
49d22b695cbb69 Roan van Dijk 2021-10-08  379  		mutex_lock(&state->lock);
8e4a309948cffe Roan van Dijk 2023-07-04  380  		if (chan->type == IIO_TEMP)
49d22b695cbb69 Roan van Dijk 2021-10-08  381  			ret = scd4x_read(state, CMD_GET_TEMP_OFFSET, &tmp, sizeof(tmp));
8e4a309948cffe Roan van Dijk 2023-07-04  382  		else if (chan->type == IIO_PRESSURE)
8e4a309948cffe Roan van Dijk 2023-07-04  383  			ret = scd4x_read(state, CMD_GET_AMB_PRESSURE, &tmp, sizeof(tmp));
49d22b695cbb69 Roan van Dijk 2021-10-08  384  		mutex_unlock(&state->lock);
49d22b695cbb69 Roan van Dijk 2021-10-08 @385  		if (ret)
49d22b695cbb69 Roan van Dijk 2021-10-08  386  			return ret;
49d22b695cbb69 Roan van Dijk 2021-10-08  387  
49d22b695cbb69 Roan van Dijk 2021-10-08 @388  		*val = be16_to_cpu(tmp);
49d22b695cbb69 Roan van Dijk 2021-10-08  389  
49d22b695cbb69 Roan van Dijk 2021-10-08  390  		return IIO_VAL_INT;
49d22b695cbb69 Roan van Dijk 2021-10-08  391  	default:
49d22b695cbb69 Roan van Dijk 2021-10-08  392  		return -EINVAL;
49d22b695cbb69 Roan van Dijk 2021-10-08  393  	}
49d22b695cbb69 Roan van Dijk 2021-10-08  394  }
49d22b695cbb69 Roan van Dijk 2021-10-08  395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
