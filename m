Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C646282FA
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742656535; cv=none; b=S/loC1Ts1bRsV1/2Cns/xndN+FTlCIAXavbuNxdak6XsBgBEx1NYN01fKmRk3RNKQNkrxxTB+fz5b+Fxn1u90g89veyrqCvfKExsIFe21jt/cRx+r0jJkcViaF517eV0trh/tvZbC/RcBZa28B5izefaSBl2nAebGHpYQ5DVcsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742656535; c=relaxed/simple;
	bh=uTaI0/K84aHYvdelJf4CRl52XvFnIU6Y4U4eyB7tc1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sv0DL9tKiymAYpFcouth0Iicxj7TUjhFoo2QXjS1IsZTVeFVtAYOLa0mZytxXP6D86V7ym1WrzsViyVcDvM7JvctX1+pAqzD+SXIftSNiYM2LZO/mhlsRYdwE61LFV1PxFVZir8wDcSYLl2WaqbdHqtoxaYXxT4IjB/WgPzDPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx5SzBY3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx5SzBY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742656533; x=1774192533;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uTaI0/K84aHYvdelJf4CRl52XvFnIU6Y4U4eyB7tc1I=;
  b=Wx5SzBY31s8Y2XMyc8t6dm5Ni9Rtij734zFRx1B9yPT1izVcsrgJofo/
   tYI1NoPbcMm8xMCzpCFTt+9NFgRjfrPpNd+oeu5T8UPR8+pFaCz+aLOgR
   uExgY19DUym77vtwG21c3VJv4Dnt4/qHj+S93nIB8fzR/e+M2bULX52il
   Fno2GvcWPlzawTCZhLI5/+2UUERWjznLYrGWPLnsCMD/nSYQoeTMsSH7s
   n2t/LUhHAwqNudxiGpWy0D2MVN6f2IFy0vCLOn2gbTGx1znSFhduNpjfV
   YVa076XhC9aj2mSGbjQuVdkLapFliwxjqutT9KPfS1clHNntEclooDeTw
   g==;
X-CSE-ConnectionGUID: QFy84ZPxQwK+m89TrLLswg==
X-CSE-MsgGUID: 6pFs0nytTuG8RW9cpK74JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="69260778"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="69260778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 08:15:32 -0700
X-CSE-ConnectionGUID: pw8sQvI7QGmamqvTiZ3MCg==
X-CSE-MsgGUID: 9wZGG8V8T36o1WyiDJaRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="128325808"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Mar 2025 08:15:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw0ZM-0002D1-1n;
	Sat, 22 Mar 2025 15:15:28 +0000
Date: Sat, 22 Mar 2025 23:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 09/10] iio: adc: ad7606: dynamically allocate channel
 info
Message-ID: <202503222246.RafigmhQ-lkp@intel.com>
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
In-Reply-To: <20250318-iio-adc-ad7606-improvements-v2-9-4b605427774c@baylibre.com>
References: <20250318-iio-adc-ad7606-improvements-v2-9-4b605427774c@baylibre.com>
TO: David Lechner <dlechner@baylibre.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: linux-iio@vger.kernel.org
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Angelo Dureghello <adureghello@baylibre.com>
CC: Alexandru Ardelean <aardelean@baylibre.com>
CC: Beniamin Bia <beniamin.bia@analog.com>
CC: Stefan Popa <stefan.popa@analog.com>
CC: linux-kernel@vger.kernel.org
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f36acefb2621d980734a5bb7d74e0e24e0af166]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-adc-ad7606-check-for-NULL-before-calling-sw_mode_config/20250319-065737
base:   9f36acefb2621d980734a5bb7d74e0e24e0af166
patch link:    https://lore.kernel.org/r/20250318-iio-adc-ad7606-improvements-v2-9-4b605427774c%40baylibre.com
patch subject: [PATCH v2 09/10] iio: adc: ad7606: dynamically allocate channel info
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222246.RafigmhQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503222246.RafigmhQ-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606.c:1270 ad7606_probe_channels() warn: potentially one past the end of array 'channels[i]'
drivers/iio/adc/ad7606.c:1270 ad7606_probe_channels() warn: potentially one past the end of array 'channels[i]'

vim +1270 drivers/iio/adc/ad7606.c

e571c1902116a3 Alexandru Ardelean 2024-09-19  1195  
87cf5705725eeb David Lechner      2025-03-18  1196  static int ad7606_probe_channels(struct iio_dev *indio_dev)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1197  {
e571c1902116a3 Alexandru Ardelean 2024-09-19  1198  	struct ad7606_state *st = iio_priv(indio_dev);
87cf5705725eeb David Lechner      2025-03-18  1199  	struct device *dev = indio_dev->dev.parent;
87cf5705725eeb David Lechner      2025-03-18  1200  	struct iio_chan_spec *channels;
87cf5705725eeb David Lechner      2025-03-18  1201  	bool slow_bus;
87cf5705725eeb David Lechner      2025-03-18  1202  	int ret, i;
87cf5705725eeb David Lechner      2025-03-18  1203  
87cf5705725eeb David Lechner      2025-03-18  1204  	slow_bus = !st->bops->iio_backend_config;
87cf5705725eeb David Lechner      2025-03-18  1205  	indio_dev->num_channels = st->chip_info->num_adc_channels;
87cf5705725eeb David Lechner      2025-03-18  1206  
87cf5705725eeb David Lechner      2025-03-18  1207  	/* Slow buses also get 1 more channel for soft timestamp */
87cf5705725eeb David Lechner      2025-03-18  1208  	if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1209  		indio_dev->num_channels++;
87cf5705725eeb David Lechner      2025-03-18  1210  
87cf5705725eeb David Lechner      2025-03-18  1211  	channels = devm_kcalloc(dev, indio_dev->num_channels, sizeof(*channels),
87cf5705725eeb David Lechner      2025-03-18  1212  				GFP_KERNEL);
87cf5705725eeb David Lechner      2025-03-18  1213  	if (!channels)
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1214  		return -ENOMEM;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1215  
87cf5705725eeb David Lechner      2025-03-18  1216  	for (i = 0; i < indio_dev->num_channels; i++) {
87cf5705725eeb David Lechner      2025-03-18  1217  		struct iio_chan_spec *chan = &channels[i];
87cf5705725eeb David Lechner      2025-03-18  1218  
87cf5705725eeb David Lechner      2025-03-18  1219  		chan->type = IIO_VOLTAGE;
87cf5705725eeb David Lechner      2025-03-18  1220  		chan->indexed = 1;
87cf5705725eeb David Lechner      2025-03-18  1221  		chan->channel = i;
87cf5705725eeb David Lechner      2025-03-18  1222  		chan->scan_index = i;
87cf5705725eeb David Lechner      2025-03-18  1223  		chan->scan_type.sign = 's';
87cf5705725eeb David Lechner      2025-03-18  1224  		chan->scan_type.realbits = st->chip_info->bits;
87cf5705725eeb David Lechner      2025-03-18  1225  		chan->scan_type.storagebits = st->chip_info->bits > 16 ? 32 : 16;
87cf5705725eeb David Lechner      2025-03-18  1226  		chan->scan_type.endianness = IIO_CPU;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1227  
87cf5705725eeb David Lechner      2025-03-18  1228  		if (indio_dev->modes & INDIO_DIRECT_MODE)
87cf5705725eeb David Lechner      2025-03-18  1229  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_RAW);
87cf5705725eeb David Lechner      2025-03-18  1230  
87cf5705725eeb David Lechner      2025-03-18  1231  		if (st->sw_mode_en) {
87cf5705725eeb David Lechner      2025-03-18  1232  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1233  			chan->info_mask_separate_available |=
87cf5705725eeb David Lechner      2025-03-18  1234  				BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1235  
87cf5705725eeb David Lechner      2025-03-18  1236  			/*
87cf5705725eeb David Lechner      2025-03-18  1237  			 * All chips with software mode support oversampling,
87cf5705725eeb David Lechner      2025-03-18  1238  			 * so we skip the oversampling_available check. And the
87cf5705725eeb David Lechner      2025-03-18  1239  			 * shared_by_type instead of shared_by_all on slow
87cf5705725eeb David Lechner      2025-03-18  1240  			 * buses is for backward compatibility.
87cf5705725eeb David Lechner      2025-03-18  1241  			 */
87cf5705725eeb David Lechner      2025-03-18  1242  			if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1243  				chan->info_mask_shared_by_type |=
87cf5705725eeb David Lechner      2025-03-18  1244  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1245  			else
87cf5705725eeb David Lechner      2025-03-18  1246  				chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1247  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1248  
87cf5705725eeb David Lechner      2025-03-18  1249  			chan->info_mask_shared_by_all_available |=
87cf5705725eeb David Lechner      2025-03-18  1250  				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1251  		} else {
87cf5705725eeb David Lechner      2025-03-18  1252  			chan->info_mask_shared_by_type |=
87cf5705725eeb David Lechner      2025-03-18  1253  				BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1254  
87cf5705725eeb David Lechner      2025-03-18  1255  			if (st->chip_info->oversampling_avail)
87cf5705725eeb David Lechner      2025-03-18  1256  				chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1257  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1258  		}
87cf5705725eeb David Lechner      2025-03-18  1259  
87cf5705725eeb David Lechner      2025-03-18  1260  		if (!slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1261  			chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1262  				BIT(IIO_CHAN_INFO_SAMP_FREQ);
87cf5705725eeb David Lechner      2025-03-18  1263  
87cf5705725eeb David Lechner      2025-03-18  1264  		ret = st->chip_info->scale_setup_cb(indio_dev, chan);
e571c1902116a3 Alexandru Ardelean 2024-09-19  1265  		if (ret)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1266  			return ret;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1267  	}
e571c1902116a3 Alexandru Ardelean 2024-09-19  1268  
87cf5705725eeb David Lechner      2025-03-18  1269  	if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18 @1270  		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
87cf5705725eeb David Lechner      2025-03-18  1271  
87cf5705725eeb David Lechner      2025-03-18  1272  	indio_dev->channels = channels;
87cf5705725eeb David Lechner      2025-03-18  1273  
e571c1902116a3 Alexandru Ardelean 2024-09-19  1274  	return 0;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1275  }
e571c1902116a3 Alexandru Ardelean 2024-09-19  1276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
