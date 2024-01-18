Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DF6132
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jan 2024 04:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705551598; cv=none; b=p6i9NtdfqwZdZkk8/YtzpkOFwCim8R8uW9KkFLPDEQDpbbjBiwfWTapCEuieBbpF/YARiCyLPcpGrws70XvX0SFsFHGePmUnBEJnYq7uV1Mo6MBQPdNuhynbEvolffMlwGDK09dnROUm/P9lhjtz5uOB4B4fU+Ni+N8X+0RAkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705551598; c=relaxed/simple;
	bh=Z3eu9G5ISgccKDqZLoIF5grc1fF0xXTL+L++3u6ICzI=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=GfYpTC0OeccMB6MuTgHladrfGngfkKN1rHEu5u7ENIXfv4ftrlbIGJhSDce+eY11H6qGj+/DvmSfX3ev9OvrPTxRMG0uEbR4DvfveOvWazzaho/nBM9V4OP1L1kqegeArZEraXoAPeY9YAI7Ugj2LOzeLpTYb2c7KgO/LAaYwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZJuWVKX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZJuWVKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705551595; x=1737087595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3eu9G5ISgccKDqZLoIF5grc1fF0xXTL+L++3u6ICzI=;
  b=MZJuWVKX3NvJlGORWjvawQM8Iio9TyHQ6l9ucUUwt35eecz6U4VD1odR
   QtCnKUnG0145ttqOpBa26zfXNcUocggDRn4EvqbnPo3cDIGMwLpSa7yCU
   mrLnin8mjbKnQOJkp/tN6gUkfAUDcV4z6s7w7jRUMnBJBTfJu4h8D7wp3
   KiT/7RvSmerFRazrHQcqZW7S1w9ub7Kwjopt+VtpmfKsRM7aWK7vy65Bq
   xyJ1XXBUUuFm/dLAq//xdFbuvlT6AJqhQyjoxNmDzTAZf/Nmeajka/y7d
   VqqMODISdmcHg2QC5k7DDzLwfVDzCLIsNrZF7D82ZqIB6xxgX9dbEtINP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21828357"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="21828357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 20:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="214695"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2024 20:19:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQJsd-0002dS-28;
	Thu, 18 Jan 2024 04:19:51 +0000
Date: Thu, 18 Jan 2024 12:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.4 4/26] dtbs_check:
 arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_reg):
 Failed prerequisite 'reg_format'
Message-ID: <202401181235.njZUy2u3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   d0f9d7ffac45b1b5471e3e8e1aee6b70c8be0cc6
commit: ae731dda9a603073b32b2daaafdaea6d294acc45 [4/26] BACKPORT: FROMLIST: arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs
:::::: branch date: 34 hours ago
:::::: commit date: 8 days ago
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240118/202401181235.njZUy2u3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401181235.njZUy2u3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:718.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data1@4c:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:722.5-23: Warning (reg_format): /soc/efuse@11f10000/socinfo-data2@60:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:172.36-179.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:180.36-187.6: Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:208.23-241.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183-evb.dts:267.23-285.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc1@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:744.26-750.6: Warning (unit_address_format): /soc/usb-phy@11f40000/usb-phy@0700: unit name should not have leading 0s
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:717.21-719.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data1@4c: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:721.21-723.6: Warning (avoid_default_addr_size): /soc/efuse@11f10000/socinfo-data2@60: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
