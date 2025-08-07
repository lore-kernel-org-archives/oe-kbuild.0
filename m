Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505C1758B
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579147; cv=none; b=NS5CN9JfatuIoIrYCjFqJisXGdeFJWM6pViTT21JssN5AopUEVDIGtX0tVLv0RRzPF8o+f5581C7MmkF/iLrPej/wWHK09HN/YHNCeOa8FkW8UZQn0/HgJ4QRIMdxrk8XLsDNuf4VOihNrOuYaN3bP66JMU1PS6elAqHJBJyAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579147; c=relaxed/simple;
	bh=pUuWbkyUzaV1UkegkldN3syTIq1UCWEhIcPq8ePDOGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZdZE4bNqdzeU9i/t/KR/xZBdowBXdB12L1p5vJOBKKZmC735EVbqpGSm4lusFQrRjNKXgB45hWdAZhJRCbenuX+0Wcni6NncaWkXFNHb9Akg0rrJlnSefWH+VZhURSppqHfoQ8DuWxFz6Dze59v8NClM75LqDMCZltmjtPHPcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O28KwAF8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O28KwAF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754579146; x=1786115146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUuWbkyUzaV1UkegkldN3syTIq1UCWEhIcPq8ePDOGw=;
  b=O28KwAF81z9u7u/dWB5SdXLZvad2P3x1D+eVJGzTHW/z5LzB2kDOzXny
   pK/aMExKVtnYh3X4mE/Woy6ICbz0v2Rk5W1BQPzwHxv5wGhyHJKvtQrH/
   z7d3RWKEJtZDTeUbzxHLFWYr2ZuVM4II4R08RwPMP63WgZ23YrKJTxfIU
   hqGrwbWPndLqkjqsUT1Pz97iBYLkKhDDEypMWAQ2jI6oz/n1Vn2vWhJmX
   mP8myqq3OOKRB8vBxTGDK7tOZbsKazb/tpC2ELdUXtyymMhuVMt8uJ3cJ
   7sJrTNXrGU+dtuQ5rRd8kCCtb10gPEmwyT63MtQrbyWVF9V4nfjSAvsqE
   g==;
X-CSE-ConnectionGUID: Mpx7f2gbRHmx16K4rwKEQQ==
X-CSE-MsgGUID: WTfqpe+gR+Wj7HAZJ3qg8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67613749"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67613749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:05:46 -0700
X-CSE-ConnectionGUID: W+lXboMfTMqh06VK8QOS0g==
X-CSE-MsgGUID: ej/MOUbJS+aOuHtehDVSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="196081031"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2025 08:05:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2BW-0002ue-2C;
	Thu, 07 Aug 2025 15:05:39 +0000
Date: Thu, 7 Aug 2025 23:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 294/801]
 Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml:
 devbus,bus-width: missing type definition
Message-ID: <202508072238.0HPgo2Tu-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 548fe7f7fbf5ff92521dce4f4a75b5c3b4c4076c [294/801] dt-bindings: memory-controllers: Convert marvell,mvebu-devbus to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072238.0HPgo2Tu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072238.0HPgo2Tu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072238.0HPgo2Tu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
