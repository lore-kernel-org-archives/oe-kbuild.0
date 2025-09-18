Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC46CA52
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203233; cv=none; b=rxPvJaG9lk6aarjA/XKXEALIVLHLB7m1EOOprktGmtGBo9QotQJ8oqDes3vLa7uiIMZDCmVWDuBYrY/vYAbnjrwtfbkLPj3GEsm9hWuZVKseXNRdeu3ZsnQQvMUkQuaK88+B0rxM+csa076qxPHaJcKNy0sAHgQeaD7a8Ru9IqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203233; c=relaxed/simple;
	bh=QHwACIfrm5zstvQS3I8TI0H1J5jUX4fMAL7a553wZbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8OGfRrt+3Kou3nGVq7+mRSB8zJnv3Xakwtaj/rBSd+N6Psz0vI9JSMsTqCdnmVM5v8NRKbKp8iPUul0+tYS54oPzyemAX3Yl8wLzIErD9sBMorB8pSdv0C4HRkwvFO6kczAkWcho5ddHIEvFLFhLu+W/Pb7vBshCX8Orz5UBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLhe2eRG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLhe2eRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758203232; x=1789739232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHwACIfrm5zstvQS3I8TI0H1J5jUX4fMAL7a553wZbE=;
  b=ZLhe2eRGHyyguN/9rXtDtkHou6B3qFpsC/Nxg/f5hTqNQHlAsyEZvASl
   fucPpfO4suFWj4n+kWFI4hYJhpWUryEvNNhIjIUJJFatL8ExCcn4F65Jt
   HaN1z/EVxQQRes4/8Dr4NqZlTlBFrBmn9dfHR+6HtzPPNIlZ/Hc6gzDE/
   2/WhCzM+z5pBhdFpWHl3JyuFxZKc/KkLAI78hdif6iR/kaqo+/2D9bOB8
   DcircYLLO4xInDdUaSOnlhpgZVWqvjhcacvwaLPPyyTD5wA2inZITch1F
   fGZ3GmN3mopWT2DsBTSKhOIcStQyfWMp3k66TBYV1b5cYCx03QYiciIGX
   A==;
X-CSE-ConnectionGUID: zM/QQNHOTl+hPe/HUp6tpA==
X-CSE-MsgGUID: p47KZj9FTj2e926Q0HDG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60464673"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="60464673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 06:47:11 -0700
X-CSE-ConnectionGUID: q9ni/D6KT/WYrvaXbEbdtw==
X-CSE-MsgGUID: Y57NIRdPSNeWZnPPF+7Cqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175947736"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 06:47:09 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzEyZ-0003KQ-1v;
	Thu, 18 Sep 2025 13:47:07 +0000
Date: Thu, 18 Sep 2025 21:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 245/260]
 arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb:
 ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not
 allowed ('interconnect-names', 'interconnects' were unexpected)
Message-ID: <202509182129.26NhhcbW-lkp@intel.com>
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
TO: Wenmeng Liu <quic_wenmliu@qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   1081eafa1bca16d3610bf44f515550d060526dd4
commit: b68fc45910d4eb1b3bb7e160282fba5a4bdd8409 [245/260] arm64: dts: qcom: lemans-evk: Add IMX577-based camera overlay
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250918 (https://download.01.org/0day-ci/archive/20250918/202509182129.26NhhcbW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509182129.26NhhcbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509182129.26NhhcbW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clocks: [[56, 70], [56, 68], [56, 94], [56, 72], [56, 74], [56, 77]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clocks: [[56, 84], [56, 82], [56, 94], [56, 86], [56, 88], [56, 91]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
