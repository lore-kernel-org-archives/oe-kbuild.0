Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4C38DC47
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974132; cv=none; b=rz46gYQXToM99kAP0XEVsl88npD4KfDk+gie7tjlsoh8CmKeAPnqOx0UGCq8LXDYbbS0MfX5VQYkqYdjG6AOkkRZZo7nUD/DlQhPV4QZeSNvPNc1Sy+B0UcO5swqfGX+2gdR1NeeUORUdbe096sCT210H2uFxFIyo0+upWSo8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974132; c=relaxed/simple;
	bh=q6Hof69qXDaNPT4ptGU/Vnq+OkijHUbB4SZe4qms+yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZslyzYaji34ZIagYCB0n1ssIXZF4OC65Y5w7GC8InrdQqyw1TA6OiADnst0QjD22eBX0RbsqG9dCJq7ZKSrHDh10HdYICcDAijYNnaxM5bw5A+7BDNXC+kHBLC+9Vq8ajTsnFDi4ITI1auhk4CY8c9V7Jbl93qmPqE2cTNM+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHTCLI7l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHTCLI7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785974130; x=1817510130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6Hof69qXDaNPT4ptGU/Vnq+OkijHUbB4SZe4qms+yw=;
  b=AHTCLI7l9WyFofKW4O+BWOmxJETLLWNXrR7i/HH2IcfuqeTQSeuc1ED2
   PIoatH3aF+UCTSTmkWMzJpwdyccB3ervXVK7xWYSzYyDLZj1iq1Zuy3N4
   uOQObyac0CNDtyZXKZsIMyXbBDSzIyG0zFf7iHTpNBFFikgZrn8HgCVZm
   VYEzyUQIjV3+39IvfJPXRsJ1kTNm2pmvKIXn76ry3LHmORaZK1FipHSTn
   rr0xzM6LFeupEpoR+fDBlVzcevHK4aVhsCvnyS3zja+3/3wYiz4lR0jSm
   PXedai/TogkBOto6z9bhcs7kyrk2Tn8cwAGAiUy2bEn5PAoiJLM4pxQrK
   w==;
X-CSE-ConnectionGUID: tjQkhqPAS6+hLFhjKS2vRA==
X-CSE-MsgGUID: SapMCP7RRhyzF1Oqto3dHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90234900"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="90234900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 16:55:29 -0700
X-CSE-ConnectionGUID: V22PVS+GT8eUfuL7gA5VQQ==
X-CSE-MsgGUID: P7FLzme7T72aaMvdfr32dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="285316403"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Aug 2026 16:55:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrlSH-000000004UQ-3pga;
	Wed, 05 Aug 2026 23:55:25 +0000
Date: Thu, 6 Aug 2026 01:54:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856
 front camera
Message-ID: <202608060127.CfehaWhT-lkp@intel.com>
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
In-Reply-To: <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
References: <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
TO: Xin Xu <xxsemail@qq.com>
TO: konrad.dybcio@oss.qualcomm.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Xin Xu <xxsemail@qq.com>

Hi Xin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.2-rc6]
[cannot apply to next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Xu/arm64-dts-qcom-sm8250-xiaomi-elish-add-ov8856-front-camera/20260805-112340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/tencent_A7DA95458754255A62A4C730EEE484AB2905%40qq.com
patch subject: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856 front camera
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2052-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060127.CfehaWhT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060127.CfehaWhT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608060127.CfehaWhT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4952.27-5008.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pinctrl@f100000 (qcom,sm8250-pinctrl): pm8008-default-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	'pins' is a required property
   	Unevaluated properties are not allowed ('int-pins', 'reset-pins' were unexpected)
   	False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4952.27-5008.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: pinctrl@f100000 (qcom,sm8250-pinctrl): pm8008-default-state: 'oneOf' conditional failed, one must be fixed:
   	'function' is a required property
   	'pins' is a required property
   	Unevaluated properties are not allowed ('int-pins', 'reset-pins' were unexpected)
   	False schema does not allow True
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
