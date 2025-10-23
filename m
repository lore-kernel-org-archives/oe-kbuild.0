Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111EF2FE06C
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213538; cv=none; b=bhtf0ozoP/FLLNX5cd3g4XT0+25FW2b3bWhnELPrgqfUX+uU7hdF6vCPwD4fSt5JFNZRsTnTO3HijrdCnid5GarShigw40XAlOhHuz4DtAUkdXRF/PRNOUcnNm4/3r6CLEmAzOohf/h9S0K6Gn7/3oTKGSruwfXmf6uU1Szy7ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213538; c=relaxed/simple;
	bh=03TLApzgK6jObZo04e0qi/SMQcYSIzNv8MDPGlPLLGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0+nxp80rX/WiNDpnaoyi6Sw3/XM0y+vVuKHNQ5aIjRnUeNMalD/Z9Yp7/eVYpCMfodvPQvWWZKDBJ83LUrzoMWveauEahXo70iBMGA/83Kb46vDWG9jDCywcun8aBtqUxT5R7zT2UQuYHxYB4w5R+e8lLNXWDE4yuF7UOl8aN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTmw5C0T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTmw5C0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761213537; x=1792749537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03TLApzgK6jObZo04e0qi/SMQcYSIzNv8MDPGlPLLGw=;
  b=VTmw5C0TW0zAZsJYG3L0g/xpiwo6DjPX+coE2Y9sL/hzffDza9UygNK+
   0thV+d+Ux9eXhx/LsypoLkl/H/kx9GFGXZA/AJYobAMY13sV7o6COmlCp
   tngqavM/uCbh0EJWtgEl4HdTDsSAxvoTKO+fHjHAYo4fH1jvGp6EVGxpQ
   5gt9LBI3SVPMMDSOTvdZOuydAgCpOlGzQ3cVK6zNxR4D63f0nU0s9l8bA
   JiE7e0ofvCq2zCx6lonEFDyxzhaKwZc4LAF0I488T2236P+281escYWKt
   QJ7pejAlL84X2r3WAK8ruKh7Nj88evNYtLvq/icKJHif18fL3qqJEMWXT
   w==;
X-CSE-ConnectionGUID: 5KpboD7fQpCm8826TzXkcA==
X-CSE-MsgGUID: IYAGw7JPTDaOjF2xew8+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63271636"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63271636"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:58:56 -0700
X-CSE-ConnectionGUID: la0zcxKXQe+1pN3XSo3zDg==
X-CSE-MsgGUID: DCCw7zNYQiGqLKWcs1Gj5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184010776"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 02:58:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBs5j-000DKf-2f;
	Thu, 23 Oct 2025 09:58:46 +0000
Date: Thu, 23 Oct 2025 17:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with DT
 bindings
Message-ID: <202510231732.P4mUZVOB-lkp@intel.com>
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
In-Reply-To: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
References: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/arm64-dts-toshiba-tmpv7708-Align-node-names-with-DT-bindings/20251022-214637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022133616.74492-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-052-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231732.P4mUZVOB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231732.P4mUZVOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510231732.P4mUZVOB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
