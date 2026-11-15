Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794706609;
	b=zq8AAB4SVLh4lIAaG+BGzotolJeBxsikDkfgWgWjarWm36htnUNod+68Sb6jVirk4XoV
	 hlEGVmx2rfRMar1A0otJD/mS6Ede8mEvWT+g3tMLWpGES7hmp7Qa6Qd2d9T3bCR+/uBN9
	 L6c3WRRgImiu/txa+tD+1WnVbXbd3aUYQVux4GfVgYcQ3e0fgH8eb6wOrQcr5qaIawm7q
	 RdjOgsOWcTLw4GliO01HOR7c1BBinCSPpA3rohQCMNlgKgBXjEzwA08peyQypdFnru35y
	 DF3aDj9X6mvHdQpYqNNxqdHI+1mn+nt5cdLy2RAgJ7yzNfy72HutwlX+C8f8TPxt/uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706609;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jHMwR7vzu8765NU6GPlCSpa6ElQuaBaHv8Z/QelJtjo=;
	b=A78yklRRaf7D1povDAuIs+dEzJ8NH9MUXFgWwoq26Cw6NP6AYPfXskOyUPF3YTOKYyfJ
	 TWVzauIljVYjfby2chaxX9IB7+mArR9QeGJLhCOd+q+3r623Q3In8IFtCFFH3xyo5n2Gc
	 ulOyFg1Sb/s0iQhVEQ3Q8oT1Hq1pQvkTpXmXulV0nRJGRXG5h8BM7o6NFMIxE0LtINq6r
	 9+LHXM+k+uLyuHE+51zcztO0Dqky5D7VO7BY8ls9fNvL5AET4cqfrdcUKoKozPYk2KNlX
	 8CbWTSdaR+GuWmXy3XBeshe3t4onrrcgNpaU+d2rFYPv78uU+QS7K/7zpMxItNK8PJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fT0dkn5c;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBA6606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 01:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBA6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fT0dkn5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794706608; x=1826242608;
  h=date:from:to:cc:subject:message-id;
  bh=PT5kDGgFdPe+Fd+eAhbMkjuzzfeYLyqAx7TfI2DQyRA=;
  b=fT0dkn5cXIf6iF1riFWkZ4wNee6jlgvHzDqIDPw1DLYo9fT1j5qDtevR
   uYFDREdoM/HuT0EXHFMYGbW7sZm0AZt07emKd+MMY5G7df9+e4Jnq8eov
   wSvxUmV/ZrREL9L+hz9Z15ei5pKSuKFVFxkEzac/Mn3HFpm5sz63Ovb4z
   9cxkndRP6Qo1xufsWrt6MA4xHbpRSAzKa3odqTEqUJWFffFdC9B7BsV5n
   ismMw+JQ0N8ekRkROHOsA11wdmOY2+KJTcDHckPjT/V9oDf0QI8/mrbV+
   gx2r6Xq4jt7nLrhumPx5MkdUGgsG9AXYfu0c0cm5UM4qtsgNnf36yUiIb
   A==;
X-CSE-ConnectionGUID: OcGcUfeRRgifTw3XZISoXA==
X-CSE-MsgGUID: ym8Lb5JuTwCHlVsZG9T9QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3580667"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3580667"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 17:36:48 -0800
X-CSE-ConnectionGUID: Ot+PTVwRR3u3U66gWfir0A==
X-CSE-MsgGUID: CkEX/NQiQduRf0a0Muzigg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="10961989"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 17:36:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSPAi-000000001yg-2HXX;
	Sun, 15 Nov 2026 01:36:44 +0000
Date: Sun, 15 Nov 2026 02:36:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:zynqmp/dt 10/10]
 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: pmu@f8891000
 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611150224.G0aEm7fo-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150224.G0aEm7fo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150224.G0aEm7fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150224.G0aEm7fo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-7000.dtsi:266.27-275.5: Warning (avoid_unnecessary_addr_size): /axi/ethernet@e000b000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: clkc@100 (xlnx,ps7-clkc): fclk-enable: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: clkc@100 (xlnx,ps7-clkc): ps-clk-frequency: b'\x01\xfc\xa0U' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tpiu.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: tpiu@f8803000 (arm,coresight-tpiu): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tpiu.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: tpiu@f8803000 (arm,coresight-tpiu): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tpiu.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: funnel@f8804000 (arm,coresight-static-funnel): 'clock-names', 'clocks', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: funnel@f8804000 (arm,coresight-static-funnel): compatible: ['arm,coresight-static-funnel', 'arm,primecell'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889c000 (arm,coresight-etm3x): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889c000 (arm,coresight-etm3x): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889c000 (arm,coresight-etm3x): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889d000 (arm,coresight-etm3x): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889d000 (arm,coresight-etm3x): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dtb: ptm@f889d000 (arm,coresight-etm3x): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
