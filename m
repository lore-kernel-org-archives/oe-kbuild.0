Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDB70823
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870528; cv=none; b=RXELTn9z0E0c22yHQAB63E+1F+/OSBtEo3mGK+hWj7JXtRBbCS9mX40p8NAlBMTT0eTTebKLjqem5ArcVmZbiQUS+5OYz3VCOR8fE3xW4ek2aCjdjO1Bpd2wOEl+t3iaXMCrL/Y4TRkz9cPSRb6ahbpXyIUsK2ofclp8fkHd3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870528; c=relaxed/simple;
	bh=+9mYyRinc9Cusa5ZGJQqEZxQNLgncliTsi9X6ia76H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPOEHeI1g6/VpwwokAOoP1G20KfRZZkLxONdXwPI77mW9L7aL0Gu3P+JM+dm/PkSJLaV/U/AF4s9ZNt/4g/BYzE/fXH42J0C2/Ow0zhLYjAVA85d9vQbPR/6weqNTjCXhxteptDEneon+9A+SkXPhgRD1bq9PpIESeb5c2v94vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5nEfn2g; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5nEfn2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758870526; x=1790406526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9mYyRinc9Cusa5ZGJQqEZxQNLgncliTsi9X6ia76H8=;
  b=E5nEfn2g4rMZSGtRkzi1Jk/RmAhBzPwd2tqSlwceDbMc0Dkyi9BBh60x
   IAtgDFNc+fJhhL70E6M3rlFoA8p9gVUXqlyo05GkGeGaa13aUCasfFHBg
   SLQROfWfOPynXLgcgHmvY6EJdnWcHvinHGmR9HpiFaYPPXD/sp6M7xdFn
   Mktl1AxIu+bqzVuPkSCrFFGiPJ8BNoKXR8XKRe3qL0UZwPi5SfUDKIGgE
   gjxrFp6ViuLI0Br5/ejtXemRPC6lAsY8/fagurUIBebq06gAJJaScbzu9
   FpjblBYN9WDz/9zsciC/nOgZZdQbuwjGfGfq/d+IYPuhQ+EQpMxMM+TLi
   w==;
X-CSE-ConnectionGUID: AI9u6hYyRw+WSv0vw6GBMg==
X-CSE-MsgGUID: Iaf58cjfRoaygS1kIF9vdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61120062"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="61120062"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 00:08:46 -0700
X-CSE-ConnectionGUID: GJrpwFIdSgqXGhQOPY41Bw==
X-CSE-MsgGUID: hW/2sz4AQO+ruU8KfJHoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="208466206"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2025 00:08:45 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v22ZP-0000000059d-01Tj;
	Fri, 26 Sep 2025 07:08:43 +0000
Date: Fri, 26 Sep 2025 09:08:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Huawei MateBook E
 2019
Message-ID: <202509260935.vJ9BKgI0-lkp@intel.com>
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
In-Reply-To: <20250925040246.8454-3-newwheatzjz@zohomail.com>
References: <20250925040246.8454-3-newwheatzjz@zohomail.com>
TO: Jingzhou Zhu <newwheatzjz@zohomail.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jingzhou Zhu <newwheatzjz@zohomail.com>

Hi Jingzhou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250924]
[cannot apply to robh/for-next v6.17-rc7 v6.17-rc6 v6.17-rc5 linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingzhou-Zhu/dt-bindings-arm-qcom-Document-Huawei-MateBook-E-2019/20250925-120441
base:   next-20250924
patch link:    https://lore.kernel.org/r/20250925040246.8454-3-newwheatzjz%40zohomail.com
patch subject: [PATCH 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2051-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260935.vJ9BKgI0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2d6ce5148cf144ab800116e1f75a5d007e82cf58)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260935.vJ9BKgI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509260935.vJ9BKgI0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4722.27-4775.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4796.27-4849.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: pinctrl@3400000 (qcom,sdm845-pinctrl): i2c5-hid-active-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-up', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: rsc@179c0000 (qcom,sdm845-rpmh-apps-rsc): regulators-0:smps4: Unevaluated properties are not allowed ('enable-active-high' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dtb: regulators-0 (qcom,pm8998-rpmh-regulators): smps4: Unevaluated properties are not allowed ('enable-active-high' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
