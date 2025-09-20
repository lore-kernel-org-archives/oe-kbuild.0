Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F1188715
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758389070; cv=none; b=qFiphgnInK7MF6WuLWC8PwCNDAUO/S9lA9AvJ0sfse4t9272LMlbxi4Il/XkZj7oZZ8CBF+vCCfQO3fVifhLBKuHyC0+jLa2UZAIrwcpe4jifdBSWuwKwbNFXtensu9sir2mXhl+BY/KCCkAxWwtR09Fj+ssrg+VLU0MXmoDmh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758389070; c=relaxed/simple;
	bh=cCsl/DrpAzC1OpxqvXUYGKFRk/j1qkykI7iaziGsvfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lw90NFK6zmGPJS3AHz/Dt92a8TwUaUlHF8/YWVwJgJs0RgtIssq45Air7HEBi0tXpERQO7Rioe39hQOMdspr1CnifJQ/W2KYkMb4iB+dFMxSEIqDnHwiP2P1wYw58y8Fl0J/F6bMwfQIX+jRgUhMtQiltdegQG2d3CgHDgYpou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TibmMjeu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TibmMjeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758389068; x=1789925068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCsl/DrpAzC1OpxqvXUYGKFRk/j1qkykI7iaziGsvfs=;
  b=TibmMjeu0/LvSLfrFpCbXPX6a4B9yaRSOLoAsHv0WLPOreY9fP3pDM7/
   7yAGcOEjUSRSUDbegzzr/TtxcueaZMmxz22uTDbA9j13qNsFuFCvLCDOT
   9ybFskKWnNM7sxRpqUs9m+ni+zPcJDmoq800AoyH0YgQV11v9eHtV7r9/
   1jHoe3lxb7QzdlXFKtvfMI/dojV3umz88XUP0pAgcGaA+rG9N9xk+HBhx
   g6ijV3iyCnDH/KB1i7xXknrzylinvryD10/v11IHqHhuvxGcIo0uP0FbB
   4u6MyjVjGhzP0jnlBdstPoWQc1a24wWFgZXv9E8ndScv51tU4QVUhJRvq
   A==;
X-CSE-ConnectionGUID: 1wfnY4vnSv2qj8krEZE+tA==
X-CSE-MsgGUID: cYLw+V3tSSioh/LpE2/QGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="64530268"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="64530268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 10:24:27 -0700
X-CSE-ConnectionGUID: OGIofXEZQHSJ4wWIk5ITlg==
X-CSE-MsgGUID: z2yqkDWPRraLjz6zGGwLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="213261859"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Sep 2025 10:24:27 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v01Jw-0005aR-1g;
	Sat, 20 Sep 2025 17:24:24 +0000
Date: Sun, 21 Sep 2025 01:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 196/265]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/video-codec@5a00000: failed
 to match any schema with compatible: ['qcom,qcm2290-venus']
Message-ID: <202509210139.sRFELXs2-lkp@intel.com>
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
TO: "Jorge Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   2f695d3eac36601d383155e3bba189f06a0f750c
commit: 7a37bf31e3a736d86c3c801ec2116fde4fb395ce [196/265] arm64: dts: qcom: qcm2290: Add Venus video node
:::::: branch date: 15 hours ago
:::::: commit date: 11 days ago
config: arm64-randconfig-054-20250912 (https://download.01.org/0day-ci/archive/20250921/202509210139.sRFELXs2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210139.sRFELXs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509210139.sRFELXs2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1841.27-1914.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1799.11-1809.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/video-codec@5a00000: failed to match any schema with compatible: ['qcom,qcm2290-venus']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
