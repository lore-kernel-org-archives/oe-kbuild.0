Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729172EA16C
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765619972; cv=none; b=E79XLwTyoNFPBC19qqsIyoGCnE/CN6w60UqDS87AToEYwjFBjI+aHg82yYCSGK8/SeMb+kn9pzSRvbn+lfWpB/50Fiywku4QQi59DWUdGdsLLVZbV/5Q7QOVhmgy5j7mxbEAyB8dy9QR/v6O1m4TUancEus0FvRsNDxm7YOkwLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765619972; c=relaxed/simple;
	bh=z1pd3pz/xgx1vTD2AK0iAFhjsFTb9c+glNJx6eOdHIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TjDrfNUFVhODEVg2WrpTkuS0EIkS31OqEb18zjvYEKK+ayDrRSTCcPqgLwWF/IgxjtnwauED4x84ieOeP0Ie1QVAcIcAjGILfb+0noejIvWa/UaiG86xppmV9/KzS/jCFQ7dQNFbPqOnTus1M1+VnuUScVRkpciVE1aJPzRenwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtxYyfd6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtxYyfd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765619970; x=1797155970;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z1pd3pz/xgx1vTD2AK0iAFhjsFTb9c+glNJx6eOdHIU=;
  b=YtxYyfd6axP7apoRXJBRTBmd11C1RlXIHrCvDFsOgXKcZCYLfDL5/3ew
   Ad+3PrfVUdAB5Pu145/skCL+uUiyh+K/3jX1uhAKhyEM4WkaraO7ig/Y8
   UIWlgsLiZFArIGB+Y+QVgBsADIjtJcIdbsPA1SG6ftYZ0389MS/3KXgSz
   WABgf/zkhca9+MMxl3n5O5WUFVb2/N28GPq/bZhTecnVXTdecyFV/3FhU
   taLBOxV3l2TMCfKMYt7DwVj7zrA+OY0k1wTmDQxFl4DTVdS/HxmUulkSC
   QgEp3xY6xdW0hv5uYrhqOkDRUw2ITwLnpx3mhiS+nZebrRuAMfHh+kExr
   w==;
X-CSE-ConnectionGUID: UvjPrut/TfaC3g9JYnFe3w==
X-CSE-MsgGUID: HM5B3AT1ToyTA57GN9ntvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78310238"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78310238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:59:29 -0800
X-CSE-ConnectionGUID: dGbg374ET3uBNqYFOZ1VLw==
X-CSE-MsgGUID: pxRUZ1alRmu+/SmHnDGnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201470262"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 01:59:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMPN-000000007TX-3qID;
	Sat, 13 Dec 2025 09:59:25 +0000
Date: Sat, 13 Dec 2025 17:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] watchdog: aaeon: Add watchdog driver for SRG-IMX8PL
 MCU
Message-ID: <202512131731.Ev3Tm8fu-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/watchdog/aaeon_mcu_wdt.c:138:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12@bootlin.com>
TO: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: "Jérémie Dautheribes" <jeremie.dautheribes@bootlin.com>
TO: Wim Van Sebroeck <wim@linux-watchdog.org>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Lee Jones <lee@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-watchdog@vger.kernel.org
CC: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20251212-154458
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-7-6bd65bc8ef12%40bootlin.com
patch subject: [PATCH 7/8] watchdog: aaeon: Add watchdog driver for SRG-IMX8PL MCU
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arc-randconfig-r132-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131731.Ev3Tm8fu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131731.Ev3Tm8fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512131731.Ev3Tm8fu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/aaeon_mcu_wdt.c:138:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/aaeon_mcu_wdt.c:138:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/watchdog/aaeon_mcu_wdt.c:139:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/aaeon_mcu_wdt.c:139:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/watchdog/aaeon_mcu_wdt.c:140:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/aaeon_mcu_wdt.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/watchdog/aaeon_mcu_wdt.c:140:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/aaeon_mcu_wdt.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +138 drivers/watchdog/aaeon_mcu_wdt.c

755bb403c55a33 Thomas Perrot (Schneider Electric  2025-12-12  137) 
755bb403c55a33 Thomas Perrot (Schneider Electric  2025-12-12 @138) MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
