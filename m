Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DA70829
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731517036; cv=none; b=nErUuNGgI8K1ObNNAuzQG64mzuY/0/7V2USo3e5LIAIb7KEextpX4rIFT49pZyyX2/3LMyBmqvxtQhsortNdY07Zw9k+V46Hd9+Y6cidHHf+zgFMqAOAFbWMQ1Xf7WT43WICRvTlBwrqWHNph2iEBtX6ZCcDSQX6Q9paHyUrRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731517036; c=relaxed/simple;
	bh=OsSuaSQk8QLwILo/26rZv9pUpH+hBh0nQkoccpbBD4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmG6Da61xYqTLgjKJxvAWpQDiXfUiraLLJZoqULdhikMccRfb49d61YcUvIOPdfUDm7dQLtpGZc4TvY0PEYmPJCo1J9J1ytV5qXA6UQtzvVfMYUP5VWIxJGqH6P2Wu/9ustKogngPcI0ql0fuY9XVGBqrZFX9Jv/zrkG2gg+auM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKOrqhit; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKOrqhit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731517035; x=1763053035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsSuaSQk8QLwILo/26rZv9pUpH+hBh0nQkoccpbBD4s=;
  b=aKOrqhitu3GHWKIJqp8Q9D6EXiJZJgSYc7YgnHNgioV5X6c2MVas7KTr
   N/DKaOXz98/ovPZN/MTupsnrY3hjc3cXN9o0ZgEhFziefTbAHGifEKpe/
   R3fvlRuX3pbGF77XPP/S7/SdAI5vlg8MzuU2XzNNddYW3887jGslDq9rC
   v2K2C3pZuqLGUyoJ3KkDybFtsntVfQJaS0SJc+hu0+D7J+Zq2WrHX2oeU
   okdHfnU/u9VNpPV3IyViAGpqGuxOV43q81NC4+eMFKZ49Pvd8VcfMujnz
   ItFM64tgeZo0PncP9xccA26apet7+XIRAQqjwcfrjacjembJgEbxIblQF
   A==;
X-CSE-ConnectionGUID: igNsNEbaTjuLhIlbbRsadg==
X-CSE-MsgGUID: lAssQ1ETSse5ZmOEJAzDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31512302"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="31512302"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 08:57:02 -0800
X-CSE-ConnectionGUID: XB3JQhHSTZqCK9maiM4s+g==
X-CSE-MsgGUID: 511yMGQcTGy3WvyPeh3Xsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="125442904"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2024 08:57:01 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBGfq-0000ZN-0t;
	Wed, 13 Nov 2024 16:56:58 +0000
Date: Thu, 14 Nov 2024 00:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <202411140002.Rg1CFCP8-lkp@intel.com>
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
In-Reply-To: <20241110145339.3635437-5-quic_wasimn@quicinc.com>
References: <20241110145339.3635437-5-quic_wasimn@quicinc.com>
TO: Wasim Nazir <quic_wasimn@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Wasim Nazir <quic_wasimn@quicinc.com>

Hi Wasim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Wasim-Nazir/dt-bindings-arm-qcom-ids-add-SoC-ID-for-QCS9075/20241110-225519
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241110145339.3635437-5-quic_wasimn%40quicinc.com
patch subject: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241114/202411140002.Rg1CFCP8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140002.Rg1CFCP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411140002.Rg1CFCP8-lkp@intel.com/

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
