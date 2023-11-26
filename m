Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE27DDBA
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 20:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1vJU+i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701029771; x=1732565771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGneTpV0RVFXFPsuNcVOUcbZjGt2BuBDKxtRgSia7MQ=;
  b=f1vJU+i1YZwc7bA1IQ6/tb8sFtWGvJ00mz4arFxxd5qKh9DjaQ/jd14u
   aWxHpmp0l9YqUAv/55awVUbNWgAYXi3XWig1eY1KYHzledKVnt0T2KnLa
   n3yNi3qA/fOK4x46+Qab8VRrGfFngBD7zBoEY4ao4Z22ZX+GZuSODcq7a
   ezKUzMBKu2PmifaiZjPLfFH72afrsqQIbMJtxB6qcVDvJf7LwFQ9QjRT5
   fvcQ29IH0B+klgt+L6gFYPRCKOM/ZAjVc3AX4mSY4JUssJq3TCda5sdVu
   cjwALFBdX3yAhbkrveuRVQ4+pyqWUlxVipP9mu2R9V6gBNwvHHwc6/6jz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5849829"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="5849829"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 12:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885806100"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="885806100"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2023 12:16:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7LXy-0005UM-0k;
	Sun, 26 Nov 2023 20:16:06 +0000
Date: Mon, 27 Nov 2023 04:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 31/69] dtbs_check:
 Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml:
 ti,half-duplex-capable: missing type definition
Message-ID: <202311270213.YgvyuUG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml: ti,half-duplex-capable: missing type definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
TO: MD Danish Anwar <danishanwar@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3a4f51391fe1d39254fed39393815b2879e44d73
commit: 656ff87b30c4741c64a47402417c22e77dc3f736 [31/69] dt-bindings: net: ti: icssg-prueth: Add documentation for Half duplex support.
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270213.YgvyuUG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311270213.YgvyuUG5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   Documentation/devicetree/bindings/regulator/pwm-regulator.yaml: pwm-dutycycle-unit: missing type definition
   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml: linux-keycodes: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/media/renesas,vin.yaml: field-active-even: missing type definition
   Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: ecc-engine: missing type definition
   Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml: regstep: missing type definition
>> Documentation/devicetree/bindings/net/ti,icssg-prueth.yaml: ti,half-duplex-capable: missing type definition
   Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml: linux,no-autorepeat: missing type definition
   Documentation/devicetree/bindings/mmc/sdhci-am654.yaml: sdhci-caps-mask: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml: slim-ifc-dev: missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-active-high: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml: video-ports: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
