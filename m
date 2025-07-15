Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85728F5B
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752614204; cv=none; b=JU1VM8JIWGtD0sTtA5uhBWDAvHQu4oZv4SsVFMjeyaXtT7lPAkbYz5q8XvbUxKIFDobAsqDjcRE2nF/J+J6hfI4PaEAXib4BTdaGLL2IJhDoOu2TPHI4QKcEXmSg3BSjlGIktklWmoW7FDsqisrko5qSeiAieBvR6BfnmIaxai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752614204; c=relaxed/simple;
	bh=QieniStVU+p0Zs6CIltkRMx0SMe0eQpcAcnC0zbHJ2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VF/b6amdg2gRw+GyboudI4ldg597z7O3FtGqmbCQ+NTh5YwyU5wP/NJY2FmxCoTciOYZMtEBShmL7hdo+7iCY+urHmBdHcT2jUcL0QoE3yyAPD4vPnS5IK93wmJHWVB/wFYAISJF2DD9Z3gx+80xm2489XoE8sv/lJqoZbGSI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+PV2XYg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+PV2XYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752614203; x=1784150203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QieniStVU+p0Zs6CIltkRMx0SMe0eQpcAcnC0zbHJ2k=;
  b=l+PV2XYgF68Am3nUEoV88dGq7NhPd1j5VSVbxSitM58h5tOsqob1APaT
   7tO8IOgGg/FPFgKsCgaOcxVdGm58fiGZXO2CkLxjsMBfdelyDN8UYUdwT
   xpT0diXZ6YmVgQtgBYijgaeXnaBeWXqnmPn5ioRQ8dosN7nFMGIvR+sgo
   qUbeIrziNysnwu7rr6om4jevG8J1QgJ5s4jKZAVRQ7HVqniXHE2s450n2
   2l/lL3UIAwR98+ToEIXol1Pl7LsVnCRWOtuHM73vP/i9bgWLuOKqgjKTB
   74FO95jTbh4yl2phmoOgLIC0JGrnTeSwOfkJduovoNG/KEsq68s+jIfci
   w==;
X-CSE-ConnectionGUID: IMVPafY1SFaWn+YzcLow3w==
X-CSE-MsgGUID: nGV9dCNbRa+sc7FI9jjHHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54557644"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54557644"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 14:16:41 -0700
X-CSE-ConnectionGUID: VYWV97bgR9ura2dHBm/3lA==
X-CSE-MsgGUID: /KRTk0csRPWUgIM6pNe7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161347097"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 14:16:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubn0w-000BYl-12;
	Tue, 15 Jul 2025 21:16:38 +0000
Date: Wed, 16 Jul 2025 05:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9488/9557] cgroup.c:(.text+0x4ee1): dangerous
 relocation: call8: call target out of range:
 __list_del_entry_valid_or_report
Message-ID: <202507160517.DBLr8cHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
commit: 71a07e292d928cb0b3babc77e0e66f730a570f14 [9488/9557] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r111-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160517.DBLr8cHN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250716/202507160517.DBLr8cHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507160517.DBLr8cHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.o: in function `cgroup_rm_cftypes':
>> cgroup.c:(.text+0x4ee1): dangerous relocation: call8: call target out of range: __list_del_entry_valid_or_report
   kernel/cgroup/cgroup.o: in function `cgroup_add_cftypes':
>> cgroup.c:(.text+0x4fb0): dangerous relocation: call8: call target out of range: __list_add_valid_or_report
   cgroup.c:(.text+0x4fef): dangerous relocation: call8: call target out of range: __list_del_entry_valid_or_report
   kernel/cgroup/cgroup.o: in function `css_set_move_task':
   cgroup.c:(.text+0x52a0): dangerous relocation: call8: call target out of range: __list_del_entry_valid_or_report
   cgroup.c:(.text+0x5336): dangerous relocation: call8: call target out of range: __list_add_valid_or_report
   kernel/cgroup/cgroup.o: in function `cgroup_migrate_execute':
   cgroup.c:(.text+0x5614): dangerous relocation: call8: call target out of range: __list_del_entry_valid_or_report

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
