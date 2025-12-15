Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009820CCCA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765838106; cv=none; b=pyRBVX7O5TNPqLIe0SlARdMwbVBcWe6FjO3/+tI/3B2GygouYDuswQrQla4Gq3QUxR2XzGsvQmYjFIJ4eGX3ZOsjxskn8NX/rwvzez4UugJ1hbzXOWYahqbV60OnT1LhSmBO2SctxEik5TW23dcebXB0eMTioPqGmPDUEZnBdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765838106; c=relaxed/simple;
	bh=vjbFC5Rgr0qS52urPsS9/GFHOLQVD3D1V7zigzUV0xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDZ9yCTErdzf3k2rJl9Mtv4pRnkXC1fpsJANiXH/45/5JmI60QXchIFmOGpJ91Iu2WDoTp8Llu2J5cYlpUY8wbyAkBoksULiTxApePpf1RssNxmzT02wchrUH4mTvJoxYnnsnYlo8eKWFPkhIm978UAbPUGr9/RnzqCeHKAnnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBZHIdUC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBZHIdUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765838105; x=1797374105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjbFC5Rgr0qS52urPsS9/GFHOLQVD3D1V7zigzUV0xs=;
  b=DBZHIdUC4Wy9UTNjwSaJNhnJmaBCxBA2XaYyxBMupVkDUdv0ZEvfhusm
   qptzjPBukxPEyQQNke/Rr3EUkLrXE31YU0Y3+UglyRDPPsPw3F+3qVsv9
   Ofpy3J7Wa8jLClqCP7g69Ge/UYt8SR/COOUUz3DAK4Aa9O8jh9GKhyiiy
   unHSbMKfsOSIVSRzsvxe4Bg+QNyEfhj8hxtZVkJyD3vpCjcaO0f2CXKQn
   3Q/x6hbdTNyaLSdvWF/L7MXzh7Zbb1O7O4Xfz3Kmbdvi2qn7APXUOBkks
   Jb1kss8NJnKWehFXPeMkr3CVodMco8XqXmoajJhMLenng/f5UwSCINfDy
   g==;
X-CSE-ConnectionGUID: PbcJBBZ5RhWr+Z1+w1JSlA==
X-CSE-MsgGUID: h876zEboQFK46Q0+qwUZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71607757"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="71607757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 14:35:04 -0800
X-CSE-ConnectionGUID: fLoGdQxwT4y+XDLRlgz90A==
X-CSE-MsgGUID: iqNgkE/YRQaeO3qqSsmupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198661253"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Dec 2025 14:35:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVH9g-000000002lo-0liG;
	Mon, 15 Dec 2025 22:35:00 +0000
Date: Mon, 15 Dec 2025 23:34:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <202512152314.RAUmPBaG-lkp@intel.com>
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
In-Reply-To: <20251211014846.16602-2-mailingradian@gmail.com>
References: <20251211014846.16602-2-mailingradian@gmail.com>
TO: Richard Acayan <mailingradian@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: Tianshu Qiu <tian.shu.qiu@intel.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Robert Mader <robert.mader@collabora.com>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Richard Acayan <mailingradian@gmail.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Acayan/dt-bindings-media-i2c-Add-Sony-IMX355/20251211-095114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251211014846.16602-2-mailingradian%40gmail.com
patch subject: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512152314.RAUmPBaG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512152314.RAUmPBaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512152314.RAUmPBaG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml: properties:port:properties:endpoint: 'anyOf' conditional failed, one must be fixed:
   'data-lanes' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   'type' was expected
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
   Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml: allOf: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
