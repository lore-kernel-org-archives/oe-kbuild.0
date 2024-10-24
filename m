Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821EB12D1F1
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810830; cv=none; b=YY5/EQcYsve4Q1eGZgC1Nsgtmy4R0W31st4LHHIgXg1xmBQ65HvqWkJ15RtGtecFcrE5IktWTBVUgFQQ44hP3+E7aRa3aN8m1P2pGMg0JDfQst6+7O8R2INbAYCyANpDnV76lrVRNI8jGD4N1grdeprL/Knlwn0PKgXawJrLF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810830; c=relaxed/simple;
	bh=ScOXpNG+L6uu0Ih/uBSaR/tDEyEuf7eTwIjaSHciOBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtcYYUbHArD4NcmWdF+sV6hAs8ZEJhvNMRF1TZIqBxYBU3if0VTF+Xgg214rjfWiTaS9lXa+x0I3ddopJZkDE2swIITtYUgt+MBcMQfrJxSd2pewAVcPg6QL1ywHor4DIueQ9nU6jHUzP6GKumZGXf6usXWsuMQG5jnx4jIOhZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE4fMBYH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE4fMBYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729810828; x=1761346828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScOXpNG+L6uu0Ih/uBSaR/tDEyEuf7eTwIjaSHciOBE=;
  b=WE4fMBYHIbr7MbPL5a0ARMpeDFxQO4mff2YG42+0BbIk88sZrLKB70Q4
   /OX9IunhzMaboXqFazwOoG6UDLgDj+c4aPhurlPjjnvr2KjURxAy502mv
   Xrge5GJuzkDwaBpmaZd6SrmtaZPxPpm018hfKZKBQyFB4H0q7A0BuKT2C
   8sLVcovw1FY9lr/2dkO78plxAZYrZ77nNia8Tk3EsnIHcW2rtay0zGwm+
   2Wxi4MiC4jBWuCksAo3pr044xh3x2cG57sCKJCT5QQtAl5CYdMRJBoS2t
   UYf92Bh4BQBQKkcEWarCdYNGnMz7RNLvMKaQBrRveGsOUMec2qFNRpkPw
   w==;
X-CSE-ConnectionGUID: m/gOuNXTT3yHrKqcdQPUrQ==
X-CSE-MsgGUID: nx/gA3ZlRXOpkXB0Mrn6GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40578475"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40578475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 16:00:27 -0700
X-CSE-ConnectionGUID: s5xz/TgKR7OKymCLxE8Ijw==
X-CSE-MsgGUID: gXXrQwWiSq+xAafZxxiveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80646696"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2024 16:00:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t46oa-000XFW-13;
	Thu, 24 Oct 2024 23:00:24 +0000
Date: Fri, 25 Oct 2024 06:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.13 74/99]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth: 'vddwlcx-supply' is a
 required property
Message-ID: <202410250636.IUyjQbXH-lkp@intel.com>
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
TO: Miaoqing Pan <quic_miaoqing@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.13
head:   267643b3e3a4e6cb7996da77f6d7f89ed8f5d554
commit: 7b3e9ac60da7db51394889f8bf92d26b57845f4e [74/99] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250636.IUyjQbXH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250636.IUyjQbXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410250636.IUyjQbXH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
