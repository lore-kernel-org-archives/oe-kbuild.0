Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6593374CE
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 21:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695763569; x=1727299569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tnzt0nl+kTBmvtttp76DkGlotorHNhs+qyGENDQQUz0=;
  b=AfTq+HpoboIMSWZNJID2V0sMEoNCeiVOJsV4waKrwAes4PqDE0wm/3QS
   fOY4ICda7wVbYWXWN8ozbWxAxtNs8a2QubVtpw4cBhxuZeQym+Ve/iVEo
   hYnR8NdYHlmfaoSoT5jNHOIj0IJqKOS9sakGnV4LnQninKCZD13Y6H7Jt
   Tdy+IMHSY7TgeXRdAHbCp6dGrM+abXrX8BeOKEP9S8JCej8bAIt0F/Fxf
   UXCrvNBZkHh2PZrhSkZgAeA2H9qJ/5oF7VA5nu49+VGfWKGps9JuoUdBb
   m05/oXpK854tm5I6uW0+2+Er62zQYjv4epUWEMwfO+Xj/iiyEvWCUknUS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361053179"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="361053179"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995927280"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="995927280"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 14:25:34 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlFYi-0003Nf-2J;
	Tue, 26 Sep 2023 21:25:32 +0000
Date: Wed, 27 Sep 2023 05:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 159/1370] dtbs_check:
 Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas
 ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270542.Pf7PpxUv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Alex Helms <alexander.helms.jy@renesas.com>
CC: Michal Simek <monstr@monstr.eu>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 0b10acac98371cb08db5fdec1490f5a603f80e68 [159/1370] dt-bindings: clock: Add bindings for Renesas ProXO
:::::: branch date: 4 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270542.Pf7PpxUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270542.Pf7PpxUv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/serio/ps2-gpio.yaml: title: 'Bindings for GPIO based PS/2' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/calxeda.yaml: title: 'Device Tree Clock bindings for Calxeda highbank platform' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml: title: 'Milbeaut platforms device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/clock/renesas,proxo.yaml: title: 'Renesas ProXO Oscillator Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/socionext/uniphier.yaml: title: 'Socionext UniPhier platform device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/rtc/fsl,scu-rtc.yaml: title: 'i.MX SCU Client Device Node - RTC bindings based on SCU Message Protocol' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for MSM8996' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
