Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D963264CB
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107022; cv=none; b=n5Fd2HFmcOtr3YZdBgagbAn+CecvkivuapPVa/D2hDHeDZ5hAcdAmT/3UIPXuBLAC6z2maJAFzPjWXZ39Bu/2zQgIphRuflL8dI3Au7DuK2CGdjTRcIg/e+fwTFbMmIRn6jKKs1oR47s6U41TV0ogAOJH5H5GMizGfJd4VSmyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107022; c=relaxed/simple;
	bh=LaNzXZXIwTjjPx5VSpwlBJ9w6fgHQzWL4kpv8sHW3i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3zxOY1OtumNN7BWUH4sE1DYTjIsc0MUvkKvEZrI0CxvXdVQ8ZxS3inQpV+77bnbrTcRxCdLHlFf7lXmy3tGESRd+HkObXyVvZsiXcIGFygZLNVdEkfm7NIH5Yf7QFDmV0+LwH1bhCNU4uolRLBEiV+u+0oiJfh+yBbB6djONiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P595TjdD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P595TjdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783107021; x=1814643021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaNzXZXIwTjjPx5VSpwlBJ9w6fgHQzWL4kpv8sHW3i0=;
  b=P595TjdDcQBe117lcscVDYXMh/gYUlSQIWHFK+4HTVQu6a2QBIxtJs4L
   DpPfpsMyMggT0MuSqYycXsX1XWGCo0p6lDKZ8CeMmCrwOIjrpV9YQjQlY
   D/+nJJLFUQyG3jqBt/MhoOTuisxepcSDOG1JcnXeJh+U09P1aKawqw+/5
   n+SCZsVXDGJ/PFjKiEpSNFcATWwz04vZXi8/2zy761ae8rMJDbNNIdW6K
   vxind/6UQP38Li7G8OtKs4w6EPU66a8Kb6PzkOhRDUQyGhnmHleBpNfbD
   BJIC/Pt2pRSUWxBAvppt61sdVpdb4WezpRGr0fRxXe0O2YC+ElPE1EMWm
   A==;
X-CSE-ConnectionGUID: Ng/AY8IzR4WHosywpd2t2g==
X-CSE-MsgGUID: 25srP2yQQI6lh9S0J3lndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94217048"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94217048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 12:30:20 -0700
X-CSE-ConnectionGUID: LPAUlEnIS2yjcRj8vIlbrA==
X-CSE-MsgGUID: zXEGGzE7ROK/hpMPLmJfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252113624"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2026 12:30:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfjab-000000001ZN-3IaR;
	Fri, 03 Jul 2026 19:30:17 +0000
Date: Fri, 3 Jul 2026 21:29:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
Message-ID: <202607032107.RMly13RH-lkp@intel.com>
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
In-Reply-To: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
TO: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Luca Weiss <luca.weiss@fairphone.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: mohammad.rafi.shaik@oss.qualcomm.com
CC: ajay.nandam@oss.qualcomm.com

Hi Ravi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravi-Hothi/dt-bindings-pinctrl-qcom-milos-lpass-lpi-pinctrl-Add-Eliza-pinctrl/20260703-153450
base:   7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
patch link:    https://lore.kernel.org/r/20260703073029.2588960-3-ravi.hothi%40oss.qualcomm.com
patch subject: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-2052-20260703 (https://download.01.org/0day-ci/archive/20260703/202607032107.RMly13RH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607032107.RMly13RH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
   	hint: Use 'enum' rather than 'oneOf' + 'const' entries
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
