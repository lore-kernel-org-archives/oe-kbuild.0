Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43214A4F9
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283119; cv=none; b=sGN0e3YmwfvULsdla3Pj2+jzjrTVo/1e/7lev15l7vIJF6cmFyLA7pXOLCfMIPm6jglEUNHbsJcNvKycuEXQ/KVvGWP15x9atGfLnQoxnNPWwaVLbJKawWt3BTkp4Xddu4xnJ9drR//HW2a2FHOCBzN+LmzKauno02bBPYMFoyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283119; c=relaxed/simple;
	bh=j6xiKpDUntGPPKnWrPfxTC6e5NikPk5koZ7St6LwRz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbLJvRiiQeH3U5mYtsHsbMHxCDttnBQg/Ac4GhI6jO8ERKcNJVBCyaO56iZN6Sviq+LiEAaRFzfeeFuQN07h3J8Hwl7+otYbrOsxc3XNJMinOwb0/YLJntheEAZx9oVEVvnkIMA+WIKeZ6qOSlm+kpOveK+9OewoBonjjSO42nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lN/VZxKw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN/VZxKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742283118; x=1773819118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6xiKpDUntGPPKnWrPfxTC6e5NikPk5koZ7St6LwRz0=;
  b=lN/VZxKw/nwnz5CU2sX/zRGbzSoJzepLURJyOwDHrkeUEDlcVa8FdTBn
   6fQC14P1ZriPxoh9Pg3DdB/DSHhvG6z2o3kXNmeW61y+afQiblBcGpBrM
   PNmpaXfkOkwvt9x/4JYfADPv5N+MIkFcA/xIDaDjZ190QgIBJ8xr6oXmn
   qceTc+i4KZE8oFsZHJOwhjTpbBKQgiVfxoCdArAUdaicI00sIbbrOzP7n
   TrrGQIPNzC7HFwxZnxXheTQ9Tc6Byac8xnQszdnEZKG0qwJwaT7kVjWPM
   o9JGyYb2fZBZXjCymZCjKUvRdW7c8OxDxqyvL47Azik68a7j1OV/zbOyY
   Q==;
X-CSE-ConnectionGUID: HJeG0FuaTFag9cf5pSuDVQ==
X-CSE-MsgGUID: 14h59stTSEeacPhmul3duw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42656334"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="42656334"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 00:31:52 -0700
X-CSE-ConnectionGUID: bRcjSvzGSpqxPq+ZQAkmnA==
X-CSE-MsgGUID: FZzDYfavSb2Br6vuDtGtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="126372049"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2025 00:31:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuRQS-000DWn-2A;
	Tue, 18 Mar 2025 07:31:48 +0000
Date: Tue, 18 Mar 2025 15:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 171/183]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2:
 pwm:nvmem: [[356, 357]] is too short
Message-ID: <202503181541.xXcM7Ud8-lkp@intel.com>
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
TO: Vikram Sharma <quic_vikramsa@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Hariram Purushothaman <quic_hariramp@quicinc.com>
CC: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   bba4e13c0f337df4cab3d65ccdb5524eb81a00bf
commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f [171/183] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250317 (https://download.01.org/0day-ci/archive/20250318/202503181541.xXcM7Ud8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181541.xXcM7Ud8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503181541.xXcM7Ud8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: wifi@17a10040: 'qcom,calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2: pwm:nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm: nvmem: [[356, 357]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
