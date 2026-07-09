Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC543935A
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563128; cv=none; b=UEXxwWIyDYbV8mrbK90YMefUOwQWFrZZ+jd9oPZLfGE3PvwrKEDgTbeTyPqHyBktuhrvccXCdC0bfe0txcYGCoyYjTrmGa7j4KG78ICV8SiL6sSP5joh6B7w9127zlTItWf5rd+lmw3TtVfmM/Oe3FVbFUw3VlcfSsDmK6ymeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563128; c=relaxed/simple;
	bh=3KqAU9cdQIDTuXYdkqi6Qmq+X/+t03IHLKm0MehMx/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZP9Bf7/ylId+G1KC0u3/DGVB7cr34o8IxBYZxnk22ZelNC9ri8rvS99AJYJVhUPEJ40HgjiRjbdt1FspVdchiuryQf7vv27o5CjxkdGRZfE3D2trdJx0Y3afQNOQxT2LVIDM8G8b2LbSqSDspW2BExTFOYvUoukse8tfPVWTkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSDgaIjf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSDgaIjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783563125; x=1815099125;
  h=date:from:to:cc:subject:message-id;
  bh=3KqAU9cdQIDTuXYdkqi6Qmq+X/+t03IHLKm0MehMx/k=;
  b=ZSDgaIjfqIK2W39IRVNLOlsJckGJJPaWbGP6ThTrLgVi1GVHO/rwddOv
   tWS4oZ5jCqgqd0wOyyBli+9mi9t97BQ4/qhDsxOa2XyuGz5kyciScPTAL
   8t3HkQ6I2NsqYaXS7uuQLF13o/MdRbiV/DEvWk/I7eivtngVnX2UT+Gep
   ytoIAYf0BYBaex7bx4asKNohzMJ1sqVkFBTPZOkSEpkPvO3Sl7479oJTr
   PdyQmC+39qT1KuY3bPBocjkDIaPEkO1INWIrRJtNJc7qPga8JCp4HFCM8
   zWldh62HixOXMHdAsSbGmbkKHTTMiRsfTpAx+6MhHD3+32dOeDS20+QCu
   w==;
X-CSE-ConnectionGUID: EY5pXXdhQ6eIKT6nLDFc9Q==
X-CSE-MsgGUID: Xb1JTwyMTSaj803rmZtHsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84209002"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84209002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 19:12:04 -0700
X-CSE-ConnectionGUID: P3YMJf2MQ56K3r9Iy6msbg==
X-CSE-MsgGUID: ZkpNIC+IShqagTW7vX15xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278841769"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2026 19:12:02 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wheF6-000000002sH-0pxg;
	Thu, 09 Jul 2026 02:12:00 +0000
Date: Thu, 09 Jul 2026 04:11:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 78/196]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1500000
 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was
 unexpected)
Message-ID: <202607090411.xso7Jkzb-lkp@intel.com>
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
TO: Xilin Wu <sophon@radxa.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   e43584952ee7df0f72e8311341d780d84f03159c
commit: 204242d747e67e7483256fc927d0ab19a63a54d2 [78/196] arm64: dts: qcom: sc8280xp: Add reg and clocks for QoS configuration
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260709/202607090411.xso7Jkzb-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090411.xso7Jkzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090411.xso7Jkzb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4858.28-4937.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4959.28-5019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6433.29-6493.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6515.29-6575.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@1500000 (qcom,sc8280xp-config-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@1680000 (qcom,sc8280xp-system-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@16c0000 (qcom,sc8280xp-aggre1-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@1700000 (qcom,sc8280xp-aggre2-noc): Unevaluated properties are not allowed ('clocks', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@1740000 (qcom,sc8280xp-mmss-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@3c40000 (qcom,sc8280xp-lpass-ag-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@90e0000 (qcom,sc8280xp-dc-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@9100000 (qcom,sc8280xp-gem-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@1b0c0000 (qcom,sc8280xp-nspa-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: interconnect@210c0000 (qcom,sc8280xp-nspb-noc): Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc8280xp-rpmh.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
