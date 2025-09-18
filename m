Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402281A3166
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 04:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758171427; cv=none; b=ggFt7Bxo0w0MpsHl7c4Lv2cLK/beYrhGDPZ8xKrY2O5Vt6mRXlktsBucgsRNI0WOsupWmEChp+Flhm9cpZcLlY0qgydWPfE4I5WTsd80NFJOvt9suTiUJBdIjC8f8J7UTwzWuDnOnN74j9NGL2n0bCSKSWgY1F3m0sDc7YgZec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758171427; c=relaxed/simple;
	bh=u10rEuAqtKjP6JTzE1xC31aDTE+VWjCB46g8GjwuY3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saLrbogHIjYBFGSFbXccNWDgFzDaFl7f9rmzk9F9EmDNQPP/sFjTxkYBU6oigWdI3hVwauji1AIMRP5FiMOYteDHRfBGcI6A81utoiCzolYdBXHd44mEKYPGIoJFguEnA9uk+KrapzUXbQsSS1jL/piTeqWn1rVmDRWLDtHshRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5DksIcL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5DksIcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758171425; x=1789707425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u10rEuAqtKjP6JTzE1xC31aDTE+VWjCB46g8GjwuY3A=;
  b=j5DksIcLK7zYHW79+QQMY6a3XKnbwjS9/EayzBvaWsVTJtt7B9PR+qUU
   uGyIT7vKoU8drl9jg5p3KmO7npTeyOFk2bgF2NEDlO0Ri+0M/Sj7kngYv
   WjuLlKIuioZW1EEXsz2cFIxe7mM7kqLusJZ2t6GTB3wGhRap70T+O3L3Z
   v+TiXluTbr1YVOevYVzfOyEHKFFs6FB4S+1vPZ+AMKenMwpUA8hoBxrAI
   x/GhVRrk5RPmLfKlEMmJkeOwYzVA5WT9FaR8PghhhxHP60k0sBG1eyDHV
   F204u56lxeF1w2RfjxWQR4/L/K8DvkCcuNKQnvGbuVbXLMv8dCGegxFfe
   g==;
X-CSE-ConnectionGUID: DshLXgwTRNmyuenoJfK9WQ==
X-CSE-MsgGUID: FrxKpZL2SliUnua2pfF/Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71171470"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="71171470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 21:57:05 -0700
X-CSE-ConnectionGUID: 6CW+RzVNQUOdZf8CHJssoQ==
X-CSE-MsgGUID: bGrv8dPDQVGX3AIITrJL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="180713857"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2025 21:57:03 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz6hZ-0002lr-1E;
	Thu, 18 Sep 2025 04:57:01 +0000
Date: Thu, 18 Sep 2025 12:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 218/256]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed
 ('interconnect-names', 'interconnects' were unexpected)
Message-ID: <202509181227.V8zrloT8-lkp@intel.com>
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
TO: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   1081eafa1bca16d3610bf44f515550d060526dd4
commit: 71ee90ed1756724d62cb55873555e006372792c7 [218/256] arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181227.V8zrloT8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181227.V8zrloT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509181227.V8zrloT8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clocks: [[56, 70], [56, 68], [56, 94], [56, 72], [56, 74], [56, 77]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clocks: [[56, 84], [56, 82], [56, 94], [56, 86], [56, 88], [56, 91]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
