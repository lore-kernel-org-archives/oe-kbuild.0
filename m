Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECD178372
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220941; cv=none; b=AD8QamkxOtYBfjbaDPAlnYvoeK6/ge0XvQz0I5zXIfGslrX/KS+M1+aWgsBCc3kUYdimPOSJWVcLhwEbF7H1ZHHlj3UPN7+xOGecQcPP3+PqEkpeCw+MDw91NXNyn4wf501hOnLnpSGf0azx2jEbpej4KKTf1PKPdUQ706wDgMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220941; c=relaxed/simple;
	bh=YvfYOrm/5E+75ccuGdHDwpZLKfJeR7mOO2G6CWVrvK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvqKYOkYhGQjzJ4g1TgY0Pn7EOnTIQNfjZlAoOi6jw0i2X62aBB343OajHCKHiO8E9WuO5mUeuugQhdIVTIQl1bjMvuXtcFYyHyvYMmyo2Z22QWjXGWIr1dOL439JoQCx5/qNwbrhMHFV3YNdXu/uVXxNfjXhrWJUx6StTiaYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqE6ZJeb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqE6ZJeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769220940; x=1800756940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YvfYOrm/5E+75ccuGdHDwpZLKfJeR7mOO2G6CWVrvK0=;
  b=KqE6ZJeb7nMFOd99lnPOcDFYOXuLcmksvv+1ydGrU6qDQoxGjjeYMiBi
   KiJoIndes+PF+ocaJJbQwBFw7tAWTvqKrXp/O6VJpzY69IhTMRstFEvLZ
   d0CtYrUBuzc9CRWC5T7s71wY98sqi3ez2tfGMSq8V96MyyjmXwh/UPhkM
   zDEu0/5dEB1r/NGnBaLsthvYXH4Q1lkU0jJcz/v2s3V9Lz1fqJ5Aer5ZO
   k9GXHiIDkngIeFgZHulOZanir5HgLbHJoNMtXIGiL3w5UsFdYadzytG+Q
   3xYWNU1glOab2Qjj9t/uftt5CYGY2exxzJ9STLPH6UdAVADXTUoolaVlJ
   Q==;
X-CSE-ConnectionGUID: hxI/OFigSZS3qBG4B3GHjQ==
X-CSE-MsgGUID: RYMUfGwFRYuCx0kX4I6dtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="93141860"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="93141860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 18:15:39 -0800
X-CSE-ConnectionGUID: EWyNXw0BQuaDkrcK82ZZvg==
X-CSE-MsgGUID: e4XqRZ6cTKyLJEfkAHC40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211673789"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2026 18:15:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjTBX-00000000Uhm-1dIt;
	Sat, 24 Jan 2026 02:15:35 +0000
Date: Sat, 24 Jan 2026 10:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
Message-ID: <202601241021.E9fTfetr-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-aaeon-mcu.c:236:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
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
patch link:    https://lore.kernel.org/r/20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb%40bootlin.com
patch subject: [PATCH v2 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241021.E9fTfetr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241021.E9fTfetr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241021.E9fTfetr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aaeon-mcu.c:236:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:236:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-aaeon-mcu.c:237:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:237:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-aaeon-mcu.c:238:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:238:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +236 drivers/gpio/gpio-aaeon-mcu.c

ccc7d0db3a18f1 Thomas Perrot (Schneider Electric  2026-01-23  235) 
ccc7d0db3a18f1 Thomas Perrot (Schneider Electric  2026-01-23 @236) MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
