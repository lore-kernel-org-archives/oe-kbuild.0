Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7AB1C3BE0
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742483408; cv=none; b=odW1k+uyNjMU6b89+vuCR3M7CwwrcVHEBqRFhf2y0fpYE8qPRQd+uXVwO2RiWdImR2tGpmk/JDA/sOFIyupWQWL2oVQjt4WPEO8ijvNqxU2V8ZxAT8zY1VevHRTjtb723bbq9O+yC39ZDv730hBT9Q1TTbFJprLhUBAZDTf6Oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742483408; c=relaxed/simple;
	bh=7Zbl4tpd9lLuLGTxVHyfH9KGZlkjY25d8S42T3fBmlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b/fW/yMXM8GANB+opN3SFadffVVTfmQovNCkQvvsMmctn7uDVzEB3DGkEFZqCSHYJDBU0PmVxLzBXBxjPTJa8byiF27dwdUdW7Zsn0WdoxEGU7BU6kgm6iqXq2ISKESJpLFUnnCxDzHoMSmdowWToZEt0RfBXHNNuno1qrW+waI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3d4zhq1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3d4zhq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742483407; x=1774019407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Zbl4tpd9lLuLGTxVHyfH9KGZlkjY25d8S42T3fBmlA=;
  b=C3d4zhq1epP2++mI4u81SAY2wsaofV/eO4Njr7gMPNEgOnMvHPrfozUg
   Ayg17LcExjjws9ea63aSZlP1rPTUaWlZug2b0f3/OA/a87P1VEtSFk274
   XAKgjRkdo8ZgbYrX59xvKZhNAeeJE0DISGOKn5bonWDpNIAhvb88qV+qh
   nqD+6NpW9BPnN24cWdB6+LsL2sMEv3OGcY9X+3T70lyJbB7QhQCdDn6df
   xLTzRW/tyAzqMBB3v9FFbMOgkLtv3wSkf7QfNo//72AqaktMBD3TauLyb
   sXSaMuPrtftXGeanPFivcfvoKSVzTWQF/XB+u0HUWrZlohtgNgPU5tZfH
   g==;
X-CSE-ConnectionGUID: TDVyFWQkRIuC7vXgB/jv3A==
X-CSE-MsgGUID: sxdd8oU4RymSYF9eRuKuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="31312160"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="31312160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 08:10:06 -0700
X-CSE-ConnectionGUID: CSvWcz7pTo+PAln17OwJEQ==
X-CSE-MsgGUID: RJKqe1dsRxu5J9SC2brYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="146338826"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2025 08:10:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvHX0-0000WZ-2r;
	Thu, 20 Mar 2025 15:10:02 +0000
Date: Thu, 20 Mar 2025 23:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sc8280x: Flatten the USB nodes
Message-ID: <202503202206.N4EMhLp7-lkp@intel.com>
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
In-Reply-To: <20250318-dwc3-refactor-v5-7-90ea6e5b3ba4@oss.qualcomm.com>
References: <20250318-dwc3-refactor-v5-7-90ea6e5b3ba4@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>

Hi Bjorn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c4d4884b67802c41fd67399747165d65c770621a]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/usb-dwc3-qcom-Snapshot-driver-for-backwards-compatibilty/20250319-030854
base:   c4d4884b67802c41fd67399747165d65c770621a
patch link:    https://lore.kernel.org/r/20250318-dwc3-refactor-v5-7-90ea6e5b3ba4%40oss.qualcomm.com
patch subject: [PATCH v5 7/7] arm64: dts: qcom: sc8280x: Flatten the USB nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202206.N4EMhLp7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202206.N4EMhLp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503202206.N4EMhLp7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a800000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'ports', 'ranges', 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
