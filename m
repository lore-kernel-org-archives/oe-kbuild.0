Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36440DFA8
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 00:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775004542; cv=none; b=uLZgnI4dZCFO5wE3XcpsU5spr1SsQk6ELN48bdNyBXASk5/nEmgdy8rzwD1fSS3Q5iGoi3tPa/CwHGbPGa+pffLnC6RaYXZoDHgIg2T7x0XTRxbJ5r1S0vc+hcYNRZIGyqSecOi5jfYAvVBz+V0dSftLTQQxS4P5EIWcF1q/do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775004542; c=relaxed/simple;
	bh=NzSVB4jMA9e01RPNbdNAjLMtROvSii9TG178NYBxRRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lvYALWT1SqP4GiCDJbfkR7TANap2QvP2JEebf+CTeH57xbGuEUBf+McuNzTIhuI3UOnilj3iNUR6bmYI4OKDDpekW9JQlHwVup7yzqa3B3oJiUDoyrORiF0tstDGCS904DodJ0NNbF81Y+Jp5KhymDQymH/0W7PUawde+LSLbvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SykISGKt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SykISGKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775004537; x=1806540537;
  h=date:from:to:cc:subject:message-id;
  bh=NzSVB4jMA9e01RPNbdNAjLMtROvSii9TG178NYBxRRQ=;
  b=SykISGKtIXUBuw4DUHOSdVFr6QVpP00vBfNUVF0ADp3CfqC2N2Mk37Uh
   yix2Z0GNDh+HmlEk+dBDsOsrawjs58LgVZ3+2nU0uuNxQ8jNYSusxSioE
   6RpTmVNkoPD2ErEdup5dg+qF3j5AhrYX1quyEiEvXp8r/ISXMf1Smv1yJ
   fugOKgRBZ35xwG0ZQdv/R347NPrk43lr5fmwILRL+hpd9AYZex5x+WPLS
   WTGkY1hJpIHin+JZmWN7IdtvJlILkKmIip6hqsV/y9+8NLkRRDNgoWWzz
   AzVLAZWYIrj9fjZcwAVXLOF65y3IqEtFxumMK298RSdDqL/X/pOR1TsNi
   g==;
X-CSE-ConnectionGUID: SMM7CjbkTmqsoF2b2FzdCA==
X-CSE-MsgGUID: 5TGrmleaTCyKm7SfasF38Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75925677"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75925677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 17:48:56 -0700
X-CSE-ConnectionGUID: 3EC4wLFwSAeIFNabh0cgpw==
X-CSE-MsgGUID: OcHotB6hRvmcEMyIfrETwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="231322497"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2026 17:48:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7jlM-000000008aX-0z13;
	Wed, 01 Apr 2026 00:48:52 +0000
Date: Wed, 01 Apr 2026 02:48:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.1 238/250]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: display-subsystem@ae00000
 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000',
 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
Message-ID: <202604010242.PRfOUPTD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pengyu Luo <mitltlatltl@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Tianyu Gao <gty0622@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.1
head:   b683730e27ba4f91986c4c92f5cb7297f1e01a6d
commit: 2f4c5dea9a285cc24a80e9fef8d7014bffce967b [238/250] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
:::::: branch date: 34 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2052-20260330 (https://download.01.org/0day-ci/archive/20260401/202604010242.PRfOUPTD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010242.PRfOUPTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604010242.PRfOUPTD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: display-subsystem@22000000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@22094000', 'dsi@22096000', 'phy@22094400', 'phy@22096400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4815.28-4894.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4916.28-4976.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6374.29-6434.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6456.29-6516.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: display-subsystem@ae00000 (qcom,sc8280xp-mdss): Unevaluated properties are not allowed ('dsi@ae94000', 'dsi@ae96000', 'phy@ae94400', 'phy@ae96400' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-mdss.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: dsi@ae94000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@ae94400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: dsi@ae96000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@ae96400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: dsi@22094000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22094000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@22094400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,dsi-phy-7nm', 'qcom,dsi-phy-7nm-8150', 'qcom,kaanapali-dsi-phy-3nm', 'qcom,sa8775p-dsi-phy-5nm', 'qcom,sar2130p-dsi-phy-5nm', 'qcom,sc7280-dsi-phy-7nm', 'qcom,sm6375-dsi-phy-7nm', 'qcom,sm8350-dsi-phy-5nm', 'qcom,sm8450-dsi-phy-5nm', 'qcom,sm8550-dsi-phy-4nm', 'qcom,sm8650-dsi-phy-4nm', 'qcom,sm8750-dsi-phy-3nm']
   	'qcom,sc8280xp-dsi-phy-5nm' is not one of ['qcom,qcs8300-dsi-phy-5nm']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@22000000/phy@22094400: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: dsi@22096000 (qcom,sc8280xp-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,kaanapali-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,sar2130p-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sc8180x-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl', 'qcom,sm8750-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,qcs8300-dsi-ctrl']
   	'qcom,sc8280xp-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	'qcom,mdss-dsi-ctrl' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: /soc@0/display-subsystem@22000000/dsi@22096000: failed to match any schema with compatible: ['qcom,sc8280xp-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: phy@22096400 (qcom,sc8280xp-dsi-phy-5nm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sc8280xp-dsi-phy-5nm', 'qcom,sa8775p-dsi-phy-5nm'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
