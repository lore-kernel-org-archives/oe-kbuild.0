Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D47624
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 02:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695435750; x=1726971750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXvIEUNlWlAEd//uET5aJ+c42Zsay/H5Zeh91INpMsQ=;
  b=H3zGv7WY/UFzQGi78dPFX0ZiAAO27EyLwBaH3weJmhXvb/8T2WfZixZR
   EUZPknrWA9U/lIL3V86ORZoNAKN+ICRiWngwLJcp57CvihpO9nhnE4yTJ
   3VduJlw2OxJHk+1hH6hjgUs1Dhm3NL/U7qmdGdLMgb1/3gOZrkA6pg+rV
   7CE1GfCQXXflfyi2XTa0Z9DzysI+aXdYO+XiFJlfr/WQpj0E+bdpcZI4v
   nD38z3FJnHalQ1ioR9VpUSCfx820cD+Ei2RhwM0CsDbsZBYfdhiIeCwTM
   0R3CwtcUpFMrHb4XYv20mqvqg2KIZO1MuXaPr3lIFCDoMZdetN/0+5Djm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361232993"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="361232993"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 19:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="891040672"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="891040672"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2023 19:21:32 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjsHq-0001cz-0e;
	Sat, 23 Sep 2023 02:22:26 +0000
Date: Sat, 23 Sep 2023 10:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 40/42] dtbs_check:
 Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml:8:8: [warning] too
 many spaces after colon (colons)
Message-ID: <202309231039.ZDPB8T55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml:8:8: [warning] too many spaces after colon (colons)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   0fc3a2e40457fa5b337c9dad35cce2a9cacdbb18
commit: 66577bfbdfab156961e5839e55e386b55cd7d4b9 [40/42] FROMLIST: dt-bindings: uwb: Device tree information for Nxp SR1XX SOCs
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231039.ZDPB8T55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309231039.ZDPB8T55-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml:8:8: [warning] too many spaces after colon (colons)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:22:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:24:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:29:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:136:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/media/mediatek-mdp3.yaml:138:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
--
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml: title: 'Broadcom V3D GPU Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx25-clock.yaml: title: 'Clock bindings for Freescale i.MX25' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/dma-controller.yaml: title: 'DMA Controller Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml: title: 'NXP SR1XX SOC family of Ultra Wide Band(UWB) device bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/trivial-devices.yaml: title: 'Trivial I2C and SPI devices that have simple device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gpucc.yaml: title: 'Qualcomm Graphics Clock & Reset Controller Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx5-clock.yaml: title: 'Clock bindings for Freescale i.MX5' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

vim +8 Documentation/devicetree/bindings/uwb/nxp,uwb-sr1xx.yaml

66577bfbdfab15 Manjunatha Venkatesh 2022-12-20  7  
66577bfbdfab15 Manjunatha Venkatesh 2022-12-20 @8  title:  NXP SR1XX SOC family of Ultra Wide Band(UWB) device bindings
66577bfbdfab15 Manjunatha Venkatesh 2022-12-20  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
