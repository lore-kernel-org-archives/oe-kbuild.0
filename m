Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D413221F34
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 23:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667611; cv=none; b=iImL/un6NtTB3ZUNXHOiUPyQTM3pn2o0udLBrDjsac1Nxv2GtY5yNFym4ZFzLRn1a/AdModTkgObd4O6e5Mshfr2Enwv9z9IMko1M6gNWXYNLPf6FwHcQWaewtiln2gte5T8eDwntPKCPUtBwjo2rrGvvhdsrWKznrvgZye7hDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667611; c=relaxed/simple;
	bh=9DVU+iyFfFG1FvNC3tjVVhqtqpnwz+HGusNM8vZexHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCx89ZQnxImggSh3nbF4duAUbRvIFTnF0mRPm7GGuK20B1K7GJ+4gFFtRbNrq9/3UBWR1Qa5ZKx/qh9mYUqg05pyFaVnP6EdLg2+sxTS0DiItzDC2IzCsYjbHoixbu5TfpFbJKg0pdAmTxasCYZukjbTh4Zhhlw9njuHcQJ5FDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F72y1yeW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F72y1yeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765667609; x=1797203609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DVU+iyFfFG1FvNC3tjVVhqtqpnwz+HGusNM8vZexHs=;
  b=F72y1yeWp13JLhUpDFJfSu6jT8qFco3P2uMsfDHTiKKjcihHKjhv9MoM
   yqEHaLz0bdXJjjVm3s1i9H5U+PUTJQJqafCSKnursV7apcXOE9xmcNnKH
   nQMuyU0/Brhmd+/pqINB4uLbpwz3TAlVb2n8OUoaJoTekjs+rI4KVca/S
   rjoMrxOMrEMTG+rPBACfNA+WfQ7s3wTsWNE4SKNOhx281zyM8bbyN3o9f
   hkqHct3OKZocUlKEmJYttiutmZ54Bf721l36VZI16wVWfm7b2azZzQ0ZL
   nS4B296GX1vaunQmtqF8GVzvfrbLuZ1ezEFRGYIiXxVyKjdEo0jUSUWyd
   w==;
X-CSE-ConnectionGUID: e5pg08VTR8O17Gog5rGGWA==
X-CSE-MsgGUID: E9QbCPghTFWUM22McI9KEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67664754"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67664754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:13:28 -0800
X-CSE-ConnectionGUID: OFRL0NPeRYy6/jfK7mvpYg==
X-CSE-MsgGUID: wL3K9I1BTsKb2IFhhVHU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220773912"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 15:13:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYnk-000000008IZ-3ldc;
	Sat, 13 Dec 2025 23:13:24 +0000
Date: Sun, 14 Dec 2025 07:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] Add Advantech EIO Thermal driver
Message-ID: <202512140624.XEStpOlz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/eio_thermal.c:143:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251212-upstream-v1-v1-7-d50d40ec8d8a@advantech.com>
References: <20251212-upstream-v1-v1-7-d50d40ec8d8a@advantech.com>
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
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-7-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 7/8] Add Advantech EIO Thermal driver
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140624.XEStpOlz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140624.XEStpOlz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140624.XEStpOlz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/eio_thermal.c:143:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:143:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/thermal/eio_thermal.c:144:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:144:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/thermal/eio_thermal.c:349:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:349:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/thermal/eio_thermal.c:350:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:350:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/thermal/eio_thermal.c:351:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:351:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/thermal/eio_thermal.c:352:1: sparse: sparse: bad integer constant expression
   drivers/thermal/eio_thermal.c:352:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +143 drivers/thermal/eio_thermal.c

84e06c7480afc1 Ramiro Oliveira 2025-12-12  141  
84e06c7480afc1 Ramiro Oliveira 2025-12-12  142  static int timeout;
84e06c7480afc1 Ramiro Oliveira 2025-12-12 @143  module_param(timeout, int, 0444);
84e06c7480afc1 Ramiro Oliveira 2025-12-12  144  MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
84e06c7480afc1 Ramiro Oliveira 2025-12-12  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
