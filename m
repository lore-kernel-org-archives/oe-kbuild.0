Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0954AD4BE
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054783; cv=none; b=jWRoiMdYjzNEFLuj/2ZGNXiClOzkeUieKwJrpJaDA2m2Syb4MXQVzUKkB7irUhAy7VX8fFaRIp0olSCnZDM5udr2ABPuH76Hw0cDwyGXLgjZEJ1qUin66M/zvIwOGAK/EJlIs/LeTep/LR/K7Znt4/Qyr6/sIJyqfLKiKe2J/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054783; c=relaxed/simple;
	bh=BraHC1CDY19KkwiQcO0/7yaKsqhof4pJeVRztlfDEgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcxnU/xpzk8brfvh5sCmLKxhw1nhxob2q6dOzCj+MKq9qau5mKOMIgHGQ2rOqtVdiCZpd1WidOSViMCQQxnLjZgdAerZeaUYpbgpetcdgBp5k355aR0PWN785xJ9xbFI7yyDSo6RtTfGVzwRGNsiZZ+78vKeqZUDmGRczNlG7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyZ94iQX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyZ94iQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054778; x=1820590778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BraHC1CDY19KkwiQcO0/7yaKsqhof4pJeVRztlfDEgE=;
  b=UyZ94iQXoYajhnWCcdIV8Mm4PwaSv/udXZOEC06WzCypYElY3rrohzVJ
   Jsct2R16aALomDrCsCsngAryazg7itTdJs8mMjVw2WvgnGtFCOohwR9dJ
   cGV/KAGj+AJMLlnWCq0h6g2oIqgPNkSaHsYIZIX99kNAgL640yEOm5wf+
   85sHNYgmxpPzfrx8ybyX+Y4gxMFSDsQYdCkemc3aR9qt2nmpw2DA4iKqm
   8FtCWKDR+ypLN+QfFwDkob7CL0GuCfs2WneuB5xgJoSLnsSelY/lGmpGx
   /TDR3wJzPEFehBey7Bywd1OnEzlYFJpn+CqRrxW8woXMIF3cMosxqSsc6
   w==;
X-CSE-ConnectionGUID: PIMoyVfpSpWD2DPdS/vuEw==
X-CSE-MsgGUID: cCBIF/EyTcqNhvtEfyLZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271595"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: 482AG4Q3RjmwHc0gO9pOKw==
X-CSE-MsgGUID: L17sB0AGSKCLlkRdfoQEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395197"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Pr-2uIc;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: enable HDMI
 output
Message-ID: <202609091541.eb9VTXym-lkp@intel.com>
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
In-Reply-To: <20260904213329.3910099-3-barzin221@gmail.com>
References: <20260904213329.3910099-3-barzin221@gmail.com>
TO: Barzin Lotfabadi <barzin221@gmail.com>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Maxime Ripard <mripard@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: Ryan Walklin <ryan@testtoast.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-sunxi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Barzin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on linus/master v7.3-rc2 next-20260908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barzin-Lotfabadi/arm64-dts-allwinner-h616-add-display-engine-and-HDMI-nodes/20260904-173328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260904213329.3910099-3-barzin221%40gmail.com
patch subject: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: enable HDMI output
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260907 (https://download.01.org/0day-ci/archive/20260909/202609091541.eb9VTXym-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b1f20dd48e11439d5a592662b407e07d8213ffee)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091541.eb9VTXym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609091541.eb9VTXym-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:156.6-1261.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: bus@1000000 (allwinner,sun50i-h616-de33): mixer@100000:reg: [[1048576, 1048576], [33024, 64], [2621440, 131072]] is too long
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: bus@1000000 (allwinner,sun50i-h616-de33): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2'] is too long
   	'allwinner,sun50i-a64-de2' was expected
   	'allwinner,sun50i-h6-de3' was expected
   	from schema $id: http://devicetree.org/schemas/bus/allwinner,sun50i-a64-de2.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/bus@1000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-de33', 'allwinner,sun50i-a64-de2']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:0: 'bus' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: clock@8000 (allwinner,sun50i-h616-de33-clk): clock-names:1: 'mod' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun8i-a83t-de2-clk.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clock-names: ['iahb', 'isfr', 'tmds', 'cec'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): clocks: [[2, 117], [2, 115], [2, 114], [2, 116]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): reset-names: ['ctrl'] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): resets: [[2, 52]] is too short
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: hdmi@6000000 (allwinner,sun50i-h616-dw-hdmi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi'] is too long
   	'allwinner,sun8i-a83t-dw-hdmi' was expected
   	'allwinner,sun50i-h6-dw-hdmi' was expected
   	'allwinner,sun50i-h616-dw-hdmi' is not one of ['allwinner,sun8i-h3-dw-hdmi', 'allwinner,sun8i-r40-dw-hdmi', 'allwinner,sun50i-a64-dw-hdmi']
   	from schema $id: http://devicetree.org/schemas/display/allwinner,sun8i-a83t-dw-hdmi.yaml
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/hdmi@6000000: failed to match any schema with compatible: ['allwinner,sun50i-h616-dw-hdmi', 'allwinner,sun50i-h6-dw-hdmi']
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: /soc/hdmi-phy@6010000: failed to match any schema with compatible: ['allwinner,sun50i-h616-hdmi-phy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
