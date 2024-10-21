Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C7198837
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503641; cv=none; b=cjrtZNUdzPp7d5kpMAydnJ/a3daoVAwWi3UKblO3M3Jr+hSizJcLw9JoRkbpMq9Kk+/KH2b4ZAhs+xEXJr5rRWa18p8w4JgMgdEfEGW6gSCj6+oPzvSZw+agCslK8m8ayhGJYhy4JLM3/bPCpeAZJ/CL3Q0TFnclXJZTtAyXbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503641; c=relaxed/simple;
	bh=b3m+R6+mux4Hz9tNH9u8W2d3qsvFXUPDqfBBsDPa8UI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EauQUhSQD+bGp/Y6UllrO96+zv1RpiuutJPWbAMZ4oKFG0CB25G1retxMzHweQVnu+qa63yEQsAtKgzbhuWUcvQklpbf3hvBUn2v40Z9jhxqQhtNNOK9rIwUdRUQnye8yivX5QSqOhAYixafnYnkN32qwhkjP/BmFyQMhN9HqB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctC4uduI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctC4uduI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729503640; x=1761039640;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b3m+R6+mux4Hz9tNH9u8W2d3qsvFXUPDqfBBsDPa8UI=;
  b=ctC4uduIJnkgHYkzvg0cFRvqX3sfT/RUeTFnPCnHgPHUNpcNpH+02z6v
   J54j+ihGSSrkD/jlXKCCoeMG+ns/wSicUWw9kXblcMgmwZCClrZeMyaE4
   xL36bzafpgOLX9g8QSD38I9M9ZoFUCFnjIbZa4cWa4pY0XFjS1lvlPrc3
   rP1B0aUo0x10KJ554pcBa17eD+/Tpgx5ZB5I3Z1lxjogYhXrgIqCMwduG
   jwCi24wbZTEFGlIcvgXKpfgScU786JlCNn4OSfDZQOP56yNi4S9hBwG5b
   Yce4f8R17vnx/88UuN2BPpOfK197UkYHro8JKFq7fnrMtWHNjG3vIou4U
   w==;
X-CSE-ConnectionGUID: ADtTPD9JQtyOjr2G/ifUPg==
X-CSE-MsgGUID: LXs2eTOfTrivzLJ13HtVmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40374881"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="40374881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 02:40:39 -0700
X-CSE-ConnectionGUID: qbOzCigDRZ+0LRwuJQOnxA==
X-CSE-MsgGUID: YlImqaxAQpONI2/xrrFlCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="102795413"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2024 02:40:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2otv-000RPx-22;
	Mon, 21 Oct 2024 09:40:35 +0000
Date: Mon, 21 Oct 2024 17:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi 6/210]
 arch/arm64/boot/dts/apple/t8112-j413.dts:133.14-152.5: Warning
 (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg
 or ranges property
Message-ID: <202410211759.RvwCuGSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi
head:   de1c5a8be0ee99602e472f3ca861cc2d249597da
commit: 95ae01eb93958c24677e2b4a543f728fdeceed81 [6/210] arm64: dts: apple: t8112*: Put in audio nodes
:::::: branch date: 4 weeks ago
:::::: commit date: 5 weeks ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410211759.RvwCuGSZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211759.RvwCuGSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410211759.RvwCuGSZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dts:133.14-152.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:154.14-163.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
--
>> arch/arm64/boot/dts/apple/t8112-j473.dts:103.14-112.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:114.14-123.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
--
>> arch/arm64/boot/dts/apple/t8112-j493.dts:122.14-141.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:143.14-152.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)

vim +133 arch/arm64/boot/dts/apple/t8112-j413.dts

95ae01eb93958c Martin Povišer 2022-02-19  127  
95ae01eb93958c Martin Povišer 2022-02-19  128  / {
95ae01eb93958c Martin Povišer 2022-02-19  129  	sound {
95ae01eb93958c Martin Povišer 2022-02-19  130  		compatible = "apple,j413-macaudio", "apple,macaudio";
95ae01eb93958c Martin Povišer 2022-02-19  131  		model = "MacBook Air J413 integrated audio";
95ae01eb93958c Martin Povišer 2022-02-19  132  
95ae01eb93958c Martin Povišer 2022-02-19 @133  		dai-link@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
