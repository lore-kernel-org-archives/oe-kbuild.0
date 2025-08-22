Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91471A9FB9
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886257; cv=none; b=JIAGMdRucemP24yNtHqT+PVTPGwBsUIutPFADXLUv6MZjv8j3pVDBWaYvdWc0WwzYVIIH+6EhvK5Uqrrc3BAzuFT+gTCnKVmdhJbWQaR4xqo/wN3c6rXhK71jQ7ZhxVSYEcYmpuEk0Ab+RBPvDMQBxcevjvNGaOD8j3xVxAsRng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886257; c=relaxed/simple;
	bh=7LbSiwB4VCVLPx1Q3KyikUEQ5XFWvDVlpLKM1fxW27I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+OoRTDNM8aZqWbIoVFEqyBDcDSCW1Id6YzQJqoU42TyYxDxpYdKTbKCSwEx5enMv56qDbaHHRDd46tkGGST+JHR5xXHkChilTVzb0v+C05xyj6oSyAVE+cD5NAHvvQX7r/4zm4JfGru2wd19sfoqXJmL6NaE9/ekJ94wcq2dbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzwS7jsm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzwS7jsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755886256; x=1787422256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7LbSiwB4VCVLPx1Q3KyikUEQ5XFWvDVlpLKM1fxW27I=;
  b=GzwS7jsm662gmhlmmDNpYNiYYhiIU+7goSV93NA9uPD9+KWDSQixFMer
   rJSZy+NDsryvKVsuGsBJTA7TrBRZq8713VDO4tsDzU30qel51tSC27rHu
   qH0gBYVocfUeie8yz8HbqUHZ82kI0jviF+UqD/yhSjRv3rCoYhB60ferT
   Dv3/rh1Il5WJfId8HMrt8l0KP4Kd+toQCFHieR5jSEowGyl9LGB8NQMBr
   tiIZSgv9a6TuTT6L6HZSpsjRlbHKLZ8SqEWLnFxAXf0unq+CNkru4uhqB
   dLoGsskcEdIyP2p+HF8x1wCp/69EUHucJBjy5H+AHou48ohGCsvRmcSGb
   w==;
X-CSE-ConnectionGUID: N0yDhAZBS1ifh2bbpAPCCQ==
X-CSE-MsgGUID: wvZcuPLSTCOWYc/tu1AxCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58150635"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58150635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 11:10:55 -0700
X-CSE-ConnectionGUID: KAiBmdafRFC+T5nfAoIJug==
X-CSE-MsgGUID: MiwaECyQTWyio88Tcp0Tmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168665801"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2025 11:10:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upWDz-000LcC-1k;
	Fri, 22 Aug 2025 18:10:51 +0000
Date: Sat, 23 Aug 2025 02:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
 41/76] arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: speaker@0,0
 (sdw20217020400): #sound-dai-cells: 1 was expected
Message-ID: <202508230242.M6lu32AN-lkp@intel.com>
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
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
head:   ffb2a13619fdca58779259a6a7f8eb5f710fdaa4
commit: 6557977abd0dad01345ab3d5e77b9e51aece717f [41/76] ASoC: dt-bindings: wsa884x: fix dai-cells
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230242.M6lu32AN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230242.M6lu32AN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508230242.M6lu32AN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5295.27-5370.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3008.27-3100.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3122.27-3185.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2766.34-2767.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2867.31-2868.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: speaker@0,0 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: speaker@0,1 (sdw20217020400): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
