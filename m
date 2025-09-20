Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67D208D0
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758400171; cv=none; b=H3P30uWqjOHg/SBEisukugGSknU/Q/KGdDHYQgH62RavRy9XL34mbSf+MulxtDEq5l1zilWPeIGzwbo2vLAVCaKdg0NzO0rj7B7Vq/4GYPwQb8vf0c65H1kGTptsM7mTUTQKyJI3WLCXXE6ZWC4/6fD66PYJkkwOkB0LV0gJSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758400171; c=relaxed/simple;
	bh=4FUZbHlSWUAf+s2mxX1slq4ecFfgdwR9fT2Hootr6LM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q66VhmbxWY7i1uBtHGAXA19j9dccipKFi7RCvuQ4hZ3SKyPlNpIwCu5uJusb8B7sVoNLB6dAPJVUtcKwcbzC6cS5AIUXYdgg3orGKQ52CyJLgRuSVi5JVqA+OPtSzKsiUm/RSZzfrd48HbctbScrYT8yTzftnCMIemU9/MExcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAp+h1LU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAp+h1LU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758400170; x=1789936170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4FUZbHlSWUAf+s2mxX1slq4ecFfgdwR9fT2Hootr6LM=;
  b=QAp+h1LUTgNwNqNLpPHGoq4RnnU/9ckJlj4T3aJ+ls0MDocoj4djqAyH
   /v9dQKpuzY3CY9T2KYyOu4K89QP0PT7NLTtNnUnZmHyib5vWyVqjp8UTc
   V78Vvg+BYNskkM7oIHXs/Smt7EOLbJ/18LcQJG5mHO9eE9xk4ClT6d3PC
   XBC1rXuN5fbfDHogO/dJXY4WGME/Ix7vRGV1v0ku+K7eqLZvNVh5SJDE/
   TGJK91b+plhWNkOu+DcGnk1Wpb0qpxwtio4WepfpWw9zXlZzKxCbprNY7
   v3jUCYiSQvzld/YXD1uCkFxqrDOIkXsaA0s3pr4awuDWyu1YtODab94L5
   g==;
X-CSE-ConnectionGUID: XFxYJWtmQGKf4oMFdbim3Q==
X-CSE-MsgGUID: rIzb8suXT+CgqnSx2NJBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60831928"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="60831928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 13:29:29 -0700
X-CSE-ConnectionGUID: 9sHnWItdTeyVZzePMYpgGA==
X-CSE-MsgGUID: 8mlWXiMkSS22ZWEaEZDJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="175271054"
Received: from lkp-server01.sh.intel.com (HELO 7f63209e7e66) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Sep 2025 13:29:28 -0700
Received: from kbuild by 7f63209e7e66 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v04Cz-00006N-20;
	Sat, 20 Sep 2025 20:29:25 +0000
Date: Sun, 21 Sep 2025 04:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 246/265]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci):
 clock-names: ['ahb', 'cci'] is too short
Message-ID: <202509210455.tEUf9GCf-lkp@intel.com>
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
TO: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: e645096d1f6dadcead09c722a3fbc6c44a45fece [246/265] arm64: dts: qcom: qcm2290: Add CCI node
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250919 (https://download.01.org/0day-ci/archive/20250921/202509210455.tEUf9GCf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210455.tEUf9GCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509210455.tEUf9GCf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1891.27-1964.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1849.11-1859.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clock-names: ['ahb', 'cci'] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clocks: [[29, 62], [29, 29]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcm2290-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/cci@5c1b000: failed to match any schema with compatible: ['qcom,qcm2290-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/video-codec@5a00000: failed to match any schema with compatible: ['qcom,qcm2290-venus']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
