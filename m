Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084DF26E19
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822531; x=1727358531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PZ8D5obgzxXd7gzUiflJ7K0S5hivV3VqIxoCj5SD70=;
  b=aIubBWA2mo73QIIg5MA+cbMIOm8EJvNAHqXexpOzWAJkwE71kWZGProU
   WVOWmbaSK0B8o4B/XUwIOf+mfQTvF6pRlaYRdI/QCadXSOJJYrhKVUQsp
   fe10qZtyfWNPkzsRYDt1ZdS+SkXBxiOYKXs59dT55W4oKcocpLseLFVT6
   GtXt/nlwXdKLj5mrxB/F1/ZXcS5Gk9h4IuarwJKP451LfLC61nxG0PqG6
   4iWyJG/a2bgITbfp1zDUa2S7rSWiN9N+uMkQnBCuaKzqxWxrLhG/nbTx3
   A2ipUpqHnlhbUrS1EwMv9jOpAjj50MECq1XNzxQhWfRuZCu5qwpprib1d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="424321"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="424321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="814870693"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="814870693"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2023 06:48:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlUuF-0000G9-0E;
	Wed, 27 Sep 2023 13:48:47 +0000
Date: Wed, 27 Sep 2023 21:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 103/1370] dtbs_check:
 Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx
 TMR Inject Device Tree Bindings' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309272143.Lm6edtp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx TMR Inject Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: bf683d87efbed83c55992ae43e8b0e57b72e2611 [103/1370] dt-bindings: misc: tmr-inject: Add device-tree binding for TMR Inject
:::::: branch date: 5 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309272143.Lm6edtp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309272143.Lm6edtp0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/ingenic,codec.yaml: title: 'Ingenic JZ47xx internal codec DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml: title: 'OLPC XO-1.75 Embedded Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml: title: 'MediaTek MIPI Display Serial Interface (DSI) PHY binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,tmr-inject.yaml: title: 'Xilinx TMR Inject Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx93-clock.yaml: title: 'NXP i.MX93 Clock Control Module Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/misc/xlnx,tmr-manager.yaml: title: 'Xilinx TMR Microblaze Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: title: 'Qualcomm Technologies Inc. LPASS CPU dai driver bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml: title: 'Reset Clock Controller Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/serial/brcm,bcm7271-uart.yaml: title: 'Broadcom 8250 based serial port devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
