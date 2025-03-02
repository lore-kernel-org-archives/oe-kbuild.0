Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69F2E630
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740943519; cv=none; b=iP8UoY+SbUsOoQgCF7z0k7ZSLTMGQqv6Ga6aBxM9jauzkKArSqc+7K3ijKlnEe+h0OPt6mk2/hRxpxFlRXvZDVyiex60JPEQNlmZR3P14ZXLgQGvEwvP7hxZy5T1I26Yio8suTvLtOhGyMMLpkXOuRm1/3xhmWNKVtQMHrHIIA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740943519; c=relaxed/simple;
	bh=nim7UijBtus3hHIKf7bEpp+j549ZFX+WZiPdxOvToCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=COwLGOKhNsXE8bS0unYB2aVPdxpdTsIBWwT0vZK1RY7velw9j94QV9c/QubzS3lC9Y6cxi+LRQUn8TqU5ejooXzcMOy2sQPxqdGnBjVuk62Bx2VyviSVd3d2zLYE9Z50WXS27DyMAzNfeEVe2AL1sEaL6om4Yw13Hc7RaVnyB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axHoTcPH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axHoTcPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740943517; x=1772479517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nim7UijBtus3hHIKf7bEpp+j549ZFX+WZiPdxOvToCo=;
  b=axHoTcPHrnL1lKTylCC8X0Rw2RLKxlEVmTQKTvXmHqQdlOrsSIJIAcAr
   TK7wRrvDSuT8lx6YyBpCT+SF1MJLg9sGWSZ2yxZ39Zmj3xmhfoDl5te/w
   +a6dlyaK8W0aHTBMHKQ7Y5x9U2JcW/1+JGZBPYMUzV5OhFdE5VKyGWhGB
   QGS4IIliYfzOwknQwGd9lqjq5plDHX/RLhTiyf7kcpC0e08fgJnmgBCDf
   j10ZXNRGccVplfcg9YdBnMEasz4QMUUvQJVLh5/FsqG663TK7kjSlqIYz
   tn8F8+L3aMZp4Hm2ChsjQ9yjgxDPOHHxyH7DSlloAI9jlZTXGOvZx0ii0
   A==;
X-CSE-ConnectionGUID: o9vDq1rfSBiGzNj5JMOfFQ==
X-CSE-MsgGUID: qNpjJneQSaaM2DDf7hYLBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53223152"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53223152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 11:25:16 -0800
X-CSE-ConnectionGUID: GZaew5pXQc6OhYjEr+oePQ==
X-CSE-MsgGUID: 6064KMWSTkeS+hV1QOthdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="117815144"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2025 11:25:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toow5-000HY2-2L;
	Sun, 02 Mar 2025 19:25:13 +0000
Date: Mon, 3 Mar 2025 03:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 25/50]
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/thermal-sensor@4a9000:
 failed to match any schema with compatible: ['qcom,ipq5424-tsens']
Message-ID: <202503030327.7z2fvxtu-lkp@intel.com>
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
TO: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   0e2a500eff87c710f3947926e274fd83d0cabb02
commit: a61adfe29624bd1a4530046e76808ed60927b9ad [25/50] arm64: dts: qcom: ipq5424: Add tsens node
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030327.7z2fvxtu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030327.7z2fvxtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030327.7z2fvxtu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:391.22-442.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:482.22-535.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:166.30-169.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s10@3dd: duplicate unit-address (also used in node /soc@0/efuse@a4000/s11@3dd)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:176.30-179.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3de: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3de)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:196.25-199.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@419: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@419)
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq5424-tsens']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
