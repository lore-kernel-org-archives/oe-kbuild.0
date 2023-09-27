Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D003B3FF5
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695815678; x=1727351678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MwuNEaK9w6nyQT/GFyqz5yvart9C4FNk46l0ughB3U=;
  b=SLSpaKWiWMJpd5Os+iXMctusvG+k5ZQxKIGpBDa0Ocjv00LeK6rwoLTy
   aL80X+micWQvbeL7zMSx50YDRnyY22dr0dbFCsywd52WEsuchtI2t/jji
   oatQF1GvtaeorIsEmdCV54grEJDhm5x24M3/XKb0O8+8Wh+bZmkcFhrss
   sNdAOBYAOM8U6/JQua/oPDOdNgp6T6vjamqjC+Z/ev360+QxNAbciIWIH
   x5HPPCWQHx1/VEDBjRtGow684gOURDpdyH6Sq/xzqu9lqf8swj5ghfD+M
   uEFmAJ38EbH5S/5Ru8VWZa2Me5UUkxitfplEGQzoToWt86InP9mOt8z55
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="401137"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="401137"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 04:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725771547"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="725771547"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Sep 2023 04:54:35 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlT7h-00009j-0F;
	Wed, 27 Sep 2023 11:54:33 +0000
Date: Wed, 27 Sep 2023 19:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 75/1370] dtbs_check:
 Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi
 Performance Monitor device tree bindings' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309271912.or8lobOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: dd65426231fcfbf88e45190dc2846ade079bde8f [75/1370] dt-binding: apm: Add the binding document for APM
:::::: branch date: 5 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309271912.or8lobOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309271912.or8lobOA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/intel,phy-thunderbay-emmc.yaml: title: 'Intel Thunder Bay eMMC PHY bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/ingenic,mac.yaml: title: 'Bindings for MAC in Ingenic SoCs' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/ti/ti,clksel.yaml: title: 'Binding for TI clksel clock' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/spi/spi-gpio.yaml: title: 'SPI-GPIO devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/bridge/ps8640.yaml: title: 'MIPI DSI to eDP Video Format Converter Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml: title: 'STMicroelectronics STM32 DMA MUX (DMA request router) bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
