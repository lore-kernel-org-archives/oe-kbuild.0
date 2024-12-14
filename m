Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E7C26AC3
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734157402; cv=none; b=kZwWB5tOK3KAw2JNCQgz1RDrch+rVntcy1PU803M7F+lY/W9/2VCj+eh2LiyKcrfLmWfgRmwaxzIP64dZBeH+ZMEhFyIcIhy5cBFFYXOZaokSkmQ3Df45Xt9ces+4+JWNyqrU7NxdXraKNkGyxFe/bECE/jAVfsgB+2jHGmESVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734157402; c=relaxed/simple;
	bh=QnkNpuUtWrfypvVmW6b8437MN0/CTAxkW18aDDqKbTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCcIozNdwwvr/aARIwbjSaYVOs9HjbQrUu1N3o42HoiZZBC4o/R+HVocGOiN2KTDB6HWYpeuIZtT7SSSsMLJ2cAFUHTw0shckEDjCZENhYLNYxv4nZQ2lWXuC4xClZeFRMloOI7cAyLs2ZuoUW3ow3qB6yrZb3j2YFQtZsVo6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOLobk3S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOLobk3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734157387; x=1765693387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnkNpuUtWrfypvVmW6b8437MN0/CTAxkW18aDDqKbTo=;
  b=XOLobk3S0BljVQR+DmqbXpu9BE5bC4L7DOy4armpOdmATBApVHmUYIXq
   zHIAx5HREQZv0TNyzXQ8y2Wp19UafMMCGgh/m1HB6gxn5SgHEt0zl5ZgH
   gV0y/Msduvsg/4wATtToGqU5gc1N8RRd9qPtJRqDC49uExHtbebGV21Ia
   3MCWBOt/MGMa6PtuQgWsMfUuFJDhgVWbgaRCT4wPYIP+7E6SyTXW4SuhB
   SHMtsagr+JqJR9mRao9I+phFanjUUtdR5jyQG8aRaZHBDkok1lBEhC/EK
   FeoWweh0TyEWI/B16FvCY9Yecxk7J2orZUUfDfL/Vnm/zvnUeYFCKhtzD
   w==;
X-CSE-ConnectionGUID: M5JrINs/SayXjHEKHxrcRA==
X-CSE-MsgGUID: O+Yck4ppT5WUx+zCOOpDzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46021867"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46021867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 22:23:06 -0800
X-CSE-ConnectionGUID: iIzG2XhQQFSkbC/rGLAV8Q==
X-CSE-MsgGUID: AQOYiERpT1SOWXKaiWMmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="96475489"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2024 22:23:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMLYM-000CkZ-1M;
	Sat, 14 Dec 2024 06:23:02 +0000
Date: Sat, 14 Dec 2024 14:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <202412141422.MknhCRdA-lkp@intel.com>
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
In-Reply-To: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
TO: Yuanfang Zhang <quic_yuanfang@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: kernel@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yuanfang Zhang <quic_yuanfang@quicinc.com>

Hi Yuanfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanfang-Zhang/arm64-dts-qcom-Add-coresight-node-for-SM8650/20241210-162552
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc%40quicinc.com
patch subject: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r071-20241213 (https://download.01.org/0day-ci/archive/20241214/202412141422.MknhCRdA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412141422.MknhCRdA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5678.6-16: Warning (reg_format): /soc@0/funnel_ete/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5705.6-16: Warning (reg_format): /soc@0/funnel@13810000/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5732.6-16: Warning (reg_format): /soc@0/funnel@10042000/in-ports/port@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.6-16: Warning (reg_format): /soc@0/funnel@10b04000/in-ports/port@7:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #size-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #address-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5678.6-16: Warning (reg_format): /soc@0/funnel_ete/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5705.6-16: Warning (reg_format): /soc@0/funnel@13810000/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5732.6-16: Warning (reg_format): /soc@0/funnel@10042000/in-ports/port@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.6-16: Warning (reg_format): /soc@0/funnel@10b04000/in-ports/port@7:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #size-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #address-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5678.6-16: Warning (reg_format): /soc@0/funnel_ete/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5705.6-16: Warning (reg_format): /soc@0/funnel@13810000/in-ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5732.6-16: Warning (reg_format): /soc@0/funnel@10042000/in-ports/port@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.6-16: Warning (reg_format): /soc@0/funnel@10b04000/in-ports/port@7:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (avoid_default_addr_size): /soc@0/funnel_ete/in-ports/port@0: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (avoid_default_addr_size): /soc@0/funnel@13810000/in-ports/port@0: Relying on default #size-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #address-cells value
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (avoid_default_addr_size): /soc@0/funnel@10042000/in-ports/port@4: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #address-cells value
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (avoid_default_addr_size): /soc@0/funnel@10b04000/in-ports/port@7: Relying on default #size-cells value
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5677.12-5683.7: Warning (graph_port): /soc@0/funnel_ete/in-ports/port@0: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5704.12-5710.7: Warning (graph_port): /soc@0/funnel@13810000/in-ports/port@0: graph node '#size-cells' is -1, must be 0
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5731.12-5737.7: Warning (graph_port): /soc@0/funnel@10042000/in-ports/port@4: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#address-cells' is -1, must be 1
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:5788.12-5794.7: Warning (graph_port): /soc@0/funnel@10b04000/in-ports/port@7: graph node '#size-cells' is -1, must be 0
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_port'

vim +5678 arch/arm64/boot/dts/qcom/sm8650.dtsi

d2350377997f360 Neil Armstrong        2023-11-30    28  
d2350377997f360 Neil Armstrong        2023-11-30    29  / {
d2350377997f360 Neil Armstrong        2023-11-30    30  	interrupt-parent = <&intc>;
d2350377997f360 Neil Armstrong        2023-11-30    31  
d2350377997f360 Neil Armstrong        2023-11-30    32  	#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    33  	#size-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    34  
d2350377997f360 Neil Armstrong        2023-11-30    35  	chosen { };
d2350377997f360 Neil Armstrong        2023-11-30    36  
d2350377997f360 Neil Armstrong        2023-11-30    37  	clocks {
d2350377997f360 Neil Armstrong        2023-11-30    38  		xo_board: xo-board {
d2350377997f360 Neil Armstrong        2023-11-30    39  			compatible = "fixed-clock";
d2350377997f360 Neil Armstrong        2023-11-30    40  			#clock-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30    41  		};
d2350377997f360 Neil Armstrong        2023-11-30    42  
d2350377997f360 Neil Armstrong        2023-11-30    43  		sleep_clk: sleep-clk {
d2350377997f360 Neil Armstrong        2023-11-30    44  			compatible = "fixed-clock";
d2350377997f360 Neil Armstrong        2023-11-30    45  			#clock-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30    46  		};
d2350377997f360 Neil Armstrong        2023-11-30    47  
d2350377997f360 Neil Armstrong        2023-11-30    48  		bi_tcxo_div2: bi-tcxo-div2-clk {
d2350377997f360 Neil Armstrong        2023-11-30    49  			compatible = "fixed-factor-clock";
d2350377997f360 Neil Armstrong        2023-11-30    50  			#clock-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30    51  
d2350377997f360 Neil Armstrong        2023-11-30    52  			clocks = <&rpmhcc RPMH_CXO_CLK>;
d2350377997f360 Neil Armstrong        2023-11-30    53  			clock-mult = <1>;
d2350377997f360 Neil Armstrong        2023-11-30    54  			clock-div = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    55  		};
d2350377997f360 Neil Armstrong        2023-11-30    56  
d2350377997f360 Neil Armstrong        2023-11-30    57  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
d2350377997f360 Neil Armstrong        2023-11-30    58  			compatible = "fixed-factor-clock";
d2350377997f360 Neil Armstrong        2023-11-30    59  			#clock-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30    60  
d2350377997f360 Neil Armstrong        2023-11-30    61  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
d2350377997f360 Neil Armstrong        2023-11-30    62  			clock-mult = <1>;
d2350377997f360 Neil Armstrong        2023-11-30    63  			clock-div = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    64  		};
d2350377997f360 Neil Armstrong        2023-11-30    65  	};
d2350377997f360 Neil Armstrong        2023-11-30    66  
d2350377997f360 Neil Armstrong        2023-11-30    67  	cpus {
d2350377997f360 Neil Armstrong        2023-11-30    68  		#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    69  		#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30    70  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    71  		cpu0: cpu@0 {
d2350377997f360 Neil Armstrong        2023-11-30    72  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30    73  			compatible = "arm,cortex-a520";
d2350377997f360 Neil Armstrong        2023-11-30    74  			reg = <0 0>;
d2350377997f360 Neil Armstrong        2023-11-30    75  
d2350377997f360 Neil Armstrong        2023-11-30    76  			clocks = <&cpufreq_hw 0>;
d2350377997f360 Neil Armstrong        2023-11-30    77  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    78  			power-domains = <&cpu_pd0>;
d2350377997f360 Neil Armstrong        2023-11-30    79  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30    80  
d2350377997f360 Neil Armstrong        2023-11-30    81  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    82  			next-level-cache = <&l2_0>;
d2350377997f360 Neil Armstrong        2023-11-30    83  			capacity-dmips-mhz = <1024>;
d2350377997f360 Neil Armstrong        2023-11-30    84  			dynamic-power-coefficient = <100>;
d2350377997f360 Neil Armstrong        2023-11-30    85  
d2350377997f360 Neil Armstrong        2023-11-30    86  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f360 Neil Armstrong        2023-11-30    87  
d2350377997f360 Neil Armstrong        2023-11-30    88  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    89  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    90  			l2_0: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30    91  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30    92  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30    93  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    94  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30    95  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22    96  				l3_0: l3-cache {
d2350377997f360 Neil Armstrong        2023-11-30    97  					compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30    98  					cache-level = <3>;
d2350377997f360 Neil Armstrong        2023-11-30    99  					cache-unified;
d2350377997f360 Neil Armstrong        2023-11-30   100  				};
d2350377997f360 Neil Armstrong        2023-11-30   101  			};
d2350377997f360 Neil Armstrong        2023-11-30   102  		};
d2350377997f360 Neil Armstrong        2023-11-30   103  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   104  		cpu1: cpu@100 {
d2350377997f360 Neil Armstrong        2023-11-30   105  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   106  			compatible = "arm,cortex-a520";
d2350377997f360 Neil Armstrong        2023-11-30   107  			reg = <0 0x100>;
d2350377997f360 Neil Armstrong        2023-11-30   108  
d2350377997f360 Neil Armstrong        2023-11-30   109  			clocks = <&cpufreq_hw 0>;
d2350377997f360 Neil Armstrong        2023-11-30   110  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   111  			power-domains = <&cpu_pd1>;
d2350377997f360 Neil Armstrong        2023-11-30   112  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   113  
d2350377997f360 Neil Armstrong        2023-11-30   114  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   115  			next-level-cache = <&l2_0>;
d2350377997f360 Neil Armstrong        2023-11-30   116  			capacity-dmips-mhz = <1024>;
d2350377997f360 Neil Armstrong        2023-11-30   117  			dynamic-power-coefficient = <100>;
d2350377997f360 Neil Armstrong        2023-11-30   118  
d2350377997f360 Neil Armstrong        2023-11-30   119  			qcom,freq-domain = <&cpufreq_hw 0>;
d2350377997f360 Neil Armstrong        2023-11-30   120  
d2350377997f360 Neil Armstrong        2023-11-30   121  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   122  		};
d2350377997f360 Neil Armstrong        2023-11-30   123  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   124  		cpu2: cpu@200 {
d2350377997f360 Neil Armstrong        2023-11-30   125  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   126  			compatible = "arm,cortex-a720";
d2350377997f360 Neil Armstrong        2023-11-30   127  			reg = <0 0x200>;
d2350377997f360 Neil Armstrong        2023-11-30   128  
d2350377997f360 Neil Armstrong        2023-11-30   129  			clocks = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   130  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   131  			power-domains = <&cpu_pd2>;
d2350377997f360 Neil Armstrong        2023-11-30   132  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   133  
d2350377997f360 Neil Armstrong        2023-11-30   134  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   135  			next-level-cache = <&l2_200>;
d2350377997f360 Neil Armstrong        2023-11-30   136  			capacity-dmips-mhz = <1792>;
d2350377997f360 Neil Armstrong        2023-11-30   137  			dynamic-power-coefficient = <238>;
d2350377997f360 Neil Armstrong        2023-11-30   138  
d2350377997f360 Neil Armstrong        2023-11-30   139  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   140  
d2350377997f360 Neil Armstrong        2023-11-30   141  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   142  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   143  			l2_200: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30   144  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30   145  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   146  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   147  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30   148  			};
d2350377997f360 Neil Armstrong        2023-11-30   149  		};
d2350377997f360 Neil Armstrong        2023-11-30   150  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   151  		cpu3: cpu@300 {
d2350377997f360 Neil Armstrong        2023-11-30   152  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   153  			compatible = "arm,cortex-a720";
d2350377997f360 Neil Armstrong        2023-11-30   154  			reg = <0 0x300>;
d2350377997f360 Neil Armstrong        2023-11-30   155  
d2350377997f360 Neil Armstrong        2023-11-30   156  			clocks = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   157  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   158  			power-domains = <&cpu_pd3>;
d2350377997f360 Neil Armstrong        2023-11-30   159  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   160  
d2350377997f360 Neil Armstrong        2023-11-30   161  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   162  			next-level-cache = <&l2_200>;
d2350377997f360 Neil Armstrong        2023-11-30   163  			capacity-dmips-mhz = <1792>;
d2350377997f360 Neil Armstrong        2023-11-30   164  			dynamic-power-coefficient = <238>;
d2350377997f360 Neil Armstrong        2023-11-30   165  
d2350377997f360 Neil Armstrong        2023-11-30   166  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   167  
d2350377997f360 Neil Armstrong        2023-11-30   168  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   169  		};
d2350377997f360 Neil Armstrong        2023-11-30   170  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   171  		cpu4: cpu@400 {
d2350377997f360 Neil Armstrong        2023-11-30   172  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   173  			compatible = "arm,cortex-a720";
d2350377997f360 Neil Armstrong        2023-11-30   174  			reg = <0 0x400>;
d2350377997f360 Neil Armstrong        2023-11-30   175  
d2350377997f360 Neil Armstrong        2023-11-30   176  			clocks = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   177  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   178  			power-domains = <&cpu_pd4>;
d2350377997f360 Neil Armstrong        2023-11-30   179  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   180  
d2350377997f360 Neil Armstrong        2023-11-30   181  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   182  			next-level-cache = <&l2_400>;
d2350377997f360 Neil Armstrong        2023-11-30   183  			capacity-dmips-mhz = <1792>;
d2350377997f360 Neil Armstrong        2023-11-30   184  			dynamic-power-coefficient = <238>;
d2350377997f360 Neil Armstrong        2023-11-30   185  
d2350377997f360 Neil Armstrong        2023-11-30   186  			qcom,freq-domain = <&cpufreq_hw 3>;
d2350377997f360 Neil Armstrong        2023-11-30   187  
d2350377997f360 Neil Armstrong        2023-11-30   188  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   189  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   190  			l2_400: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30   191  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30   192  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   193  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   194  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30   195  			};
d2350377997f360 Neil Armstrong        2023-11-30   196  		};
d2350377997f360 Neil Armstrong        2023-11-30   197  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   198  		cpu5: cpu@500 {
d2350377997f360 Neil Armstrong        2023-11-30   199  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   200  			compatible = "arm,cortex-a720";
d2350377997f360 Neil Armstrong        2023-11-30   201  			reg = <0 0x500>;
d2350377997f360 Neil Armstrong        2023-11-30   202  
d2350377997f360 Neil Armstrong        2023-11-30   203  			clocks = <&cpufreq_hw 1>;
d2350377997f360 Neil Armstrong        2023-11-30   204  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   205  			power-domains = <&cpu_pd5>;
d2350377997f360 Neil Armstrong        2023-11-30   206  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   207  
d2350377997f360 Neil Armstrong        2023-11-30   208  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   209  			next-level-cache = <&l2_500>;
d2350377997f360 Neil Armstrong        2023-11-30   210  			capacity-dmips-mhz = <1792>;
d2350377997f360 Neil Armstrong        2023-11-30   211  			dynamic-power-coefficient = <238>;
d2350377997f360 Neil Armstrong        2023-11-30   212  
d2350377997f360 Neil Armstrong        2023-11-30   213  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f360 Neil Armstrong        2023-11-30   214  
d2350377997f360 Neil Armstrong        2023-11-30   215  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   216  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   217  			l2_500: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30   218  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30   219  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   220  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   221  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30   222  			};
d2350377997f360 Neil Armstrong        2023-11-30   223  		};
d2350377997f360 Neil Armstrong        2023-11-30   224  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   225  		cpu6: cpu@600 {
d2350377997f360 Neil Armstrong        2023-11-30   226  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   227  			compatible = "arm,cortex-a720";
d2350377997f360 Neil Armstrong        2023-11-30   228  			reg = <0 0x600>;
d2350377997f360 Neil Armstrong        2023-11-30   229  
d2350377997f360 Neil Armstrong        2023-11-30   230  			clocks = <&cpufreq_hw 1>;
d2350377997f360 Neil Armstrong        2023-11-30   231  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   232  			power-domains = <&cpu_pd6>;
d2350377997f360 Neil Armstrong        2023-11-30   233  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   234  
d2350377997f360 Neil Armstrong        2023-11-30   235  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   236  			next-level-cache = <&l2_600>;
d2350377997f360 Neil Armstrong        2023-11-30   237  			capacity-dmips-mhz = <1792>;
d2350377997f360 Neil Armstrong        2023-11-30   238  			dynamic-power-coefficient = <238>;
d2350377997f360 Neil Armstrong        2023-11-30   239  
d2350377997f360 Neil Armstrong        2023-11-30   240  			qcom,freq-domain = <&cpufreq_hw 1>;
d2350377997f360 Neil Armstrong        2023-11-30   241  
d2350377997f360 Neil Armstrong        2023-11-30   242  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   243  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   244  			l2_600: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30   245  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30   246  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   247  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   248  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30   249  			};
d2350377997f360 Neil Armstrong        2023-11-30   250  		};
d2350377997f360 Neil Armstrong        2023-11-30   251  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   252  		cpu7: cpu@700 {
d2350377997f360 Neil Armstrong        2023-11-30   253  			device_type = "cpu";
d2350377997f360 Neil Armstrong        2023-11-30   254  			compatible = "arm,cortex-x4";
d2350377997f360 Neil Armstrong        2023-11-30   255  			reg = <0 0x700>;
d2350377997f360 Neil Armstrong        2023-11-30   256  
d2350377997f360 Neil Armstrong        2023-11-30   257  			clocks = <&cpufreq_hw 2>;
d2350377997f360 Neil Armstrong        2023-11-30   258  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   259  			power-domains = <&cpu_pd7>;
d2350377997f360 Neil Armstrong        2023-11-30   260  			power-domain-names = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   261  
d2350377997f360 Neil Armstrong        2023-11-30   262  			enable-method = "psci";
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   263  			next-level-cache = <&l2_700>;
d2350377997f360 Neil Armstrong        2023-11-30   264  			capacity-dmips-mhz = <1894>;
d2350377997f360 Neil Armstrong        2023-11-30   265  			dynamic-power-coefficient = <588>;
d2350377997f360 Neil Armstrong        2023-11-30   266  
d2350377997f360 Neil Armstrong        2023-11-30   267  			qcom,freq-domain = <&cpufreq_hw 2>;
d2350377997f360 Neil Armstrong        2023-11-30   268  
d2350377997f360 Neil Armstrong        2023-11-30   269  			#cooling-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   270  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   271  			l2_700: l2-cache {
d2350377997f360 Neil Armstrong        2023-11-30   272  				compatible = "cache";
d2350377997f360 Neil Armstrong        2023-11-30   273  				cache-level = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   274  				cache-unified;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   275  				next-level-cache = <&l3_0>;
d2350377997f360 Neil Armstrong        2023-11-30   276  			};
d2350377997f360 Neil Armstrong        2023-11-30   277  		};
d2350377997f360 Neil Armstrong        2023-11-30   278  
d2350377997f360 Neil Armstrong        2023-11-30   279  		cpu-map {
d2350377997f360 Neil Armstrong        2023-11-30   280  			cluster0 {
d2350377997f360 Neil Armstrong        2023-11-30   281  				core0 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   282  					cpu = <&cpu0>;
d2350377997f360 Neil Armstrong        2023-11-30   283  				};
d2350377997f360 Neil Armstrong        2023-11-30   284  
d2350377997f360 Neil Armstrong        2023-11-30   285  				core1 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   286  					cpu = <&cpu1>;
d2350377997f360 Neil Armstrong        2023-11-30   287  				};
d2350377997f360 Neil Armstrong        2023-11-30   288  
d2350377997f360 Neil Armstrong        2023-11-30   289  				core2 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   290  					cpu = <&cpu2>;
d2350377997f360 Neil Armstrong        2023-11-30   291  				};
d2350377997f360 Neil Armstrong        2023-11-30   292  
d2350377997f360 Neil Armstrong        2023-11-30   293  				core3 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   294  					cpu = <&cpu3>;
d2350377997f360 Neil Armstrong        2023-11-30   295  				};
d2350377997f360 Neil Armstrong        2023-11-30   296  
d2350377997f360 Neil Armstrong        2023-11-30   297  				core4 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   298  					cpu = <&cpu4>;
d2350377997f360 Neil Armstrong        2023-11-30   299  				};
d2350377997f360 Neil Armstrong        2023-11-30   300  
d2350377997f360 Neil Armstrong        2023-11-30   301  				core5 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   302  					cpu = <&cpu5>;
d2350377997f360 Neil Armstrong        2023-11-30   303  				};
d2350377997f360 Neil Armstrong        2023-11-30   304  
d2350377997f360 Neil Armstrong        2023-11-30   305  				core6 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   306  					cpu = <&cpu6>;
d2350377997f360 Neil Armstrong        2023-11-30   307  				};
d2350377997f360 Neil Armstrong        2023-11-30   308  
d2350377997f360 Neil Armstrong        2023-11-30   309  				core7 {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   310  					cpu = <&cpu7>;
d2350377997f360 Neil Armstrong        2023-11-30   311  				};
d2350377997f360 Neil Armstrong        2023-11-30   312  			};
d2350377997f360 Neil Armstrong        2023-11-30   313  		};
d2350377997f360 Neil Armstrong        2023-11-30   314  
d2350377997f360 Neil Armstrong        2023-11-30   315  		idle-states {
d2350377997f360 Neil Armstrong        2023-11-30   316  			entry-method = "psci";
d2350377997f360 Neil Armstrong        2023-11-30   317  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   318  			silver_cpu_sleep_0: cpu-sleep-0-0 {
d2350377997f360 Neil Armstrong        2023-11-30   319  				compatible = "arm,idle-state";
d2350377997f360 Neil Armstrong        2023-11-30   320  				idle-state-name = "silver-rail-power-collapse";
d2350377997f360 Neil Armstrong        2023-11-30   321  				arm,psci-suspend-param = <0x40000004>;
d2350377997f360 Neil Armstrong        2023-11-30   322  				entry-latency-us = <550>;
d2350377997f360 Neil Armstrong        2023-11-30   323  				exit-latency-us = <750>;
d2350377997f360 Neil Armstrong        2023-11-30   324  				min-residency-us = <6700>;
d2350377997f360 Neil Armstrong        2023-11-30   325  				local-timer-stop;
d2350377997f360 Neil Armstrong        2023-11-30   326  			};
d2350377997f360 Neil Armstrong        2023-11-30   327  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   328  			gold_cpu_sleep_0: cpu-sleep-1-0 {
d2350377997f360 Neil Armstrong        2023-11-30   329  				compatible = "arm,idle-state";
d2350377997f360 Neil Armstrong        2023-11-30   330  				idle-state-name = "gold-rail-power-collapse";
d2350377997f360 Neil Armstrong        2023-11-30   331  				arm,psci-suspend-param = <0x40000004>;
d2350377997f360 Neil Armstrong        2023-11-30   332  				entry-latency-us = <600>;
d2350377997f360 Neil Armstrong        2023-11-30   333  				exit-latency-us = <1300>;
d2350377997f360 Neil Armstrong        2023-11-30   334  				min-residency-us = <8136>;
d2350377997f360 Neil Armstrong        2023-11-30   335  				local-timer-stop;
d2350377997f360 Neil Armstrong        2023-11-30   336  			};
d2350377997f360 Neil Armstrong        2023-11-30   337  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   338  			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
d2350377997f360 Neil Armstrong        2023-11-30   339  				compatible = "arm,idle-state";
d2350377997f360 Neil Armstrong        2023-11-30   340  				idle-state-name = "gold-plus-rail-power-collapse";
d2350377997f360 Neil Armstrong        2023-11-30   341  				arm,psci-suspend-param = <0x40000004>;
d2350377997f360 Neil Armstrong        2023-11-30   342  				entry-latency-us = <500>;
d2350377997f360 Neil Armstrong        2023-11-30   343  				exit-latency-us = <1350>;
d2350377997f360 Neil Armstrong        2023-11-30   344  				min-residency-us = <7480>;
d2350377997f360 Neil Armstrong        2023-11-30   345  				local-timer-stop;
d2350377997f360 Neil Armstrong        2023-11-30   346  			};
d2350377997f360 Neil Armstrong        2023-11-30   347  		};
d2350377997f360 Neil Armstrong        2023-11-30   348  
d2350377997f360 Neil Armstrong        2023-11-30   349  		domain-idle-states {
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   350  			cluster_sleep_0: cluster-sleep-0 {
d2350377997f360 Neil Armstrong        2023-11-30   351  				compatible = "domain-idle-state";
d2350377997f360 Neil Armstrong        2023-11-30   352  				arm,psci-suspend-param = <0x41000044>;
d2350377997f360 Neil Armstrong        2023-11-30   353  				entry-latency-us = <750>;
d2350377997f360 Neil Armstrong        2023-11-30   354  				exit-latency-us = <2350>;
d2350377997f360 Neil Armstrong        2023-11-30   355  				min-residency-us = <9144>;
d2350377997f360 Neil Armstrong        2023-11-30   356  			};
d2350377997f360 Neil Armstrong        2023-11-30   357  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   358  			cluster_sleep_1: cluster-sleep-1 {
d2350377997f360 Neil Armstrong        2023-11-30   359  				compatible = "domain-idle-state";
d2350377997f360 Neil Armstrong        2023-11-30   360  				arm,psci-suspend-param = <0x4100c344>;
d2350377997f360 Neil Armstrong        2023-11-30   361  				entry-latency-us = <2800>;
d2350377997f360 Neil Armstrong        2023-11-30   362  				exit-latency-us = <4400>;
d2350377997f360 Neil Armstrong        2023-11-30   363  				min-residency-us = <10150>;
d2350377997f360 Neil Armstrong        2023-11-30   364  			};
d2350377997f360 Neil Armstrong        2023-11-30   365  		};
d2350377997f360 Neil Armstrong        2023-11-30   366  	};
d2350377997f360 Neil Armstrong        2023-11-30   367  
d2350377997f360 Neil Armstrong        2023-11-30   368  	firmware {
d2350377997f360 Neil Armstrong        2023-11-30   369  		scm: scm {
d2350377997f360 Neil Armstrong        2023-11-30   370  			compatible = "qcom,scm-sm8650", "qcom,scm";
49e950487b3e55c Mukesh Ojha           2024-05-17   371  			qcom,dload-mode = <&tcsr 0x19000>;
10e024671295184 Neil Armstrong        2023-11-30   372  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   373  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
d2350377997f360 Neil Armstrong        2023-11-30   374  		};
d2350377997f360 Neil Armstrong        2023-11-30   375  	};
d2350377997f360 Neil Armstrong        2023-11-30   376  
10e024671295184 Neil Armstrong        2023-11-30   377  	clk_virt: interconnect-0 {
10e024671295184 Neil Armstrong        2023-11-30   378  		compatible = "qcom,sm8650-clk-virt";
10e024671295184 Neil Armstrong        2023-11-30   379  		#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   380  		qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30   381  	};
10e024671295184 Neil Armstrong        2023-11-30   382  
10e024671295184 Neil Armstrong        2023-11-30   383  	mc_virt: interconnect-1 {
10e024671295184 Neil Armstrong        2023-11-30   384  		compatible = "qcom,sm8650-mc-virt";
10e024671295184 Neil Armstrong        2023-11-30   385  		#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   386  		qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30   387  	};
10e024671295184 Neil Armstrong        2023-11-30   388  
d2350377997f360 Neil Armstrong        2023-11-30   389  	memory@a0000000 {
d2350377997f360 Neil Armstrong        2023-11-30   390  		device_type = "memory";
d2350377997f360 Neil Armstrong        2023-11-30   391  		/* We expect the bootloader to fill in the size */
d2350377997f360 Neil Armstrong        2023-11-30   392  		reg = <0 0xa0000000 0 0>;
d2350377997f360 Neil Armstrong        2023-11-30   393  	};
d2350377997f360 Neil Armstrong        2023-11-30   394  
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   395) 	pmu-a520 {
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   396) 		compatible = "arm,cortex-a520-pmu";
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   397) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   398) 	};
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   399) 
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   400) 	pmu-a720 {
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   401) 		compatible = "arm,cortex-a720-pmu";
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   402) 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   403) 	};
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   404) 
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   405) 	pmu-x4 {
c8a346e408cb2e5 Rob Herring (Arm      2024-04-17   406) 		compatible = "arm,cortex-x4-pmu";
d2350377997f360 Neil Armstrong        2023-11-30   407  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
d2350377997f360 Neil Armstrong        2023-11-30   408  	};
d2350377997f360 Neil Armstrong        2023-11-30   409  
d2350377997f360 Neil Armstrong        2023-11-30   410  	psci {
d2350377997f360 Neil Armstrong        2023-11-30   411  		compatible = "arm,psci-1.0";
d2350377997f360 Neil Armstrong        2023-11-30   412  		method = "smc";
d2350377997f360 Neil Armstrong        2023-11-30   413  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   414  		cpu_pd0: power-domain-cpu0 {
d2350377997f360 Neil Armstrong        2023-11-30   415  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   416  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   417  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   418  		};
d2350377997f360 Neil Armstrong        2023-11-30   419  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   420  		cpu_pd1: power-domain-cpu1 {
d2350377997f360 Neil Armstrong        2023-11-30   421  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   422  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   423  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   424  		};
d2350377997f360 Neil Armstrong        2023-11-30   425  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   426  		cpu_pd2: power-domain-cpu2 {
d2350377997f360 Neil Armstrong        2023-11-30   427  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   428  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   429  			domain-idle-states = <&silver_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   430  		};
d2350377997f360 Neil Armstrong        2023-11-30   431  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   432  		cpu_pd3: power-domain-cpu3 {
d2350377997f360 Neil Armstrong        2023-11-30   433  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   434  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   435  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   436  		};
d2350377997f360 Neil Armstrong        2023-11-30   437  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   438  		cpu_pd4: power-domain-cpu4 {
d2350377997f360 Neil Armstrong        2023-11-30   439  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   440  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   441  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   442  		};
d2350377997f360 Neil Armstrong        2023-11-30   443  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   444  		cpu_pd5: power-domain-cpu5 {
d2350377997f360 Neil Armstrong        2023-11-30   445  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   446  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   447  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   448  		};
d2350377997f360 Neil Armstrong        2023-11-30   449  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   450  		cpu_pd6: power-domain-cpu6 {
d2350377997f360 Neil Armstrong        2023-11-30   451  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   452  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   453  			domain-idle-states = <&gold_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   454  		};
d2350377997f360 Neil Armstrong        2023-11-30   455  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   456  		cpu_pd7: power-domain-cpu7 {
d2350377997f360 Neil Armstrong        2023-11-30   457  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   458  			power-domains = <&cluster_pd>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   459  			domain-idle-states = <&gold_plus_cpu_sleep_0>;
d2350377997f360 Neil Armstrong        2023-11-30   460  		};
d2350377997f360 Neil Armstrong        2023-11-30   461  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   462  		cluster_pd: power-domain-cluster {
d2350377997f360 Neil Armstrong        2023-11-30   463  			#power-domain-cells = <0>;
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   464  			domain-idle-states = <&cluster_sleep_0>,
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22   465  					     <&cluster_sleep_1>;
d2350377997f360 Neil Armstrong        2023-11-30   466  		};
d2350377997f360 Neil Armstrong        2023-11-30   467  	};
d2350377997f360 Neil Armstrong        2023-11-30   468  
d2350377997f360 Neil Armstrong        2023-11-30   469  	reserved_memory: reserved-memory {
d2350377997f360 Neil Armstrong        2023-11-30   470  		#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   471  		#size-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   472  		ranges;
d2350377997f360 Neil Armstrong        2023-11-30   473  
d2350377997f360 Neil Armstrong        2023-11-30   474  		hyp_mem: hyp@80000000 {
d2350377997f360 Neil Armstrong        2023-11-30   475  			reg = <0 0x80000000 0 0xe00000>;
d2350377997f360 Neil Armstrong        2023-11-30   476  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   477  		};
d2350377997f360 Neil Armstrong        2023-11-30   478  
d2350377997f360 Neil Armstrong        2023-11-30   479  		cpusys_vm_mem: cpusys-vm@80e00000 {
d2350377997f360 Neil Armstrong        2023-11-30   480  			reg = <0 0x80e00000 0 0x400000>;
d2350377997f360 Neil Armstrong        2023-11-30   481  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   482  		};
d2350377997f360 Neil Armstrong        2023-11-30   483  
d2350377997f360 Neil Armstrong        2023-11-30   484  		/* Merged xbl_dtlog, xbl_ramdump and aop_image regions */
d2350377997f360 Neil Armstrong        2023-11-30   485  		xbl_dt_log_merged_mem: xbl-dt-log-merged@81a00000 {
d2350377997f360 Neil Armstrong        2023-11-30   486  			reg = <0 0x81a00000 0 0x260000>;
d2350377997f360 Neil Armstrong        2023-11-30   487  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   488  		};
d2350377997f360 Neil Armstrong        2023-11-30   489  
d2350377997f360 Neil Armstrong        2023-11-30   490  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
d2350377997f360 Neil Armstrong        2023-11-30   491  			compatible = "qcom,cmd-db";
d2350377997f360 Neil Armstrong        2023-11-30   492  			reg = <0 0x81c60000 0 0x20000>;
d2350377997f360 Neil Armstrong        2023-11-30   493  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   494  		};
d2350377997f360 Neil Armstrong        2023-11-30   495  
9b1e891179cacd1 Elliot Berman         2024-03-04   496  		/* Merged aop_config, tme_crash_dump, tme_log, uefi_log, and chipinfo regions */
d2350377997f360 Neil Armstrong        2023-11-30   497  		aop_tme_uefi_merged_mem: aop-tme-uefi-merged@81c80000 {
9b1e891179cacd1 Elliot Berman         2024-03-04   498  			reg = <0 0x81c80000 0 0x75000>;
d2350377997f360 Neil Armstrong        2023-11-30   499  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   500  		};
d2350377997f360 Neil Armstrong        2023-11-30   501  
d2350377997f360 Neil Armstrong        2023-11-30   502  		/* Secdata region can be reused by apps */
d2350377997f360 Neil Armstrong        2023-11-30   503  
d2350377997f360 Neil Armstrong        2023-11-30   504  		smem: smem@81d00000 {
d2350377997f360 Neil Armstrong        2023-11-30   505  			compatible = "qcom,smem";
d2350377997f360 Neil Armstrong        2023-11-30   506  			reg = <0 0x81d00000 0 0x200000>;
d2350377997f360 Neil Armstrong        2023-11-30   507  			hwlocks = <&tcsr_mutex 3>;
d2350377997f360 Neil Armstrong        2023-11-30   508  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   509  		};
d2350377997f360 Neil Armstrong        2023-11-30   510  
d2350377997f360 Neil Armstrong        2023-11-30   511  		adsp_mhi_mem: adsp-mhi@81f00000 {
d2350377997f360 Neil Armstrong        2023-11-30   512  			reg = <0 0x81f00000 0 0x20000>;
d2350377997f360 Neil Armstrong        2023-11-30   513  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   514  		};
d2350377997f360 Neil Armstrong        2023-11-30   515  
d2350377997f360 Neil Armstrong        2023-11-30   516  		pvmfw_mem: pvmfw@824a0000 {
d2350377997f360 Neil Armstrong        2023-11-30   517  			reg = <0 0x824a0000 0 0x100000>;
d2350377997f360 Neil Armstrong        2023-11-30   518  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   519  		};
d2350377997f360 Neil Armstrong        2023-11-30   520  
d2350377997f360 Neil Armstrong        2023-11-30   521  		global_sync_mem: global-sync@82600000 {
d2350377997f360 Neil Armstrong        2023-11-30   522  			reg = <0 0x82600000 0 0x100000>;
d2350377997f360 Neil Armstrong        2023-11-30   523  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   524  		};
d2350377997f360 Neil Armstrong        2023-11-30   525  
d2350377997f360 Neil Armstrong        2023-11-30   526  		tz_stat_mem: tz-stat@82700000 {
d2350377997f360 Neil Armstrong        2023-11-30   527  			reg = <0 0x82700000 0 0x100000>;
d2350377997f360 Neil Armstrong        2023-11-30   528  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   529  		};
d2350377997f360 Neil Armstrong        2023-11-30   530  
d2350377997f360 Neil Armstrong        2023-11-30   531  		qdss_mem: qdss@82800000 {
d2350377997f360 Neil Armstrong        2023-11-30   532  			reg = <0 0x82800000 0 0x2000000>;
d2350377997f360 Neil Armstrong        2023-11-30   533  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   534  		};
d2350377997f360 Neil Armstrong        2023-11-30   535  
af53ecef19ffab5 Neil Armstrong        2024-01-23   536  		qlink_logging_mem: qlink-logging@84800000 {
af53ecef19ffab5 Neil Armstrong        2024-01-23   537  			reg = <0 0x84800000 0 0x200000>;
af53ecef19ffab5 Neil Armstrong        2024-01-23   538  			no-map;
af53ecef19ffab5 Neil Armstrong        2024-01-23   539  		};
af53ecef19ffab5 Neil Armstrong        2024-01-23   540  
d2350377997f360 Neil Armstrong        2023-11-30   541  		mpss_dsm_mem: mpss-dsm@86b00000 {
d2350377997f360 Neil Armstrong        2023-11-30   542  			reg = <0 0x86b00000 0 0x4900000>;
d2350377997f360 Neil Armstrong        2023-11-30   543  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   544  		};
d2350377997f360 Neil Armstrong        2023-11-30   545  
d2350377997f360 Neil Armstrong        2023-11-30   546  		mpss_dsm_mem_2: mpss-dsm-2@8b400000 {
d2350377997f360 Neil Armstrong        2023-11-30   547  			reg = <0 0x8b400000 0 0x800000>;
d2350377997f360 Neil Armstrong        2023-11-30   548  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   549  		};
d2350377997f360 Neil Armstrong        2023-11-30   550  
d2350377997f360 Neil Armstrong        2023-11-30   551  		mpss_mem: mpss@8bc00000 {
d2350377997f360 Neil Armstrong        2023-11-30   552  			reg = <0 0x8bc00000 0 0xf400000>;
d2350377997f360 Neil Armstrong        2023-11-30   553  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   554  		};
d2350377997f360 Neil Armstrong        2023-11-30   555  
d2350377997f360 Neil Armstrong        2023-11-30   556  		q6_mpss_dtb_mem: q6-mpss-dtb@9b000000 {
d2350377997f360 Neil Armstrong        2023-11-30   557  			reg = <0 0x9b000000 0 0x80000>;
d2350377997f360 Neil Armstrong        2023-11-30   558  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   559  		};
d2350377997f360 Neil Armstrong        2023-11-30   560  
d2350377997f360 Neil Armstrong        2023-11-30   561  		ipa_fw_mem: ipa-fw@9b080000 {
d2350377997f360 Neil Armstrong        2023-11-30   562  			reg = <0 0x9b080000 0 0x10000>;
d2350377997f360 Neil Armstrong        2023-11-30   563  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   564  		};
d2350377997f360 Neil Armstrong        2023-11-30   565  
d2350377997f360 Neil Armstrong        2023-11-30   566  		ipa_gsi_mem: ipa-gsi@9b090000 {
d2350377997f360 Neil Armstrong        2023-11-30   567  			reg = <0 0x9b090000 0 0xa000>;
d2350377997f360 Neil Armstrong        2023-11-30   568  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   569  		};
d2350377997f360 Neil Armstrong        2023-11-30   570  
d2350377997f360 Neil Armstrong        2023-11-30   571  		gpu_micro_code_mem: gpu-micro-code@9b09a000 {
d2350377997f360 Neil Armstrong        2023-11-30   572  			reg = <0 0x9b09a000 0 0x2000>;
d2350377997f360 Neil Armstrong        2023-11-30   573  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   574  		};
d2350377997f360 Neil Armstrong        2023-11-30   575  
d2350377997f360 Neil Armstrong        2023-11-30   576  		spss_region_mem: spss@9b0a0000 {
d2350377997f360 Neil Armstrong        2023-11-30   577  			reg = <0 0x9b0a0000 0 0x1e0000>;
d2350377997f360 Neil Armstrong        2023-11-30   578  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   579  		};
d2350377997f360 Neil Armstrong        2023-11-30   580  
d2350377997f360 Neil Armstrong        2023-11-30   581  		/* First part of the "SPU secure shared memory" region */
d2350377997f360 Neil Armstrong        2023-11-30   582  		spu_tz_shared_mem: spu-tz-shared@9b280000 {
d2350377997f360 Neil Armstrong        2023-11-30   583  			reg = <0 0x9b280000 0 0x60000>;
d2350377997f360 Neil Armstrong        2023-11-30   584  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   585  		};
d2350377997f360 Neil Armstrong        2023-11-30   586  
d2350377997f360 Neil Armstrong        2023-11-30   587  		/* Second part of the "SPU secure shared memory" region */
d2350377997f360 Neil Armstrong        2023-11-30   588  		spu_modem_shared_mem: spu-modem-shared@9b2e0000 {
d2350377997f360 Neil Armstrong        2023-11-30   589  			reg = <0 0x9b2e0000 0 0x20000>;
d2350377997f360 Neil Armstrong        2023-11-30   590  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   591  		};
d2350377997f360 Neil Armstrong        2023-11-30   592  
d2350377997f360 Neil Armstrong        2023-11-30   593  		camera_mem: camera@9b300000 {
d2350377997f360 Neil Armstrong        2023-11-30   594  			reg = <0 0x9b300000 0 0x800000>;
d2350377997f360 Neil Armstrong        2023-11-30   595  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   596  		};
d2350377997f360 Neil Armstrong        2023-11-30   597  
d2350377997f360 Neil Armstrong        2023-11-30   598  		video_mem: video@9bb00000 {
d2350377997f360 Neil Armstrong        2023-11-30   599  			reg = <0 0x9bb00000 0 0x800000>;
d2350377997f360 Neil Armstrong        2023-11-30   600  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   601  		};
d2350377997f360 Neil Armstrong        2023-11-30   602  
d2350377997f360 Neil Armstrong        2023-11-30   603  		cvp_mem: cvp@9c300000 {
d2350377997f360 Neil Armstrong        2023-11-30   604  			reg = <0 0x9c300000 0 0x700000>;
d2350377997f360 Neil Armstrong        2023-11-30   605  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   606  		};
d2350377997f360 Neil Armstrong        2023-11-30   607  
d2350377997f360 Neil Armstrong        2023-11-30   608  		cdsp_mem: cdsp@9ca00000 {
d2350377997f360 Neil Armstrong        2023-11-30   609  			reg = <0 0x9ca00000 0 0x1400000>;
d2350377997f360 Neil Armstrong        2023-11-30   610  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   611  		};
d2350377997f360 Neil Armstrong        2023-11-30   612  
d2350377997f360 Neil Armstrong        2023-11-30   613  		q6_cdsp_dtb_mem: q6-cdsp-dtb@9de00000 {
d2350377997f360 Neil Armstrong        2023-11-30   614  			reg = <0 0x9de00000 0 0x80000>;
d2350377997f360 Neil Armstrong        2023-11-30   615  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   616  		};
d2350377997f360 Neil Armstrong        2023-11-30   617  
d2350377997f360 Neil Armstrong        2023-11-30   618  		q6_adsp_dtb_mem: q6-adsp-dtb@9de80000 {
d2350377997f360 Neil Armstrong        2023-11-30   619  			reg = <0 0x9de80000 0 0x80000>;
d2350377997f360 Neil Armstrong        2023-11-30   620  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   621  		};
d2350377997f360 Neil Armstrong        2023-11-30   622  
d2350377997f360 Neil Armstrong        2023-11-30   623  		adspslpi_mem: adspslpi@9df00000 {
d2350377997f360 Neil Armstrong        2023-11-30   624  			reg = <0 0x9df00000 0 0x4080000>;
d2350377997f360 Neil Armstrong        2023-11-30   625  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   626  		};
d2350377997f360 Neil Armstrong        2023-11-30   627  
d2350377997f360 Neil Armstrong        2023-11-30   628  		rmtfs_mem: rmtfs@d7c00000 {
d2350377997f360 Neil Armstrong        2023-11-30   629  			compatible = "qcom,rmtfs-mem";
d2350377997f360 Neil Armstrong        2023-11-30   630  			reg = <0 0xd7c00000 0 0x400000>;
d2350377997f360 Neil Armstrong        2023-11-30   631  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   632  
d2350377997f360 Neil Armstrong        2023-11-30   633  			qcom,client-id = <1>;
d2350377997f360 Neil Armstrong        2023-11-30   634  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d2350377997f360 Neil Armstrong        2023-11-30   635  		};
d2350377997f360 Neil Armstrong        2023-11-30   636  
d2350377997f360 Neil Armstrong        2023-11-30   637  		/* Merged tz_reserved, xbl_sc, cpucp_fw and qtee regions */
d2350377997f360 Neil Armstrong        2023-11-30   638  		tz_merged_mem: tz-merged@d8000000 {
d2350377997f360 Neil Armstrong        2023-11-30   639  			reg = <0 0xd8000000 0 0x800000>;
d2350377997f360 Neil Armstrong        2023-11-30   640  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   641  		};
d2350377997f360 Neil Armstrong        2023-11-30   642  
d2350377997f360 Neil Armstrong        2023-11-30   643  		hwfence_shbuf: hwfence-shbuf@e6440000 {
d2350377997f360 Neil Armstrong        2023-11-30   644  			reg = <0 0xe6440000 0 0x2dd000>;
d2350377997f360 Neil Armstrong        2023-11-30   645  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   646  		};
d2350377997f360 Neil Armstrong        2023-11-30   647  
d2350377997f360 Neil Armstrong        2023-11-30   648  		trust_ui_vm_mem: trust-ui-vm@f3800000 {
d2350377997f360 Neil Armstrong        2023-11-30   649  			reg = <0 0xf3800000 0 0x4400000>;
d2350377997f360 Neil Armstrong        2023-11-30   650  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   651  		};
d2350377997f360 Neil Armstrong        2023-11-30   652  
d2350377997f360 Neil Armstrong        2023-11-30   653  		oem_vm_mem: oem-vm@f7c00000 {
d2350377997f360 Neil Armstrong        2023-11-30   654  			reg = <0 0xf7c00000 0 0x4c00000>;
d2350377997f360 Neil Armstrong        2023-11-30   655  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   656  		};
d2350377997f360 Neil Armstrong        2023-11-30   657  
d2350377997f360 Neil Armstrong        2023-11-30   658  		llcc_lpi_mem: llcc-lpi@ff800000 {
d2350377997f360 Neil Armstrong        2023-11-30   659  			reg = <0 0xff800000 0 0x600000>;
d2350377997f360 Neil Armstrong        2023-11-30   660  			no-map;
d2350377997f360 Neil Armstrong        2023-11-30   661  		};
d2350377997f360 Neil Armstrong        2023-11-30   662  	};
d2350377997f360 Neil Armstrong        2023-11-30   663  
10e024671295184 Neil Armstrong        2023-11-30   664  	smp2p-adsp {
10e024671295184 Neil Armstrong        2023-11-30   665  		compatible = "qcom,smp2p";
10e024671295184 Neil Armstrong        2023-11-30   666  
10e024671295184 Neil Armstrong        2023-11-30   667  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
10e024671295184 Neil Armstrong        2023-11-30   668  					     IPCC_MPROC_SIGNAL_SMP2P
10e024671295184 Neil Armstrong        2023-11-30   669  					     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30   670  
10e024671295184 Neil Armstrong        2023-11-30   671  		mboxes = <&ipcc IPCC_CLIENT_LPASS
10e024671295184 Neil Armstrong        2023-11-30   672  				IPCC_MPROC_SIGNAL_SMP2P>;
10e024671295184 Neil Armstrong        2023-11-30   673  
10e024671295184 Neil Armstrong        2023-11-30   674  		qcom,smem = <443>, <429>;
10e024671295184 Neil Armstrong        2023-11-30   675  		qcom,local-pid = <0>;
10e024671295184 Neil Armstrong        2023-11-30   676  		qcom,remote-pid = <2>;
10e024671295184 Neil Armstrong        2023-11-30   677  
10e024671295184 Neil Armstrong        2023-11-30   678  		smp2p_adsp_out: master-kernel {
10e024671295184 Neil Armstrong        2023-11-30   679  			qcom,entry-name = "master-kernel";
10e024671295184 Neil Armstrong        2023-11-30   680  			#qcom,smem-state-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   681  		};
10e024671295184 Neil Armstrong        2023-11-30   682  
10e024671295184 Neil Armstrong        2023-11-30   683  		smp2p_adsp_in: slave-kernel {
10e024671295184 Neil Armstrong        2023-11-30   684  			qcom,entry-name = "slave-kernel";
10e024671295184 Neil Armstrong        2023-11-30   685  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30   686  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   687  		};
10e024671295184 Neil Armstrong        2023-11-30   688  	};
10e024671295184 Neil Armstrong        2023-11-30   689  
10e024671295184 Neil Armstrong        2023-11-30   690  	smp2p-cdsp {
10e024671295184 Neil Armstrong        2023-11-30   691  		compatible = "qcom,smp2p";
10e024671295184 Neil Armstrong        2023-11-30   692  
10e024671295184 Neil Armstrong        2023-11-30   693  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
10e024671295184 Neil Armstrong        2023-11-30   694  					     IPCC_MPROC_SIGNAL_SMP2P
10e024671295184 Neil Armstrong        2023-11-30   695  					     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30   696  
10e024671295184 Neil Armstrong        2023-11-30   697  		mboxes = <&ipcc IPCC_CLIENT_CDSP
10e024671295184 Neil Armstrong        2023-11-30   698  				IPCC_MPROC_SIGNAL_SMP2P>;
10e024671295184 Neil Armstrong        2023-11-30   699  
10e024671295184 Neil Armstrong        2023-11-30   700  		qcom,smem = <94>, <432>;
10e024671295184 Neil Armstrong        2023-11-30   701  		qcom,local-pid = <0>;
10e024671295184 Neil Armstrong        2023-11-30   702  		qcom,remote-pid = <5>;
10e024671295184 Neil Armstrong        2023-11-30   703  
10e024671295184 Neil Armstrong        2023-11-30   704  		smp2p_cdsp_out: master-kernel {
10e024671295184 Neil Armstrong        2023-11-30   705  			qcom,entry-name = "master-kernel";
10e024671295184 Neil Armstrong        2023-11-30   706  			#qcom,smem-state-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   707  		};
10e024671295184 Neil Armstrong        2023-11-30   708  
10e024671295184 Neil Armstrong        2023-11-30   709  		smp2p_cdsp_in: slave-kernel {
10e024671295184 Neil Armstrong        2023-11-30   710  			qcom,entry-name = "slave-kernel";
10e024671295184 Neil Armstrong        2023-11-30   711  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30   712  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   713  		};
10e024671295184 Neil Armstrong        2023-11-30   714  	};
10e024671295184 Neil Armstrong        2023-11-30   715  
10e024671295184 Neil Armstrong        2023-11-30   716  	smp2p-modem {
10e024671295184 Neil Armstrong        2023-11-30   717  		compatible = "qcom,smp2p";
10e024671295184 Neil Armstrong        2023-11-30   718  
10e024671295184 Neil Armstrong        2023-11-30   719  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e024671295184 Neil Armstrong        2023-11-30   720  					     IPCC_MPROC_SIGNAL_SMP2P
10e024671295184 Neil Armstrong        2023-11-30   721  					     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30   722  
10e024671295184 Neil Armstrong        2023-11-30   723  		mboxes = <&ipcc IPCC_CLIENT_MPSS
10e024671295184 Neil Armstrong        2023-11-30   724  				IPCC_MPROC_SIGNAL_SMP2P>;
10e024671295184 Neil Armstrong        2023-11-30   725  
10e024671295184 Neil Armstrong        2023-11-30   726  		qcom,smem = <435>, <428>;
10e024671295184 Neil Armstrong        2023-11-30   727  		qcom,local-pid = <0>;
10e024671295184 Neil Armstrong        2023-11-30   728  		qcom,remote-pid = <1>;
10e024671295184 Neil Armstrong        2023-11-30   729  
10e024671295184 Neil Armstrong        2023-11-30   730  		smp2p_modem_out: master-kernel {
10e024671295184 Neil Armstrong        2023-11-30   731  			qcom,entry-name = "master-kernel";
10e024671295184 Neil Armstrong        2023-11-30   732  			#qcom,smem-state-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   733  		};
10e024671295184 Neil Armstrong        2023-11-30   734  
10e024671295184 Neil Armstrong        2023-11-30   735  		smp2p_modem_in: slave-kernel {
10e024671295184 Neil Armstrong        2023-11-30   736  			qcom,entry-name = "slave-kernel";
10e024671295184 Neil Armstrong        2023-11-30   737  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30   738  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   739  		};
10e024671295184 Neil Armstrong        2023-11-30   740  
10e024671295184 Neil Armstrong        2023-11-30   741  		ipa_smp2p_out: ipa-ap-to-modem {
10e024671295184 Neil Armstrong        2023-11-30   742  			qcom,entry-name = "ipa";
10e024671295184 Neil Armstrong        2023-11-30   743  			#qcom,smem-state-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   744  		};
10e024671295184 Neil Armstrong        2023-11-30   745  
10e024671295184 Neil Armstrong        2023-11-30   746  		ipa_smp2p_in: ipa-modem-to-ap {
10e024671295184 Neil Armstrong        2023-11-30   747  			qcom,entry-name = "ipa";
10e024671295184 Neil Armstrong        2023-11-30   748  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30   749  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30   750  		};
10e024671295184 Neil Armstrong        2023-11-30   751  	};
10e024671295184 Neil Armstrong        2023-11-30   752  
d2350377997f360 Neil Armstrong        2023-11-30   753  	soc: soc@0 {
d2350377997f360 Neil Armstrong        2023-11-30   754  		compatible = "simple-bus";
d2350377997f360 Neil Armstrong        2023-11-30   755  
d2350377997f360 Neil Armstrong        2023-11-30   756  		#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   757  		#size-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   758  		dma-ranges = <0 0 0 0 0x10 0>;
d2350377997f360 Neil Armstrong        2023-11-30   759  		ranges = <0 0 0 0 0x10 0>;
d2350377997f360 Neil Armstrong        2023-11-30   760  
d2350377997f360 Neil Armstrong        2023-11-30   761  		gcc: clock-controller@100000 {
d2350377997f360 Neil Armstrong        2023-11-30   762  			compatible = "qcom,sm8650-gcc";
d2350377997f360 Neil Armstrong        2023-11-30   763  			reg = <0 0x00100000 0 0x1f4200>;
d2350377997f360 Neil Armstrong        2023-11-30   764  
d2350377997f360 Neil Armstrong        2023-11-30   765  			clocks = <&bi_tcxo_div2>,
d2350377997f360 Neil Armstrong        2023-11-30   766  				 <&bi_tcxo_ao_div2>,
d2350377997f360 Neil Armstrong        2023-11-30   767  				 <&sleep_clk>,
10e024671295184 Neil Armstrong        2023-11-30   768  				 <&pcie0_phy>,
d00b42f170dfa4d Neil Armstrong        2024-05-02   769  				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
d00b42f170dfa4d Neil Armstrong        2024-05-02   770  				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30   771  				 <&ufs_mem_phy 0>,
10e024671295184 Neil Armstrong        2023-11-30   772  				 <&ufs_mem_phy 1>,
10e024671295184 Neil Armstrong        2023-11-30   773  				 <&ufs_mem_phy 2>,
10e024671295184 Neil Armstrong        2023-11-30   774  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
d2350377997f360 Neil Armstrong        2023-11-30   775  
d2350377997f360 Neil Armstrong        2023-11-30   776  			#clock-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30   777  			#reset-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30   778  			#power-domain-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30   779  		};
d2350377997f360 Neil Armstrong        2023-11-30   780  
d2350377997f360 Neil Armstrong        2023-11-30   781  		ipcc: mailbox@406000 {
d2350377997f360 Neil Armstrong        2023-11-30   782  			compatible = "qcom,sm8650-ipcc", "qcom,ipcc";
d2350377997f360 Neil Armstrong        2023-11-30   783  			reg = <0 0x00406000 0 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30   784  
d2350377997f360 Neil Armstrong        2023-11-30   785  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   786  			interrupt-controller;
d2350377997f360 Neil Armstrong        2023-11-30   787  			#interrupt-cells = <3>;
d2350377997f360 Neil Armstrong        2023-11-30   788  
d2350377997f360 Neil Armstrong        2023-11-30   789  			#mbox-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   790  		};
d2350377997f360 Neil Armstrong        2023-11-30   791  
d2350377997f360 Neil Armstrong        2023-11-30   792  		gpi_dma2: dma-controller@800000 {
d2350377997f360 Neil Armstrong        2023-11-30   793  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
d2350377997f360 Neil Armstrong        2023-11-30   794  			reg = <0 0x00800000 0 0x60000>;
d2350377997f360 Neil Armstrong        2023-11-30   795  
d2350377997f360 Neil Armstrong        2023-11-30   796  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   797  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   798  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   799  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   800  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   801  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   802  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   803  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   804  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   805  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   806  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30   807  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   808  
d2350377997f360 Neil Armstrong        2023-11-30   809  			dma-channels = <12>;
d2350377997f360 Neil Armstrong        2023-11-30   810  			dma-channel-mask = <0x3f>;
d2350377997f360 Neil Armstrong        2023-11-30   811  			#dma-cells = <3>;
d2350377997f360 Neil Armstrong        2023-11-30   812  
d2350377997f360 Neil Armstrong        2023-11-30   813  			iommus = <&apps_smmu 0x436 0>;
d2350377997f360 Neil Armstrong        2023-11-30   814  
d2350377997f360 Neil Armstrong        2023-11-30   815  			dma-coherent;
d2350377997f360 Neil Armstrong        2023-11-30   816  
d2350377997f360 Neil Armstrong        2023-11-30   817  			status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   818  		};
d2350377997f360 Neil Armstrong        2023-11-30   819  
d2350377997f360 Neil Armstrong        2023-11-30   820  		qupv3_id_1: geniqup@8c0000 {
d2350377997f360 Neil Armstrong        2023-11-30   821  			compatible = "qcom,geni-se-qup";
d2350377997f360 Neil Armstrong        2023-11-30   822  			reg = <0 0x008c0000 0 0x2000>;
d2350377997f360 Neil Armstrong        2023-11-30   823  
d2350377997f360 Neil Armstrong        2023-11-30   824  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
d2350377997f360 Neil Armstrong        2023-11-30   825  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
d2350377997f360 Neil Armstrong        2023-11-30   826  			clock-names = "m-ahb",
d2350377997f360 Neil Armstrong        2023-11-30   827  				      "s-ahb";
d2350377997f360 Neil Armstrong        2023-11-30   828  
d2350377997f360 Neil Armstrong        2023-11-30   829  			iommus = <&apps_smmu 0x423 0>;
d2350377997f360 Neil Armstrong        2023-11-30   830  
d2350377997f360 Neil Armstrong        2023-11-30   831  			dma-coherent;
d2350377997f360 Neil Armstrong        2023-11-30   832  
d2350377997f360 Neil Armstrong        2023-11-30   833  			#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   834  			#size-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30   835  			ranges;
d2350377997f360 Neil Armstrong        2023-11-30   836  
d2350377997f360 Neil Armstrong        2023-11-30   837  			status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   838  
10e024671295184 Neil Armstrong        2023-11-30   839  			i2c8: i2c@880000 {
10e024671295184 Neil Armstrong        2023-11-30   840  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30   841  				reg = <0 0x00880000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30   842  
10e024671295184 Neil Armstrong        2023-11-30   843  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   844  
10e024671295184 Neil Armstrong        2023-11-30   845  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
d2350377997f360 Neil Armstrong        2023-11-30   846  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30   847  
10e024671295184 Neil Armstrong        2023-11-30   848  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   849  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   850  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   851  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   852  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   853  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30   854  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30   855  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30   856  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30   857  
10e024671295184 Neil Armstrong        2023-11-30   858  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30   859  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30   860  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30   861  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30   862  
10e024671295184 Neil Armstrong        2023-11-30   863  				pinctrl-0 = <&qup_i2c8_data_clk>;
d2350377997f360 Neil Armstrong        2023-11-30   864  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30   865  
10e024671295184 Neil Armstrong        2023-11-30   866  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   867  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30   868  
d2350377997f360 Neil Armstrong        2023-11-30   869  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   870  			};
d2350377997f360 Neil Armstrong        2023-11-30   871  
10e024671295184 Neil Armstrong        2023-11-30   872  			spi8: spi@880000 {
10e024671295184 Neil Armstrong        2023-11-30   873  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30   874  				reg = <0 0x00880000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30   875  
10e024671295184 Neil Armstrong        2023-11-30   876  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   877  
10e024671295184 Neil Armstrong        2023-11-30   878  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
10e024671295184 Neil Armstrong        2023-11-30   879  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30   880  
10e024671295184 Neil Armstrong        2023-11-30   881  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   882  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   883  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   884  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   885  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   886  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30   887  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30   888  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30   889  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30   890  
10e024671295184 Neil Armstrong        2023-11-30   891  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30   892  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30   893  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30   894  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30   895  
10e024671295184 Neil Armstrong        2023-11-30   896  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
10e024671295184 Neil Armstrong        2023-11-30   897  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30   898  
10e024671295184 Neil Armstrong        2023-11-30   899  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   900  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30   901  
d2350377997f360 Neil Armstrong        2023-11-30   902  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   903  			};
d2350377997f360 Neil Armstrong        2023-11-30   904  
10e024671295184 Neil Armstrong        2023-11-30   905  			i2c9: i2c@884000 {
10e024671295184 Neil Armstrong        2023-11-30   906  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30   907  				reg = <0 0x00884000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30   908  
10e024671295184 Neil Armstrong        2023-11-30   909  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   910  
10e024671295184 Neil Armstrong        2023-11-30   911  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e024671295184 Neil Armstrong        2023-11-30   912  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30   913  
10e024671295184 Neil Armstrong        2023-11-30   914  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   915  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   916  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   917  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   918  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   919  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30   920  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30   921  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30   922  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30   923  
10e024671295184 Neil Armstrong        2023-11-30   924  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30   925  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30   926  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30   927  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30   928  
10e024671295184 Neil Armstrong        2023-11-30   929  				pinctrl-0 = <&qup_i2c9_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30   930  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30   931  
10e024671295184 Neil Armstrong        2023-11-30   932  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   933  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30   934  
10e024671295184 Neil Armstrong        2023-11-30   935  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   936  			};
d2350377997f360 Neil Armstrong        2023-11-30   937  
10e024671295184 Neil Armstrong        2023-11-30   938  			spi9: spi@884000 {
10e024671295184 Neil Armstrong        2023-11-30   939  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30   940  				reg = <0 0x00884000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30   941  
10e024671295184 Neil Armstrong        2023-11-30   942  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   943  
10e024671295184 Neil Armstrong        2023-11-30   944  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
10e024671295184 Neil Armstrong        2023-11-30   945  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30   946  
10e024671295184 Neil Armstrong        2023-11-30   947  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   948  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   949  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   950  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   951  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   952  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30   953  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30   954  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30   955  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30   956  
10e024671295184 Neil Armstrong        2023-11-30   957  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30   958  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30   959  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30   960  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30   961  
10e024671295184 Neil Armstrong        2023-11-30   962  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
10e024671295184 Neil Armstrong        2023-11-30   963  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30   964  
10e024671295184 Neil Armstrong        2023-11-30   965  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   966  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30   967  
10e024671295184 Neil Armstrong        2023-11-30   968  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30   969  			};
d2350377997f360 Neil Armstrong        2023-11-30   970  
10e024671295184 Neil Armstrong        2023-11-30   971  			i2c10: i2c@888000 {
10e024671295184 Neil Armstrong        2023-11-30   972  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30   973  				reg = <0 0x00888000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30   974  
10e024671295184 Neil Armstrong        2023-11-30   975  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30   976  
10e024671295184 Neil Armstrong        2023-11-30   977  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e024671295184 Neil Armstrong        2023-11-30   978  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30   979  
10e024671295184 Neil Armstrong        2023-11-30   980  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   981  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   982  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   983  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30   984  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30   985  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30   986  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30   987  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30   988  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30   989  
10e024671295184 Neil Armstrong        2023-11-30   990  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30   991  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30   992  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30   993  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30   994  
10e024671295184 Neil Armstrong        2023-11-30   995  				pinctrl-0 = <&qup_i2c10_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30   996  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30   997  
10e024671295184 Neil Armstrong        2023-11-30   998  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30   999  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  1000  
d2350377997f360 Neil Armstrong        2023-11-30  1001  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  1002  			};
d2350377997f360 Neil Armstrong        2023-11-30  1003  
10e024671295184 Neil Armstrong        2023-11-30  1004  			spi10: spi@888000 {
10e024671295184 Neil Armstrong        2023-11-30  1005  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1006  				reg = <0 0x00888000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30  1007  
10e024671295184 Neil Armstrong        2023-11-30  1008  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  1009  
10e024671295184 Neil Armstrong        2023-11-30  1010  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1011  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30  1012  
10e024671295184 Neil Armstrong        2023-11-30  1013  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1014  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1015  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1016  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1017  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1018  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1019  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1020  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1021  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1022  
10e024671295184 Neil Armstrong        2023-11-30  1023  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1024  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1025  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1026  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1027  
10e024671295184 Neil Armstrong        2023-11-30  1028  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1029  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1030  
10e024671295184 Neil Armstrong        2023-11-30  1031  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1032  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  1033  
d2350377997f360 Neil Armstrong        2023-11-30  1034  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  1035  			};
d2350377997f360 Neil Armstrong        2023-11-30  1036  
10e024671295184 Neil Armstrong        2023-11-30  1037  			i2c11: i2c@88c000 {
10e024671295184 Neil Armstrong        2023-11-30  1038  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1039  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30  1040  
10e024671295184 Neil Armstrong        2023-11-30  1041  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  1042  
10e024671295184 Neil Armstrong        2023-11-30  1043  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1044  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30  1045  
10e024671295184 Neil Armstrong        2023-11-30  1046  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1047  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1048  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1049  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1050  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1051  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1052  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1053  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1054  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1055  
10e024671295184 Neil Armstrong        2023-11-30  1056  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1057  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1058  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1059  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1060  
10e024671295184 Neil Armstrong        2023-11-30  1061  				pinctrl-0 = <&qup_i2c11_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1062  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30  1063  
10e024671295184 Neil Armstrong        2023-11-30  1064  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1065  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  1066  
d2350377997f360 Neil Armstrong        2023-11-30  1067  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  1068  			};
d2350377997f360 Neil Armstrong        2023-11-30  1069  
10e024671295184 Neil Armstrong        2023-11-30  1070  			spi11: spi@88c000 {
10e024671295184 Neil Armstrong        2023-11-30  1071  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1072  				reg = <0 0x0088c000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30  1073  
10e024671295184 Neil Armstrong        2023-11-30  1074  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  1075  
10e024671295184 Neil Armstrong        2023-11-30  1076  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1077  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30  1078  
10e024671295184 Neil Armstrong        2023-11-30  1079  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1080  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1081  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1082  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1083  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1084  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1085  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1086  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1087  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1088  
10e024671295184 Neil Armstrong        2023-11-30  1089  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1090  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1091  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1092  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1093  
10e024671295184 Neil Armstrong        2023-11-30  1094  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1095  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30  1096  
10e024671295184 Neil Armstrong        2023-11-30  1097  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1098  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  1099  
10e024671295184 Neil Armstrong        2023-11-30  1100  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1101  			};
d2350377997f360 Neil Armstrong        2023-11-30  1102  
10e024671295184 Neil Armstrong        2023-11-30  1103  			i2c12: i2c@890000 {
10e024671295184 Neil Armstrong        2023-11-30  1104  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1105  				reg = <0 0x00890000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1106  
10e024671295184 Neil Armstrong        2023-11-30  1107  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1108  
10e024671295184 Neil Armstrong        2023-11-30  1109  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1110  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1111  
10e024671295184 Neil Armstrong        2023-11-30  1112  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1113  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1114  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1115  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1116  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1117  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1118  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1119  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1120  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1121  
10e024671295184 Neil Armstrong        2023-11-30  1122  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1123  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1124  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1125  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1126  
10e024671295184 Neil Armstrong        2023-11-30  1127  				pinctrl-0 = <&qup_i2c12_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1128  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1129  
10e024671295184 Neil Armstrong        2023-11-30  1130  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1131  				#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  1132  
d2350377997f360 Neil Armstrong        2023-11-30  1133  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1134  			};
d2350377997f360 Neil Armstrong        2023-11-30  1135  
10e024671295184 Neil Armstrong        2023-11-30  1136  			spi12: spi@890000 {
10e024671295184 Neil Armstrong        2023-11-30  1137  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1138  				reg = <0 0x00890000 0 0x4000>;
d2350377997f360 Neil Armstrong        2023-11-30  1139  
10e024671295184 Neil Armstrong        2023-11-30  1140  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  1141  
10e024671295184 Neil Armstrong        2023-11-30  1142  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1143  				clock-names = "se";
d2350377997f360 Neil Armstrong        2023-11-30  1144  
10e024671295184 Neil Armstrong        2023-11-30  1145  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1146  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1147  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1148  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1149  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1150  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1151  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1152  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1153  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1154  
10e024671295184 Neil Armstrong        2023-11-30  1155  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1156  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1157  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1158  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1159  
10e024671295184 Neil Armstrong        2023-11-30  1160  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1161  				pinctrl-names = "default";
d2350377997f360 Neil Armstrong        2023-11-30  1162  
10e024671295184 Neil Armstrong        2023-11-30  1163  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1164  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1165  
10e024671295184 Neil Armstrong        2023-11-30  1166  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1167  			};
10e024671295184 Neil Armstrong        2023-11-30  1168  
10e024671295184 Neil Armstrong        2023-11-30  1169  			i2c13: i2c@894000 {
10e024671295184 Neil Armstrong        2023-11-30  1170  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1171  				reg = <0 0x00894000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1172  
10e024671295184 Neil Armstrong        2023-11-30  1173  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1174  
10e024671295184 Neil Armstrong        2023-11-30  1175  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1176  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1177  
10e024671295184 Neil Armstrong        2023-11-30  1178  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1179  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1180  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1181  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1182  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1183  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1184  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1185  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1186  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1187  
10e024671295184 Neil Armstrong        2023-11-30  1188  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1189  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1190  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1191  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1192  
10e024671295184 Neil Armstrong        2023-11-30  1193  				pinctrl-0 = <&qup_i2c13_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1194  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1195  
10e024671295184 Neil Armstrong        2023-11-30  1196  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1197  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1198  
10e024671295184 Neil Armstrong        2023-11-30  1199  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1200  			};
10e024671295184 Neil Armstrong        2023-11-30  1201  
10e024671295184 Neil Armstrong        2023-11-30  1202  			spi13: spi@894000 {
10e024671295184 Neil Armstrong        2023-11-30  1203  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1204  				reg = <0 0x00894000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1205  
10e024671295184 Neil Armstrong        2023-11-30  1206  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1207  
10e024671295184 Neil Armstrong        2023-11-30  1208  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1209  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1210  
10e024671295184 Neil Armstrong        2023-11-30  1211  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1212  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1213  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1214  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1215  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1216  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1217  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1218  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1219  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1220  
10e024671295184 Neil Armstrong        2023-11-30  1221  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1222  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1223  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1224  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1225  
10e024671295184 Neil Armstrong        2023-11-30  1226  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1227  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1228  
10e024671295184 Neil Armstrong        2023-11-30  1229  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1230  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1231  
10e024671295184 Neil Armstrong        2023-11-30  1232  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1233  			};
10e024671295184 Neil Armstrong        2023-11-30  1234  
10e024671295184 Neil Armstrong        2023-11-30  1235  			uart14: serial@898000 {
10e024671295184 Neil Armstrong        2023-11-30  1236  				compatible = "qcom,geni-uart";
10e024671295184 Neil Armstrong        2023-11-30  1237  				reg = <0 0x00898000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1238  
10e024671295184 Neil Armstrong        2023-11-30  1239  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1240  
10e024671295184 Neil Armstrong        2023-11-30  1241  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1242  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1243  
10e024671295184 Neil Armstrong        2023-11-30  1244  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1245  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1246  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1247  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1248  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1249  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1250  
10e024671295184 Neil Armstrong        2023-11-30  1251  				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
10e024671295184 Neil Armstrong        2023-11-30  1252  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1253  
10e024671295184 Neil Armstrong        2023-11-30  1254  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1255  			};
10e024671295184 Neil Armstrong        2023-11-30  1256  
10e024671295184 Neil Armstrong        2023-11-30  1257  			uart15: serial@89c000 {
10e024671295184 Neil Armstrong        2023-11-30  1258  				compatible = "qcom,geni-debug-uart";
10e024671295184 Neil Armstrong        2023-11-30  1259  				reg = <0 0x0089c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1260  
10e024671295184 Neil Armstrong        2023-11-30  1261  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1262  
10e024671295184 Neil Armstrong        2023-11-30  1263  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1264  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1265  
10e024671295184 Neil Armstrong        2023-11-30  1266  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1267  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1268  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1269  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1270  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1271  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1272  
10e024671295184 Neil Armstrong        2023-11-30  1273  				pinctrl-0 = <&qup_uart15_default>;
10e024671295184 Neil Armstrong        2023-11-30  1274  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1275  
10e024671295184 Neil Armstrong        2023-11-30  1276  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1277  			};
10e024671295184 Neil Armstrong        2023-11-30  1278  		};
10e024671295184 Neil Armstrong        2023-11-30  1279  
10e024671295184 Neil Armstrong        2023-11-30  1280  		i2c_master_hub_0: geniqup@9c0000 {
10e024671295184 Neil Armstrong        2023-11-30  1281  			compatible = "qcom,geni-se-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1282  			reg = <0 0x009c0000 0 0x2000>;
10e024671295184 Neil Armstrong        2023-11-30  1283  
10e024671295184 Neil Armstrong        2023-11-30  1284  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1285  			clock-names = "s-ahb";
10e024671295184 Neil Armstrong        2023-11-30  1286  
10e024671295184 Neil Armstrong        2023-11-30  1287  			#address-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  1288  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  1289  			ranges;
10e024671295184 Neil Armstrong        2023-11-30  1290  
10e024671295184 Neil Armstrong        2023-11-30  1291  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1292  
10e024671295184 Neil Armstrong        2023-11-30  1293  			i2c_hub_0: i2c@980000 {
10e024671295184 Neil Armstrong        2023-11-30  1294  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1295  				reg = <0 0x00980000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1296  
10e024671295184 Neil Armstrong        2023-11-30  1297  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1298  
10e024671295184 Neil Armstrong        2023-11-30  1299  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1300  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1301  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1302  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1303  
10e024671295184 Neil Armstrong        2023-11-30  1304  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1305  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1306  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1307  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1308  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1309  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1310  
10e024671295184 Neil Armstrong        2023-11-30  1311  				pinctrl-0 = <&hub_i2c0_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1312  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1313  
10e024671295184 Neil Armstrong        2023-11-30  1314  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1315  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1316  
10e024671295184 Neil Armstrong        2023-11-30  1317  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1318  			};
10e024671295184 Neil Armstrong        2023-11-30  1319  
10e024671295184 Neil Armstrong        2023-11-30  1320  			i2c_hub_1: i2c@984000 {
10e024671295184 Neil Armstrong        2023-11-30  1321  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1322  				reg = <0 0x00984000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1323  
10e024671295184 Neil Armstrong        2023-11-30  1324  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1325  
10e024671295184 Neil Armstrong        2023-11-30  1326  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1327  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1328  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1329  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1330  
10e024671295184 Neil Armstrong        2023-11-30  1331  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1332  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1333  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1334  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1335  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1336  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1337  
10e024671295184 Neil Armstrong        2023-11-30  1338  				pinctrl-0 = <&hub_i2c1_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1339  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1340  
10e024671295184 Neil Armstrong        2023-11-30  1341  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1342  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1343  
10e024671295184 Neil Armstrong        2023-11-30  1344  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1345  			};
10e024671295184 Neil Armstrong        2023-11-30  1346  
10e024671295184 Neil Armstrong        2023-11-30  1347  			i2c_hub_2: i2c@988000 {
10e024671295184 Neil Armstrong        2023-11-30  1348  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1349  				reg = <0 0x00988000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1350  
10e024671295184 Neil Armstrong        2023-11-30  1351  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1352  
10e024671295184 Neil Armstrong        2023-11-30  1353  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1354  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1355  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1356  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1357  
10e024671295184 Neil Armstrong        2023-11-30  1358  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1359  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1360  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1361  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1362  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1363  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1364  
10e024671295184 Neil Armstrong        2023-11-30  1365  				pinctrl-0 = <&hub_i2c2_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1366  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1367  
10e024671295184 Neil Armstrong        2023-11-30  1368  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1369  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1370  
10e024671295184 Neil Armstrong        2023-11-30  1371  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1372  			};
10e024671295184 Neil Armstrong        2023-11-30  1373  
10e024671295184 Neil Armstrong        2023-11-30  1374  			i2c_hub_3: i2c@98c000 {
10e024671295184 Neil Armstrong        2023-11-30  1375  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1376  				reg = <0 0x0098c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1377  
10e024671295184 Neil Armstrong        2023-11-30  1378  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1379  
10e024671295184 Neil Armstrong        2023-11-30  1380  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1381  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1382  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1383  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1384  
10e024671295184 Neil Armstrong        2023-11-30  1385  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1386  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1387  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1388  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1389  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1390  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1391  
10e024671295184 Neil Armstrong        2023-11-30  1392  				pinctrl-0 = <&hub_i2c3_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1393  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1394  
10e024671295184 Neil Armstrong        2023-11-30  1395  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1396  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1397  
10e024671295184 Neil Armstrong        2023-11-30  1398  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1399  			};
10e024671295184 Neil Armstrong        2023-11-30  1400  
10e024671295184 Neil Armstrong        2023-11-30  1401  			i2c_hub_4: i2c@990000 {
10e024671295184 Neil Armstrong        2023-11-30  1402  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1403  				reg = <0 0x00990000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1404  
10e024671295184 Neil Armstrong        2023-11-30  1405  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1406  
10e024671295184 Neil Armstrong        2023-11-30  1407  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1408  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1409  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1410  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1411  
10e024671295184 Neil Armstrong        2023-11-30  1412  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1413  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1414  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1415  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1416  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1417  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1418  
10e024671295184 Neil Armstrong        2023-11-30  1419  				pinctrl-0 = <&hub_i2c4_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1420  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1421  
10e024671295184 Neil Armstrong        2023-11-30  1422  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1423  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1424  
10e024671295184 Neil Armstrong        2023-11-30  1425  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1426  			};
10e024671295184 Neil Armstrong        2023-11-30  1427  
10e024671295184 Neil Armstrong        2023-11-30  1428  			i2c_hub_5: i2c@994000 {
10e024671295184 Neil Armstrong        2023-11-30  1429  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1430  				reg = <0 0x00994000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1431  
10e024671295184 Neil Armstrong        2023-11-30  1432  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1433  
10e024671295184 Neil Armstrong        2023-11-30  1434  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1435  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1436  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1437  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1438  
10e024671295184 Neil Armstrong        2023-11-30  1439  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1440  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1441  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1442  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1443  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1444  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1445  
10e024671295184 Neil Armstrong        2023-11-30  1446  				pinctrl-0 = <&hub_i2c5_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1447  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1448  
10e024671295184 Neil Armstrong        2023-11-30  1449  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1450  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1451  
10e024671295184 Neil Armstrong        2023-11-30  1452  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1453  			};
10e024671295184 Neil Armstrong        2023-11-30  1454  
10e024671295184 Neil Armstrong        2023-11-30  1455  			i2c_hub_6: i2c@998000 {
10e024671295184 Neil Armstrong        2023-11-30  1456  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1457  				reg = <0 0x00998000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1458  
10e024671295184 Neil Armstrong        2023-11-30  1459  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1460  
10e024671295184 Neil Armstrong        2023-11-30  1461  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1462  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1463  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1464  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1465  
10e024671295184 Neil Armstrong        2023-11-30  1466  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1467  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1468  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1469  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1470  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1471  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1472  
10e024671295184 Neil Armstrong        2023-11-30  1473  				pinctrl-0 = <&hub_i2c6_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1474  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1475  
10e024671295184 Neil Armstrong        2023-11-30  1476  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1477  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1478  
10e024671295184 Neil Armstrong        2023-11-30  1479  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1480  			};
10e024671295184 Neil Armstrong        2023-11-30  1481  
10e024671295184 Neil Armstrong        2023-11-30  1482  			i2c_hub_7: i2c@99c000 {
10e024671295184 Neil Armstrong        2023-11-30  1483  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1484  				reg = <0 0x0099c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1485  
10e024671295184 Neil Armstrong        2023-11-30  1486  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1487  
10e024671295184 Neil Armstrong        2023-11-30  1488  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1489  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1490  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1491  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1492  
10e024671295184 Neil Armstrong        2023-11-30  1493  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1494  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1495  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1496  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1497  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1498  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1499  
10e024671295184 Neil Armstrong        2023-11-30  1500  				pinctrl-0 = <&hub_i2c7_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1501  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1502  
10e024671295184 Neil Armstrong        2023-11-30  1503  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1504  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1505  
10e024671295184 Neil Armstrong        2023-11-30  1506  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1507  			};
10e024671295184 Neil Armstrong        2023-11-30  1508  
10e024671295184 Neil Armstrong        2023-11-30  1509  			i2c_hub_8: i2c@9a0000 {
10e024671295184 Neil Armstrong        2023-11-30  1510  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1511  				reg = <0 0x009a0000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1512  
10e024671295184 Neil Armstrong        2023-11-30  1513  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1514  
10e024671295184 Neil Armstrong        2023-11-30  1515  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1516  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1517  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1518  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1519  
10e024671295184 Neil Armstrong        2023-11-30  1520  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1521  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1522  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1523  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1524  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1525  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1526  
10e024671295184 Neil Armstrong        2023-11-30  1527  				pinctrl-0 = <&hub_i2c8_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1528  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1529  
10e024671295184 Neil Armstrong        2023-11-30  1530  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1531  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1532  
10e024671295184 Neil Armstrong        2023-11-30  1533  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1534  			};
10e024671295184 Neil Armstrong        2023-11-30  1535  
10e024671295184 Neil Armstrong        2023-11-30  1536  			i2c_hub_9: i2c@9a4000 {
10e024671295184 Neil Armstrong        2023-11-30  1537  				compatible = "qcom,geni-i2c-master-hub";
10e024671295184 Neil Armstrong        2023-11-30  1538  				reg = <0 0x009a4000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1539  
10e024671295184 Neil Armstrong        2023-11-30  1540  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1541  
10e024671295184 Neil Armstrong        2023-11-30  1542  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1543  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1544  				clock-names = "se",
10e024671295184 Neil Armstrong        2023-11-30  1545  					      "core";
10e024671295184 Neil Armstrong        2023-11-30  1546  
10e024671295184 Neil Armstrong        2023-11-30  1547  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1548  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1549  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1550  						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1551  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1552  						     "qup-config";
10e024671295184 Neil Armstrong        2023-11-30  1553  
10e024671295184 Neil Armstrong        2023-11-30  1554  				pinctrl-0 = <&hub_i2c9_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1555  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1556  
10e024671295184 Neil Armstrong        2023-11-30  1557  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1558  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1559  
10e024671295184 Neil Armstrong        2023-11-30  1560  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1561  			};
10e024671295184 Neil Armstrong        2023-11-30  1562  		};
10e024671295184 Neil Armstrong        2023-11-30  1563  
10e024671295184 Neil Armstrong        2023-11-30  1564  		gpi_dma1: dma-controller@a00000 {
10e024671295184 Neil Armstrong        2023-11-30  1565  			compatible = "qcom,sm8650-gpi-dma", "qcom,sm6350-gpi-dma";
10e024671295184 Neil Armstrong        2023-11-30  1566  			reg = <0 0x00a00000 0 0x60000>;
10e024671295184 Neil Armstrong        2023-11-30  1567  
10e024671295184 Neil Armstrong        2023-11-30  1568  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1569  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1570  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1571  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1572  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1573  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1574  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1575  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1576  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1577  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1578  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  1579  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1580  
10e024671295184 Neil Armstrong        2023-11-30  1581  			dma-channels = <12>;
10e024671295184 Neil Armstrong        2023-11-30  1582  			dma-channel-mask = <0xc>;
10e024671295184 Neil Armstrong        2023-11-30  1583  			#dma-cells = <3>;
10e024671295184 Neil Armstrong        2023-11-30  1584  
10e024671295184 Neil Armstrong        2023-11-30  1585  			iommus = <&apps_smmu 0xb6 0>;
10e024671295184 Neil Armstrong        2023-11-30  1586  			dma-coherent;
10e024671295184 Neil Armstrong        2023-11-30  1587  
10e024671295184 Neil Armstrong        2023-11-30  1588  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1589  		};
10e024671295184 Neil Armstrong        2023-11-30  1590  
10e024671295184 Neil Armstrong        2023-11-30  1591  		qupv3_id_0: geniqup@ac0000 {
10e024671295184 Neil Armstrong        2023-11-30  1592  			compatible = "qcom,geni-se-qup";
10e024671295184 Neil Armstrong        2023-11-30  1593  			reg = <0 0x00ac0000 0 0x2000>;
10e024671295184 Neil Armstrong        2023-11-30  1594  
10e024671295184 Neil Armstrong        2023-11-30  1595  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  1596  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1597  			clock-names = "m-ahb",
10e024671295184 Neil Armstrong        2023-11-30  1598  				      "s-ahb";
10e024671295184 Neil Armstrong        2023-11-30  1599  
10e024671295184 Neil Armstrong        2023-11-30  1600  			interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1601  					 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1602  			interconnect-names = "qup-core";
10e024671295184 Neil Armstrong        2023-11-30  1603  
10e024671295184 Neil Armstrong        2023-11-30  1604  			iommus = <&apps_smmu 0xa3 0>;
10e024671295184 Neil Armstrong        2023-11-30  1605  
10e024671295184 Neil Armstrong        2023-11-30  1606  			dma-coherent;
10e024671295184 Neil Armstrong        2023-11-30  1607  
10e024671295184 Neil Armstrong        2023-11-30  1608  			#address-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  1609  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  1610  			ranges;
10e024671295184 Neil Armstrong        2023-11-30  1611  
10e024671295184 Neil Armstrong        2023-11-30  1612  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1613  
10e024671295184 Neil Armstrong        2023-11-30  1614  			i2c0: i2c@a80000 {
10e024671295184 Neil Armstrong        2023-11-30  1615  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1616  				reg = <0 0x00a80000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1617  
10e024671295184 Neil Armstrong        2023-11-30  1618  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1619  
10e024671295184 Neil Armstrong        2023-11-30  1620  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1621  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1622  
10e024671295184 Neil Armstrong        2023-11-30  1623  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1624  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1625  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1626  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1627  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1628  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1629  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1630  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1631  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1632  
10e024671295184 Neil Armstrong        2023-11-30  1633  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1634  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1635  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1636  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1637  
10e024671295184 Neil Armstrong        2023-11-30  1638  				pinctrl-0 = <&qup_i2c0_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1639  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1640  
10e024671295184 Neil Armstrong        2023-11-30  1641  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1642  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1643  
10e024671295184 Neil Armstrong        2023-11-30  1644  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1645  			};
10e024671295184 Neil Armstrong        2023-11-30  1646  
10e024671295184 Neil Armstrong        2023-11-30  1647  			spi0: spi@a80000 {
10e024671295184 Neil Armstrong        2023-11-30  1648  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1649  				reg = <0 0x00a80000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1650  
10e024671295184 Neil Armstrong        2023-11-30  1651  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1652  
10e024671295184 Neil Armstrong        2023-11-30  1653  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1654  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1655  
10e024671295184 Neil Armstrong        2023-11-30  1656  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1657  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1658  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1659  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1660  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1661  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1662  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1663  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1664  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1665  
10e024671295184 Neil Armstrong        2023-11-30  1666  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1667  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1668  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1669  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1670  
10e024671295184 Neil Armstrong        2023-11-30  1671  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1672  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1673  
10e024671295184 Neil Armstrong        2023-11-30  1674  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1675  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1676  
10e024671295184 Neil Armstrong        2023-11-30  1677  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1678  			};
10e024671295184 Neil Armstrong        2023-11-30  1679  
10e024671295184 Neil Armstrong        2023-11-30  1680  			i2c1: i2c@a84000 {
10e024671295184 Neil Armstrong        2023-11-30  1681  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1682  				reg = <0 0x00a84000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1683  
10e024671295184 Neil Armstrong        2023-11-30  1684  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1685  
10e024671295184 Neil Armstrong        2023-11-30  1686  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1687  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1688  
10e024671295184 Neil Armstrong        2023-11-30  1689  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1690  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1691  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1692  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1693  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1694  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1695  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1696  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1697  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1698  
10e024671295184 Neil Armstrong        2023-11-30  1699  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1700  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1701  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1702  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1703  
10e024671295184 Neil Armstrong        2023-11-30  1704  				pinctrl-0 = <&qup_i2c1_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1705  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1706  
10e024671295184 Neil Armstrong        2023-11-30  1707  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1708  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1709  
10e024671295184 Neil Armstrong        2023-11-30  1710  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1711  			};
10e024671295184 Neil Armstrong        2023-11-30  1712  
10e024671295184 Neil Armstrong        2023-11-30  1713  			spi1: spi@a84000 {
10e024671295184 Neil Armstrong        2023-11-30  1714  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1715  				reg = <0 0x00a84000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1716  
10e024671295184 Neil Armstrong        2023-11-30  1717  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1718  
10e024671295184 Neil Armstrong        2023-11-30  1719  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1720  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1721  
10e024671295184 Neil Armstrong        2023-11-30  1722  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1723  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1724  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1725  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1726  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1727  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1728  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1729  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1730  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1731  
10e024671295184 Neil Armstrong        2023-11-30  1732  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1733  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1734  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1735  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1736  
10e024671295184 Neil Armstrong        2023-11-30  1737  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1738  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1739  
10e024671295184 Neil Armstrong        2023-11-30  1740  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1741  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1742  
10e024671295184 Neil Armstrong        2023-11-30  1743  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1744  			};
10e024671295184 Neil Armstrong        2023-11-30  1745  
10e024671295184 Neil Armstrong        2023-11-30  1746  			i2c2: i2c@a88000 {
10e024671295184 Neil Armstrong        2023-11-30  1747  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1748  				reg = <0 0x00a88000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1749  
10e024671295184 Neil Armstrong        2023-11-30  1750  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1751  
10e024671295184 Neil Armstrong        2023-11-30  1752  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1753  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1754  
10e024671295184 Neil Armstrong        2023-11-30  1755  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1756  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1757  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1758  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1759  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1760  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1761  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1762  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1763  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1764  
10e024671295184 Neil Armstrong        2023-11-30  1765  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1766  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1767  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1768  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1769  
10e024671295184 Neil Armstrong        2023-11-30  1770  				pinctrl-0 = <&qup_i2c2_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1771  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1772  
10e024671295184 Neil Armstrong        2023-11-30  1773  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1774  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1775  
10e024671295184 Neil Armstrong        2023-11-30  1776  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1777  			};
10e024671295184 Neil Armstrong        2023-11-30  1778  
10e024671295184 Neil Armstrong        2023-11-30  1779  			spi2: spi@a88000 {
10e024671295184 Neil Armstrong        2023-11-30  1780  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1781  				reg = <0 0x00a88000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1782  
10e024671295184 Neil Armstrong        2023-11-30  1783  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1784  
10e024671295184 Neil Armstrong        2023-11-30  1785  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1786  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1787  
10e024671295184 Neil Armstrong        2023-11-30  1788  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1789  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1790  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1791  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1792  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1793  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1794  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1795  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1796  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1797  
10e024671295184 Neil Armstrong        2023-11-30  1798  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1799  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1800  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1801  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1802  
10e024671295184 Neil Armstrong        2023-11-30  1803  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1804  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1805  
10e024671295184 Neil Armstrong        2023-11-30  1806  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1807  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1808  
10e024671295184 Neil Armstrong        2023-11-30  1809  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1810  			};
10e024671295184 Neil Armstrong        2023-11-30  1811  
10e024671295184 Neil Armstrong        2023-11-30  1812  			i2c3: i2c@a8c000 {
10e024671295184 Neil Armstrong        2023-11-30  1813  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1814  				reg = <0 0x00a8c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1815  
10e024671295184 Neil Armstrong        2023-11-30  1816  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1817  
10e024671295184 Neil Armstrong        2023-11-30  1818  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1819  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1820  
10e024671295184 Neil Armstrong        2023-11-30  1821  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1822  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1823  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1824  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1825  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1826  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1827  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1828  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1829  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1830  
10e024671295184 Neil Armstrong        2023-11-30  1831  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1832  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1833  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1834  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1835  
10e024671295184 Neil Armstrong        2023-11-30  1836  				pinctrl-0 = <&qup_i2c3_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1837  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1838  
10e024671295184 Neil Armstrong        2023-11-30  1839  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1840  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1841  
10e024671295184 Neil Armstrong        2023-11-30  1842  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1843  			};
10e024671295184 Neil Armstrong        2023-11-30  1844  
10e024671295184 Neil Armstrong        2023-11-30  1845  			spi3: spi@a8c000 {
10e024671295184 Neil Armstrong        2023-11-30  1846  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1847  				reg = <0 0x00a8c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1848  
10e024671295184 Neil Armstrong        2023-11-30  1849  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1850  
10e024671295184 Neil Armstrong        2023-11-30  1851  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1852  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1853  
10e024671295184 Neil Armstrong        2023-11-30  1854  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1855  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1856  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1857  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1858  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1859  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1860  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1861  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1862  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1863  
10e024671295184 Neil Armstrong        2023-11-30  1864  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1865  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1866  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1867  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1868  
10e024671295184 Neil Armstrong        2023-11-30  1869  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1870  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1871  
10e024671295184 Neil Armstrong        2023-11-30  1872  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1873  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1874  
10e024671295184 Neil Armstrong        2023-11-30  1875  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1876  			};
10e024671295184 Neil Armstrong        2023-11-30  1877  
10e024671295184 Neil Armstrong        2023-11-30  1878  			i2c4: i2c@a90000 {
10e024671295184 Neil Armstrong        2023-11-30  1879  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1880  				reg = <0 0x00a90000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1881  
10e024671295184 Neil Armstrong        2023-11-30  1882  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1883  
10e024671295184 Neil Armstrong        2023-11-30  1884  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1885  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1886  
10e024671295184 Neil Armstrong        2023-11-30  1887  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1888  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1889  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1890  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1891  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1892  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1893  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1894  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1895  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1896  
10e024671295184 Neil Armstrong        2023-11-30  1897  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1898  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1899  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1900  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1901  
10e024671295184 Neil Armstrong        2023-11-30  1902  				pinctrl-0 = <&qup_i2c4_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1903  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1904  
10e024671295184 Neil Armstrong        2023-11-30  1905  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1906  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1907  
10e024671295184 Neil Armstrong        2023-11-30  1908  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1909  			};
10e024671295184 Neil Armstrong        2023-11-30  1910  
10e024671295184 Neil Armstrong        2023-11-30  1911  			spi4: spi@a90000 {
10e024671295184 Neil Armstrong        2023-11-30  1912  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1913  				reg = <0 0x00a90000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1914  
10e024671295184 Neil Armstrong        2023-11-30  1915  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1916  
10e024671295184 Neil Armstrong        2023-11-30  1917  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1918  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1919  
10e024671295184 Neil Armstrong        2023-11-30  1920  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1921  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1922  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1923  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1924  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1925  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1926  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1927  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1928  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1929  
10e024671295184 Neil Armstrong        2023-11-30  1930  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1931  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1932  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1933  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1934  
10e024671295184 Neil Armstrong        2023-11-30  1935  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
10e024671295184 Neil Armstrong        2023-11-30  1936  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1937  
10e024671295184 Neil Armstrong        2023-11-30  1938  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1939  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1940  
10e024671295184 Neil Armstrong        2023-11-30  1941  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1942  			};
10e024671295184 Neil Armstrong        2023-11-30  1943  
10e024671295184 Neil Armstrong        2023-11-30  1944  			i2c5: i2c@a94000 {
10e024671295184 Neil Armstrong        2023-11-30  1945  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  1946  				reg = <0 0x00a94000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1947  
10e024671295184 Neil Armstrong        2023-11-30  1948  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1949  
10e024671295184 Neil Armstrong        2023-11-30  1950  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1951  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1952  
10e024671295184 Neil Armstrong        2023-11-30  1953  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1954  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1955  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1956  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1957  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1958  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1959  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1960  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1961  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1962  
10e024671295184 Neil Armstrong        2023-11-30  1963  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  1964  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  1965  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1966  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  1967  
10e024671295184 Neil Armstrong        2023-11-30  1968  				pinctrl-0 = <&qup_i2c5_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  1969  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  1970  
10e024671295184 Neil Armstrong        2023-11-30  1971  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  1972  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  1973  
10e024671295184 Neil Armstrong        2023-11-30  1974  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  1975  			};
10e024671295184 Neil Armstrong        2023-11-30  1976  
10e024671295184 Neil Armstrong        2023-11-30  1977  			spi5: spi@a94000 {
10e024671295184 Neil Armstrong        2023-11-30  1978  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  1979  				reg = <0 0x00a94000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  1980  
10e024671295184 Neil Armstrong        2023-11-30  1981  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  1982  
10e024671295184 Neil Armstrong        2023-11-30  1983  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  1984  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  1985  
10e024671295184 Neil Armstrong        2023-11-30  1986  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1987  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1988  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1989  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  1990  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  1991  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  1992  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  1993  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  1994  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  1995  
10e024671295184 Neil Armstrong        2023-11-30  1996  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  1997  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  1998  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  1999  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  2000  
10e024671295184 Neil Armstrong        2023-11-30  2001  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
10e024671295184 Neil Armstrong        2023-11-30  2002  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  2003  
10e024671295184 Neil Armstrong        2023-11-30  2004  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2005  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2006  
10e024671295184 Neil Armstrong        2023-11-30  2007  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2008  			};
10e024671295184 Neil Armstrong        2023-11-30  2009  
10e024671295184 Neil Armstrong        2023-11-30  2010  			i2c6: i2c@a98000 {
10e024671295184 Neil Armstrong        2023-11-30  2011  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  2012  				reg = <0 0x00a98000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  2013  
10e024671295184 Neil Armstrong        2023-11-30  2014  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2015  
10e024671295184 Neil Armstrong        2023-11-30  2016  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2017  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  2018  
10e024671295184 Neil Armstrong        2023-11-30  2019  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2020  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2021  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2022  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2023  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2024  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2025  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  2026  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  2027  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  2028  
10e024671295184 Neil Armstrong        2023-11-30  2029  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  2030  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  2031  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  2032  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  2033  
10e024671295184 Neil Armstrong        2023-11-30  2034  				pinctrl-0 = <&qup_i2c6_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  2035  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  2036  
10e024671295184 Neil Armstrong        2023-11-30  2037  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2038  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2039  
10e024671295184 Neil Armstrong        2023-11-30  2040  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2041  			};
10e024671295184 Neil Armstrong        2023-11-30  2042  
10e024671295184 Neil Armstrong        2023-11-30  2043  			spi6: spi@a98000 {
10e024671295184 Neil Armstrong        2023-11-30  2044  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  2045  				reg = <0 0x00a98000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  2046  
10e024671295184 Neil Armstrong        2023-11-30  2047  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2048  
10e024671295184 Neil Armstrong        2023-11-30  2049  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2050  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  2051  
10e024671295184 Neil Armstrong        2023-11-30  2052  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2053  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2054  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2055  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2056  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2057  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2058  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  2059  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  2060  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  2061  
10e024671295184 Neil Armstrong        2023-11-30  2062  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  2063  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  2064  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  2065  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  2066  
10e024671295184 Neil Armstrong        2023-11-30  2067  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
10e024671295184 Neil Armstrong        2023-11-30  2068  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  2069  
10e024671295184 Neil Armstrong        2023-11-30  2070  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2071  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2072  
10e024671295184 Neil Armstrong        2023-11-30  2073  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2074  			};
10e024671295184 Neil Armstrong        2023-11-30  2075  
10e024671295184 Neil Armstrong        2023-11-30  2076  			i2c7: i2c@a9c000 {
10e024671295184 Neil Armstrong        2023-11-30  2077  				compatible = "qcom,geni-i2c";
10e024671295184 Neil Armstrong        2023-11-30  2078  				reg = <0 0x00a9c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  2079  
10e024671295184 Neil Armstrong        2023-11-30  2080  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2081  
10e024671295184 Neil Armstrong        2023-11-30  2082  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2083  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  2084  
10e024671295184 Neil Armstrong        2023-11-30  2085  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2086  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2087  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2088  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2089  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2090  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2091  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  2092  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  2093  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  2094  
10e024671295184 Neil Armstrong        2023-11-30  2095  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
10e024671295184 Neil Armstrong        2023-11-30  2096  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
10e024671295184 Neil Armstrong        2023-11-30  2097  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  2098  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  2099  
10e024671295184 Neil Armstrong        2023-11-30  2100  				pinctrl-0 = <&qup_i2c7_data_clk>;
10e024671295184 Neil Armstrong        2023-11-30  2101  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  2102  
10e024671295184 Neil Armstrong        2023-11-30  2103  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2104  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2105  
10e024671295184 Neil Armstrong        2023-11-30  2106  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2107  			};
10e024671295184 Neil Armstrong        2023-11-30  2108  
10e024671295184 Neil Armstrong        2023-11-30  2109  			spi7: spi@a9c000 {
10e024671295184 Neil Armstrong        2023-11-30  2110  				compatible = "qcom,geni-spi";
10e024671295184 Neil Armstrong        2023-11-30  2111  				reg = <0 0x00a9c000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  2112  
10e024671295184 Neil Armstrong        2023-11-30  2113  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2114  
10e024671295184 Neil Armstrong        2023-11-30  2115  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2116  				clock-names = "se";
10e024671295184 Neil Armstrong        2023-11-30  2117  
10e024671295184 Neil Armstrong        2023-11-30  2118  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2119  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2120  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2121  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2122  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2123  						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2124  				interconnect-names = "qup-core",
10e024671295184 Neil Armstrong        2023-11-30  2125  						     "qup-config",
10e024671295184 Neil Armstrong        2023-11-30  2126  						     "qup-memory";
10e024671295184 Neil Armstrong        2023-11-30  2127  
10e024671295184 Neil Armstrong        2023-11-30  2128  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
10e024671295184 Neil Armstrong        2023-11-30  2129  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
10e024671295184 Neil Armstrong        2023-11-30  2130  				dma-names = "tx",
10e024671295184 Neil Armstrong        2023-11-30  2131  					    "rx";
10e024671295184 Neil Armstrong        2023-11-30  2132  
10e024671295184 Neil Armstrong        2023-11-30  2133  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
10e024671295184 Neil Armstrong        2023-11-30  2134  				pinctrl-names = "default";
10e024671295184 Neil Armstrong        2023-11-30  2135  
10e024671295184 Neil Armstrong        2023-11-30  2136  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2137  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2138  
10e024671295184 Neil Armstrong        2023-11-30  2139  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2140  			};
10e024671295184 Neil Armstrong        2023-11-30  2141  		};
10e024671295184 Neil Armstrong        2023-11-30  2142  
10e024671295184 Neil Armstrong        2023-11-30  2143  		cnoc_main: interconnect@1500000 {
10e024671295184 Neil Armstrong        2023-11-30  2144  			compatible = "qcom,sm8650-cnoc-main";
10e024671295184 Neil Armstrong        2023-11-30  2145  			reg = <0 0x01500000 0 0x14080>;
10e024671295184 Neil Armstrong        2023-11-30  2146  
10e024671295184 Neil Armstrong        2023-11-30  2147  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2148  
10e024671295184 Neil Armstrong        2023-11-30  2149  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2150  		};
10e024671295184 Neil Armstrong        2023-11-30  2151  
10e024671295184 Neil Armstrong        2023-11-30  2152  		config_noc: interconnect@1600000 {
10e024671295184 Neil Armstrong        2023-11-30  2153  			compatible = "qcom,sm8650-config-noc";
10e024671295184 Neil Armstrong        2023-11-30  2154  			reg = <0 0x01600000 0 0x6200>;
10e024671295184 Neil Armstrong        2023-11-30  2155  
10e024671295184 Neil Armstrong        2023-11-30  2156  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2157  
10e024671295184 Neil Armstrong        2023-11-30  2158  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2159  		};
10e024671295184 Neil Armstrong        2023-11-30  2160  
10e024671295184 Neil Armstrong        2023-11-30  2161  		system_noc: interconnect@1680000 {
10e024671295184 Neil Armstrong        2023-11-30  2162  			compatible = "qcom,sm8650-system-noc";
10e024671295184 Neil Armstrong        2023-11-30  2163  			reg = <0 0x01680000 0 0x1d080>;
10e024671295184 Neil Armstrong        2023-11-30  2164  
10e024671295184 Neil Armstrong        2023-11-30  2165  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2166  
10e024671295184 Neil Armstrong        2023-11-30  2167  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2168  		};
10e024671295184 Neil Armstrong        2023-11-30  2169  
10e024671295184 Neil Armstrong        2023-11-30  2170  		pcie_noc: interconnect@16c0000 {
10e024671295184 Neil Armstrong        2023-11-30  2171  			compatible = "qcom,sm8650-pcie-anoc";
10e024671295184 Neil Armstrong        2023-11-30  2172  			reg = <0 0x016c0000 0 0x12200>;
10e024671295184 Neil Armstrong        2023-11-30  2173  
10e024671295184 Neil Armstrong        2023-11-30  2174  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2175  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2176  
10e024671295184 Neil Armstrong        2023-11-30  2177  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2178  
10e024671295184 Neil Armstrong        2023-11-30  2179  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2180  		};
10e024671295184 Neil Armstrong        2023-11-30  2181  
10e024671295184 Neil Armstrong        2023-11-30  2182  		aggre1_noc: interconnect@16e0000 {
10e024671295184 Neil Armstrong        2023-11-30  2183  			compatible = "qcom,sm8650-aggre1-noc";
10e024671295184 Neil Armstrong        2023-11-30  2184  			reg = <0 0x016e0000 0 0x16400>;
10e024671295184 Neil Armstrong        2023-11-30  2185  
10e024671295184 Neil Armstrong        2023-11-30  2186  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2187  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2188  
10e024671295184 Neil Armstrong        2023-11-30  2189  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2190  
10e024671295184 Neil Armstrong        2023-11-30  2191  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2192  		};
10e024671295184 Neil Armstrong        2023-11-30  2193  
10e024671295184 Neil Armstrong        2023-11-30  2194  		aggre2_noc: interconnect@1700000 {
10e024671295184 Neil Armstrong        2023-11-30  2195  			compatible = "qcom,sm8650-aggre2-noc";
10e024671295184 Neil Armstrong        2023-11-30  2196  			reg = <0 0x01700000 0 0x1e400>;
10e024671295184 Neil Armstrong        2023-11-30  2197  
10e024671295184 Neil Armstrong        2023-11-30  2198  			clocks = <&rpmhcc RPMH_IPA_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2199  
10e024671295184 Neil Armstrong        2023-11-30  2200  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2201  
10e024671295184 Neil Armstrong        2023-11-30  2202  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2203  		};
10e024671295184 Neil Armstrong        2023-11-30  2204  
10e024671295184 Neil Armstrong        2023-11-30  2205  		mmss_noc: interconnect@1780000 {
10e024671295184 Neil Armstrong        2023-11-30  2206  			compatible = "qcom,sm8650-mmss-noc";
10e024671295184 Neil Armstrong        2023-11-30  2207  			reg = <0 0x01780000 0 0x5b800>;
10e024671295184 Neil Armstrong        2023-11-30  2208  
10e024671295184 Neil Armstrong        2023-11-30  2209  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  2210  
10e024671295184 Neil Armstrong        2023-11-30  2211  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2212  		};
10e024671295184 Neil Armstrong        2023-11-30  2213  
10e024671295184 Neil Armstrong        2023-11-30  2214  		rng: rng@10c3000 {
10e024671295184 Neil Armstrong        2023-11-30  2215  			compatible = "qcom,sm8650-trng", "qcom,trng";
10e024671295184 Neil Armstrong        2023-11-30  2216  			reg = <0 0x010c3000 0 0x1000>;
10e024671295184 Neil Armstrong        2023-11-30  2217  		};
10e024671295184 Neil Armstrong        2023-11-30  2218  
2f2120a15251097 Manivannan Sadhasivam 2024-03-21  2219  		pcie0: pcie@1c00000 {
10e024671295184 Neil Armstrong        2023-11-30  2220  			device_type = "pci";
10e024671295184 Neil Armstrong        2023-11-30  2221  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e024671295184 Neil Armstrong        2023-11-30  2222  			reg = <0 0x01c00000 0 0x3000>,
10e024671295184 Neil Armstrong        2023-11-30  2223  			      <0 0x60000000 0 0xf1d>,
10e024671295184 Neil Armstrong        2023-11-30  2224  			      <0 0x60000f20 0 0xa8>,
10e024671295184 Neil Armstrong        2023-11-30  2225  			      <0 0x60001000 0 0x1000>,
10e024671295184 Neil Armstrong        2023-11-30  2226  			      <0 0x60100000 0 0x100000>;
10e024671295184 Neil Armstrong        2023-11-30  2227  			reg-names = "parf", "dbi", "elbi", "atu", "config";
10e024671295184 Neil Armstrong        2023-11-30  2228  
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2229  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2230  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2231  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2232  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2233  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2234  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2235  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2236  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2237  			interrupt-names = "msi0",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2238  					  "msi1",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2239  					  "msi2",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2240  					  "msi3",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2241  					  "msi4",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2242  					  "msi5",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2243  					  "msi6",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2244  					  "msi7";
10e024671295184 Neil Armstrong        2023-11-30  2245  
10e024671295184 Neil Armstrong        2023-11-30  2246  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2247  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2248  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2249  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2250  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2251  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2252  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2253  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2254  			clock-names = "aux",
10e024671295184 Neil Armstrong        2023-11-30  2255  				      "cfg",
10e024671295184 Neil Armstrong        2023-11-30  2256  				      "bus_master",
10e024671295184 Neil Armstrong        2023-11-30  2257  				      "bus_slave",
10e024671295184 Neil Armstrong        2023-11-30  2258  				      "slave_q2a",
10e024671295184 Neil Armstrong        2023-11-30  2259  				      "ddrss_sf_tbu",
10e024671295184 Neil Armstrong        2023-11-30  2260  				      "noc_aggr",
10e024671295184 Neil Armstrong        2023-11-30  2261  				      "cnoc_sf_axi";
10e024671295184 Neil Armstrong        2023-11-30  2262  
10e024671295184 Neil Armstrong        2023-11-30  2263  			resets = <&gcc GCC_PCIE_0_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  2264  			reset-names = "pci";
10e024671295184 Neil Armstrong        2023-11-30  2265  
10e024671295184 Neil Armstrong        2023-11-30  2266  			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2267  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2268  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2269  					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2270  			interconnect-names = "pcie-mem",
10e024671295184 Neil Armstrong        2023-11-30  2271  					     "cpu-pcie";
10e024671295184 Neil Armstrong        2023-11-30  2272  
10e024671295184 Neil Armstrong        2023-11-30  2273  			power-domains = <&gcc PCIE_0_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2274  
10e024671295184 Neil Armstrong        2023-11-30  2275  			iommu-map = <0     &apps_smmu 0x1400 0x1>,
10e024671295184 Neil Armstrong        2023-11-30  2276  				    <0x100 &apps_smmu 0x1401 0x1>;
10e024671295184 Neil Armstrong        2023-11-30  2277  
10e024671295184 Neil Armstrong        2023-11-30  2278  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2279  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2280  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2281  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2282  			interrupt-map-mask = <0 0 0 0x7>;
10e024671295184 Neil Armstrong        2023-11-30  2283  			#interrupt-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2284  
6d3bd106ad60383 Manivannan Sadhasivam 2024-03-18  2285  			msi-map = <0x0 &gic_its 0x1400 0x1>,
6d3bd106ad60383 Manivannan Sadhasivam 2024-03-18  2286  				  <0x100 &gic_its 0x1401 0x1>;
dfc554d5217163f Manivannan Sadhasivam 2024-02-16  2287  			msi-map-mask = <0xff00>;
a33a532b3b1ecd6 Neil Armstrong        2024-01-25  2288  
10e024671295184 Neil Armstrong        2023-11-30  2289  			linux,pci-domain = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2290  			num-lanes = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2291  			bus-range = <0 0xff>;
10e024671295184 Neil Armstrong        2023-11-30  2292  
10e024671295184 Neil Armstrong        2023-11-30  2293  			phys = <&pcie0_phy>;
10e024671295184 Neil Armstrong        2023-11-30  2294  			phy-names = "pciephy";
10e024671295184 Neil Armstrong        2023-11-30  2295  
10e024671295184 Neil Armstrong        2023-11-30  2296  			#address-cells = <3>;
10e024671295184 Neil Armstrong        2023-11-30  2297  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2298  			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
10e024671295184 Neil Armstrong        2023-11-30  2299  				 <0x02000000 0 0x60300000 0 0x60300000 0 0x3d00000>;
10e024671295184 Neil Armstrong        2023-11-30  2300  
10e024671295184 Neil Armstrong        2023-11-30  2301  			dma-coherent;
10e024671295184 Neil Armstrong        2023-11-30  2302  
10e024671295184 Neil Armstrong        2023-11-30  2303  			status = "disabled";
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2304  
a05737bf7631667 Bartosz Golaszewski   2024-06-05  2305  			pcieport0: pcie@0 {
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2306  				device_type = "pci";
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2307  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2308  				bus-range = <0x01 0xff>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2309  
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2310  				#address-cells = <3>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2311  				#size-cells = <2>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2312  				ranges;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2313  			};
10e024671295184 Neil Armstrong        2023-11-30  2314  		};
10e024671295184 Neil Armstrong        2023-11-30  2315  
10e024671295184 Neil Armstrong        2023-11-30  2316  		pcie0_phy: phy@1c06000 {
10e024671295184 Neil Armstrong        2023-11-30  2317  			compatible = "qcom,sm8650-qmp-gen3x2-pcie-phy";
10e024671295184 Neil Armstrong        2023-11-30  2318  			reg = <0 0x01c06000 0 0x2000>;
10e024671295184 Neil Armstrong        2023-11-30  2319  
10e024671295184 Neil Armstrong        2023-11-30  2320  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2321  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2322  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
10e024671295184 Neil Armstrong        2023-11-30  2323  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2324  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2325  			clock-names = "aux",
10e024671295184 Neil Armstrong        2023-11-30  2326  				      "cfg_ahb",
10e024671295184 Neil Armstrong        2023-11-30  2327  				      "ref",
10e024671295184 Neil Armstrong        2023-11-30  2328  				      "rchng",
10e024671295184 Neil Armstrong        2023-11-30  2329  				      "pipe";
10e024671295184 Neil Armstrong        2023-11-30  2330  
10e024671295184 Neil Armstrong        2023-11-30  2331  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2332  			assigned-clock-rates = <100000000>;
10e024671295184 Neil Armstrong        2023-11-30  2333  
10e024671295184 Neil Armstrong        2023-11-30  2334  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  2335  			reset-names = "phy";
10e024671295184 Neil Armstrong        2023-11-30  2336  
10e024671295184 Neil Armstrong        2023-11-30  2337  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2338  
10e024671295184 Neil Armstrong        2023-11-30  2339  			#clock-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2340  			clock-output-names = "pcie0_pipe_clk";
10e024671295184 Neil Armstrong        2023-11-30  2341  
10e024671295184 Neil Armstrong        2023-11-30  2342  			#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2343  
10e024671295184 Neil Armstrong        2023-11-30  2344  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2345  		};
10e024671295184 Neil Armstrong        2023-11-30  2346  
2f2120a15251097 Manivannan Sadhasivam 2024-03-21  2347  		pcie1: pcie@1c08000 {
10e024671295184 Neil Armstrong        2023-11-30  2348  			device_type = "pci";
10e024671295184 Neil Armstrong        2023-11-30  2349  			compatible = "qcom,pcie-sm8650", "qcom,pcie-sm8550";
10e024671295184 Neil Armstrong        2023-11-30  2350  			reg = <0 0x01c08000 0 0x3000>,
10e024671295184 Neil Armstrong        2023-11-30  2351  			      <0 0x40000000 0 0xf1d>,
10e024671295184 Neil Armstrong        2023-11-30  2352  			      <0 0x40000f20 0 0xa8>,
10e024671295184 Neil Armstrong        2023-11-30  2353  			      <0 0x40001000 0 0x1000>,
10e024671295184 Neil Armstrong        2023-11-30  2354  			      <0 0x40100000 0 0x100000>;
10e024671295184 Neil Armstrong        2023-11-30  2355  			reg-names = "parf",
10e024671295184 Neil Armstrong        2023-11-30  2356  				    "dbi",
10e024671295184 Neil Armstrong        2023-11-30  2357  				    "elbi",
10e024671295184 Neil Armstrong        2023-11-30  2358  				    "atu",
10e024671295184 Neil Armstrong        2023-11-30  2359  				    "config";
10e024671295184 Neil Armstrong        2023-11-30  2360  
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2361  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2362  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2363  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2364  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2365  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2366  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2367  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2368  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2369  			interrupt-names = "msi0",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2370  					  "msi1",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2371  					  "msi2",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2372  					  "msi3",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2373  					  "msi4",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2374  					  "msi5",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2375  					  "msi6",
7ee7c0f326d6c93 Krzysztof Kozlowski   2024-01-26  2376  					  "msi7";
10e024671295184 Neil Armstrong        2023-11-30  2377  
10e024671295184 Neil Armstrong        2023-11-30  2378  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2379  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2380  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2381  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2382  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2383  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2384  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2385  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2386  			clock-names = "aux",
10e024671295184 Neil Armstrong        2023-11-30  2387  				      "cfg",
10e024671295184 Neil Armstrong        2023-11-30  2388  				      "bus_master",
10e024671295184 Neil Armstrong        2023-11-30  2389  				      "bus_slave",
10e024671295184 Neil Armstrong        2023-11-30  2390  				      "slave_q2a",
10e024671295184 Neil Armstrong        2023-11-30  2391  				      "ddrss_sf_tbu",
10e024671295184 Neil Armstrong        2023-11-30  2392  				      "noc_aggr",
10e024671295184 Neil Armstrong        2023-11-30  2393  				      "cnoc_sf_axi";
10e024671295184 Neil Armstrong        2023-11-30  2394  
10e024671295184 Neil Armstrong        2023-11-30  2395  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2396  			assigned-clock-rates = <19200000>;
10e024671295184 Neil Armstrong        2023-11-30  2397  
10e024671295184 Neil Armstrong        2023-11-30  2398  			resets = <&gcc GCC_PCIE_1_BCR>,
10e024671295184 Neil Armstrong        2023-11-30  2399  				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  2400  			reset-names = "pci",
10e024671295184 Neil Armstrong        2023-11-30  2401  				      "link_down";
10e024671295184 Neil Armstrong        2023-11-30  2402  
10e024671295184 Neil Armstrong        2023-11-30  2403  			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2404  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2405  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2406  					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2407  			interconnect-names = "pcie-mem",
10e024671295184 Neil Armstrong        2023-11-30  2408  					     "cpu-pcie";
10e024671295184 Neil Armstrong        2023-11-30  2409  
10e024671295184 Neil Armstrong        2023-11-30  2410  			power-domains = <&gcc PCIE_1_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2411  
10e024671295184 Neil Armstrong        2023-11-30  2412  			iommu-map = <0     &apps_smmu 0x1480 0x1>,
10e024671295184 Neil Armstrong        2023-11-30  2413  				    <0x100 &apps_smmu 0x1481 0x1>;
10e024671295184 Neil Armstrong        2023-11-30  2414  
10e024671295184 Neil Armstrong        2023-11-30  2415  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2416  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2417  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  2418  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2419  			interrupt-map-mask = <0 0 0 0x7>;
10e024671295184 Neil Armstrong        2023-11-30  2420  			#interrupt-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2421  
6d3bd106ad60383 Manivannan Sadhasivam 2024-03-18  2422  			msi-map = <0x0 &gic_its 0x1480 0x1>,
6d3bd106ad60383 Manivannan Sadhasivam 2024-03-18  2423  				  <0x100 &gic_its 0x1481 0x1>;
dfc554d5217163f Manivannan Sadhasivam 2024-02-16  2424  			msi-map-mask = <0xff00>;
a33a532b3b1ecd6 Neil Armstrong        2024-01-25  2425  
10e024671295184 Neil Armstrong        2023-11-30  2426  			linux,pci-domain = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2427  			num-lanes = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2428  			bus-range = <0 0xff>;
10e024671295184 Neil Armstrong        2023-11-30  2429  
10e024671295184 Neil Armstrong        2023-11-30  2430  			phys = <&pcie1_phy>;
10e024671295184 Neil Armstrong        2023-11-30  2431  			phy-names = "pciephy";
10e024671295184 Neil Armstrong        2023-11-30  2432  
10e024671295184 Neil Armstrong        2023-11-30  2433  			dma-coherent;
10e024671295184 Neil Armstrong        2023-11-30  2434  
10e024671295184 Neil Armstrong        2023-11-30  2435  			#address-cells = <3>;
10e024671295184 Neil Armstrong        2023-11-30  2436  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2437  			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
10e024671295184 Neil Armstrong        2023-11-30  2438  				 <0x02000000 0 0x40300000 0 0x40300000 0 0x1fd00000>;
10e024671295184 Neil Armstrong        2023-11-30  2439  
10e024671295184 Neil Armstrong        2023-11-30  2440  			status = "disabled";
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2441  
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2442  			pcie@0 {
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2443  				device_type = "pci";
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2444  				reg = <0x0 0x0 0x0 0x0 0x0>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2445  				bus-range = <0x01 0xff>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2446  
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2447  				#address-cells = <3>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2448  				#size-cells = <2>;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2449  				ranges;
cf3e010d7f4c20d Manivannan Sadhasivam 2024-03-21  2450  			};
10e024671295184 Neil Armstrong        2023-11-30  2451  		};
10e024671295184 Neil Armstrong        2023-11-30  2452  
10e024671295184 Neil Armstrong        2023-11-30  2453  		pcie1_phy: phy@1c0e000 {
10e024671295184 Neil Armstrong        2023-11-30  2454  			compatible = "qcom,sm8650-qmp-gen4x2-pcie-phy";
10e024671295184 Neil Armstrong        2023-11-30  2455  			reg = <0 0x01c0e000 0 0x2000>;
10e024671295184 Neil Armstrong        2023-11-30  2456  
10e024671295184 Neil Armstrong        2023-11-30  2457  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2458  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2459  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
10e024671295184 Neil Armstrong        2023-11-30  2460  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2461  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2462  			clock-names = "aux",
10e024671295184 Neil Armstrong        2023-11-30  2463  				      "cfg_ahb",
10e024671295184 Neil Armstrong        2023-11-30  2464  				      "ref",
10e024671295184 Neil Armstrong        2023-11-30  2465  				      "rchng",
10e024671295184 Neil Armstrong        2023-11-30  2466  				      "pipe";
10e024671295184 Neil Armstrong        2023-11-30  2467  
10e024671295184 Neil Armstrong        2023-11-30  2468  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2469  			assigned-clock-rates = <100000000>;
10e024671295184 Neil Armstrong        2023-11-30  2470  
10e024671295184 Neil Armstrong        2023-11-30  2471  			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
10e024671295184 Neil Armstrong        2023-11-30  2472  				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  2473  			reset-names = "phy",
10e024671295184 Neil Armstrong        2023-11-30  2474  				      "phy_nocsr";
10e024671295184 Neil Armstrong        2023-11-30  2475  
10e024671295184 Neil Armstrong        2023-11-30  2476  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2477  
d00b42f170dfa4d Neil Armstrong        2024-05-02  2478  			#clock-cells = <1>;
dc323623c3b87c4 Dmitry Baryshkov      2024-06-14  2479  			clock-output-names = "pcie1_pipe_clk";
10e024671295184 Neil Armstrong        2023-11-30  2480  
10e024671295184 Neil Armstrong        2023-11-30  2481  			#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2482  
10e024671295184 Neil Armstrong        2023-11-30  2483  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2484  		};
10e024671295184 Neil Armstrong        2023-11-30  2485  
10e024671295184 Neil Armstrong        2023-11-30  2486  		cryptobam: dma-controller@1dc4000 {
10e024671295184 Neil Armstrong        2023-11-30  2487  			compatible = "qcom,bam-v1.7.0";
10e024671295184 Neil Armstrong        2023-11-30  2488  			reg = <0 0x01dc4000 0 0x28000>;
10e024671295184 Neil Armstrong        2023-11-30  2489  
10e024671295184 Neil Armstrong        2023-11-30  2490  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2491  
10e024671295184 Neil Armstrong        2023-11-30  2492  			#dma-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2493  
10e024671295184 Neil Armstrong        2023-11-30  2494  			iommus = <&apps_smmu 0x480 0>,
10e024671295184 Neil Armstrong        2023-11-30  2495  				 <&apps_smmu 0x481 0>;
10e024671295184 Neil Armstrong        2023-11-30  2496  
10e024671295184 Neil Armstrong        2023-11-30  2497  			qcom,ee = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2498  			qcom,controlled-remotely;
10e024671295184 Neil Armstrong        2023-11-30  2499  		};
10e024671295184 Neil Armstrong        2023-11-30  2500  
10e024671295184 Neil Armstrong        2023-11-30  2501  		crypto: crypto@1dfa000 {
10e024671295184 Neil Armstrong        2023-11-30  2502  			compatible = "qcom,sm8650-qce", "qcom,sm8150-qce", "qcom,qce";
10e024671295184 Neil Armstrong        2023-11-30  2503  			reg = <0 0x01dfa000 0 0x6000>;
10e024671295184 Neil Armstrong        2023-11-30  2504  
10e024671295184 Neil Armstrong        2023-11-30  2505  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2506  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2507  			interconnect-names = "memory";
10e024671295184 Neil Armstrong        2023-11-30  2508  
10e024671295184 Neil Armstrong        2023-11-30  2509  			dmas = <&cryptobam 4>, <&cryptobam 5>;
10e024671295184 Neil Armstrong        2023-11-30  2510  			dma-names = "rx", "tx";
10e024671295184 Neil Armstrong        2023-11-30  2511  
10e024671295184 Neil Armstrong        2023-11-30  2512  			iommus = <&apps_smmu 0x480 0>,
10e024671295184 Neil Armstrong        2023-11-30  2513  				 <&apps_smmu 0x481 0>;
10e024671295184 Neil Armstrong        2023-11-30  2514  		};
10e024671295184 Neil Armstrong        2023-11-30  2515  
10e024671295184 Neil Armstrong        2023-11-30  2516  		ufs_mem_phy: phy@1d80000 {
10e024671295184 Neil Armstrong        2023-11-30  2517  			compatible = "qcom,sm8650-qmp-ufs-phy";
10e024671295184 Neil Armstrong        2023-11-30  2518  			reg = <0 0x01d80000 0 0x2000>;
10e024671295184 Neil Armstrong        2023-11-30  2519  
0f9b8054bb4abd7 Manivannan Sadhasivam 2024-01-31  2520  			clocks = <&rpmhcc RPMH_CXO_CLK>,
0f9b8054bb4abd7 Manivannan Sadhasivam 2024-01-31  2521  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
0f9b8054bb4abd7 Manivannan Sadhasivam 2024-01-31  2522  				 <&tcsr TCSR_UFS_CLKREF_EN>;
10e024671295184 Neil Armstrong        2023-11-30  2523  			clock-names = "ref",
0f9b8054bb4abd7 Manivannan Sadhasivam 2024-01-31  2524  				      "ref_aux",
0f9b8054bb4abd7 Manivannan Sadhasivam 2024-01-31  2525  				      "qref";
10e024671295184 Neil Armstrong        2023-11-30  2526  
10e024671295184 Neil Armstrong        2023-11-30  2527  			resets = <&ufs_mem_hc 0>;
10e024671295184 Neil Armstrong        2023-11-30  2528  			reset-names = "ufsphy";
10e024671295184 Neil Armstrong        2023-11-30  2529  
10e024671295184 Neil Armstrong        2023-11-30  2530  			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2531  
10e024671295184 Neil Armstrong        2023-11-30  2532  			#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2533  			#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  2534  
10e024671295184 Neil Armstrong        2023-11-30  2535  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2536  		};
10e024671295184 Neil Armstrong        2023-11-30  2537  
15288649e4c0375 Manivannan Sadhasivam 2024-05-14  2538  		ufs_mem_hc: ufshc@1d84000 {
10e024671295184 Neil Armstrong        2023-11-30  2539  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
10e024671295184 Neil Armstrong        2023-11-30  2540  			reg = <0 0x01d84000 0 0x3000>;
10e024671295184 Neil Armstrong        2023-11-30  2541  
10e024671295184 Neil Armstrong        2023-11-30  2542  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  2543  
10e024671295184 Neil Armstrong        2023-11-30  2544  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2545  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2546  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2547  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2548  				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
10e024671295184 Neil Armstrong        2023-11-30  2549  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2550  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  2551  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2552  			clock-names = "core_clk",
10e024671295184 Neil Armstrong        2023-11-30  2553  				      "bus_aggr_clk",
10e024671295184 Neil Armstrong        2023-11-30  2554  				      "iface_clk",
10e024671295184 Neil Armstrong        2023-11-30  2555  				      "core_clk_unipro",
10e024671295184 Neil Armstrong        2023-11-30  2556  				      "ref_clk",
10e024671295184 Neil Armstrong        2023-11-30  2557  				      "tx_lane0_sync_clk",
10e024671295184 Neil Armstrong        2023-11-30  2558  				      "rx_lane0_sync_clk",
10e024671295184 Neil Armstrong        2023-11-30  2559  				      "rx_lane1_sync_clk";
10e024671295184 Neil Armstrong        2023-11-30  2560  			freq-table-hz = <100000000 403000000>,
10e024671295184 Neil Armstrong        2023-11-30  2561  					<0 0>,
10e024671295184 Neil Armstrong        2023-11-30  2562  					<0 0>,
10e024671295184 Neil Armstrong        2023-11-30  2563  					<100000000 403000000>,
10e024671295184 Neil Armstrong        2023-11-30  2564  					<100000000 403000000>,
10e024671295184 Neil Armstrong        2023-11-30  2565  					<0 0>,
10e024671295184 Neil Armstrong        2023-11-30  2566  					<0 0>,
10e024671295184 Neil Armstrong        2023-11-30  2567  					<0 0>;
10e024671295184 Neil Armstrong        2023-11-30  2568  
10e024671295184 Neil Armstrong        2023-11-30  2569  			resets = <&gcc GCC_UFS_PHY_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  2570  			reset-names = "rst";
10e024671295184 Neil Armstrong        2023-11-30  2571  
10e024671295184 Neil Armstrong        2023-11-30  2572  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2573  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  2574  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2575  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2576  			interconnect-names = "ufs-ddr",
10e024671295184 Neil Armstrong        2023-11-30  2577  					     "cpu-ufs";
10e024671295184 Neil Armstrong        2023-11-30  2578  
10e024671295184 Neil Armstrong        2023-11-30  2579  			power-domains = <&gcc UFS_PHY_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  2580  			required-opps = <&rpmhpd_opp_nom>;
10e024671295184 Neil Armstrong        2023-11-30  2581  
10e024671295184 Neil Armstrong        2023-11-30  2582  			iommus = <&apps_smmu 0x60 0>;
10e024671295184 Neil Armstrong        2023-11-30  2583  
10e024671295184 Neil Armstrong        2023-11-30  2584  			lanes-per-direction = <2>;
10e024671295184 Neil Armstrong        2023-11-30  2585  			qcom,ice = <&ice>;
10e024671295184 Neil Armstrong        2023-11-30  2586  
10e024671295184 Neil Armstrong        2023-11-30  2587  			phys = <&ufs_mem_phy>;
10e024671295184 Neil Armstrong        2023-11-30  2588  			phy-names = "ufsphy";
10e024671295184 Neil Armstrong        2023-11-30  2589  
10e024671295184 Neil Armstrong        2023-11-30  2590  			#reset-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2591  
10e024671295184 Neil Armstrong        2023-11-30  2592  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2593  		};
10e024671295184 Neil Armstrong        2023-11-30  2594  
10e024671295184 Neil Armstrong        2023-11-30  2595  		ice: crypto@1d88000 {
10e024671295184 Neil Armstrong        2023-11-30  2596  			compatible = "qcom,sm8650-inline-crypto-engine",
10e024671295184 Neil Armstrong        2023-11-30  2597  				     "qcom,inline-crypto-engine";
88dfd0b5a199c6c Bartosz Golaszewski   2024-10-07  2598  			reg = <0 0x01d88000 0 0x18000>;
10e024671295184 Neil Armstrong        2023-11-30  2599  
10e024671295184 Neil Armstrong        2023-11-30  2600  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2601  		};
10e024671295184 Neil Armstrong        2023-11-30  2602  
10e024671295184 Neil Armstrong        2023-11-30  2603  		tcsr_mutex: hwlock@1f40000 {
10e024671295184 Neil Armstrong        2023-11-30  2604  			compatible = "qcom,tcsr-mutex";
10e024671295184 Neil Armstrong        2023-11-30  2605  			reg = <0 0x01f40000 0 0x20000>;
10e024671295184 Neil Armstrong        2023-11-30  2606  
10e024671295184 Neil Armstrong        2023-11-30  2607  			#hwlock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2608  		};
10e024671295184 Neil Armstrong        2023-11-30  2609  
10e024671295184 Neil Armstrong        2023-11-30  2610  		tcsr: clock-controller@1fc0000 {
10e024671295184 Neil Armstrong        2023-11-30  2611  			compatible = "qcom,sm8650-tcsr", "syscon";
10e024671295184 Neil Armstrong        2023-11-30  2612  			reg = <0 0x01fc0000 0 0xa0000>;
10e024671295184 Neil Armstrong        2023-11-30  2613  
10e024671295184 Neil Armstrong        2023-11-30  2614  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2615  
10e024671295184 Neil Armstrong        2023-11-30  2616  			#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2617  			#reset-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2618  		};
10e024671295184 Neil Armstrong        2023-11-30  2619  
db33633b05c0b57 Neil Armstrong        2024-03-18  2620  		gpu: gpu@3d00000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2621  			compatible = "qcom,adreno-43051401", "qcom,adreno";
db33633b05c0b57 Neil Armstrong        2024-03-18  2622  			reg = <0x0 0x03d00000 0x0 0x40000>,
0d80ac75cba26fd Connor Abbott         2024-04-26  2623  			      <0x0 0x03d9e000 0x0 0x2000>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2624  			      <0x0 0x03d61000 0x0 0x800>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2625  			reg-names = "kgsl_3d0_reg_memory",
db33633b05c0b57 Neil Armstrong        2024-03-18  2626  				    "cx_mem",
db33633b05c0b57 Neil Armstrong        2024-03-18  2627  				    "cx_dbgc";
db33633b05c0b57 Neil Armstrong        2024-03-18  2628  
db33633b05c0b57 Neil Armstrong        2024-03-18  2629  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2630  
db33633b05c0b57 Neil Armstrong        2024-03-18  2631  			iommus = <&adreno_smmu 0 0x0>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2632  				 <&adreno_smmu 1 0x0>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2633  
db33633b05c0b57 Neil Armstrong        2024-03-18  2634  			operating-points-v2 = <&gpu_opp_table>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2635  
db33633b05c0b57 Neil Armstrong        2024-03-18  2636  			qcom,gmu = <&gmu>;
497624ed550604b Konrad Dybcio         2024-05-10  2637  			#cooling-cells = <2>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2638  
db33633b05c0b57 Neil Armstrong        2024-03-18  2639  			status = "disabled";
db33633b05c0b57 Neil Armstrong        2024-03-18  2640  
db33633b05c0b57 Neil Armstrong        2024-03-18  2641  			zap-shader {
db33633b05c0b57 Neil Armstrong        2024-03-18  2642  				memory-region = <&gpu_micro_code_mem>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2643  			};
db33633b05c0b57 Neil Armstrong        2024-03-18  2644  
db33633b05c0b57 Neil Armstrong        2024-03-18  2645  			/* Speedbin needs more work on A740+, keep only lower freqs */
db33633b05c0b57 Neil Armstrong        2024-03-18  2646  			gpu_opp_table: opp-table {
db33633b05c0b57 Neil Armstrong        2024-03-18  2647  				compatible = "operating-points-v2";
db33633b05c0b57 Neil Armstrong        2024-03-18  2648  
db33633b05c0b57 Neil Armstrong        2024-03-18  2649  				opp-231000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2650  					opp-hz = /bits/ 64 <231000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2651  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2652  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2653  
db33633b05c0b57 Neil Armstrong        2024-03-18  2654  				opp-310000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2655  					opp-hz = /bits/ 64 <310000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2656  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2657  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2658  
db33633b05c0b57 Neil Armstrong        2024-03-18  2659  				opp-366000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2660  					opp-hz = /bits/ 64 <366000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2661  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2662  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2663  
db33633b05c0b57 Neil Armstrong        2024-03-18  2664  				opp-422000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2665  					opp-hz = /bits/ 64 <422000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2666  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2667  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2668  
db33633b05c0b57 Neil Armstrong        2024-03-18  2669  				opp-500000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2670  					opp-hz = /bits/ 64 <500000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2671  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2672  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2673  
db33633b05c0b57 Neil Armstrong        2024-03-18  2674  				opp-578000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2675  					opp-hz = /bits/ 64 <578000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2676  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2677  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2678  
db33633b05c0b57 Neil Armstrong        2024-03-18  2679  				opp-629000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2680  					opp-hz = /bits/ 64 <629000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2681  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2682  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2683  
db33633b05c0b57 Neil Armstrong        2024-03-18  2684  				opp-680000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2685  					opp-hz = /bits/ 64 <680000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2686  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2687  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2688  
db33633b05c0b57 Neil Armstrong        2024-03-18  2689  				opp-720000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2690  					opp-hz = /bits/ 64 <720000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2691  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2692  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2693  
db33633b05c0b57 Neil Armstrong        2024-03-18  2694  				opp-770000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2695  					opp-hz = /bits/ 64 <770000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2696  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2697  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2698  
db33633b05c0b57 Neil Armstrong        2024-03-18  2699  				opp-834000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2700  					opp-hz = /bits/ 64 <834000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2701  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2702  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2703  			};
db33633b05c0b57 Neil Armstrong        2024-03-18  2704  		};
db33633b05c0b57 Neil Armstrong        2024-03-18  2705  
db33633b05c0b57 Neil Armstrong        2024-03-18  2706  		gmu: gmu@3d6a000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2707  			compatible = "qcom,adreno-gmu-750.1", "qcom,adreno-gmu";
db33633b05c0b57 Neil Armstrong        2024-03-18  2708  			reg = <0x0 0x03d6a000 0x0 0x35000>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2709  			      <0x0 0x03d50000 0x0 0x10000>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2710  			      <0x0 0x0b280000 0x0 0x10000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2711  			reg-names = "gmu", "rscc", "gmu_pdc";
db33633b05c0b57 Neil Armstrong        2024-03-18  2712  
db33633b05c0b57 Neil Armstrong        2024-03-18  2713  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2714  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2715  			interrupt-names = "hfi", "gmu";
db33633b05c0b57 Neil Armstrong        2024-03-18  2716  
db33633b05c0b57 Neil Armstrong        2024-03-18  2717  			clocks = <&gpucc GPU_CC_AHB_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2718  				 <&gpucc GPU_CC_CX_GMU_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2719  				 <&gpucc GPU_CC_CXO_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2720  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2721  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2722  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2723  				 <&gpucc GPU_CC_DEMET_CLK>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2724  			clock-names = "ahb",
db33633b05c0b57 Neil Armstrong        2024-03-18  2725  				      "gmu",
db33633b05c0b57 Neil Armstrong        2024-03-18  2726  				      "cxo",
db33633b05c0b57 Neil Armstrong        2024-03-18  2727  				      "axi",
db33633b05c0b57 Neil Armstrong        2024-03-18  2728  				      "memnoc",
db33633b05c0b57 Neil Armstrong        2024-03-18  2729  				      "hub",
db33633b05c0b57 Neil Armstrong        2024-03-18  2730  				      "demet";
db33633b05c0b57 Neil Armstrong        2024-03-18  2731  
db33633b05c0b57 Neil Armstrong        2024-03-18  2732  			power-domains = <&gpucc GPU_CX_GDSC>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2733  					<&gpucc GPU_GX_GDSC>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2734  			power-domain-names = "cx",
db33633b05c0b57 Neil Armstrong        2024-03-18  2735  					     "gx";
db33633b05c0b57 Neil Armstrong        2024-03-18  2736  
db33633b05c0b57 Neil Armstrong        2024-03-18  2737  			iommus = <&adreno_smmu 5 0x0>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2738  
db33633b05c0b57 Neil Armstrong        2024-03-18  2739  			qcom,qmp = <&aoss_qmp>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2740  
db33633b05c0b57 Neil Armstrong        2024-03-18  2741  			operating-points-v2 = <&gmu_opp_table>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2742  
db33633b05c0b57 Neil Armstrong        2024-03-18  2743  			gmu_opp_table: opp-table {
db33633b05c0b57 Neil Armstrong        2024-03-18  2744  				compatible = "operating-points-v2";
db33633b05c0b57 Neil Armstrong        2024-03-18  2745  
db33633b05c0b57 Neil Armstrong        2024-03-18  2746  				opp-260000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2747  					opp-hz = /bits/ 64 <260000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2748  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2749  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2750  
db33633b05c0b57 Neil Armstrong        2024-03-18  2751  				opp-625000000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2752  					opp-hz = /bits/ 64 <625000000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2753  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2754  				};
db33633b05c0b57 Neil Armstrong        2024-03-18  2755  			};
db33633b05c0b57 Neil Armstrong        2024-03-18  2756  		};
db33633b05c0b57 Neil Armstrong        2024-03-18  2757  
10e024671295184 Neil Armstrong        2023-11-30  2758  		gpucc: clock-controller@3d90000 {
10e024671295184 Neil Armstrong        2023-11-30  2759  			compatible = "qcom,sm8650-gpucc";
10e024671295184 Neil Armstrong        2023-11-30  2760  			reg = <0 0x03d90000 0 0xa000>;
10e024671295184 Neil Armstrong        2023-11-30  2761  
10e024671295184 Neil Armstrong        2023-11-30  2762  			clocks = <&bi_tcxo_div2>,
10e024671295184 Neil Armstrong        2023-11-30  2763  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
10e024671295184 Neil Armstrong        2023-11-30  2764  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
10e024671295184 Neil Armstrong        2023-11-30  2765  
10e024671295184 Neil Armstrong        2023-11-30  2766  			#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2767  			#reset-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2768  			#power-domain-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2769  		};
10e024671295184 Neil Armstrong        2023-11-30  2770  
db33633b05c0b57 Neil Armstrong        2024-03-18  2771  		adreno_smmu: iommu@3da0000 {
db33633b05c0b57 Neil Armstrong        2024-03-18  2772  			compatible = "qcom,sm8650-smmu-500", "qcom,adreno-smmu",
db33633b05c0b57 Neil Armstrong        2024-03-18  2773  				     "qcom,smmu-500", "arm,mmu-500";
db33633b05c0b57 Neil Armstrong        2024-03-18  2774  			reg = <0x0 0x03da0000 0x0 0x40000>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2775  			#iommu-cells = <2>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2776  			#global-interrupts = <1>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2777  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2778  				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2779  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2780  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2781  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2782  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2783  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2784  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2785  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2786  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2787  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2788  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2789  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2790  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2791  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2792  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2793  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2794  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2795  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2796  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2797  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2798  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2799  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2800  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2801  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2802  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2803  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2804  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2805  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
db33633b05c0b57 Neil Armstrong        2024-03-18  2806  				 <&gpucc GPU_CC_AHB_CLK>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2807  			clock-names = "hlos",
db33633b05c0b57 Neil Armstrong        2024-03-18  2808  				      "bus",
db33633b05c0b57 Neil Armstrong        2024-03-18  2809  				      "iface",
db33633b05c0b57 Neil Armstrong        2024-03-18  2810  				      "ahb";
db33633b05c0b57 Neil Armstrong        2024-03-18  2811  			power-domains = <&gpucc GPU_CX_GDSC>;
db33633b05c0b57 Neil Armstrong        2024-03-18  2812  			dma-coherent;
db33633b05c0b57 Neil Armstrong        2024-03-18  2813  		};
db33633b05c0b57 Neil Armstrong        2024-03-18  2814  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2815  		ipa: ipa@3f40000 {
9fdddbd134a6884 Neil Armstrong        2023-12-01  2816  			compatible = "qcom,sm8650-ipa", "qcom,sm8550-ipa";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2817  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2818  			iommus = <&apps_smmu 0x4a0 0x0>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2819  				 <&apps_smmu 0x4a2 0x0>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2820  			reg = <0 0x3f40000 0 0x10000>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2821  			      <0 0x3f50000 0 0x5000>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2822  			      <0 0x3e04000 0 0xfc000>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2823  			reg-names = "ipa-reg",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2824  				    "ipa-shared",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2825  				    "gsi";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2826  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2827  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2828  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2829  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2830  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2831  			interrupt-names = "ipa",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2832  					  "gsi",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2833  					  "ipa-clock-query",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2834  					  "ipa-setup-ready";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2835  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2836  			clocks = <&rpmhcc RPMH_IPA_CLK>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2837  			clock-names = "core";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2838  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2839  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2840  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2841  			interconnect-names = "memory",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2842  					     "config";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2843  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2844  			qcom,qmp = <&aoss_qmp>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2845  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2846  			qcom,smem-states = <&ipa_smp2p_out 0>,
9fdddbd134a6884 Neil Armstrong        2023-12-01  2847  					   <&ipa_smp2p_out 1>;
9fdddbd134a6884 Neil Armstrong        2023-12-01  2848  			qcom,smem-state-names = "ipa-clock-enabled-valid",
9fdddbd134a6884 Neil Armstrong        2023-12-01  2849  						"ipa-clock-enabled";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2850  
9fdddbd134a6884 Neil Armstrong        2023-12-01  2851  			status = "disabled";
9fdddbd134a6884 Neil Armstrong        2023-12-01  2852  		};
9fdddbd134a6884 Neil Armstrong        2023-12-01  2853  
10e024671295184 Neil Armstrong        2023-11-30  2854  		remoteproc_mpss: remoteproc@4080000 {
10e024671295184 Neil Armstrong        2023-11-30  2855  			compatible = "qcom,sm8650-mpss-pas";
10e024671295184 Neil Armstrong        2023-11-30  2856  			reg = <0 0x04080000 0 0x4040>;
10e024671295184 Neil Armstrong        2023-11-30  2857  
10e024671295184 Neil Armstrong        2023-11-30  2858  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  2859  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  2860  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  2861  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  2862  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  2863  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  2864  			interrupt-names = "wdog",
10e024671295184 Neil Armstrong        2023-11-30  2865  					  "fatal",
10e024671295184 Neil Armstrong        2023-11-30  2866  					  "ready",
10e024671295184 Neil Armstrong        2023-11-30  2867  					  "handover",
10e024671295184 Neil Armstrong        2023-11-30  2868  					  "stop-ack",
10e024671295184 Neil Armstrong        2023-11-30  2869  					  "shutdown-ack";
10e024671295184 Neil Armstrong        2023-11-30  2870  
10e024671295184 Neil Armstrong        2023-11-30  2871  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  2872  			clock-names = "xo";
10e024671295184 Neil Armstrong        2023-11-30  2873  
10e024671295184 Neil Armstrong        2023-11-30  2874  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  2875  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  2876  
10e024671295184 Neil Armstrong        2023-11-30  2877  			power-domains = <&rpmhpd RPMHPD_CX>,
10e024671295184 Neil Armstrong        2023-11-30  2878  					<&rpmhpd RPMHPD_MSS>;
10e024671295184 Neil Armstrong        2023-11-30  2879  			power-domain-names = "cx",
10e024671295184 Neil Armstrong        2023-11-30  2880  					     "mss";
10e024671295184 Neil Armstrong        2023-11-30  2881  
10e024671295184 Neil Armstrong        2023-11-30  2882  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
af53ecef19ffab5 Neil Armstrong        2024-01-23  2883  					<&mpss_dsm_mem>, <&mpss_dsm_mem_2>,
af53ecef19ffab5 Neil Armstrong        2024-01-23  2884  					<&qlink_logging_mem>;
10e024671295184 Neil Armstrong        2023-11-30  2885  
10e024671295184 Neil Armstrong        2023-11-30  2886  			qcom,qmp = <&aoss_qmp>;
10e024671295184 Neil Armstrong        2023-11-30  2887  
10e024671295184 Neil Armstrong        2023-11-30  2888  			qcom,smem-states = <&smp2p_modem_out 0>;
10e024671295184 Neil Armstrong        2023-11-30  2889  			qcom,smem-state-names = "stop";
10e024671295184 Neil Armstrong        2023-11-30  2890  
10e024671295184 Neil Armstrong        2023-11-30  2891  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  2892  
10e024671295184 Neil Armstrong        2023-11-30  2893  			glink-edge {
10e024671295184 Neil Armstrong        2023-11-30  2894  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
10e024671295184 Neil Armstrong        2023-11-30  2895  							     IPCC_MPROC_SIGNAL_GLINK_QMP
10e024671295184 Neil Armstrong        2023-11-30  2896  							     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  2897  
10e024671295184 Neil Armstrong        2023-11-30  2898  				mboxes = <&ipcc IPCC_CLIENT_MPSS
10e024671295184 Neil Armstrong        2023-11-30  2899  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e024671295184 Neil Armstrong        2023-11-30  2900  
10e024671295184 Neil Armstrong        2023-11-30  2901  				qcom,remote-pid = <1>;
10e024671295184 Neil Armstrong        2023-11-30  2902  
10e024671295184 Neil Armstrong        2023-11-30  2903  				label = "mpss";
10e024671295184 Neil Armstrong        2023-11-30  2904  			};
10e024671295184 Neil Armstrong        2023-11-30  2905  		};
10e024671295184 Neil Armstrong        2023-11-30  2906  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2907  		lpass_wsa2macro: codec@6aa0000 {
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2908  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2909  			reg = <0 0x06aa0000 0 0x1000>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2910  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2911  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2912  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2913  				 <&lpass_vamacro>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2914  			clock-names = "mclk",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2915  				      "macro",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2916  				      "dcodec",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2917  				      "fsgen";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2918  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2919  			#clock-cells = <0>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2920  			clock-output-names = "wsa2-mclk";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2921  			#sound-dai-cells = <1>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2922  		};
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2923  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2924  		swr3: soundwire@6ab0000 {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2925  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2926  			reg = <0 0x06ab0000 0 0x10000>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2927  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2928  			clocks = <&lpass_wsa2macro>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2929  			clock-names = "iface";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2930  			label = "WSA2";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2931  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2932  			pinctrl-0 = <&wsa2_swr_active>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2933  			pinctrl-names = "default";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2934  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2935  			qcom,din-ports = <4>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2936  			qcom,dout-ports = <9>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2937  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2938  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2939  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2940  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2941  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2942  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2943  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2944  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2945  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2946  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2947  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2948  			#address-cells = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2949  			#size-cells = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2950  			#sound-dai-cells = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2951  			status = "disabled";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2952  		};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2953  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2954  		lpass_rxmacro: codec@6ac0000 {
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2955  			compatible = "qcom,sm8650-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2956  			reg = <0 0x06ac0000 0 0x1000>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2957  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2958  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2959  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2960  				 <&lpass_vamacro>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2961  			clock-names = "mclk",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2962  				      "macro",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2963  				      "dcodec",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2964  				      "fsgen";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2965  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2966  			#clock-cells = <0>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2967  			clock-output-names = "mclk";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2968  			#sound-dai-cells = <1>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2969  		};
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  2970  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2971  		swr1: soundwire@6ad0000 {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2972  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2973  			reg = <0 0x06ad0000 0 0x10000>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2974  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2975  			clocks = <&lpass_rxmacro>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2976  			clock-names = "iface";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2977  			label = "RX";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2978  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2979  			pinctrl-0 = <&rx_swr_active>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2980  			pinctrl-names = "default";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2981  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2982  			qcom,din-ports = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2983  			qcom,dout-ports = <11>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2984  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2985  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x03 0xff 0xff 0x31 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2986  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x09 0x01 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2987  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2988  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2989  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0xff 0xff 0x0f 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2990  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0x18 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2991  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2992  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0x01 0x03 0xff 0xff 0x00 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2993  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2994  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2995  			#address-cells = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2996  			#size-cells = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2997  			#sound-dai-cells = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2998  			status = "disabled";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  2999  		};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3000  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3001  		lpass_txmacro: codec@6ae0000 {
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3002  			compatible = "qcom,sm8650-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3003  			reg = <0 0x06ae0000 0 0x1000>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3004  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3005  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3006  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3007  				 <&lpass_vamacro>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3008  			clock-names = "mclk",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3009  				      "macro",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3010  				      "dcodec",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3011  				      "fsgen";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3012  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3013  			#clock-cells = <0>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3014  			clock-output-names = "mclk";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3015  			#sound-dai-cells = <1>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3016  		};
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3017  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3018  		lpass_wsamacro: codec@6b00000 {
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3019  			compatible = "qcom,sm8650-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3020  			reg = <0 0x06b00000 0 0x1000>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3021  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3022  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3023  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3024  				 <&lpass_vamacro>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3025  			clock-names = "mclk",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3026  				      "macro",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3027  				      "dcodec",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3028  				      "fsgen";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3029  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3030  			#clock-cells = <0>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3031  			clock-output-names = "mclk";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3032  			#sound-dai-cells = <1>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3033  		};
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3034  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3035  		swr0: soundwire@6b10000 {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3036  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3037  			reg = <0 0x06b10000 0 0x10000>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3038  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3039  			clocks = <&lpass_wsamacro>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3040  			clock-names = "iface";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3041  			label = "WSA";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3042  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3043  			pinctrl-0 = <&wsa_swr_active>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3044  			pinctrl-names = "default";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3045  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3046  			qcom,din-ports = <4>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3047  			qcom,dout-ports = <9>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3048  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3049  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3050  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3051  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3052  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3053  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3054  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3055  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3056  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3057  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3058  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3059  			#address-cells = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3060  			#size-cells = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3061  			#sound-dai-cells = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3062  			status = "disabled";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3063  		};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3064  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3065  		swr2: soundwire@6d30000 {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3066  			compatible = "qcom,soundwire-v2.0.0";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3067  			reg = <0 0x06d30000 0 0x10000>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3068  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3069  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3070  			interrupt-names = "core", "wakeup";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3071  			clocks = <&lpass_txmacro>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3072  			clock-names = "iface";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3073  			label = "TX";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3074  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3075  			pinctrl-0 = <&tx_swr_active>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3076  			pinctrl-names = "default";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3077  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3078  			qcom,din-ports = <4>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3079  			qcom,dout-ports = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3080  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3081  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3082  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3083  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3084  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3085  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3086  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3087  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3088  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3089  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3090  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3091  			#address-cells = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3092  			#size-cells = <0>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3093  			#sound-dai-cells = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3094  			status = "disabled";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3095  		};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3096  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3097  		lpass_vamacro: codec@6d44000 {
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3098  			compatible = "qcom,sm8650-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3099  			reg = <0 0x06d44000 0 0x1000>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3100  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3101  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3102  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3103  			clock-names = "mclk",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3104  				      "macro",
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3105  				      "dcodec";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3106  
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3107  			#clock-cells = <0>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3108  			clock-output-names = "fsgen";
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3109  			#sound-dai-cells = <1>;
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3110  		};
58872a54e4a858d Krzysztof Kozlowski   2023-12-04  3111  
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3112  		lpass_tlmm: pinctrl@6e80000 {
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3113  			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3114  			reg = <0 0x06e80000 0 0x20000>;
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3115  
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3116  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3117  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3118  			clock-names = "core", "audio";
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3119  
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3120  			gpio-controller;
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3121  			#gpio-cells = <2>;
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3122  			gpio-ranges = <&lpass_tlmm 0 0 23>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3123  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3124  			tx_swr_active: tx-swr-active-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3125  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3126  					pins = "gpio0";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3127  					function = "swr_tx_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3128  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3129  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3130  					bias-disable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3131  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3132  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3133  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3134  					pins = "gpio1", "gpio2", "gpio14";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3135  					function = "swr_tx_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3136  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3137  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3138  					bias-bus-hold;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3139  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3140  			};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3141  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3142  			rx_swr_active: rx-swr-active-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3143  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3144  					pins = "gpio3";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3145  					function = "swr_rx_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3146  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3147  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3148  					bias-disable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3149  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3150  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3151  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3152  					pins = "gpio4", "gpio5";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3153  					function = "swr_rx_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3154  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3155  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3156  					bias-bus-hold;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3157  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3158  			};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3159  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3160  			dmic01_default: dmic01-default-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3161  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3162  					pins = "gpio6";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3163  					function = "dmic1_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3164  					drive-strength = <8>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3165  					output-high;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3166  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3167  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3168  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3169  					pins = "gpio7";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3170  					function = "dmic1_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3171  					drive-strength = <8>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3172  					input-enable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3173  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3174  			};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3175  
94c312767160f0d Krzysztof Kozlowski   2024-02-12  3176  			dmic23_default: dmic23-default-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3177  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3178  					pins = "gpio8";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3179  					function = "dmic2_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3180  					drive-strength = <8>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3181  					output-high;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3182  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3183  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3184  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3185  					pins = "gpio9";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3186  					function = "dmic2_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3187  					drive-strength = <8>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3188  					input-enable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3189  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3190  			};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3191  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3192  			wsa_swr_active: wsa-swr-active-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3193  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3194  					pins = "gpio10";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3195  					function = "wsa_swr_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3196  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3197  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3198  					bias-disable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3199  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3200  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3201  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3202  					pins = "gpio11";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3203  					function = "wsa_swr_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3204  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3205  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3206  					bias-bus-hold;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3207  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3208  			};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3209  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3210  			wsa2_swr_active: wsa2-swr-active-state {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3211  				clk-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3212  					pins = "gpio15";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3213  					function = "wsa2_swr_clk";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3214  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3215  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3216  					bias-disable;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3217  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3218  
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3219  				data-pins {
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3220  					pins = "gpio16";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3221  					function = "wsa2_swr_data";
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3222  					drive-strength = <2>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3223  					slew-rate = <1>;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3224  					bias-bus-hold;
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3225  				};
6a45a90c0c475bf Krzysztof Kozlowski   2023-12-04  3226  			};
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3227  		};
2d6bc13321c9021 Krzysztof Kozlowski   2023-12-04  3228  
10e024671295184 Neil Armstrong        2023-11-30  3229  		lpass_lpiaon_noc: interconnect@7400000 {
10e024671295184 Neil Armstrong        2023-11-30  3230  			compatible = "qcom,sm8650-lpass-lpiaon-noc";
10e024671295184 Neil Armstrong        2023-11-30  3231  			reg = <0 0x07400000 0 0x19080>;
10e024671295184 Neil Armstrong        2023-11-30  3232  
10e024671295184 Neil Armstrong        2023-11-30  3233  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3234  
10e024671295184 Neil Armstrong        2023-11-30  3235  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  3236  		};
10e024671295184 Neil Armstrong        2023-11-30  3237  
10e024671295184 Neil Armstrong        2023-11-30  3238  		lpass_lpicx_noc: interconnect@7430000 {
10e024671295184 Neil Armstrong        2023-11-30  3239  			compatible = "qcom,sm8650-lpass-lpicx-noc";
10e024671295184 Neil Armstrong        2023-11-30  3240  			reg = <0 0x07430000 0 0x3a200>;
10e024671295184 Neil Armstrong        2023-11-30  3241  
10e024671295184 Neil Armstrong        2023-11-30  3242  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3243  
10e024671295184 Neil Armstrong        2023-11-30  3244  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  3245  		};
10e024671295184 Neil Armstrong        2023-11-30  3246  
10e024671295184 Neil Armstrong        2023-11-30  3247  		lpass_ag_noc: interconnect@7e40000 {
10e024671295184 Neil Armstrong        2023-11-30  3248  			compatible = "qcom,sm8650-lpass-ag-noc";
10e024671295184 Neil Armstrong        2023-11-30  3249  			reg = <0 0x07e40000 0 0xe080>;
10e024671295184 Neil Armstrong        2023-11-30  3250  
10e024671295184 Neil Armstrong        2023-11-30  3251  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3252  
10e024671295184 Neil Armstrong        2023-11-30  3253  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  3254  		};
10e024671295184 Neil Armstrong        2023-11-30  3255  
10e024671295184 Neil Armstrong        2023-11-30  3256  		sdhc_2: mmc@8804000 {
10e024671295184 Neil Armstrong        2023-11-30  3257  			compatible = "qcom,sm8650-sdhci", "qcom,sdhci-msm-v5";
10e024671295184 Neil Armstrong        2023-11-30  3258  			reg = <0 0x08804000 0 0x1000>;
10e024671295184 Neil Armstrong        2023-11-30  3259  
10e024671295184 Neil Armstrong        2023-11-30  3260  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  3261  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  3262  			interrupt-names = "hc_irq",
10e024671295184 Neil Armstrong        2023-11-30  3263  					  "pwr_irq";
10e024671295184 Neil Armstrong        2023-11-30  3264  
10e024671295184 Neil Armstrong        2023-11-30  3265  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3266  				 <&gcc GCC_SDCC2_APPS_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3267  				 <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3268  			clock-names = "iface",
10e024671295184 Neil Armstrong        2023-11-30  3269  				      "core",
10e024671295184 Neil Armstrong        2023-11-30  3270  				      "xo";
10e024671295184 Neil Armstrong        2023-11-30  3271  
10e024671295184 Neil Armstrong        2023-11-30  3272  			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  3273  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  3274  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  3275  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  3276  			interconnect-names = "sdhc-ddr",
10e024671295184 Neil Armstrong        2023-11-30  3277  					     "cpu-sdhc";
10e024671295184 Neil Armstrong        2023-11-30  3278  
10e024671295184 Neil Armstrong        2023-11-30  3279  			power-domains = <&rpmhpd RPMHPD_CX>;
10e024671295184 Neil Armstrong        2023-11-30  3280  			operating-points-v2 = <&sdhc2_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  3281  
10e024671295184 Neil Armstrong        2023-11-30  3282  			iommus = <&apps_smmu 0x540 0>;
10e024671295184 Neil Armstrong        2023-11-30  3283  
10e024671295184 Neil Armstrong        2023-11-30  3284  			bus-width = <4>;
10e024671295184 Neil Armstrong        2023-11-30  3285  
10e024671295184 Neil Armstrong        2023-11-30  3286  			/* Forbid SDR104/SDR50 - broken hw! */
10e024671295184 Neil Armstrong        2023-11-30  3287  			sdhci-caps-mask = <0x3 0>;
10e024671295184 Neil Armstrong        2023-11-30  3288  
10e024671295184 Neil Armstrong        2023-11-30  3289  			qcom,dll-config = <0x0007642c>;
10e024671295184 Neil Armstrong        2023-11-30  3290  			qcom,ddr-config = <0x80040868>;
10e024671295184 Neil Armstrong        2023-11-30  3291  
10e024671295184 Neil Armstrong        2023-11-30  3292  			dma-coherent;
10e024671295184 Neil Armstrong        2023-11-30  3293  
10e024671295184 Neil Armstrong        2023-11-30  3294  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3295  
10e024671295184 Neil Armstrong        2023-11-30  3296  			sdhc2_opp_table: opp-table {
10e024671295184 Neil Armstrong        2023-11-30  3297  				compatible = "operating-points-v2";
10e024671295184 Neil Armstrong        2023-11-30  3298  
10e024671295184 Neil Armstrong        2023-11-30  3299  				opp-19200000 {
10e024671295184 Neil Armstrong        2023-11-30  3300  					opp-hz = /bits/ 64 <19200000>;
10e024671295184 Neil Armstrong        2023-11-30  3301  					required-opps = <&rpmhpd_opp_min_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3302  				};
10e024671295184 Neil Armstrong        2023-11-30  3303  
10e024671295184 Neil Armstrong        2023-11-30  3304  				opp-50000000 {
10e024671295184 Neil Armstrong        2023-11-30  3305  					opp-hz = /bits/ 64 <50000000>;
10e024671295184 Neil Armstrong        2023-11-30  3306  					required-opps = <&rpmhpd_opp_low_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3307  				};
10e024671295184 Neil Armstrong        2023-11-30  3308  
10e024671295184 Neil Armstrong        2023-11-30  3309  				opp-100000000 {
10e024671295184 Neil Armstrong        2023-11-30  3310  					opp-hz = /bits/ 64 <100000000>;
10e024671295184 Neil Armstrong        2023-11-30  3311  					required-opps = <&rpmhpd_opp_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3312  				};
10e024671295184 Neil Armstrong        2023-11-30  3313  
10e024671295184 Neil Armstrong        2023-11-30  3314  				opp-202000000 {
10e024671295184 Neil Armstrong        2023-11-30  3315  					opp-hz = /bits/ 64 <202000000>;
10e024671295184 Neil Armstrong        2023-11-30  3316  					required-opps = <&rpmhpd_opp_svs_l1>;
10e024671295184 Neil Armstrong        2023-11-30  3317  				};
10e024671295184 Neil Armstrong        2023-11-30  3318  			};
10e024671295184 Neil Armstrong        2023-11-30  3319  		};
10e024671295184 Neil Armstrong        2023-11-30  3320  
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3321  		videocc: clock-controller@aaf0000 {
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3322  			compatible = "qcom,sm8650-videocc";
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3323  			reg = <0 0x0aaf0000 0 0x10000>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3324  			clocks = <&bi_tcxo_div2>,
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3325  				 <&gcc GCC_VIDEO_AHB_CLK>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3326  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3327  			#clock-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3328  			#reset-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3329  			#power-domain-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3330  		};
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3331  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3332  		cci0: cci@ac15000 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3333  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3334  			reg = <0 0x0ac15000 0 0x1000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3335  			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3336  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3337  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3338  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3339  				 <&camcc CAM_CC_CCI_0_CLK>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3340  			clock-names = "camnoc_axi",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3341  				      "cpas_ahb",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3342  				      "cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3343  			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3344  			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3345  			pinctrl-names = "default", "sleep";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3346  			status = "disabled";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3347  			#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3348  			#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3349  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3350  			cci0_i2c0: i2c-bus@0 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3351  				reg = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3352  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3353  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3354  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3355  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3356  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3357  			cci0_i2c1: i2c-bus@1 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3358  				reg = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3359  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3360  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3361  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3362  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3363  		};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3364  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3365  		cci1: cci@ac16000 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3366  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3367  			reg = <0 0x0ac16000 0 0x1000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3368  			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3369  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3370  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3371  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3372  				 <&camcc CAM_CC_CCI_1_CLK>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3373  			clock-names = "camnoc_axi",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3374  				      "cpas_ahb",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3375  				      "cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3376  			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3377  			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3378  			pinctrl-names = "default", "sleep";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3379  			status = "disabled";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3380  			#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3381  			#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3382  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3383  			cci1_i2c0: i2c-bus@0 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3384  				reg = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3385  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3386  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3387  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3388  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3389  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3390  			cci1_i2c1: i2c-bus@1 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3391  				reg = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3392  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3393  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3394  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3395  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3396  		};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3397  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3398  		cci2: cci@ac17000 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3399  			compatible = "qcom,sm8650-cci", "qcom,msm8996-cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3400  			reg = <0 0x0ac17000 0 0x1000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3401  			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3402  			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3403  			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3404  				 <&camcc CAM_CC_CPAS_AHB_CLK>,
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3405  				 <&camcc CAM_CC_CCI_2_CLK>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3406  			clock-names = "camnoc_axi",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3407  				      "cpas_ahb",
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3408  				      "cci";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3409  			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3410  			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3411  			pinctrl-names = "default", "sleep";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3412  			status = "disabled";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3413  			#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3414  			#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3415  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3416  			cci2_i2c0: i2c-bus@0 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3417  				reg = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3418  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3419  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3420  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3421  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3422  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3423  			cci2_i2c1: i2c-bus@1 {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3424  				reg = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3425  				clock-frequency = <1000000>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3426  				#address-cells = <1>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3427  				#size-cells = <0>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3428  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3429  		};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  3430  
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3431  		camcc: clock-controller@ade0000 {
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3432  			compatible = "qcom,sm8650-camcc";
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3433  			reg = <0 0x0ade0000 0 0x20000>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3434  			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3435  				 <&bi_tcxo_div2>,
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3436  				 <&bi_tcxo_ao_div2>,
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3437  				 <&sleep_clk>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3438  			power-domains = <&rpmhpd RPMHPD_MMCX>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3439  			#clock-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3440  			#reset-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3441  			#power-domain-cells = <1>;
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3442  		};
0bdb730e63f6628 Jagadeesh Kona        2024-06-02  3443  
10e024671295184 Neil Armstrong        2023-11-30  3444  		mdss: display-subsystem@ae00000 {
10e024671295184 Neil Armstrong        2023-11-30  3445  			compatible = "qcom,sm8650-mdss";
10e024671295184 Neil Armstrong        2023-11-30  3446  			reg = <0 0x0ae00000 0 0x1000>;
10e024671295184 Neil Armstrong        2023-11-30  3447  			reg-names = "mdss";
10e024671295184 Neil Armstrong        2023-11-30  3448  
10e024671295184 Neil Armstrong        2023-11-30  3449  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  3450  
10e024671295184 Neil Armstrong        2023-11-30  3451  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3452  				 <&gcc GCC_DISP_HF_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3453  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3454  
10e024671295184 Neil Armstrong        2023-11-30  3455  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  3456  
10e024671295184 Neil Armstrong        2023-11-30  3457  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  3458  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
10e024671295184 Neil Armstrong        2023-11-30  3459  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  3460  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  3461  			interconnect-names = "mdp0-mem",
10e024671295184 Neil Armstrong        2023-11-30  3462  					     "mdp1-mem";
10e024671295184 Neil Armstrong        2023-11-30  3463  
10e024671295184 Neil Armstrong        2023-11-30  3464  			power-domains = <&dispcc MDSS_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  3465  
10e024671295184 Neil Armstrong        2023-11-30  3466  			iommus = <&apps_smmu 0x1c00 0x2>;
10e024671295184 Neil Armstrong        2023-11-30  3467  
10e024671295184 Neil Armstrong        2023-11-30  3468  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30  3469  			#interrupt-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3470  
10e024671295184 Neil Armstrong        2023-11-30  3471  			#address-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3472  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3473  			ranges;
10e024671295184 Neil Armstrong        2023-11-30  3474  
10e024671295184 Neil Armstrong        2023-11-30  3475  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3476  
10e024671295184 Neil Armstrong        2023-11-30  3477  			mdss_mdp: display-controller@ae01000 {
10e024671295184 Neil Armstrong        2023-11-30  3478  				compatible = "qcom,sm8650-dpu";
10e024671295184 Neil Armstrong        2023-11-30  3479  				reg = <0 0x0ae01000 0 0x8f000>,
10e024671295184 Neil Armstrong        2023-11-30  3480  				      <0 0x0aeb0000 0 0x2008>;
10e024671295184 Neil Armstrong        2023-11-30  3481  				reg-names = "mdp",
10e024671295184 Neil Armstrong        2023-11-30  3482  					    "vbif";
10e024671295184 Neil Armstrong        2023-11-30  3483  
10e024671295184 Neil Armstrong        2023-11-30  3484  				interrupts-extended = <&mdss 0>;
10e024671295184 Neil Armstrong        2023-11-30  3485  
10e024671295184 Neil Armstrong        2023-11-30  3486  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3487  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3488  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3489  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3490  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3491  				clock-names = "nrt_bus",
10e024671295184 Neil Armstrong        2023-11-30  3492  					      "iface",
10e024671295184 Neil Armstrong        2023-11-30  3493  					      "lut",
10e024671295184 Neil Armstrong        2023-11-30  3494  					      "core",
10e024671295184 Neil Armstrong        2023-11-30  3495  					      "vsync";
10e024671295184 Neil Armstrong        2023-11-30  3496  
10e024671295184 Neil Armstrong        2023-11-30  3497  				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3498  				assigned-clock-rates = <19200000>;
10e024671295184 Neil Armstrong        2023-11-30  3499  
10e024671295184 Neil Armstrong        2023-11-30  3500  				operating-points-v2 = <&mdp_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  3501  
10e024671295184 Neil Armstrong        2023-11-30  3502  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e024671295184 Neil Armstrong        2023-11-30  3503  
10e024671295184 Neil Armstrong        2023-11-30  3504  				ports {
10e024671295184 Neil Armstrong        2023-11-30  3505  					#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3506  					#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3507  
10e024671295184 Neil Armstrong        2023-11-30  3508  					port@0 {
10e024671295184 Neil Armstrong        2023-11-30  3509  						reg = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3510  
10e024671295184 Neil Armstrong        2023-11-30  3511  						dpu_intf1_out: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3512  							remote-endpoint = <&mdss_dsi0_in>;
10e024671295184 Neil Armstrong        2023-11-30  3513  						};
10e024671295184 Neil Armstrong        2023-11-30  3514  					};
10e024671295184 Neil Armstrong        2023-11-30  3515  
10e024671295184 Neil Armstrong        2023-11-30  3516  					port@1 {
10e024671295184 Neil Armstrong        2023-11-30  3517  						reg = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3518  
10e024671295184 Neil Armstrong        2023-11-30  3519  						dpu_intf2_out: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3520  							remote-endpoint = <&mdss_dsi1_in>;
10e024671295184 Neil Armstrong        2023-11-30  3521  						};
10e024671295184 Neil Armstrong        2023-11-30  3522  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3523  
990b6c928b212d9 Neil Armstrong        2023-12-08  3524  					port@2 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3525  						reg = <2>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3526  
990b6c928b212d9 Neil Armstrong        2023-12-08  3527  						dpu_intf0_out: endpoint {
990b6c928b212d9 Neil Armstrong        2023-12-08  3528  							remote-endpoint = <&mdss_dp0_in>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3529  						};
990b6c928b212d9 Neil Armstrong        2023-12-08  3530  					};
10e024671295184 Neil Armstrong        2023-11-30  3531  				};
10e024671295184 Neil Armstrong        2023-11-30  3532  
10e024671295184 Neil Armstrong        2023-11-30  3533  				mdp_opp_table: opp-table {
10e024671295184 Neil Armstrong        2023-11-30  3534  					compatible = "operating-points-v2";
10e024671295184 Neil Armstrong        2023-11-30  3535  
10e024671295184 Neil Armstrong        2023-11-30  3536  					opp-200000000 {
10e024671295184 Neil Armstrong        2023-11-30  3537  						opp-hz = /bits/ 64 <200000000>;
10e024671295184 Neil Armstrong        2023-11-30  3538  						required-opps = <&rpmhpd_opp_low_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3539  					};
10e024671295184 Neil Armstrong        2023-11-30  3540  
10e024671295184 Neil Armstrong        2023-11-30  3541  					opp-325000000 {
10e024671295184 Neil Armstrong        2023-11-30  3542  						opp-hz = /bits/ 64 <325000000>;
10e024671295184 Neil Armstrong        2023-11-30  3543  						required-opps = <&rpmhpd_opp_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3544  					};
10e024671295184 Neil Armstrong        2023-11-30  3545  
10e024671295184 Neil Armstrong        2023-11-30  3546  					opp-375000000 {
10e024671295184 Neil Armstrong        2023-11-30  3547  						opp-hz = /bits/ 64 <375000000>;
10e024671295184 Neil Armstrong        2023-11-30  3548  						required-opps = <&rpmhpd_opp_svs_l1>;
10e024671295184 Neil Armstrong        2023-11-30  3549  					};
10e024671295184 Neil Armstrong        2023-11-30  3550  
10e024671295184 Neil Armstrong        2023-11-30  3551  					opp-514000000 {
10e024671295184 Neil Armstrong        2023-11-30  3552  						opp-hz = /bits/ 64 <514000000>;
10e024671295184 Neil Armstrong        2023-11-30  3553  						required-opps = <&rpmhpd_opp_nom>;
10e024671295184 Neil Armstrong        2023-11-30  3554  					};
10e024671295184 Neil Armstrong        2023-11-30  3555  				};
10e024671295184 Neil Armstrong        2023-11-30  3556  			};
10e024671295184 Neil Armstrong        2023-11-30  3557  
10e024671295184 Neil Armstrong        2023-11-30  3558  			mdss_dsi0: dsi@ae94000 {
10e024671295184 Neil Armstrong        2023-11-30  3559  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e024671295184 Neil Armstrong        2023-11-30  3560  				reg = <0 0x0ae94000 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  3561  				reg-names = "dsi_ctrl";
10e024671295184 Neil Armstrong        2023-11-30  3562  
10e024671295184 Neil Armstrong        2023-11-30  3563  				interrupts-extended = <&mdss 4>;
10e024671295184 Neil Armstrong        2023-11-30  3564  
10e024671295184 Neil Armstrong        2023-11-30  3565  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3566  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3567  					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3568  					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3569  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3570  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3571  				clock-names = "byte",
10e024671295184 Neil Armstrong        2023-11-30  3572  					      "byte_intf",
10e024671295184 Neil Armstrong        2023-11-30  3573  					      "pixel",
10e024671295184 Neil Armstrong        2023-11-30  3574  					      "core",
10e024671295184 Neil Armstrong        2023-11-30  3575  					      "iface",
10e024671295184 Neil Armstrong        2023-11-30  3576  					      "bus";
10e024671295184 Neil Armstrong        2023-11-30  3577  
10e024671295184 Neil Armstrong        2023-11-30  3578  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
10e024671295184 Neil Armstrong        2023-11-30  3579  						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
10e024671295184 Neil Armstrong        2023-11-30  3580  				assigned-clock-parents = <&mdss_dsi0_phy 0>,
10e024671295184 Neil Armstrong        2023-11-30  3581  							 <&mdss_dsi0_phy 1>;
10e024671295184 Neil Armstrong        2023-11-30  3582  
10e024671295184 Neil Armstrong        2023-11-30  3583  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  3584  
10e024671295184 Neil Armstrong        2023-11-30  3585  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e024671295184 Neil Armstrong        2023-11-30  3586  
10e024671295184 Neil Armstrong        2023-11-30  3587  				phys = <&mdss_dsi0_phy>;
10e024671295184 Neil Armstrong        2023-11-30  3588  				phy-names = "dsi";
10e024671295184 Neil Armstrong        2023-11-30  3589  
10e024671295184 Neil Armstrong        2023-11-30  3590  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3591  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3592  
10e024671295184 Neil Armstrong        2023-11-30  3593  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3594  
10e024671295184 Neil Armstrong        2023-11-30  3595  				ports {
10e024671295184 Neil Armstrong        2023-11-30  3596  					#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3597  					#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3598  
10e024671295184 Neil Armstrong        2023-11-30  3599  					port@0 {
10e024671295184 Neil Armstrong        2023-11-30  3600  						reg = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3601  
10e024671295184 Neil Armstrong        2023-11-30  3602  						mdss_dsi0_in: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3603  							remote-endpoint = <&dpu_intf1_out>;
10e024671295184 Neil Armstrong        2023-11-30  3604  						};
10e024671295184 Neil Armstrong        2023-11-30  3605  					};
10e024671295184 Neil Armstrong        2023-11-30  3606  
10e024671295184 Neil Armstrong        2023-11-30  3607  					port@1 {
10e024671295184 Neil Armstrong        2023-11-30  3608  						reg = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3609  
10e024671295184 Neil Armstrong        2023-11-30  3610  						mdss_dsi0_out: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3611  						};
10e024671295184 Neil Armstrong        2023-11-30  3612  					};
10e024671295184 Neil Armstrong        2023-11-30  3613  				};
10e024671295184 Neil Armstrong        2023-11-30  3614  
10e024671295184 Neil Armstrong        2023-11-30  3615  				mdss_dsi_opp_table: opp-table {
10e024671295184 Neil Armstrong        2023-11-30  3616  					compatible = "operating-points-v2";
10e024671295184 Neil Armstrong        2023-11-30  3617  
10e024671295184 Neil Armstrong        2023-11-30  3618  					opp-187500000 {
10e024671295184 Neil Armstrong        2023-11-30  3619  						opp-hz = /bits/ 64 <187500000>;
10e024671295184 Neil Armstrong        2023-11-30  3620  						required-opps = <&rpmhpd_opp_low_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3621  					};
10e024671295184 Neil Armstrong        2023-11-30  3622  
10e024671295184 Neil Armstrong        2023-11-30  3623  					opp-300000000 {
10e024671295184 Neil Armstrong        2023-11-30  3624  						opp-hz = /bits/ 64 <300000000>;
10e024671295184 Neil Armstrong        2023-11-30  3625  						required-opps = <&rpmhpd_opp_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3626  					};
10e024671295184 Neil Armstrong        2023-11-30  3627  
10e024671295184 Neil Armstrong        2023-11-30  3628  					opp-358000000 {
10e024671295184 Neil Armstrong        2023-11-30  3629  						opp-hz = /bits/ 64 <358000000>;
10e024671295184 Neil Armstrong        2023-11-30  3630  						required-opps = <&rpmhpd_opp_svs_l1>;
10e024671295184 Neil Armstrong        2023-11-30  3631  					};
10e024671295184 Neil Armstrong        2023-11-30  3632  				};
10e024671295184 Neil Armstrong        2023-11-30  3633  			};
10e024671295184 Neil Armstrong        2023-11-30  3634  
10e024671295184 Neil Armstrong        2023-11-30  3635  			mdss_dsi0_phy: phy@ae95000 {
10e024671295184 Neil Armstrong        2023-11-30  3636  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e024671295184 Neil Armstrong        2023-11-30  3637  				reg = <0 0x0ae95000 0 0x200>,
10e024671295184 Neil Armstrong        2023-11-30  3638  				      <0 0x0ae95200 0 0x280>,
10e024671295184 Neil Armstrong        2023-11-30  3639  				      <0 0x0ae95500 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  3640  				reg-names = "dsi_phy",
10e024671295184 Neil Armstrong        2023-11-30  3641  					    "dsi_phy_lane",
10e024671295184 Neil Armstrong        2023-11-30  3642  					    "dsi_pll";
10e024671295184 Neil Armstrong        2023-11-30  3643  
10e024671295184 Neil Armstrong        2023-11-30  3644  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3645  					 <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3646  				clock-names = "iface",
10e024671295184 Neil Armstrong        2023-11-30  3647  					      "ref";
10e024671295184 Neil Armstrong        2023-11-30  3648  
10e024671295184 Neil Armstrong        2023-11-30  3649  				#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3650  				#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3651  
10e024671295184 Neil Armstrong        2023-11-30  3652  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3653  			};
10e024671295184 Neil Armstrong        2023-11-30  3654  
10e024671295184 Neil Armstrong        2023-11-30  3655  			mdss_dsi1: dsi@ae96000 {
10e024671295184 Neil Armstrong        2023-11-30  3656  				compatible = "qcom,sm8650-dsi-ctrl", "qcom,mdss-dsi-ctrl";
10e024671295184 Neil Armstrong        2023-11-30  3657  				reg = <0 0x0ae96000 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  3658  				reg-names = "dsi_ctrl";
10e024671295184 Neil Armstrong        2023-11-30  3659  
10e024671295184 Neil Armstrong        2023-11-30  3660  				interrupts-extended = <&mdss 5>;
10e024671295184 Neil Armstrong        2023-11-30  3661  
10e024671295184 Neil Armstrong        2023-11-30  3662  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3663  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3664  					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3665  					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3666  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3667  					 <&gcc GCC_DISP_HF_AXI_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3668  				clock-names = "byte",
10e024671295184 Neil Armstrong        2023-11-30  3669  					      "byte_intf",
10e024671295184 Neil Armstrong        2023-11-30  3670  					      "pixel",
10e024671295184 Neil Armstrong        2023-11-30  3671  					      "core",
10e024671295184 Neil Armstrong        2023-11-30  3672  					      "iface",
10e024671295184 Neil Armstrong        2023-11-30  3673  					      "bus";
10e024671295184 Neil Armstrong        2023-11-30  3674  
10e024671295184 Neil Armstrong        2023-11-30  3675  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
10e024671295184 Neil Armstrong        2023-11-30  3676  						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
10e024671295184 Neil Armstrong        2023-11-30  3677  				assigned-clock-parents = <&mdss_dsi1_phy 0>,
10e024671295184 Neil Armstrong        2023-11-30  3678  							 <&mdss_dsi1_phy 1>;
10e024671295184 Neil Armstrong        2023-11-30  3679  
10e024671295184 Neil Armstrong        2023-11-30  3680  				operating-points-v2 = <&mdss_dsi_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  3681  
10e024671295184 Neil Armstrong        2023-11-30  3682  				power-domains = <&rpmhpd RPMHPD_MMCX>;
10e024671295184 Neil Armstrong        2023-11-30  3683  
10e024671295184 Neil Armstrong        2023-11-30  3684  				phys = <&mdss_dsi1_phy>;
10e024671295184 Neil Armstrong        2023-11-30  3685  				phy-names = "dsi";
10e024671295184 Neil Armstrong        2023-11-30  3686  
10e024671295184 Neil Armstrong        2023-11-30  3687  				#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3688  				#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3689  
10e024671295184 Neil Armstrong        2023-11-30  3690  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3691  
10e024671295184 Neil Armstrong        2023-11-30  3692  				ports {
10e024671295184 Neil Armstrong        2023-11-30  3693  					#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3694  					#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3695  
10e024671295184 Neil Armstrong        2023-11-30  3696  					port@0 {
10e024671295184 Neil Armstrong        2023-11-30  3697  						reg = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3698  
10e024671295184 Neil Armstrong        2023-11-30  3699  						mdss_dsi1_in: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3700  							remote-endpoint = <&dpu_intf2_out>;
10e024671295184 Neil Armstrong        2023-11-30  3701  						};
10e024671295184 Neil Armstrong        2023-11-30  3702  					};
10e024671295184 Neil Armstrong        2023-11-30  3703  
10e024671295184 Neil Armstrong        2023-11-30  3704  					port@1 {
10e024671295184 Neil Armstrong        2023-11-30  3705  						reg = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3706  
10e024671295184 Neil Armstrong        2023-11-30  3707  						mdss_dsi1_out: endpoint {
10e024671295184 Neil Armstrong        2023-11-30  3708  						};
10e024671295184 Neil Armstrong        2023-11-30  3709  					};
10e024671295184 Neil Armstrong        2023-11-30  3710  				};
10e024671295184 Neil Armstrong        2023-11-30  3711  			};
10e024671295184 Neil Armstrong        2023-11-30  3712  
10e024671295184 Neil Armstrong        2023-11-30  3713  			mdss_dsi1_phy: phy@ae97000 {
10e024671295184 Neil Armstrong        2023-11-30  3714  				compatible = "qcom,sm8650-dsi-phy-4nm";
10e024671295184 Neil Armstrong        2023-11-30  3715  				reg = <0 0x0ae97000 0 0x200>,
10e024671295184 Neil Armstrong        2023-11-30  3716  				      <0 0x0ae97200 0 0x280>,
10e024671295184 Neil Armstrong        2023-11-30  3717  				      <0 0x0ae97500 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  3718  				reg-names = "dsi_phy",
10e024671295184 Neil Armstrong        2023-11-30  3719  					    "dsi_phy_lane",
10e024671295184 Neil Armstrong        2023-11-30  3720  					    "dsi_pll";
10e024671295184 Neil Armstrong        2023-11-30  3721  
10e024671295184 Neil Armstrong        2023-11-30  3722  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3723  					 <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3724  				clock-names = "iface",
10e024671295184 Neil Armstrong        2023-11-30  3725  					      "ref";
10e024671295184 Neil Armstrong        2023-11-30  3726  
10e024671295184 Neil Armstrong        2023-11-30  3727  				#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3728  				#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3729  
10e024671295184 Neil Armstrong        2023-11-30  3730  				status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3731  			};
990b6c928b212d9 Neil Armstrong        2023-12-08  3732  
990b6c928b212d9 Neil Armstrong        2023-12-08  3733  			mdss_dp0: displayport-controller@af54000 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3734  				compatible = "qcom,sm8650-dp";
990b6c928b212d9 Neil Armstrong        2023-12-08  3735  				reg = <0 0xaf54000 0 0x104>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3736  				      <0 0xaf54200 0 0xc0>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3737  				      <0 0xaf55000 0 0x770>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3738  				      <0 0xaf56000 0 0x9c>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3739  				      <0 0xaf57000 0 0x9c>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3740  
990b6c928b212d9 Neil Armstrong        2023-12-08  3741  				interrupts-extended = <&mdss 12>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3742  
990b6c928b212d9 Neil Armstrong        2023-12-08  3743  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3744  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3745  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3746  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3747  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3748  				clock-names = "core_iface",
990b6c928b212d9 Neil Armstrong        2023-12-08  3749  					      "core_aux",
990b6c928b212d9 Neil Armstrong        2023-12-08  3750  					      "ctrl_link",
990b6c928b212d9 Neil Armstrong        2023-12-08  3751  					      "ctrl_link_iface",
990b6c928b212d9 Neil Armstrong        2023-12-08  3752  					      "stream_pixel";
990b6c928b212d9 Neil Armstrong        2023-12-08  3753  
990b6c928b212d9 Neil Armstrong        2023-12-08  3754  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3755  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3756  				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3757  							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3758  
990b6c928b212d9 Neil Armstrong        2023-12-08  3759  				operating-points-v2 = <&dp_opp_table>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3760  
990b6c928b212d9 Neil Armstrong        2023-12-08  3761  				power-domains = <&rpmhpd RPMHPD_MMCX>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3762  
990b6c928b212d9 Neil Armstrong        2023-12-08  3763  				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3764  				phy-names = "dp";
990b6c928b212d9 Neil Armstrong        2023-12-08  3765  
990b6c928b212d9 Neil Armstrong        2023-12-08  3766  				#sound-dai-cells = <0>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3767  
990b6c928b212d9 Neil Armstrong        2023-12-08  3768  				status = "disabled";
990b6c928b212d9 Neil Armstrong        2023-12-08  3769  
990b6c928b212d9 Neil Armstrong        2023-12-08  3770  				dp_opp_table: opp-table {
990b6c928b212d9 Neil Armstrong        2023-12-08  3771  					compatible = "operating-points-v2";
990b6c928b212d9 Neil Armstrong        2023-12-08  3772  
990b6c928b212d9 Neil Armstrong        2023-12-08  3773  					opp-162000000 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3774  						opp-hz = /bits/ 64 <162000000>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3775  						required-opps = <&rpmhpd_opp_low_svs_d1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3776  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3777  
990b6c928b212d9 Neil Armstrong        2023-12-08  3778  					opp-270000000 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3779  						opp-hz = /bits/ 64 <270000000>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3780  						required-opps = <&rpmhpd_opp_low_svs>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3781  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3782  
990b6c928b212d9 Neil Armstrong        2023-12-08  3783  					opp-540000000 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3784  						opp-hz = /bits/ 64 <540000000>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3785  						required-opps = <&rpmhpd_opp_svs_l1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3786  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3787  
990b6c928b212d9 Neil Armstrong        2023-12-08  3788  					opp-810000000 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3789  						opp-hz = /bits/ 64 <810000000>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3790  						required-opps = <&rpmhpd_opp_nom>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3791  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3792  				};
990b6c928b212d9 Neil Armstrong        2023-12-08  3793  
990b6c928b212d9 Neil Armstrong        2023-12-08  3794  				ports {
990b6c928b212d9 Neil Armstrong        2023-12-08  3795  					#address-cells = <1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3796  					#size-cells = <0>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3797  
990b6c928b212d9 Neil Armstrong        2023-12-08  3798  					port@0 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3799  						reg = <0>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3800  
990b6c928b212d9 Neil Armstrong        2023-12-08  3801  						mdss_dp0_in: endpoint {
990b6c928b212d9 Neil Armstrong        2023-12-08  3802  							remote-endpoint = <&dpu_intf0_out>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3803  						};
990b6c928b212d9 Neil Armstrong        2023-12-08  3804  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3805  
990b6c928b212d9 Neil Armstrong        2023-12-08  3806  					port@1 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3807  						reg = <1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3808  
990b6c928b212d9 Neil Armstrong        2023-12-08  3809  						mdss_dp0_out: endpoint {
65931e59e039912 Dmitry Baryshkov      2024-04-29  3810  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3811  						};
990b6c928b212d9 Neil Armstrong        2023-12-08  3812  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3813  				};
990b6c928b212d9 Neil Armstrong        2023-12-08  3814  			};
10e024671295184 Neil Armstrong        2023-11-30  3815  		};
10e024671295184 Neil Armstrong        2023-11-30  3816  
10e024671295184 Neil Armstrong        2023-11-30  3817  		dispcc: clock-controller@af00000 {
10e024671295184 Neil Armstrong        2023-11-30  3818  			compatible = "qcom,sm8650-dispcc";
10e024671295184 Neil Armstrong        2023-11-30  3819  			reg = <0 0x0af00000 0 0x20000>;
10e024671295184 Neil Armstrong        2023-11-30  3820  
10e024671295184 Neil Armstrong        2023-11-30  3821  			clocks = <&bi_tcxo_div2>,
10e024671295184 Neil Armstrong        2023-11-30  3822  				 <&bi_tcxo_ao_div2>,
10e024671295184 Neil Armstrong        2023-11-30  3823  				 <&gcc GCC_DISP_AHB_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3824  				 <&sleep_clk>,
10e024671295184 Neil Armstrong        2023-11-30  3825  				 <&mdss_dsi0_phy 0>,
10e024671295184 Neil Armstrong        2023-11-30  3826  				 <&mdss_dsi0_phy 1>,
10e024671295184 Neil Armstrong        2023-11-30  3827  				 <&mdss_dsi1_phy 0>,
10e024671295184 Neil Armstrong        2023-11-30  3828  				 <&mdss_dsi1_phy 1>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3829  				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
990b6c928b212d9 Neil Armstrong        2023-12-08  3830  				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3831  				 <0>, /* dp1 */
10e024671295184 Neil Armstrong        2023-11-30  3832  				 <0>,
10e024671295184 Neil Armstrong        2023-11-30  3833  				 <0>, /* dp2 */
10e024671295184 Neil Armstrong        2023-11-30  3834  				 <0>,
10e024671295184 Neil Armstrong        2023-11-30  3835  				 <0>, /* dp3 */
10e024671295184 Neil Armstrong        2023-11-30  3836  				 <0>;
10e024671295184 Neil Armstrong        2023-11-30  3837  
10e024671295184 Neil Armstrong        2023-11-30  3838  			power-domains = <&rpmhpd RPMHPD_MMCX>;
10e024671295184 Neil Armstrong        2023-11-30  3839  			required-opps = <&rpmhpd_opp_low_svs>;
10e024671295184 Neil Armstrong        2023-11-30  3840  
10e024671295184 Neil Armstrong        2023-11-30  3841  			#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3842  			#reset-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3843  			#power-domain-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3844  		};
10e024671295184 Neil Armstrong        2023-11-30  3845  
10e024671295184 Neil Armstrong        2023-11-30  3846  		usb_1_hsphy: phy@88e3000 {
10e024671295184 Neil Armstrong        2023-11-30  3847  			compatible = "qcom,sm8650-snps-eusb2-phy",
10e024671295184 Neil Armstrong        2023-11-30  3848  				     "qcom,sm8550-snps-eusb2-phy";
10e024671295184 Neil Armstrong        2023-11-30  3849  			reg = <0 0x088e3000 0 0x154>;
10e024671295184 Neil Armstrong        2023-11-30  3850  
10e024671295184 Neil Armstrong        2023-11-30  3851  			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
10e024671295184 Neil Armstrong        2023-11-30  3852  			clock-names = "ref";
10e024671295184 Neil Armstrong        2023-11-30  3853  
10e024671295184 Neil Armstrong        2023-11-30  3854  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  3855  
10e024671295184 Neil Armstrong        2023-11-30  3856  			#phy-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  3857  
10e024671295184 Neil Armstrong        2023-11-30  3858  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3859  		};
10e024671295184 Neil Armstrong        2023-11-30  3860  
10e024671295184 Neil Armstrong        2023-11-30  3861  		usb_dp_qmpphy: phy@88e8000 {
10e024671295184 Neil Armstrong        2023-11-30  3862  			compatible = "qcom,sm8650-qmp-usb3-dp-phy";
10e024671295184 Neil Armstrong        2023-11-30  3863  			reg = <0 0x088e8000 0 0x3000>;
10e024671295184 Neil Armstrong        2023-11-30  3864  
10e024671295184 Neil Armstrong        2023-11-30  3865  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3866  				 <&rpmhcc RPMH_CXO_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3867  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3868  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3869  			clock-names = "aux",
10e024671295184 Neil Armstrong        2023-11-30  3870  				      "ref",
10e024671295184 Neil Armstrong        2023-11-30  3871  				      "com_aux",
10e024671295184 Neil Armstrong        2023-11-30  3872  				      "usb3_pipe";
10e024671295184 Neil Armstrong        2023-11-30  3873  
10e024671295184 Neil Armstrong        2023-11-30  3874  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
10e024671295184 Neil Armstrong        2023-11-30  3875  				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  3876  			reset-names = "phy",
10e024671295184 Neil Armstrong        2023-11-30  3877  				      "common";
10e024671295184 Neil Armstrong        2023-11-30  3878  
10e024671295184 Neil Armstrong        2023-11-30  3879  			power-domains = <&gcc USB3_PHY_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  3880  
10e024671295184 Neil Armstrong        2023-11-30  3881  			#clock-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3882  			#phy-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  3883  
fbb22a182267c8d Dmitry Baryshkov      2024-04-29  3884  			orientation-switch;
fbb22a182267c8d Dmitry Baryshkov      2024-04-29  3885  
10e024671295184 Neil Armstrong        2023-11-30  3886  			status = "disabled";
990b6c928b212d9 Neil Armstrong        2023-12-08  3887  
990b6c928b212d9 Neil Armstrong        2023-12-08  3888  			ports {
990b6c928b212d9 Neil Armstrong        2023-12-08  3889  				#address-cells = <1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3890  				#size-cells = <0>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3891  
990b6c928b212d9 Neil Armstrong        2023-12-08  3892  				port@0 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3893  					reg = <0>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3894  
990b6c928b212d9 Neil Armstrong        2023-12-08  3895  					usb_dp_qmpphy_out: endpoint {
990b6c928b212d9 Neil Armstrong        2023-12-08  3896  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3897  				};
990b6c928b212d9 Neil Armstrong        2023-12-08  3898  
990b6c928b212d9 Neil Armstrong        2023-12-08  3899  				port@1 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3900  					reg = <1>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3901  
990b6c928b212d9 Neil Armstrong        2023-12-08  3902  					usb_dp_qmpphy_usb_ss_in: endpoint {
65931e59e039912 Dmitry Baryshkov      2024-04-29  3903  						remote-endpoint = <&usb_1_dwc3_ss>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3904  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3905  				};
990b6c928b212d9 Neil Armstrong        2023-12-08  3906  
990b6c928b212d9 Neil Armstrong        2023-12-08  3907  				port@2 {
990b6c928b212d9 Neil Armstrong        2023-12-08  3908  					reg = <2>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3909  
990b6c928b212d9 Neil Armstrong        2023-12-08  3910  					usb_dp_qmpphy_dp_in: endpoint {
65931e59e039912 Dmitry Baryshkov      2024-04-29  3911  						remote-endpoint = <&mdss_dp0_out>;
990b6c928b212d9 Neil Armstrong        2023-12-08  3912  					};
990b6c928b212d9 Neil Armstrong        2023-12-08  3913  				};
990b6c928b212d9 Neil Armstrong        2023-12-08  3914  			};
10e024671295184 Neil Armstrong        2023-11-30  3915  		};
10e024671295184 Neil Armstrong        2023-11-30  3916  
10e024671295184 Neil Armstrong        2023-11-30  3917  		usb_1: usb@a6f8800 {
10e024671295184 Neil Armstrong        2023-11-30  3918  			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
10e024671295184 Neil Armstrong        2023-11-30  3919  			reg = <0 0x0a6f8800 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  3920  
9f42f7380f6757c Neil Armstrong        2024-03-14  3921  			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
9f42f7380f6757c Neil Armstrong        2024-03-14  3922  					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
9f42f7380f6757c Neil Armstrong        2024-03-14  3923  					      <&pdc 14 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  3924  					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
9f42f7380f6757c Neil Armstrong        2024-03-14  3925  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
9f42f7380f6757c Neil Armstrong        2024-03-14  3926  			interrupt-names = "pwr_event",
9f42f7380f6757c Neil Armstrong        2024-03-14  3927  					  "hs_phy_irq",
9f42f7380f6757c Neil Armstrong        2024-03-14  3928  					  "dp_hs_phy_irq",
10e024671295184 Neil Armstrong        2023-11-30  3929  					  "dm_hs_phy_irq",
9f42f7380f6757c Neil Armstrong        2024-03-14  3930  					  "ss_phy_irq";
10e024671295184 Neil Armstrong        2023-11-30  3931  
10e024671295184 Neil Armstrong        2023-11-30  3932  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3933  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3934  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3935  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3936  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3937  				 <&tcsr TCSR_USB3_CLKREF_EN>;
10e024671295184 Neil Armstrong        2023-11-30  3938  			clock-names = "cfg_noc",
10e024671295184 Neil Armstrong        2023-11-30  3939  				      "core",
10e024671295184 Neil Armstrong        2023-11-30  3940  				      "iface",
10e024671295184 Neil Armstrong        2023-11-30  3941  				      "sleep",
10e024671295184 Neil Armstrong        2023-11-30  3942  				      "mock_utmi",
10e024671295184 Neil Armstrong        2023-11-30  3943  				      "xo";
10e024671295184 Neil Armstrong        2023-11-30  3944  
10e024671295184 Neil Armstrong        2023-11-30  3945  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
10e024671295184 Neil Armstrong        2023-11-30  3946  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  3947  			assigned-clock-rates = <19200000>, <200000000>;
10e024671295184 Neil Armstrong        2023-11-30  3948  
10e024671295184 Neil Armstrong        2023-11-30  3949  			resets = <&gcc GCC_USB30_PRIM_BCR>;
10e024671295184 Neil Armstrong        2023-11-30  3950  
10e024671295184 Neil Armstrong        2023-11-30  3951  			power-domains = <&gcc USB30_PRIM_GDSC>;
10e024671295184 Neil Armstrong        2023-11-30  3952  			required-opps = <&rpmhpd_opp_nom>;
10e024671295184 Neil Armstrong        2023-11-30  3953  
10e024671295184 Neil Armstrong        2023-11-30  3954  			#address-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3955  			#size-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  3956  			ranges;
10e024671295184 Neil Armstrong        2023-11-30  3957  
10e024671295184 Neil Armstrong        2023-11-30  3958  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  3959  
10e024671295184 Neil Armstrong        2023-11-30  3960  			usb_1_dwc3: usb@a600000 {
10e024671295184 Neil Armstrong        2023-11-30  3961  				compatible = "snps,dwc3";
10e024671295184 Neil Armstrong        2023-11-30  3962  				reg = <0 0x0a600000 0 0xcd00>;
10e024671295184 Neil Armstrong        2023-11-30  3963  
10e024671295184 Neil Armstrong        2023-11-30  3964  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  3965  
10e024671295184 Neil Armstrong        2023-11-30  3966  				iommus = <&apps_smmu 0x40 0>;
10e024671295184 Neil Armstrong        2023-11-30  3967  
10e024671295184 Neil Armstrong        2023-11-30  3968  				phys = <&usb_1_hsphy>,
10e024671295184 Neil Armstrong        2023-11-30  3969  				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
10e024671295184 Neil Armstrong        2023-11-30  3970  				phy-names = "usb2-phy",
10e024671295184 Neil Armstrong        2023-11-30  3971  					    "usb3-phy";
10e024671295184 Neil Armstrong        2023-11-30  3972  
10e024671295184 Neil Armstrong        2023-11-30  3973  				snps,hird-threshold = /bits/ 8 <0x0>;
10e024671295184 Neil Armstrong        2023-11-30  3974  				snps,usb2-gadget-lpm-disable;
10e024671295184 Neil Armstrong        2023-11-30  3975  				snps,dis_u2_susphy_quirk;
d2350377997f360 Neil Armstrong        2023-11-30  3976  				snps,dis_enblslpm_quirk;
d2350377997f360 Neil Armstrong        2023-11-30  3977  				snps,dis-u1-entry-quirk;
d2350377997f360 Neil Armstrong        2023-11-30  3978  				snps,dis-u2-entry-quirk;
d2350377997f360 Neil Armstrong        2023-11-30  3979  				snps,is-utmi-l1-suspend;
d2350377997f360 Neil Armstrong        2023-11-30  3980  				snps,usb3_lpm_capable;
d2350377997f360 Neil Armstrong        2023-11-30  3981  				snps,usb2-lpm-disable;
d2350377997f360 Neil Armstrong        2023-11-30  3982  				snps,has-lpm-erratum;
d2350377997f360 Neil Armstrong        2023-11-30  3983  				tx-fifo-resize;
d2350377997f360 Neil Armstrong        2023-11-30  3984  
d2350377997f360 Neil Armstrong        2023-11-30  3985  				dma-coherent;
d2350377997f360 Neil Armstrong        2023-11-30  3986  
d2350377997f360 Neil Armstrong        2023-11-30  3987  				ports {
d2350377997f360 Neil Armstrong        2023-11-30  3988  					#address-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  3989  					#size-cells = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  3990  
d2350377997f360 Neil Armstrong        2023-11-30  3991  					port@0 {
d2350377997f360 Neil Armstrong        2023-11-30  3992  						reg = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  3993  
d2350377997f360 Neil Armstrong        2023-11-30  3994  						usb_1_dwc3_hs: endpoint {
d2350377997f360 Neil Armstrong        2023-11-30  3995  						};
d2350377997f360 Neil Armstrong        2023-11-30  3996  					};
d2350377997f360 Neil Armstrong        2023-11-30  3997  
d2350377997f360 Neil Armstrong        2023-11-30  3998  					port@1 {
d2350377997f360 Neil Armstrong        2023-11-30  3999  						reg = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4000  
d2350377997f360 Neil Armstrong        2023-11-30  4001  						usb_1_dwc3_ss: endpoint {
65931e59e039912 Dmitry Baryshkov      2024-04-29  4002  							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
d2350377997f360 Neil Armstrong        2023-11-30  4003  						};
d2350377997f360 Neil Armstrong        2023-11-30  4004  					};
d2350377997f360 Neil Armstrong        2023-11-30  4005  				};
d2350377997f360 Neil Armstrong        2023-11-30  4006  			};
d2350377997f360 Neil Armstrong        2023-11-30  4007  		};
d2350377997f360 Neil Armstrong        2023-11-30  4008  
d2350377997f360 Neil Armstrong        2023-11-30  4009  		pdc: interrupt-controller@b220000 {
d2350377997f360 Neil Armstrong        2023-11-30  4010  			compatible = "qcom,sm8650-pdc", "qcom,pdc";
d2350377997f360 Neil Armstrong        2023-11-30  4011  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
d2350377997f360 Neil Armstrong        2023-11-30  4012  
d2350377997f360 Neil Armstrong        2023-11-30  4013  			interrupt-parent = <&intc>;
d2350377997f360 Neil Armstrong        2023-11-30  4014  
10e024671295184 Neil Armstrong        2023-11-30  4015  			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
10e024671295184 Neil Armstrong        2023-11-30  4016  					  <125 63 1>, <126 716 12>,
10e024671295184 Neil Armstrong        2023-11-30  4017  					  <138 251 5>, <143 244 4>;
10e024671295184 Neil Armstrong        2023-11-30  4018  
10e024671295184 Neil Armstrong        2023-11-30  4019  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4020  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30  4021  		};
10e024671295184 Neil Armstrong        2023-11-30  4022  
10e024671295184 Neil Armstrong        2023-11-30  4023  		tsens0: thermal-sensor@c228000 {
10e024671295184 Neil Armstrong        2023-11-30  4024  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e024671295184 Neil Armstrong        2023-11-30  4025  			reg = <0 0x0c228000 0 0x1000>, /* TM */
10e024671295184 Neil Armstrong        2023-11-30  4026  			      <0 0x0c222000 0 0x1000>; /* SROT */
10e024671295184 Neil Armstrong        2023-11-30  4027  
10e024671295184 Neil Armstrong        2023-11-30  4028  			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  4029  				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  4030  			interrupt-names = "uplow",
10e024671295184 Neil Armstrong        2023-11-30  4031  					  "critical";
10e024671295184 Neil Armstrong        2023-11-30  4032  
10e024671295184 Neil Armstrong        2023-11-30  4033  			#qcom,sensors = <15>;
10e024671295184 Neil Armstrong        2023-11-30  4034  
10e024671295184 Neil Armstrong        2023-11-30  4035  			#thermal-sensor-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  4036  		};
10e024671295184 Neil Armstrong        2023-11-30  4037  
10e024671295184 Neil Armstrong        2023-11-30  4038  		tsens1: thermal-sensor@c229000 {
10e024671295184 Neil Armstrong        2023-11-30  4039  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e024671295184 Neil Armstrong        2023-11-30  4040  			reg = <0 0x0c229000 0 0x1000>, /* TM */
10e024671295184 Neil Armstrong        2023-11-30  4041  			      <0 0x0c223000 0 0x1000>; /* SROT */
10e024671295184 Neil Armstrong        2023-11-30  4042  
10e024671295184 Neil Armstrong        2023-11-30  4043  			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  4044  				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  4045  			interrupt-names = "uplow",
10e024671295184 Neil Armstrong        2023-11-30  4046  					  "critical";
10e024671295184 Neil Armstrong        2023-11-30  4047  
10e024671295184 Neil Armstrong        2023-11-30  4048  			#qcom,sensors = <16>;
10e024671295184 Neil Armstrong        2023-11-30  4049  
10e024671295184 Neil Armstrong        2023-11-30  4050  			#thermal-sensor-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  4051  		};
10e024671295184 Neil Armstrong        2023-11-30  4052  
10e024671295184 Neil Armstrong        2023-11-30  4053  		tsens2: thermal-sensor@c22a000 {
10e024671295184 Neil Armstrong        2023-11-30  4054  			compatible = "qcom,sm8650-tsens", "qcom,tsens-v2";
10e024671295184 Neil Armstrong        2023-11-30  4055  			reg = <0 0x0c22a000 0 0x1000>, /* TM */
10e024671295184 Neil Armstrong        2023-11-30  4056  			      <0 0x0c224000 0 0x1000>; /* SROT */
10e024671295184 Neil Armstrong        2023-11-30  4057  
10e024671295184 Neil Armstrong        2023-11-30  4058  			interrupts = <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
10e024671295184 Neil Armstrong        2023-11-30  4059  				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  4060  			interrupt-names = "uplow",
10e024671295184 Neil Armstrong        2023-11-30  4061  					  "critical";
10e024671295184 Neil Armstrong        2023-11-30  4062  
10e024671295184 Neil Armstrong        2023-11-30  4063  			#qcom,sensors = <13>;
10e024671295184 Neil Armstrong        2023-11-30  4064  
10e024671295184 Neil Armstrong        2023-11-30  4065  			#thermal-sensor-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  4066  		};
10e024671295184 Neil Armstrong        2023-11-30  4067  
10e024671295184 Neil Armstrong        2023-11-30  4068  		aoss_qmp: power-management@c300000 {
10e024671295184 Neil Armstrong        2023-11-30  4069  			compatible = "qcom,sm8650-aoss-qmp", "qcom,aoss-qmp";
10e024671295184 Neil Armstrong        2023-11-30  4070  			reg = <0 0x0c300000 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  4071  
10e024671295184 Neil Armstrong        2023-11-30  4072  			interrupt-parent = <&ipcc>;
10e024671295184 Neil Armstrong        2023-11-30  4073  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
10e024671295184 Neil Armstrong        2023-11-30  4074  						     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  4075  
10e024671295184 Neil Armstrong        2023-11-30  4076  			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e024671295184 Neil Armstrong        2023-11-30  4077  
10e024671295184 Neil Armstrong        2023-11-30  4078  			#clock-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  4079  		};
10e024671295184 Neil Armstrong        2023-11-30  4080  
10e024671295184 Neil Armstrong        2023-11-30  4081  		sram@c3f0000 {
10e024671295184 Neil Armstrong        2023-11-30  4082  			compatible = "qcom,rpmh-stats";
10e024671295184 Neil Armstrong        2023-11-30  4083  			reg = <0 0x0c3f0000 0 0x400>;
10e024671295184 Neil Armstrong        2023-11-30  4084  		};
10e024671295184 Neil Armstrong        2023-11-30  4085  
10e024671295184 Neil Armstrong        2023-11-30  4086  		spmi_bus: spmi@c400000 {
10e024671295184 Neil Armstrong        2023-11-30  4087  			compatible = "qcom,spmi-pmic-arb";
10e024671295184 Neil Armstrong        2023-11-30  4088  			reg = <0 0x0c400000 0 0x3000>,
a4f82b8045e3c79 Abel Vesa             2024-02-21  4089  			      <0 0x0c500000 0 0x400000>,
10e024671295184 Neil Armstrong        2023-11-30  4090  			      <0 0x0c440000 0 0x80000>,
10e024671295184 Neil Armstrong        2023-11-30  4091  			      <0 0x0c4c0000 0 0x20000>,
10e024671295184 Neil Armstrong        2023-11-30  4092  			      <0 0x0c42d000 0 0x4000>;
10e024671295184 Neil Armstrong        2023-11-30  4093  			reg-names = "core",
10e024671295184 Neil Armstrong        2023-11-30  4094  				    "chnls",
10e024671295184 Neil Armstrong        2023-11-30  4095  				    "obsrvr",
10e024671295184 Neil Armstrong        2023-11-30  4096  				    "intr",
10e024671295184 Neil Armstrong        2023-11-30  4097  				    "cnfg";
10e024671295184 Neil Armstrong        2023-11-30  4098  
10e024671295184 Neil Armstrong        2023-11-30  4099  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  4100  			interrupt-names = "periph_irq";
10e024671295184 Neil Armstrong        2023-11-30  4101  
10e024671295184 Neil Armstrong        2023-11-30  4102  			qcom,ee = <0>;
10e024671295184 Neil Armstrong        2023-11-30  4103  			qcom,channel = <0>;
10e024671295184 Neil Armstrong        2023-11-30  4104  			qcom,bus-id = <0>;
10e024671295184 Neil Armstrong        2023-11-30  4105  
10e024671295184 Neil Armstrong        2023-11-30  4106  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30  4107  			#interrupt-cells = <4>;
10e024671295184 Neil Armstrong        2023-11-30  4108  
10e024671295184 Neil Armstrong        2023-11-30  4109  			#address-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4110  			#size-cells = <0>;
10e024671295184 Neil Armstrong        2023-11-30  4111  		};
10e024671295184 Neil Armstrong        2023-11-30  4112  
10e024671295184 Neil Armstrong        2023-11-30  4113  		tlmm: pinctrl@f100000 {
10e024671295184 Neil Armstrong        2023-11-30  4114  			compatible = "qcom,sm8650-tlmm";
10e024671295184 Neil Armstrong        2023-11-30  4115  			reg = <0 0x0f100000 0 0x300000>;
10e024671295184 Neil Armstrong        2023-11-30  4116  
10e024671295184 Neil Armstrong        2023-11-30  4117  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  4118  
10e024671295184 Neil Armstrong        2023-11-30  4119  			gpio-controller;
10e024671295184 Neil Armstrong        2023-11-30  4120  			#gpio-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4121  
10e024671295184 Neil Armstrong        2023-11-30  4122  			interrupt-controller;
10e024671295184 Neil Armstrong        2023-11-30  4123  			#interrupt-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4124  
10e024671295184 Neil Armstrong        2023-11-30  4125  			gpio-ranges = <&tlmm 0 0 211>;
10e024671295184 Neil Armstrong        2023-11-30  4126  
10e024671295184 Neil Armstrong        2023-11-30  4127  			wakeup-parent = <&pdc>;
10e024671295184 Neil Armstrong        2023-11-30  4128  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4129  			cci0_0_default: cci0-0-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4130  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4131  					pins = "gpio113";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4132  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4133  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4134  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4135  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4136  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4137  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4138  					pins = "gpio114";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4139  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4140  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4141  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4142  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4143  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4144  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4145  			cci0_0_sleep: cci0-0-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4146  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4147  					pins = "gpio113";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4148  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4149  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4150  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4151  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4152  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4153  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4154  					pins = "gpio114";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4155  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4156  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4157  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4158  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4159  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4160  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4161  			cci0_1_default: cci0-1-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4162  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4163  					pins = "gpio115";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4164  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4165  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4166  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4167  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4168  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4169  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4170  					pins = "gpio116";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4171  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4172  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4173  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4174  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4175  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4176  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4177  			cci0_1_sleep: cci0-1-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4178  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4179  					pins = "gpio115";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4180  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4181  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4182  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4183  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4184  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4185  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4186  					pins = "gpio116";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4187  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4188  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4189  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4190  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4191  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4192  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4193  			cci1_0_default: cci1-0-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4194  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4195  					pins = "gpio117";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4196  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4197  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4198  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4199  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4200  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4201  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4202  					pins = "gpio118";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4203  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4204  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4205  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4206  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4207  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4208  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4209  			cci1_0_sleep: cci1-0-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4210  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4211  					pins = "gpio117";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4212  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4213  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4214  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4215  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4216  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4217  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4218  					pins = "gpio118";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4219  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4220  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4221  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4222  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4223  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4224  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4225  			cci1_1_default: cci1-1-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4226  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4227  					pins = "gpio12";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4228  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4229  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4230  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4231  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4232  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4233  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4234  					pins = "gpio13";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4235  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4236  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4237  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4238  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4239  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4240  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4241  			cci1_1_sleep: cci1-1-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4242  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4243  					pins = "gpio12";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4244  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4245  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4246  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4247  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4248  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4249  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4250  					pins = "gpio13";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4251  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4252  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4253  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4254  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4255  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4256  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4257  			cci2_0_default: cci2-0-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4258  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4259  					pins = "gpio112";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4260  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4261  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4262  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4263  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4264  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4265  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4266  					pins = "gpio153";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4267  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4268  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4269  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4270  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4271  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4272  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4273  			cci2_0_sleep: cci2-0-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4274  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4275  					pins = "gpio112";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4276  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4277  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4278  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4279  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4280  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4281  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4282  					pins = "gpio153";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4283  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4284  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4285  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4286  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4287  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4288  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4289  			cci2_1_default: cci2-1-default-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4290  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4291  					pins = "gpio119";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4292  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4293  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4294  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4295  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4296  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4297  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4298  					pins = "gpio120";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4299  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4300  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4301  					bias-pull-up = <2200>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4302  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4303  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4304  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4305  			cci2_1_sleep: cci2-1-sleep-state {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4306  				sda-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4307  					pins = "gpio119";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4308  					function = "cci_i2c_sda";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4309  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4310  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4311  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4312  
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4313  				scl-pins {
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4314  					pins = "gpio120";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4315  					function = "cci_i2c_scl";
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4316  					drive-strength = <2>;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4317  					bias-pull-down;
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4318  				};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4319  			};
9e2ebc5817c94ba Vladimir Zapolskiy    2024-06-13  4320  
10e024671295184 Neil Armstrong        2023-11-30  4321  			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4322  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4323  				pins = "gpio64", "gpio65";
10e024671295184 Neil Armstrong        2023-11-30  4324  				function = "i2chub0_se0";
10e024671295184 Neil Armstrong        2023-11-30  4325  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4326  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4327  			};
10e024671295184 Neil Armstrong        2023-11-30  4328  
10e024671295184 Neil Armstrong        2023-11-30  4329  			hub_i2c1_data_clk: hub-i2c1-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4330  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4331  				pins = "gpio66", "gpio67";
10e024671295184 Neil Armstrong        2023-11-30  4332  				function = "i2chub0_se1";
10e024671295184 Neil Armstrong        2023-11-30  4333  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4334  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4335  			};
10e024671295184 Neil Armstrong        2023-11-30  4336  
10e024671295184 Neil Armstrong        2023-11-30  4337  			hub_i2c2_data_clk: hub-i2c2-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4338  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4339  				pins = "gpio68", "gpio69";
10e024671295184 Neil Armstrong        2023-11-30  4340  				function = "i2chub0_se2";
10e024671295184 Neil Armstrong        2023-11-30  4341  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4342  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4343  			};
10e024671295184 Neil Armstrong        2023-11-30  4344  
10e024671295184 Neil Armstrong        2023-11-30  4345  			hub_i2c3_data_clk: hub-i2c3-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4346  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4347  				pins = "gpio70", "gpio71";
10e024671295184 Neil Armstrong        2023-11-30  4348  				function = "i2chub0_se3";
10e024671295184 Neil Armstrong        2023-11-30  4349  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4350  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4351  			};
10e024671295184 Neil Armstrong        2023-11-30  4352  
10e024671295184 Neil Armstrong        2023-11-30  4353  			hub_i2c4_data_clk: hub-i2c4-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4354  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4355  				pins = "gpio72", "gpio73";
10e024671295184 Neil Armstrong        2023-11-30  4356  				function = "i2chub0_se4";
10e024671295184 Neil Armstrong        2023-11-30  4357  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4358  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4359  			};
10e024671295184 Neil Armstrong        2023-11-30  4360  
10e024671295184 Neil Armstrong        2023-11-30  4361  			hub_i2c5_data_clk: hub-i2c5-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4362  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4363  				pins = "gpio74", "gpio75";
10e024671295184 Neil Armstrong        2023-11-30  4364  				function = "i2chub0_se5";
10e024671295184 Neil Armstrong        2023-11-30  4365  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4366  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4367  			};
10e024671295184 Neil Armstrong        2023-11-30  4368  
10e024671295184 Neil Armstrong        2023-11-30  4369  			hub_i2c6_data_clk: hub-i2c6-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4370  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4371  				pins = "gpio76", "gpio77";
10e024671295184 Neil Armstrong        2023-11-30  4372  				function = "i2chub0_se6";
10e024671295184 Neil Armstrong        2023-11-30  4373  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4374  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4375  			};
10e024671295184 Neil Armstrong        2023-11-30  4376  
10e024671295184 Neil Armstrong        2023-11-30  4377  			hub_i2c7_data_clk: hub-i2c7-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4378  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4379  				pins = "gpio78", "gpio79";
10e024671295184 Neil Armstrong        2023-11-30  4380  				function = "i2chub0_se7";
10e024671295184 Neil Armstrong        2023-11-30  4381  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4382  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4383  			};
10e024671295184 Neil Armstrong        2023-11-30  4384  
10e024671295184 Neil Armstrong        2023-11-30  4385  			hub_i2c8_data_clk: hub-i2c8-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4386  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4387  				pins = "gpio206", "gpio207";
10e024671295184 Neil Armstrong        2023-11-30  4388  				function = "i2chub0_se8";
10e024671295184 Neil Armstrong        2023-11-30  4389  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4390  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4391  			};
10e024671295184 Neil Armstrong        2023-11-30  4392  
10e024671295184 Neil Armstrong        2023-11-30  4393  			hub_i2c9_data_clk: hub-i2c9-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4394  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4395  				pins = "gpio80", "gpio81";
10e024671295184 Neil Armstrong        2023-11-30  4396  				function = "i2chub0_se9";
10e024671295184 Neil Armstrong        2023-11-30  4397  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4398  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4399  			};
10e024671295184 Neil Armstrong        2023-11-30  4400  
10e024671295184 Neil Armstrong        2023-11-30  4401  			pcie0_default_state: pcie0-default-state {
10e024671295184 Neil Armstrong        2023-11-30  4402  				perst-pins {
10e024671295184 Neil Armstrong        2023-11-30  4403  					pins = "gpio94";
10e024671295184 Neil Armstrong        2023-11-30  4404  					function = "gpio";
10e024671295184 Neil Armstrong        2023-11-30  4405  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4406  					bias-pull-down;
10e024671295184 Neil Armstrong        2023-11-30  4407  				};
10e024671295184 Neil Armstrong        2023-11-30  4408  
10e024671295184 Neil Armstrong        2023-11-30  4409  				clkreq-pins {
10e024671295184 Neil Armstrong        2023-11-30  4410  					pins = "gpio95";
10e024671295184 Neil Armstrong        2023-11-30  4411  					function = "pcie0_clk_req_n";
10e024671295184 Neil Armstrong        2023-11-30  4412  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4413  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4414  				};
10e024671295184 Neil Armstrong        2023-11-30  4415  
10e024671295184 Neil Armstrong        2023-11-30  4416  				wake-pins {
10e024671295184 Neil Armstrong        2023-11-30  4417  					pins = "gpio96";
10e024671295184 Neil Armstrong        2023-11-30  4418  					function = "gpio";
10e024671295184 Neil Armstrong        2023-11-30  4419  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4420  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4421  				};
10e024671295184 Neil Armstrong        2023-11-30  4422  			};
10e024671295184 Neil Armstrong        2023-11-30  4423  
10e024671295184 Neil Armstrong        2023-11-30  4424  			pcie1_default_state: pcie1-default-state {
10e024671295184 Neil Armstrong        2023-11-30  4425  				perst-pins {
10e024671295184 Neil Armstrong        2023-11-30  4426  					pins = "gpio97";
10e024671295184 Neil Armstrong        2023-11-30  4427  					function = "gpio";
10e024671295184 Neil Armstrong        2023-11-30  4428  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4429  					bias-pull-down;
10e024671295184 Neil Armstrong        2023-11-30  4430  				};
10e024671295184 Neil Armstrong        2023-11-30  4431  
10e024671295184 Neil Armstrong        2023-11-30  4432  				clkreq-pins {
10e024671295184 Neil Armstrong        2023-11-30  4433  					pins = "gpio98";
10e024671295184 Neil Armstrong        2023-11-30  4434  					function = "pcie1_clk_req_n";
10e024671295184 Neil Armstrong        2023-11-30  4435  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4436  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4437  				};
10e024671295184 Neil Armstrong        2023-11-30  4438  
10e024671295184 Neil Armstrong        2023-11-30  4439  				wake-pins {
10e024671295184 Neil Armstrong        2023-11-30  4440  					pins = "gpio99";
10e024671295184 Neil Armstrong        2023-11-30  4441  					function = "gpio";
10e024671295184 Neil Armstrong        2023-11-30  4442  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4443  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4444  				};
10e024671295184 Neil Armstrong        2023-11-30  4445  			};
10e024671295184 Neil Armstrong        2023-11-30  4446  
10e024671295184 Neil Armstrong        2023-11-30  4447  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4448  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4449  				pins = "gpio32", "gpio33";
10e024671295184 Neil Armstrong        2023-11-30  4450  				function = "qup1_se0";
10e024671295184 Neil Armstrong        2023-11-30  4451  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4452  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4453  			};
10e024671295184 Neil Armstrong        2023-11-30  4454  
10e024671295184 Neil Armstrong        2023-11-30  4455  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4456  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4457  				pins = "gpio36", "gpio37";
10e024671295184 Neil Armstrong        2023-11-30  4458  				function = "qup1_se1";
10e024671295184 Neil Armstrong        2023-11-30  4459  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4460  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4461  			};
10e024671295184 Neil Armstrong        2023-11-30  4462  
10e024671295184 Neil Armstrong        2023-11-30  4463  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4464  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4465  				pins = "gpio40", "gpio41";
10e024671295184 Neil Armstrong        2023-11-30  4466  				function = "qup1_se2";
10e024671295184 Neil Armstrong        2023-11-30  4467  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4468  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4469  			};
10e024671295184 Neil Armstrong        2023-11-30  4470  
10e024671295184 Neil Armstrong        2023-11-30  4471  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4472  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4473  				pins = "gpio44", "gpio45";
10e024671295184 Neil Armstrong        2023-11-30  4474  				function = "qup1_se3";
10e024671295184 Neil Armstrong        2023-11-30  4475  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4476  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4477  			};
10e024671295184 Neil Armstrong        2023-11-30  4478  
10e024671295184 Neil Armstrong        2023-11-30  4479  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4480  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4481  				pins = "gpio48", "gpio49";
10e024671295184 Neil Armstrong        2023-11-30  4482  				function = "qup1_se4";
10e024671295184 Neil Armstrong        2023-11-30  4483  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4484  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4485  			};
10e024671295184 Neil Armstrong        2023-11-30  4486  
10e024671295184 Neil Armstrong        2023-11-30  4487  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4488  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4489  				pins = "gpio52", "gpio53";
10e024671295184 Neil Armstrong        2023-11-30  4490  				function = "qup1_se5";
10e024671295184 Neil Armstrong        2023-11-30  4491  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4492  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4493  			};
10e024671295184 Neil Armstrong        2023-11-30  4494  
10e024671295184 Neil Armstrong        2023-11-30  4495  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4496  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4497  				pins = "gpio56", "gpio57";
10e024671295184 Neil Armstrong        2023-11-30  4498  				function = "qup1_se6";
10e024671295184 Neil Armstrong        2023-11-30  4499  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4500  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4501  			};
10e024671295184 Neil Armstrong        2023-11-30  4502  
10e024671295184 Neil Armstrong        2023-11-30  4503  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4504  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4505  				pins = "gpio60", "gpio61";
10e024671295184 Neil Armstrong        2023-11-30  4506  				function = "qup1_se7";
10e024671295184 Neil Armstrong        2023-11-30  4507  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4508  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4509  			};
10e024671295184 Neil Armstrong        2023-11-30  4510  
10e024671295184 Neil Armstrong        2023-11-30  4511  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4512  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4513  				pins = "gpio0", "gpio1";
10e024671295184 Neil Armstrong        2023-11-30  4514  				function = "qup2_se0";
10e024671295184 Neil Armstrong        2023-11-30  4515  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4516  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4517  			};
10e024671295184 Neil Armstrong        2023-11-30  4518  
10e024671295184 Neil Armstrong        2023-11-30  4519  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4520  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4521  				pins = "gpio4", "gpio5";
10e024671295184 Neil Armstrong        2023-11-30  4522  				function = "qup2_se1";
10e024671295184 Neil Armstrong        2023-11-30  4523  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4524  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4525  			};
10e024671295184 Neil Armstrong        2023-11-30  4526  
10e024671295184 Neil Armstrong        2023-11-30  4527  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4528  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4529  				pins = "gpio8", "gpio9";
10e024671295184 Neil Armstrong        2023-11-30  4530  				function = "qup2_se2";
10e024671295184 Neil Armstrong        2023-11-30  4531  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4532  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4533  			};
10e024671295184 Neil Armstrong        2023-11-30  4534  
10e024671295184 Neil Armstrong        2023-11-30  4535  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4536  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4537  				pins = "gpio12", "gpio13";
10e024671295184 Neil Armstrong        2023-11-30  4538  				function = "qup2_se3";
10e024671295184 Neil Armstrong        2023-11-30  4539  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4540  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4541  			};
10e024671295184 Neil Armstrong        2023-11-30  4542  
10e024671295184 Neil Armstrong        2023-11-30  4543  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4544  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4545  				pins = "gpio16", "gpio17";
10e024671295184 Neil Armstrong        2023-11-30  4546  				function = "qup2_se4";
10e024671295184 Neil Armstrong        2023-11-30  4547  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4548  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4549  			};
10e024671295184 Neil Armstrong        2023-11-30  4550  
10e024671295184 Neil Armstrong        2023-11-30  4551  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4552  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4553  				pins = "gpio20", "gpio21";
10e024671295184 Neil Armstrong        2023-11-30  4554  				function = "qup2_se5";
10e024671295184 Neil Armstrong        2023-11-30  4555  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4556  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4557  			};
10e024671295184 Neil Armstrong        2023-11-30  4558  
10e024671295184 Neil Armstrong        2023-11-30  4559  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4560  				/* SDA, SCL */
10e024671295184 Neil Armstrong        2023-11-30  4561  				pins = "gpio24", "gpio25";
10e024671295184 Neil Armstrong        2023-11-30  4562  				function = "qup2_se6";
10e024671295184 Neil Armstrong        2023-11-30  4563  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4564  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4565  			};
10e024671295184 Neil Armstrong        2023-11-30  4566  
10e024671295184 Neil Armstrong        2023-11-30  4567  			qup_spi0_cs: qup-spi0-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4568  				pins = "gpio35";
10e024671295184 Neil Armstrong        2023-11-30  4569  				function = "qup1_se0";
10e024671295184 Neil Armstrong        2023-11-30  4570  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4571  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4572  			};
10e024671295184 Neil Armstrong        2023-11-30  4573  
10e024671295184 Neil Armstrong        2023-11-30  4574  			qup_spi0_data_clk: qup-spi0-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4575  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4576  				pins = "gpio32", "gpio33", "gpio34";
10e024671295184 Neil Armstrong        2023-11-30  4577  				function = "qup1_se0";
10e024671295184 Neil Armstrong        2023-11-30  4578  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4579  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4580  			};
10e024671295184 Neil Armstrong        2023-11-30  4581  
10e024671295184 Neil Armstrong        2023-11-30  4582  			qup_spi1_cs: qup-spi1-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4583  				pins = "gpio39";
10e024671295184 Neil Armstrong        2023-11-30  4584  				function = "qup1_se1";
10e024671295184 Neil Armstrong        2023-11-30  4585  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4586  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4587  			};
d2350377997f360 Neil Armstrong        2023-11-30  4588  
10e024671295184 Neil Armstrong        2023-11-30  4589  			qup_spi1_data_clk: qup-spi1-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4590  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4591  				pins = "gpio36", "gpio37", "gpio38";
10e024671295184 Neil Armstrong        2023-11-30  4592  				function = "qup1_se1";
10e024671295184 Neil Armstrong        2023-11-30  4593  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4594  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4595  			};
d2350377997f360 Neil Armstrong        2023-11-30  4596  
10e024671295184 Neil Armstrong        2023-11-30  4597  			qup_spi2_cs: qup-spi2-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4598  				pins = "gpio43";
10e024671295184 Neil Armstrong        2023-11-30  4599  				function = "qup1_se2";
10e024671295184 Neil Armstrong        2023-11-30  4600  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4601  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4602  			};
d2350377997f360 Neil Armstrong        2023-11-30  4603  
10e024671295184 Neil Armstrong        2023-11-30  4604  			qup_spi2_data_clk: qup-spi2-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4605  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4606  				pins = "gpio40", "gpio41", "gpio42";
10e024671295184 Neil Armstrong        2023-11-30  4607  				function = "qup1_se2";
10e024671295184 Neil Armstrong        2023-11-30  4608  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4609  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4610  			};
d2350377997f360 Neil Armstrong        2023-11-30  4611  
10e024671295184 Neil Armstrong        2023-11-30  4612  			qup_spi3_cs: qup-spi3-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4613  				pins = "gpio47";
10e024671295184 Neil Armstrong        2023-11-30  4614  				function = "qup1_se3";
10e024671295184 Neil Armstrong        2023-11-30  4615  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4616  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4617  			};
d2350377997f360 Neil Armstrong        2023-11-30  4618  
10e024671295184 Neil Armstrong        2023-11-30  4619  			qup_spi3_data_clk: qup-spi3-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4620  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4621  				pins = "gpio44", "gpio45", "gpio46";
10e024671295184 Neil Armstrong        2023-11-30  4622  				function = "qup1_se3";
10e024671295184 Neil Armstrong        2023-11-30  4623  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4624  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4625  			};
d2350377997f360 Neil Armstrong        2023-11-30  4626  
10e024671295184 Neil Armstrong        2023-11-30  4627  			qup_spi4_cs: qup-spi4-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4628  				pins = "gpio51";
10e024671295184 Neil Armstrong        2023-11-30  4629  				function = "qup1_se4";
10e024671295184 Neil Armstrong        2023-11-30  4630  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4631  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4632  			};
d2350377997f360 Neil Armstrong        2023-11-30  4633  
10e024671295184 Neil Armstrong        2023-11-30  4634  			qup_spi4_data_clk: qup-spi4-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4635  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4636  				pins = "gpio48", "gpio49", "gpio50";
10e024671295184 Neil Armstrong        2023-11-30  4637  				function = "qup1_se4";
10e024671295184 Neil Armstrong        2023-11-30  4638  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4639  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4640  			};
d2350377997f360 Neil Armstrong        2023-11-30  4641  
10e024671295184 Neil Armstrong        2023-11-30  4642  			qup_spi5_cs: qup-spi5-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4643  				pins = "gpio55";
10e024671295184 Neil Armstrong        2023-11-30  4644  				function = "qup1_se5";
10e024671295184 Neil Armstrong        2023-11-30  4645  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4646  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4647  			};
d2350377997f360 Neil Armstrong        2023-11-30  4648  
10e024671295184 Neil Armstrong        2023-11-30  4649  			qup_spi5_data_clk: qup-spi5-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4650  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4651  				pins = "gpio52", "gpio53", "gpio54";
10e024671295184 Neil Armstrong        2023-11-30  4652  				function = "qup1_se5";
10e024671295184 Neil Armstrong        2023-11-30  4653  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4654  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4655  			};
d2350377997f360 Neil Armstrong        2023-11-30  4656  
10e024671295184 Neil Armstrong        2023-11-30  4657  			qup_spi6_cs: qup-spi6-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4658  				pins = "gpio59";
10e024671295184 Neil Armstrong        2023-11-30  4659  				function = "qup1_se6";
10e024671295184 Neil Armstrong        2023-11-30  4660  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4661  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4662  			};
d2350377997f360 Neil Armstrong        2023-11-30  4663  
10e024671295184 Neil Armstrong        2023-11-30  4664  			qup_spi6_data_clk: qup-spi6-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4665  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4666  				pins = "gpio56", "gpio57", "gpio58";
10e024671295184 Neil Armstrong        2023-11-30  4667  				function = "qup1_se6";
10e024671295184 Neil Armstrong        2023-11-30  4668  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4669  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4670  			};
d2350377997f360 Neil Armstrong        2023-11-30  4671  
10e024671295184 Neil Armstrong        2023-11-30  4672  			qup_spi7_cs: qup-spi7-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4673  				pins = "gpio63";
10e024671295184 Neil Armstrong        2023-11-30  4674  				function = "qup1_se7";
10e024671295184 Neil Armstrong        2023-11-30  4675  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4676  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4677  			};
d2350377997f360 Neil Armstrong        2023-11-30  4678  
10e024671295184 Neil Armstrong        2023-11-30  4679  			qup_spi7_data_clk: qup-spi7-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4680  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4681  				pins = "gpio60", "gpio61", "gpio62";
10e024671295184 Neil Armstrong        2023-11-30  4682  				function = "qup1_se7";
10e024671295184 Neil Armstrong        2023-11-30  4683  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4684  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4685  			};
d2350377997f360 Neil Armstrong        2023-11-30  4686  
10e024671295184 Neil Armstrong        2023-11-30  4687  			qup_spi8_cs: qup-spi8-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4688  				pins = "gpio3";
10e024671295184 Neil Armstrong        2023-11-30  4689  				function = "qup2_se0";
10e024671295184 Neil Armstrong        2023-11-30  4690  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4691  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4692  			};
d2350377997f360 Neil Armstrong        2023-11-30  4693  
10e024671295184 Neil Armstrong        2023-11-30  4694  			qup_spi8_data_clk: qup-spi8-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4695  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4696  				pins = "gpio0", "gpio1", "gpio2";
10e024671295184 Neil Armstrong        2023-11-30  4697  				function = "qup2_se0";
10e024671295184 Neil Armstrong        2023-11-30  4698  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4699  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4700  			};
d2350377997f360 Neil Armstrong        2023-11-30  4701  
10e024671295184 Neil Armstrong        2023-11-30  4702  			qup_spi9_cs: qup-spi9-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4703  				pins = "gpio7";
10e024671295184 Neil Armstrong        2023-11-30  4704  				function = "qup2_se1";
10e024671295184 Neil Armstrong        2023-11-30  4705  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4706  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4707  			};
d2350377997f360 Neil Armstrong        2023-11-30  4708  
10e024671295184 Neil Armstrong        2023-11-30  4709  			qup_spi9_data_clk: qup-spi9-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4710  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4711  				pins = "gpio4", "gpio5", "gpio6";
10e024671295184 Neil Armstrong        2023-11-30  4712  				function = "qup2_se1";
10e024671295184 Neil Armstrong        2023-11-30  4713  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4714  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4715  			};
d2350377997f360 Neil Armstrong        2023-11-30  4716  
10e024671295184 Neil Armstrong        2023-11-30  4717  			qup_spi10_cs: qup-spi10-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4718  				pins = "gpio11";
10e024671295184 Neil Armstrong        2023-11-30  4719  				function = "qup2_se2";
10e024671295184 Neil Armstrong        2023-11-30  4720  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4721  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4722  			};
d2350377997f360 Neil Armstrong        2023-11-30  4723  
10e024671295184 Neil Armstrong        2023-11-30  4724  			qup_spi10_data_clk: qup-spi10-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4725  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4726  				pins = "gpio8", "gpio9", "gpio10";
10e024671295184 Neil Armstrong        2023-11-30  4727  				function = "qup2_se2";
10e024671295184 Neil Armstrong        2023-11-30  4728  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4729  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4730  			};
d2350377997f360 Neil Armstrong        2023-11-30  4731  
10e024671295184 Neil Armstrong        2023-11-30  4732  			qup_spi11_cs: qup-spi11-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4733  				pins = "gpio15";
10e024671295184 Neil Armstrong        2023-11-30  4734  				function = "qup2_se3";
10e024671295184 Neil Armstrong        2023-11-30  4735  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4736  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4737  			};
d2350377997f360 Neil Armstrong        2023-11-30  4738  
10e024671295184 Neil Armstrong        2023-11-30  4739  			qup_spi11_data_clk: qup-spi11-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4740  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4741  				pins = "gpio12", "gpio13", "gpio14";
10e024671295184 Neil Armstrong        2023-11-30  4742  				function = "qup2_se3";
10e024671295184 Neil Armstrong        2023-11-30  4743  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4744  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4745  			};
d2350377997f360 Neil Armstrong        2023-11-30  4746  
10e024671295184 Neil Armstrong        2023-11-30  4747  			qup_spi12_cs: qup-spi12-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4748  				pins = "gpio19";
10e024671295184 Neil Armstrong        2023-11-30  4749  				function = "qup2_se4";
10e024671295184 Neil Armstrong        2023-11-30  4750  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4751  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4752  			};
d2350377997f360 Neil Armstrong        2023-11-30  4753  
10e024671295184 Neil Armstrong        2023-11-30  4754  			qup_spi12_data_clk: qup-spi12-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4755  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4756  				pins = "gpio16", "gpio17", "gpio18";
10e024671295184 Neil Armstrong        2023-11-30  4757  				function = "qup2_se4";
10e024671295184 Neil Armstrong        2023-11-30  4758  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4759  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4760  			};
d2350377997f360 Neil Armstrong        2023-11-30  4761  
10e024671295184 Neil Armstrong        2023-11-30  4762  			qup_spi13_cs: qup-spi13-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4763  				pins = "gpio23";
10e024671295184 Neil Armstrong        2023-11-30  4764  				function = "qup2_se5";
10e024671295184 Neil Armstrong        2023-11-30  4765  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4766  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4767  			};
d2350377997f360 Neil Armstrong        2023-11-30  4768  
10e024671295184 Neil Armstrong        2023-11-30  4769  			qup_spi13_data_clk: qup-spi13-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4770  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4771  				pins = "gpio20", "gpio21", "gpio22";
10e024671295184 Neil Armstrong        2023-11-30  4772  				function = "qup2_se5";
10e024671295184 Neil Armstrong        2023-11-30  4773  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4774  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4775  			};
d2350377997f360 Neil Armstrong        2023-11-30  4776  
10e024671295184 Neil Armstrong        2023-11-30  4777  			qup_spi14_cs: qup-spi14-cs-state {
10e024671295184 Neil Armstrong        2023-11-30  4778  				pins = "gpio27";
10e024671295184 Neil Armstrong        2023-11-30  4779  				function = "qup2_se6";
10e024671295184 Neil Armstrong        2023-11-30  4780  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4781  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4782  			};
d2350377997f360 Neil Armstrong        2023-11-30  4783  
10e024671295184 Neil Armstrong        2023-11-30  4784  			qup_spi14_data_clk: qup-spi14-data-clk-state {
10e024671295184 Neil Armstrong        2023-11-30  4785  				/* MISO, MOSI, CLK */
10e024671295184 Neil Armstrong        2023-11-30  4786  				pins = "gpio24", "gpio25", "gpio26";
10e024671295184 Neil Armstrong        2023-11-30  4787  				function = "qup2_se6";
10e024671295184 Neil Armstrong        2023-11-30  4788  				drive-strength = <6>;
10e024671295184 Neil Armstrong        2023-11-30  4789  				bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4790  			};
d2350377997f360 Neil Armstrong        2023-11-30  4791  
10e024671295184 Neil Armstrong        2023-11-30  4792  			qup_uart14_default: qup-uart14-default-state {
10e024671295184 Neil Armstrong        2023-11-30  4793  				/* TX, RX */
10e024671295184 Neil Armstrong        2023-11-30  4794  				pins = "gpio26", "gpio27";
10e024671295184 Neil Armstrong        2023-11-30  4795  				function = "qup2_se6";
10e024671295184 Neil Armstrong        2023-11-30  4796  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4797  				bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4798  			};
d2350377997f360 Neil Armstrong        2023-11-30  4799  
10e024671295184 Neil Armstrong        2023-11-30  4800  			qup_uart14_cts_rts: qup-uart14-cts-rts-state {
10e024671295184 Neil Armstrong        2023-11-30  4801  				/* CTS, RTS */
10e024671295184 Neil Armstrong        2023-11-30  4802  				pins = "gpio24", "gpio25";
10e024671295184 Neil Armstrong        2023-11-30  4803  				function = "qup2_se6";
10e024671295184 Neil Armstrong        2023-11-30  4804  				drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4805  				bias-pull-down;
10e024671295184 Neil Armstrong        2023-11-30  4806  			};
d2350377997f360 Neil Armstrong        2023-11-30  4807  
d2350377997f360 Neil Armstrong        2023-11-30  4808  			qup_uart15_default: qup-uart15-default-state {
d2350377997f360 Neil Armstrong        2023-11-30  4809  				/* TX, RX */
d2350377997f360 Neil Armstrong        2023-11-30  4810  				pins = "gpio30", "gpio31";
d2350377997f360 Neil Armstrong        2023-11-30  4811  				function = "qup2_se7";
d2350377997f360 Neil Armstrong        2023-11-30  4812  				drive-strength = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  4813  				bias-disable;
d2350377997f360 Neil Armstrong        2023-11-30  4814  			};
10e024671295184 Neil Armstrong        2023-11-30  4815  
10e024671295184 Neil Armstrong        2023-11-30  4816  			sdc2_sleep: sdc2-sleep-state {
10e024671295184 Neil Armstrong        2023-11-30  4817  				clk-pins {
10e024671295184 Neil Armstrong        2023-11-30  4818  					pins = "sdc2_clk";
10e024671295184 Neil Armstrong        2023-11-30  4819  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4820  					bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4821  				};
10e024671295184 Neil Armstrong        2023-11-30  4822  
10e024671295184 Neil Armstrong        2023-11-30  4823  				cmd-pins {
10e024671295184 Neil Armstrong        2023-11-30  4824  					pins = "sdc2_cmd";
10e024671295184 Neil Armstrong        2023-11-30  4825  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4826  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4827  				};
10e024671295184 Neil Armstrong        2023-11-30  4828  
10e024671295184 Neil Armstrong        2023-11-30  4829  				data-pins {
10e024671295184 Neil Armstrong        2023-11-30  4830  					pins = "sdc2_data";
10e024671295184 Neil Armstrong        2023-11-30  4831  					drive-strength = <2>;
10e024671295184 Neil Armstrong        2023-11-30  4832  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4833  				};
10e024671295184 Neil Armstrong        2023-11-30  4834  			};
10e024671295184 Neil Armstrong        2023-11-30  4835  
10e024671295184 Neil Armstrong        2023-11-30  4836  			sdc2_default: sdc2-default-state {
10e024671295184 Neil Armstrong        2023-11-30  4837  				clk-pins {
10e024671295184 Neil Armstrong        2023-11-30  4838  					pins = "sdc2_clk";
10e024671295184 Neil Armstrong        2023-11-30  4839  					drive-strength = <16>;
10e024671295184 Neil Armstrong        2023-11-30  4840  					bias-disable;
10e024671295184 Neil Armstrong        2023-11-30  4841  				};
10e024671295184 Neil Armstrong        2023-11-30  4842  
10e024671295184 Neil Armstrong        2023-11-30  4843  				cmd-pins {
10e024671295184 Neil Armstrong        2023-11-30  4844  					pins = "sdc2_cmd";
10e024671295184 Neil Armstrong        2023-11-30  4845  					drive-strength = <10>;
10e024671295184 Neil Armstrong        2023-11-30  4846  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4847  				};
10e024671295184 Neil Armstrong        2023-11-30  4848  
10e024671295184 Neil Armstrong        2023-11-30  4849  				data-pins {
10e024671295184 Neil Armstrong        2023-11-30  4850  					pins = "sdc2_data";
10e024671295184 Neil Armstrong        2023-11-30  4851  					drive-strength = <10>;
10e024671295184 Neil Armstrong        2023-11-30  4852  					bias-pull-up;
10e024671295184 Neil Armstrong        2023-11-30  4853  				};
10e024671295184 Neil Armstrong        2023-11-30  4854  			};
d2350377997f360 Neil Armstrong        2023-11-30  4855  		};
d2350377997f360 Neil Armstrong        2023-11-30  4856  
d2350377997f360 Neil Armstrong        2023-11-30  4857  		apps_smmu: iommu@15000000 {
d2350377997f360 Neil Armstrong        2023-11-30  4858  			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
d2350377997f360 Neil Armstrong        2023-11-30  4859  			reg = <0 0x15000000 0 0x100000>;
d2350377997f360 Neil Armstrong        2023-11-30  4860  
d2350377997f360 Neil Armstrong        2023-11-30  4861  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4862  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4863  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4864  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4865  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4866  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4867  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4868  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4869  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4870  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4871  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4872  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4873  				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4874  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4875  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4876  				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4877  				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4878  				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4879  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4880  				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4881  				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4882  				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4883  				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4884  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4885  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4886  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4887  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4888  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4889  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4890  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4891  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4892  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4893  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4894  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4895  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4896  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4897  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4898  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4899  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4900  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4901  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4902  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4903  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4904  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4905  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4906  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4907  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4908  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4909  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4910  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4911  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4912  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4913  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4914  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4915  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4916  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4917  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4918  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4919  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4920  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4921  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4922  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4923  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4924  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4925  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4926  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4927  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4928  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4929  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4930  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4931  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4932  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4933  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4934  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4935  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4936  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4937  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4938  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4939  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4940  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4941  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4942  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4943  				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4944  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4945  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4946  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4947  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4948  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4949  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4950  				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4951  				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4952  				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4953  				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4954  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4955  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4956  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  4957  				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  4958  
d2350377997f360 Neil Armstrong        2023-11-30  4959  			#iommu-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  4960  			#global-interrupts = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4961  
d2350377997f360 Neil Armstrong        2023-11-30  4962  			dma-coherent;
d2350377997f360 Neil Armstrong        2023-11-30  4963  		};
d2350377997f360 Neil Armstrong        2023-11-30  4964  
d2350377997f360 Neil Armstrong        2023-11-30  4965  		intc: interrupt-controller@17100000 {
d2350377997f360 Neil Armstrong        2023-11-30  4966  			compatible = "arm,gic-v3";
d2350377997f360 Neil Armstrong        2023-11-30  4967  			reg = <0 0x17100000 0 0x10000>,		/* GICD */
d2350377997f360 Neil Armstrong        2023-11-30  4968  			      <0 0x17180000 0 0x200000>;	/* GICR * 8 */
d2350377997f360 Neil Armstrong        2023-11-30  4969  
d2350377997f360 Neil Armstrong        2023-11-30  4970  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
d2350377997f360 Neil Armstrong        2023-11-30  4971  
d2350377997f360 Neil Armstrong        2023-11-30  4972  			#interrupt-cells = <3>;
d2350377997f360 Neil Armstrong        2023-11-30  4973  			interrupt-controller;
d2350377997f360 Neil Armstrong        2023-11-30  4974  
d2350377997f360 Neil Armstrong        2023-11-30  4975  			#redistributor-regions = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4976  			redistributor-stride = <0 0x40000>;
d2350377997f360 Neil Armstrong        2023-11-30  4977  
d2350377997f360 Neil Armstrong        2023-11-30  4978  			#address-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  4979  			#size-cells = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  4980  			ranges;
d2350377997f360 Neil Armstrong        2023-11-30  4981  
d2350377997f360 Neil Armstrong        2023-11-30  4982  			gic_its: msi-controller@17140000 {
d2350377997f360 Neil Armstrong        2023-11-30  4983  				compatible = "arm,gic-v3-its";
d2350377997f360 Neil Armstrong        2023-11-30  4984  				reg = <0 0x17140000 0 0x20000>;
d2350377997f360 Neil Armstrong        2023-11-30  4985  
d2350377997f360 Neil Armstrong        2023-11-30  4986  				msi-controller;
d2350377997f360 Neil Armstrong        2023-11-30  4987  				#msi-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4988  			};
d2350377997f360 Neil Armstrong        2023-11-30  4989  		};
d2350377997f360 Neil Armstrong        2023-11-30  4990  
d2350377997f360 Neil Armstrong        2023-11-30  4991  		timer@17420000 {
d2350377997f360 Neil Armstrong        2023-11-30  4992  			compatible = "arm,armv7-timer-mem";
d2350377997f360 Neil Armstrong        2023-11-30  4993  			reg = <0 0x17420000 0 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  4994  
d2350377997f360 Neil Armstrong        2023-11-30  4995  			ranges = <0 0 0 0x20000000>;
d2350377997f360 Neil Armstrong        2023-11-30  4996  			#address-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4997  			#size-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  4998  
d2350377997f360 Neil Armstrong        2023-11-30  4999  			frame@17421000 {
d2350377997f360 Neil Armstrong        2023-11-30  5000  				reg = <0x17421000 0x1000>,
d2350377997f360 Neil Armstrong        2023-11-30  5001  				      <0x17422000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5002  
d2350377997f360 Neil Armstrong        2023-11-30  5003  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5004  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5005  
d2350377997f360 Neil Armstrong        2023-11-30  5006  				frame-number = <0>;
d2350377997f360 Neil Armstrong        2023-11-30  5007  			};
d2350377997f360 Neil Armstrong        2023-11-30  5008  
d2350377997f360 Neil Armstrong        2023-11-30  5009  			frame@17423000 {
d2350377997f360 Neil Armstrong        2023-11-30  5010  				reg = <0x17423000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5011  
d2350377997f360 Neil Armstrong        2023-11-30  5012  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5013  
d2350377997f360 Neil Armstrong        2023-11-30  5014  				frame-number = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  5015  
d2350377997f360 Neil Armstrong        2023-11-30  5016  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5017  			};
d2350377997f360 Neil Armstrong        2023-11-30  5018  
d2350377997f360 Neil Armstrong        2023-11-30  5019  			frame@17425000 {
d2350377997f360 Neil Armstrong        2023-11-30  5020  				reg = <0x17425000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5021  
d2350377997f360 Neil Armstrong        2023-11-30  5022  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5023  
d2350377997f360 Neil Armstrong        2023-11-30  5024  				frame-number = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  5025  
d2350377997f360 Neil Armstrong        2023-11-30  5026  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5027  			};
d2350377997f360 Neil Armstrong        2023-11-30  5028  
d2350377997f360 Neil Armstrong        2023-11-30  5029  			frame@17427000 {
d2350377997f360 Neil Armstrong        2023-11-30  5030  				reg = <0x17427000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5031  
d2350377997f360 Neil Armstrong        2023-11-30  5032  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5033  
d2350377997f360 Neil Armstrong        2023-11-30  5034  				frame-number = <3>;
d2350377997f360 Neil Armstrong        2023-11-30  5035  
d2350377997f360 Neil Armstrong        2023-11-30  5036  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5037  			};
d2350377997f360 Neil Armstrong        2023-11-30  5038  
d2350377997f360 Neil Armstrong        2023-11-30  5039  			frame@17429000 {
d2350377997f360 Neil Armstrong        2023-11-30  5040  				reg = <0x17429000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5041  
d2350377997f360 Neil Armstrong        2023-11-30  5042  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5043  
d2350377997f360 Neil Armstrong        2023-11-30  5044  				frame-number = <4>;
d2350377997f360 Neil Armstrong        2023-11-30  5045  
d2350377997f360 Neil Armstrong        2023-11-30  5046  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5047  			};
d2350377997f360 Neil Armstrong        2023-11-30  5048  
d2350377997f360 Neil Armstrong        2023-11-30  5049  			frame@1742b000 {
d2350377997f360 Neil Armstrong        2023-11-30  5050  				reg = <0x1742b000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5051  
d2350377997f360 Neil Armstrong        2023-11-30  5052  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5053  
d2350377997f360 Neil Armstrong        2023-11-30  5054  				frame-number = <5>;
d2350377997f360 Neil Armstrong        2023-11-30  5055  
d2350377997f360 Neil Armstrong        2023-11-30  5056  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5057  			};
d2350377997f360 Neil Armstrong        2023-11-30  5058  
d2350377997f360 Neil Armstrong        2023-11-30  5059  			frame@1742d000 {
d2350377997f360 Neil Armstrong        2023-11-30  5060  				reg = <0x1742d000 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5061  
d2350377997f360 Neil Armstrong        2023-11-30  5062  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5063  
d2350377997f360 Neil Armstrong        2023-11-30  5064  				frame-number = <6>;
d2350377997f360 Neil Armstrong        2023-11-30  5065  
d2350377997f360 Neil Armstrong        2023-11-30  5066  				status = "disabled";
d2350377997f360 Neil Armstrong        2023-11-30  5067  			};
d2350377997f360 Neil Armstrong        2023-11-30  5068  		};
d2350377997f360 Neil Armstrong        2023-11-30  5069  
d2350377997f360 Neil Armstrong        2023-11-30  5070  		apps_rsc: rsc@17a00000 {
d2350377997f360 Neil Armstrong        2023-11-30  5071  			compatible = "qcom,rpmh-rsc";
d2350377997f360 Neil Armstrong        2023-11-30  5072  			reg = <0 0x17a00000 0 0x10000>,
d2350377997f360 Neil Armstrong        2023-11-30  5073  			      <0 0x17a10000 0 0x10000>,
d2350377997f360 Neil Armstrong        2023-11-30  5074  			      <0 0x17a20000 0 0x10000>,
d2350377997f360 Neil Armstrong        2023-11-30  5075  			      <0 0x17a30000 0 0x10000>;
d2350377997f360 Neil Armstrong        2023-11-30  5076  			reg-names = "drv-0",
d2350377997f360 Neil Armstrong        2023-11-30  5077  				    "drv-1",
d2350377997f360 Neil Armstrong        2023-11-30  5078  				    "drv-2";
d2350377997f360 Neil Armstrong        2023-11-30  5079  
d2350377997f360 Neil Armstrong        2023-11-30  5080  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5081  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5082  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5083  
20eb2057b3e46fe Krzysztof Kozlowski   2024-10-22  5084  			power-domains = <&cluster_pd>;
d2350377997f360 Neil Armstrong        2023-11-30  5085  
d2350377997f360 Neil Armstrong        2023-11-30  5086  			qcom,tcs-offset = <0xd00>;
d2350377997f360 Neil Armstrong        2023-11-30  5087  			qcom,drv-id = <2>;
d2350377997f360 Neil Armstrong        2023-11-30  5088  			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
d2350377997f360 Neil Armstrong        2023-11-30  5089  					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
d2350377997f360 Neil Armstrong        2023-11-30  5090  
d2350377997f360 Neil Armstrong        2023-11-30  5091  			label = "apps_rsc";
d2350377997f360 Neil Armstrong        2023-11-30  5092  
d2350377997f360 Neil Armstrong        2023-11-30  5093  			apps_bcm_voter: bcm-voter {
d2350377997f360 Neil Armstrong        2023-11-30  5094  				compatible = "qcom,bcm-voter";
d2350377997f360 Neil Armstrong        2023-11-30  5095  			};
d2350377997f360 Neil Armstrong        2023-11-30  5096  
d2350377997f360 Neil Armstrong        2023-11-30  5097  			rpmhcc: clock-controller {
d2350377997f360 Neil Armstrong        2023-11-30  5098  				compatible = "qcom,sm8650-rpmh-clk";
d2350377997f360 Neil Armstrong        2023-11-30  5099  
d2350377997f360 Neil Armstrong        2023-11-30  5100  				clocks = <&xo_board>;
d2350377997f360 Neil Armstrong        2023-11-30  5101  				clock-names = "xo";
d2350377997f360 Neil Armstrong        2023-11-30  5102  
d2350377997f360 Neil Armstrong        2023-11-30  5103  				#clock-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  5104  			};
d2350377997f360 Neil Armstrong        2023-11-30  5105  
d2350377997f360 Neil Armstrong        2023-11-30  5106  			rpmhpd: power-controller {
d2350377997f360 Neil Armstrong        2023-11-30  5107  				compatible = "qcom,sm8650-rpmhpd";
d2350377997f360 Neil Armstrong        2023-11-30  5108  
d2350377997f360 Neil Armstrong        2023-11-30  5109  				operating-points-v2 = <&rpmhpd_opp_table>;
d2350377997f360 Neil Armstrong        2023-11-30  5110  
d2350377997f360 Neil Armstrong        2023-11-30  5111  				#power-domain-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  5112  
d2350377997f360 Neil Armstrong        2023-11-30  5113  				rpmhpd_opp_table: opp-table {
d2350377997f360 Neil Armstrong        2023-11-30  5114  					compatible = "operating-points-v2";
d2350377997f360 Neil Armstrong        2023-11-30  5115  
d2350377997f360 Neil Armstrong        2023-11-30  5116  					rpmhpd_opp_ret: opp-16 {
d2350377997f360 Neil Armstrong        2023-11-30  5117  						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
d2350377997f360 Neil Armstrong        2023-11-30  5118  					};
d2350377997f360 Neil Armstrong        2023-11-30  5119  
d2350377997f360 Neil Armstrong        2023-11-30  5120  					rpmhpd_opp_min_svs: opp-48 {
d2350377997f360 Neil Armstrong        2023-11-30  5121  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
d2350377997f360 Neil Armstrong        2023-11-30  5122  					};
d2350377997f360 Neil Armstrong        2023-11-30  5123  
d2350377997f360 Neil Armstrong        2023-11-30  5124  					rpmhpd_opp_low_svs_d2: opp-52 {
d2350377997f360 Neil Armstrong        2023-11-30  5125  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
d2350377997f360 Neil Armstrong        2023-11-30  5126  					};
d2350377997f360 Neil Armstrong        2023-11-30  5127  
d2350377997f360 Neil Armstrong        2023-11-30  5128  					rpmhpd_opp_low_svs_d1: opp-56 {
d2350377997f360 Neil Armstrong        2023-11-30  5129  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
d2350377997f360 Neil Armstrong        2023-11-30  5130  					};
d2350377997f360 Neil Armstrong        2023-11-30  5131  
d2350377997f360 Neil Armstrong        2023-11-30  5132  					rpmhpd_opp_low_svs_d0: opp-60 {
d2350377997f360 Neil Armstrong        2023-11-30  5133  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
d2350377997f360 Neil Armstrong        2023-11-30  5134  					};
d2350377997f360 Neil Armstrong        2023-11-30  5135  
d2350377997f360 Neil Armstrong        2023-11-30  5136  					rpmhpd_opp_low_svs: opp-64 {
d2350377997f360 Neil Armstrong        2023-11-30  5137  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
d2350377997f360 Neil Armstrong        2023-11-30  5138  					};
d2350377997f360 Neil Armstrong        2023-11-30  5139  
d2350377997f360 Neil Armstrong        2023-11-30  5140  					rpmhpd_opp_low_svs_l1: opp-80 {
d2350377997f360 Neil Armstrong        2023-11-30  5141  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
d2350377997f360 Neil Armstrong        2023-11-30  5142  					};
d2350377997f360 Neil Armstrong        2023-11-30  5143  
d2350377997f360 Neil Armstrong        2023-11-30  5144  					rpmhpd_opp_svs: opp-128 {
d2350377997f360 Neil Armstrong        2023-11-30  5145  						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
d2350377997f360 Neil Armstrong        2023-11-30  5146  					};
d2350377997f360 Neil Armstrong        2023-11-30  5147  
d2350377997f360 Neil Armstrong        2023-11-30  5148  					rpmhpd_opp_svs_l0: opp-144 {
d2350377997f360 Neil Armstrong        2023-11-30  5149  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
d2350377997f360 Neil Armstrong        2023-11-30  5150  					};
d2350377997f360 Neil Armstrong        2023-11-30  5151  
d2350377997f360 Neil Armstrong        2023-11-30  5152  					rpmhpd_opp_svs_l1: opp-192 {
d2350377997f360 Neil Armstrong        2023-11-30  5153  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
d2350377997f360 Neil Armstrong        2023-11-30  5154  					};
d2350377997f360 Neil Armstrong        2023-11-30  5155  
d2350377997f360 Neil Armstrong        2023-11-30  5156  					rpmhpd_opp_nom: opp-256 {
d2350377997f360 Neil Armstrong        2023-11-30  5157  						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
d2350377997f360 Neil Armstrong        2023-11-30  5158  					};
d2350377997f360 Neil Armstrong        2023-11-30  5159  
d2350377997f360 Neil Armstrong        2023-11-30  5160  					rpmhpd_opp_nom_l1: opp-320 {
d2350377997f360 Neil Armstrong        2023-11-30  5161  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
d2350377997f360 Neil Armstrong        2023-11-30  5162  					};
d2350377997f360 Neil Armstrong        2023-11-30  5163  
d2350377997f360 Neil Armstrong        2023-11-30  5164  					rpmhpd_opp_nom_l2: opp-336 {
d2350377997f360 Neil Armstrong        2023-11-30  5165  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
d2350377997f360 Neil Armstrong        2023-11-30  5166  					};
d2350377997f360 Neil Armstrong        2023-11-30  5167  
d2350377997f360 Neil Armstrong        2023-11-30  5168  					rpmhpd_opp_turbo: opp-384 {
d2350377997f360 Neil Armstrong        2023-11-30  5169  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
d2350377997f360 Neil Armstrong        2023-11-30  5170  					};
d2350377997f360 Neil Armstrong        2023-11-30  5171  
d2350377997f360 Neil Armstrong        2023-11-30  5172  					rpmhpd_opp_turbo_l1: opp-416 {
d2350377997f360 Neil Armstrong        2023-11-30  5173  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
d2350377997f360 Neil Armstrong        2023-11-30  5174  					};
d2350377997f360 Neil Armstrong        2023-11-30  5175  				};
d2350377997f360 Neil Armstrong        2023-11-30  5176  			};
d2350377997f360 Neil Armstrong        2023-11-30  5177  		};
d2350377997f360 Neil Armstrong        2023-11-30  5178  
d2350377997f360 Neil Armstrong        2023-11-30  5179  		cpufreq_hw: cpufreq@17d91000 {
d2350377997f360 Neil Armstrong        2023-11-30  5180  			compatible = "qcom,sm8650-cpufreq-epss", "qcom,cpufreq-epss";
d2350377997f360 Neil Armstrong        2023-11-30  5181  			reg = <0 0x17d91000 0 0x1000>,
d2350377997f360 Neil Armstrong        2023-11-30  5182  			      <0 0x17d92000 0 0x1000>,
d2350377997f360 Neil Armstrong        2023-11-30  5183  			      <0 0x17d93000 0 0x1000>,
d2350377997f360 Neil Armstrong        2023-11-30  5184  			      <0 0x17d94000 0 0x1000>;
d2350377997f360 Neil Armstrong        2023-11-30  5185  			reg-names = "freq-domain0",
d2350377997f360 Neil Armstrong        2023-11-30  5186  				    "freq-domain1",
d2350377997f360 Neil Armstrong        2023-11-30  5187  				    "freq-domain2",
d2350377997f360 Neil Armstrong        2023-11-30  5188  				    "freq-domain3";
d2350377997f360 Neil Armstrong        2023-11-30  5189  
d2350377997f360 Neil Armstrong        2023-11-30  5190  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5191  				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5192  				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
d2350377997f360 Neil Armstrong        2023-11-30  5193  				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5194  			interrupt-names = "dcvsh-irq-0",
d2350377997f360 Neil Armstrong        2023-11-30  5195  					  "dcvsh-irq-1",
d2350377997f360 Neil Armstrong        2023-11-30  5196  					  "dcvsh-irq-2",
d2350377997f360 Neil Armstrong        2023-11-30  5197  					  "dcvsh-irq-3";
d2350377997f360 Neil Armstrong        2023-11-30  5198  
d2350377997f360 Neil Armstrong        2023-11-30  5199  			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
d2350377997f360 Neil Armstrong        2023-11-30  5200  			clock-names = "xo", "alternate";
d2350377997f360 Neil Armstrong        2023-11-30  5201  
d2350377997f360 Neil Armstrong        2023-11-30  5202  			#freq-domain-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  5203  			#clock-cells = <1>;
d2350377997f360 Neil Armstrong        2023-11-30  5204  		};
d2350377997f360 Neil Armstrong        2023-11-30  5205  
10e024671295184 Neil Armstrong        2023-11-30  5206  		pmu@24091000 {
10e024671295184 Neil Armstrong        2023-11-30  5207  			compatible = "qcom,sm8650-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
10e024671295184 Neil Armstrong        2023-11-30  5208  			reg = <0 0x24091000 0 0x1000>;
10e024671295184 Neil Armstrong        2023-11-30  5209  
10e024671295184 Neil Armstrong        2023-11-30  5210  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  5211  
10e024671295184 Neil Armstrong        2023-11-30  5212  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
10e024671295184 Neil Armstrong        2023-11-30  5213  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
10e024671295184 Neil Armstrong        2023-11-30  5214  
10e024671295184 Neil Armstrong        2023-11-30  5215  			operating-points-v2 = <&llcc_bwmon_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  5216  
10e024671295184 Neil Armstrong        2023-11-30  5217  			llcc_bwmon_opp_table: opp-table {
10e024671295184 Neil Armstrong        2023-11-30  5218  				compatible = "operating-points-v2";
10e024671295184 Neil Armstrong        2023-11-30  5219  
10e024671295184 Neil Armstrong        2023-11-30  5220  				opp-0 {
10e024671295184 Neil Armstrong        2023-11-30  5221  					opp-peak-kBps = <2086000>;
10e024671295184 Neil Armstrong        2023-11-30  5222  				};
10e024671295184 Neil Armstrong        2023-11-30  5223  
10e024671295184 Neil Armstrong        2023-11-30  5224  				opp-1 {
10e024671295184 Neil Armstrong        2023-11-30  5225  					opp-peak-kBps = <2929000>;
10e024671295184 Neil Armstrong        2023-11-30  5226  				};
10e024671295184 Neil Armstrong        2023-11-30  5227  
10e024671295184 Neil Armstrong        2023-11-30  5228  				opp-2 {
10e024671295184 Neil Armstrong        2023-11-30  5229  					opp-peak-kBps = <5931000>;
10e024671295184 Neil Armstrong        2023-11-30  5230  				};
10e024671295184 Neil Armstrong        2023-11-30  5231  
10e024671295184 Neil Armstrong        2023-11-30  5232  				opp-3 {
10e024671295184 Neil Armstrong        2023-11-30  5233  					opp-peak-kBps = <6515000>;
10e024671295184 Neil Armstrong        2023-11-30  5234  				};
10e024671295184 Neil Armstrong        2023-11-30  5235  
10e024671295184 Neil Armstrong        2023-11-30  5236  				opp-4 {
10e024671295184 Neil Armstrong        2023-11-30  5237  					opp-peak-kBps = <7980000>;
10e024671295184 Neil Armstrong        2023-11-30  5238  				};
10e024671295184 Neil Armstrong        2023-11-30  5239  
10e024671295184 Neil Armstrong        2023-11-30  5240  				opp-5 {
10e024671295184 Neil Armstrong        2023-11-30  5241  					opp-peak-kBps = <10437000>;
10e024671295184 Neil Armstrong        2023-11-30  5242  				};
10e024671295184 Neil Armstrong        2023-11-30  5243  
10e024671295184 Neil Armstrong        2023-11-30  5244  				opp-6 {
10e024671295184 Neil Armstrong        2023-11-30  5245  					opp-peak-kBps = <12157000>;
10e024671295184 Neil Armstrong        2023-11-30  5246  				};
10e024671295184 Neil Armstrong        2023-11-30  5247  
10e024671295184 Neil Armstrong        2023-11-30  5248  				opp-7 {
10e024671295184 Neil Armstrong        2023-11-30  5249  					opp-peak-kBps = <14060000>;
10e024671295184 Neil Armstrong        2023-11-30  5250  				};
10e024671295184 Neil Armstrong        2023-11-30  5251  
10e024671295184 Neil Armstrong        2023-11-30  5252  				opp-8 {
10e024671295184 Neil Armstrong        2023-11-30  5253  					opp-peak-kBps = <16113000>;
10e024671295184 Neil Armstrong        2023-11-30  5254  				};
10e024671295184 Neil Armstrong        2023-11-30  5255  			};
10e024671295184 Neil Armstrong        2023-11-30  5256  		};
10e024671295184 Neil Armstrong        2023-11-30  5257  
10e024671295184 Neil Armstrong        2023-11-30  5258  		pmu@240b7400 {
10e024671295184 Neil Armstrong        2023-11-30  5259  			compatible = "qcom,sm8650-cpu-bwmon", "qcom,sdm845-bwmon";
10e024671295184 Neil Armstrong        2023-11-30  5260  			reg = <0 0x240b7400 0 0x600>;
10e024671295184 Neil Armstrong        2023-11-30  5261  
10e024671295184 Neil Armstrong        2023-11-30  5262  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
10e024671295184 Neil Armstrong        2023-11-30  5263  
10e024671295184 Neil Armstrong        2023-11-30  5264  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
10e024671295184 Neil Armstrong        2023-11-30  5265  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
10e024671295184 Neil Armstrong        2023-11-30  5266  
10e024671295184 Neil Armstrong        2023-11-30  5267  			operating-points-v2 = <&cpu_bwmon_opp_table>;
10e024671295184 Neil Armstrong        2023-11-30  5268  
10e024671295184 Neil Armstrong        2023-11-30  5269  			cpu_bwmon_opp_table: opp-table {
10e024671295184 Neil Armstrong        2023-11-30  5270  				compatible = "operating-points-v2";
10e024671295184 Neil Armstrong        2023-11-30  5271  
10e024671295184 Neil Armstrong        2023-11-30  5272  				opp-0 {
10e024671295184 Neil Armstrong        2023-11-30  5273  					opp-peak-kBps = <4577000>;
10e024671295184 Neil Armstrong        2023-11-30  5274  				};
10e024671295184 Neil Armstrong        2023-11-30  5275  
10e024671295184 Neil Armstrong        2023-11-30  5276  				opp-1 {
10e024671295184 Neil Armstrong        2023-11-30  5277  					opp-peak-kBps = <7110000>;
10e024671295184 Neil Armstrong        2023-11-30  5278  				};
10e024671295184 Neil Armstrong        2023-11-30  5279  
10e024671295184 Neil Armstrong        2023-11-30  5280  				opp-2 {
10e024671295184 Neil Armstrong        2023-11-30  5281  					opp-peak-kBps = <9155000>;
10e024671295184 Neil Armstrong        2023-11-30  5282  				};
10e024671295184 Neil Armstrong        2023-11-30  5283  
10e024671295184 Neil Armstrong        2023-11-30  5284  				opp-3 {
10e024671295184 Neil Armstrong        2023-11-30  5285  					opp-peak-kBps = <12298000>;
10e024671295184 Neil Armstrong        2023-11-30  5286  				};
10e024671295184 Neil Armstrong        2023-11-30  5287  
10e024671295184 Neil Armstrong        2023-11-30  5288  				opp-4 {
10e024671295184 Neil Armstrong        2023-11-30  5289  					opp-peak-kBps = <14236000>;
10e024671295184 Neil Armstrong        2023-11-30  5290  				};
10e024671295184 Neil Armstrong        2023-11-30  5291  
10e024671295184 Neil Armstrong        2023-11-30  5292  				opp-5 {
10e024671295184 Neil Armstrong        2023-11-30  5293  					opp-peak-kBps = <16265000>;
10e024671295184 Neil Armstrong        2023-11-30  5294  				};
10e024671295184 Neil Armstrong        2023-11-30  5295  			};
10e024671295184 Neil Armstrong        2023-11-30  5296  		};
10e024671295184 Neil Armstrong        2023-11-30  5297  
10e024671295184 Neil Armstrong        2023-11-30  5298  		gem_noc: interconnect@24100000 {
10e024671295184 Neil Armstrong        2023-11-30  5299  			compatible = "qcom,sm8650-gem-noc";
10e024671295184 Neil Armstrong        2023-11-30  5300  			reg = <0 0x24100000 0 0xc5080>;
10e024671295184 Neil Armstrong        2023-11-30  5301  
10e024671295184 Neil Armstrong        2023-11-30  5302  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  5303  
10e024671295184 Neil Armstrong        2023-11-30  5304  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  5305  		};
10e024671295184 Neil Armstrong        2023-11-30  5306  
d2350377997f360 Neil Armstrong        2023-11-30  5307  		system-cache-controller@25000000 {
d2350377997f360 Neil Armstrong        2023-11-30  5308  			compatible = "qcom,sm8650-llcc";
d2350377997f360 Neil Armstrong        2023-11-30  5309  			reg = <0 0x25000000 0 0x200000>,
d2350377997f360 Neil Armstrong        2023-11-30  5310  			      <0 0x25400000 0 0x200000>,
d2350377997f360 Neil Armstrong        2023-11-30  5311  			      <0 0x25200000 0 0x200000>,
d2350377997f360 Neil Armstrong        2023-11-30  5312  			      <0 0x25600000 0 0x200000>,
a7823576f7f7b1c Unnathi Chalicheemala 2024-05-31  5313  			      <0 0x25800000 0 0x200000>,
a7823576f7f7b1c Unnathi Chalicheemala 2024-05-31  5314  			      <0 0x25a00000 0 0x200000>;
d2350377997f360 Neil Armstrong        2023-11-30  5315  			reg-names = "llcc0_base",
d2350377997f360 Neil Armstrong        2023-11-30  5316  				    "llcc1_base",
d2350377997f360 Neil Armstrong        2023-11-30  5317  				    "llcc2_base",
d2350377997f360 Neil Armstrong        2023-11-30  5318  				    "llcc3_base",
a7823576f7f7b1c Unnathi Chalicheemala 2024-05-31  5319  				    "llcc_broadcast_base",
a7823576f7f7b1c Unnathi Chalicheemala 2024-05-31  5320  				    "llcc_broadcast_and_base";
d2350377997f360 Neil Armstrong        2023-11-30  5321  
d2350377997f360 Neil Armstrong        2023-11-30  5322  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
d2350377997f360 Neil Armstrong        2023-11-30  5323  		};
10e024671295184 Neil Armstrong        2023-11-30  5324  
10e024671295184 Neil Armstrong        2023-11-30  5325  		remoteproc_adsp: remoteproc@30000000 {
10e024671295184 Neil Armstrong        2023-11-30  5326  			compatible = "qcom,sm8650-adsp-pas";
10e024671295184 Neil Armstrong        2023-11-30  5327  			reg = <0 0x30000000 0 0x100>;
10e024671295184 Neil Armstrong        2023-11-30  5328  
10e024671295184 Neil Armstrong        2023-11-30  5329  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5330  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5331  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5332  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5333  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  5334  			interrupt-names = "wdog",
10e024671295184 Neil Armstrong        2023-11-30  5335  					  "fatal",
10e024671295184 Neil Armstrong        2023-11-30  5336  					  "ready",
10e024671295184 Neil Armstrong        2023-11-30  5337  					  "handover",
10e024671295184 Neil Armstrong        2023-11-30  5338  					  "stop-ack";
10e024671295184 Neil Armstrong        2023-11-30  5339  
10e024671295184 Neil Armstrong        2023-11-30  5340  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  5341  			clock-names = "xo";
10e024671295184 Neil Armstrong        2023-11-30  5342  
10e024671295184 Neil Armstrong        2023-11-30  5343  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  5344  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  5345  
10e024671295184 Neil Armstrong        2023-11-30  5346  			power-domains = <&rpmhpd RPMHPD_LCX>,
10e024671295184 Neil Armstrong        2023-11-30  5347  					<&rpmhpd RPMHPD_LMX>;
10e024671295184 Neil Armstrong        2023-11-30  5348  			power-domain-names = "lcx",
10e024671295184 Neil Armstrong        2023-11-30  5349  					     "lmx";
10e024671295184 Neil Armstrong        2023-11-30  5350  
10e024671295184 Neil Armstrong        2023-11-30  5351  			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
10e024671295184 Neil Armstrong        2023-11-30  5352  
10e024671295184 Neil Armstrong        2023-11-30  5353  			qcom,qmp = <&aoss_qmp>;
10e024671295184 Neil Armstrong        2023-11-30  5354  
10e024671295184 Neil Armstrong        2023-11-30  5355  			qcom,smem-states = <&smp2p_adsp_out 0>;
10e024671295184 Neil Armstrong        2023-11-30  5356  			qcom,smem-state-names = "stop";
10e024671295184 Neil Armstrong        2023-11-30  5357  
10e024671295184 Neil Armstrong        2023-11-30  5358  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  5359  
10e024671295184 Neil Armstrong        2023-11-30  5360  			remoteproc_adsp_glink: glink-edge {
10e024671295184 Neil Armstrong        2023-11-30  5361  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
10e024671295184 Neil Armstrong        2023-11-30  5362  							     IPCC_MPROC_SIGNAL_GLINK_QMP
10e024671295184 Neil Armstrong        2023-11-30  5363  							     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  5364  
10e024671295184 Neil Armstrong        2023-11-30  5365  				mboxes = <&ipcc IPCC_CLIENT_LPASS
10e024671295184 Neil Armstrong        2023-11-30  5366  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e024671295184 Neil Armstrong        2023-11-30  5367  
10e024671295184 Neil Armstrong        2023-11-30  5368  				qcom,remote-pid = <2>;
10e024671295184 Neil Armstrong        2023-11-30  5369  
10e024671295184 Neil Armstrong        2023-11-30  5370  				label = "lpass";
10e024671295184 Neil Armstrong        2023-11-30  5371  
10e024671295184 Neil Armstrong        2023-11-30  5372  				fastrpc {
10e024671295184 Neil Armstrong        2023-11-30  5373  					compatible = "qcom,fastrpc";
10e024671295184 Neil Armstrong        2023-11-30  5374  
10e024671295184 Neil Armstrong        2023-11-30  5375  					qcom,glink-channels = "fastrpcglink-apps-dsp";
10e024671295184 Neil Armstrong        2023-11-30  5376  
10e024671295184 Neil Armstrong        2023-11-30  5377  					label = "adsp";
10e024671295184 Neil Armstrong        2023-11-30  5378  
039d379490eabf7 Neil Armstrong        2024-02-27  5379  					qcom,non-secure-domain;
039d379490eabf7 Neil Armstrong        2024-02-27  5380  
10e024671295184 Neil Armstrong        2023-11-30  5381  					#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  5382  					#size-cells = <0>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5383  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5384  					compute-cb@3 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5385  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5386  						reg = <3>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5387  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5388  						iommus = <&apps_smmu 0x1003 0x80>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5389  							 <&apps_smmu 0x1043 0x20>;
feed0507688b7e7 Ling Xu               2024-01-25  5390  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5391  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5392  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5393  					compute-cb@4 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5394  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5395  						reg = <4>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5396  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5397  						iommus = <&apps_smmu 0x1004 0x80>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5398  							 <&apps_smmu 0x1044 0x20>;
feed0507688b7e7 Ling Xu               2024-01-25  5399  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5400  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5401  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5402  					compute-cb@5 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5403  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5404  						reg = <5>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5405  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5406  						iommus = <&apps_smmu 0x1005 0x80>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5407  							 <&apps_smmu 0x1045 0x20>;
feed0507688b7e7 Ling Xu               2024-01-25  5408  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5409  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5410  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5411  					compute-cb@6 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5412  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5413  						reg = <6>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5414  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5415  						iommus = <&apps_smmu 0x1006 0x80>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5416  							 <&apps_smmu 0x1046 0x20>;
feed0507688b7e7 Ling Xu               2024-01-25  5417  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5418  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5419  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5420  					compute-cb@7 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5421  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5422  						reg = <7>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5423  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5424  						iommus = <&apps_smmu 0x1007 0x40>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5425  							 <&apps_smmu 0x1067 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5426  							 <&apps_smmu 0x1087 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5427  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5428  					};
10e024671295184 Neil Armstrong        2023-11-30  5429  				};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5430  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5431  				gpr {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5432  					compatible = "qcom,gpr";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5433  					qcom,glink-channels = "adsp_apps";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5434  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5435  					qcom,intents = <512 20>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5436  					#address-cells = <1>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5437  					#size-cells = <0>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5438  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5439  					q6apm: service@1 {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5440  						compatible = "qcom,q6apm";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5441  						reg = <GPR_APM_MODULE_IID>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5442  						#sound-dai-cells = <0>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5443  						qcom,protection-domain = "avs/audio",
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5444  									 "msm/adsp/audio_pd";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5445  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5446  						q6apmbedai: bedais {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5447  							compatible = "qcom,q6apm-lpass-dais";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5448  							#sound-dai-cells = <1>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5449  						};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5450  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5451  						q6apmdai: dais {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5452  							compatible = "qcom,q6apm-dais";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5453  							iommus = <&apps_smmu 0x1001 0x80>,
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5454  								 <&apps_smmu 0x1061 0x0>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5455  						};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5456  					};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5457  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5458  					q6prm: service@2 {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5459  						compatible = "qcom,q6prm";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5460  						reg = <GPR_PRM_MODULE_IID>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5461  						qcom,protection-domain = "avs/audio",
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5462  									 "msm/adsp/audio_pd";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5463  
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5464  						q6prmcc: clock-controller {
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5465  							compatible = "qcom,q6prm-lpass-clocks";
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5466  							#clock-cells = <2>;
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5467  						};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5468  					};
ff28260e3d9820a Krzysztof Kozlowski   2023-12-04  5469  				};
10e024671295184 Neil Armstrong        2023-11-30  5470  			};
10e024671295184 Neil Armstrong        2023-11-30  5471  		};
10e024671295184 Neil Armstrong        2023-11-30  5472  
10e024671295184 Neil Armstrong        2023-11-30  5473  		nsp_noc: interconnect@320c0000 {
10e024671295184 Neil Armstrong        2023-11-30  5474  			compatible = "qcom,sm8650-nsp-noc";
10e024671295184 Neil Armstrong        2023-11-30  5475  			reg = <0 0x320c0000 0 0xf080>;
10e024671295184 Neil Armstrong        2023-11-30  5476  
10e024671295184 Neil Armstrong        2023-11-30  5477  			qcom,bcm-voters = <&apps_bcm_voter>;
10e024671295184 Neil Armstrong        2023-11-30  5478  
10e024671295184 Neil Armstrong        2023-11-30  5479  			#interconnect-cells = <2>;
10e024671295184 Neil Armstrong        2023-11-30  5480  		};
10e024671295184 Neil Armstrong        2023-11-30  5481  
10e024671295184 Neil Armstrong        2023-11-30  5482  		remoteproc_cdsp: remoteproc@32300000 {
10e024671295184 Neil Armstrong        2023-11-30  5483  			compatible = "qcom,sm8650-cdsp-pas";
10e024671295184 Neil Armstrong        2023-11-30  5484  			reg = <0 0x32300000 0 0x1400000>;
10e024671295184 Neil Armstrong        2023-11-30  5485  
10e024671295184 Neil Armstrong        2023-11-30  5486  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5487  					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5488  					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5489  					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
10e024671295184 Neil Armstrong        2023-11-30  5490  					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  5491  			interrupt-names = "wdog",
10e024671295184 Neil Armstrong        2023-11-30  5492  					  "fatal",
10e024671295184 Neil Armstrong        2023-11-30  5493  					  "ready",
10e024671295184 Neil Armstrong        2023-11-30  5494  					  "handover",
10e024671295184 Neil Armstrong        2023-11-30  5495  					  "stop-ack";
10e024671295184 Neil Armstrong        2023-11-30  5496  
10e024671295184 Neil Armstrong        2023-11-30  5497  			clocks = <&rpmhcc RPMH_CXO_CLK>;
10e024671295184 Neil Armstrong        2023-11-30  5498  			clock-names = "xo";
10e024671295184 Neil Armstrong        2023-11-30  5499  
10e024671295184 Neil Armstrong        2023-11-30  5500  			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
10e024671295184 Neil Armstrong        2023-11-30  5501  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
10e024671295184 Neil Armstrong        2023-11-30  5502  
10e024671295184 Neil Armstrong        2023-11-30  5503  			power-domains = <&rpmhpd RPMHPD_CX>,
10e024671295184 Neil Armstrong        2023-11-30  5504  					<&rpmhpd RPMHPD_MXC>,
10e024671295184 Neil Armstrong        2023-11-30  5505  					<&rpmhpd RPMHPD_NSP>;
10e024671295184 Neil Armstrong        2023-11-30  5506  			power-domain-names = "cx",
10e024671295184 Neil Armstrong        2023-11-30  5507  					     "mxc",
10e024671295184 Neil Armstrong        2023-11-30  5508  					     "nsp";
10e024671295184 Neil Armstrong        2023-11-30  5509  
10e024671295184 Neil Armstrong        2023-11-30  5510  			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
10e024671295184 Neil Armstrong        2023-11-30  5511  
10e024671295184 Neil Armstrong        2023-11-30  5512  			qcom,qmp = <&aoss_qmp>;
10e024671295184 Neil Armstrong        2023-11-30  5513  
10e024671295184 Neil Armstrong        2023-11-30  5514  			qcom,smem-states = <&smp2p_cdsp_out 0>;
10e024671295184 Neil Armstrong        2023-11-30  5515  			qcom,smem-state-names = "stop";
10e024671295184 Neil Armstrong        2023-11-30  5516  
10e024671295184 Neil Armstrong        2023-11-30  5517  			status = "disabled";
10e024671295184 Neil Armstrong        2023-11-30  5518  
10e024671295184 Neil Armstrong        2023-11-30  5519  			glink-edge {
10e024671295184 Neil Armstrong        2023-11-30  5520  				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
10e024671295184 Neil Armstrong        2023-11-30  5521  							     IPCC_MPROC_SIGNAL_GLINK_QMP
10e024671295184 Neil Armstrong        2023-11-30  5522  							     IRQ_TYPE_EDGE_RISING>;
10e024671295184 Neil Armstrong        2023-11-30  5523  
10e024671295184 Neil Armstrong        2023-11-30  5524  				mboxes = <&ipcc IPCC_CLIENT_CDSP
10e024671295184 Neil Armstrong        2023-11-30  5525  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
10e024671295184 Neil Armstrong        2023-11-30  5526  
10e024671295184 Neil Armstrong        2023-11-30  5527  				qcom,remote-pid = <5>;
10e024671295184 Neil Armstrong        2023-11-30  5528  
10e024671295184 Neil Armstrong        2023-11-30  5529  				label = "cdsp";
10e024671295184 Neil Armstrong        2023-11-30  5530  
10e024671295184 Neil Armstrong        2023-11-30  5531  				fastrpc {
10e024671295184 Neil Armstrong        2023-11-30  5532  					compatible = "qcom,fastrpc";
10e024671295184 Neil Armstrong        2023-11-30  5533  
10e024671295184 Neil Armstrong        2023-11-30  5534  					qcom,glink-channels = "fastrpcglink-apps-dsp";
10e024671295184 Neil Armstrong        2023-11-30  5535  
10e024671295184 Neil Armstrong        2023-11-30  5536  					label = "cdsp";
10e024671295184 Neil Armstrong        2023-11-30  5537  
039d379490eabf7 Neil Armstrong        2024-02-27  5538  					qcom,non-secure-domain;
039d379490eabf7 Neil Armstrong        2024-02-27  5539  
10e024671295184 Neil Armstrong        2023-11-30  5540  					#address-cells = <1>;
10e024671295184 Neil Armstrong        2023-11-30  5541  					#size-cells = <0>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5542  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5543  					compute-cb@1 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5544  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5545  						reg = <1>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5546  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5547  						iommus = <&apps_smmu 0x1961 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5548  							 <&apps_smmu 0x0c01 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5549  							 <&apps_smmu 0x19c1 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5550  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5551  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5552  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5553  					compute-cb@2 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5554  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5555  						reg = <2>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5556  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5557  						iommus = <&apps_smmu 0x1962 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5558  							 <&apps_smmu 0x0c02 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5559  							 <&apps_smmu 0x19c2 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5560  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5561  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5562  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5563  					compute-cb@3 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5564  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5565  						reg = <3>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5566  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5567  						iommus = <&apps_smmu 0x1963 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5568  							 <&apps_smmu 0x0c03 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5569  							 <&apps_smmu 0x19c3 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5570  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5571  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5572  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5573  					compute-cb@4 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5574  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5575  						reg = <4>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5576  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5577  						iommus = <&apps_smmu 0x1964 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5578  							 <&apps_smmu 0x0c04 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5579  							 <&apps_smmu 0x19c4 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5580  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5581  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5582  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5583  					compute-cb@5 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5584  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5585  						reg = <5>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5586  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5587  						iommus = <&apps_smmu 0x1965 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5588  							 <&apps_smmu 0x0c05 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5589  							 <&apps_smmu 0x19c5 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5590  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5591  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5592  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5593  					compute-cb@6 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5594  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5595  						reg = <6>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5596  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5597  						iommus = <&apps_smmu 0x1966 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5598  							 <&apps_smmu 0x0c06 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5599  							 <&apps_smmu 0x19c6 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5600  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5601  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5602  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5603  					compute-cb@7 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5604  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5605  						reg = <7>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5606  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5607  						iommus = <&apps_smmu 0x1967 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5608  							 <&apps_smmu 0x0c07 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5609  							 <&apps_smmu 0x19c7 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5610  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5611  					};
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5612  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5613  					compute-cb@8 {
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5614  						compatible = "qcom,fastrpc-compute-cb";
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5615  						reg = <8>;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5616  
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5617  						iommus = <&apps_smmu 0x1968 0x0>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5618  							 <&apps_smmu 0x0c08 0x20>,
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5619  							 <&apps_smmu 0x19c8 0x0>;
feed0507688b7e7 Ling Xu               2024-01-25  5620  						dma-coherent;
b0fd89bc1aeca3b Neil Armstrong        2023-12-15  5621  					};
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5622  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5623  					/* note: secure cb9 in downstream */
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5624  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5625  					compute-cb@10 {
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5626  						compatible = "qcom,fastrpc-compute-cb";
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5627  						reg = <12>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5628  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5629  						iommus = <&apps_smmu 0x196c 0x0>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5630  							 <&apps_smmu 0x0c0c 0x20>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5631  							 <&apps_smmu 0x19cc 0x0>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5632  						dma-coherent;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5633  					};
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5634  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5635  					compute-cb@11 {
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5636  						compatible = "qcom,fastrpc-compute-cb";
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5637  						reg = <13>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5638  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5639  						iommus = <&apps_smmu 0x196d 0x0>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5640  							 <&apps_smmu 0x0c0d 0x20>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5641  							 <&apps_smmu 0x19cd 0x0>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5642  						dma-coherent;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5643  					};
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5644  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5645  					compute-cb@12 {
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5646  						compatible = "qcom,fastrpc-compute-cb";
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5647  						reg = <14>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5648  
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5649  						iommus = <&apps_smmu 0x196e 0x0>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5650  							 <&apps_smmu 0x0c0e 0x20>,
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5651  							 <&apps_smmu 0x19ce 0x0>;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5652  						dma-coherent;
dae8cdb0a9e18f0 Ling Xu               2024-03-19  5653  					};
10e024671295184 Neil Armstrong        2023-11-30  5654  				};
10e024671295184 Neil Armstrong        2023-11-30  5655  			};
10e024671295184 Neil Armstrong        2023-11-30  5656  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5657  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5658  		ete0 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5659  			compatible = "arm,embedded-trace-extension";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5660  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5661  			cpu = <&cpu0>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5662  			qcom,skip-power-up;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5663  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5664  			out-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5665  				port {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5666  					ete0_out_funnel_ete: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5667  						remote-endpoint = <&funnel_ete_in_ete0>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5668  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5669  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5670  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5671  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5672  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5673  		funnel_ete {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5674  			compatible = "arm,coresight-static-funnel";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5675  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5676  			in-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5677  				port@0 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5678  					reg = <0>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5679  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5680  					funnel_ete_in_ete0: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5681  						remote-endpoint = <&ete0_out_funnel_ete>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5682  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5683  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5684  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5685  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5686  			out-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5687  				port {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5688  					funnel_ete_out_funnel_apss: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5689  						remote-endpoint = <&funnel_apss_in_funnel_ete>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5690  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5691  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5692  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5693  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5694  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5695  		funnel@13810000 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5696  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5697  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5698  			reg = <0x0 0x13810000 0x0 0x1000>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5699  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5700  			clocks = <&aoss_qmp>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5701  			clock-names = "apb_pclk";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5702  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5703  			in-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5704  				port@0 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5705  					reg = <0>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5706  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5707  					funnel_apss_in_funnel_ete: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5708  						remote-endpoint = <&funnel_ete_out_funnel_apss>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5709  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5710  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5711  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5712  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5713  			out-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5714  				port {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5715  					funnel_apss_out_funnel_in1: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5716  						remote-endpoint = <&funnel_in1_in_funnel_apss>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5717  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5718  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5719  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5720  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5721  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5722  		funnel@10042000 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5723  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5724  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5725  			reg = <0x0 0x10042000 0x0 0x1000>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5726  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5727  			clocks = <&aoss_qmp>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5728  			clock-names = "apb_pclk";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5729  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5730  			in-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5731  				port@4 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5732  					reg = <4>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5733  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5734  					funnel_in1_in_funnel_apss: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5735  						remote-endpoint = <&funnel_apss_out_funnel_in1>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5736  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5737  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5738  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5739  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5740  			out-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5741  				port {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5742  					funnel_in1_out_funnel_qdss: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5743  						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5744  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5745  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5746  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5747  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5748  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5749  		funnel@10045000 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5750  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5751  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5752  			reg = <0x0 0x10045000 0x0 0x1000>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5753  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5754  			clocks = <&aoss_qmp>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5755  			clock-names = "apb_pclk";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5756  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5757  			in-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5758  				#address-cells = <1>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5759  				#size-cells = <0>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5760  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5761  				port@1 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5762  					reg = <1>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5763  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5764  					funnel_qdss_in_funnel_in1: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5765  						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5766  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5767  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5768  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5769  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5770  			out-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5771  				port {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5772  					funnel_qdss_out_funnel_aoss: endpoint {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5773  						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5774  					};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5775  				};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5776  			};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5777  		};
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5778  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5779  		funnel@10b04000 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5780  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5781  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5782  			reg = <0x0 0x10b04000 0x0 0x1000>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5783  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5784  			clocks = <&aoss_qmp>;
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5785  			clock-names = "apb_pclk";
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5786  
3f1550f99767c9b Yuanfang Zhang        2024-12-10  5787  			in-ports {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5788  				port@7 {
3f1550f99767c9b Yuanfang Zhang        2024-12-10 @5789  					reg = <7>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
