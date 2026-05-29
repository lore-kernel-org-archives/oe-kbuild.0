Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5723D8900
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056338; cv=none; b=Sv4SDEuSKDPf6QAeChGsOX+TxpDtdb8z0DjDKGYL8N44otIp/M4hQ8h22jrucYnDzro0SutuWOE5dgAuAFzu11psU/zboB8nsCt7dLoPR89fSk/tsyVN4DJDTPzopFsl+FJHwaQh32sjP+8KY0K0NoGea/Bn01NX5umnL3DFDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056338; c=relaxed/simple;
	bh=jPeUvxOK4yOfovJEmsf1+GqQUWFEEL2gWVWL2iB67UY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARqL0oiPciIoRcwDf3YbHiTJZr9TmDBoxrveM158xAEUJT4ydjgDsrysK9OMAOG4Gm2kMAUS50ufrNyoiRbEnRjjnsVOWjEzJ5ADXO/bsM+fvUCh9v2aRxAa4OlRzSmoCTlPqe57wZGlYOcf1Xp+0UiJKuVkWYxJ7DYDT9CCIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6XAeltB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6XAeltB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780056338; x=1811592338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPeUvxOK4yOfovJEmsf1+GqQUWFEEL2gWVWL2iB67UY=;
  b=a6XAeltBVcRHOaFeBrgoiq0nPm/GbEHtoYWfOrDevkNt4RPepy/XXOVP
   5P5eSA8aqtN9yPdXrH70k0QDL6v/0dd0prjHF3FlGyXPjUYn7CN4QAubI
   gii4kiZhxA9qc9OzKGQOpRVB63omqxtbbw099xO/lsIH1L/x/btDTgJ5H
   K46j9N78fRJvYiY20U6rxHMLT35wV5OFf0wfP/I8hKaoWtcxM83K9SJUG
   /Ai8KAMCRJTc6fJNXcAkWG8gG8dEC2hfDeo6S5m428KbxF0q37F6av3fs
   fUd3ovJJsFVSvQANlRXPLmlGREWBPXazgvBZgVvTAX+bH8IPKobuVtcA9
   A==;
X-CSE-ConnectionGUID: n8Y0kfwBStOgmn2eHz70hg==
X-CSE-MsgGUID: yVowbaVKSeuu94RAX0yFqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84793381"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="84793381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 05:05:38 -0700
X-CSE-ConnectionGUID: /tZEafCpRJ6MdHU1C523zA==
X-CSE-MsgGUID: jR9/EI8rT1WdEjmcE9+X8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247773278"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 05:05:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSvy1-000000000sr-3Nvx;
	Fri, 29 May 2026 12:05:33 +0000
Date: Fri, 29 May 2026 14:05:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
Message-ID: <202605291318.U3RydFkH-lkp@intel.com>
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
In-Reply-To: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
References: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
TO: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Rudraksha Gupta <guptarud@gmail.com>

Hi Rudraksha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3131ff5a117498bb4b9db3a238bb311cbf8383ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Rudraksha-Gupta-via-B4-Relay/ARM-dts-qcom-msm8960-expressatt-Add-coreriver-tc360-touchkey/20260528-101603
base:   3131ff5a117498bb4b9db3a238bb311cbf8383ce
patch link:    https://lore.kernel.org/r/20260527-expressatt-touchkey-v2-1-049dca41fc3a%40gmail.com
patch subject: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-2051-20260528 (https://download.01.org/0day-ci/archive/20260529/202605291318.U3RydFkH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291318.U3RydFkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605291318.U3RydFkH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): $nodename:0: 'i2c-gpio-touchkey' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
