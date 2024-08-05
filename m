Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12114A639
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844981; cv=none; b=lQVFTMTpM2mD/euU0fusXIxEMKQEGED05YtkBTiP+cYd1gSaApDTdrea2BYabhPSy+2Cco7ZeRwr39jv+0ViwiQ6yohF8qm1eIP4xzis2wMYO1FBU9Z/ZkT6eSJs0uSyGozNRDIiliOil80G78E+RxRw3wcsrz6FXz9YBLD3uB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844981; c=relaxed/simple;
	bh=z8EVrGggflWwzaPSmKrzTtr7fcPF1ABOjwKLwIJeQqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTyERPKDd+s085G3wKs2opr24v7yqMwE6cL+vtsa+Xh+pm62v1ZHy+7qBbP/mNwMI5HgWROibt378adCKMnntOZLgoBToeMNd/kICCzJleeGuqmAOiZqfSvCyzQ7k20CQWTVOiJ2sBG0hUxDDrgx1OK+LApziskrlXOyQAyYlpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgbloXRp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgbloXRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722844979; x=1754380979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8EVrGggflWwzaPSmKrzTtr7fcPF1ABOjwKLwIJeQqc=;
  b=UgbloXRpmxx/ef050x5DKA8EQhH2RTAq5Cx9wxDleg01Jnzl4Fit2sTc
   W1xl/S0h78oKztAAASdmhLgEOdZORReW8L7WNWM3LaR72OId/1mk1Y2YH
   DnanaZW1LXizjkylDkgXNGs8oXdHtBCAg/5SYWRIXOZ1XxmO19GOm8WCR
   +lTE8c3MwnBZ8pkzCSgFKsHKLxDBBBsBufzACXkd/hvVPodSezJ4Ul/pF
   jQIBUAR9nWDqBXoMHua6mxvVQ0UxPn+ejkg8k/PLHNTDviowul0L5cGHS
   1dc8Qr5xwa9yr5pbpzNNfvK4GuFNcfCV6EQI4/bsldlZ+sjI+x+RPNXmF
   Q==;
X-CSE-ConnectionGUID: +jiiui4yRbKBYnIqXZjYsA==
X-CSE-MsgGUID: WvDRGuOVT8yc1Zr+3Fds0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="38251397"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="38251397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 01:02:59 -0700
X-CSE-ConnectionGUID: oDz9nu/SS0CkClLREYPDwQ==
X-CSE-MsgGUID: 4+aLe/rDR/2C2WPH+gyZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56001062"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2024 01:02:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sasgB-0001oV-21;
	Mon, 05 Aug 2024 08:02:55 +0000
Date: Mon, 5 Aug 2024 16:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add
 initial device tree
Message-ID: <202408051538.Fp6etXeZ-lkp@intel.com>
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
In-Reply-To: <20240802080701.3643-3-linmengbo06890@proton.me>
References: <20240802080701.3643-3-linmengbo06890@proton.me>
TO: "Lin, Meng-Bo" <linmengbo06890@proton.me>
TO: linux-kernel@vger.kernel.org
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Stephan Gerhold <stephan@gerhold.net>
CC: Nikita Travkin <nikita@trvn.ru>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht

Hi Meng-Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lin-Meng-Bo/dt-bindings-qcom-Document-samsung-j3ltetw/20240803-082759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240802080701.3643-3-linmengbo06890%40proton.me
patch subject: [PATCH 2/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240805/202408051538.Fp6etXeZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051538.Fp6etXeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408051538.Fp6etXeZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
