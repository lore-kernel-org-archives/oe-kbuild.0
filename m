Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA57322A28
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069302; cv=none; b=AHSkns3UYuJ8is+K+WdMTAUXnEBDfYleaM+5WFIAlEjSDJmFKD+8QPIz2DMnfgpDKuJpOwkC6JGFyCXnDhgzqZh6kKQ3Q1A8j0HbOh0t0IFpv3bE5f7woSDix8CmDlX3Si4kdB/Ne9Ya8kmUAqJFemXpGgw7Ozawr5kr2dZWEIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069302; c=relaxed/simple;
	bh=HDGrJNB80UnNKW8eRRREay4akWo2TJn2Q1U5AVWmlRQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgnK4mh+wliCSC6G/Mj7h4JZZpMINdc2tiqdg0nRhd3Pg1C1kjMRuDX2HIAB/zCFw4T9eT8EQjnyfWQIqqfo+E1EPsQfyy9rIOgE10zFlUQ7IEplv2wrlNO0Zwzn3w9mge/qt0h7tI5Y6XdLwIkl1C0o5RH+2qya9J/AEC6nUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qut1wCTz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qut1wCTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069301; x=1794605301;
  h=date:from:to:subject:message-id:mime-version;
  bh=HDGrJNB80UnNKW8eRRREay4akWo2TJn2Q1U5AVWmlRQ=;
  b=Qut1wCTzhd2uCa8Caf0isQ5AxK9zJFXXS9101L9XJbiy1oRw8l5YZDTb
   ukWSJdYAGA9fHbimJNi3PLNUEeUP3KeFAru3EBk7p+DQQLiudnAI5/UK5
   EO1Vmgj1eNjYZAEWdeKIzJ5ME8vhclSSv9eE5HigSdcredxd5Y7TpW+xh
   BugIVJi813bZWB3b3i+zfBLzL31EbwL3xsQ+0ocPpuTCXT0K/eBMWT4pY
   ry1gHIFD9rLTKQj+B044av6GoMXNdlwRoR29sbZINqa1utNDDcm/5lmsE
   oVh94G6ZtnBvUqtCSCnHPyjP/KymSvlJusIjlCN/IBPcAO3yuWK6Edak4
   Q==;
X-CSE-ConnectionGUID: IkatlDnXQnKOHgQ4e9Rubw==
X-CSE-MsgGUID: 2C3bnbedQJiStCAsbr1PxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637516"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: tM836cYySdCEe3yB36MJOQ==
X-CSE-MsgGUID: 9Nh1FviZRH+aKZda959jwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035934"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-000000001A1-2MZU
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 595/867] checkpatch:
 WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements
 (8, 15)
Message-ID: <202511131937.pmb4Xpwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: ea22b609627d303ca262baee0dba9f10ed18ecae [595/867] bcachefs: bch2_progress_update_iter() can now return an error
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131937.pmb4Xpwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131937.pmb4Xpwo-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#140: FILE: fs/bcachefs/data/rebalance.c:993:
+	while (!(ret = lockrestart_do(trans,
[...]
+	       ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
