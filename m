Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45918AE0
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Apr 2024 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653712; cv=none; b=msxcCSyQ3Rf+NFrDw0P+5nDw9aFPOBhB/Re8bRqh2E87dYm28fueDg0y1s3E9tXaA3K8Wpi8fxdUE86yCUd+qcySRtFVN73KOIr2+/bfDZ1OwkuPXYAsmku1XZ+z2AIBtFgr7EXPD4kiUX05D5YxOr1SWsQmu4/JR3lb352FPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653712; c=relaxed/simple;
	bh=95n8JUqC23HXohICQuLMde5xz02pikuuj6Il1R3I62s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mi8KWoipwyTzcNHCkT6gQUQHDfS3SllhVxD8ohr73e4uKCEJWVxeX+JJm/GefpA2eKMs3Tm/4ue7mAAUyIs01WthbMT+OvnIKoOlyRnom2/JXf71aNjyIjeiHytyNm3vC1Y4i6AdkQVzx+xvx6xDROfq8RkaPA/vRQ/uItM2q7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzK/bzFx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzK/bzFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713653712; x=1745189712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95n8JUqC23HXohICQuLMde5xz02pikuuj6Il1R3I62s=;
  b=FzK/bzFxKcuRMtRXC74l3IRh0Mah2Rncp9LM2A0gCgy9JJVLOyonKSug
   R/c/d4GGyaf1upJE1PtFJ/jtEMCKbVsAUptALgl1fDJFtd18F00ONbJc4
   gJs28Ixr6VuIMgUA7VfmLED1sbfStHL2W6fQ2udmeIx17U/kvb9ryX/Eu
   8qO8rmPhyuALDuzyG8jFymVfcWxXmtmjBRXL0QiGeAUIzC0f44oPxL0aj
   62tsL+xVKoRKVYM5sxbAx4hGJuOuzCoub3UKYeZpJSGoB6SRou0IdAgyA
   aDHHQTCp6X15YT8KdHSAqbDATyanxUCRNFA4Jqhm8PZ9vMmiX8T+g0kp7
   Q==;
X-CSE-ConnectionGUID: RUTJk/daT9eNqWipmKT6VQ==
X-CSE-MsgGUID: OByhzPCLSXeVdlowOIjA8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="13018941"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="13018941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 15:55:11 -0700
X-CSE-ConnectionGUID: Xebi53nsSXyFRCAEmb5Jsw==
X-CSE-MsgGUID: a1+b9Cl4R4aNqkJ+ZtcX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="23732271"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2024 15:55:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryJbu-000BYC-2o;
	Sat, 20 Apr 2024 22:55:06 +0000
Date: Sun, 21 Apr 2024 06:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-5.10.y-cip-rt-rebase 561/875] dtbs_check:
 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml:
Message-ID: <202404210642.v9f8USCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   a78f85d30015ec21e5485a343dccdccfe290b405
commit: 86c54d3569bf231429c49fa9c2232aa250715926 [561/875] dt-bindings: pinctrl: Add DT bindings for Renesas RZ/V2M pinctrl
:::::: branch date: 31 hours ago
:::::: commit date: 32 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240421/202404210642.v9f8USCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404210642.v9f8USCs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/pinctrl/pinctrl.yaml
   Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml: title: 'Intel KeemBay I2S Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml: title: 'Allwinner A20 Non-Maskable Interrupt Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml: title: 'ROHM BD71837 Power Management Integrated Circuit bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
