Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864736AF5
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740927115; cv=none; b=qmOUW4U1flmsS/DJTCs8/DeldPfnnZsVJ7cKZsi4m6HFVG3byGWLy/3I2lZoIcFWDKQ/1qP/i6b2OnOIjqpkdh7v6D1aBd9UWeEKWqLN6uYOL3ChCTX8sFXQVlABjivUlyD+6XcNKpO+6q+UWKOH6JvTj4AAQSSivJqy6QCjCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740927115; c=relaxed/simple;
	bh=4TnTgYrR8NLvRK8ifphGs+4q8BjSWuyR9PR71lHX+NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKyJkTNRF8nNxBMtzo+uvz8S3txPkx1tyHmFO+eupGK+Dup4B0Ob5lWgU4pr2M85oJbK0CJt9mdVRm/YTImcgaTF2npWjcauff4MrH0XMkD9Z8CX9tBc10PLXB9QzeiyulX/v+l6pDLolz94928BpdMRiX7rK/725Y1e+Ilnbw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZteVBvQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZteVBvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740927112; x=1772463112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4TnTgYrR8NLvRK8ifphGs+4q8BjSWuyR9PR71lHX+NA=;
  b=LZteVBvQNkHy6qPPxP2o9q0cPqTRN2WH1tPmGsdmKEizrDXm7OJ3fC1+
   dYVG59TqzBqUl0soaVXDAnv0b7WndMmtvr2LF02cP21NgO2DrruFgUFhu
   s/HDGVamySTCF5i/CVj8K1zNXUoBSDFLT4444PxVYZUp/zbWp8IYs0A8O
   a5qjQib8xCVMbn+RCcwZ4jVmcwKGqSMPJMnXQI4V0Daq9uX+rjJv+FoJO
   IbAWZ2jHtklSPpmEfqgqhbBgCNO6h99mguwxTYcQ1JanpCAfgAFX+s5Og
   HDlaZl47ly2y962j0cteW5rpG2lF2zpasaP1s0wKzFNE7+e2z/aV29NeT
   g==;
X-CSE-ConnectionGUID: 64yWg2NaQZynHM0zs7d/Ow==
X-CSE-MsgGUID: 8yDSSGQsTLqjKcvTtWghRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59350375"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="59350375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 06:51:51 -0800
X-CSE-ConnectionGUID: zXZ5xAG7SuGmRoA0jRYKCQ==
X-CSE-MsgGUID: CgNC30YcReuZtjPMBwF9bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117972490"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Mar 2025 06:51:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tokfU-000HO2-2Y;
	Sun, 02 Mar 2025 14:51:48 +0000
Date: Sun, 2 Mar 2025 22:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 23/50]
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: /soc@0/thermal-sensor@4a9000:
 failed to match any schema with compatible: ['qcom,ipq5332-tsens']
Message-ID: <202503022211.9Ip3nRHR-lkp@intel.com>
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
TO: Praveenkumar I <quic_ipkumar@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   0e2a500eff87c710f3947926e274fd83d0cabb02
commit: 3fe12c798f9abf26933b35b91d7aaaa77349c63c [23/50] arm64: dts: qcom: ipq5332: Add tsens node
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022211.9Ip3nRHR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503022211.9Ip3nRHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503022211.9Ip3nRHR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:186.30-189.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3a6: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3a6)
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:206.25-209.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@3e1: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@3e1)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq5332-tsens']
--
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:186.30-189.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3a6: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3a6)
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:206.25-209.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@3e1: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@3e1)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq5332-tsens']
--
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:186.30-189.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3a6: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3a6)
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:206.25-209.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@3e1: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@3e1)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq5332-tsens']
--
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:186.30-189.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3a6: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3a6)
   arch/arm64/boot/dts/qcom/ipq5332.dtsi:206.25-209.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@3e1: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@3e1)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: /soc@0/thermal-sensor@4a9000: failed to match any schema with compatible: ['qcom,ipq5332-tsens']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
