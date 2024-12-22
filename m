Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429461CF8B
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734844290; cv=none; b=H8dY552Eq2HSgExxPgf7XWbtMheOd5jP3OuYkjkQTZDph6CIyExnzFR8764RIPTpX5F0DCehcFRc3KYOpQEJGf5nNv5vNxg34uDXYP9iS3tK5r2RppcQ+rF6h2j6T2ThDXJMxCwsPWNXzpociQDiRJAA3t6MWZWtvJaySuuzUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734844290; c=relaxed/simple;
	bh=6gRPAxAy1qdPaOCyWSB7R3jizoAPD0PmOolv6c5nrR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFj8bUSW3/oPDVpX4mgxh56EfCTTG6xEieypdRgNaoln1gt3u6HllWtS/J1K8vJjjc7qxrfQo9eVlI1boPwyQwBpE/m+Fg25pH1blIorg5x3SkxEJGGSzPvTExSNGOwQD/7aPilH46TIlxL4zKL1fVHSlW2AC46D2sHFC8HbebQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfUG8OAN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfUG8OAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734844287; x=1766380287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6gRPAxAy1qdPaOCyWSB7R3jizoAPD0PmOolv6c5nrR4=;
  b=hfUG8OANbBJ6iSrqMQ8h0i5NVwrPwR2jL6JiqvcrF0ZtXaXM7p2syeev
   7WyiwyZ5igsXFZ0j3AuXD/WGYIu6tqeyzODs04ylhH+2mylBU6Rwikeca
   UqCAPO5LdIYKzBQq6E0rmTODX/xhkYhXdFm39R9Fj9//8Qyzu7PaJp+Da
   wmhOng9mAHQ5MpLQs4cvWFUExahY3LN3NVIqA/A9JcCVzbJcn/+snKBv0
   c1qn+Fu62iAUyDe3BHirG/4TAMVCr7b/efrTf1KBqdZQD09IkIsBqXmcE
   6GUxz95+1jdRm4fj1byEUl5XyXobH603HsuPec0EtJ71yXBAhl5FMlvA7
   g==;
X-CSE-ConnectionGUID: Z11Lui0MRGO+OocLta65Vw==
X-CSE-MsgGUID: wNvjNroMTU6sldhG0CgrYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46724099"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46724099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 21:11:27 -0800
X-CSE-ConnectionGUID: P/obG2EoS4enJsTzbzuDSA==
X-CSE-MsgGUID: Yi5H4BF7ShSiS3dSwTip7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="103756398"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2024 21:11:25 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPEFO-0002jr-32;
	Sun, 22 Dec 2024 05:11:22 +0000
Date: Sun, 22 Dec 2024 13:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add Xiaomi Redmi 5A
Message-ID: <202412221313.CMjbLyUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241221-msm8917-v11-4-901a74db4805@mainlining.org>
References: <20241221-msm8917-v11-4-901a74db4805@mainlining.org>
TO: "Barnabás Czémán" <barnabas.czeman@mainlining.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Amit Kucheria <amitk@kernel.org>
TO: Thara Gopinath <thara.gopinath@gmail.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: iommu@lists.linux.dev
CC: "Barnabás Czémán" <barnabas.czeman@mainlining.org>

Hi Barnabás,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8503810115fbff903f626adc0788daa048302bc0]

url:    https://github.com/intel-lab-lkp/linux/commits/Barnab-s-Cz-m-n/arm64-dts-qcom-Add-PM8937-PMIC/20241221-074319
base:   8503810115fbff903f626adc0788daa048302bc0
patch link:    https://lore.kernel.org/r/20241221-msm8917-v11-4-901a74db4805%40mainlining.org
patch subject: [PATCH v11 4/4] arm64: dts: qcom: Add Xiaomi Redmi 5A
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221313.CMjbLyUB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221313.CMjbLyUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221313.CMjbLyUB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1044.27-1110.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8937.dtsi:140.9-149.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8917.dtsi:490.27-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@1d9: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@1d9)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@1dc: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@1dc)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:535.25-538.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@210: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p1@210)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:545.27-548.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p2@211: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s1-p1@211)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:565.27-568.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p2@214: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s3-p1@214)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:590.26-593.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@230: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@230)
   arch/arm64/boot/dts/qcom/msm8917.dtsi:1030.11-1041.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: qfprom@a4000: compatible:0: 'qcom,msm8917-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: qfprom@a4000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/qfprom@a4000: failed to match any schema with compatible: ['qcom,msm8917-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: iommu@1e20000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8916-iommu', 'qcom,msm8953-iommu']
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8953-iommu', 'qcom,msm8976-iommu']
   	'qcom,msm-iommu-v2' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: /soc@0/iommu@1e20000: failed to match any schema with compatible: ['qcom,msm8917-iommu', 'qcom,msm-iommu-v1']
   arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: iommu@1f08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8916-iommu', 'qcom,msm8953-iommu']
   	'qcom,msm8917-iommu' is not one of ['qcom,msm8953-iommu', 'qcom,msm8976-iommu']
   	'qcom,msm-iommu-v2' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
