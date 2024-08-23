Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3721358A7
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Aug 2024 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724384657; cv=none; b=JqJABgjJXMh6+XdPEa8a2xuQBR5pox1hECHlIfReuo1UC1zNyCt0D947JGC5fxcSEm/DkqJGFkaxwmJiwZcggQlxPuN2CjOc44Q4KLL0v7RA4ET2LgapJyxJC+ho95ngpH+IPIsAmqhb5M6CSbBbYQP7/sn+paEvRDZJO2Pz1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724384657; c=relaxed/simple;
	bh=eoF8rIUfwuZsPMX0TCT+ohZu+JCOAS5LVBybAsxC+Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7Y4MIN0f2XI+BZhxhJRekMSuj2PTh+s3oyQ9Nesv+moMOPSIJmcL2rXDo/7N71P8RF6Bf1LzFejJE+XdnwXr25LyVwTyUolbxEhS5rRu9Q7DTNEjsjSPVHNW10piHDZEGRf8Riy6c1XV987dKYL0X8LbBgW9GwqMyfrhtdVx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5xzeFZo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5xzeFZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724384656; x=1755920656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoF8rIUfwuZsPMX0TCT+ohZu+JCOAS5LVBybAsxC+Og=;
  b=L5xzeFZoNxP1hSpPENWIEpcsEyeZlLCIzdC+tJz8MD07B/f8Y6ireW8x
   4/Inzo0QFc9s1O6EGkihM3YC9MnGxinq3oIvAqcfrt1k6xEfPq/DcERTG
   zOKtQdqSSRUl7sMDuSrWH5MlnxJDlE38rurtWvzlAvEtMUXj89d5KPbDY
   4EU0BncM8ydfYOQnL3QRlPvcGUUcJ2DKom7kF2Pu9kdOWJUkZCNBJYL59
   Zy3Aj/CXqYRaJwbGynT5RLeJXKxwKGkFKR2J9XeqTy8qUQCEh/2TKSnKm
   v4S5TWS4iv/+mxPiwiSgzWF5vZGr36QWzBkMpQyUiBOAwiK7x7flLW1xb
   w==;
X-CSE-ConnectionGUID: DIE+NPFfR0SYwtsWH+01WQ==
X-CSE-MsgGUID: PpGGmOHgRzK/KO6A+xGQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22361364"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22361364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 20:44:15 -0700
X-CSE-ConnectionGUID: QHKh1XHfT0CTSPL4/trn7w==
X-CSE-MsgGUID: zXjls1UnTc2zsFKkgYYUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="62192312"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 20:44:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shLDf-000DSO-26;
	Fri, 23 Aug 2024 03:44:11 +0000
Date: Fri, 23 Aug 2024 11:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xinli-intel-fred-public:intel-lkp 36/36] <inline asm>:7:7: error:
 expected assembly-time absolute expression
Message-ID: <202408231145.9ymSSzwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   3162d9822c0cb7cb2a3392416d2d5c471a31f276
commit: 50ac8a7a9a9861fa6ac817aa2507943ff26c562c [36/36] KVM: selftests: Add fred exception tests
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231145.9ymSSzwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408231145.9ymSSzwW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:7:7: error: expected assembly-time absolute expression
       7 | .fill asm_user_ud - ., 1, 0xcc
         |       ^
   <inline asm>:52:7: error: expected assembly-time absolute expression
      52 | .fill asm_fred_entrypoint_kernel - ., 1, 0xcc
         |       ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
