Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0643E4BB
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836109; cv=none; b=b9uv3NSmjf3VrPfFV6M54LxfBUTz80mdk1BCO6C6rAn5hw5wpdEiSKh6m2MFjpFgEj7IkSVau/a//kTXZ3o3MS1JGFt6XGZueXSrOhXoQd1OmAbaZciJ+BsqBGP+PXc4jsgvIO8CP6Wlms1p7OaGLxvFjsC5/EXzGDF99G1b54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836109; c=relaxed/simple;
	bh=1RM4nLClSKyJMx+zn4p1fJk8XMX2NRdKKqySdyt9wQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWGegy61K1lxwtr3/9rBtglpMyc9ycNyeWIyxvcoy4TpUDsX0wUYiOfXbkmTYH3DR3SO+/qUur5+vSnfxssUo0vFpo9HxCbABDportwkkWaLsxErgnnW4GHbBI89Zi5vStpRnCUef5Zwwa0b7ihzkBhQDNW89QkOKC8g4ETcXis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efkuk3C5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efkuk3C5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790836107; x=1822372107;
  h=date:from:to:cc:subject:message-id;
  bh=1RM4nLClSKyJMx+zn4p1fJk8XMX2NRdKKqySdyt9wQE=;
  b=Efkuk3C5h9Q66rBzqhfQHDsNwHMpXHD8sJ163VzdDSfe6Bh3qrkZTPR2
   b9qjeb9p/GE/ie5kbQ10pEOADq6A/Uy9Mu13xN+Hm2aCfpSVGJny1jU7X
   Cx1a8WjtZYopQOatt7yigOG2S/STe7UwHx1lZvbExEvb5LJo8SnMtCZY2
   T/R0VQ6oInHy335yhy2tVk+7hfsIUGeVNni+Qfzw3KfYNwiJNk8GXA/zT
   m79oLAsOrclDlbSkLAwNlKq/xlDj0w7YkZaSmkNUvgyoXPSSjOrMTxSZ4
   MqH+RfKEcpkIEc5v+7efQEPNYmiUJDlqXCzP/Nt1iEVn/kq9SVD6he9AG
   A==;
X-CSE-ConnectionGUID: 054Fa3COSYOnfOfvOgVVeA==
X-CSE-MsgGUID: O7ed80MCRGi6T6qpAFK0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100917686"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="100917686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:28:26 -0700
X-CSE-ConnectionGUID: 3EW/96uUR2KZXr9TJNgv7Q==
X-CSE-MsgGUID: o4jdo6E3QmWmRr36h1VVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="280659688"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2026 23:28:24 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCAHF-000000002GN-19Du;
	Thu, 01 Oct 2026 06:28:21 +0000
Date: Thu, 01 Oct 2026 08:27:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip
 53/85] arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000
 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is
 too long
Message-ID: <202610010840.0GchexQM-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip
head:   61382c1026cdebbf608e3aecb95c11d1cdbb9bb2
commit: ec60b158b40bc62da9e28d46c0e4369f743261a9 [53/85] arm64: dts: renesas: r8a78000: Add (H)SCIF DMA support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010840.0GchexQM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010840.0GchexQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610010840.0GchexQM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000 (renesas,scif-r8a78000): dmas: [[76, 81], [76, 80], [77, 81], [77, 80], [78, 81], [78, 80]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0704000 (renesas,scif-r8a78000): dmas: [[76, 83], [76, 82], [77, 83], [77, 82], [78, 83], [78, 82]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0708000 (renesas,scif-r8a78000): dmas: [[76, 87], [76, 86], [77, 87], [77, 86], [78, 87], [78, 86]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c070c000 (renesas,scif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c070c000 (renesas,scif-r8a78000): dmas: [[76, 89], [76, 88], [77, 89], [77, 88], [78, 89], [78, 88]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): dmas: [[76, 49], [76, 48], [77, 49], [77, 48], [78, 49], [78, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (renesas,hscif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0714000 (renesas,hscif-r8a78000): dmas: [[76, 51], [76, 50], [77, 51], [77, 50], [78, 51], [78, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000 (renesas,hscif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0718000 (renesas,hscif-r8a78000): dmas: [[76, 53], [76, 52], [77, 53], [77, 52], [78, 53], [78, 52]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c071c000 (renesas,hscif-r8a78000): dma-names: ['tx', 'rx', 'tx', 'rx', 'tx', 'rx'] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c071c000 (renesas,hscif-r8a78000): dmas: [[76, 55], [76, 54], [77, 55], [77, 54], [78, 55], [78, 54]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
