Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059AB1A8F84
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786833190; cv=none; b=K9mmU2mEJN07oca4QitGsrZbHcldQu3wkBOCGGYn69vApc7yUxP7yFHqQ6/SNPKZtANryfMMOyZMZupI0drgzkRac24aDbBwz0nadSDp7cuddPPaG2TmdixyeTk5mDpdq6RzhIsFKVydzpg3RUJ3O+xa0V8R6M3UN9atJvWa1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786833190; c=relaxed/simple;
	bh=gjWW35QKNaIPymIBkcvjUnOMlDoIrl5Csaq77ej0Cuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rV6jjuSarOtZaHMNtwu6lJcE5rBK3iK0g/K0hzXo720SkXqieVI+30F4FF27/OVtGesVGBct43JKc63i4gycarwAuBz6Q4rl1oYiGyOyQ6Hkrn+Fok3vbo4XAXYZIktB83ymWLuNMzEdy+nhNsjsJos6neddaXc/mP46XV0ob4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfhrKk2V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfhrKk2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786833189; x=1818369189;
  h=date:from:to:cc:subject:message-id;
  bh=gjWW35QKNaIPymIBkcvjUnOMlDoIrl5Csaq77ej0Cuc=;
  b=RfhrKk2VnJI6ULGF1jmgt794yy/1cqu9Tdmbzi+snSbmJePH4M+5/ElT
   /lgAnTw1MDJCJSDGE0aJxa8KAJWMElse4/eY6kGt0GFXp19fueJUgIjwc
   8j5UWc3FXPmFtg+2zLbtJ+OeyKolIfyS3hrVheIMNNFREbvLY0sd4mvIY
   h5bf+HG8unYxF95CjTziY125IbuisXqoh+cJv9rh8jj9/DkiN+/ZyukJa
   5QaLcIVQU/NXsJpgyEUPQAiBS+oQZvD0o1sBUvZZkeaDaQHD9WsA1UQ4i
   IUpsmZ3tM5e+gS0XeaDJZYqJaq7d8L1AMcDaS0Gt9vefB+ROZ1tWDE7kO
   Q==;
X-CSE-ConnectionGUID: uN4wIvNXQ2mpOGdvn9qVtg==
X-CSE-MsgGUID: uW9FosboSByC9HRwopq5kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87385223"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87385223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 15:33:08 -0700
X-CSE-ConnectionGUID: ntjJ08Y0SnuOHrkKiMBYlA==
X-CSE-MsgGUID: uvmdLe0GQhqGJlK8W2KKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="289354802"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 15:33:07 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvMw5-000000006UP-1s9P;
	Sat, 15 Aug 2026 22:33:05 +0000
Date: Sun, 16 Aug 2026 00:32:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: dirty_log_perf_test.c:284:17: warning: 'bitmaps' may be used
 uninitialized
Message-ID: <202608160038.VYbxK1T3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leonardo Bras <leo.bras@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/KVM-selftests-memstress-Add-option-to-enable-dirty-ring-on-VM-creation/20260813-140437
head:   441c3e64a7ec5b92b4fd0a61d6181f8ac74ad302
commit: 441c3e64a7ec5b92b4fd0a61d6181f8ac74ad302 KVM: selftests: dirty_log_perf_test: Add dirty-ring support
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260816/202608160038.VYbxK1T3-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160038.VYbxK1T3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160038.VYbxK1T3-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   dirty_log_perf_test.c: In function 'run_test':
>> dirty_log_perf_test.c:284:17: warning: 'bitmaps' may be used uninitialized [-Wmaybe-uninitialized]
     284 |                 memstress_get_dirty_log(vm, bitmaps, p->slots);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   dirty_log_perf_test.c:174:25: note: 'bitmaps' was declared here
     174 |         unsigned long **bitmaps;
         |                         ^~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
