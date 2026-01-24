Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE241C84BB
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 00:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215056; cv=none; b=h6XkzaHOdIGfV/kXUmUAWi4WMOy7G0yM2a7agEWcUGU6UBzntzPQYm0RIJukosRrITDCi5pqvdFo0w8NTwElswBJhpUBxKwJn3RMEO1WsOrRUSLp6k7n16s/8lzljWfUkKYKHzBXm4qUnTUWan3YZNARAKwS+ErjFvXS7b8X+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215056; c=relaxed/simple;
	bh=ioAI+sA2aBJDNh4pOK68Bc9sdd8pd+/HyxjcIN1Ba2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTwJhl1M/dO/ihTz2JHFeyxjZucbAk104wHbUR+1jGpF0F61L8YYXk3rF8mQhzQ+t24I5hKbuK8gh1XqSZXHrfAGnPEmNxcNBt+voWK0CPltomwvSUVMDCtvo8R+STcYZKuZeSvinFAGi7Ax/gShXQ1kwxf9HjZ7JLdP3ygqsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f70ZGUC4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f70ZGUC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769215054; x=1800751054;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ioAI+sA2aBJDNh4pOK68Bc9sdd8pd+/HyxjcIN1Ba2E=;
  b=f70ZGUC4FLU7igqdVjNcCmo92qUGmOg16xJTfl7nRE6+NUPpRrl00iK9
   fgq+m39MyjChZDIDxeWK1OzLnUVf5Efuh/292QytH7GrNEb+xc3xSyqgC
   JZszI718QsCz6e48UeMx2g96LnJHnSObkmjBs4XE4lz6p02XDqtM/G3hK
   0QJabRvUdDkjhZVzkUuHPaac93PDrFzn1047vsybaRLhZN0hDlxO5Az6C
   PwX2hUQiuhhuwxF1ZVPOHvagRsl5kf7vRW+WZ437xNsnGV8OTsf2IVzFZ
   mX+YtAF+aiFle6/jG4cqvpIDJxqAB5e6E7tPtI3ToGums8B9niPMItmqa
   Q==;
X-CSE-ConnectionGUID: bB9IWyT+Sd+2Ce4RBTxquQ==
X-CSE-MsgGUID: 6tBwXzYoRHu+dDTLQjknbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69489179"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="69489179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:37:34 -0800
X-CSE-ConnectionGUID: s1sv6j9LSHmisz+IeQ+3AQ==
X-CSE-MsgGUID: L+gr82RnRjGs2FZ0ywzwtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207399033"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2026 16:37:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjRec-00000000Ucs-49w9;
	Sat, 24 Jan 2026 00:37:30 +0000
Date: Sat, 24 Jan 2026 08:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/5] mfd: aaeon: Add SRG-IMX8PL MCU driver
Message-ID: <202601240827.UbiRaJCH-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/mfd/aaeon-mcu.c:127:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb@bootlin.com>
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
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20260123-180358
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20260123-dev-b4-aaeon-mcu-driver-v2-3-9f4c00bfb5cb%40bootlin.com
patch subject: [PATCH v2 3/5] mfd: aaeon: Add SRG-IMX8PL MCU driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240827.UbiRaJCH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240827.UbiRaJCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240827.UbiRaJCH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/aaeon-mcu.c:127:1: sparse: sparse: bad integer constant expression
   drivers/mfd/aaeon-mcu.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mfd/aaeon-mcu.c:128:1: sparse: sparse: bad integer constant expression
   drivers/mfd/aaeon-mcu.c:128:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mfd/aaeon-mcu.c:129:1: sparse: sparse: bad integer constant expression
   drivers/mfd/aaeon-mcu.c:129:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +127 drivers/mfd/aaeon-mcu.c

79dd7a6e071435 Thomas Perrot (Schneider Electric  2026-01-23  126) 
79dd7a6e071435 Thomas Perrot (Schneider Electric  2026-01-23 @127) MODULE_DESCRIPTION("Aaeon MCU Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
