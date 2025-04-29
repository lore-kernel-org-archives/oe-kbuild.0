Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B96F073
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966305; cv=none; b=V9kAF2kBxDfIDKfMXzT0ugM6Dt2owehyBoHAWKGSfG5LGURvd9cvyMBTwjQie+YyW3+5X91iHykqzLqIf4ujnZnGXaiZmq/L4lxedpv/IjFjbCrfDHcZhUq4dMmvQQM7BU/NI7yTYnVa8Jm6UVuBBroUWI1uv0J04hpLxEt6yjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966305; c=relaxed/simple;
	bh=UD2H+dS1ZMDiNVw6AT8o+wzrO7GeZ6p+vqeCF+2/NB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNfWhoZuQjILittJnWzgUlRQECAcUkJi0rUV+JEIMgFjHNj9OssH6NjlRrq1bYm2/cjm/dThig17Bex3ndeGD55OSpvHmXl0pbDxK/38Za9RCACHr6EUOkokDOECbnK71OuOqYfEODkuJHQQQVC/vQbynBzk6MhWT629DsWcG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W45Q390k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W45Q390k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745966304; x=1777502304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UD2H+dS1ZMDiNVw6AT8o+wzrO7GeZ6p+vqeCF+2/NB4=;
  b=W45Q390ka5v7j35BXtlrzAYLLSc8AlMMpJA2A9j60NppIhGp/H1nHVZU
   wDnJ1Xjlo9whR2K8sTBY40iLQWdCUv1qmwEaIvQen4yrcHbO8rlmfPS0X
   5F/jrjUMdnbiPMnd4zLTZVnegBq3N1+KNygDHg1bQLAFWVukhY0LOfkS/
   o8LgsdpsYwcVB51BUky6YNqhk+D/tlxzINIKPolB8/zU/w+w4wzY3RzkY
   9PBZgpfXwni4xmQk7yjpNJhw8QnW+NUMGsqf8TR2BP0bLra4naVFXud3t
   8IkhTn5jrkZiLcMgzbMd3ww/wMdZDUBxRIxYXlrAJa6/IlEuDnT23iIA9
   Q==;
X-CSE-ConnectionGUID: Lk8THdpRTZaK+CN5N+sMIw==
X-CSE-MsgGUID: qv5q//xjSTCXi6auf6k25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51427993"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51427993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 15:38:23 -0700
X-CSE-ConnectionGUID: VxTY58xcRZKUQ0rIkQy1gA==
X-CSE-MsgGUID: Tly/Y8VfSHuiEx3IOZNv4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138765462"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 15:38:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tal-0002zo-2X;
	Tue, 29 Apr 2025 22:38:19 +0000
Date: Wed, 30 Apr 2025 06:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/xilinx/zynq-zturn.dtb: accelerometer@53
 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
Message-ID: <202504300609.LxkKrLnr-lkp@intel.com>
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
TO: Lothar Rubusch <l.rubusch@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
commit: ebf0aa3ed1dc94f2f66e19e5ea320eeacbbd518f dt-bindings: iio: accel: adxl345: add interrupt-names
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-051-20250428 (https://download.01.org/0day-ci/archive/20250430/202504300609.LxkKrLnr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300609.LxkKrLnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504300609.LxkKrLnr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: fpga-full (fpga-region): $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: replicator (arm,coresight-static-replicator): 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zturn.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
--
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: fpga-full (fpga-region): $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: pmu@f8891000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: replicator (arm,coresight-static-replicator): 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
>> arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-zturn-v5.dtb: etb@f8801000 (arm,coresight-etb10): clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
