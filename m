Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3E3219E0
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712721; cv=none; b=LHdso9fYAa4D3utq43bOSiHNMboq554c+Ak8DjtN+GE5MGqbZ047pYGAlYU0sKA6L/y5sCAeGzJxRR9Ny1RpX+EC8iZ52ohR45qqDzQ16dv4lWlF5EeYCUCd+8gTb+8lSjaFl50s47X8wXcCTF6oofiw3s9CvhNva8PVGY4EQx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712721; c=relaxed/simple;
	bh=DH6mTscSo+d2eFYgE3I0zneFKAcvKm9GLrcRJ63daUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xx9gJzcCbZN8575rLsrM1keiduW+ZZ5hC4CrVez6v+3/q+weXqjylg3+gM/ZGDxbOEFzADmN1IkiE3hokDfm5RE4hCQiO0MxI+nbpCSHnCCwf0F8sRz5JPlk1nRa+F8OMlY/xlIhCQUAMuWvpOUjE4VueT7riEWqmTYjZK+kq10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsZWpkxd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsZWpkxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750712719; x=1782248719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DH6mTscSo+d2eFYgE3I0zneFKAcvKm9GLrcRJ63daUw=;
  b=fsZWpkxdLG7WDjsTOKhY7Td4HOHhEs7rlTTJd2XuXQBNYSgqSJF9WNZO
   VXvcj5NvtYviPNyBp2a+os/0SvgvVnuOX6XHg7wq/4MfXy+fqgQRuBerD
   VXxEhWlqyO9X/rPDncAWDIONMacqLE0cGG3HlgvxJCQ3hicdtKp4Jg5kB
   rOdeM5vC7pDJ4qjTOXt77qNNWy2512uho794/tQmaeTEaIQGJqWL2JEB1
   Ff8e6MVxK5gbYzZufyffmYBoblE8ASi0twD/sm/HIQa+kpSQkWowhmDjb
   1PMcMdD1SGuen9LoHINJ6qzsPeW+EUKicxNYdytHYX1+vRd3T8Jl2KYZt
   A==;
X-CSE-ConnectionGUID: gLopuvTDTH++T9g2Mq63/g==
X-CSE-MsgGUID: X6OW2klmTHencwvjzyk80A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53025852"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="53025852"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 14:05:19 -0700
X-CSE-ConnectionGUID: L9nDIHS4QZKD+cmSlrh5JA==
X-CSE-MsgGUID: s8YBUSdwTI2xwax1SUeHTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="175318802"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2025 14:05:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uToLr-000PL0-2m;
	Mon, 23 Jun 2025 21:05:15 +0000
Date: Tue, 24 Jun 2025 05:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:syscon-rework-4 7/9]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): compatible:
 ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
Message-ID: <202506240534.RyNIJXHn-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-4
head:   a881e712b79fbe72261980bc18b030bbb5c121b2
commit: e4aaaea614f2563c3416cf2c180bd72c7a4765ad [7/9] riscv: dts: microchip: convert clock and reset to use syscon
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: riscv-randconfig-052-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240534.RyNIJXHn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240534.RyNIJXHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506240534.RyNIJXHn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
