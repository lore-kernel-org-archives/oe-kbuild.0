Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8232D0C7A
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567890; cv=none; b=gsWJzv6mD9jD7ZhBZ+wLfXryO32mz/y0o70zBj6ToVHqlI6ZRSSROyBVoKXGZMX7bR9Dq+/iiF7EyH4EemXpchRvM7ZHqPL77OyNRc94Xy34QzV3xt6EBr5VQxNZvfBa/dKs7w0QHLxO9nqS4hD5nBI8vvUfKBaIY8niptFeIvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567890; c=relaxed/simple;
	bh=2BjByRyX6ThPnwdvvUwf3/ZhHyLnHLawpTHhCUGV3kQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DhXzMI/HaiRxwbLzTATwAb4X8jBQXRxNVkWHLZer09l7rSdjaasiJBwVE17cricBScK1dX2FgUCrQpZxAv8Wd2aJanPBPTSYbFBHP14e7dwgelk8nC+y/jimMorcl5O06ls4LA6ms+shz+cM/q9Py/nu9srUO7TpVLir6Yb1Fmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRZwZUd6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRZwZUd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769567889; x=1801103889;
  h=date:from:to:cc:subject:message-id;
  bh=2BjByRyX6ThPnwdvvUwf3/ZhHyLnHLawpTHhCUGV3kQ=;
  b=JRZwZUd6oRWggtkKUSWHvTzeug0TH6FulMoTt4my8Rob0KvEX385vhbi
   aCYyxYhrbcvW6QRGStrJVnHYEueGD7TWPO8Zvxd0hTF4/7WfVIdSLA2qo
   1p7mxLoq7Hklm/+kQHlSETTouOEQmko1VNzZ55T7KfdsD9SeqcULDj3d6
   z6WIDo7FMsHkmesCsJYHUPOakxYsMUgGilJ+OuvHeiMEXJej130Whmfs/
   67dnxnxfbBHYDk9rp6a/6Z9phx7tpn2+B2y7n/8xH77eKePiA28cKFzkl
   lA1QzGqgIn9TFFdTf5/UW3UsS+8yxDnwjUnHddiM57NUsmk0pgqHfY9PB
   w==;
X-CSE-ConnectionGUID: CNF/DCuYSdmAOPDkonOv6A==
X-CSE-MsgGUID: DcDKhCCaR5igNBl/CepaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81882095"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81882095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:38:08 -0800
X-CSE-ConnectionGUID: VX5kKhinR1WNKIa5xWkjBg==
X-CSE-MsgGUID: oTW1ZpIQRCe4WuBcTJSROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207933597"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jan 2026 18:38:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvRU-00000000Z9g-40Cw;
	Wed, 28 Jan 2026 02:38:04 +0000
Date: Wed, 28 Jan 2026 10:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7514/9906]
 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:276:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601281037.5Eik5saE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:276:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
commit: 95c1762aaf34b0d5d128f5c14a82826499c563a3 [7514/9906] pinctrl: move microchip riscv pinctrl drivers to a folder
:::::: branch date: 9 hours ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r133-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281037.5Eik5saE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281037.5Eik5saE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281037.5Eik5saE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:276:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:276:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:277:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:277:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:278:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:278:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:278:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c:278:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:354:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:354:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:355:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:355:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:356:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:356:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:356:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/microchip/pinctrl-pic64gx-gpio2.c:356:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +276 drivers/pinctrl/microchip/pinctrl-mpfs-iomux0.c

46397274da2284f drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23  275  
46397274da2284f drivers/pinctrl/pinctrl-mpfs-iomux0.c Conor Dooley 2025-10-23 @276  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");

:::::: The code at line 276 was first introduced by commit
:::::: 46397274da2284f46e550dc795de5ceeef8f89bf pinctrl: add polarfire soc iomux0 pinmux driver

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
