Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763F20314
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490118; cv=none; b=kw8tphpsnnQNkrtUTzoKcrkfhLfz9cE6rhVabirHK18uOlWd+t77WAHl1qTLfexLzQm68Cc9RE8EWfeMOmY9VhumTZKbdJ+ENp6L0mR2lZAJZE1eJhrCO7Qcw0jgRwWmAlaMwcGAFvRqhNGjR/9Che/sTVFBnQyHNra0SD8eK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490118; c=relaxed/simple;
	bh=ujgD+/A16sWzDIcw/YOq5gfq+CvxyqRxUAsza4UDqeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iL+AaTTYzHLR3L1fM17jdj4+mIrxiAlJkyjojHRcLb4aogjQhQjsqEOntKbmLOandX+sbjAo+GuEq5kX+qc3HiUNpR1J1XCIujE5NzWQfhKDwCMiZuOtYMATiZ2rfj1z2PtqGWqqVt47jiV3hA/Jf7hOE1i2Ny512AeI2b+qfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZpupVX9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZpupVX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727490117; x=1759026117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujgD+/A16sWzDIcw/YOq5gfq+CvxyqRxUAsza4UDqeE=;
  b=LZpupVX9iiG3dejacd3X7lqkk1ikN1sDkZk3mKbPlx+gWqXHSVTY+Ryd
   LW7b8j+xye0+h2Bz7sIVDwjVpFBTXZtfoMfmmUDjnK12VRuYHNcvcvmzg
   H/dNjKfN7s/xmNCj5qHwFAn2oZagUiQ8TqkRrKC3U059Bn+KQrW1dDlBJ
   ZwsRCRqvKows1E9gfoosJ4ETVAWAzWoVd9AQPM36ymTgGLitcJVEKlXy7
   lfvtB0CFQFuI9umICd8gnIMc0Kkj7HdwNfXeOnXMHrXiN9m5jzI4oDdiZ
   KqBzZEa6BG7vURYu4FHU/UK/kCp1s0gjH7ashI9hf0aJJbpMG42NdIQC0
   A==;
X-CSE-ConnectionGUID: eUyRZoC/QbSOqDh4Ew8Wag==
X-CSE-MsgGUID: Jp6RkCpkRl2jxjJb57e6pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37227952"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37227952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:21:56 -0700
X-CSE-ConnectionGUID: u6MengK0QHidNGHh+jJ16w==
X-CSE-MsgGUID: khuK3FMuQy2fYimhBVpMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72288757"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2024 19:21:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suN5l-000Mqp-2Q;
	Sat, 28 Sep 2024 02:21:53 +0000
Date: Sat, 28 Sep 2024 10:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
Message-ID: <202409281022.O78MnomN-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42@quicinc.com>
TO: Jingyi Wang <quic_jingyw@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
CC: quic_tengfan@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: quic_tingweiz@quicinc.com
CC: quic_aiquny@quicinc.com
CC: Jingyi Wang <quic_jingyw@quicinc.com>
CC: Xin Liu <quic_liuxin@quicinc.com>
CC: Tingguo Cheng <quic_tingguoc@quicinc.com>

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d0326b60bb753627437fff0f76bf1525bcda422]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-arm-qcom-document-QCS8300-SoC-and-reference-board/20240925-184548
base:   4d0326b60bb753627437fff0f76bf1525bcda422
patch link:    https://lore.kernel.org/r/20240925-qcs8300_initial_dtsi-v2-4-494c40fa2a42%40quicinc.com
patch subject: [PATCH v2 4/4] arm64: dts: qcom: add base QCS8300 RIDE dts
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281022.O78MnomN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281022.O78MnomN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409281022.O78MnomN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: 'dt-bindings/clock/qcom,qcs8300-gcc.h' file not found
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
   arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: 'dt-bindings/clock/qcom,qcs8300-gcc.h' file not found
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

vim +6 arch/arm64/boot/dts/qcom/qcs8300.dtsi

27f221d22e92b6 Jingyi Wang 2024-09-25  @6  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   7  #include <dt-bindings/clock/qcom,rpmh.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   8  #include <dt-bindings/interconnect/qcom,icc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25   9  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  10  #include <dt-bindings/interrupt-controller/arm-gic.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  11  #include <dt-bindings/mailbox/qcom-ipcc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  12  #include <dt-bindings/power/qcom,rpmhpd.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  13  #include <dt-bindings/power/qcom-rpmpd.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  14  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
27f221d22e92b6 Jingyi Wang 2024-09-25  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
