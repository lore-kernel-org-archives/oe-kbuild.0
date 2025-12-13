Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB4B2DF142
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765593414; cv=none; b=o3aW0qSdYevQ3oy3zh7d2taWp9LmO+gT5qVGjrK6zmGE88Cb/E+z2r6IESnVMDCH4VUCbpolTDOQ8LuLFmIZGBWzWR4ryVI97zssNh1VAgfjQMvgbdt/6w+WWkulgYX1cZXAR+uwKqyIEm21D7HIs7+F10+E36ldYpDDU5JSo20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765593414; c=relaxed/simple;
	bh=qk5VCOjRw64AAHHpmNOqO7dcjOr0hlKY/ehsrZNSWr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7/CbdSK+k9uXoEfbvFw5OE1kNWHMd7UczOGCSYCygjBVX7Tvkia06hzjm91MdgQvNDMam++n1V99O7YJ8vqWzWBZO4VCsCYvKchRtDsrM2V4ZnPMF0f0JmDi4NQLnxnl7CggbJ30TYXXgMxh3DtmyHJMszVcf3bY2WOG9/tRcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEkacoUL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEkacoUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765593413; x=1797129413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qk5VCOjRw64AAHHpmNOqO7dcjOr0hlKY/ehsrZNSWr0=;
  b=KEkacoUL/j7wv2YvT5dzT6sDVi7+FewE5bCZeGQzC7O92il40YUyUgZb
   vvz36CWXBfTgRboIweVLvRCAuC0H/N25fK7UV0D26TkNIPu80nfYCHbsD
   2aatocjIpHrfp6J4Iosa0wpNB9/OCvs22hR8a7BjZEDUTG43xJnApqkPO
   e9KWb7OPg+/1XcS8eyeAO4QFHhwaQ5EQnsXnRW5pKuMWrVoln3EbDvQYp
   7xgGsfOMakMGuqt3kEoIdBm4hGILTcMeiWcHs/HrwxERSpCfKRIlPXEri
   5NrMHKedsONEjz73yOS+pL8TI1qv+4AOXczhzIiFjw2ZAcGtaxbW5zgl7
   Q==;
X-CSE-ConnectionGUID: 0JWAHfuwSEWjFcbP8jyK0g==
X-CSE-MsgGUID: kIBtEvvWTbqVCIDWS4jYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66585488"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66585488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:36:52 -0800
X-CSE-ConnectionGUID: 1e95WTMSSXmmR0P/eOYROg==
X-CSE-MsgGUID: uumGaZowS5mORBEeb+vl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227895858"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 18:36:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFV2-000000006wb-2svc;
	Sat, 13 Dec 2025 02:36:48 +0000
Date: Sat, 13 Dec 2025 10:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dpll/dpll_netlink.c:62 dpll_pin_available() warn: iterator
 'i' not incremented
Message-ID: <202512131021.4Me3w9mR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ivan Vecera <ivecera@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jiri Pirko <jiri@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2df8e64e01c10a4b75ea7797629f9e764a840eb0 dpll: Add basic Microchip ZL3073x support
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131021.4Me3w9mR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131021.4Me3w9mR-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_netlink.c:62 dpll_pin_available() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_netlink.c:894 dpll_pin_freq_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1046 dpll_pin_ref_sync_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1109 dpll_pin_on_pin_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1267 dpll_pin_phase_adj_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1414 dpll_pin_find() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1617 dpll_device_find() warn: iterator 'i' not incremented

vim +/i +62 drivers/dpll/dpll_netlink.c

9d71b54b65b1fb Vadim Fedorenko      2023-09-13  50  
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  51  static bool dpll_pin_available(struct dpll_pin *pin)
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  52  {
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  53  	struct dpll_pin_ref *par_ref;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  54  	unsigned long i;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  55  
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  56  	if (!xa_get_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED))
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  57  		return false;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  58  	xa_for_each(&pin->parent_refs, i, par_ref)
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  59  		if (xa_get_mark(&dpll_pin_xa, par_ref->pin->id,
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  60  				DPLL_REGISTERED))
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  61  			return true;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26 @62  	xa_for_each(&pin->dpll_refs, i, par_ref)
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  63  		if (xa_get_mark(&dpll_device_xa, par_ref->dpll->id,
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  64  				DPLL_REGISTERED))
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  65  			return true;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  66  	return false;
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  67  }
58256a26bfb37a Arkadiusz Kubalewski 2025-06-26  68  

:::::: The code at line 62 was first introduced by commit
:::::: 58256a26bfb37a94738dd65618b1f31f460f8d91 dpll: add reference sync get/set

:::::: TO: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
