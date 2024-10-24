Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C91DD0F9
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810833; cv=none; b=ropEPmAuaELtHaTVjlRKCQkU0fJYg6UZ5ic+7szOoQPKfHKnNa9Hd+n+3WwHVJz5Qvh4CvP6RxmUPkl2gAUHxthxH2nmfIfxU10ZYlBrPDWpGDnX/cYH9gF5C3rGDsDcGo4IRCfDBD26IOEbwcrpGDdRTqH9M6AZj+Usu/tGBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810833; c=relaxed/simple;
	bh=Je9nEEaqK4nL1i/J9cVCICd8HrMBFo+CFa6K8jkIIiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3KivNg14ehRdFRZrSDSF9KCAInpCYhsUhNzzvqed5kHT7kya+qD4by8Bxa5MZGUwiWms5Wf9T6XivcR8vB4NZeUY1d04F0YxmYeFSYijVnFDOWSF9Vk2vafojleTWgd+3kSPb3yVasnm1NiCuARX6wgBEW0BhDDCMGgVLmcR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvVhOzE9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvVhOzE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729810831; x=1761346831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Je9nEEaqK4nL1i/J9cVCICd8HrMBFo+CFa6K8jkIIiw=;
  b=ZvVhOzE9Yi0geMRkP0J7+PGIsU3AepWKKnU8/8ICt0osIB6/G+/ZasHN
   zZHvl8PhVcv5mD29xBfCxfrqqNlfFzlnFEF07aOr/SCtVftg8IqGBIS7e
   5nRLuvkMIwNVbqITv6DTJ0FjyKkI9PHtZ5kEtcFjuaYq2wwb4Wy0PE9Mr
   8xUdjJr58QuoyOWA8/dEpsj+TWBF8bF6x/y7w/PdEWcS1hUg2Hkw7BRtK
   iCIZI/R0dXjEIFC3UKB+H0+mJb0N6rsdDXPiZlvmAb3fBwZZBp5SHErnq
   p1hbJKsIlurPnMxGiwoNlIRb8fAdM3P8R/evpXnFERDCO1sgU08pDdvfi
   g==;
X-CSE-ConnectionGUID: taVrUCWVRjyvnbHKkGEI2A==
X-CSE-MsgGUID: bz1AHxBkSLSaXnoYu+qMyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40578478"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40578478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: hzS6T+sRS/yPmtiMLB+a/Q==
X-CSE-MsgGUID: 1xnBrVaLQ4iHudqQ59vZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80646699"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 16:00:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t46oa-000XFU-0y;
	Thu, 24 Oct 2024 23:00:24 +0000
Date: Fri, 25 Oct 2024 06:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/5] iio: consumers: copy/release available info from
 producer to fix race
Message-ID: <202410250631.Sci650fF-lkp@intel.com>
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
In-Reply-To: <20241021-iio-read-avail-release-v5-2-b168713fab33@gmail.com>
References: <20241021-iio-read-avail-release-v5-2-b168713fab33@gmail.com>
TO: Matteo Martelli <matteomartelli3@gmail.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: "Alisa-Dariana Roman" <alisa.roman@analog.com>
TO: Christian Eggers <ceggers@arri.de>
TO: Peter Rosin <peda@axentia.se>
TO: Paul Cercueil <paul@crapouillou.net>
TO: Sebastian Reichel <sre@kernel.org>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Matteo Martelli <matteomartelli3@gmail.com>

Hi Matteo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c3e9df514041ec6c46be83801b1891392f4522f7]

url:    https://github.com/intel-lab-lkp/linux/commits/Matteo-Martelli/iio-core-add-read_avail_release_resource-callback-to-fix-race/20241021-205851
base:   c3e9df514041ec6c46be83801b1891392f4522f7
patch link:    https://lore.kernel.org/r/20241021-iio-read-avail-release-v5-2-b168713fab33%40gmail.com
patch subject: [PATCH v5 2/5] iio: consumers: copy/release available info from producer to fix race
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241025 (https://download.01.org/0day-ci/archive/20241025/202410250631.Sci650fF-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250631.Sci650fF-lkp@intel.com/

smatch warnings:
drivers/iio/inkern.c:878 iio_channel_read_max() error: uninitialized symbol 'avail_type'.
drivers/iio/inkern.c:935 iio_channel_read_min() error: uninitialized symbol 'avail_type'.

vim +/avail_type +878 drivers/iio/inkern.c

00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  864  
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  865  static int iio_channel_read_max(struct iio_channel *chan,
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  866  				int *val, int *val2, int *type,
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  867  				enum iio_chan_info_enum info)
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  868  {
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  869  	int length;
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  870  	int avail_type;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  871  
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  872  	const int *vals __free(kfree) =
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  873  		iio_channel_read_avail_retvals(chan, type, &length,
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  874  					       &avail_type, info);
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  875  	if (IS_ERR(vals))
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  876  		return PTR_ERR(vals);
f75c544d741332 drivers/iio/inkern.c         Herve Codina     2023-06-23  877  
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21 @878  	switch (avail_type) {
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  879  	case IIO_AVAIL_RANGE:
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  880  		switch (*type) {
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  881  		case IIO_VAL_INT:
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  882  			*val = vals[2];
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  883  			break;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  884  		default:
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  885  			*val = vals[4];
ad4e8480a1db87 drivers/iio/inkern.c         Herve Codina     2023-06-23  886  			if (val2)
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  887  				*val2 = vals[5];
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  888  		}
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  889  		return 0;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  890  
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  891  	case IIO_AVAIL_LIST:
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  892  		if (length <= 0)
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  893  			return -EINVAL;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  894  		switch (*type) {
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  895  		case IIO_VAL_INT:
97aee7157eeada drivers/iio/inkern.c         Herve Codina     2023-06-23  896  			*val = max_array(vals, length);
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  897  			break;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  898  		default:
4dc603735826ec drivers/iio/inkern.c         Herve Codina     2023-06-23  899  			/* TODO: learn about max for other iio values */
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  900  			return -EINVAL;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  901  		}
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  902  		return 0;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  903  
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  904  	default:
f75c544d741332 drivers/iio/inkern.c         Herve Codina     2023-06-23  905  		return -EINVAL;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  906  	}
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  907  }
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  908  
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  909  int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  910  {
b804e2b76ac6d5 drivers/iio/inkern.c         Jonathan Cameron 2021-04-26  911  	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  912  	int type;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  913  
3092bde731ca8c drivers/iio/inkern.c         Nuno Sa          2024-02-29  914  	guard(mutex)(&iio_dev_opaque->info_exist_lock);
3092bde731ca8c drivers/iio/inkern.c         Nuno Sa          2024-02-29  915  	if (!chan->indio_dev->info)
3092bde731ca8c drivers/iio/inkern.c         Nuno Sa          2024-02-29  916  		return -ENODEV;
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  917  
3092bde731ca8c drivers/iio/inkern.c         Nuno Sa          2024-02-29  918  	return iio_channel_read_max(chan, val, NULL, &type, IIO_CHAN_INFO_RAW);
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  919  }
00c5f80c2fad53 drivers/iio/inkern.c         Peter Rosin      2016-11-08  920  EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
e27d75d71c0dbb drivers/staging/iio/inkern.c Jonathan Cameron 2012-02-15  921  
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  922  static int iio_channel_read_min(struct iio_channel *chan,
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  923  				int *val, int *val2, int *type,
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  924  				enum iio_chan_info_enum info)
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  925  {
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  926  	int length;
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  927  	int avail_type;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  928  
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  929  	const int *vals __free(kfree) =
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  930  		iio_channel_read_avail_retvals(chan, type, &length,
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  931  					       &avail_type, info);
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  932  	if (IS_ERR(vals))
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21  933  		return PTR_ERR(vals);
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  934  
b87e6c24d989cc drivers/iio/inkern.c         Matteo Martelli  2024-10-21 @935  	switch (avail_type) {
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  936  	case IIO_AVAIL_RANGE:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  937  		switch (*type) {
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  938  		case IIO_VAL_INT:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  939  			*val = vals[0];
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  940  			break;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  941  		default:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  942  			*val = vals[0];
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  943  			if (val2)
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  944  				*val2 = vals[1];
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  945  		}
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  946  		return 0;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  947  
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  948  	case IIO_AVAIL_LIST:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  949  		if (length <= 0)
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  950  			return -EINVAL;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  951  		switch (*type) {
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  952  		case IIO_VAL_INT:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  953  			*val = min_array(vals, length);
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  954  			break;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  955  		default:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  956  			/* TODO: learn about min for other iio values */
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  957  			return -EINVAL;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  958  		}
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  959  		return 0;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  960  
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  961  	default:
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  962  		return -EINVAL;
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  963  	}
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  964  }
7560418078b939 drivers/iio/inkern.c         Herve Codina     2023-06-23  965  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
