Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C51DF98D
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947974; cv=none; b=rieMWspapKYyAQ+Dw8lyS7lOvYMTvFWg82q24x46pQ7YBq6cgu7bPaFIxMRbVyUI+l1oUbjlXb4JF330cUCvaZgICxTJy9A/PnvnnDd22+rN4G94MppCRWMOk32A2CPolDRFEdoLJpKvnIuvJKUzxNE4zjGBVkhLKiNEDnL1Ipo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947974; c=relaxed/simple;
	bh=QnM3/8jLmPEtGOF3IMrMgxJMf0cxRgceVIS1D+7hos8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFejQQyAYgL8jhNUDbGXI3105BDGGa6QEHISacW3klj49CzW56wEdi5lozFRr6KFNDWZw28wszsOt4mUdGrvBm08JrtCUNfO/Bx30QgCCDCWxQ+/S0KcYXhlHCGiBjNAMmBSwu7Q1Ryb7gNZcA22QVw8P1e9mnUkK3UQpx5tPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaWatBOT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaWatBOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741947972; x=1773483972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnM3/8jLmPEtGOF3IMrMgxJMf0cxRgceVIS1D+7hos8=;
  b=jaWatBOTdSf0b9AhhQWgGiiDdt2EYrlM9DikAvGbHgae95MWeFYQ0iSU
   ZlhqgqYUAbLujyzMgF0VE5nQXSMYrI0XWAjHIP/v/6M0FDpsTdG3YQvTL
   J6BD9paQ7zNYak+y/2fIl2Pu5kh2GiED96/HsUyHoDgFSALb0Zp1UlLJc
   bXS177jk1Iy28b4fmTua2eOhv7KDX2dyl/MO+0/U+0f8nJ4ygvtk8R7en
   dRbfbLTJO5QhEewN326eT8RJr85k6ko9JO8Qtm+kq9RmfS6BIutG/WWD7
   8dOgL4087g0ZhonqSygl+bGXxiZjSQzd96ALAywUbDaPJ7NIXSRD+lhlk
   A==;
X-CSE-ConnectionGUID: 0ENH7YE3QaijA1OFcyCZzQ==
X-CSE-MsgGUID: k8/o/xIDQe+EfC7G6qQfjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60633557"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60633557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 03:26:11 -0700
X-CSE-ConnectionGUID: ubQbOsk2ROWee4mtEUm13Q==
X-CSE-MsgGUID: wj3wS9dvSweONpltco0gqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="158380955"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2025 03:26:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt2Ey-000AKy-19;
	Fri, 14 Mar 2025 10:26:08 +0000
Date: Fri, 14 Mar 2025 18:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-ginkgo
Message-ID: <202503141829.ludI9lKl-lkp@intel.com>
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
In-Reply-To: <20250311003353.8250-3-semfault@disroot.org>
References: <20250311003353.8250-3-semfault@disroot.org>
TO: Gabriel Gonzales <semfault@disroot.org>
CC: Gabriel Gonzales <semfault@disroot.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Kees Cook <kees@kernel.org>
CC: Tony Luck <tony.luck@intel.com>
CC: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org

Hi Gabriel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc6 next-20250314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Gonzales/dt-bindings-arm-qcom-Add-Xiaomi-Redmi-Note-8/20250311-083731
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250311003353.8250-3-semfault%40disroot.org
patch subject: [PATCH v3 2/2] arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250313 (https://download.01.org/0day-ci/archive/20250314/202503141829.ludI9lKl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141829.ludI9lKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503141829.ludI9lKl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1321.27-1387.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1279.11-1289.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: /: qcom,msm-id:0: [394] is too short
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
