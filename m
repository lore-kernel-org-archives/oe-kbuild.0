Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BAD14A0B8
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602185; cv=none; b=A8vUHI7kH2RKLaIYqBkT626FJxipb8oQ+m/JC1GCj89r6vdVK0NvZnQSJcDmGHtMdOZiFV9MIjrpfUupy27OIjg3Kbc081uk5KtNZDlykOU3OgGrGEpBFeWw+yI0AcU3crG5jq8c/QUi0ltxaIwlCGTWxGUgd04d40p710erf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602185; c=relaxed/simple;
	bh=2ofsYepoaA4QSEbwtEoF6yu6EI2ExTNivNlp2VvRyG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNaJOPfDMvjV5PoDHkznSJxs4HyUmAs6Pvuy4/xG7gGELlGfsBXFfi76rQAMRcRBc2sHAWXRzIlmwPzENP3o2h/HBXKX81El61eg+2NlmDB6/F++fnQsoVV+Z7iCWJzy2fJ4V2LiuMre/sfXcQraeJH1K2cW5qTgZCLpj1bvEmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+C5dlHn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+C5dlHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731602183; x=1763138183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ofsYepoaA4QSEbwtEoF6yu6EI2ExTNivNlp2VvRyG4=;
  b=V+C5dlHn50spPozWfSD4IxKGBpSOMr0Yuh9fuR9o3c619Pg3+rN7ybSN
   5mLg7H1HlSIW7rBEY7CljO2xFbAgNKRJVdIXuwaxicFh9Jx/xz/WoRuFE
   oe0u8I1ds9q2TVF3s+lFRBPjijZyCkcHMhPG3H2X1ndViCHhgeAzEzDiG
   /pIBicZLXK28mnRSdI5gvc43kTrrQvoacen4mAlpg7dj6jkxMTO2Nun0A
   SJo+WRpfTFuwSopyk75o9fb86xu9a4ux5wqC/wz8fnxupwI+6WiXd7SfP
   Zp3DbbBqKJ4FrklqMEGMkJk2RF42JTcQXfvOB1ug3OFv915m9gSqGI9Sx
   A==;
X-CSE-ConnectionGUID: Jblu7MGuTLWEqz5IubVYnA==
X-CSE-MsgGUID: ht+mH0jmSd+WF3OYwwvNHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31724220"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31724220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 08:36:14 -0800
X-CSE-ConnectionGUID: uEqdVdkhSJyoR/ZfZJ5c0w==
X-CSE-MsgGUID: fd1i0KF8SKC7F2kC7fXf4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="87827970"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2024 08:36:12 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBcpF-0000AH-2g;
	Thu, 14 Nov 2024 16:36:09 +0000
Date: Fri, 15 Nov 2024 00:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <202411150042.5SallPYA-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241115/202411150042.5SallPYA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150042.5SallPYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411150042.5SallPYA-lkp@intel.com/

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
