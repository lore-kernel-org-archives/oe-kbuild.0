Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B113264D6
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777735928; cv=none; b=bhgr7agh99+w1elYsk3xBUky+zxQsAYJ5LolRE2BHBOMQJZ9dfEPguWMmqWp1b1Jui6KqPD4TTynhaPhtFh9vQVnusxQm932v8dBTrpw4BBZlOGX0t7Vj2h6I9aOQZHphnLHhY3kw0r1CyAZJodUOZfi/b2WillA8ZrM7vsi/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777735928; c=relaxed/simple;
	bh=zItJZyArfqC72pzoYF3v1VHhEKC1DN/5oc0noWb3YGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RtlKbJlnZ6jIOn5f+XrTdyXRZO0xSbXwZCaHLzDdzqtzKGlOE5xCOGS4lhQtFLoLbWN2IUCheih7IX05Ddu+WxmSzWNUL6qaeXRVijTukXqc+v56E9Oh1/6OaIVQ68R5BdUrw/NCcFj+GDhwSGoyZAmVu1LiHM5CvaxESOwR6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBIfKtZm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBIfKtZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777735926; x=1809271926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zItJZyArfqC72pzoYF3v1VHhEKC1DN/5oc0noWb3YGU=;
  b=HBIfKtZmix2og58tU/fcHMKK7EVyWo9FMu7mUrgwaDpUZHmu+V1w4KKl
   pr/uBoXOzJLJ8l4Wc8bH9KMeI7esBVw7C+G737SVju6MIqCjo1iYpGgaV
   gyMEWe4LMzJGybgHK+SPliDFMLF8OrwTmpMhO56FANq7cpPBD9Sf2+gti
   KAqwQY1jWYdeA+TNICoDvN4oDvvEZo77t9Hr1fDc8/aAEy/y60T2j3NT5
   zJjEbmaKExpf1ovu/dOPoFD18bOe2zNWwJoHVtqTmquVWHlcHlmx3GHoL
   LhTOEMOZV1OaldvbpNMVQ80s3QoPtUhDzwzKxUZe8Pgyq0WsrOvTrsagf
   g==;
X-CSE-ConnectionGUID: kIbaGKy2TQ2Lr6WhFjoTpQ==
X-CSE-MsgGUID: Hhfe9RJ7RjSpbR4k5zC7/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82520501"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="82520501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 08:32:05 -0700
X-CSE-ConnectionGUID: mGFanc/JR0+OYNYs147CJg==
X-CSE-MsgGUID: 50BbtCBHREq0cgyySRlZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273215376"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 08:32:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJCK1-000000005ID-3XZ4;
	Sat, 02 May 2026 15:32:01 +0000
Date: Sat, 2 May 2026 17:31:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART
 node
Message-ID: <202605021703.rLh6U2O3-lkp@intel.com>
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
In-Reply-To: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
References: <20260428025652.662502-1-shuai.zhang@oss.qualcomm.com>
TO: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-bluetooth@vger.kernel.org
CC: cheng.jiang@oss.qualcomm.com
CC: quic_chezhou@quicinc.com
CC: wei.deng@oss.qualcomm.com
CC: jinwang.li@oss.qualcomm.com
CC: mengshi.wu@oss.qualcomm.com
CC: shuai.zhang@oss.qualcomm.com
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.1-rc1]
[also build test WARNING on next-20260430]
[cannot apply to robh/for-next linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Zhang/arm64-dts-monac-arduino-monza-Add-Bluetooth-UART-node/20260501-211833
base:   v7.1-rc1
patch link:    https://lore.kernel.org/r/20260428025652.662502-1-shuai.zhang%40oss.qualcomm.com
patch subject: [PATCH v1] arm64: dts: monac-arduino-monza: Add Bluetooth UART node
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2051 (https://download.01.org/0day-ci/archive/20260502/202605021703.rLh6U2O3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021703.rLh6U2O3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605021703.rLh6U2O3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2504.4-2507.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: bluetooth (qcom,qca2066-bt): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,qca2066-bt.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
