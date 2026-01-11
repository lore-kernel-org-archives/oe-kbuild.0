Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC571D63D1
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768168744; cv=none; b=f9yATBwnaTT/vwRd7pPnPRzdejBT9XC2zRHzKOYURfr2y2gKALhzz03bKGLloMx1KNzxJPvaf/nEGqLw9+bIz4eMfASSkLrXQJti/n1adgEgRZhjREAfMVyXY6vAvjLilY1q8/0h4hMJmoLPsIrx9RqYw/QasiKJTrHPDoyh3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768168744; c=relaxed/simple;
	bh=+2SQ9d2KDJilhjj1aATUPT2ioPbY4gluFjgQQLn6AWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CA4fkneSad6HZsA49WBxoyIbTExR0b29K/WonpiMmySeB6/AYUYdMRjWj1k06MgVgQqfT1hfJIAETTOUrnFBKPmPJJk9Cb/RyypGfQmfL93zTEU1SR9q9nHY6LbgEt1g2z8hnPhVFUStbh2+PqZsAXr1yhQQUABT4ZZUew7FJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f54dVhso; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f54dVhso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768168742; x=1799704742;
  h=date:from:to:cc:subject:message-id;
  bh=+2SQ9d2KDJilhjj1aATUPT2ioPbY4gluFjgQQLn6AWs=;
  b=f54dVhso2kJ5DzFc9QsAUwsW7r/aCZwCW++SXHHvtqa6S9NojmdXTrwi
   igoKiQrWe8UMPZGGEbJgoHqcSPpT1IHUBlZLbVdg8LFDW/J57XVIvpdI+
   ULHvrFkleXRLH2Ldvj4X8Rq81KJ7w3DExPSrWwViKBi39xGxtenJjZ/mH
   PKtMPIL5P6r4UElVhrH2PiMfJIRSXR2XVLIBz48Vrd/8yePlm/kesBZFH
   ziBht2ARGekBKTQimAh7MQD/PZjBmvbqeAkJiQQsc+1rnVYaHatp22vEo
   wX7NcX7oUGjPd2E/G6UHy/rO5zqavvfkOcnCvHGbLy8rS7JTIPvPvaVpx
   g==;
X-CSE-ConnectionGUID: cJWtStRLQXiIlygZ0QMlfw==
X-CSE-MsgGUID: hcCl+Zd4TwWqWE697czm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80905992"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80905992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:59:02 -0800
X-CSE-ConnectionGUID: l9SjsxGoQYWWdJmHkWcHLw==
X-CSE-MsgGUID: BKuMrwqJTbSZ4SMkZ2whXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204221891"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2026 13:59:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3Sc-00000000Ciq-2fNc;
	Sun, 11 Jan 2026 21:58:58 +0000
Date: Mon, 12 Jan 2026 05:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 76/76] drivers/iio/adc/ad4134.c:497:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601120530.PK8OcxAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/ad4134.c:497:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marcelo Schmitt <marcelo.schmitt@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   e0bc6d7e258486c10bb11e31fd4421c134063b1d
commit: e0bc6d7e258486c10bb11e31fd4421c134063b1d [76/76] iio: adc: Initial support for AD4134
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: sparc-randconfig-r133-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120530.PK8OcxAs-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120530.PK8OcxAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120530.PK8OcxAs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad4134.c:497:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4134.c:497:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/ad4134.c:498:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4134.c:498:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ad4134.c:499:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4134.c:499:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/adc/ad4134.c:500:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ad4134.c:500:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +497 drivers/iio/adc/ad4134.c

e0bc6d7e258486 Marcelo Schmitt 2026-01-07  496  
e0bc6d7e258486 Marcelo Schmitt 2026-01-07 @497  MODULE_AUTHOR("Marcelo Schmitt <marcelo.schmitt@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
