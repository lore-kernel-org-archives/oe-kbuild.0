Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99F64A8F
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753631571; cv=none; b=DJPzpwQge0R5LCF7Rm/wszvtRAPcMxCkI+NZ5Wfccj4ex3V2pqEl3Fai8Kua3jS+NiMZF78t/WEkOA/OLAH97hutAjCgo93JbOmzGi4jwYIAVxQV3CcChG41LQ0sOZa5mxPbaj+7M/TeEvyigy01YiyGHsyX7V8gAk0l/xyeclc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753631571; c=relaxed/simple;
	bh=6bwxGgnPXnbaQOMJiKIEf3nf8iwTyhBiGMbC8Ck1ndY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5WDscD+mZK78uUoSBRr8raTwTo4PwOW5GUxk8RH7eraN4CgF7ieHRKeCgwn15KR4HTf5VzPSkXD1S0oOGGv5E8RlLajgtP0UfhPijuCze0I9XZJnfNHPElmM4jv+UZslbIZDlqq3vTw0PLt1oCM5Zb4yQAd7VTFQ+TSkNSeEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwLDbJaw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwLDbJaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753631570; x=1785167570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bwxGgnPXnbaQOMJiKIEf3nf8iwTyhBiGMbC8Ck1ndY=;
  b=iwLDbJawFD+ivbtO/QPZWbHKmon6gUDGENHpgRhKP6N4mh5UBnHJTgFU
   01bpAN35ULnF0oRWQvfsC2UzMXw7t6uOBl8zMbXKeBJUxZcluRTFUulqT
   KjXtSOCnzDqqmDeouZf1FIrwpIS9qECiGux0FQahDmZWRGNzuefUAK/Ag
   IAzfex+KPQ8T9tfQFAcS5UuBsYHgf4ArGurIcst1kVXZT8HlOHvTZq1EW
   lKyKeWF+sJAFi70Z5nvrtvR8l2oEy+oKXkJsQk+dHz9cA9Y/aWo3ZLvwL
   nClN+mhcfkssYdE5PHZiKPE4MxJyUGGICvaDaIUqE5KG52n24qVr1ario
   w==;
X-CSE-ConnectionGUID: xAcENljmQn6lePlHbzEXGQ==
X-CSE-MsgGUID: AWD7n/5CQGO/V+Fs8tmS5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67331338"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67331338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 08:52:49 -0700
X-CSE-ConnectionGUID: vPLm0JUiSxCgMF2+940Mlw==
X-CSE-MsgGUID: zPphDBxGRaGV3quAJz0ewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167537293"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2025 08:52:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug3g6-000MgZ-0S;
	Sun, 27 Jul 2025 15:52:46 +0000
Date: Sun, 27 Jul 2025 23:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 19/23] arm64: dts: qcom: msm8953: use dedicated
 elite-audio dtsi
Message-ID: <202507272319.hPZuErFd-lkp@intel.com>
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
In-Reply-To: <20250723222737.35561-20-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-20-srinivas.kandagatla@oss.qualcomm.com>
TO: srinivas.kandagatla@oss.qualcomm.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250723]
[cannot apply to robh/for-next v6.16-rc7 v6.16-rc6 v6.16-rc5 linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-oss-qualcomm-com/arm64-dts-qcom-x1e80100-move-dsp-audio-nodes-to-dedicated-dts/20250724-063627
base:   next-20250723
patch link:    https://lore.kernel.org/r/20250723222737.35561-20-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 19/23] arm64: dts: qcom: msm8953: use dedicated elite-audio dtsi
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250725 (https://download.01.org/0day-ci/archive/20250727/202507272319.hPZuErFd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272319.hPZuErFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507272319.hPZuErFd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:980.27-1030.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1410.11-1420.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge:apr: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge:apr: 'qcom,domain' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): smd-edge: Unevaluated properties are not allowed ('apr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: remoteproc@c200000 (qcom,msm8953-adsp-pil): Unevaluated properties are not allowed ('qcom,smem-state-names', 'qcom,smem-states', 'smd-edge' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: smd-edge: apr: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: smd-edge: apr: 'qcom,domain' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
