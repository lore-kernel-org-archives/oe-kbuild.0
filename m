Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF017A30E
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Mar 2025 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741506150; cv=none; b=PA2ChVxzt5UvTKM6nA4h6e2H4kv1owPwcvXakOAuQI8DKUt3jViXzHmemI8WO2Js6ZTB0BFKdzZkvrTFJO/m3Jv6LQg04S8CRDAFIYoorf3G6U114Ce2Ve8qe/HFQRi22gk1duVmfnGpmW11E0XTUZBEZABBJU8LY0P1Z3+WShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741506150; c=relaxed/simple;
	bh=IGzCitWlPd51Z8medWpLOxhUmsoeLeGV9ZlBbWPVOtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjmB4C3djq6xLjdpN/SAsgvqxNKLW99EAelVR4P88X5pBJdfLLsDtgKN1rt2L66XULBBoq/qtyNFUO9p/TGHCJNcHbUP9Z5y2r7gVggFyaU9joWPPOkHbfmL5KoN4YpaHR2wq4SNzjnl0rJHbwFH9mIJiqOmGtQyKm9w7KS2GMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZBj0D62; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZBj0D62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741506149; x=1773042149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGzCitWlPd51Z8medWpLOxhUmsoeLeGV9ZlBbWPVOtk=;
  b=fZBj0D62fNfS3WCcM191wjD3jSFSO51ogzMgC4CkkeMNU1jVyYM74ECn
   Eg6FRGXIWQs1J/F0IPVN1wCT4/np2TQdXZMLkUtJIMIvw2T04F6nN15ZH
   jw8049mLhVo+Y6ilx4f+fMQhRXwPRJ3W794Hb7bww8cI9tBhYGxQ5wFV9
   lgs7rW1QnQnCcSRc4Wfb0yuN/A6nwxd2zN/XgDH2pFFnwGNefFOKmyonS
   zwcQ+f37mw5ewc9QZ9m6M+00Rgkuijm/7vu5AVr7NQWw4XC6hHu6YPL7t
   D+zDvC5OZ33PVOWNsn4T9vN7uzVLJxX9BdDcpXl4dwNQGsqW1J7X92gNo
   g==;
X-CSE-ConnectionGUID: U26tHAsDTXa3e0QmmM9Bsg==
X-CSE-MsgGUID: AVGaw2zkTsCdpOtcyz6Ucw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46294427"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="46294427"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 23:42:26 -0800
X-CSE-ConnectionGUID: QrXdzyS1R36h6vz7S7btJA==
X-CSE-MsgGUID: 1ZkkuTmCTBGMJsnG0zqbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123894553"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2025 23:42:25 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trBIl-0002oK-0f;
	Sun, 09 Mar 2025 07:42:23 +0000
Date: Sun, 9 Mar 2025 15:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 07/11] arm64: dts: qcom: qcs615: Rename AOSS_QMP to
 power-management
Message-ID: <202503091532.0dyZhVVH-lkp@intel.com>
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
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9@oss.qualcomm.com>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Clark <robdclark@gmail.com>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Sean Paul <sean@poorly.run>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Robert Foss <rfoss@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Wesley Cheng <quic_wcheng@quicinc.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rohit Agarwal <quic_rohiagar@quicinc.com>
TO: Kyle Deng <quic_chunkaid@quicinc.com>
TO: Vinod Koul <vkoul@kernel.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>
CC: linux-arm-msm@vger.kernel.org
CC: iommu@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 565351ae7e0cee80e9b5ed84452a5b13644ffc4d]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-iommu-qcom-iommu-Add-optional-TBU-clock/20250307-021617
base:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
patch link:    https://lore.kernel.org/r/20250306-topic-dt_bindings_fixups-v1-7-0c84aceb0ef9%40oss.qualcomm.com
patch subject: [PATCH 07/11] arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250308 (https://download.01.org/0day-ci/archive/20250309/202503091532.0dyZhVVH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091532.0dyZhVVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503091532.0dyZhVVH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:4: 'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:5: 'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:6: 'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:7: 'ice_core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-management@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: spmi@c440000: Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
