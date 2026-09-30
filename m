Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46F4CDA12
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771945; cv=none; b=Eh0t8tT6Pcg04JD1p0x/g/fcwndt/WjWeT5dMrvpAOXM7ECZ+09Ld1XUouOeVZDO1MtWaYj5wYwqinn6pv9AF0pglfg5/irt2BOst0M/u0ucplD6kKNq26MghfLZP3U56sTY+oak0SroPfGBKxjj0zIzgK2hjDulSR2k0lyWVsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771945; c=relaxed/simple;
	bh=OVCApA7C0KOX5YsPfrOaYtcJgga2swzjArJVTsWNokA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KCB6V6uC/xrJc3rQddLzi6gorpIYkWzxkOsHWVameGhD7ey79sy62J2ovig0X/XOa9Cz9GvAKx8HNeRyQNlQoSwtq0CAP3ELpLPwpNmxbUIq7MsB+c6I5VBV/q9cORz7yvWpHfKQZ2+QaAmDuupJMBpD6ixiZnwsUMZ3p1svDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr6IUVkg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr6IUVkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790771943; x=1822307943;
  h=date:from:to:cc:subject:message-id;
  bh=OVCApA7C0KOX5YsPfrOaYtcJgga2swzjArJVTsWNokA=;
  b=Zr6IUVkgUW15cZxK95TV0d/vWEBOP6A+Hu+0/cX1UqwVnqk7ziEnVKAd
   AKFYVHYqtLlsbgYX+hOsbn2saEaT7lBWF0x7oiGQT2BmhWa31rI5wXerD
   riL2VvmqIwdI4gahHijeGTw7Lc+Hl3VxKBhx6czEdlAuxtAlGKNA9huH5
   WNB5p7fy0x59h/8kJc9lzvDCdeNwplff8y8ogZ2Ohuuz1ydkV2T9omKT0
   uoATQImDb6DIh/bLeTAWn110lZiEbx14GMlBnaVrVuqgbayV9SYgREBlC
   OnazqOoPsJ5MdG6myP64nP3HOOJQI0DwnNDoQwnhAEsyPT1viiPjFyTHb
   w==;
X-CSE-ConnectionGUID: QSa2GjYZTbi+267MyjBJZw==
X-CSE-MsgGUID: sDt/Fnv7SeKz8AlQ4dO+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107893268"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107893268"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:39:02 -0700
X-CSE-ConnectionGUID: QxbIqmFzTNeGXhMV9oeKUA==
X-CSE-MsgGUID: Gfhbv2Q9QsSSaYMBUfMBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275815480"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Sep 2026 05:39:01 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBtaN-000000001rv-3Sx7;
	Wed, 30 Sep 2026 12:38:59 +0000
Date: Wed, 30 Sep 2026 14:38:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 17/26]
 riscv64-linux-gnu-gcc: error: unrecognized command-line option '-m32'
Message-ID: <202609301446.pM5Uq3Io-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 632e6dd46feb3a874a82d83535f9e3fd973231b3 [17/26] selftests/ctlv: Add the wire-format selftests
:::::: branch date: 18 hours ago
:::::: commit date: 4 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609301446.pM5Uq3Io-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301446.pM5Uq3Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301446.pM5Uq3Io-lkp@intel.com/

Note: the jpirko-mlxsw/wip_attestation_pre_rfc_draft1 HEAD a18af4e1b514bf11f88ca42d29b7b68f3b375378 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> riscv64-linux-gnu-gcc: error: unrecognized command-line option '-m32'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
