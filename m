Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7C2E628
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731186126; cv=none; b=BQm4z/HXg7uRXWf5yKAeV4/d9BkKBwA+h2qBuyt1vRggpuV/b02PS4cxxINwVbessaBLbwl4vHelV6sQN6AfzfLTrrU0GaW6QBaYohMA6sBaaEl3x7gRjpq+6Vp0KAw9xLtAeGDVHUp+9j6CzdgJyHopji749S2eNNFc7dIhFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731186126; c=relaxed/simple;
	bh=rLo2bXEuHRiZ1Cn/TDH61WTmSv78Je/sk+t3uMFIvZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oa+oJisj4TnGMRbQtxvpwfEDt/p045AixNRWcTmJkBbH2xx1Zb+pn0/x8rbJmTFsSMdqzYeIaKqKokQwJFojJn14iAb9uSMzQyJRfr/rJq3FNlJaC3RjE5gwxGcWV3aqJTsxw+nKBDZFbRHbjZ0rNAo+gtgTnALTO9guadca0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgktshJT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgktshJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731186121; x=1762722121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLo2bXEuHRiZ1Cn/TDH61WTmSv78Je/sk+t3uMFIvZE=;
  b=BgktshJTwaYt6qRrR7PR6XogjIe8BcocIiEJI5guCsrsoSX+OBtnHHdH
   FB1+UzZy7o/5wkvagzw8hGzKzYp/3QzMMS1PQn+SK5EmXDMEUwA1bs7WT
   bUppoCwNMWaw2+TTBvly/wKdbII6YVVMahf+P/5VBFXIYidDoF4chCfDt
   LMuIP0DhKVT+HOVFfndSdPjUFVH24/QZA2Nr9rFD+zPPcPLgm6KQfyq3c
   z7JYXsCzE3xBWUlYwSYTcHww1oIH4PumnDeGyQXQkk9jETWJY7kN98SoM
   HGRqGwRTaYwLeb1vOBA+qBU94rxIfpvuZmERAPWG703Q7+GqPtdfCBlaa
   w==;
X-CSE-ConnectionGUID: 352DaOWBRJmKrMeGXCo7Sw==
X-CSE-MsgGUID: fCTT8J0kTTy1pNxIl+iPmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30456939"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="30456939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 13:02:00 -0800
X-CSE-ConnectionGUID: MBkQ7qchQzexy9jsciBWPA==
X-CSE-MsgGUID: s4DdVx0xS9m7hjCWToZ7KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="116987415"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2024 13:02:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9sai-000sdW-3A;
	Sat, 09 Nov 2024 21:01:56 +0000
Date: Sun, 10 Nov 2024 05:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 19/22] arm64: dts: amlogic: a1: add crypto node
Message-ID: <202411100410.zNzNOulC-lkp@intel.com>
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
In-Reply-To: <20241108102907.1788584-20-avromanov@salutedevices.com>
References: <20241108102907.1788584-20-avromanov@salutedevices.com>
TO: Alexey Romanov <avromanov@salutedevices.com>
TO: neil.armstrong@linaro.org
TO: clabbe@baylibre.com
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: khilman@baylibre.com
TO: jbrunet@baylibre.com
TO: martin.blumenstingl@googlemail.com
TO: vadim.fedorenko@linux.dev
CC: linux-crypto@vger.kernel.org
CC: linux-amlogic@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@salutedevices.com
CC: Alexey Romanov <avromanov@salutedevices.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20241108]
[cannot apply to herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Romanov/crypto-amlogic-Don-t-hardcode-IRQ-count/20241108-183503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241108102907.1788584-20-avromanov%40salutedevices.com
patch subject: [PATCH v10 19/22] arm64: dts: amlogic: a1: add crypto node
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100410.zNzNOulC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100410.zNzNOulC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100410.zNzNOulC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@400: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:103.16-107.5: Warning (simple_bus_reg): /soc/clk81: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: soc: clk81: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@400: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:103.16-107.5: Warning (simple_bus_reg): /soc/clk81: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: soc: clk81: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
