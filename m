Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285B1531C1
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432162; cv=none; b=q3/bzO7DhYalseSWpyDt4Ipt2Is0InSuDc8/NRp+kCAoelteE6Ynsb3EMtULYBP0TBZpNQeiLqY9B6tBKKokK8vwDsQjJYq/4HZG8LfUU8BHovftutHMIC7M4eMjKIpGAil+RQJ/7eg1ZCzIJHc49b+T8mXijAKeMp5F6ZnvicY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432162; c=relaxed/simple;
	bh=C6AthL9mNFnbM5/5zVJBsUEL3IDL16i4y8+F9+M3CNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHaWZfI7NpMp7KHLHIY6Tp+tjjZs4hOZWcha7cJ571sv+NyrkoMc8J1d8fcEWt7hGXx48jftWO2IO/dEAbpj4+gVmY8iktFr4FWmm5syXibIfqXBizVunFNZswCkj+d5m5n472ymL+C27dwiGDaP1YtE43L3MUaeGnZi1Lzd2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCsURLVW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCsURLVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736432159; x=1767968159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6AthL9mNFnbM5/5zVJBsUEL3IDL16i4y8+F9+M3CNU=;
  b=aCsURLVWpy3KerUr4Zhl0iP2ICk8i5eI3cCTW1nnNHFVEwDmbJFpdYfx
   EI+F8YvKKQCmqxQRPF6bt+JMsZ8kFB+GqnX3xDGlJNx46u/4X/t08mLNt
   BgQ17NQdtd2On9C+CUOcjq771XFxbC73RgsXynqZNCAYxYPT4JrD8gQCt
   Y4r2N6i4NHvITKoiecPTDmsvMpyo6KU1UiT/tvXBKGSM8XP9zOGonOCvj
   jXqwsPro3t+mdn7pUpWe9m4L47afWcRPhaJg35ah6OllYfPpIVf7cB+dU
   M2JU3eYeTi8T2EBhcqbnXHDSMCfBzYPyNAIcsv/q06kEGKTvKncwN36Ws
   A==;
X-CSE-ConnectionGUID: iZkgtRYWQBGlKKP+mw1LZw==
X-CSE-MsgGUID: S+dQe2+xR4mOi827pgrmmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36808266"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36808266"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:15:59 -0800
X-CSE-ConnectionGUID: yH/akk9aTL+3bB/z+qhtLQ==
X-CSE-MsgGUID: ciUkdmuMSLmDW5XEIaoXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108038202"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2025 06:15:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVtKF-000Hen-1r;
	Thu, 09 Jan 2025 14:15:55 +0000
Date: Thu, 9 Jan 2025 22:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <202501100051.JhZWkh1h-lkp@intel.com>
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
In-Reply-To: <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
References: <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Rob Clark <robdclark@gmail.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Viresh Kumar <vireshk@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Maya Matuszczyk <maccraft123mc@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dbfac60febfa806abb2d384cb6441e77335d2799]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-adreno-Add-support-for-ACD/20250109-044339
base:   dbfac60febfa806abb2d384cb6441e77335d2799
patch link:    https://lore.kernel.org/r/20250109-gpu-acd-v4-5-08a5efaf4a23%40quicinc.com
patch subject: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor bindings
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100051.JhZWkh1h-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100051.JhZWkh1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501100051.JhZWkh1h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: opp-408000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: opp-408000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: opp-1080000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: opp-table-cpu: opp-1080000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-125000000: 'clock-latency-ns', 'opp-microvolt' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-125000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-250000000: 'clock-latency-ns', 'opp-microvolt' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-250000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-500000000: 'clock-latency-ns', 'opp-microvolt' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-1000000000: 'clock-latency-ns', 'opp-microvolt', 'opp-suspend' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: opp-1000000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-375000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-375000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-750000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-750000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-1500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: opp-1500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-375000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-375000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-750000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-750000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-1500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: opp-1500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-375000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-375000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-750000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-750000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-1500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: opp-1500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-375000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-375000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-750000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-750000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-1500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: opp-1500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: compatible:0: 'operating-points-v2-adreno' was expected
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: compatible: ['operating-points-v2'] is too short
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-375000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-375000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-750000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-750000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-1500000000: 'opp-microvolt' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
   arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: opp-1500000000: 'opp-level' is a required property
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: opp-table-0: 'opp-shared' does not match any of the regexes: '^opp-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
