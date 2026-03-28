Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152017C220
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774741811; cv=none; b=lectl9LOqT0Mhf30DXhErhkQJZ8ZjCaEt2kEDId+A8WeMB+jQE5lqKKrFxWhf/9U4c7W4iwY3cD5apq0H+GTh+0qfcvBIwxZy8z5gpmi2A0l31gGN4FgZ1A2cIC2N7q87VhhAAG14nvC6YD6UfkwxIHr5QFTWPx+mIO9kh0lYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774741811; c=relaxed/simple;
	bh=wT6n0fdn3mmJsl6zo8Yz8MqQyoSoLAvH2oPW84foq5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JWVJrEO67gdTd6zyKm6MoB93F9B0enxLkH6H4B3+9zV5SSC/5dknFnQFZFGVZWUV6frvV5OpzJiIqVzYx6EZZMMdqqp+YWig0Br0Vxy/Qv2n2rmO5N3wxb+/+ZK3CYDoWV7Yy5DF53JbePXCUG5P+luaISyn4W3ErflUBPBuWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sv4oX5BR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sv4oX5BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774741810; x=1806277810;
  h=date:from:to:cc:subject:message-id;
  bh=wT6n0fdn3mmJsl6zo8Yz8MqQyoSoLAvH2oPW84foq5M=;
  b=Sv4oX5BRSRY+tdM5fQmWXxj5OoF3o/jczRNHLxMxeSbZCk1pPOCqjXhd
   tGsZzaXczCSuKxl2Xi3Ir+9GIgQ1g3bOEVslBs0uC0RfND2mIPCOVuf3u
   k8LdJpwOTpIzkiTqT9+2QQgmHgouUHKaaZZ/h2DF9EPLzsVnKrVfRIVpD
   D3gofzszGpGCRfjMHhAfoylS+uTOZ4mi+QbcvnA51w1atQhqZdkD9o4z4
   Hau6W3fW9bcc8r7tLsNE/jEMkvvikI+R7aVm2W6rqbYRtWjBr/Up5HORL
   6Iu/XQLW3mvb3eqih6mgdBXt1kbFng8UeWzP3OdfddN7n6Pl1YEX4Vfyd
   w==;
X-CSE-ConnectionGUID: g37eDt6fT/K6NAwqgMEjZw==
X-CSE-MsgGUID: h6nNXjcGRkefULm4gWrjEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74958177"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="74958177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 16:50:09 -0700
X-CSE-ConnectionGUID: gLSyZ9ytQ6WQHO5kzTkO8Q==
X-CSE-MsgGUID: lcgxccqbQRWDpEykgq+YdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="248894378"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2026 16:50:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6dPq-00000000Bsj-1JDz;
	Sat, 28 Mar 2026 23:50:06 +0000
Date: Sun, 29 Mar 2026 07:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool:
 .text.unlikely.show_fault_information+0xb5: special: can't find new
 instruction
Message-ID: <202603290701.KepC5w7x-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbfffcca2bf0622b601b7eaf477aa29035169184
commit: 3e7be635937d19b91bab70695328214a3d789d51 objtool: Change "warning:" to "error: " for fatal errors
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: x86_64-buildonly-randconfig-003-20260329 (https://download.01.org/0day-ci/archive/20260329/202603290701.KepC5w7x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290701.KepC5w7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290701.KepC5w7x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: .text.unlikely.show_fault_information+0xb5: special: can't find new instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
