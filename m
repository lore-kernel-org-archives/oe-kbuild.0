Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8233EC
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760818527; cv=none; b=HX2CXq3oJ1nGYGpCnNyUMWtUsFSggY3yblN0iLEY7V1mn74byfQIj0alpmYz+IQnyBIzYt8wkemQDkOOkC47xDiF+jU794S7pn9LWFt45oxi/LQXz9JItBc89oBpGSY6/FJOIZsLBnmVqprALA9/pwli6m+JllcyYuozusFMuLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760818527; c=relaxed/simple;
	bh=yFmQ/jv8QBhgKfm1AY0Qq4xtMj2Ngm/dPp78pazYsK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmYZdFOISxMK6qVbIBUm3K7rdNN7bfBmPXPeQY0cSQpQqnDAo1FWCxQ0koA22ZZ/GjA59RfDeC+Io7GhwiM1OcrYv6x4p9pFAIyzAQLgvUvWaAo9zQvTcqUafMoVKgecIkoJyDlS+CIK4hCOIBvLdKLHGz10rpboivBBty7ocBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O030cQ7J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O030cQ7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760818525; x=1792354525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFmQ/jv8QBhgKfm1AY0Qq4xtMj2Ngm/dPp78pazYsK0=;
  b=O030cQ7J1iJCAJ2PsrJGVkM+/BmT9HpOEP7wMcpgIL8KgQzimoUHBrGZ
   WphJfUOb1Ze9MLVQPF5pjgA+ewefHw8AeDqjf/WmqyLr2md1ttypER96i
   X5ckbsx1ggBjlJfTFNpYJKNWk6aqtpWlMgwRkAvb1mgmFZbnSTQVxOBo1
   ROpWrzbsqKdV8yBCLDWU8YHhb/m7C0UJaj8fY8WNxs/8LPp6AbgDhqN3F
   Vr6IAnA88KWrj52RFzSIf494E7q5PCUMhkCAYxKOsJxMcb57MHBxaGZZQ
   XpxlYugJlrxIqjHNmb/JaSpqgMHjRDex1pNbRaTtGWyKrzwjLPkMbn17O
   g==;
X-CSE-ConnectionGUID: g8JbvguhSUO3xeaTcrF0TQ==
X-CSE-MsgGUID: aN48AQoaS8ivDInnG9Qq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65617840"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="65617840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 13:15:24 -0700
X-CSE-ConnectionGUID: KMlplfh/RAecinxjd0wmrg==
X-CSE-MsgGUID: nRKHH7czS0G0inef3FqRoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="188306011"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2025 13:15:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vADKi-0008Zl-17;
	Sat, 18 Oct 2025 20:15:21 +0000
Date: Sun, 19 Oct 2025 04:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <202510190641.VeJMYqhp-lkp@intel.com>
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
In-Reply-To: <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb6649f6217c0331b885cf787f1d175963e2a1d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-2-0baa44f80905%40oss.qualcomm.com
patch subject: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-052-20251018 (https://download.01.org/0day-ci/archive/20251019/202510190641.VeJMYqhp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190641.VeJMYqhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510190641.VeJMYqhp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1891.27-1964.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1849.11-1859.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): clocks: False schema does not allow [[86, 8], [86, 0], [29, 19], [29, 87], [86, 3], [86, 6]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:0: 'top' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:1: 'csid0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:2: 'csid1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:3: 'csiphy0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml#
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:4: 'csiphy1' was expected
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): clocks: False schema does not allow [[111, 13], [111, 4], [48, 150], [48, 76], [111, 7], [111, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): clocks: False schema does not allow [[87, 13], [87, 4], [44, 150], [44, 76], [87, 7], [87, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
--
   arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): clocks: False schema does not allow [[101, 13], [101, 4], [2, 150], [2, 76], [101, 7], [101, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): clock-names: False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
   arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): clocks: False schema does not allow [[89, 13], [89, 4], [2, 150], [2, 76], [89, 7], [89, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
