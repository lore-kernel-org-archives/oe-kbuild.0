Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DCD13D246
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731466465; cv=none; b=nIvA95futNay8XCx7A8aS1Jvb/Spaokan8KT2MJj0jtyvzk9tkCh3ixFpx3Y6NUt2RZkGel3jIVyFgs6v9KpB2dw2S9wV189hMiOS8U4BGzWQLQOjxz6O5sPwjPo4+Hf65cqfjqJ2BOcHoXK9bXtolV2Zd87ssb0IDrD9DnXPUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731466465; c=relaxed/simple;
	bh=pqp/2Q22NoSSqTtlfRujP11F6qdWooO2owPURvfvfk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKL5BIwgohVJ78fBIWc72OH6amx4TUDm4LS6ZL1s+bS3tusQbTLkFm30ZfgeaRcCkaYRo5MEMQfxdOGjKz+Uy1yDVzie0S4ljsnbX6URNMgiwj7+RM5H80WkBLhE05vs9+C+lO2bekj8w3xmZPiPrS6jBufMgT6qZqg2nh62ceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyQtpUBU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyQtpUBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731466463; x=1763002463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqp/2Q22NoSSqTtlfRujP11F6qdWooO2owPURvfvfk8=;
  b=hyQtpUBUxUb4Is5bh551vNFxLTFbT0KQ1a8HsTpHv5nARs/6pcLcDogO
   lBUV5F8r/aISZsicznxHLWa7MQ6TiCJsbSLi8c8I5u9sGOCXbD865D4+8
   2Z6gvIrz9miAQJrb9pSbl3pcvBbTq9W5YT/RgiGQZ5wkN+nK6hbrg0qpx
   V/6/jbojL+Kug09xSBTw7t6oR2Y4R66stk/IN0G4C1k99/XJS53sM3QE4
   hx0X8M6VouqePcR/70zQFsov9uQtry7HUyowNdM0Rg2o1T3QbgNWurel0
   JgCKrdZE939nx6hs5a+czjSljXAV2NbHtSwVe1/xweb1YiJvHA3DaBH/w
   w==;
X-CSE-ConnectionGUID: aJZkPwGPRC6eiDqp9c2y9w==
X-CSE-MsgGUID: 2qqqLQRYQ+WOOpbIJ0gzWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42456058"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42456058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:54:22 -0800
X-CSE-ConnectionGUID: PIzWL92URheSDo/QqYJC0Q==
X-CSE-MsgGUID: mKzhrjrgTsOREM1xP+jz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87878765"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 18:54:22 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB3WN-0001xJ-27;
	Wed, 13 Nov 2024 02:54:19 +0000
Date: Wed, 13 Nov 2024 10:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 39/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000:
 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes:
 '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
Message-ID: <202411131055.exroiV8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jisheng Zhang <jszhang@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 4aeb151b4e0dd319591bbbe106a259b48128eb5d [39/48] riscv: dts: thead: Enable Lichee Pi 4A USB
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131055.exroiV8k-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131055.exroiV8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411131055.exroiV8k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
