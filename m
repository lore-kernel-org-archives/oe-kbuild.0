Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBEE13A26D
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736399138; cv=none; b=I6dvT/VTY1GDx2gNQUXDlsYDyNsutIPevOgJpnrL+y3wbRPmwFLEC9J7S2Opw9Wt4m2Yn0aTNx3DEUrrU6ZqS89kM3OfOl6kNZeWAesqCD1nc3obpIfQQB8LhK5Im2oCH9Ma8lG5rNEgg2CLlDX1AkRppyOhZ3yGKWHUT16FNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736399138; c=relaxed/simple;
	bh=jPdwQ+jyzTWECaswLDsICRE564jYtumEWE7tS69r/8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxBsdsv4HFixNLT6bSygITqkgujgerM1r8jgXOxRl7TfHDJpGHHFqveZwRYR+MVGbs0RBfcw1a2B5e4E/ZSkYti2eFUaV6gAmMRrVwyTaki0kiD+LTiAGSEhQipVedkXXtc5NEhDSDi008oeDgwd+MzWIl9njpSji/g1WqKge3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfWMAxNE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfWMAxNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736399138; x=1767935138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPdwQ+jyzTWECaswLDsICRE564jYtumEWE7tS69r/8U=;
  b=HfWMAxNEItGws2218cjTBGTKBWIfMzdKnhnraXabaRLrlrG0O0h+Ag8a
   Dn2Qj5utwiY0BCyvGbQRB1hJAr8HKiaLFr626Pn0v9LrTQPFJKoqaL/fZ
   VtCvU8WwNbEAEuW56z478hcEjIO3Nq3lty9uoVae9KVXfOxf5woVviDNB
   iLypteIp/8hdk0k9rAqvybQbPbpK2bwAdpoLdijDWM3WPGnfLX76Y/4HL
   oQUogAscNLL2w+P60QdxMUpPWWOqnzSCoflGmfULt9TZAcMOp10FoXsOO
   bAYU5ls1oPT95CTEW1WuyrhQLY+Z3odUTVTXRI0t/8t7aLjApVLHZ5YjD
   w==;
X-CSE-ConnectionGUID: gOnF10xhSa2ujaftLhwTgg==
X-CSE-MsgGUID: 8NweKB9bQj+iKIsf2C+T7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54063564"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="54063564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 21:05:37 -0800
X-CSE-ConnectionGUID: UQl/65zGThy78IMD7cKo4Q==
X-CSE-MsgGUID: TQFDfS4iRAi1eUsQQ/WHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103104717"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2025 21:05:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVkjc-000H4D-3D;
	Thu, 09 Jan 2025 05:05:32 +0000
Date: Thu, 9 Jan 2025 13:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 200/223]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: ethernet@23040000:
 tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes:
 '^queue[0-9]$', 'pinctrl-[0-9]+'
Message-ID: <202501091240.U8rwEGPO-lkp@intel.com>
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
TO: Yijie Yang <quic_yijiyang@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   9eb81b31ab62cfaa243c6fe948b9f7cfdfdad666
commit: 787cb3b4c434adf117236e0ba23280264e73f90e [200/223] arm64: dts: qcom: qcs8300-ride: enable ethernet0
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091240.U8rwEGPO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091240.U8rwEGPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501091240.U8rwEGPO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible:0: 'qcom,qcs8300-gpdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@20c00000: failed to match any schema with compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible:0: 'qcom,qcs8300-cdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@26300000: failed to match any schema with compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
