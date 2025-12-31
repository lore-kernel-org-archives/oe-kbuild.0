Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445919DF62
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767141081; cv=none; b=lEAA3Q1mVH0OtwFVNGOf0CSR0Yo/iUOSgKWHQqzhPWACegsh/H+45Ddd8V1qDBUsjetisUBh2PWu+/Lh84q5mZ3KSvq8sCspzeUjRLcXheypXs9IsYT2KN6CT7NCj+kXGgG/MtcFjHOS0T+3biNKmBIQHiOLYfXeTJRm7mTzG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767141081; c=relaxed/simple;
	bh=/ShrUAftNZ5XcPGm24khEjX2glPqxV8DABwiYobGqjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4lvNgV+Ka3DO7dyF/0xKeE/FFFTEQG7nw3T4+S3icSou2NT2GBvP+mdjGYWXWJVx9dknlnNV1F/jEgkvl3LGvfjE/PaNbQ74PR81Jul53YuWFU3QogyoDIymp3elzEjcmAH7HuL7YeT6EUSV4o3wcM4LyTVMuA/lSGjvNRIrfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISCzY1vf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISCzY1vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767141079; x=1798677079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ShrUAftNZ5XcPGm24khEjX2glPqxV8DABwiYobGqjA=;
  b=ISCzY1vf17WNlFVNrriaQlWZ+dxMLbHSEJ1Sp5gievVpEDPdpAmaVCli
   2yzIyF2EMfXC1j1m0ODiY1PaEOq1gxtztNGwtKTPQedREdAssCP3JcAKI
   XD+yFxbAMus75x9R9ZTV1uyqfeuNbYcO8/PjCDzaX3WpMh+dlqHZR7V08
   JjSZUZQBxT4SKCZx6DpIdfZoP7TzE8hh2s8cJSiDWXSMKM/wf4O2UyUcM
   qefJQNw3fmn66+Wiflviw/D3Kn/KzWvZhI/tfbykoCS+Ne1xtm0Hw4+sf
   Khmz8qui83PrXht1drx5vriWWx9S7Aq+ePZH8CCCqDGCzYuz3bwzmQKoi
   A==;
X-CSE-ConnectionGUID: ev1UUqWYRbu0vMHs3kUW7w==
X-CSE-MsgGUID: Hn2s1J6eRSmbUYq2pDsYUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72343294"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="72343294"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 16:31:19 -0800
X-CSE-ConnectionGUID: 0/OILF2FT4Sw63479+EgEw==
X-CSE-MsgGUID: jseoLb98SjenToYi4IdaUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="200465064"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Dec 2025 16:31:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vak7Q-00000000832-0BmC;
	Wed, 31 Dec 2025 00:31:16 +0000
Date: Wed, 31 Dec 2025 01:30:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:k1/for-next 5/6]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0b10000: failed
 to match any schema with compatible: ['spacemit,k1-combo-phy']
Message-ID: <202512310108.FnWHS6HK-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Alex Elder <elder@riscstar.com>
CC: Yixun Lan <dlan@gentoo.org>

tree:   https://github.com/spacemit-com/linux k1/for-next
head:   4f67c877a9069c60dfb1767038fba5180bc12d68
commit: 0be016a4b5d1b927de04e2e7a0a2bce51aacbfff [5/6] riscv: dts: spacemit: PCIe and PHY-related updates
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-2051-20251230 (https://download.01.org/0day-ci/archive/20251231/202512310108.FnWHS6HK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c9eb572b141746426560c650fadf9ab75cca9867)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310108.FnWHS6HK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512310108.FnWHS6HK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca800000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
