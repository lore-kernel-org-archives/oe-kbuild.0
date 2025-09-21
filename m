Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485BD4A01
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 06:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758436028; cv=none; b=i3R7E/1ihmkV5WE5lOH79KBje4fCStxpohsQ/L/QwYs1uYz/zYisC2rPz6ublJuk+XPSIxqwFMddZceuJ+FRzy7eNJDojZtiHLrfGMZ+x/x9IhFDQ34GN8afYA9qK1fqY5igEu0FtHDNNdf6Cg87yihRYjM43dwtjircaVmT+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758436028; c=relaxed/simple;
	bh=pF2seTIxIuEcDFuDLvUyMmy+YX3V6O42kAMvDXVj+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCd6EaCiHAUpU1l2/rmh+Z2SHI/8KDVLTk5MN4yjuoGBxfcxMQYfOk+XyxXNrxWtTGJ0bYI36y0hA0CpaUtdZ6EFOxaG4LixvSuhHN1xZLyooUQY2ACbYPjE79pPa0tvVKfQKvHK+u1YrjGEpeZw5dUSChJfisOf1B7ZGskNtHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRqd8veD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRqd8veD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758436026; x=1789972026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pF2seTIxIuEcDFuDLvUyMmy+YX3V6O42kAMvDXVj+bg=;
  b=WRqd8veDrqShCIjKiM9J7TTQ0Raau+5Zeo4rQhyuhCTtftzB6b6vpeE1
   L0r8CYTs0QhcRvGA1fz7S5SDQil9SwKpWbHrgk6AwwZK/urvTOXz0n1Wv
   A6sxDjHwLXtw1YMbuiXKZgz9pVeERegMttmKiHUArXGp/um3dzXonNzEv
   UlYyLTEkPdWOfwQRrHrpAbiaAUkfZcAAN89lCStmTzmGwW7al9OePLD7/
   1ModSx6PSz3Y29MHi5xblcXgXoNAMVQSeXbgPCAZoZiR7WsSJESqCezY/
   EEIXTHABETvt3iVCT0PSvghnC+z5Llhw/yW78hMuqPsxCErv1AeNvD0BP
   Q==;
X-CSE-ConnectionGUID: DVQUr+I3Ra6czyNp2/RbkA==
X-CSE-MsgGUID: VomJfR54R363wAzE0wk0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="71835061"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="71835061"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 23:27:06 -0700
X-CSE-ConnectionGUID: ++IlprbkSfGUNjB7b01sdQ==
X-CSE-MsgGUID: LuvXxjMWSq29z/GgzZfNrA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Sep 2025 23:27:04 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0DXK-0000Vr-0I;
	Sun, 21 Sep 2025 06:27:02 +0000
Date: Sun, 21 Sep 2025 14:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 238/265]
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509211439.V1ujsOpZ-lkp@intel.com>
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
TO: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: f8f7cc59dcd234f0dcc4964ff2188a7a2ae09fd6 [238/265] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211439.V1ujsOpZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211439.V1ujsOpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211439.V1ujsOpZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: video-codec@aa00000 (qcom,x1e80100-iris): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-iris', 'qcom,sm8550-iris'] is too long
   	'qcom,x1e80100-iris' is not one of ['qcom,sa8775p-iris']
   	'qcom,x1e80100-iris' is not one of ['qcom,qcs8300-iris', 'qcom,sm8550-iris', 'qcom,sm8650-iris']
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,x1e80100-iris', 'qcom,sm8550-iris']
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-iris', 'qcom,sm8550-iris'] is too long
   	'qcom,x1e80100-iris' is not one of ['qcom,sa8775p-iris']
   	'qcom,x1e80100-iris' is not one of ['qcom,qcs8300-iris', 'qcom,sm8550-iris', 'qcom,sm8650-iris']
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,x1e80100-iris', 'qcom,sm8550-iris']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
