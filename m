Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F12AE8E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731605962; cv=none; b=mR5aEUTTRX6Z1tTwKV2HUmBqqz+qt91gZIn3FyedS5EiFAOLrTFigMEMPYUSspkeFOlHFiNUwB7yksY7Vqab5oiJTa44QorXZey1OHIZrVtLjmnTQDQ9xuFePnISxDNWQ9kPqvAiX3wQf7IysfIdDLybCho5x0szgqXVuthHqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731605962; c=relaxed/simple;
	bh=+MBnFb47WicJDfRnQnLb0EVGdnzT1tTLW7kEvX2IIpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/GPy7XHPPWwWQgDhWv7WDCjHMjoh6MoEGvwU7Id+PsTcstufzoI99I9HU75m1E1VjShwNiIJKD13Kx/jkhRMrO/y+gsYbfa5AX3rtEm6iRAZk9Y3Q/p8bEJHUcr5v7c/LMhaGl84Gja0zvE4FtqxwL5vM0hH/UKMnqihsNjm6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acsyf3fj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acsyf3fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731605960; x=1763141960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+MBnFb47WicJDfRnQnLb0EVGdnzT1tTLW7kEvX2IIpo=;
  b=acsyf3fjZC9+npF2LpU/9u0ddl8Wqc2paLDKwxVv49E0k+yBaoNsSDsY
   zhPU440IX8xU9Z7VH0SV2/pSCSXbDkoF26iSjEIQch8l7lShrlDmKwJfh
   ukcxF6mlKtw2W54xYwfW1Bgr5D6b4HOIfHA9OdEMgO9jnk5xxJPTH+5cP
   6OnvfhDooaB7aclPQkMSpQdZahyPjupClbCRnLwJ2uyvEHQ1VOk+xTRsT
   4qD1sPUH03+l/fWFcdVIaryFmlki1eZh3bdNdq/baCb90IAjTdHOxHB/x
   0siRIvEluzeKox7ubsrWABcvqeqCdttskV1y6AAOy8OGRES+vew4AoNrs
   Q==;
X-CSE-ConnectionGUID: ndMFQ1IcQuifjwBY9wMspA==
X-CSE-MsgGUID: 2PjIco1WRrqoS4OcfylLOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42959211"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42959211"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 09:39:19 -0800
X-CSE-ConnectionGUID: jPkJ1M/oQfKtyAdcFKVuXg==
X-CSE-MsgGUID: i7GbWB9uSfqwe86Pio4tOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="92725849"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2024 09:39:18 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBdoK-0000Cj-0Z;
	Thu, 14 Nov 2024 17:39:16 +0000
Date: Fri, 15 Nov 2024 01:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add SM8750 MTP and QRD boards
Message-ID: <202411150143.swPzhicK-lkp@intel.com>
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
config: arm64-randconfig-003-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150143.swPzhicK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150143.swPzhicK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411150143.swPzhicK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sm8750-qrd.dts:11:
>> arch/arm64/boot/dts/qcom/sm8750.dtsi:7:10: fatal error: dt-bindings/clock/qcom,sm8750-gcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,sm8750-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/qcom/sm8750-qrd.dts:11:
   arch/arm64/boot/dts/qcom/sm8750.dtsi:7:10: fatal error: dt-bindings/clock/qcom,sm8750-gcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,sm8750-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

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
