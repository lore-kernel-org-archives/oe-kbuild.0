Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448F35957
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 02:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994743; cv=none; b=JFxSJn8ZrVgpU7Kbfqi2+Su+ViWv8UK1F2eYW92FgMOVYUZ6+ikpOoa9bHIjGlPSd2CLXzO2n25XruhVphTnpX9ll6JxRqw9my7idrBAlNaKXVRJ6ylFtzjcP0/eA4t9xkUt22Xmf/1/bdq7hOGTRQ2llDzyFyCUHvGjwAdNVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994743; c=relaxed/simple;
	bh=xEJA4TUhKahcad4bgvue/PhsMOl5xZd22hNiAz5QO4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G9o2L9Bt+XVqgV8DNPx207cnZ5Ok/UfiasxhXGaRP/66DrEapPLWY8o0A16PdD5dvtqxO3Pj7/LWtad8z7hETlbFq4J3SFU3K6EAxWKL5NRp3ESuUE550iZ+ywzTzyTiwfMHi4oZ4K2oOAPDLB4yIG+v7i3HaA3iK5g0mTTp6aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lN/hSCpc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lN/hSCpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783994742; x=1815530742;
  h=date:from:to:cc:subject:message-id;
  bh=xEJA4TUhKahcad4bgvue/PhsMOl5xZd22hNiAz5QO4Q=;
  b=lN/hSCpcZEXWjitKa3R2+nqecMYHUxZ/M7mWDRa9CB6f9IOH6OKJ7mwu
   gORWhaJ2w/CfW/pRpDt72PXp01zkcF6SSGPU+7p4cuR29iANr4JLUiGk4
   OZ9MBn8sWg62uK27CY0rmirMJRGa0doID0TEYscc9INam1iDJvmvDw2LC
   A6T9X2S6rYjH2lvp4mtoL4tpRZgEeZM87YYk7w1RV/Fnk8G8gF8TJ8r7z
   eN3A7g79AGBK0k/c76ZsWzT8/o7swzztc7GvNNHh4If//E0pKiM3xr9oG
   LmtG7DKfwdHvBLxMUL4teqXM3axXHl6aiSWQMC4v8DjOin88qhsApzg0T
   A==;
X-CSE-ConnectionGUID: VNrJQ3EYTO6dn7aOGNLxSw==
X-CSE-MsgGUID: Q3icG3VLQWqFxHQl/GQTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110157315"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="110157315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 19:05:41 -0700
X-CSE-ConnectionGUID: RMcK8xreRheWx5GN7+GpQA==
X-CSE-MsgGUID: 1kC1ynM3QNKUbXJnLKreEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253976065"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Jul 2026 19:05:41 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjSWg-000000003rV-1QSc;
	Tue, 14 Jul 2026 02:05:38 +0000
Date: Tue, 14 Jul 2026 04:05:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 11/16] ERROR: modpost:
 "ndisc_parse_options" [net/bridge/bridge.ko] undefined!
Message-ID: <202607140432.hiEzFnz5-lkp@intel.com>
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
TO: Danielle Ratson <danieller@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   ea22082e098921b64bf9ce5ec45e5e4d287cc1ee
commit: 79fac3fd1dab2e401035ac716cdee61200a3f3c6 [11/16] bridge: Use ndisc_parse_options() to parse ND options in br_nd_send()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260714/202607140432.hiEzFnz5-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140432.hiEzFnz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607140432.hiEzFnz5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ndisc_parse_options" [net/bridge/bridge.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
