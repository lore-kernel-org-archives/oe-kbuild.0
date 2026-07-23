Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA464156C5
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800484; cv=none; b=HzgdywjDQYOphlHllo9p7hI8FnKi00/bdrFxZZBvTXOqlqgLyCSIdfuNLePC9NHWnn0FzuQsPWYtghTRD0+2BtlF2p2DMqs1L2sSoN/ewCRjv6cU9E8LqT3tUsfktYjTGxslQD/fpnShytSTsFwatHue+/jv8NF6uq+8pjQY5NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800484; c=relaxed/simple;
	bh=CEAXbwt0LBUc4EKzrUso8a9SVx2/1vYlfZOaNnCdMtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SO6WsJJdE5VsfhkZWxuRkqdzB0oKLWuJPTYJPOlijWC/5lChZWvauDfHlLhh0OwwHsfrMbJoQlg4+KthVDdZrYE2KZgazHn+mVxnHYkT672ymytzN7Qb3fOFoQ+QPsSaCqfHcJXCiPMdxobwo6l/BxfOecIKPENoMogndwnVG/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UePopBjK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UePopBjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784800482; x=1816336482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CEAXbwt0LBUc4EKzrUso8a9SVx2/1vYlfZOaNnCdMtM=;
  b=UePopBjKN9JBkIwwmZcyh+3sFCgQfxmBvCQNRVQdINZnEP5HPuvfgAA/
   uGAigsgAlDmyWhd28FqjmykLN3t4OePyLzr5f+LzSceZ7rI0n49I/kSi2
   KfhLQNL8uj2wi579Q7jTMcsDwxtKFYgO/AQVudvAShM8Djn9JWafpkKC4
   Lt+Y9wi+nGn9yOvEz3jSO6ELi3YJYNdcBAYPvajlW7RVbLo42bk/JAisi
   ySswsPptILqSzF1c0ij1dBG+as0SrLe0A06ihnPZ1MZGVO2MJxXt1CmpD
   3OR9kyOmZVLGOxWx1n9OcA61K9lOS6wxJqXOLjlxgS8Tip4w1/qjtRhhr
   A==;
X-CSE-ConnectionGUID: tta4Oc44Ruu0iWmJTfgAjg==
X-CSE-MsgGUID: GYZKz47CS3CIIDU3lTcAsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96108793"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96108793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 02:54:41 -0700
X-CSE-ConnectionGUID: PzvIcOWpQia7P69sM+B1FQ==
X-CSE-MsgGUID: 0jwQfByyQCeIfYNX2Bee+w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jul 2026 02:54:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmq8U-000000000kY-01Fd;
	Thu, 23 Jul 2026 09:54:38 +0000
Date: Thu, 23 Jul 2026 11:54:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] mmc: sdhci-cadence: add CQE support
Message-ID: <202607231109.yni8zd4v-lkp@intel.com>
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
In-Reply-To: <20260722-cdns_sdhci_cqe-support-v3-2-4412856a4488@cadence.com>
References: <20260722-cdns_sdhci_cqe-support-v3-2-4412856a4488@cadence.com>
TO: Rohan Joshi via B4 Relay <devnull+rohan1sj.cadence.com@kernel.org>
TO: Ulf Hansson <ulfh@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: mparab@cadence.com
CC: pawell@cadence.com
CC: sjakhade@cadence.com
CC: mpillai@cadence.com
CC: rohan1sj@cadence.com
CC: razb@mobileye.com

Hi Rohan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1590cf0329716306e948a8fc29f1d3ee87d3989f]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-Joshi-via-B4-Relay/dt-bindings-mmc-cdns-sdhci-Add-CQE-support/20260722-192126
base:   1590cf0329716306e948a8fc29f1d3ee87d3989f
patch link:    https://lore.kernel.org/r/20260722-cdns_sdhci_cqe-support-v3-2-4412856a4488%40cadence.com
patch subject: [PATCH v3 2/2] mmc: sdhci-cadence: add CQE support
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-2051-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231109.yni8zd4v-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ba2be3f8add2e63266686cb1bcd40c9fab07de7b)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231109.yni8zd4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607231109.yni8zd4v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:251.22-254.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:256.22-261.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:263.22-266.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:268.22-273.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:275.24-278.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:280.22-283.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:285.22-288.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:290.29-293.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:305.11-309.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:311.11-315.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld11-global.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:251.22-254.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:256.22-261.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:263.22-266.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:268.22-273.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:275.24-278.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:280.22-283.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:285.22-288.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:290.29-293.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:305.11-309.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi:311.11-315.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:384.22-387.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:389.22-394.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:384.22-387.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:389.22-394.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20-global.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:384.22-387.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:389.22-394.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:396.22-399.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:401.22-406.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:408.24-411.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:413.22-416.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:418.22-421.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@7: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:423.29-426.6: Warning (unit_address_vs_reg): /soc@0/audio@56000000/port@8: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:438.11-442.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi:444.11-448.6: Warning (unit_address_vs_reg): /soc@0/codec@57900000/port@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
>> arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
>> arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget0.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml
--
>> arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget1.dtb: mmc@5a000000 (socionext,uniphier-sd4hc): reg: [[1509949440, 1024]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
