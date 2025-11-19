Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4222F16E
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 23:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763594027; cv=none; b=Yj2HalykI4/4mc9KOC7QLineqEcyI6KfZeZ8ky60+tZBLnm8ikUjgRRR9wmu0OVt1CxOKiNiIJuK+McMtHgR45ZGa4RjQt9CZsDulTpCZnsPQzGmIAE2bjgSlXapBbqXNwxB8dLjj99nsYkPoheibLfh32US2V1rigQpJvH/17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763594027; c=relaxed/simple;
	bh=21aoDUVet/L/7u8fSaZjAXrhPkDJgb8nN4ZQCGqQbwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWQGU4X58gT7O1hAeTwOq0JhS/FpGHh9LwpHZdAcgMK8vzalCxP/1WNaYz3H6M6XpHgtrc84gzZFvMUt18is1LFPCFqVIgel3ud/xSXxkZd+ahLTisTUYIQr7qMBsZIpGrFHaJVyEa7/gtGwetZ2M6NBTVAjxJYd2SeogebtIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB8qeTui; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB8qeTui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763594026; x=1795130026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21aoDUVet/L/7u8fSaZjAXrhPkDJgb8nN4ZQCGqQbwU=;
  b=aB8qeTuinxLcl5WBZv61GhLzxdEaqsGsFXTTS0/RsFPmEkCi1H0kxw6l
   zChBXM1/KoRZkQBk5TaFK1y2sTkkdS6M3SWIw4oTrDbJEWelJAq5vxgXs
   A+Qj5V2xzsdlqMQKO/z7FbCB4qScpqpU29H2gfqaU6k1SxtFK4MZxUUSY
   +BNua0jVwd20rA07nqOBmOnsHoYOlhsAEHc1/pGA9LG5TnD5NoaiAJBqJ
   MlQw+ymXD8xz8WhgTWBE7JLdaIeZv1EHJmlWov+Rq6v58vCc6KwTnbR0D
   +spZOcZWwMs7RoPOpS9oFoibxYGHC60se70VXYXyp40FvysLtCvoKdoJD
   w==;
X-CSE-ConnectionGUID: IBrmHd7/QB+cWGDIWx6tsA==
X-CSE-MsgGUID: gQjTCYt+QiSjwqv8ByMKZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="53225221"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="53225221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 15:13:46 -0800
X-CSE-ConnectionGUID: yeknbnfHS0eDy01nzBDlkg==
X-CSE-MsgGUID: EA3uRm28QxKEE950K0Mkmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191454092"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 15:13:44 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLrMs-000000001Jv-2df3;
	Wed, 19 Nov 2025 23:13:42 +0000
Date: Thu, 20 Nov 2025 00:12:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-msm:msm-next-external-fixes 4/15]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000
 (qcom,adreno-07000200): False schema does not allow ['core', 'iface',
 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
Message-ID: <202511200045.V6nbDD3t-lkp@intel.com>
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
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-external-fixes
head:   77ba0b6bffeda9c77ad47346e25351d36ede44e6
commit: 0f2e9535242b495cda6e0b8c7bd08286c79480df [4/15] dt-bindings: display/msm: gpu: Document A612 GPU
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200045.V6nbDD3t-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev17+geee71adb5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200045.V6nbDD3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511200045.V6nbDD3t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1891.27-1964.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1849.11-1859.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow [[86, 8], [86, 0], [29, 19], [29, 87], [86, 3], [86, 6]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:0: 'top' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:1: 'csid0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:2: 'csid1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:3: 'csiphy0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:4: 'csiphy1' was expected
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[111, 13], [111, 4], [48, 150], [48, 76], [111, 7], [111, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[87, 13], [87, 4], [44, 150], [44, 76], [87, 7], [87, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[101, 13], [101, 4], [2, 150], [2, 76], [101, 7], [101, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[89, 13], [89, 4], [2, 150], [2, 76], [89, 7], [89, 10]]
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
