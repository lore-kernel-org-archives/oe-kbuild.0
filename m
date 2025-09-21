Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58B192598
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758455504; cv=none; b=JF2k14yLw9t18umTZCtLoyXzzbuRo7IZhmcbe7vxK1vtgoAn1Htcskl4LYXGSWcNMjp8EkklQG6bi8CYTvELoZ7rRAheGiivsrvjUQqCbyutRTlZ+auDeeaoxh49UUIfCaESGlp8aShCf2ioLs4E5CGek6pzWdH5vJRR1ttXhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758455504; c=relaxed/simple;
	bh=9kOFjW7rWGuU56aUYuEawElbNaSHLL+P2pAW3YZ6PSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPMtVsyUbNj+4HJYmC6HrchANNexdT0mJPqYYmtSy7XiUqdPa95koLAzyOPr84z9Wa/qul8kscpq4HXWLrgXVDiivCNY7dmByHdp2VFkDkxS1nmLp/DXa0jQoWKTTf/6nYIS/wRQzRYnPJLSsbe2ZD0/GPYmjLj0QsbLBwacAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzWjK7nq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzWjK7nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758455503; x=1789991503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kOFjW7rWGuU56aUYuEawElbNaSHLL+P2pAW3YZ6PSU=;
  b=WzWjK7nq0mvSfnnVe122Ikuh93SVIgtQGU08o8br1q4y7G3oHnFp8aGm
   fa70oRf7wOZ/+X4ink6SGNhPhGe2jV1TzgnNOUKLr8wbk+/s7et6rXK2g
   QSU7UV9U8gwtD4tziFlfwQnNbDchIQI7L4or1jp366GVowtP49xTeJurW
   tk7cqyEax5mWNCIBMg74E5hFi3dXLOH4VFunUxC2s1o8d8v5hHvDikKLY
   Gz0YM7mDkrrPcwnkYeg4cmdmbKx78lK2+J0r9WiEn0LAj1shPMENSGk8m
   XgV88DU5K+8pxk2Clg1ORmG0wlO2m+oTbf7/QCWTbJyTf6axg5WoeV8Fi
   g==;
X-CSE-ConnectionGUID: 7yPeZ0AOQL6DY1aNbk7M+g==
X-CSE-MsgGUID: g39KGuDZRW2xGhqUagpu8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60897303"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60897303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 04:51:42 -0700
X-CSE-ConnectionGUID: HVHGRYArQD2ML6Z5Nq+pjQ==
X-CSE-MsgGUID: Vmk7xmdGS16crwITrf9y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="181506745"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2025 04:51:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0IbS-0000hH-11;
	Sun, 21 Sep 2025 11:51:38 +0000
Date: Sun, 21 Sep 2025 19:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 246/265]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509211933.lyudNgmO-lkp@intel.com>
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
:::::: branch date: 33 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509211933.lyudNgmO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211933.lyudNgmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211933.lyudNgmO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1891.27-1964.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1849.11-1859.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clock-names: ['ahb', 'cci'] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): clocks: [[29, 62], [29, 29]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: cci@5c1b000 (qcom,qcm2290-cci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcm2290-cci', 'qcom,msm8996-cci'] is too long
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8226-cci', 'qcom,msm8974-cci', 'qcom,msm8996-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,msm8916-cci']
   	'qcom,qcm2290-cci' is not one of ['qcom,sc7280-cci', 'qcom,sc8280xp-cci', 'qcom,sdm670-cci', 'qcom,sdm845-cci', 'qcom,sm6350-cci', 'qcom,sm8250-cci', 'qcom,sm8450-cci', 'qcom,sm8550-cci', 'qcom,sm8650-cci', 'qcom,x1e80100-cci']
   	'qcom,msm8226-cci' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/cci@5c1b000: failed to match any schema with compatible: ['qcom,qcm2290-cci', 'qcom,msm8996-cci']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/video-codec@5a00000: failed to match any schema with compatible: ['qcom,qcm2290-venus']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
