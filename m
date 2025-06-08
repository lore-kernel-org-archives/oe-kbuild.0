Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD11F8AF8
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749374810; cv=none; b=eFgTPld3awp8Vbo6+Z4KSi4o/uW5B79v0ydP+85n2aNDe8zh7BGmv+McmLe8RUAEhtWf4LM/9LqOX5OpSyxcblwKnwL4rXjCWpz560F+l0nCpzcCh0IKMl9huuC1nQMYAoGe0tu3n0xMFJwap1u2C+EjTd7z9q33NNa8a+z8ZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749374810; c=relaxed/simple;
	bh=WWR+x9dyCbacJcvnTfJtaWZgZtmHZEK0sCmfGjMUsO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EANND3rO2eo5TLS8/bFo9xTRBRQlyXcJ+TZY+GaiV57IYpsGC9E18M6iIcUbYSLBgFmWeE9FKRbh9D2ZdWz0tKJF2VA1cnCEcJls2BQFO83MyxpwGP0iGSY73wrCYmdDBuV/5qRiCP1bPceDhoCWDGyKkRysjqURtR9firjeSQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKHLSdkT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKHLSdkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749374809; x=1780910809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWR+x9dyCbacJcvnTfJtaWZgZtmHZEK0sCmfGjMUsO0=;
  b=dKHLSdkTpugrRTdiOa1zRx9qvbhnkUuIWpwn7r38TNyl6uTmP5Hyybgp
   KXMdGAiPPzeQJCkzPMLoMyEc+r5YTFXA11FYqrRV0T7tCoBCqPAH7jiKk
   nhYQaQuw6WBF/MwtUk6MB2beVU3Qg/zbokC9Cq7BClHwCANHw/o7ZTzu6
   i8rJzfGJvIP2CF5Oq4Q6aCrrKD4TDQM7R+/VWo1h0oZJRS6Zhv0fn44Dg
   S5diTsAUv04crlUNFroV3oku3QzSab+nM4KA1IwReAnlHK9zOYEfMedQu
   cRg72VbZ5ktlsnXi8Np0UY5B/zhZ0IuxNyDf1nbu0FC57PmkF1apxmctX
   Q==;
X-CSE-ConnectionGUID: a3XCLUdDT+WBt6lRdCW5sA==
X-CSE-MsgGUID: NI8WKWs/R8SIEzHXUeN1fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51332869"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51332869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 02:26:47 -0700
X-CSE-ConnectionGUID: mymbHTKaT8yJpgQws/ZAGg==
X-CSE-MsgGUID: o/xu8IL1QQ2GB1OUx7ArVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="151236329"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2025 02:26:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOCId-0006Ir-0Q;
	Sun, 08 Jun 2025 09:26:43 +0000
Date: Sun, 8 Jun 2025 17:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <202506081744.denHclZP-lkp@intel.com>
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
In-Reply-To: <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
References: <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
TO: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Kaehlcke <mka@chromium.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Hi Jens,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 475c850a7fdd0915b856173186d5922899d65686]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Glathe-via-B4-Relay/dt-bindings-arm-qcom-Add-Lenovo-TB16-support/20250608-032019
base:   475c850a7fdd0915b856173186d5922899d65686
patch link:    https://lore.kernel.org/r/20250607-tb16-dt-v6-4-61a31914ee72%40oldschoolsolutions.biz
patch subject: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-052-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081744.denHclZP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081744.denHclZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506081744.denHclZP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4873.11-4883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: pmic-glink (qcom,x1e80100-pmic-glink): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-pmic-glink', 'qcom,pmic-glink'] is too short
   	'qcom,x1e80100-pmic-glink' is not one of ['qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink', 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-glink', 'qcom,sm8550-pmic-glink']
   	'qcom,x1e80100-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
   	'qcom,qcm6490-pmic-glink' was expected
   	'qcom,sm8550-pmic-glink' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic-glink.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: pmic-glink (qcom,x1e80100-pmic-glink): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-pmic-glink', 'qcom,pmic-glink'] is too short
   	'qcom,x1e80100-pmic-glink' is not one of ['qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink', 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-glink', 'qcom,sm8550-pmic-glink']
   	'qcom,x1e80100-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
   	'qcom,qcm6490-pmic-glink' was expected
   	'qcom,sm8550-pmic-glink' was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic-glink.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
