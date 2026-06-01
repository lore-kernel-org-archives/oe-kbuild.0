Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85A371D1F
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315098; cv=none; b=qYPa94hDQHZwIskwA4S9HnUVdFh+Pi2FFwKByoMVorLsZrtru7R0gJbdtZGVmI15NP42qboGn6MffVhXtUdswi6FGpvGEf6s0FDey/7PFZFeetnXJyKs57h9KehD7ZoT2AWMsQDD5NwUS6m2yN+DfMLokUUPvM35H3YwZzSWO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315098; c=relaxed/simple;
	bh=AOKCj1icAFzjn3Qt8cRGPjFG+7SbaVFQuvNd8Ud3Oco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYDY/smBYvJJp5CtS9yVc3PRR+oFly87S8mmzpgMEzV5hEKtQpmFSrLrcSN65nxa6kr2r6/n2AJniAtiEvkKDV7zqurW4SchB8OD/YQ4STVnHCQvfprAm7iE8vv3LvSkQowcV4WLDXy+nTS0UNth/8hXQXNxFgPbVJACH0L08N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHi4ymDG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHi4ymDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780315096; x=1811851096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOKCj1icAFzjn3Qt8cRGPjFG+7SbaVFQuvNd8Ud3Oco=;
  b=fHi4ymDGKFPdGICtPtQAlOrlB76P5O4BsyCOa9jUmcZpFVI1qEcFhmd1
   yEhZYQywUKd694GVvv/oZYJy94o2qUKzKo2QVWcXbM4CtzMSaMp0iyj1b
   dbakq9eiFdmxr+skHukBddnaXP05v4Xd/SmYOMpe+lKVnjNBuDSU2hIKA
   vSGvNLeQBF0HRxabubAYkzhuOBGsYdJHkaluOcfdiLZ1ZLJgcRPaEoQqE
   DFY6a+lmTNJbIgtD+cpEn4HBv025yA3zjzfw7Q686/SD3VU/ISBbUDkid
   hWzgBNLsVtZzG/VYYMSHCUcNG9cD0UiKkG9jshzVoAAPUw1C5ccTdU0Tw
   g==;
X-CSE-ConnectionGUID: WLSDZW1+TEmKHY8KDgkENw==
X-CSE-MsgGUID: 6oxayEGASiaJmgmeLG9Ivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84928626"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="84928626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:58:15 -0700
X-CSE-ConnectionGUID: t+L/UC4gQMyup9AyXyrDDQ==
X-CSE-MsgGUID: FbMM2GbYSaKCK54bBomsGA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jun 2026 04:58:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU1HY-000000001az-3Q14;
	Mon, 01 Jun 2026 11:58:12 +0000
Date: Mon, 1 Jun 2026 13:57:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
Message-ID: <202606011335.siYtGoxh-lkp@intel.com>
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
In-Reply-To: <20260601041336.9497-2-daniel@quora.org>
References: <20260601041336.9497-2-daniel@quora.org>
TO: Daniel J Blueman <daniel@quora.org>
TO: "Bryan O'Donoghue" <bod@kernel.org>
TO: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
TO: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Daniel J Blueman <daniel@quora.org>
CC: stable@vger.kernel.org

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on next-20260529]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-J-Blueman/arm64-dts-qcom-hamoa-Reserve-low-IOVA-range-for-Iris/20260601-121537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260601041336.9497-2-daniel%40quora.org
patch subject: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arc-randconfig-2051-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011335.siYtGoxh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011335.siYtGoxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011335.siYtGoxh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml: properties:mediatek,audio-codec:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml: properties:mediatek,audio-codec:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml: properties:memory-region: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Firmware-loaded codec carveout'}, {'description': 'IOMMU IOVA reservation region'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
