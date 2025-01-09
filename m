Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859AC23C9
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736459370; cv=none; b=RueLlbvB9qLIPn9Y+ljX3tmbD4msUHdzBHB3L7KfXotsLyoD4nM1/ntjqy443b7kqPveWl6ZYtsOQ/yJu7x/pHJoV1z3cHln0ae4sPXOjivOdyzPwnQ0UGUSUz29x63TE/oIW0nQmY5yHkxyoHcnTcrMSl79zY7aoPlzMMeW8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736459370; c=relaxed/simple;
	bh=mnGrxzeGOYjvv13oGfS/MzEoQWevS7y2C9gcqqQL5io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N47mu7cMKa05jF1YiNlIKOOy63uP/OPhb3j2xOvXZhFVUZstGIc4iJKrmY6qYOe6uutJIMBXZgeYuMRkBpzBKYLbshf00AGXw+nnflTijQUjVRAoZZI/zGCwCEfDLJMbBnDmiaSZRvO7pEJIQitWwrqtVvmdPPuyHJrvs2cEZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVVclSZE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVVclSZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736459368; x=1767995368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnGrxzeGOYjvv13oGfS/MzEoQWevS7y2C9gcqqQL5io=;
  b=GVVclSZE606O4UDIsPmKR2o+ZkxKEbOAB7J7xFxfv6CweIlezOhtFRS+
   rVTkNDXxbbnZcXY2/crpJBdyEDJ79eBXcP/LKvVLjWI2a6bfPMJScwrIQ
   bS6jee1WZiHcJsnolDQWJiyfjptwQM50HDBvPm7U+E9mob0VLrMWfjNUb
   LqFpVdn0MUZW7iI53wzCBNknx24PVSK5iqaXyef83BvVse8uqTF5/gQmC
   5nU/sCTz79f6Uun1i1utCxpxd5v/rM0X/uREVYeTnpx61rERjyg9Sjbzu
   hc6gpd/BHADRUfh4o1P50SWrSN/O1C/mF0xFcEnLynReBQLYTTSYrILcR
   w==;
X-CSE-ConnectionGUID: iAeTqzi1QgmDO22ND4Ql7A==
X-CSE-MsgGUID: wvp1kSXRTgWvMNChlI6pqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47319968"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47319968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:49:27 -0800
X-CSE-ConnectionGUID: tD7W6GsVTK2woTCASQ3P9w==
X-CSE-MsgGUID: xwkjAk2OQKOua7Rgrm0BVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103497420"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2025 13:49:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0P5-000IAz-2t;
	Thu, 09 Jan 2025 21:49:23 +0000
Date: Fri, 10 Jan 2025 05:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 206/224]
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: usb2@1e00000: compatible:0:
 'qcom,ipq5424-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3',
 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3',
 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', ...
Message-ID: <202501100525.z0a8QGR1-lkp@intel.com>
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
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   46316370e9257647d81c13782a6201a2256d6f1d
commit: 113d52bdc820da14dc0694bb5c57b3cda7ceea30 [206/224] arm64: dts: qcom: ipq5424: Add USB controller and phy nodes
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100525.z0a8QGR1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100525.z0a8QGR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501100525.z0a8QGR1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-ipq5424' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/watchdog@f410000: failed to match any schema with compatible: ['qcom,apss-wdt-ipq5424', 'qcom,kpss-wdt']
   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/phy@71000: failed to match any schema with compatible: ['qcom,ipq5424-qusb2-phy']
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: usb2@1e00000: compatible:0: 'qcom,ipq5424-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/usb2@1e00000: failed to match any schema with compatible: ['qcom,ipq5424-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/phy@7b000: failed to match any schema with compatible: ['qcom,ipq5424-qusb2-phy']
   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/phy@7d000: failed to match any schema with compatible: ['qcom,ipq5424-qmp-usb3-phy']
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: usb3@8a00000: compatible:0: 'qcom,ipq5424-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', 'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/usb3@8a00000: failed to match any schema with compatible: ['qcom,ipq5424-dwc3', 'qcom,dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
