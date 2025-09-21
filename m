Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E925393E
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758464977; cv=none; b=RuNnl0dQgnaVp8kkpSuxCvRUjjxzmXqAKTPN4Wkjw5Tc6wsH8buveK05q925ip4fK6blx4gbDJ8nomOJm5OTwEIzQX3JLi+Fi0cum5qY0Hph60OVcEbdVcOcEx6+n0Qzj0oDYl4fOJ9NuEl4sgpTfQLp81FHusjEg5zIH6Gn6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758464977; c=relaxed/simple;
	bh=BweHcsAfJPepzwXmCI3CYrs+a8LN49lQcOuoq7bA1+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQPrEtqW1kB47F8DQiN2TdgCCm9kO/zqzNo3AqHY4DDJ3NnGBAbsejby7TXn26qzFWefsmYZmpwrvdUsDM7/TW4XQcyP/Gw4neLzPTav4RwcYbAxKXojEjm9/ZfbJMmTdsrIQoxrmHBVPhhEeBE8PzEOBQX1wFlH5t09GYJRF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euv5vnL5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euv5vnL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758464975; x=1790000975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BweHcsAfJPepzwXmCI3CYrs+a8LN49lQcOuoq7bA1+4=;
  b=euv5vnL5TBHGVa+a+1OQVfFqd90UzQL7rlXhPUGziMwjwTFFI/zG1uK9
   wE03i59RqSleGRBtTzPUBbk0BE1nuUyJ9h5mUkartvQrBIlIHIXv9dBtW
   tgvhoRvhwkhHYH2GYLW8lazMeHk7x96D9L/RmYQi7YjnC9gQ+Y0yJ3u0X
   agPwvfdbAYHIfdUhir7fNWWGVQbIkKMZlfgknnwxtkHK5AWvap3KZQvnp
   tYm2R8MnGXia7r6f6Fu7Y7hr59kaWOYYvbfqntgwYHvlyy4EOPe76TlEG
   AGE5P4rRkRQccm8tDYOrPXBwWkl9fTDsiVZXIvh9uVlUMWiojiWaYtN5E
   Q==;
X-CSE-ConnectionGUID: KO0A6RZZR6SAJn9Vb1MrCw==
X-CSE-MsgGUID: XSgokSAkRqKtCMHNtlXNHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78187007"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="78187007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 07:29:35 -0700
X-CSE-ConnectionGUID: Puz5BEL1SYmYeLPQL2SqtA==
X-CSE-MsgGUID: NOi3hVkISAim+Ow2OTCNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="177072812"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2025 07:29:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0L4F-0000nB-1v;
	Sun, 21 Sep 2025 14:29:31 +0000
Date: Sun, 21 Sep 2025 22:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 252/265]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: thermal-sensor@c263000
 (qcom,qcs615-tsens): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202509212255.IkLPocl1-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509212255.IkLPocl1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212255.IkLPocl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509212255.IkLPocl1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: thermal-sensor@c263000 (qcom,qcs615-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq5018-tsens', 'qcom,msm8937-tsens', 'qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,qcs615-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
