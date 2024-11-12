Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2E2201270
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449304; cv=none; b=qONE+bjTScpOtsZNvpczRJvNkMw3hbMQLsr4aBtDcUHvUlR5TFxs7H17YEgbGveUFRhg+4njDOVwhdn3WqEfNtii6YkfIKC9a48bL2oTilHPA0SZR1YDdvyM6gRPEHHTZPZtKOsmRl/Tz6OjO6XwO6nfxTySe7g243ZlO6xyLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449304; c=relaxed/simple;
	bh=3L98QfvZUkyoybEmnVtrTAqr52b6XiiWytQ8onxBvqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5Bg6ZbOW53uYYxfobZf0nM2zRgO26yIlyu9VRWEwCc47bOFgthUE2vg9qeqsVntFm+516p+rcikyIovM6qJ9klKHW7qBvPLFj56blseOubmHy45+lKD92OqJlk6czLTmTlhJj3weDJddob5dhgulpmdFpyE87wOtydtvCT+5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBCdOaN3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBCdOaN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731449302; x=1762985302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3L98QfvZUkyoybEmnVtrTAqr52b6XiiWytQ8onxBvqc=;
  b=oBCdOaN3wG5tRFnr8gpP2q2Fjk+CRAA67PvkuwjYabsO26wgjJIH/77S
   CnoI3AYK2kRRSSK0pJ8HQNKpurbxskVwTmTXjievyJnyJF4ZGG769m0ba
   AarqE3+OHFkB1BLWwpVdH4jhqKmxy3q5x5vH8ir9V3FRCHfCoF1wgGn5y
   bovSWQ44PCJtos8bfo/zmaXj7n5JSr7sAKFnT+SBpNvGgyHMK1izwjbVt
   mMm1D3SpLnl5eF/ZBDKkRq2IXeeGaM6BJNXYJOzUGMNWqQLC97S7dcDQQ
   eQqMOKmQs4Ju6ryPrUFSOJSaHUZeZcuCKdeUelXCgu33R/977MQDfgh/S
   w==;
X-CSE-ConnectionGUID: eTyx7yzsS5eMKQ/01F2Neg==
X-CSE-MsgGUID: 0EYQ4iDqSr+30nDqM9ElEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42722535"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="42722535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:08:22 -0800
X-CSE-ConnectionGUID: ncaYWObzT0qU0pd01GPrWA==
X-CSE-MsgGUID: awdB/WhAR4ifBv6HniptVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="91712800"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 14:08:16 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAz3W-0001ld-1f;
	Tue, 12 Nov 2024 22:08:14 +0000
Date: Wed, 13 Nov 2024 06:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <202411130546.dVdMz7Xm-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241113/202411130546.dVdMz7Xm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130546.dVdMz7Xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411130546.dVdMz7Xm-lkp@intel.com/

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
