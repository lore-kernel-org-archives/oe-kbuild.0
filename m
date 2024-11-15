Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D9F2C80
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Nov 2024 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731644668; cv=none; b=XHfLAO4RFsLkmy1zLZmdcVclOuAN3AQ5R3FPCuJVVYCOCFHdDUj1f/mtYIh18XJ2E2AtpvgK5ZIlNRN0CZ4PVh+U6bCus1drJ5lkPfwiSTbvcQQYjITd0fiv92qqumLwJIb06609mKrsi1eyzUE5IRYDL4tNseZ1r5sut3k3Ew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731644668; c=relaxed/simple;
	bh=BnPFjd1OcIyiR5rnJxDYqcPOG1oGyfgxAuG3t4uNMzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHGufpKqAC1OJDrYCiiFhmkNxNUVaQiqKRLstXUAL8r0Wg+38MfGnFLR6uJXR1xwCAzCeXWzFCFCs5/0YNa1qVGVT2kyyDkqDLCDl1S7CcL2fOp8X6x+Zeg6CAyNUMAOLSIcTV0OyYu3pwLR7bFpR5wRpag8K/tw8OFgdtOTCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxd6MM54; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxd6MM54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731644664; x=1763180664;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BnPFjd1OcIyiR5rnJxDYqcPOG1oGyfgxAuG3t4uNMzI=;
  b=dxd6MM54YBG9DY7yINHFJiQ8Kj5bt428uyRcmd2y+vw+oQJG5Qm/QREO
   gLDy0OKSDgmG9uCCPRgk6ebsYW47j7FWq569jYm3snZbev4Rn8Rg6pTtr
   zBzkIicNxDNHDDh9mhMpnWDdSTQ/IcGP/bEKl3+qvNNVLxarUv2Jtu7Ip
   YOesU+HXluAoEsDs/TSgSERHFwrI26MDjpf3zSd113F3GvnFOUQRjJo6q
   j8knz6Xua/Lkx+5iEVTDQURF8fx3qtb2uAnFOaaFYPNMGcnXXEN0UMHBJ
   sxVIbeA4sIQTGx6k1QLiZmEBiBBh6ZkoG+2LTSswUFbk7TvNPRtuH6Qi+
   w==;
X-CSE-ConnectionGUID: UWU2WHRGT4qLP29zXWL3AA==
X-CSE-MsgGUID: Jl2HRvv7TOWPkPaC+TRXQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31881103"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="31881103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 20:24:23 -0800
X-CSE-ConnectionGUID: 6o9PmFlkQh6lL4WHvT8n4Q==
X-CSE-MsgGUID: 8HGNFh0bSaG2RWsI++4HTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="119349348"
Received: from lkp-server02.sh.intel.com (HELO 481373e0caf0) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2024 20:24:22 -0800
Received: from kbuild by 481373e0caf0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBnsX-00008j-1d;
	Fri, 15 Nov 2024 04:24:19 +0000
Date: Fri, 15 Nov 2024 12:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add SM8750 MTP and QRD boards
Message-ID: <202411151259.0wisMr0y-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241112004936.2810509-6-quic_molvera@quicinc.com>
References: <20241112004936.2810509-6-quic_molvera@quicinc.com>
TO: Melody Olvera <quic_molvera@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Nícolas F . R . A . Prado" <nfraprado@collabora.com>
TO: Trilok Soni <quic_tsoni@quicinc.com>
TO: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Melody Olvera <quic_molvera@quicinc.com>

Hi Melody,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6d59cab07b8d74d0f0422b750038123334f6ecc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Melody-Olvera/dt-bindings-arm-qcom-Document-sm8750-SoC-and-boards/20241112-085257
base:   6d59cab07b8d74d0f0422b750038123334f6ecc2
patch link:    https://lore.kernel.org/r/20241112004936.2810509-6-quic_molvera%40quicinc.com
patch subject: [PATCH v2 5/6] arm64: dts: qcom: Add SM8750 MTP and QRD boards
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241115/202411151259.0wisMr0y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411151259.0wisMr0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411151259.0wisMr0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sm8750-mtp.dts:11:
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:7:10: fatal error: 'dt-bindings/clock/qcom,sm8750-gcc.h' file not found
       7 | #include <dt-bindings/clock/qcom,sm8750-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/qcom/sm8750-mtp.dts:11:
   arch/arm64/boot/dts/qcom/sm8750.dtsi:7:10: fatal error: 'dt-bindings/clock/qcom,sm8750-gcc.h' file not found
       7 | #include <dt-bindings/clock/qcom,sm8750-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

vim +7 arch/arm64/boot/dts/qcom/sm8750.dtsi

7c7e36a2de63f7 Melody Olvera 2024-11-11  @7  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11   8  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11   9  #include <dt-bindings/dma/qcom-gpi.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  10  #include <dt-bindings/interconnect/qcom,icc.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  11  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  12  #include <dt-bindings/interrupt-controller/arm-gic.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  13  #include <dt-bindings/power/qcom,rpmhpd.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  14  #include <dt-bindings/power/qcom-rpmpd.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  15  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
7c7e36a2de63f7 Melody Olvera 2024-11-11  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
