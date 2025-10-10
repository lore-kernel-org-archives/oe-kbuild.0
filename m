Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567F262FC7
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 21:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130509; cv=none; b=sFpX11xoHRiztjnrVpLWuNM6Wql3AxMyqCfrRUnfFRxIpAx/zvsgAL0tfy3nDk66hNxntbc1DF4a9xkixjVkaTxCF3I+BTu5oI5mDK8P9RqeEGs7wKqP+OZ6fNgYqEDBOcCXSM1KB//jz1/ePRviGCqsPb7+GCniFFkdUcHgeGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130509; c=relaxed/simple;
	bh=vPXfz6dkF/9d+OrV1hU14QBGFyicTXnBZQjivWX4qF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmZxJjzbcQAGmy/0nkJ6BP/8wn/5/kuoJU7WvO7CoyC3OpWzIeTNNoe+DpQsRY89wPo5+oo6K39IqQoKTrqc33nmvN4KdHB/TqxmCT8qJOgddLMyUIcgLdsR21z7ooGBkaxMFS1JOedeBDq/IfTT3qYYzf4JpOrEooP4rWkE1is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk98L2A0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk98L2A0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760130507; x=1791666507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vPXfz6dkF/9d+OrV1hU14QBGFyicTXnBZQjivWX4qF4=;
  b=hk98L2A0RdvQqizN+EM90iJ90bINFkouwkbu64pj1XRz2CfMAuY9Zs6J
   wEEZix5WwoQFmqeP2izJeEqTfocQbzAivZuMLRz2WM0x9koT/XK6wAXtU
   p0eE+KFNX2mG+9AM4VL5n21/i8HNfAOFkzP0sKgF3kdOgB2Fr134sADGP
   QAnwp696r5qraiMRQ4fJ6SZOjO5YKg4g6aAyHwahLFffnKSp1LOQdVQSw
   YqYUe85hlolFyke+TSGqTYO7KZtCGfgLb/J3yA3Ohfkufxr6NQTBRZlrm
   +eSupDw3k+kc+Pk43Z9OxHP5FRK/15EaBSg1X6N3nBMKH4bUNkPrIEIe0
   Q==;
X-CSE-ConnectionGUID: Qzbj6Os+Q1eAV7jmFBoXXA==
X-CSE-MsgGUID: Mw0YH8ufTZ6cKrYBT7+5vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72608930"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="72608930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 14:08:27 -0700
X-CSE-ConnectionGUID: aPJytC93R7y9Wbi2DYOOEQ==
X-CSE-MsgGUID: tPqKZhzIRqCuRbSo3D44LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="185446733"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2025 14:08:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7KLf-0003Ax-2Q;
	Fri, 10 Oct 2025 21:08:23 +0000
Date: Sat, 11 Oct 2025 05:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel
 3 XL
Message-ID: <202510110403.aJrmocOD-lkp@intel.com>
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
In-Reply-To: <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
References: <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
TO: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: David Heidelberg <david@ixit.cz>
CC: Amit Pundir <amit.pundir@linaro.org>
CC: Casey Connolly <casey@connolly.tech>
CC: Joel Selvaraj <foss@joelselvaraj.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e5f0a698b34ed76002dc5cff3804a61c80233a7a]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/Documentation-dt-bindings-arm-qcom-Add-Pixel-3-and-3-XL/20251010-051303
base:   e5f0a698b34ed76002dc5cff3804a61c80233a7a
patch link:    https://lore.kernel.org/r/20251005-pixel-3-v1-2-ab8b85f6133f%40ixit.cz
patch subject: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-052-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110403.aJrmocOD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110403.aJrmocOD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510110403.aJrmocOD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dtb: pinctrl@3400000 (qcom,sdm845-pinctrl): se8-spiflash-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
