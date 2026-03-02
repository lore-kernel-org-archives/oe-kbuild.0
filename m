Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D47201004
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772434697; cv=none; b=olbSu1BdI3MUSlK1VUE5jrRNu4K5ehCBKDLuccXVeRohdUACWWVN2mAyMFssJQvXkyj/g6a8QJ4cFgjBkOB/2eFELjsC6h7y8aLYntPqeLN249JqLufP/SRSY+tnUw0LyTOFu804XM036mjRdHe+PwTh4xYmDd+XZ1vfFlus7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772434697; c=relaxed/simple;
	bh=TlCKDcKrL2woqFn+XlYXBJ7uvlQoCukVjrgReYaEJL0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LVtrJDSVvHUeBFJYDzJBwC+B3Hegi7Rb63Wh2FdnL0480m4ijRI4NGd3OA46gJ5SuKtEjoxH03Js/3MzqcY3FkCcJKqsFva7sjIyn7loB2+Ub5m73WmR1C85EaDwbGlNa6l7mgrMZgttshuQ8d3eevo5GE4uzSctZiwL9Lt9VoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P13rOWMn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P13rOWMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772434695; x=1803970695;
  h=date:from:to:cc:subject:message-id;
  bh=TlCKDcKrL2woqFn+XlYXBJ7uvlQoCukVjrgReYaEJL0=;
  b=P13rOWMn0Tqq+RoYzxvmkb2dU5DKDlOy9tsKsLAdP85ggCDUejqLfcYQ
   aq+UPRzuYeNPfMckrCE3zvdGwzi2uH1omtheUldRdomoDFw+msz+BH2u5
   47kX6yojvXfepGB57OPgjPTI3bqo88Ef0vzeQ08p8ktHttAsOqb649vUL
   N6SJv+nNU/uPjNXo6od30V/QQLP+OXCnBOx2C4p/FYqD3jOYgC7154zvm
   9tZ9wavBRLvXzcvmYGQNW7m+DbjNfxk8OeD8qwh8yLEVt7yvnKRuL5sgy
   IbOQNPeu6wYymz9F6ZRJ/Yq2SXz1JaWUWbqYtzUo6QrqQ9XMLQc41abBB
   g==;
X-CSE-ConnectionGUID: J/lwJ1WkRe6OgEc+dE5pFQ==
X-CSE-MsgGUID: ZkLFk3FFTXi9WgHun5Xs9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72461738"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="72461738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 22:58:15 -0800
X-CSE-ConnectionGUID: lxwnVs7hQ2K5s1d/bPhjXA==
X-CSE-MsgGUID: /k/JAQI5T+OiIcVmhT/KbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="220655164"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2026 22:58:14 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwxEJ-000000000Y9-3Dgi;
	Mon, 02 Mar 2026 06:58:11 +0000
Date: Mon, 02 Mar 2026 14:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning:
 vmlinux.unstripped has a LOAD segment with RWX permissions
Message-ID: <202603021458.SGNw5bbU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 0ce5139fd96e9d415d3faaef1c575e238f9bbd67 kbuild: always create intermediate vmlinux.unstripped
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260302/202603021458.SGNw5bbU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021458.SGNw5bbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603021458.SGNw5bbU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux2 has a LOAD segment with RWX permissions
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: vmlinux.unstripped has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
