Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAAF2641E3
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974416; cv=none; b=Dc4K2/kbVhs0+qHnijo04X8v7y2jofsJnHRMJklI8t7I0fFFawT6NKGpv2Bt5j+Xi2YZso926FDqT2x3SPnYZRGIH101B7yeO4ZhwJGD89Ue2NnM6BJSzpIn9J6ydybqSWUfY/SulmmMCancmq8Cd+/JDGf6Qxxt0Rvj0nrY7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974416; c=relaxed/simple;
	bh=Hw5gQI8z3jFLXk6YeFod44raJpwTp1cadkl3bD2QakA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGV0qlY9T9VkCcTADERlU5BgKsezl+fK4tOiPTjc/DOlIrYLSZOBxVZZ0LHrBz7aJLvoZHqxi8HP4r1UnRao3mDFPA9ixkQ67ZlpS04ZuX2/YUAnBpBuSEyD2m78h6kLz/SUOAEyJZMh76pQS9wOC3X8kCt2Uq5g+uc8iDx0/GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pas33CBV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pas33CBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765974415; x=1797510415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hw5gQI8z3jFLXk6YeFod44raJpwTp1cadkl3bD2QakA=;
  b=Pas33CBVxtm61IkdIfDg4SxUUab2fmj/54CAb/kXRQbLj6ljyWDnhf1+
   wXMUxX+ob3ngR71v1kAD+PsfV8yUcGk56e4QGCf2bAHYZJOaO9ztrS/Xa
   R0u4avq0u7VJSWNrOgLpC/IhyPBZhNhicCbfAGhQclkew+oYy09gVuBpr
   Df+ZPQjzp9bSAPBJvP77VSR/oG2OGOCA6X3Mmg/bEdUYQWGKmrqb3EZwN
   CdN/tV+DaVWrgikkPoNQfJA/0F0Ys3PxEbwTaO1gJYI7R0BeqcAPWuEzF
   c86613DSGWmduKnzJnETwnh4NPnHOMdc6haGRLoxLBB6RGBCF87nEOjIv
   w==;
X-CSE-ConnectionGUID: 1vsP4BwDTlWaBVLeZX2+Vw==
X-CSE-MsgGUID: 8ttndBWHTR6Evn/NZavdWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71767850"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71767850"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 04:26:54 -0800
X-CSE-ConnectionGUID: 0gMdnqB/Q3a9cf86XUgcng==
X-CSE-MsgGUID: 4W4Xa0PHTkuCdrFlOvUwVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="202485966"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2025 04:26:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVqcE-000000003Zs-3E6x;
	Wed, 17 Dec 2025 12:26:50 +0000
Date: Wed, 17 Dec 2025 13:26:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Message-ID: <202512171343.jWUeNvKc-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251217/202512171343.jWUeNvKc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171343.jWUeNvKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171343.jWUeNvKc-lkp@intel.com/

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
