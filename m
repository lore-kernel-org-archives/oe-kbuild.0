Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FB18DF80
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754111434; cv=none; b=p2dA1aNwQsiJI+oRAOG5WNOBAiDncEJaKS5197hUU7yOrpCRQPtW4UzinRdeQOVGHAdNmYUc6nKj+m86WLYcfYZazWIukj6fNfjcuCp3tVsPLeurlp310WjxSST3DgnV/K9tLwCWXJ80tXJWScmEPHBdAvm+fOgOPl1ZpzqRF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754111434; c=relaxed/simple;
	bh=k0hXEIj5U1OyvemYg+ldJtJxVWxH8cOL+7rtK4VUHoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R60x2pmaRQ3DEqNrqvsX2AVEpGLQI4MUEIg4x5xPh5xGKplhY4II2StG64so6ZpGlaPdD199owJ6AlL2iihcV3gM4bM/Z/LJQwSXVoK3nVEwZCB8RPyjC50HVPF9CVY223KQsDgZevNcvPrEIeB6HlbRq7x9s7ECNJIA+66JhBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNaF8Vf5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNaF8Vf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754111432; x=1785647432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0hXEIj5U1OyvemYg+ldJtJxVWxH8cOL+7rtK4VUHoc=;
  b=XNaF8Vf5ITfKiVd5/d+bWV17ZYEvS6Js2Y91giO0AjEse0BoMVbX/R3v
   lsW67IphPR7XpkaLio0/KtUB3FY+U9NISEM7hwcvLxaaJg5eOAYJnuBc0
   METpEudQCCgjAs+49n3j4NDOV83RBeZNyBNdB1/YW9j3UajW+Q+tkWeNt
   2RMmoswRmWebnlCon1RgbAP3JnZz/QyT2spUs4aBWgQBXUrc6OSHA7iot
   MUMmP/IViDdcmgwvDy9vbhyoj6M1umanVedHS09URabRxeRdvlOGEfz2Q
   0gRKNfg1lLK+RAD7GydL7WAi6FHsAICkMLQEQfROG61EFkkwaHxVCKhZy
   A==;
X-CSE-ConnectionGUID: r1NulXDjRamFCVtfKBBAaw==
X-CSE-MsgGUID: xENA1nUgSrOisfh2rSCB7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="74044537"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74044537"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 22:10:31 -0700
X-CSE-ConnectionGUID: TUKEGmY2TEm074fSS8YtZQ==
X-CSE-MsgGUID: JTJW+eXESrO4apGjW+DguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164071747"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2025 22:10:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui4Vo-0005Bk-0B;
	Sat, 02 Aug 2025 05:10:28 +0000
Date: Sat, 2 Aug 2025 13:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:zynqmp/dt 12/12]
 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000
 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202508021319.vtseuaVT-lkp@intel.com>
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
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx zynqmp/dt
head:   10a57c5627e4cfc2a447119973352e6b165147d8
commit: 10a57c5627e4cfc2a447119973352e6b165147d8 [12/12] arm64: zynqmp: Add support for kd240 board
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021319.vtseuaVT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021319.vtseuaVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508021319.vtseuaVT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
