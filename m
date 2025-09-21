Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568E2F56
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758444219; cv=none; b=T6jc2ycvu8vGerhTErmr1q68RCbqurypq7OL0+tohJU3B7fUMqA3mvbw60bnQiCEb7D6UE+37FOFrLiVC7j3L2anh0i+6eSRClMIoOQLJ1pS5Gg0rBy6FuEleuzSWHmSWbP0GTcfxZJqYg913vxTCVYL9dod8PXO+B4tTnTfg/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758444219; c=relaxed/simple;
	bh=Am5L2utOnsKx1KbGfd1SB2HN8Qbvu4ZH3UAf5OiSrFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeSBSVwtFp0ier2z6KUG3HptGKQI3N2Tg0xp9nUPPnkcF2n7SM9FjXCuLimRpqqBqwwe/vGVt2BukWSqyE/1fjZtXxlG7s6TQIr4pOhoGu0jb7TnhvE1ET1BKaru2KHwUNjdBG23T+/DJkdSSDkmCH70Tqpq4JGWpSL7N6HXEZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBtqebk4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBtqebk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758444218; x=1789980218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Am5L2utOnsKx1KbGfd1SB2HN8Qbvu4ZH3UAf5OiSrFw=;
  b=VBtqebk4Z6qylHngDBmuD+BxosvEoqB7mGM0fKD66QfIm679UbTwBeXw
   wX17eUj8DdxKohs6n+5+RcF4jdT8uUBZx6miTB1o5gxYUXsG1ta3/0P/X
   b0+PkoIqQtuQwE+e/mNmXXQmg57FTDFlDqJr8KDixDAN3LypWYgk2tbF9
   RsIVkBW+YvHrfdJxOtTfmETOE/rCNtDzVhDiYTyQgIaoNFItK1M1Ehiko
   YnxHkaeLQKOOdw2241x+/OMkemsEUdx6JlbZ95gFC9dLHu/sm3jMWXI7d
   vHGVX/OMb4MtkojyoMFJQG1CuGfzX85AgiExgAaTOBkcYQTwFYthdcvqE
   Q==;
X-CSE-ConnectionGUID: 5+oKen5rSuSVWFd6459+gQ==
X-CSE-MsgGUID: +1frXu1PR5SHKEe0Ljcecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60663356"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="60663356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 01:43:37 -0700
X-CSE-ConnectionGUID: k9cJs9XZThG/zi7ITm1TbQ==
X-CSE-MsgGUID: VrJQytnjSTWTGLlzCcSJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="177029598"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2025 01:43:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0FfL-0000bb-26;
	Sun, 21 Sep 2025 08:43:28 +0000
Date: Sun, 21 Sep 2025 16:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 259/265]
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509211635.mHy4mmNq-lkp@intel.com>
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
TO: Yijie Yang <yijie.yang@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: c11645afb0e228546279ad1b74826fffbfebbc7f [259/265] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
:::::: branch date: 30 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211635.mHy4mmNq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211635.mHy4mmNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211635.mHy4mmNq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: video-codec@aa00000 (qcom,x1e80100-iris): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-iris', 'qcom,sm8550-iris'] is too long
   	'qcom,x1e80100-iris' is not one of ['qcom,sa8775p-iris']
   	'qcom,x1e80100-iris' is not one of ['qcom,qcs8300-iris', 'qcom,sm8550-iris', 'qcom,sm8650-iris']
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,x1e80100-iris', 'qcom,sm8550-iris']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
