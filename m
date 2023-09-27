Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049FF111A1
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695804674; x=1727340674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggqMEXQet2F8LDXDL86Km+T7EFcM5f27Vc5rPJ4EOI0=;
  b=bnguzxaY1bQCswdyNL8QyfFrV2g9Vbv2929gbN3rWz0AF7ZlGMakoph6
   VQxEjdY2hzg46s06hGitfokrS88R9ci/+gwUKwdBkIOxfUGG3SfRli4IN
   iyiIi71j2qCCVA82M1TTKSdPeQ/MWme2ytFezq51JVpqbgCY6nq6gHOWU
   mZIT/HAuZnET0/CnPAW9gQnVV7j49/ZpuSfuZAjIRTcr6gdofagXFxuq6
   2Sl6dszQpsWzy4Ov3r537V/u6kdaQfRHwJs++v8AtRCh+2Df00mhX9xhS
   L/XqBOgXzquEmHg6OZ2oaWoqN34/K01597BrTR1ED4ZiNO1zO6bk6iX60
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="380638442"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="380638442"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 01:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742633116"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742633116"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Sep 2023 01:50:22 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlQFP-0003vi-2R;
	Wed, 27 Sep 2023 08:50:19 +0000
Date: Wed, 27 Sep 2023 16:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 75/1370] dtbs_check:
 Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi
 Performance Monitor device tree bindings' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309271621.qs5KZrqr-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309271621.qs5KZrqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309271621.qs5KZrqr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml: title: 'Ingenic SoCs I2C controller devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml: title: 'Qualcomm Subsystem Power Manager binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SM8450' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml: title: 'Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx28-clock.yaml: title: 'Clock bindings for Freescale i.MX28' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml: title: 'Qualcomm Technologies, Inc. (QTI) Stats bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
