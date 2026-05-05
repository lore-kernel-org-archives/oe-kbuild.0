Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9903E929B
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967999; cv=none; b=QnIMvDieAhZS5FjPNBpXFdpZB02gsokwhT7n/WrKT7MdDiMMZD9fMKYntcNvEyWMFuE4enDlGMMQeFSUdU0BwUTOcC9vLhnS6dY1qCRFLVAAt3UnnsljGUA7MYpO+ayvjHhILLXIjnkrgO2B1IP4WCkQpNiaFGLx6i9YUknXYcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967999; c=relaxed/simple;
	bh=/cyv9RXudEGaYmEH3fhGvFCtIqhqHmmzyTP95NPrIFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kvYipQyLZhhFrB6YHnvCwNSjF1qqbkq2Uc/7WEJezB7RhvlE+nDkpHdXlgKkRi/lBzRXe8xbT+sqAzwVllpH0rO60gSdZGkPoD+dHHOcboJ/isp4MWR8/nj2nDHr1K9hDLTBWB8NOYYqgmh5C0DWKmmM80t95AqbPKeqkVxHyro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm7lfhmu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm7lfhmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777967997; x=1809503997;
  h=date:from:to:cc:subject:message-id;
  bh=/cyv9RXudEGaYmEH3fhGvFCtIqhqHmmzyTP95NPrIFM=;
  b=gm7lfhmu7yKDeiadD7E2VAWsGki1HEz9k4pz7CEMGdD0a93sb/SBTiNM
   gcOl0S4kw3jR1IKqRDK5CtUByt3iSnLtatzz3hPn1fneIQY+QGMa8SDaN
   zMSNWTmo3p3JBSQKucQJRmMj20s0ZML+i53m1S90z+4DjWAKkEk1VOEx3
   kMeqeghTMihjXB+rgj0iKGJ40dm3CqLSXYsTf01NLGpOWsyV4MgwGXj5P
   q02nO87ge0nqEHXwMMou9b9ejm5Dxzwy3gAsYnYOcx9bT4A4tdKS3/jbe
   KCGRiZSqTjdvob1WwWCNQSF7QVlCJmkVmlL9sfN6qDwg2T86iseQvioU6
   Q==;
X-CSE-ConnectionGUID: qJkeNUllS3yVyQa9BUo4Aw==
X-CSE-MsgGUID: t99CcLJSSRyhMVao+OEkhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82684346"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82684346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:59:57 -0700
X-CSE-ConnectionGUID: fi0TqfcnR/iBZ9/qvjME6g==
X-CSE-MsgGUID: V0Xx79WBSy6/9D3S7J0x2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="266088976"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 May 2026 00:59:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAh8-000000006Bh-0AwL;
	Tue, 05 May 2026 07:59:54 +0000
Date: Tue, 05 May 2026 09:59:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48
 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605050954.pgAsps7E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: 45601c66b5ddbe665937659b957e71bc8efedd46 dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260505/202605050954.pgAsps7E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050954.pgAsps7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 45601c66b5dd ("dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605050954.pgAsps7E-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
