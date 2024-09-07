Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1C15CD58
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 23:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725751354; cv=none; b=eSyf6hjMQh54UfVTyj2Lt40+uxPH/HtffIjP8ole5aOiZcm8vR3Lhq4lnPGrHN0CFwCf9bPYFCtYwSj08/mfOUFEHVoKCeAC3l3R8xPxIx2DehLPXU+8gKiRWuxNVDkidyuxNUbAxCSs5XGAdDB7G3eK4kF+ZCz4eh4G67rnv7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725751354; c=relaxed/simple;
	bh=f9985VLknXTnImi8J67ZClowL5PoCCHdr/umHYEZ2rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bx3OhH0SLCGoPQzltdn7vSNBmiKjbiu2BRo2yv0DCYZdJEuesZjnZkJP4l4a/b6vdExPiSYEIiYZDiwjr8SYFGH58sdU4Y3m+Fo5hF4QImZkAiSTnrlxnAEYVc6JRc0bc9eQtN2vNIyW3LcY26+9g5I4TQtPVoRqIquCwS3o7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bwr9A4B9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bwr9A4B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725751352; x=1757287352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f9985VLknXTnImi8J67ZClowL5PoCCHdr/umHYEZ2rU=;
  b=Bwr9A4B9eyFS63AHtvjjEZdMqxTrNUIy6Ty/qXb0/K09j8M6ZV+Ky16p
   Lft657GghP37P119bbIR5sbTq/R86CXWFj0Ot23qy9AuRstXXMgL2dmiJ
   RD5t7zT4myQ+Ngr5ScwnLO1v2I9BfGCg8pSvcBrfjLCZySsEnqZdMETvo
   fq8TYmf8MDDbMky6yYfTZVRfp6UuCfD6WENQPXzz9+EcIahn/QoOBJqH+
   uo25J26rt3TcMdmooSH67pvsak+Vlwv6Kh6KcAWQcnWLjJCJxpkaOhrKx
   jHihll+wHjKpBlrshtmo5TitnPVllpWyjLO3vzJ8H1SbCR4Qd94eswwKR
   Q==;
X-CSE-ConnectionGUID: IxAD22BZStuZlVxv0UR35A==
X-CSE-MsgGUID: 2Tt7e75HSnG67ZpBrw0cOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24353032"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24353032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:22:31 -0700
X-CSE-ConnectionGUID: 2jrUlbQTTcGriTpyprTjMQ==
X-CSE-MsgGUID: o8Htl/GfRg+cNBpa5mKLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66331787"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2024 16:22:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4lA-000D6P-2u;
	Sat, 07 Sep 2024 23:22:28 +0000
Date: Sun, 8 Sep 2024 07:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 19/19] arm64: dts: qcom: add base QCS8300 RIDE dts
Message-ID: <202409080715.rGuyyNu2-lkp@intel.com>
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
In-Reply-To: <20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007@quicinc.com>
References: <20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007@quicinc.com>
TO: Jingyi Wang <quic_jingyw@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Avri Altman <avri.altman@wdc.com>
TO: Bart Van Assche <bvanassche@acm.org>
TO: Andy Gross <agross@kernel.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Robert Marko <robimarko@gmail.com>
TO: Das Srinagesh <quic_gurus@quicinc.com>
TO: Jassi Brar <jassisinghbrar@gmail.com>
TO: Lee Jones <lee@kernel.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org

Hi Jingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on eb8c5ca373cbb018a84eb4db25c863302c9b6314]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/dt-bindings-remoteproc-qcom-sa8775p-pas-Document-QCS8300-remoteproc/20240904-164345
base:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
patch link:    https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-19-d0ea9afdc007%40quicinc.com
patch subject: [PATCH 19/19] arm64: dts: qcom: add base QCS8300 RIDE dts
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-004-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080715.rGuyyNu2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080715.rGuyyNu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409080715.rGuyyNu2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/qcom/qcs8300-ride.dts:11:
   arch/arm64/boot/dts/qcom/qcs8300.dtsi:6:10: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
       6 | #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +6 arch/arm64/boot/dts/qcom/qcs8300.dtsi

984d43bac8bbd3 Jingyi Wang 2024-09-04  @6  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   7  #include <dt-bindings/clock/qcom,rpmh.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   8  #include <dt-bindings/interconnect/qcom,icc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04   9  #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  10  #include <dt-bindings/interrupt-controller/arm-gic.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  11  #include <dt-bindings/mailbox/qcom-ipcc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  12  #include <dt-bindings/power/qcom,rpmhpd.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  13  #include <dt-bindings/power/qcom-rpmpd.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  14  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
984d43bac8bbd3 Jingyi Wang 2024-09-04  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
