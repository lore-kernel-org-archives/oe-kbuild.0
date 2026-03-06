Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D6361655
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772838127; cv=none; b=NOSlBF1gtm8zCSeBWgAVUvOUxasmNiYuwlhdr3aXjtlr5B8wv0YIQkRuTiYcDZBUvkv2B3xMRgMzi1gFYFaAURWo9KQt9R/TrvzMvSCvr46fftFg80QvDzigARjPSHcIhZvIFOzeRNuSab+kZB3HB5PrRPhuW2v+PNG2P6h1950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772838127; c=relaxed/simple;
	bh=AaBFh0ekL7/RQAQdyHbBCXFKZyJiq7OiQucVnAoroH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6v3AlYLKXU4rfTX7DIX01r9lHMEnlMiQaU/l4ZBvHudF8Jj7up7wktdBm2qqMlZi3MgfJCxwA2SOvc3C1pMqbAuuVq9N39lMbcMg9CS3fGBBM881TAeXfQXXIiI7KS67rHWtEQXL6VnYK/4tMz7cbxpWnNLA/7kn6uSIjbaR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsFpT6ZA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsFpT6ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772838125; x=1804374125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AaBFh0ekL7/RQAQdyHbBCXFKZyJiq7OiQucVnAoroH4=;
  b=fsFpT6ZAmwr0veG8f9kVPHHj+wNI++7nf54zyJsY8zDc/1sMszLfKuY/
   4VPegoKKyQZA/LfJRRvNrNvnqEnRcTBjxBgi+3E5b6FtxfYx5DyyBXCZ9
   UsFdOKGG6jiFODTU80xM5hH0USNFDdePzteYrJzIa41mLjq1DhUdW1TzX
   qQrSVvxdfUPdXJoSPPh3lwbs7b0lBUGgsucShhXAA0RlFC4XkHiNRG7Dc
   o+TxMjGmbkF3gKyIIEFMpDJ4BQ1j/804CHnCLRELGeV3G8o2wYQOgQiSU
   sS/mSb/86I5B9zO/CMxy4PnZw9bm2GccXmXqlgDCG4iCZkGcVfm0lMFjq
   w==;
X-CSE-ConnectionGUID: rTFhFD+IR8+NTIyUgJ2kow==
X-CSE-MsgGUID: 0E4Z5za/Th2PsmY0fWAr1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="96569153"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="96569153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 15:02:04 -0800
X-CSE-ConnectionGUID: edJ2V7T2RfmVFnWwMkKfyg==
X-CSE-MsgGUID: Xx+BfFfUSA2O+nVXJiZx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="216873116"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2026 15:02:03 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyeBE-000000002NB-3VhN;
	Fri, 06 Mar 2026 23:02:00 +0000
Date: Sat, 7 Mar 2026 00:01:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to
 DT schema
Message-ID: <202603062314.lMSA7gFX-lkp@intel.com>
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
In-Reply-To: <20260306133351.31589-3-clamor95@gmail.com>
References: <20260306133351.31589-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@kernel.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-rtc@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next brgl/gpio/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/regulator-dt-binding-regulator-max77620-convert-to-DT-schema/20260306-223101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20260306133351.31589-3-clamor95%40gmail.com
patch subject: [PATCH v3 2/6] dt-binding: pinctrl: pinctrl-max77620: convert to DT schema
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: microblaze-randconfig-2051-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062314.lMSA7gFX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062314.lMSA7gFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603062314.lMSA7gFX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml: patternProperties:^(pin_gpio|gpio)[0-7_]+$:properties:pins: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
   	hint: Scalar and array keywords cannot be mixed
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml: patternProperties:^(pin_gpio|gpio)[0-7_]+$:properties:pins: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
   	hint: Scalar and array keywords cannot be mixed
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
