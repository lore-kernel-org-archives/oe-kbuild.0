Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281A1FAC42
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172205; cv=none; b=PLN6iv85TtBz2lVnaMXYd8FgtqE57gYk9Z+AfScpYyC3K6Gx48KvXp63HWI291yYfaINF6lL44joeGORF0Ie9Gm81aTM2nhiwpf/qW7cAM12ldcqLuI4ln3oBO12rWto0oxnmBoy282v2tjflS+/ugE8xe1YIQdzPnxTEgZExuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172205; c=relaxed/simple;
	bh=QsS6LeDDwkYCcvhnKYIqgxOqkUXjQHdUVRx83hKYVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EoIRo7meoOcsgoo3vX9CIyfOLgEV/gzsrRj1Bn0tJAQQiwcGjiWiuDCaBqgKjO0K8JWh4gvI7mvN7n8a+UVgKfK8Cuo/5WfRHa4wrqwnAq5CRlHEtXCXWtVYevESRJKycMkMOHqYEjnMjqNXOBkLD3MrV1uhdw51hak04xx4w/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0ZMgpa+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0ZMgpa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750172203; x=1781708203;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QsS6LeDDwkYCcvhnKYIqgxOqkUXjQHdUVRx83hKYVGU=;
  b=H0ZMgpa+MPyQagnTq5ySEBJ+klf2/nrkcilZRdyI7JT3voot8ljR1zSZ
   mvuppZcITaEe1V8TEuhXbbs75Ke6p8vmirgXsmTl7PkSL/ir6bTUm6HWf
   BJLQzEM7OLuuzwDkeStTiRnKuaSK56J3nxAB6tnk08dZyLfSMmm2f0cLu
   OfC9vjmM7/TENT1ma6qS5DOd5k2LTtA6Mytx2wSnnrSDS1E9Sb2tgJ2bZ
   MJuf5SlhCpsEbUVsWqA/tepbrVVAbNEZqC6UeH986msKQ6EgvnbzYzgoB
   Yz0uYQAJ8IrzT3ZBWzCQFOgXeN607USEmcn14cfbZv8uN0/3iW/0JdHri
   A==;
X-CSE-ConnectionGUID: 0HMpoxa4Sta7Boho0uRSZA==
X-CSE-MsgGUID: nTEyhpWcS1mexBIay5W8Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51582967"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="51582967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 07:56:43 -0700
X-CSE-ConnectionGUID: a35ZaZDVTHasc1iw3x44JQ==
X-CSE-MsgGUID: eDkGGwesSFKGlrzPf2HJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="152668333"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jun 2025 07:56:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRXjs-000G6K-0s;
	Tue, 17 Jun 2025 14:56:40 +0000
Date: Tue, 17 Jun 2025 22:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
Message-ID: <202506172222.mERAM20n-lkp@intel.com>
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
In-Reply-To: <20250615-bqx5plus-v2-4-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-4-72b45c84237d@apitzsch.eu>
TO: "André Apitzsch via B4 Relay" <devnull+git.apitzsch.eu@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "André Apitzsch" <git@apitzsch.eu>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb71d301869446810a0b13d3da290bd455d7c78]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Apitzsch-via-B4-Relay/arm64-dts-qcom-msm8976-Make-blsp_dma-controlled-remotely/20250616-043719
base:   0bb71d301869446810a0b13d3da290bd455d7c78
patch link:    https://lore.kernel.org/r/20250615-bqx5plus-v2-4-72b45c84237d%40apitzsch.eu
patch subject: [PATCH v2 4/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250616 (https://download.01.org/0day-ci/archive/20250617/202506172222.mERAM20n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172222.mERAM20n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172222.mERAM20n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: display-controller@1a01000 (qcom,msm8976-mdp5): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['iface', 'bus', 'core', 'vsync', 'tbu', 'tbu_rt'] is too long
   	'iommu' was expected
   	'lut' was expected
   	'vsync' was expected
   	'tbu' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: gpu@1c00000 (qcom,adreno-510.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
