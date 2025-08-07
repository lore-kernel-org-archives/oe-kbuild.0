Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B825C838
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754557675; cv=none; b=f/hckBb9QPyj3Lo4/dMmCk2/xL2UbR72/hdAZPj1/7NSWvod4m38werH7jcYZw+koi9XpjlTpn9wZzwlinfIuF7bZinD+RKBndDP6If+C6crB8zrVGUIS98SPYbqmACBeK5dNRZg76VezG2iUSyL7MdgDcgc/oWqN0avnxM192U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754557675; c=relaxed/simple;
	bh=b0qWXBI+9IdzBk/B6/7z3dt5pjiweeaDj0fBiD29e2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gq+EswnNTCFQhGA0hx6Apva7bTdvrGVBJRz0kPjSZlezevyDQuqfXYK1J1qT46IhBX9NH57wfVEhgbowCA26+1ty3hPnIYnBSFZ/aRGDWHytnpZV7PYegL50hn88EVsD5jgO4dn3LLhIro72ir9d2HQOOkR9/R5kagwkRofFpRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huo+ftGo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huo+ftGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754557673; x=1786093673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0qWXBI+9IdzBk/B6/7z3dt5pjiweeaDj0fBiD29e2E=;
  b=huo+ftGovsaevwiVqfPerGilbuXK/ZWiDpeVZBZbg1YHCz1oAv5lWF8H
   TZOOf6oNZE7txgn9A2n/lFu7s91k/6+qc551tYaJO4VmkaeJ671tBtPLN
   dMdoIYDjxTy+eKV0i347T4G7kTcogOrdBf+s9EwlcOSA5hHT4oTR1Ckwy
   weIPV44AcKjBeqDIVguiQY95MAbwHiG8O0Fgtovz7U5ttfPcET733b3vu
   jUsa62GPBtxJBNgAvxHYo3B3+ZdTXaor5tzrHgGo9URlaYn4HFgYWUyv+
   RI+g0Gi7WX4Q9HRFLv5tUaxQDeQrunBV5LMD/hVPjSpzZ2+56B+Op4cuh
   Q==;
X-CSE-ConnectionGUID: AXIIRTQFSnaVYI1qq7RWYw==
X-CSE-MsgGUID: zvXalFeHRgaa7sfLYNKSOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57021154"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57021154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:07:53 -0700
X-CSE-ConnectionGUID: tpkFwOzoT8yO0TyuJaXzrg==
X-CSE-MsgGUID: hD+3aaikRfW8cq2qh3BiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164662682"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2025 02:07:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujwbC-0002be-0y;
	Thu, 07 Aug 2025 09:07:47 +0000
Date: Thu, 7 Aug 2025 17:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 151/801]
 Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing
 type definition
Message-ID: <202508071738.TJ47YJSe-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: f3146d2b850dfe14b7f215b038e6291e440609be [151/801] dt-bindings: dma: Convert ti,edma3-tpcc to DT schema
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071738.TJ47YJSe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071738.TJ47YJSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071738.TJ47YJSe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
>> Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
