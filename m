Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5737187C
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784829713; cv=none; b=H8WY15F1cGD7jxx/B6tpXq9+8zzyJZxAt02gQomNTx7bPll5mwyGv0PMOsNK2M67ODINaXsS+csv5Y1AgX7mGy3sEtpIoG4i3mQFDXm5tLGlOdttur+W/1DoLuG0eMjWA56HkX01hRHhPDn5w6kRZ5doV0N+HGN3TYO1ghaAiPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784829713; c=relaxed/simple;
	bh=YwLLjM+uRLW+4NrGGxjUd39XDVcgqxlZKgVcuadyylQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERp1asZ83yUr3NxH6SvqbREPn6HU5zMPgY3Fg13Xjh/LLqdbWMHlg4WxrgGY0tMxAVha9t5pOV0KRnyHzsArBmvQoO0z3vQ8YnVNesVUiZbKUgrED25+0lIzfcLIcoFMQeNudZ4almHR2vhz9zZBVYB+dDyLYTWUg3BnZzVtXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNwopMA+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNwopMA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784829712; x=1816365712;
  h=date:from:to:cc:subject:message-id;
  bh=YwLLjM+uRLW+4NrGGxjUd39XDVcgqxlZKgVcuadyylQ=;
  b=PNwopMA+pfbA10g5KQWYP+r6k5luZBAaYT7XcxzDtTgxs4OHuvnw4WkI
   wzOwFsfOzchFB7tq8tMV86rj/Vcf5y9qml1S4TEd/FkqHl+cBRe7MxhfK
   1EszO2OtDSHDgpg3eQHs6mlEMuSRupv2X4wQSU1GDRrLoa0PIX11EDBtv
   m9yrlQFc3nJ9+qCfPk/ojcB35GVzHg89u6WzXE4rkd1MzB7ogvSqikNKx
   gM6XOkY1wdFyqqn3oeCEx5prPHv+TD9S097n31LhyKvhaEdaU5FSONXRF
   thDRKAF/1DUGlvamGCeQyiND/8mnlhxZYmJkiqG/vn5DPYT5QKGby6xrP
   A==;
X-CSE-ConnectionGUID: qKOuFgqtT0+V9JlPYLti2Q==
X-CSE-MsgGUID: SwH+vv80TBenGrOBYsOo0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111036283"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="111036283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 11:01:51 -0700
X-CSE-ConnectionGUID: 9HaFoaNSSAqmOPKLQpFzXw==
X-CSE-MsgGUID: ULOcEn6uQrCYc5NlqjwvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="262793978"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2026 11:01:51 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmxjw-000000000o8-0P1f;
	Thu, 23 Jul 2026 18:01:48 +0000
Date: Thu, 23 Jul 2026 20:00:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/kalambo-crd.dtb: touchscreen@38
 (hid-over-i2c): 'reset-gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202607231944.8dxFPPFD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gopikrishna-Garmidi/dt-bindings-arm-qcom-Document-Kalambo-SoC-and-board/20260722-192057
head:   1167acff9c09c1c62f2989d9ed06c9da3aca15dc
commit: 64b260fbf63b9e506188668ae747941341c26316 arm64: dts: qcom: Add Kalambo CRD
date:   31 hours ago
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2054-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231944.8dxFPPFD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231944.8dxFPPFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607231944.8dxFPPFD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/kalambo-crd.dtb: touchscreen@38 (hid-over-i2c): 'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
