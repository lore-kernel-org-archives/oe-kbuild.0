Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815623EA84
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655813; cv=none; b=RV+aOuA0ZocymIYsniNolncGIiAiAFUjd5/+NczOxSVz6DT14vU6yc/P5UiDxKmAt5/4F/IqtYyONiLgyY7nqQmGuxrlgxNMn/OMxDuZQkObX9chYE0x4lgUahIL/yD0xKEFOAJNl+xuUFt9oqrRqq3GB7o9JKJgmdV6uOxVXmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655813; c=relaxed/simple;
	bh=8QD4vq9P3orfqQcaPFC+lrQTP16c8ZWGxLQ8e7HHg5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJk91IaqLuqbV+lhzcKRLza7X7qeWBffjArLAIkPr7eG86oHuWdTs/r+F4I1a1YMBlcYl1Rj1ubqYH8pASPIDDmUiIrOzpaMkQxzhlvCQARxGOTZszZQ3b6clFTjPjao1iJHx8h1Zc9OMUFIRMFlSi8JBWvGf0Rn5fC4Gki+qj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/di4GWR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/di4GWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779655811; x=1811191811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8QD4vq9P3orfqQcaPFC+lrQTP16c8ZWGxLQ8e7HHg5o=;
  b=R/di4GWRrfk/Kwd4X1KF/DJBpCXFzZqO/dUT7d0FalaDGAKqOlkYYz+e
   g1CcXzHjM1IH7Sm9llzbDJySpzksuxSWxsz6LeDkX+c5dAgBEFaOss7yZ
   CfopD0vyH2nTu5psg8zwqk4lzcxld+b18kQp54ZjUDjXjsPRWR3RMElXF
   UnvV8UL/53RYG1Pp7oUsI4jCM1TQa15m0q8T4AM5U0Deb2ip1vVOCMiUO
   7ZW0y44MK8h5P+5/D8B/pPt9GFuICLuFo/f2qkcbWJ0iEo9lK/8UksaCD
   czerPsRynzWSDECYoTwJA9bECnnT3dJmxxcf+v6n9+nZcc2osW3F9hXAY
   w==;
X-CSE-ConnectionGUID: UdEBOwLBRM2Yoe7K6gleCw==
X-CSE-MsgGUID: nNdwGQktTn2NNWmtuyqLJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80522175"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80522175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 13:50:11 -0700
X-CSE-ConnectionGUID: 8hDnzDpyTr6NLBD+J8c36A==
X-CSE-MsgGUID: eBY32UTAT4Cqgeh52XOO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="238848921"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 13:50:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRFlv-00000000C2z-2u2I;
	Sun, 24 May 2026 20:50:07 +0000
Date: Sun, 24 May 2026 22:49:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
Message-ID: <202605242219.N7lgQ6wn-lkp@intel.com>
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
In-Reply-To: <20260502063518.15153-1-daniel@quora.org>
References: <20260502063518.15153-1-daniel@quora.org>
TO: Daniel J Blueman <daniel@quora.org>
TO: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Hans de Goede <hansg@kernel.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
CC: Maya Matuszczyk <maccraft123mc@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
CC: Daniel J Blueman <daniel@quora.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-J-Blueman/arm64-dts-qcom-slim7x-Add-Embedded-Controller-node/20260511-071707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260502063518.15153-1-daniel%40quora.org
patch subject: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2055-20260524 (https://download.01.org/0day-ci/archive/20260524/202605242219.N7lgQ6wn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242219.N7lgQ6wn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605242219.N7lgQ6wn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,hamoa-crd-ec']
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,hamoa-crd-ec']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
