Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4EF173
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735517485; cv=none; b=UGLM/ajWZP31oosjBorcb85d4EaV+RjrUtgSmyz4XtiQCQdYuh4OcGLF5EGGDbp/Ne3uqWES/RNfoORMiLvPksqHp2IJ68U2rD+PmaOsdiYLG6y0pd4Fqg79tEYvHt4upJXeCOayfdb3cbwL1SyKdmaOp31kdizilxpmsjlqlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735517485; c=relaxed/simple;
	bh=MickiHfd99nsxCUErGL1fSTDQ4XxAjGNp1aBX6EUAM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOZSUcMbMs7NcbeEUE8ibpNx1RKm2O3jNGIl06XPaIaBOIx7jeV4aMd6ug7uP/VnysXoqcJm3XtHDmpjw47tsuHL6z9+YUBdUj3x20WfrXGATOvOMX52UaTuWKp5FqnMymxMXdopGajrwQL88fVsJlO73RRTvAZKR/pXo5IR0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl1nThpi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl1nThpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735517484; x=1767053484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MickiHfd99nsxCUErGL1fSTDQ4XxAjGNp1aBX6EUAM0=;
  b=Vl1nThpi+QV1lINlq9tktCjvCIB+JNZcnuDHRXXMIxkTUt4qc5zUU9Sv
   oEisJ3QD+xT+mstOkypp+qdKBVrJeYRycsAa2WTGprTedRWXH39C7/bqU
   iftCdoWKbON9n83V1+Q4yZFPTsfU6iwRgJiaER88G7nDC50WkSEC9E9tN
   LRcATkvBSboiAostXAIXJy93DCJjxS5/4oOnzxTZoKr0Xu/yzjKtEuc52
   wRwzeXVIaB/AWjj0Dt3sQkH9+/89abkmLwS3imGg3DCUJfZnFiUviveOm
   ZU2V7iC4FRSOLgWfCUjerVfk5+qUOYNp9JR23YLOBBhB0a/MwIoUlOniU
   w==;
X-CSE-ConnectionGUID: OFpenY+AQnaRwpJLDI5gRw==
X-CSE-MsgGUID: SGaNNokNSzer1Py0jMYeZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35924607"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="35924607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 16:11:23 -0800
X-CSE-ConnectionGUID: Iix/L9Y1QzaDfAU8rZDZkQ==
X-CSE-MsgGUID: fpGOIl1tR3imQd5uyXfyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="100513905"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Dec 2024 16:11:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS3NP-0005Fg-2w;
	Mon, 30 Dec 2024 00:11:19 +0000
Date: Mon, 30 Dec 2024 08:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <202412300719.FLBWY01k-lkp@intel.com>
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
In-Reply-To: <20241229152332.3068172-5-quic_wasimn@quicinc.com>
References: <20241229152332.3068172-5-quic_wasimn@quicinc.com>
TO: Wasim Nazir <quic_wasimn@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@quicinc.com
CC: Wasim Nazir <quic_wasimn@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Wasim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Wasim-Nazir/dt-bindings-arm-qcom-ids-add-SoC-ID-for-QCS9075/20241229-232743
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241229152332.3068172-5-quic_wasimn%40quicinc.com
patch subject: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-051-20241230 (https://download.01.org/0day-ci/archive/20241230/202412300719.FLBWY01k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300719.FLBWY01k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412300719.FLBWY01k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
>> arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
