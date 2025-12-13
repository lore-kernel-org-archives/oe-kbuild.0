Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA62F83DB
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 23:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667613; cv=none; b=AnXuGt7LIwBXLgav2GWqYLGTj6hdlqS9RLPaglui2My/Z0MTfkBxdpHCLLmOyzVqEat6+LC/yxAbxrnm6/yDup1Zz/PwePsBmSHJ3uatzj4SoXSkblxwZWHSrLGGXcNJ023VLvnV/JSgJQ4oPVCa8PRh7IMJ8Ba02S4erGO6KQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667613; c=relaxed/simple;
	bh=JLrj8g3iCMiEl99CclXkb6udXEUX+OosWFJ3+D4wN5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1VM9B8rDJZKSxOh0QHLDJoxTc3A5TlyCRjseFs2Hn9Q4/HyX75ihBDUIMQNtti6D2QmEKNXWUCqXqRuRpBtsKUDlC/eR8l/fa0ztL4gIf1SnAOeMJm/RrZsoh4MGNvcpcQVa9LvkowoyoICgw3SDcawNR3yscEkiPqntByPDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CILlK5G6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CILlK5G6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765667612; x=1797203612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLrj8g3iCMiEl99CclXkb6udXEUX+OosWFJ3+D4wN5w=;
  b=CILlK5G63VVL8a6mu4PSfyOq4DCUiS3I8k7QEcUeA83lqzcn4vAQ+cLJ
   /JoV7sXEkMSXQdMmaS+K7SfDYqz48MGAKCwKOr/+to1RN2J6bUD2huXvz
   DGXh9tnUj1pcRxYabxj5x4i8Zfv53Vy4vFO6mtmnAWeOKnVZglliKesOj
   E1SWdbQOm676CQWuXG0KQeXdpNew+s4MQTjMMXjoKQ0n/bXZO3U4o8mD6
   S00CViZ6+7PIXKdWzAhEdtQebrbXv7DF6c1WdqLX1s6bqSN0yt25ukFvF
   zdYB/ZFD0Ro9V7Yqamko2cp/Ga3PRJoDA1MOaeX8jSMtkO2o0jLWP41MI
   Q==;
X-CSE-ConnectionGUID: iCcFm0F7QnyFEhxhkGoPjQ==
X-CSE-MsgGUID: P9uphmOJRNOUNxKoDTuDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67664755"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67664755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:13:28 -0800
X-CSE-ConnectionGUID: yuZyue4FRvmWKJwh/oyXrQ==
X-CSE-MsgGUID: FkkJBOSJSzKTpCV0DnEHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220773913"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 15:13:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYnk-000000008IX-3eGM;
	Sat, 13 Dec 2025 23:13:24 +0000
Date: Sun, 14 Dec 2025 07:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/8] Add Advantech EIO MFD driver
Message-ID: <202512140653.VFtpkQVM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mfd/eio_core.c:39:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
References: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
TO: Ramiro Oliveira <ramiro.oliveira@advantech.com>
TO: Lee Jones <lee@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Daniel Thompson <danielt@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Helge Deller <deller@gmx.de>
TO: Wim Van Sebroeck <wim@linux-watchdog.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-fbdev@vger.kernel.org
CC: linux-watchdog@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Wenkai Chung <wenkai.chung@advantech.com.tw>
CC: "Francisco Aragon-Trivino" <francisco.aragon-trivino@advantech.com>
CC: Hongzhi Wang <hongzhi.wang@advantech.com>
CC: Mikhail Tsukerman <mikhail.tsukerman@advantech.com>
CC: Thomas Kastner <thomas.kastner@advantech.com>
CC: Ramiro Oliveira <ramiro.oliveira@advantech.com>

Hi Ramiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9771d0dbe18dd643760431870a6abf9b0866bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
base:   d9771d0dbe18dd643760431870a6abf9b0866bb0
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-1-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 1/8] Add Advantech EIO MFD driver
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc-randconfig-r123-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140653.VFtpkQVM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140653.VFtpkQVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140653.VFtpkQVM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/eio_core.c:39:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:39:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:40:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:40:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:618:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:618:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:619:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:619:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:620:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:620:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:621:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:621:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mfd/eio_core.c:621:1: sparse: sparse: bad integer constant expression
   drivers/mfd/eio_core.c:621:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +39 drivers/mfd/eio_core.c

3265ff741af01a Ramiro Oliveira 2025-12-12  29  
3265ff741af01a Ramiro Oliveira 2025-12-12  30  /**
3265ff741af01a Ramiro Oliveira 2025-12-12  31   * Timeout: Default timeout in microseconds when a PMC command's
3265ff741af01a Ramiro Oliveira 2025-12-12  32   * timeout is unspecified. PMC command responses typically range
3265ff741af01a Ramiro Oliveira 2025-12-12  33   * from 200us to 2ms. 5ms is quite a safe value for timeout. In
3265ff741af01a Ramiro Oliveira 2025-12-12  34   * In some cases, responses are longer. In such situations, please
3265ff741af01a Ramiro Oliveira 2025-12-12  35   * adding the timeout parameter loading related sub-drivers or
3265ff741af01a Ramiro Oliveira 2025-12-12  36   * this core driver (not recommended).
3265ff741af01a Ramiro Oliveira 2025-12-12  37   */
3265ff741af01a Ramiro Oliveira 2025-12-12  38  static uint timeout = DEFAULT_TIMEOUT;
3265ff741af01a Ramiro Oliveira 2025-12-12 @39  module_param(timeout, uint, 0444);
3265ff741af01a Ramiro Oliveira 2025-12-12  40  MODULE_PARM_DESC(timeout, "Default PMC command timeout in usec.\n");
3265ff741af01a Ramiro Oliveira 2025-12-12  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
