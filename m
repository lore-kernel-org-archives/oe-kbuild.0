Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E2158DB2
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Nov 2024 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731647122; cv=none; b=FzUXBGtmmFMvYcuTmF0I7mgvKhiWqemNmaOlwnJbY1JHwpWhBQa4HftvGplHMXWqdC/0TCD8qHTUOeX9Ae0Fk2Suj3uwLyremumyoCmFr4mkZGXWcjzZRRw2LNqCp7JXu938EiKeTmgiL/0uHvAcdGWgfhxpjpcPD6jkaamaNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731647122; c=relaxed/simple;
	bh=IFZFpmRzBBmSH3bwhL3SaS+NrQrcSb0dTJpsXkjRSd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAvVMPk3DwUqhOvcNytz7Hn5QHsJRm1ij33m4O7lZFFdhUKGlHp37icu/2Sd4JaKioBsTEnyE1icf8ABz5cJorX82NIyet5wnkntTlUbM+oNOvCDSa42fRo092iJnbW/JcDfdBamw8DPP5xk78dtdL8d2+7Hv01qJqnjuE70jTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJZb6nz4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJZb6nz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731647120; x=1763183120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IFZFpmRzBBmSH3bwhL3SaS+NrQrcSb0dTJpsXkjRSd8=;
  b=eJZb6nz4BH9dBFFP78Lfu50vH91P24QhV75tDFfyAjP8h6zGwX9h2GwP
   Q02FmD/y3inT0Zi4m8EEXn2BAainYGQGzBjioQ/nlR597SnEcqN4OFeYG
   db9sl9W2bMScFjhz5cHd10bw0RaJFFtXiQNV8uHYJM78gQnzmIAl3LC13
   gyHpIOvJa4j5tPrWAnfGuJrRHC5uJ0uaw8R78DsXxe4fROu3T//YfymKp
   pcEkFlH2ubXWZpRXtvZIU3MCRw31ykDYsk1A98L/whhsRXcyJHnDDIKIr
   ad8IFfRdta1pyn+JtQc3M26+Ifb3p/EvYawPakwF71vNcRGkJuD33LvmF
   Q==;
X-CSE-ConnectionGUID: J4YugaLBR8ujYr7fIvXdRw==
X-CSE-MsgGUID: lJdxpu5zSCuOo4dS08QxMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31884300"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="31884300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 21:05:19 -0800
X-CSE-ConnectionGUID: DB6QxyP4SZ+X2MhUXHHdSg==
X-CSE-MsgGUID: 2GHE2sSfRru1FWXj8WnsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="93391333"
Received: from lkp-server02.sh.intel.com (HELO 481373e0caf0) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Nov 2024 21:05:19 -0800
Received: from kbuild by 481373e0caf0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBoWC-00009l-0d;
	Fri, 15 Nov 2024 05:05:16 +0000
Date: Fri, 15 Nov 2024 13:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <202411151212.N73pyIKS-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20241111 (https://download.01.org/0day-ci/archive/20241115/202411151212.N73pyIKS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411151212.N73pyIKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411151212.N73pyIKS-lkp@intel.com/

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
