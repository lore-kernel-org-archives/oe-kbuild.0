Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4D49995
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695757837; x=1727293837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iOy3Kg+T2c+WMH0Ax5URKtC57IZEGDzXw4rnCuHOK6U=;
  b=OnsqM6BUFP2Oil4p//IA+lLsgdE3E++LNGH4Ojmew/TwrB9cxhLDPrL+
   kSj5/TaTXhUCYF+0Wq1nJYpaV4g/+EKTd9sh2/yQIhQja7d8FdS924KsY
   OBY7CznhL4w+EOqSsbtS1vzKuum+ZQwcyQ1zlLvQcJPOQ1aV2plQo6/7W
   skUFJpScoCBRQzyuNdOu/boS8qRb4yZXL2rx4o7oNnpqSp+1QGPp0Lk7p
   eNOroAZUcVKLTg+5G31ZOvONXaue0AvXqTINLA+OqqsxTQUqlLCSEqoxx
   8KQkvmBU9PQEFA9yFwi6muKU9HqEaq+pNZdqJFfylDZMVR7sQCPP66LuW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445786847"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445786847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 12:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="274208"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2023 12:50:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlE4i-0003J3-0O;
	Tue, 26 Sep 2023 19:50:28 +0000
Date: Wed, 27 Sep 2023 03:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 99/1370] dtbs_check:
 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml:
 title: 'Xilinx R5 remote processor controller bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270318.VjI7M0mg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml: title: 'Xilinx R5 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Wendy Liang <wendy.liang@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 4a9dac9504e729fa23e81c5c83edfeb9a8f91721 [99/1370] dt-binding: soc: xilinx: ai-engine: Add new AI engine binding
:::::: branch date: 4 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270318.VjI7M0mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270318.VjI7M0mg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml: title: "MediaTek's CPUFREQ Bindings" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml: title: 'Ingenic SoCs NAND / External Memory Controller (NEMC) devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,a53pll.yaml: title: 'Qualcomm A53 PLL Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml: title: 'Xilinx R5 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml: title: 'STMicroelectronics STM32 Quad Serial Peripheral Interface (QSPI) bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/calxeda-combophy.yaml: title: 'Calxeda Highbank Combination PHYs binding for SATA' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml: title: 'Qualcomm Technologies, Inc. NVMEM CPUFreq bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
