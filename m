Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0282D9EFB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 19:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008745; cv=none; b=WXJ6hAbojc1yFVc8HuIkHXOfVZN+9hMuRpsx7t3ceKMe72ejY+WVIYZY3K+eJtMeVk6Bxcaiqruu1KXJKXZVxEYXVGwFnk5rz3cXfzZSl4ADzPMgJMGB6yQgZ5jY7ubFD99jUENZOc0v9rK5HbEqcNbWBz13Q1tEm4cV6K5tWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008745; c=relaxed/simple;
	bh=8O2suTuPE0goLgnqxGw9/u2dg3exWw4QRu6Eu+tMEKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RUqmnYjZtDNvi4J0uZn31UhR/jROqqlUejQOa33Ru1kAhEzNFBKUZILHthUkTuiyT/rN7cHeumgcwDrspm5ylhV/wNky2NjnVcsvXrRVXcjTwMYlmSVGjMLAQa5hA5ukon6sB23Q771/eBVSiXQhb5XRqzGJmbsNIplsw4wcJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZzOy94z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZzOy94z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778008744; x=1809544744;
  h=date:from:to:cc:subject:message-id;
  bh=8O2suTuPE0goLgnqxGw9/u2dg3exWw4QRu6Eu+tMEKY=;
  b=XZzOy94zlrpD9kt33e7coB4DP7lq/Q7uZlzGmOQQjJktwixbGYHV5c4W
   qG6zzZ2neSj9klS0FmNNa+Ock7I8nK64/EpEClHliq8KB/jrOIoBSe3z/
   8oSnBuDASqly78prLBw5Ww1zpSQ6Pp/MKrxiEw1OPR+5CbkyoqyCnmx0k
   Xot+Db2rJ3A7Gi/i9QpYk8HvgHbGNW5z6RQEGQKH6yIiELwNwTScBflTE
   SY2QB13GqCFgvDC2rNJrO8j8y8NKyIeEP6JhC1wHDiZMHz+1DD1xp/1zY
   b77v99UfGXVnloZPR4zulAu8ghNIdnfD+xhJ1P3uPCuSNFrpdxz8/puK8
   A==;
X-CSE-ConnectionGUID: fCFynXbBRwyTJyZLX/G7sg==
X-CSE-MsgGUID: 8XHxD1ueQFKsSoI/7ykGQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="101558436"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="101558436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 12:19:03 -0700
X-CSE-ConnectionGUID: DdurLbVMSrW4chLzKNjROQ==
X-CSE-MsgGUID: NSxJ/0K5S7a4I5MyvPgOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="259250407"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2026 12:19:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKLIK-000000006If-3jax;
	Tue, 05 May 2026 19:19:00 +0000
Date: Tue, 05 May 2026 21:18:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/ti/k3-am62l3-badge.dtb: pinctrl@4084000
 (ti,am62l-padconf): 'wlan-en-pins-default', 'wlirq-pins-default' do not match
 any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
Message-ID: <202605052141.BPztkSKs-lkp@intel.com>
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
TO: Judith Mendez <jm@ti.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Judith-Mendez/dt-bindings-arm-ti-Add-am62l3-badge/20260505-051034
head:   fc123d52e93ae51a10406b9413eed171f68e1ea1
commit: fc123d52e93ae51a10406b9413eed171f68e1ea1 arm64: dts: ti: Add k3-am62l3-beaglebadge
date:   22 hours ago
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2055-20260505 (https://download.01.org/0day-ci/archive/20260505/202605052141.BPztkSKs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605052141.BPztkSKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605052141.BPztkSKs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62l3-badge.dtb: pinctrl@4084000 (ti,am62l-padconf): 'wlan-en-pins-default', 'wlirq-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
>> arch/arm64/boot/dts/ti/k3-am62l3-badge.dtb: /bus@f0000/mmc@fa20000/wlcore@2: failed to match any schema with compatible: ['ti,cc3300']
>> arch/arm64/boot/dts/ti/k3-am62l3-badge.dtb: gpio@0 (microchip,mcp23s18): microchip,spi-present-mask: [0, 0, 0, 1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml
>> arch/arm64/boot/dts/ti/k3-am62l3-badge.dtb: gpio@0 (microchip,mcp23s18): microchip,spi-present-mask: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,mcp23s08.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
