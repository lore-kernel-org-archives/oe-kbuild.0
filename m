Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584063DE
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 03:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695784087; x=1727320087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AkZRDa0TTs8DEgoLv41jEWGstiYpIEZnxp256cy3lo=;
  b=oJ1vayg/1P2ZegjJ5EB+FU6wFEm5h7EdXP1vnNXrZrpFFCo6uRflvvav
   m3h3SyNo1oCUe18hjCMaVOADAZD1bDD7dr92Iq6hb+/74yxC/qWU8hgcR
   nZydTUywnTXWC6sgryF6cXzy0YBPy5ZZLiWtywtByD5SI1v4wegYex6So
   5slixsblpkYyvilWrmNdCARqgC3YLAMIF2cZZ+azbi5HcNCX2d6Q6oAw2
   D+fXd9Vy2NSfQuRv6pFDn+8wcnl7tTBRMv2ps0aOtPzZ8DbOIMwwM9Jil
   8Obo8z19+Kas69C5osEHYM+qM5gBqohhTx51E6KYtHTGvaV1dxf/IbplU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412631788"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="412631788"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 20:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698674309"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="698674309"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2023 20:08:05 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlKuA-0003fd-09;
	Wed, 27 Sep 2023 03:08:02 +0000
Date: Wed, 27 Sep 2023 11:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 219/1370] dtbs_check:
 Documentation/devicetree/bindings/usb/microchip,usb5744.yaml: title:
 'Bindings for the Microchip USB5744 4-port Hub Controller' should not be
 valid under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309271010.lc9fk5NC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/usb/microchip,usb5744.yaml: title: 'Bindings for the Microchip USB5744 4-port Hub Controller' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Piyush Mehta <piyush.mehta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 9d3832c24ca18eb406d69ca59cc2b2da032303b8 [219/1370] dt-bindings: usb: misc: Add binding for Microchip usb5744 hub
:::::: branch date: 5 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309271010.lc9fk5NC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309271010.lc9fk5NC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml: title: 'STMicroelectronics STM32 Quad Serial Peripheral Interface (QSPI) bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml: title: "Qualcomm's USB HS PHY binding description" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml: title: 'Xilinx R5 remote processor controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/usb/microchip,usb5744.yaml: title: 'Bindings for the Microchip USB5744 4-port Hub Controller' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml: title: 'Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Lens Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml: title: '/reserved-memory DMA pool node bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml: title: 'Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
