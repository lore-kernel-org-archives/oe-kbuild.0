Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073A1E22E9
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 05:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595690; cv=none; b=R5isG9vhSaz1p5DAhGoEQW6uB6e9JsFeTXOjxQOM9IW0vrkLgl17m5DrOlAbPu25YKmVD6FdG8PnrT12lk0/K2AfdNpJvxo8BxwzC1g1kxQBXi+AkUGzX1n6pws6Df9N6ZNSb1GgtLtQokPKix9pr3jEEW6KgCbVXdoBhu98zpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595690; c=relaxed/simple;
	bh=vt0nh9WIZM4aOBLdnKzb1zwu2LmGEiEZEWkg9Ha8/vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCmRxuzRZKiJLnahNd/GMKIe0Ur5zBdliMyT+KrleGFXUqLPWrJloI7WffW3MQ3ABUvp8fDASxyrlyQeXyVW0/0sG1PrVIULPGvCV4hUtnrms1Vg3RXP0+YKPKQEOakvzCtFusVL1og4eIBoNVpLU1My49VsESFF484dQ+J9Y8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMo0wbJX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMo0wbJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746595688; x=1778131688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vt0nh9WIZM4aOBLdnKzb1zwu2LmGEiEZEWkg9Ha8/vk=;
  b=OMo0wbJXGE34aA2EOkOAG9F+qx6XkkcjcpzWwb8NhKMYqUfcHcHZzQhM
   D5j1pfu3aprVr6h2XMEh7z/brPRA4CsUc/oGG0I1eBaxsp/xbvYETGnKc
   IrH0dfx0CiEr5o3+4lAGGQO28m/Q5liu0+U2WWsmC8lUIcMSDq09NSaYd
   eOTbfk3Xw7kiJ9WMqPWvtXQau3FOKJMUt9HC0CfndBVjjB0TvZjhe6iP1
   GOIyRPLhWD7i4L2oMtvSitp8jShNDDMK+hQ2eZcPipwbjrN10cAbt8YgC
   YX7TLCt2nNDXdN8aTTisg1vMr/Wt620kWTbivvk5ZEse19m3SY4Hd9oNu
   w==;
X-CSE-ConnectionGUID: eP7dAIMXRiqMZfwRkxltwA==
X-CSE-MsgGUID: RcTqsGUwSduBSDUHof8DCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58961790"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58961790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:28:07 -0700
X-CSE-ConnectionGUID: 62dkTZrHRx+6ID/xKSVBvQ==
X-CSE-MsgGUID: aBG79BrLQweKQyswNOO9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135807492"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2025 22:28:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXK8-00074j-1e;
	Wed, 07 May 2025 05:28:04 +0000
Date: Wed, 7 May 2025 13:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/sm8750-display-dts 17/21]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl):
 clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus',
 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is
 too long
Message-ID: <202505071359.VbvdeyNz-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/sm8750-display-dts
head:   7b2178c1ba7c51bb018184d8e25075ce1284a4aa
commit: 77f58dcda09e86aaad0b365a60cd3d4307dad8f7 [17/21] arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250507 (https://download.01.org/0day-ci/archive/20250507/202505071359.VbvdeyNz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071359.VbvdeyNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071359.VbvdeyNz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 8], [129, 11], [129, 70], [129, 60], [129, 6], [35, 16], [142, 1], [142, 0], [129, 0], [129, 81], [129, 9], [129, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[129, 12], [129, 15], [129, 72], [129, 62], [129, 6], [35, 16], [145, 1], [145, 0], [129, 2], [129, 81], [129, 13], [129, 73]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long
--
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 8], [123, 11], [123, 70], [123, 60], [123, 6], [35, 16], [136, 1], [136, 0], [123, 0], [123, 81], [123, 9], [123, 71]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae94000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clock-names: ['byte', 'byte_intf', 'pixel', 'core', 'iface', 'bus', 'dsi_pll_pixel', 'dsi_pll_byte', 'esync', 'osc', 'byte_src', 'pixel_src'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): clocks: [[123, 12], [123, 15], [123, 72], [123, 62], [123, 6], [35, 16], [139, 1], [139, 0], [123, 2], [123, 81], [123, 13], [123, 73]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: dsi@ae96000 (qcom,sm8750-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sm8750-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sm8750-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sm8750-dsi-phy-3nm']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: displayport-controller@af54000 (qcom,sm8750-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8750-dp', 'qcom,sm8650-dp'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
