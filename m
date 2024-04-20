Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6046C10788
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Apr 2024 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713645112; cv=none; b=l6yZJXf9rzxqkmVbi6/oH7lrJXasehtAYWpFXZsWuxL31TnwOJMwumYA1hK5shcsOhoX5QrDAUvSIvQL8eIfKPjI03S5p+pPNe051nVAqi2inzYziee4ieDV0jZiu1Xu+cmcc+Gg35YuCKGSWUfcCwQB2eZiurv9O0E2z3Rmo/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713645112; c=relaxed/simple;
	bh=Wh1wh0yNGYoWdFqrOg842IEp8l+4ED7LDe+li9SjX7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3w0zrKvS8tZ32uW+zlxmaVJikNxKUyZBOiyWHpiDH/CWBzJ9IUzQ9pklRlUBGMzWAzQsvSnmnNXarmNPSJiJl4JvcSyCOGasoJZRcxpthuaXLLiylZZk3+TaUPE8XR8+9H41K/TYkTHsyrraMY0Dx0i2Iof32LLZbdDl5/xxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFkmPjGp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFkmPjGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713645110; x=1745181110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wh1wh0yNGYoWdFqrOg842IEp8l+4ED7LDe+li9SjX7c=;
  b=cFkmPjGpRgHVw+cbffDHBMp5g/js7Vafs/5U6rMAK3Olf5iXu1nz9RTz
   3TxfJFTkDnN8A9z0fbK+Emqtxt7lzh3E+735Mt51Qp19BopoHrbJpojJC
   mrGrcFylk49iWlr/D57m7mCn2ZnM313mBA2/GfA++ehWFONALigQtY+6/
   jF3tVU3nvHG3FOzbFl3s7LQer6umf4HjLk1QmyX/FT+B8nGWqGpvkvsB1
   05OrMfBpMKecq+KDaGaVLqH/LCAtAcnvQsdVG4QoVmWvCdfhIob768z7l
   6qbMZQrvrKkgVJi7qbMGQkS0u8MQzAO8cp00fUlp9VbOgZz2Cl3b4VHjW
   w==;
X-CSE-ConnectionGUID: BweQZ1AeSMaOUYOKfeF6og==
X-CSE-MsgGUID: 7xyKzamSRai2OQ8BUO8QGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="20648407"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="20648407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 13:31:49 -0700
X-CSE-ConnectionGUID: v7ZP6K+rSoiYZ01T34wobg==
X-CSE-MsgGUID: GJ/bDbsUTxitaoKrjQcb2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="23713835"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2024 13:31:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryHNB-000BTI-0U;
	Sat, 20 Apr 2024 20:31:45 +0000
Date: Sun, 21 Apr 2024 04:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-5.10.y-cip-rt-rebase 95/875] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml:
Message-ID: <202404210433.nGlc4PBU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   a78f85d30015ec21e5485a343dccdccfe290b405
commit: bb7be15a7b7c7713de260623845edafcbf47a673 [95/875] dt-bindings: iio: adc: Add binding documentation for Renesas RZ/G2L A/D converter
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
dtschema version: 2024.3.dev14+g64b72b0
reproduce: (https://download.01.org/0day-ci/archive/20240421/202404210433.nGlc4PBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404210433.nGlc4PBU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/sound/simple-card.yaml: title: 'Simple Audio Card Driver Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:ports:properties: 'port@[0-3]' does not match '^[#$a-zA-Z][a-zA-Z0-9#,+\-._@]{0,63}$'
   hint: Expected a valid DT property name
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml: properties:poc-supply: 'maxItems' is not one of ['description', 'deprecated']
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/iio/adc/adc.yaml
   Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml: title: 'Ingenic JZ47xx battery bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mmc/microchip,dw-sparx5-sdhci.yaml: title: 'Microchip Sparx5 Mobile Storage Host Controller Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml: title: 'Realtek rt1015p codec devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
