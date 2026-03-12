Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988938A286
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314167; cv=none; b=qiZd4lkjk+cKAcjFYk2Wce6RZLQ1tQaeTmWLd5GhiZaAvjtLTPIkJyHhI4dfLsmif/G5V0AUvbZXisE98kA7DBSOpDU859vfl361B5F8HWcP6RH0NMADdQ/Cn5bv07Hf6nWSLrSnw5B6T8KMghJasAxRIb1AD68gCmQ8kFboutw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314167; c=relaxed/simple;
	bh=KAIPzwTRU0YbDibYEPL5VWwV58MJ3hI5kt3E85VfxYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5pMTuOgGbfOUTp5WJQEwMyVUaDJoBb3FzQMQVL22ZVuEaSQjOpCwdC8C5qJ63zQwvCip7LURv0LcukWsyUTqpjnx2t9eVsBK4hWzXt3csbNP/e6WR1foGed425OXAWap/q/z+6QETNyQ4xxySdWBtWGNGJYGM/N2Z6cgiaMs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzZYUufi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzZYUufi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773314165; x=1804850165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAIPzwTRU0YbDibYEPL5VWwV58MJ3hI5kt3E85VfxYs=;
  b=UzZYUufis+2CBuTRnyGmSTuUecX4F41hibqo6zI/+gt6wMiXv0rfjHxL
   INvig9tpOqN4vameKVpbuGubTh6RGgRF+2jhzezGBkaZuf8nQqrywO4IF
   h1jo4XUEef9F0bdbKtk4/Y8JmYoXO7GmO5aeWw09kT39bmXLo+sXF8zDi
   3NWov6rIqSLP7/uMjkaEmuztPDLQzxiibR0tGfKOLoISHibo0q1VTJKPC
   YtIbdmWp0V1bho/8AIy0XbRYG71DEYdsJA74XxN/JFm6JPg/W0c7wf6td
   qJcyy8P/dv8XyUYc0zGSbDoLMMCP/keP6xOCoUiYZdy96PWkJa2sXffCB
   w==;
X-CSE-ConnectionGUID: yLHrugTuQESivVdIaJ71iQ==
X-CSE-MsgGUID: vOWCBVWHR7GTpJwMOztgBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74295043"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74295043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 04:16:04 -0700
X-CSE-ConnectionGUID: vV/CirTnSw+tzJSDg6pZMQ==
X-CSE-MsgGUID: Af04zRv5RP6lKpjRAKAwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220986034"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Mar 2026 04:16:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0e1J-000000003Ub-0DI8;
	Thu, 12 Mar 2026 11:16:01 +0000
Date: Thu, 12 Mar 2026 12:15:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
Message-ID: <202603121227.OlYTYPfK-lkp@intel.com>
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
In-Reply-To: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
TO: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-bluetooth@vger.kernel.org
CC: cheng.jiang@oss.qualcomm.com
CC: quic_chezhou@quicinc.com
CC: wei.deng@oss.qualcomm.com
CC: jinwang.li@oss.qualcomm.com
CC: mengshi.wu@oss.qualcomm.com
CC: shuai.zhang@oss.qualcomm.com

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on next-20260311]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Zhang/arm64-dts-qcom-hamoa-iot-evk-support-Bluetooth-over-both-USB-and-UART/20260311-171202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260311090921.1892191-1-shuai.zhang%40oss.qualcomm.com
patch subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth over both USB and UART
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260312/202603121227.OlYTYPfK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121227.OlYTYPfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603121227.OlYTYPfK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('wcn-bt-en-state-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn-bt-en-state-hog: 'input-disable', 'link-name' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
