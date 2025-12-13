Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103AA277C86
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765631567; cv=none; b=B6MWtzDVK2wz5Jv0jr4Sf/FIu/vsilg4UX0aJZsSR+7jTNCKAiFR3XaXhPaxd+H365ayJAdCOS4RevYrapgxaSJrLiiS2vAwsHaw8oyjgUgg1nIGZ72C5s/hLoXTCeAqxRG/PgP7fSE7QSa6EmfmX8kBbntw6nBFZDfFd30yPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765631567; c=relaxed/simple;
	bh=A3Wxmo6iJdPY4jrzAuzTOw/y5Gbo0cz4S71QqBEgV8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U9zf4uzG2LP1Nu5SlHi6gxNF7L3Ozzz4A0woXyR993VZjZg5jWq4jHrQLozBAo/W/XOvYsXVMk3rJ3Y+Ri40OaOPTR0h4TiIYzqGHj35+1RCbJxRMPAcBOueUxmJwFh4wBeip6k+Rbqlfo5NtbvVQGr+6z4iX1X9Di9VPWws7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1m6oqQ/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1m6oqQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765631564; x=1797167564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A3Wxmo6iJdPY4jrzAuzTOw/y5Gbo0cz4S71QqBEgV8o=;
  b=W1m6oqQ/+aWv/1EU3IrrPY84WqvMiADW8Ig2DtmjEG2JU6bwyagdiz8n
   fkbZTo+oAOUcnnth8r9MHVuK6/SHK5sV22Tsz0aWt/037abK+Tav/okP0
   CefMNTZFava9WqXcmzwTsbYVuvYAhxeky+a3hX/cc/gj1mdE4vAwoiAhf
   tOCJaUiPQuoDad164OtOAEOsckRW6+s5jQvcLpj96EDg4n0h2gJ8MtK9/
   Rej0Uc2WTJJcFIeDb6Wl1SuzaFXPMpJugCfecEbomBiM6BxBUan1yAKGv
   rFly1Gf6aabm8ch3ZbWXkXv1dWZKoxSfl8rVS129WWMK6yP+0SpS07j/r
   Q==;
X-CSE-ConnectionGUID: FYn+Ar43SjKGqu14xbIb9A==
X-CSE-MsgGUID: oAUAmOONQ2yucoWeyR8uug==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77924971"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="77924971"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:12:43 -0800
X-CSE-ConnectionGUID: V/GN36SjRCGPpGM+JMN4vA==
X-CSE-MsgGUID: Sx7pHVZnQG6MFFzGEEx1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="220694151"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 05:12:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPQO-000000007fJ-0mpS;
	Sat, 13 Dec 2025 13:12:40 +0000
Date: Sat, 13 Dec 2025 21:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
Message-ID: <202512132027.vqUer4rn-lkp@intel.com>
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
In-Reply-To: <20251211-lock-impr-v2-5-6fb47bdaaf24@gmail.com>
References: <20251211-lock-impr-v2-5-6fb47bdaaf24@gmail.com>
TO: Kurt Borja <kuurtb@gmail.com>
TO: Andy Shevchenko <andriy.shevchenko@intel.com>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: Benson Leung <bleung@chromium.org>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Gwendal Grignou <gwendal@chromium.org>
TO: Shrikant Raskar <raskar.shree97@gmail.com>
TO: "Per-Daniel Olsson" <perdaniel.olsson@axis.com>
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Guenter Roeck <groeck@chromium.org>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: chrome-platform@lists.linux.dev
CC: Kurt Borja <kuurtb@gmail.com>

Hi Kurt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on daea3a394a8b425a2dd206ab09eb37f0d1087d35]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/iio-core-Add-and-export-__iio_dev_mode_lock/20251212-105222
base:   daea3a394a8b425a2dd206ab09eb37f0d1087d35
patch link:    https://lore.kernel.org/r/20251211-lock-impr-v2-5-6fb47bdaaf24%40gmail.com
patch subject: [PATCH v2 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132027.vqUer4rn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132027.vqUer4rn-lkp@intel.com/

smatch warnings:
include/linux/iio/iio.h:747 class___priv__iio_dev_mode_lock_try_direct_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +747 include/linux/iio/iio.h

847ec80bbaa76aa drivers/staging/iio/iio.h Jonathan Cameron 2009-08-18  742  
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  743  DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  744  	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  745  DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_buffer,
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  746  		  iio_device_claim_buffer_mode(_T));
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11 @747  DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  748  		  iio_device_claim_direct(_T));
4df16d75ded7288 include/linux/iio/iio.h   Kurt Borja       2025-12-11  749  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
