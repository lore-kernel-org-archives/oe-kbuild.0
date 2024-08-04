Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9C2D030
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722776808; cv=none; b=hh9cZnIu5ugG+spQCSjzIOfaKYfnQ7NYyPCbUwDgWm2pzSjmpyIuZwhEjqTLAWD35C2WoFb8b5YmRI9B9dY6sIKY5JbEr0ehd+fLPZrgwwP5058C67Vo2Q4lUriDzN7Q58yXSi00MtbwvJxapYqcziT2XttqSwDgQZRmzM0IMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722776808; c=relaxed/simple;
	bh=c0WcCMs/3Oic1ouJfa9P5a7ZvlNtnoNeys111+mWWVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hkgt7wNDa9mv/D3oerMNjM7XBJm6aqs0V2S69T/Bar9GOHaSjRIv5Zo67PdFX1XO45zn5I+S6jPTRlF7h2ACOnqiIU+pxFkNK93YsukslvpoGBUElyL2VgELoRzrVdwXkL0HKShuxEeh0uqdJkKnc9qxPMZw/IUNISPMLTNMNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=folZ+7WK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="folZ+7WK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722776805; x=1754312805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0WcCMs/3Oic1ouJfa9P5a7ZvlNtnoNeys111+mWWVk=;
  b=folZ+7WKy0ITC+Y4DSKRzcdBM4oYO4Z+lAdw6ruZ+z15xgLM7u5BHDXJ
   3KAWU4fQgjDkB+PhR2c0nScpQrRkcXcR+A9XHi/w7gepiezhFsgV1JUM7
   THrlF6gaglYdbDeUPTkgquDY28Wl1HlosFZfld8plbyBsq7lbndfBxtBj
   DFA9QLgumgKYXjMQjXZBTX6AHJhoEy8jx4/ra90+brwBrivGGTc0DdPVZ
   wOK6aGnsZcucnhWZqLvGoYcBA99FgIzHYq11FL2/wo4a8eXL1Kk8ezdWT
   E2wFR6rYlX5YmK/g5r9oLSfmcoIK0NEbJFh/6VDSb/dIODoKbVoq1nPHa
   A==;
X-CSE-ConnectionGUID: iwIK9XbkTdmfnJWBV7Dchg==
X-CSE-MsgGUID: fWX9nkJaQjClYU/UQlxgrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20879493"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="20879493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 06:06:45 -0700
X-CSE-ConnectionGUID: SsTLLUycQWCuR1+MrApfKg==
X-CSE-MsgGUID: Z+AEakVySHS5evM/Gt163A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="60894021"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Aug 2024 06:06:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saawb-0001Re-0e;
	Sun, 04 Aug 2024 13:06:41 +0000
Date: Sun, 4 Aug 2024 21:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sm8350: add MDSS registers
 interconnect
Message-ID: <202408042049.4yxrJD5B-lkp@intel.com>
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
In-Reply-To: <20240804-sm8350-fixes-v1-9-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-9-1149dd8399fe@linaro.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Jonathan Marek <jonathan@marek.ca>
TO: Robert Foss <rfoss@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Clark <robdclark@gmail.com>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Sean Paul <sean@poorly.run>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Georgi Djakov <djakov@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Mike Tipton <quic_mdtipton@quicinc.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 668d33c9ff922c4590c58754ab064aaf53c387dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-dispcc-sm8250-use-CLK_SET_RATE_PARENT-for-branch-clocks/20240804-134328
base:   668d33c9ff922c4590c58754ab064aaf53c387dd
patch link:    https://lore.kernel.org/r/20240804-sm8350-fixes-v1-9-1149dd8399fe%40linaro.org
patch subject: [PATCH 09/11] arm64: dts: qcom: sm8350: add MDSS registers interconnect
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408042049.4yxrJD5B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408042049.4yxrJD5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408042049.4yxrJD5B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000: interconnects: [[133, 7, 0, 88, 1, 0], [133, 8, 0, 88, 1, 0], [89, 2, 3, 90, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: display-subsystem@ae00000: interconnects: [[117, 7, 0, 76, 1, 0], [117, 8, 0, 76, 1, 0], [77, 2, 3, 78, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: display-subsystem@ae00000: interconnects: [[117, 7, 0, 76, 1, 0], [117, 8, 0, 76, 1, 0], [77, 2, 3, 78, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2685.27-2762.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:2783.27-2860.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: /soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: display-subsystem@ae00000: interconnects: [[123, 7, 0, 79, 1, 0], [123, 8, 0, 79, 1, 0], [80, 2, 3, 81, 16, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
