Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6465280C02
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758379331; cv=none; b=fAx2dT4ZAhbUuJ9nCTv98TTwX7g6qiaOTNFUWlfrZ+fgbabcv9D3x6diY7aaalVPjxAYkfmKUd1JhU9m6gO9RYf7Kaopjz2h/CnC5yv++qTmrs/J2M1eEUKEdeJa3GRhKxf3YQBYqux0L/RLjQaFl1GU6LQBF+CvZ2YlNDe3jE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758379331; c=relaxed/simple;
	bh=qsiusE6O+kxSWKOoRTP4hNVrO958B+oY5nW6O4ciTSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpQ7apQptToB/9PCfIgIdNkDsBtt/1uCXcs40hZexZGb9JKLz5kTwRD3pOr9NpmeYJiIiFH62vBQscFVxrJz2GvvTvkdlnImkyzam1Yy5qp3xiHh3KYh4IM76hyKVjwlY/Wxve9nR+kwPK8tRjQVcs4VuydA1v8G3bR2FuGJ2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dac5ixBi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dac5ixBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758379330; x=1789915330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsiusE6O+kxSWKOoRTP4hNVrO958B+oY5nW6O4ciTSs=;
  b=Dac5ixBiRcrPlP+v3S9nqAm7tI8H+aqpS8W7kB2ctSerhI9tpMldnqX7
   6H0NnSapAPNrkMYG1VxSUXLfqOCuu1w7MFTfG+V2X+i5eOA93bKgAMvKs
   5ybohQ6SupZ/IMq1iFvCrYp965iCCyHae6wv7+/uBphPOFIQfhohPmIeG
   QaE5Ppb+QiGsriD7lgOIZjAZfigKUDiUI3yW6kOwd9p+PEfXO0BsaKiN5
   xX1/rSMYpTj4AI2IbNci9PKqqy//V92C6FskuAgMdsW+m8qVzOL4JzmJy
   7cpiSIy/up2vSL/SjpKJ3yZKhVS3w7h0A9Ge4KtSTmMjoCs4QCtJHYEvZ
   w==;
X-CSE-ConnectionGUID: thmfIaYVQ3+1ocPWZBlPng==
X-CSE-MsgGUID: oMfPvXw7TaOPjRFRUt4j9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="72131521"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="72131521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 07:42:08 -0700
X-CSE-ConnectionGUID: Cx2spBJvRSCBb6TPPt5nuA==
X-CSE-MsgGUID: f4etsha0SvOxwZNLSerp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176131376"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Sep 2025 07:42:07 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzymq-0005O9-1A;
	Sat, 20 Sep 2025 14:42:04 +0000
Date: Sat, 20 Sep 2025 22:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 252/265]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/thermal-sensor@c263000:
 failed to match any schema with compatible: ['qcom,qcs615-tsens',
 'qcom,tsens-v2']
Message-ID: <202509202243.XnpMmLDw-lkp@intel.com>
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
TO: Gaurav Kohli <quic_gkohli@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: 4e26b0f4f1a965e366795c100bd7a8ee1635ed14 [252/265] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-052-20250919 (https://download.01.org/0day-ci/archive/20250920/202509202243.XnpMmLDw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202243.XnpMmLDw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509202243.XnpMmLDw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq5018-tsens', 'qcom,msm8937-tsens', 'qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,qcs615-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: cpufreq@18323000 (qcom,qcs615-cpufreq-hw): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,qcs615-cpufreq-hw' is not one of ['qcom,qcm2290-cpufreq-hw', 'qcom,sc7180-cpufreq-hw', 'qcom,sc8180x-cpufreq-hw', 'qcom,sdm670-cpufreq-hw', 'qcom,sdm845-cpufreq-hw', 'qcom,sm6115-cpufreq-hw', 'qcom,sm6350-cpufreq-hw', 'qcom,sm8150-cpufreq-hw']
   	'qcom,qcs615-cpufreq-hw' is not one of ['qcom,qcs8300-cpufreq-epss', 'qcom,qdu1000-cpufreq-epss', 'qcom,sa8255p-cpufreq-epss', 'qcom,sa8775p-cpufreq-epss', 'qcom,sar2130p-cpufreq-epss', 'qcom,sc7280-cpufreq-epss', 'qcom,sc8280xp-cpufreq-epss', 'qcom,sdx75-cpufreq-epss', 'qcom,sm4450-cpufreq-epss', 'qcom,sm6375-cpufreq-epss', 'qcom,sm8250-cpufreq-epss', 'qcom,sm8350-cpufreq-epss', 'qcom,sm8450-cpufreq-epss', 'qcom,sm8550-cpufreq-epss', 'qcom,sm8650-cpufreq-epss']
   	'qcom,cpufreq-epss' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/cpufreq@18323000: failed to match any schema with compatible: ['qcom,qcs615-cpufreq-hw', 'qcom,cpufreq-hw']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
