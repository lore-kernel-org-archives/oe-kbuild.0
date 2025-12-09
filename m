Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F927B357
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263320; cv=none; b=r4+3wsHfKvAQ8DukT5E+byapqyLHRYHG4gZMOn1KtFd437qBo6FUMzS5qWmJnUdKeJQCF5uli+TrdaoAtaqPDdGSeehgTFapJvEptEXlnqP7JN9QTLFTlYr0JnMakQZBQizcYSFhM/aP6gKCgqBx1bqBmJ9iMTW/W2uzAnI/l9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263320; c=relaxed/simple;
	bh=5buvdLKpvHT8BXetGdtBurS0umJRkjvRR9BiJoGFWKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJOj/a1rq6EtHvdErNC8HHTYzvLkRgaTvi03pPGiA0JrvqaHrFqKWztHq7sFwDbpC4zwxHEY2sqVaTfm0cH66AWdcJb8YewOijiyxmyeqkORXU63LbZ8vON6jGrTzbywOdo0Tm04JJhPOhRq+8PE/05jZrMUkd55YwSsLDy/oCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NL1E6s9o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NL1E6s9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765263318; x=1796799318;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5buvdLKpvHT8BXetGdtBurS0umJRkjvRR9BiJoGFWKY=;
  b=NL1E6s9oyFsN3dtKRFf7YU7eUqMWMXqf1xd6KswudL9FLfVYXY5d2Rz6
   uwNGGIg1r/KnOjJjKYe70NDH2vUa293xpsB2hJnihl7N6KLgaO3oTOw/L
   CKF3f5g6cOaBwkl9EmYs9pPUbGqIgd5TaK0yRFANnyq0H7haoFf/7zoHv
   25LeI0qVNpXhYZfOC4Py9TEnPimsr7JJ1LIivj09CERT9E6ly4OqlQ4MI
   vXbR/2HqzhCyWgbAGwoRc497X7vqZDaBXoeDtgEVBnRwaWq1L4VW9nsfx
   C/IpjNQxS5qQIZfiAYhtqEEQcNe9dqnr0YOvaDDDcAl8z9EJIZWijvm+s
   Q==;
X-CSE-ConnectionGUID: SDnGBOfrTRaBbEpWfC6VKw==
X-CSE-MsgGUID: CXfGn6rnR1a30KqrVyCiYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70835120"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="70835120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 22:55:17 -0800
X-CSE-ConnectionGUID: 2WKndrFCSmq8ib+pI3XZPg==
X-CSE-MsgGUID: I1okmtCXQRSrmCYbDGg9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200589816"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 22:55:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSrcw-000000001Qn-2G8F;
	Tue, 09 Dec 2025 06:55:14 +0000
Date: Tue, 9 Dec 2025 14:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <202512091403.zzZcC3fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-ltc4283.c:213:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251204-ltc4283-support-v4-3-db0197fd7984@analog.com>
References: <20251204-ltc4283-support-v4-3-db0197fd7984@analog.com>
TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
TO: linux-hwmon@vger.kernel.org
TO: linux-gpio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc04acf4aeca588496124a6cf54bfce3db327039]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bindings-hwmon-Document-the-LTC4283-Swap-Controller/20251205-003741
base:   bc04acf4aeca588496124a6cf54bfce3db327039
patch link:    https://lore.kernel.org/r/20251204-ltc4283-support-v4-3-db0197fd7984%40analog.com
patch subject: [PATCH v4 3/3] gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: microblaze-randconfig-r131-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091403.zzZcC3fv-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091403.zzZcC3fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512091403.zzZcC3fv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-ltc4283.c:213:1: sparse: sparse: bad integer constant expression
>> drivers/gpio/gpio-ltc4283.c:213:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-ltc4283.c:214:1: sparse: sparse: bad integer constant expression
>> drivers/gpio/gpio-ltc4283.c:214:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-ltc4283.c:215:1: sparse: sparse: bad integer constant expression
>> drivers/gpio/gpio-ltc4283.c:215:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpio/gpio-ltc4283.c:215:1: sparse: sparse: bad integer constant expression
>> drivers/gpio/gpio-ltc4283.c:215:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +213 drivers/gpio/gpio-ltc4283.c

7d6ae8ce607a7b Nuno Sá 2025-12-04  212  
7d6ae8ce607a7b Nuno Sá 2025-12-04 @213  MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
7d6ae8ce607a7b Nuno Sá 2025-12-04 @214  MODULE_DESCRIPTION("GPIO LTC4283 Driver");
7d6ae8ce607a7b Nuno Sá 2025-12-04 @215  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
