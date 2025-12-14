Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD829C33F
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765725620; cv=none; b=YrEvZDGxDp8WPmnfsK1rGPgFnd9mbmaQVIC2M/NsVfttRHydYp34qttU2oRdZVINp9pIyAbVhH0Bs73IYBzlzVrJakKUxLHrYjnd5lMs2bhDYNGKpRDpuIrhBQfhZcpWtd9yV8Esu4pe3ofQ6BJT/9WnXRN0MNFkUM/xS9OIGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765725620; c=relaxed/simple;
	bh=Ttc4dTqxhO/IlcGSt0+fgAdK/tNm4dr4ZEITkA3BlLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcElTwPYBNB0yCcjSAMndxU3+dVRaXRAT1W6A8bvKwLhOVf/7qVuDpqYgVLz9ozTXFB1WT46xDjEZSLs1odCkBez8slET+U5vj9gsXhCH7Kbw3EUe/6hubHwI94Lk69/V0KI/J8k0iie49HwhUUA8G+9MafG9FFCcYGJctUjyyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmB3j4PJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmB3j4PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765725618; x=1797261618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ttc4dTqxhO/IlcGSt0+fgAdK/tNm4dr4ZEITkA3BlLQ=;
  b=EmB3j4PJHDeJ5YqOLGRfgxYs5X4lzFxSUOE2H74BjQAUANRmyhLgRKIz
   1Kw8b+mKnPNGRj9FgxbssKnQoNobmBVnsYlLWIDAxp2RoiWeW4eu8W947
   CrMULZLKFzfI5hh7ipWBESlYAF1rnt4VQid+OLjATM1VpGgvdXemK4L0P
   /HR8xf5jnZMyWxpeTy+n9661J7HgZ1AzJq0cFmkTP5sqp+r2W0NW8WBjj
   A5mOA0jpQfK8e9/blQ9prpQ6nIRW4AWXutKbGng7ej4iCcYiu1XFfgUQY
   mO7fCtt94HHxbmfvBIlSsA1tGiDSxf1cjaeDV0t7wJjtEfxxfPiJjy8qz
   w==;
X-CSE-ConnectionGUID: dst5QsI4T1+q4/2qSONilA==
X-CSE-MsgGUID: uBSVSI7CRA6keRGOIqywdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67687012"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67687012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 07:20:16 -0800
X-CSE-ConnectionGUID: 35u4Om1FRxOZz4HEJlFg3g==
X-CSE-MsgGUID: E6k9T2X7Q3CqDV93HW/zUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228182708"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 07:20:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUntN-00000000973-1w2n;
	Sun, 14 Dec 2025 15:20:13 +0000
Date: Sun, 14 Dec 2025 23:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202512142318.7SgEQA79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: arc-vdk_hs38_defconfig (https://download.01.org/0day-ci/archive/20251214/202512142318.7SgEQA79-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142318.7SgEQA79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512142318.7SgEQA79-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:24.22-28.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
