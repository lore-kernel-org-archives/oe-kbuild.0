Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3EE1D9A66
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943032; cv=none; b=GkD7rrxdT3/0cg8qADjpP01oQREL10E8LEJPv0oTRioWZrBZoIU6PdpcLtxnoPXT62HOyM9ht9SXMP9/wBM4oZC/DrdP9/XF3Vx3h5aXULaoWv6s332VoGA11nDcDeUeDgBTJzBUtb8CSSLsSvu6vVaGUjTvYPQLx2PO0hvx77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943032; c=relaxed/simple;
	bh=d2iASfmgTkDZkLyQVvEXrl79ZQnijY+73zBhYG8RBqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/EJ4YoMHNz34WwBhyZrBkWNmfDsW3PFBCXHMU4R9BPt8x6ofKKJ0HXN8Se9DvB+eGb0DoSqJWqgIAM5j0dpPlRFZNrmwzI/UGSqQ0LcC6mU2jjYqzSE0wHwns3nbF7Xa+4Bd1s8z3lOLMG2s7R5R+yq15cKLTPXdnhWxJaUiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuiJWcEX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuiJWcEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777943031; x=1809479031;
  h=date:from:to:cc:subject:message-id;
  bh=d2iASfmgTkDZkLyQVvEXrl79ZQnijY+73zBhYG8RBqo=;
  b=kuiJWcEXKoWduTsimYawTrlWQtcYfz6pc3L6INFR2rbjlyAlZKxrGHZl
   D+QkP30+PaENZAeFSCFAr2g/GDZU+mEWDbCyKbVVnbssTcN6Az+rKQ11c
   cdZNaeWWgvnoDR66fLpiMW0wJxxVfChfgIBAc1LAGER1kt4m2f1xGL/WE
   U0utxT8CmZYEqwD7+T/cI7oKeypVY3foFMhOaXooJmbe/piEKLNRNvHx8
   xQEVLi2Ge8e6AVIZ4iBZRMiRwiDrN9glZggGPPoRYQqjqUqVghtZgZiX7
   573A38OKWz/T3aynkNyj0MZe5/ZlRVz4yJR02LDPBNrsYk2fSGVIrzRwK
   g==;
X-CSE-ConnectionGUID: y5LoOZSlQWqHWWci5pwjaA==
X-CSE-MsgGUID: EoCWfbZGR1+7/VPvcODRrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90181021"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="90181021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 18:03:50 -0700
X-CSE-ConnectionGUID: Sas7/0zGRuGCcQsfch6/Ng==
X-CSE-MsgGUID: AF01rMu6Q5KxpJRkTcmsWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="231295290"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 May 2026 18:03:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK4CR-0000000063F-0xOD;
	Tue, 05 May 2026 01:03:47 +0000
Date: Tue, 05 May 2026 03:02:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml:126:
 example 1: canonical form differs:
Message-ID: <202605050205.gxHuLGy0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml:126: example 1: canonical form differs:"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Golle <daniel@makrotopia.org>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-misc-fsl-qoriq-mc-drop-trailing-whitespace/20260430-163453
head:   c553182e0670fe0fd68c50cf7dd3acf767475883
commit: 570758ea908d5c36820da86ff3265cea8b9f56f6 dt-bindings: wire example style check into dt_binding_check
date:   2 weeks ago
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-2051-20260430 (https://download.01.org/0day-ci/archive/20260505/202605050205.gxHuLGy0-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050205.gxHuLGy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605050205.gxHuLGy0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   };
   Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml:105: example 0: canonical form differs:
   --- Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml (original)
   +++ Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml (canonical)
   @@ -1,4 +1,5 @@
   #include <dt-bindings/interrupt-controller/arm-gic.h>
   +
   pinctrl@3100000 {
   compatible = "qcom,sc8180x-tlmm";
   reg = <0x03100000 0x300000>,
>> Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml:126: example 1: canonical form differs:
   --- Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml (original)
   +++ Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml (canonical)
   @@ -4,7 +4,7 @@
   reg = <0x4a096000 0x80>,  /* phy_rx */
   <0x4a096400 0x64>,  /* phy_tx */
   <0x4a096800 0x40>;  /* pll_ctrl */
   -    reg-names = "phy_rx", "phy_tx", "pll_ctrl";
   +          reg-names = "phy_rx", "phy_tx", "pll_ctrl";
   clocks = <&sys_clkin1>, <&sata_ref_clk>;
   clock-names = "sysclk", "refclk";

vim +126 Documentation/devicetree/bindings/phy/ti,phy-usb3.yaml

62c9ff8fc20d23 Charan Pedumuru 2026-01-23  107  
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  108  examples:
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  109    - |
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  110      /* TI PIPE3 USB3 PHY */
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  111      usb3-phy@4a084400 {
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  112          compatible = "ti,phy-usb3";
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  113          reg = <0x4a084400 0x80>,
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  114                <0x4a084800 0x64>,
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  115                <0x4a084c00 0x40>;
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  116          reg-names = "phy_rx", "phy_tx", "pll_ctrl";
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  117          #phy-cells = <0>;
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  118          clocks = <&usb_phy_cm_clk32k>,
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  119                   <&sys_clkin>,
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  120                   <&usb_otg_ss_refclk960m>;
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  121          clock-names = "wkupclk", "sysclk", "refclk";
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  122          ctrl-module = <&omap_control_usb>;
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  123      };
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  124  
62c9ff8fc20d23 Charan Pedumuru 2026-01-23  125    - |
62c9ff8fc20d23 Charan Pedumuru 2026-01-23 @126      /* TI PIPE3 SATA PHY */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
