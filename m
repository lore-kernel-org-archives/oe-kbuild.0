Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E7823A989
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 02:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372036; cv=none; b=rGmcpsBmRZzdNfyXqMT1/m+ADf6rJ/r3CIj1qAhelX83YdqyvJc17Ly9M6qoS0pYLV9AvYGLxSDU8AM30O+1jgc36G+m/x5o8G6tja7o20VxRXcTFxAXWIk4m8UP3VRmZ++TYew/kt8UuLQRI6wwAaq6+FH/1+eEhBEoV8oft84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372036; c=relaxed/simple;
	bh=3ONl+JLWIG4Zj9+SlDJBBkaSv9Ino0gH68mse5Gax5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcoPy7MYqb6sqxOy2gC/+1tgDWu4sFKIGhXKwbxafTYxM4yD4XqVOSQo2uX/Q/D1Uj8vdp2tyJsdCAkocdq06Ht/QEsfK01MuwWwY+g3YGIMTI3ALkmhMNSK5OMlaCrt7Dwj8U+QAsCvEFrF4yp8BFnNF4KaZukwa7v7z+Ly/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O75klcrC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O75klcrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759372033; x=1790908033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ONl+JLWIG4Zj9+SlDJBBkaSv9Ino0gH68mse5Gax5U=;
  b=O75klcrC/uWoC/uUSeC/Ul/U9scAWtu/uZ0beTRN9GaFOIIsCG6EWyfd
   yBYz3IhpelvXbVbdJi+QVZohrDr7MJoGU4Hq5tyEmFFXQA15PUZTFpAgS
   KI0mM61MQ21pftq++6TMg0QXDIl34qucdP2pzfcUQCzaYe1WlN7ZRQADp
   9gLBt0XF+kBvFyktWtZzdSsh4erLLumteeda2tFY37C49tBzv1YCvXtIi
   8GPROWSnJhhgyGU90xYr4tz4TP0oTi3XRCEDBvQ9eMzcvEKO8WY6C5xr8
   F6cZmipuyAc/HU7c5SAuloPm4sVaXHNulorW864Z/NNCDTnSHS/pUfx7J
   g==;
X-CSE-ConnectionGUID: 9nFHQG85QOaC/pgza0wn+Q==
X-CSE-MsgGUID: p3ae7wv7TNiXKdlFT5lEOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61697757"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="61697757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 19:27:13 -0700
X-CSE-ConnectionGUID: CpASZv3wTjGHWNGMVB6JHw==
X-CSE-MsgGUID: W+eMvtA7R6a8RPVqdMe0nA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2025 19:27:12 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v492D-0003W7-2o;
	Thu, 02 Oct 2025 02:27:09 +0000
Date: Thu, 2 Oct 2025 10:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
Message-ID: <202510021005.n6bu52OT-lkp@intel.com>
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
In-Reply-To: <20250930132556.266434-3-xerikasxx@gmail.com>
References: <20250930132556.266434-3-xerikasxx@gmail.com>
TO: Erikas Bitovtas <xerikasxx@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Erikas Bitovtas <xerikasxx@gmail.com>

Hi Erikas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Erikas-Bitovtas/dt-bindings-arm-qcom-Add-Asus-ZenFone-2-Laser-Selfie/20250930-212904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250930132556.266434-3-xerikasxx%40gmail.com
patch subject: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251002 (https://download.01.org/0day-ci/archive/20251002/202510021005.n6bu52OT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021005.n6bu52OT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510021005.n6bu52OT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:1302.27-1351.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:579.26-582.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clock-names: ['iface', 'bus', 'tbu'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
>> arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dtb: iommu@1f08000 (qcom,msm8916-iommu): clocks: [[31, 129], [31, 140], [31, 175]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
