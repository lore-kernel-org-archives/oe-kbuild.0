Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0E4A3E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 00:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213136; cv=none; b=OP8BS07/hmB7C557sUOrq85q5f00Er9oGnXT0brJnqOCQMVtyOdGbfvzYyG9LvITgtLzivG0n8XaFWgOkuUNB0uQ2zSU1cP9RA4tPX+FdjlvGYmbyRTgwdsmv7dZM7AZ5mg5pBkOQ+Rn8SZ6txkrNwJ8T3qdj4UquuVFz9XBIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213136; c=relaxed/simple;
	bh=yj195W2ayTemaNCY0Gj/NdRPvNBJzlHmjGAyPizVss4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZYgf4Cmj6ZpMbwpXfjcoikdpylXbx7YJcS0MzA3+rZ19ClJvULaCQbWFLoQxYa+6snYq2Mu59Dcr/A9rN9DIioH5TQdC1pXt0XaLNwB+vBs9wv2v3GYRx888+IlzPP3fkNBHFSvNIWlQvhQfRBf9zq/Ybd2iNZq0AQzlbfYuVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klWTtV+x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klWTtV+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769213135; x=1800749135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yj195W2ayTemaNCY0Gj/NdRPvNBJzlHmjGAyPizVss4=;
  b=klWTtV+xZ/4sSIjJHWW1cvcCSsSNWTRhRHkwzZ7rb8mcKGb+75stXs0U
   A9ZDiJE+mKybEpckJ6PZMami9xyUDpwIQGyxhRwpgT48kd5yHlrbalsGw
   HgNHp0NeNkKCnypRZC7BQsYgUKIco9PQhGlvt5pgk8HKiDqgm3S6nqdJV
   7VTD/iBnQjneoE/w5jHHnmdfGlJ6eZF1YmfX3Xj2Esgdq0eZSbe1tYN1E
   uMUPL66SoNBG6F03XPW9JHYZkMVqyHqKYBOHozIvNS2k1EHJm5Mk5VLV+
   DpxZbimMyoem9q/kr2AGsUhEXcID/5wLN4fkSZyy3t1KXUUwtE8mye3XF
   w==;
X-CSE-ConnectionGUID: vYY04R/IRKaUwdDE2sfqGQ==
X-CSE-MsgGUID: Dm/PvSqBTCar2ZvKCsQsHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74330688"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74330688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:05:34 -0800
X-CSE-ConnectionGUID: RTJiSJboTPm/zwj7SHwkzA==
X-CSE-MsgGUID: cC2hbsNpRiWuZB5pug9+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207193421"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2026 16:05:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjR9e-00000000Ubw-1q8K;
	Sat, 24 Jan 2026 00:05:30 +0000
Date: Sat, 24 Jan 2026 08:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 3/8] iio: test: add kunit test for fixed-point parsing
Message-ID: <202601240742.r57Fnexy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/test/iio-test-fixpoint-parse.c:434:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-adf41513-iio-driver-v5-3-2dce812a2dda@analog.com>
References: <20260123-adf41513-iio-driver-v5-3-2dce812a2dda@analog.com>
TO: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Michael Hennerich <Michael.Hennerich@analog.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Rodrigo Alencar <rodrigo.alencar@analog.com>

Hi Rodrigo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c30e80d68a7afb334fde7147ee0106f25dd58d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-adf41513/20260123-235827
base:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
patch link:    https://lore.kernel.org/r/20260123-adf41513-iio-driver-v5-3-2dce812a2dda%40analog.com
patch subject: [PATCH v5 3/8] iio: test: add kunit test for fixed-point parsing
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc64-randconfig-r133-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240742.r57Fnexy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240742.r57Fnexy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240742.r57Fnexy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/test/iio-test-fixpoint-parse.c:434:1: sparse: sparse: bad integer constant expression
   drivers/iio/test/iio-test-fixpoint-parse.c:434:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/test/iio-test-fixpoint-parse.c:435:1: sparse: sparse: bad integer constant expression
   drivers/iio/test/iio-test-fixpoint-parse.c:435:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/test/iio-test-fixpoint-parse.c:436:1: sparse: sparse: bad integer constant expression
   drivers/iio/test/iio-test-fixpoint-parse.c:436:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/test/iio-test-fixpoint-parse.c:437:1: sparse: sparse: bad integer constant expression
   drivers/iio/test/iio-test-fixpoint-parse.c:437:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/test/iio-test-fixpoint-parse.c:437:1: sparse: sparse: bad integer constant expression
   drivers/iio/test/iio-test-fixpoint-parse.c:437:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +434 drivers/iio/test/iio-test-fixpoint-parse.c

b15d02946620438 Rodrigo Alencar 2026-01-23  433  
b15d02946620438 Rodrigo Alencar 2026-01-23 @434  MODULE_AUTHOR("Rodrigo Alencar <rodrigo.alencar@analog.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
