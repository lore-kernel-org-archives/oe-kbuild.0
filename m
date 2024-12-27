Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3312A177
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290555; cv=none; b=Er+mg3p+06Y8BfvtO5yw/m1/h6RTpqT2Sh1oXivG5xCW3AFtcVMFXDxrfHMapg2sBUFAWdYvFwxEDALNIHI00vWJfB0cxchoMk+wZBOwGNNIcZlg+cfUhoVKBUZtGt/ORCnp/kSc7vMeGYj5XBIwj4TnaR7Owq4zv61pH/e3rbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290555; c=relaxed/simple;
	bh=U/lHaTYRQCCM2uAEY6YVgBrAPSON42ql5O8hYQXFztw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzSnkcUoj4pyd0q3MJH9TiCeV5RBdVvxWKCVm4dISsnogdU9ZDFhFuQgl3W4UcmQ0x7KX3pmjj5PfCyiB6gF8OWHEI/cZUHKyQOmp4Mcmx1HugsFe15m9wGWVE578HYOtdXnCCZ9tGpwRByFbzLQoj1W3EeuPqECuN+l5kxumCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nl70GUzB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nl70GUzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735290553; x=1766826553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/lHaTYRQCCM2uAEY6YVgBrAPSON42ql5O8hYQXFztw=;
  b=Nl70GUzBsMwrbBY35B58/A3xZXc52uJOBjnQi+CsTjQPkqfV5putluMB
   UHOQPBxUhNkcEfnkrfZP3nDBfCUvviN2InfGFVH9E9RmCXqmRIli3YaIk
   M3lIaUDnC616IMgwUTvYg/7xJ5kVosSvfXpTEdkf2QelcKNSECBw5xMlo
   48rr2wXRM6n3ZPsxQTRLVMunRsQzpRQYhMZU+vdUGXNYsrPo9T/yI/uEV
   414s8dGY1FCBc7oflq1p/Ee0zREJinD+IMEfb5/w8sUxaVnj5iVtm17k4
   v2A9qQFa6T3xWVR7wbRfjvZXCleKQc/zeVxin/5XZDhMlOHgMnKda+X/s
   A==;
X-CSE-ConnectionGUID: AnEfL3ryRHublnAvi6Ousw==
X-CSE-MsgGUID: NpFC56bbS4WWOgwbDTX6pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="34963697"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="34963697"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 01:09:12 -0800
X-CSE-ConnectionGUID: VbYEgtwZR+OMCjYYvjo4VA==
X-CSE-MsgGUID: quckd4dfR8CtWIuuKPz5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123389079"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2024 01:09:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR6LE-00036u-2k;
	Fri, 27 Dec 2024 09:09:08 +0000
Date: Fri, 27 Dec 2024 17:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 26/123]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1dfa000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412271730.n5UrQBxs-lkp@intel.com>
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
TO: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: a86d844099474acf59cfb45f4590800ae4d9365e [26/123] arm64: dts: qcom: qcs8300: add QCrypto nodes
:::::: branch date: 5 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271730.n5UrQBxs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271730.n5UrQBxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271730.n5UrQBxs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs8300-qce', 'qcom,qce'] is too long
   	['qcom,qcs8300-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,qcs8300-qce', 'qcom,qce']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
