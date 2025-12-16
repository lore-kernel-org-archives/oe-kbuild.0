Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2593376BC
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866207; cv=none; b=JM7idrG/eTIpAIc7aap5cZZCwz5c4GX3dJVR9s5ghAufQYPnOuGbddXUvUrHruTcmGebTsY3vGEeotFvLPZuwwd+NTkVMkB5FS+cEIVDJQEv4wvsXbhD8WNDo/pHqsNWHki5mIfSZwzaRTcpe72gTNd7IdFx7unx8KCNSRS9yY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866207; c=relaxed/simple;
	bh=6IRYs/vxPxUPNJpzThY8Ugxxwx9yu5V3VyX+5yGBKYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EjlXE/6HuE2x9jQJexr7RX9HY10i+sZMpWgZEMdsb7m/48qYQ4w8zypQD0YGJSggWvoZjJylg2+AfI+tQhbiZjvMK0JtgUejN2gbsgWJ4/WnPFp3xJK+hv6pkmJ3Omb7dASx15p+E29WrQ59slslph5VgqHm+3gYahBxTLUHwTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCiaew9+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCiaew9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765866199; x=1797402199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IRYs/vxPxUPNJpzThY8Ugxxwx9yu5V3VyX+5yGBKYo=;
  b=RCiaew9+kCAvRD7UCrUbEPvuy7xIaO9LqOQmlMaPyDBbhuqR+CcD+EQE
   0E0O6CpeLv4pjdCbLj1Qkk1Xt+/5ziH7yEWYDyJ75qoXy4gZC4vJ3Pje+
   rvzBEiPV0Y6zLStdkGrRgi36M0IlG8G1hn1TU1h0tMvj0CQuAedjk2xly
   PrduDsLUE0I0wcHO7dMfoMBRN6eUctwCV3eTzQ1oi8mIjWNVt05+Br8QH
   bXS9+F9G1I2AZLboiS04itE/bg1kblvxOwpnJkxaUgv/yKyQ04pQQkaLh
   Z3J94KV/cBsS0s1fmlBSaLqF23jLAwYqwSNdjFMyL20mNjmxjEkoEQqu7
   A==;
X-CSE-ConnectionGUID: DyaoqJ9QQH2X+ZuSZ1gsyg==
X-CSE-MsgGUID: Q3oWx9q6TdGsWuyKGjsCGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79143981"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="79143981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 22:23:14 -0800
X-CSE-ConnectionGUID: H63L+RFtSOuel6GLqw4PCw==
X-CSE-MsgGUID: mFDdKRyDQDOX1Qg0HjbdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197984999"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 22:23:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVOSl-00000000324-0MNS;
	Tue, 16 Dec 2025 06:23:11 +0000
Date: Tue, 16 Dec 2025 07:22:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Message-ID: <202512160735.AZdp1J4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
TO: James Calligeros <jcalligeros99@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Shenghao Ding <shenghao-ding@ti.com>
TO: Kevin Lu <kevin-lu@ti.com>
TO: Baojun Xu <baojun.xu@ti.com>
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: asahi@lists.linux.dev
CC: James Calligeros <jcalligeros99@gmail.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e4deadb3e562aadf2825f28be3dcbbf01cf2ef17]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/ASoC-dt-bindings-convert-tdm-slot-to-YAML/20251209-173735
base:   e4deadb3e562aadf2825f28be3dcbbf01cf2ef17
patch link:    https://lore.kernel.org/r/20251209-tdm-idle-slots-v1-1-38dabf6bc01e%40gmail.com
patch subject: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160735.AZdp1J4f-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160735.AZdp1J4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160735.AZdp1J4f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'oneOf' conditional failed, one must be fixed:
   'unevaluatedProperties' is a required property
   'additionalProperties' is a required property
   hint: Either unevaluatedProperties or additionalProperties must be present
   from schema $id: http://devicetree.org/meta-schemas/core.yaml
>> Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'anyOf' conditional failed, one must be fixed:
   'properties' is a required property
   'patternProperties' is a required property
   hint: Metaschema for devicetree binding documentation
   from schema $id: http://devicetree.org/meta-schemas/core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
