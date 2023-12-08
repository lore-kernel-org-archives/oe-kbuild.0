Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B959B78
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjHn5and"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702076442; x=1733612442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPddA3ixbADVX8GrCmJg0MN950ipQgtu98lz9qIcqdQ=;
  b=XjHn5and8+eZD07g7pYGqWoj9WrXmXbpfwcF6iV2WRMdk4OUEU2nhYw1
   xyGiEPXQGQEV9b353aKHKp2DyfDvjp7DyOnUHykwI8d+7yibaGEx/FpwM
   mYJ62m0RrBC5KXunCv5gH7qyXoloEbrx5XaUI35f58B6rLkl/aP6msASh
   iw5NNOhRuvaj0g0ygMRRbmUUx5Bf4dMLVRkYpLt1K1wHAatRJnVJikIpw
   QiQaI+DTujyQNxcA0+H2j3nZ+FIqOtsshlGYDcIaEEE25mL1+ftWjc2v3
   eyChc6f8tYWf+CRkmuD3SxvdLBAtqO1p2tkqVg7Sdd0H+u95BjiIJ2PjL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1600230"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1600230"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 15:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="838279880"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="838279880"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2023 15:00:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBjph-000EVd-1F;
	Fri, 08 Dec 2023 23:00:33 +0000
Date: Sat, 9 Dec 2023 07:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 3/19] dtbs_check:
 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
Message-ID: <202312090630.JidBzQ9J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   448fc7b95f56194b24210899ef06b5917a19f661
commit: 3221f9ebd92a7a3445a68b65cf11db17a28b3ae4 [3/19] UPSTREAM: ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090630.JidBzQ9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312090630.JidBzQ9J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rtc/rtc.yaml: title: 'RTC Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml: title: 'STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml: title: 'Qualcomm Graphics Clock & Reset Controller Binding for MSM8998' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
   Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml: title: 'Xilinx Zynq MPSoC Power Management Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml: title: 'Bindings for Qualcomm SoundWire Slave devices on WCD9380/WCD9385' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/i2c/i2c-pxa.yaml: title: 'Marvell MMP I2C controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
