Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9381DF736
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023202; cv=none; b=gB/0Yhkbb4BoguHreEtJVUVGYnSOlMDUBtyGHp5oJtjJJ8WmFKW1wNUBF3ecKyODcBRD6cNBtayY1+i4b1w1LiczWT9ulfo3ilRyNY39/iSmF+qPDNWUujA4Puh6dwrwFH9UORMy99qgrEVhL295Mkc4RdSXwyGWB90mJ3ACSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023202; c=relaxed/simple;
	bh=i8eKrs5wO13PTSv+o8QHQ7dSEqThhdadB5EMzqlmwYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QpwvFE3T4uOzNJAgsqXH/7BvSNNVBTgIoMl+XA6Pz8Rf6HgGT2ooiYlLLlrgpJdo6mev8MZ0B0THa5rIzQ5QXXGIuHSbuTjn8H8OzUT/rs9pSJWIALdMwLuAkXaDxLE13U7ufoswGKNsVxX8gxFkCJ9uFKcOYIePPylF78Rck7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvnar/+U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvnar/+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768023200; x=1799559200;
  h=date:from:to:cc:subject:message-id;
  bh=i8eKrs5wO13PTSv+o8QHQ7dSEqThhdadB5EMzqlmwYE=;
  b=bvnar/+Uf2no44j2r53dtzZJr/a9QkoyAclgxhHmpVnDmA5AcseHWQn5
   mboZZi1EKLh7klZQWQLE6fJcstZJuL4+UuI+tTkVfjZuIZmdKsJsBLfP6
   nfbl9UVvVWwSmfJ3TcZeABFsub4EngReDSaalJXPPkhGPkrXSNfRhHaEI
   Sbl2EllgypVt25ngnzCAx8qy7KbEfeR1cvgpJboswaawKEbz8KI4W53VJ
   Uyr+/ziDgfh06alpr/d7KLG3Ja0zpljW2ru42Za0TTYQxqjqG0vSANhZK
   cXK1Y4fYpRazoiBqakozlJkaUr+aEsaXYniUd+Ett43cmM12ro+b0h1pF
   A==;
X-CSE-ConnectionGUID: C5xn0GkZSCGe/eKIK3Gwjw==
X-CSE-MsgGUID: 6SaFat9sT8iIm53w+MhbzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69308305"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69308305"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 21:33:19 -0800
X-CSE-ConnectionGUID: tasmsT93TcOosVDZVtpNkg==
X-CSE-MsgGUID: LWj9RV++QtKEFM69augrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203549486"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2026 21:33:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veRbA-000000008A8-3HZ4;
	Sat, 10 Jan 2026 05:33:16 +0000
Date: Sat, 10 Jan 2026 13:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.19-next/dts64 9/25]
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning
 (pci_device_reg): Failed prerequisite 'reg_format'
Message-ID: <202601101347.4iTBbI0F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sjoerd Simons <sjoerd@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.19-next/dts64
head:   fe96ff075f960abb9dd1c99c4c4e7f79c4e10172
commit: ecc68d72b50d17241ec9d44dca11633589bd0049 [9/25] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-003-20260109 (https://download.01.org/0day-ci/archive/20260110/202601101347.4iTBbI0F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101347.4iTBbI0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601101347.4iTBbI0F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:98.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:108.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:96.15-103.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:96.15-103.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:106.15-111.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts:106.15-111.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
