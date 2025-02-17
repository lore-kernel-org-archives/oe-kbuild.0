Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92BE21859A
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789786; cv=none; b=JX4yCBqYMQawtcLLojr4IUiYXFdvlGMKwCSDGBaNgc7fCccgLCuz5knFGOypmgQDexvF74MIYj4c1D9mtB//Zc3qikBZCiWPpy8mBbYnzfwSHyhiqF7spZk4QaNUmig2Y1vU/wzLnfva9ptVIfiWX4qMIuw+qRHs5iugCQm30q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789786; c=relaxed/simple;
	bh=x/cljszAEnX8WHghPe6bsgVqju5Gf6RtvHOsAHoS4cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDewF28dQP3qZ62ujurQlpZHerWsQf8UqBXTGUGTlzmdb0O4KHmGAqEC+M6EWzhNAMK8Xr+QaRot/ZFP9ZOJqxYXjGX9BZJX+htYDg7YYB/Qmwt7oq/bw0PU9oAaocrNl13RnTx2u9HeYXh376N/ycJbvNeMPCjMZZZPeZOkZ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me8jpARZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me8jpARZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739789785; x=1771325785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/cljszAEnX8WHghPe6bsgVqju5Gf6RtvHOsAHoS4cI=;
  b=Me8jpARZk4gr5qTA1vBA3Gs096hdaUoakPRSWCuqUmcX419XXeSNNjjr
   e64usHcYoE5QrZaVjDkgcYuEdgHA9xfYpI6uAeEZMubGAUnpId7KZCUBd
   2e5DWunyTkV9a1GprMUVgv3Q0aSfO1276H4CFa9UpF3ehUuJtSTGVTDoz
   MwXFXbUbqKlq5t5WiIQJ+vzfyCI68JXX+XiBM2JAkXlQdKwhq4E8eYmcz
   KUDQYOiBjZH6rn20/tP7pJPyUc40mrrqPvf0Rlsd+moiakfBL+qKGQQWb
   WFM6D1nVV63tgs5w9ESKXqqhulLsS1VsSDKWhXoRCkYsNsYH5OcEI8arC
   g==;
X-CSE-ConnectionGUID: zdffCM/FRRO/LG4SvO1jXg==
X-CSE-MsgGUID: c50e7v+6RYevQdP8BaFxrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43298499"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="43298499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:56:24 -0800
X-CSE-ConnectionGUID: j3ktLTylS8iiUvMR+Alo6g==
X-CSE-MsgGUID: /YIih3C+S9K9TxJjG+9cNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137326533"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 02:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjynV-001D0r-0L;
	Mon, 17 Feb 2025 10:56:21 +0000
Date: Mon, 17 Feb 2025 18:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2776/4577] drivers/iio/adc/ad7944.c:111:28-44:
 WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202502171836.rq9FkpYS-lkp@intel.com>
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
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   253c82b3a2cec22bf9db65645f934fbe095899a3
commit: cbc986cda57a0488069f7c6bda7e16cd592e8157 [2776/4577] iio: adc: ad7944: add support for SPI offload
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: nios2-randconfig-r054-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171836.rq9FkpYS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502171836.rq9FkpYS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad7944.c:111:28-44: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +111 drivers/iio/adc/ad7944.c

d1efcf8871db51 David Lechner 2024-03-04  105  
d1efcf8871db51 David Lechner 2024-03-04  106  struct ad7944_chip_info {
d1efcf8871db51 David Lechner 2024-03-04  107  	const char *name;
d1efcf8871db51 David Lechner 2024-03-04  108  	const struct ad7944_timing_spec *timing_spec;
cbc986cda57a04 David Lechner 2025-02-07  109  	u32 max_sample_rate_hz;
d1efcf8871db51 David Lechner 2024-03-04  110  	const struct iio_chan_spec channels[2];
cbc986cda57a04 David Lechner 2025-02-07 @111  	const struct iio_chan_spec offload_channels[1];
d1efcf8871db51 David Lechner 2024-03-04  112  };
d1efcf8871db51 David Lechner 2024-03-04  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
