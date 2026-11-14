Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698610;
	b=wd8vGWj8qEM87gCYBHKewpgjHyXDsPf92TbynumDL8hzaw8XS362IuccgX+jR8JUIOXG
	 K1XAJRdipIXHqtJZBtLCoQk/cl4HInveUyw3bCZy2aLrcLbf20wZQz9MhEkCYjScYJRE5
	 irwtseyNiSWUTO/Gx0lRDkaXaX/sqC4ha25GdFrxuE0Fp/avIrW4nFASdl3Gx2rGKy9sp
	 MRqdY56H4NwOv3BRaA1E/GgN/swDTi3o4SlRD1WHhSYZqyX6xIUe9Vf3wvynoN2nFE7im
	 h2tI/pa9l1Tq1al4R8EZr/fHF3qmJys9HtVpmrWPdgtZ8iJaba5ZfJ5MWaEfWP23BmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698610;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CtGt+Zo4iM+WxAVY4dm1fGWExTMgyBTKyd4oDhx5+AI=;
	b=o4+Qan7RtOEuODW4wydAlLlw3S+Dykmcq2RU7JV/ayIXBE58PMDnI9xOmDeVB/XKpY5X
	 VymiHseXJHxOaocdKf+vMPzg35vKOYuCq1p9UqSHwohhVLWDMHGLtOO+9q6qS1b5UlxJE
	 Lko97QG7LulGiEqxRWAyNlgqMwdbtXCV5iIAvyIt0pZeGdlgJo1OPMM0PwtrYklX7dBM0
	 us2xvpt3Sk6nf6UeaIrw8ruvP1Gx4BsaONyLWeQk9ZNQKj2UDF4Quv3ZQ0z4lxtfTD81v
	 /i27vQTw+OT9x6x9yMiT8mtteebAtegRzSTas8r18AJduRaIA+dTzgyWervY5ODqNdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cl4Z7gfc;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA09606A32D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 23:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA09606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cl4Z7gfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794698611; x=1826234611;
  h=date:from:to:cc:subject:message-id;
  bh=NGBm4g0R+cTulgLNzgHm9d7mpyxu5UZD2SFV+aJYWuQ=;
  b=Cl4Z7gfcpl3/9PO8hDxXKrx0Nm93mCPDgYISfYryc3l+CRaG+uLv6Uku
   +N/LLeOvQTKmrFDZU+RANZAiolgQ8pLlxSkZOBzLSOZEei2TMjQ1PY6jh
   OL7I/r7xPmFJ3pquTr0PC0aCRZ3EP5HAtVZTzTt1PBIqRDywmKwHlnwma
   Ld7tdkI+tCCoi6lLHDABJFi+jdWc9Bo/Sv0QlRYgejJKoZF/ZCYwlEsPf
   UsJimQgMkVvHFyN2InML0Ga4Qm3NHjteAvHpneLMUaVRHC2OJadtUE/v+
   Ih4/CaArbkGC8lLOwR/A0MNKqQA+XrD4TqsuXudfTTwhuMXA0OgihVNFX
   w==;
X-CSE-ConnectionGUID: yV+AWy4nTK+PLumraFHWpA==
X-CSE-MsgGUID: hXz9bY0NQkCF8xxgJ/oGTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3508316"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3508316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 15:23:30 -0800
X-CSE-ConnectionGUID: VixLFAugTDawZDtRgGPuvA==
X-CSE-MsgGUID: 4q99TLzxT9OllT3Vd7HFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9473943"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 15:23:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSN5i-000000001vO-1Aar;
	Sat, 14 Nov 2026 23:23:26 +0000
Date: Sun, 15 Nov 2026 00:22:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:zynqmp/dt 10/10]
 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb:
 /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible:
 ['xlnx,ps7-clkc']
Message-ID: <202611150025.jFaKBVsv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Pufan Jin <cyan2254650260@gmail.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx zynqmp/dt
head:   689559a7ad00e2b4237c540b771d201214cfec1d
commit: 689559a7ad00e2b4237c540b771d201214cfec1d [10/10] ARM: dts: zynq: Add ALINX AX7Z020B development board
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150025.jFaKBVsv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150025.jFaKBVsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150025.jFaKBVsv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-7000.dtsi:266.27-275.5: Warning (avoid_unnecessary_addr_size): /axi/ethernet@e000b000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: clkc@100 (xlnx,ps7-clkc): fclk-enable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: clkc@100 (xlnx,ps7-clkc): ps-clk-frequency: b'\x01\xfc\xa0U' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tpiu.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tpiu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
