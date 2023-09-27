Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2B828E1F
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695819458; x=1727355458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTFaczyJlAqmwLVapfUF2X6r80DUmr14xFF02L9wu+k=;
  b=eIBpcF1JtykaQkbaijWrQqba3ZrWE81BJkEnWwuj3bdVSKlZFJXuNcOI
   ti6I5xjPUIC1zIvV78zEc6gjgvcWBuvQD0JkIIa9Q9F+qGTOhGycakj02
   SsnqOAw5jQbPZEkYDdGK23JAKy67OopCw1rlJzRUG5hPbJruisrSROnYC
   +nYOnPC4zQ/E5O/CRqg12DnOCMYyTLG6iLcYCiTqJbijA6Eo0SRA1s2TR
   ShTRlrOjt4IfCcsyt02+6vpMO0DUJqhYSOcaWPUH/kCQXxzmJppnNrbqE
   TSk4PZmIVKzRUYjsxzqsTDxCcXqJ21MsF+9XvAA4ame5JDcwTjWr2qb2Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="385675868"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="385675868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="749185834"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="749185834"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Sep 2023 05:57:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlU6g-0000CB-1m;
	Wed, 27 Sep 2023 12:57:34 +0000
Date: Wed, 27 Sep 2023 20:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 99/1370] dtbs_check:
 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml:
 title: 'Xilinx R5 remote processor controller bindings' should not be valid
 under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309272051.avo6KQBS-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309272051.avo6KQBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309272051.avo6KQBS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/clock/imx31-clock.yaml: title: 'Clock bindings for Freescale i.MX31' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/renesas,9series.yaml: title: 'Binding for Renesas 9-series I2C PCIe clock generators' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml: title: 'Xilinx R5 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml: title: 'STMicroelectronics STM32 digital thermal sensor (DTS) binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.yaml: title: 'TI AM654 SERDES binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml: title: 'Qualcomm Camera Clock & Reset Controller Binding for SC7280' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
