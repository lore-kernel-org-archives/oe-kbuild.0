Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF123AE66
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Aug 2025 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754437746; cv=none; b=tJ2B6C1sVECH+NSufB1quXOHhHWf3sOjLXyy8Q+LKqzKBm6Yvr7TdkQ+/qe3JZJkEjITWDICPXhXy3/ZuRvRo1poQ4NQCp7GhRfHu8J9oUrN8K2m8XFYoh1S6FTzVLC1EcdVCs9hWq6U3zY1RFocniGgGr4okBwGeRd0Q7pU06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754437746; c=relaxed/simple;
	bh=3Nx95l1kJs4+5kEamvMbN/JgkMykOzryQyO6NYlXi8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NL8b0M/wtNZlY4viHxfJaEX87F8N/Hb39REo2emcsBpBK0317pO8P0BWbqewBavTp7jWxo1sKr+L63uGqI9kEBDltjR4HxuGDBY3vgFaurGudr6itwxmI3h0wIQBOEQbykrrMTu7bulDQOVkM3RhMvGGbPV+JSwEsLUtPFf/Doo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLz/sL2B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLz/sL2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754437745; x=1785973745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Nx95l1kJs4+5kEamvMbN/JgkMykOzryQyO6NYlXi8s=;
  b=dLz/sL2B2DcXgzvDv2s0ikLXTIoydJbOjQQg8rGm2plvRNmwTJuqr1Px
   TKdNuUH0MRhczQWu/2ril8RqZHsA0lKPh1F91DGqxCEaSryTxjzAFVqaT
   ykP6CUIuB8BQKa0SX9/we4t1yAWlMWpjFfEOiLHYpu3X8gkYEFIxLtUHK
   z4rQls2/w8z91j/lazdBidu2evQe62Dfuw6gBsr7vOv4p28DmnkB0dUIA
   RVvVPB38IDezmK2AtFyNvWSzIPbakrlxdZR7HnQb3rJTit/mZuoLWEgp/
   FFZGnOS2qQrqiD5RDmBK2HS8Myq6VxePeP8S8/Ptt/fUOJ/qNtnlhII/8
   g==;
X-CSE-ConnectionGUID: bKix6TRNSeK2FMLGKG88kQ==
X-CSE-MsgGUID: t6i+ZdfeQvu89xl90hIlwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55959505"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="55959505"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 16:49:04 -0700
X-CSE-ConnectionGUID: nEqOfUXJTJuDjn6eSXr/GQ==
X-CSE-MsgGUID: 9siYTiIXSQOKjMRBavgxRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164643087"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Aug 2025 16:49:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujROu-0000qK-2z;
	Tue, 05 Aug 2025 23:49:00 +0000
Date: Wed, 6 Aug 2025 07:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/img/pistachio_marduk.dtb: cpu@0 (mti,interaptiv):
 Unevaluated properties are not allowed ('clock-names' was unexpected)
Message-ID: <202508060750.q6GykQN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
commit: 80728bfa8c79b81eeea305f555fe5582d1907286 dt-bindings: arm/cpus: Add missing properties
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-052-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060750.q6GykQN3-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060750.q6GykQN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508060750.q6GykQN3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/img/pistachio_marduk.dts:29.9-32.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/img/pistachio.dtsi:866.37-869.5: Warning (simple_bus_reg): /clk@18148000/reset-controller: missing or empty reg/ranges property
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /: failed to match any schema with compatible: ['img,pistachio-marduk', 'img,pistachio']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /: failed to match any schema with compatible: ['img,pistachio-marduk', 'img,pistachio']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: / (img,pistachio-marduk): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: cpu@0 (mti,interaptiv): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100000: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100200: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100400: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100600: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-in@18100800: failed to match any schema with compatible: ['img,i2s-in']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-out@18100a00: failed to match any schema with compatible: ['img,i2s-out']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /parallel-audio-out@18100c00: failed to match any schema with compatible: ['img,parallel-out']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-out@18100d00: failed to match any schema with compatible: ['img,spdif-out']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-in@18100e00: failed to match any schema with compatible: ['img,spdif-in']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
