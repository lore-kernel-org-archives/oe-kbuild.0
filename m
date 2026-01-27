Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D82FE598
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518960; cv=none; b=W2b8CIRquZzNJdJO7QCYtF0nVAwoduzliU1HAu7uSE3in1+XHjfiIn7BM4LYc5AS6q/wGCU2nTmgrHi5w5B9e8f2Gf+KY/2TkKLrN2QU2+M/1irXcDSBt1G/iljkHUC5sB2kXWsM3CkINz/IYQO7j4H1DYlYmynYyrGCaJe4uDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518960; c=relaxed/simple;
	bh=daMO8n+T+Tri7zx0smMxDbUDK4z4TEEpqRKceNlJ7VE=;
	h=Date:From:To:Subject:Message-ID; b=J0ymEKZs81hpC7RfTWJRIUmCy6AOLEUVdVdSD29P2monwUPE8tItP0wO+w0VwyDkYbX95zw54ZNCk5sz7Oz7uYTRujzqp9qLO+k39lVSl3bGyOQt513diFTXITiqwXzGRXLzp++DTH8hqU3oq/h2zX/CgjlrqyIZfPXCS+yvhaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrpRMhK2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrpRMhK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769518959; x=1801054959;
  h=date:from:to:subject:message-id;
  bh=daMO8n+T+Tri7zx0smMxDbUDK4z4TEEpqRKceNlJ7VE=;
  b=KrpRMhK2wrK3EkcW8CigInziS63j+9HxKxTQ5rHThgSK2Do2U5wTxwiU
   0zU3w2Wf/tatw2O9v3+D/yoevZG6INSfB/wF8Jsyxven+9kP/w+hNkzQM
   oXcmJKIimrB5srHjV2PCIsGTsxRKqRy11EFbpsB84qn5ZuGfr9wvDqxvR
   8q6Ob5Y81QphyoPJ8NPS8FyPzmUiQbfdtJD2920ir0bkgawYkyn3UbF4K
   N0dV2JQxwqWT2og/G09iWQVB6Ae92MiiVctetBMlkDjptABMazIjzAh9i
   hqJ6lo13w/wngL/ZFZJ+vp2b1d+USjQRI0yd8aJ6MBIJAFDsQfNwu5rNc
   w==;
X-CSE-ConnectionGUID: fQFNEEtJSpG6+AeLcyHm2g==
X-CSE-MsgGUID: sQV8Uq6PTt+yR71hNsZGbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58285274"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="58285274"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:02:38 -0800
X-CSE-ConnectionGUID: ubDiyS+uRTyl5bRvFaVQLA==
X-CSE-MsgGUID: 5ozaYqwmQgW5eUQkucxWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207097994"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 05:02:37 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkiiI-000000001sZ-3IrH
	for oe-kbuild@lists.linux.dev;
	Tue, 27 Jan 2026 13:02:34 +0000
Date: Tue, 27 Jan 2026 14:02:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 38/53] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
Message-ID: <202601271407.k3zYLDqB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xiaoyao Li <xiaoyao.li@intel.com>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4c35756ab388149481ea4bba261cfe450dac4fed
commit: 6aca3ec938ae61decdc59aeff2e30bd5b192da03 [38/53] x86/tdx: Add API to demote a 2MB mapping to 512 4KB mappings
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601271407.k3zYLDqB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Xiaoyao Li <xiaoyao.li@intel.com>'
#69: 
Co-developed-by: Xiaoyao Li <xiaoyao.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
