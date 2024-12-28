Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE79171D2
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 02:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735352602; cv=none; b=chBf7ffczlBvqx2oJ4bihx2lja7cg9Fl4T89cgvrXgZbL6RNsQP92gT419IFWClY59InEydU3X7/kppGpR3tdkNdn60FNHCRcWEcCYCAb9PevFYfH/HKWkIUiEz2+gwDBGAkW7oMN/IkH0qgy5+W/8lBj7F4IQmJNKwxltWKslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735352602; c=relaxed/simple;
	bh=kNg6Q6zaw+6jVAVBbX19mcZUmWDocp20SYdoZ0u9DTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqBAmDdnOjnUXaCniIxj82lClAmDG+N82EtdWWYgEAzlhWzfWXic53UXlPg5+24S+TkZutVN5/lHELXSuMwuJphcaaifYQnx4MkvVK850kXZ9hegkXw0cph3WQnLMLRAiqJ83p7Rk2M2CvogJAku7RuTmiuZrIHDYORnUCQVaUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0/O8WKP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0/O8WKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735352600; x=1766888600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNg6Q6zaw+6jVAVBbX19mcZUmWDocp20SYdoZ0u9DTM=;
  b=W0/O8WKPVyea5IRhV+6Qg7vWDjlh7mwpdWnnUfl1hZFGH7LAu6IerZRo
   n/yu1awnxAKYzlPpbqx/m3BMMkIhtQz91wnoc4i/54MVGVnsUODcao1ai
   9I0Hf9peYwadb2G6I2CjyAE7oYPp80T/v5xIANbFZZ7Ioi2EuQm9h9Ypc
   vDEtDuZuLnvNrXV63t7olhG6M8vtTuhE+mPu1F9nzB0fXPKZ9lJSZ8VtB
   qS5ry3jI4RNf2UnAHdbH1nqAoNAyuvCrzfkIoyJSm8DD0fNvuJQgPqT0T
   J5rJodJtZtfXIACd+EHeKf1587MFk4hbjNlGgVJmv9JjpxTcaC+xbGCaV
   g==;
X-CSE-ConnectionGUID: NvY9H3xoQ6C2KwgzUqLxtQ==
X-CSE-MsgGUID: gbvV0NDHQb+KfHRuMMahdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35619443"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35619443"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 18:23:19 -0800
X-CSE-ConnectionGUID: M8L+DehPRVasRQSTnf71kg==
X-CSE-MsgGUID: VrZkpr2sQHOKZQXkVglRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104347436"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Dec 2024 18:23:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRMU0-0003oi-1M;
	Sat, 28 Dec 2024 02:23:16 +0000
Date: Sat, 28 Dec 2024 10:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 47/123]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: rng@10d2000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202412281004.gM0TAYnA-lkp@intel.com>
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
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: f1b359bdf0a51cc6a0a57279fa44b81d23ec28eb [47/123] arm64: dts: qcom: qcs8300: add TRNG node
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281004.gM0TAYnA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281004.gM0TAYnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412281004.gM0TAYnA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: rng@10d2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs8300-trng', 'qcom,trng'] is too long
   	'qcom,qcs8300-trng' is not one of ['qcom,prng', 'qcom,prng-ee']
   	'qcom,qcs8300-trng' is not one of ['qcom,sa8255p-trng', 'qcom,sa8775p-trng', 'qcom,sc7280-trng', 'qcom,sm8450-trng', 'qcom,sm8550-trng', 'qcom,sm8650-trng']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,prng.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/rng@10d2000: failed to match any schema with compatible: ['qcom,qcs8300-trng', 'qcom,trng']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs8300-qce', 'qcom,qce'] is too long
   	['qcom,qcs8300-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,qcs8300-qce' is not one of ['qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
