Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDCD278
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Oct 2023 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696328419; x=1727864419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tj9JGr2ePFr8JQky2rNmhi5OzFSwAAqcfiN05kUlI7Q=;
  b=HmPxMcyfu+nUEcYBil1dYev8x+2Ldl3wSbvP92whPos2MwJrP/rR2+2U
   qkns9OgMbt40ZjiXjmInu7iFGjOGQhG+erP5c3pBT2CgH4xoCZs51Ggmx
   J1BLSINqt1tXdSbZo2GuD+HUyJAsyvI1h0xKA6i/QEEvzh0pWGNpr9Lyo
   zZ4u76a7mCWBVvIR8IxmPK2s6BzVW6swl1TqODsO0PCq0VRmEY01wokqw
   gP0xc7DIGSCexhkHABFk1GOWwNynNQegkcy8KTbEwCUGZt8+CT9O2/DVi
   5J5+pldLoGUjZf/fjgQYCzbWfQEU7MDTk7NQr040MPRCdo5zBRnSS2VPS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381721408"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="381721408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 03:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="821196269"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="821196269"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Oct 2023 03:20:15 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qncVi-00071w-0E;
	Tue, 03 Oct 2023 10:20:14 +0000
Date: Tue, 3 Oct 2023 18:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 26/27] staging: iio: resolver: ad2s1210: implement
 fault events
Message-ID: <202310031839.tKR53HoP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-26-fa4364281745@baylibre.com>
TO: David Lechner <dlechner@baylibre.com>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-staging@lists.linux.dev
CC: David Lechner <david@lechnology.com>
CC: Jonathan Cameron <jic23@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Axel Haslam <ahaslam@baylibre.com>
CC: Philip Molloy <pmolloy@baylibre.com>
CC: linux-kernel@vger.kernel.org

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5e99f692d4e32e3250ab18d511894ca797407aec]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/dt-bindings-iio-resolver-add-devicetree-bindings-for-ad2s1210/20230930-014031
base:   5e99f692d4e32e3250ab18d511894ca797407aec
patch link:    https://lore.kernel.org/r/20230929-ad2s1210-mainline-v3-26-fa4364281745%40baylibre.com
patch subject: [PATCH v3 26/27] staging: iio: resolver: ad2s1210: implement fault events
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231003/202310031839.tKR53HoP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310031839.tKR53HoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310031839.tKR53HoP-lkp@intel.com/

smatch warnings:
drivers/staging/iio/resolver/ad2s1210.c:436 ad2s1210_single_conversion() error: buffer overflow 'st->rx' 2 <= 2

vim +436 drivers/staging/iio/resolver/ad2s1210.c

ecf16f4922f691 David Lechner    2023-09-29  390  
ecf16f4922f691 David Lechner    2023-09-29  391  static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
29148543c52146 Jonathan Cameron 2011-10-05  392  				      struct iio_chan_spec const *chan,
e9336a85ceb885 David Lechner    2023-09-29  393  				      int *val)
817e5c65c511d4 Graf Yang        2010-10-27  394  {
ecf16f4922f691 David Lechner    2023-09-29  395  	struct ad2s1210_state *st = iio_priv(indio_dev);
ecf16f4922f691 David Lechner    2023-09-29  396  	s64 timestamp;
69cc7fbdcdf2e3 David Lechner    2023-09-29  397  	int ret;
817e5c65c511d4 Graf Yang        2010-10-27  398  
817e5c65c511d4 Graf Yang        2010-10-27  399  	mutex_lock(&st->lock);
69cc7fbdcdf2e3 David Lechner    2023-09-29  400  	gpiod_set_value(st->sample_gpio, 1);
ecf16f4922f691 David Lechner    2023-09-29  401  	timestamp = iio_get_time_ns(indio_dev);
817e5c65c511d4 Graf Yang        2010-10-27  402  	/* delay (6 * tck + 20) nano seconds */
817e5c65c511d4 Graf Yang        2010-10-27  403  	udelay(1);
817e5c65c511d4 Graf Yang        2010-10-27  404  
29148543c52146 Jonathan Cameron 2011-10-05  405  	switch (chan->type) {
29148543c52146 Jonathan Cameron 2011-10-05  406  	case IIO_ANGL:
69cc7fbdcdf2e3 David Lechner    2023-09-29  407  		ret = ad2s1210_set_mode(st, MOD_POS);
29148543c52146 Jonathan Cameron 2011-10-05  408  		break;
29148543c52146 Jonathan Cameron 2011-10-05  409  	case IIO_ANGL_VEL:
69cc7fbdcdf2e3 David Lechner    2023-09-29  410  		ret = ad2s1210_set_mode(st, MOD_VEL);
29148543c52146 Jonathan Cameron 2011-10-05  411  		break;
29148543c52146 Jonathan Cameron 2011-10-05  412  	default:
29148543c52146 Jonathan Cameron 2011-10-05  413  		ret = -EINVAL;
29148543c52146 Jonathan Cameron 2011-10-05  414  		break;
29148543c52146 Jonathan Cameron 2011-10-05  415  	}
29148543c52146 Jonathan Cameron 2011-10-05  416  	if (ret < 0)
29148543c52146 Jonathan Cameron 2011-10-05  417  		goto error_ret;
ecf16f4922f691 David Lechner    2023-09-29  418  	ret = spi_read(st->sdev, &st->sample, 3);
29148543c52146 Jonathan Cameron 2011-10-05  419  	if (ret < 0)
817e5c65c511d4 Graf Yang        2010-10-27  420  		goto error_ret;
29148543c52146 Jonathan Cameron 2011-10-05  421  
29148543c52146 Jonathan Cameron 2011-10-05  422  	switch (chan->type) {
29148543c52146 Jonathan Cameron 2011-10-05  423  	case IIO_ANGL:
ecf16f4922f691 David Lechner    2023-09-29  424  		*val = be16_to_cpu(st->sample.raw);
29148543c52146 Jonathan Cameron 2011-10-05  425  		ret = IIO_VAL_INT;
29148543c52146 Jonathan Cameron 2011-10-05  426  		break;
29148543c52146 Jonathan Cameron 2011-10-05  427  	case IIO_ANGL_VEL:
ecf16f4922f691 David Lechner    2023-09-29  428  		*val = (s16)be16_to_cpu(st->sample.raw);
29148543c52146 Jonathan Cameron 2011-10-05  429  		ret = IIO_VAL_INT;
29148543c52146 Jonathan Cameron 2011-10-05  430  		break;
29148543c52146 Jonathan Cameron 2011-10-05  431  	default:
5e99f692d4e32e David Lechner    2023-09-21  432  		ret = -EINVAL;
5e99f692d4e32e David Lechner    2023-09-21  433  		break;
29148543c52146 Jonathan Cameron 2011-10-05  434  	}
29148543c52146 Jonathan Cameron 2011-10-05  435  
ecf16f4922f691 David Lechner    2023-09-29 @436  	ad2s1210_push_events(indio_dev, st->rx[2], timestamp);
ecf16f4922f691 David Lechner    2023-09-29  437  
817e5c65c511d4 Graf Yang        2010-10-27  438  error_ret:
69cc7fbdcdf2e3 David Lechner    2023-09-29  439  	gpiod_set_value(st->sample_gpio, 0);
817e5c65c511d4 Graf Yang        2010-10-27  440  	/* delay (2 * tck + 20) nano seconds */
817e5c65c511d4 Graf Yang        2010-10-27  441  	udelay(1);
817e5c65c511d4 Graf Yang        2010-10-27  442  	mutex_unlock(&st->lock);
29148543c52146 Jonathan Cameron 2011-10-05  443  	return ret;
817e5c65c511d4 Graf Yang        2010-10-27  444  }
817e5c65c511d4 Graf Yang        2010-10-27  445  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
