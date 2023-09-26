Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DD3C68A
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695754110; x=1727290110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQM0x+GHGV1jxkm6pwRHu3b7tFAEP3AKEnTE2ikvyyY=;
  b=b2tQdWiA896vZjI7p5mT0lo/ulTt2MF9YZC8s/ILqJlhTKxSpqOxzPVp
   0VvjS0nBF2uhyl09JOOvZLK+JAoTfr5HDx6c3aL1/r3g7s8uqQ5eEe6nS
   3pr0B2mVb1mo/bKOzp6wGUujtyC+F9ADz0tUGuELt9m3/JFomEfiMl5Xc
   8gMMBEp2Gu3CD/JDb0B6ulR3bqb55eMnBD5dPNRd5VrLgIKVmasMo2Iox
   3WA7AFY6heh7JlL1Ht4SOIcfpaCNiLiTUL6Lh7XmJI+mqTxcMbEzJwPLR
   42aG10718F9OkPSHTfZgiLKtYd0WcWk0XKJtOe+4X97mdVbR5lxklWCRo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361021888"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361021888"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892313025"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="892313025"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2023 11:47:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlD6d-0003Fr-2f;
	Tue, 26 Sep 2023 18:48:23 +0000
Date: Wed, 27 Sep 2023 02:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 75/1370] dtbs_check:
 Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi
 Performance Monitor device tree bindings' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270251.ReB7r3Zs-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270251.ReB7r3Zs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270251.ReB7r3Zs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SM8450' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx28-clock.yaml: title: 'Clock bindings for Freescale i.MX28' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx6ul-clock.yaml: title: 'Clock bindings for Freescale i.MX6 UltraLite' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: title: 'Qualcomm Technologies Inc. LPASS CPU dai driver bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/ingenic,aic.yaml: title: 'Ingenic SoCs AC97 / I2S Controller (AIC) DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: title: 'Realtek rt5682s codec devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
