Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A92D3EF2
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764575847; cv=none; b=lC5HF/OgOqTpzWGB8tpwZn1N5KgCD3eJU8AIb1+MnpGOl4OFRpBCOEnFgNDH0etXEzHXPxYfveVdR4V4svhwzctgoDBzjawhUxhq268D0jTBUtsztLTvH31YKWU0NY0V/DKPsx8hvyrRQuId9LAbtLjlFeNRCI/AcMerDFRWa/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764575847; c=relaxed/simple;
	bh=NK89Z84nWJORVDAaxMzs6fcsfGl9pCcSKSlJCviW6ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ih7c/Gq+TTgu4WWJ0jG0vNcY/3WaHA0Otuq0z3QcTZyKd1fdkAVLwQ8Xl1sp5/shGvT65DUWhqd7ccLedNQD7Nh/5tpZ4ZQIlEj6DgaAJNqYb1F5KQx9zLzW6QZeW9O6/yBPHD6ompqPwChqoodGXF1kLP3m1LxjjGtzktDnRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aA7wd39D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aA7wd39D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764575845; x=1796111845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NK89Z84nWJORVDAaxMzs6fcsfGl9pCcSKSlJCviW6ns=;
  b=aA7wd39DT51HCtGd/R3NOkhdUxbmdKKrQLALJbNlMzjq0uJRjobHsmct
   ccNXRBHTfH4y+SWY2XDgQdXAaFdwi7fQfyYL7T5F14z/MdAsGvU+ngksp
   zW8urrme/IJipu09HWZyYpWEUwtEETrEuv7qJeUnhMotxOYbOPd81Ubv7
   dEl6d2q/JpMZIrxX9E8df15ADABDfyiMxAQLa06+kh1GztZNGNGOnApLX
   W95dmMmwulmffV9UWAuoU9Qo+RnTQTcIZ0wwaX0kl8A33G09UOUM8HLAz
   vTtxqbahWP/Y87Y77JBI9nhg+oQf8Uq+kmUC2zGXwQmozxRzfLy3NdSfi
   g==;
X-CSE-ConnectionGUID: hx5InK7nRiqVmbuNIevVgQ==
X-CSE-MsgGUID: +NfRtDYpRf6zn52B3nsHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65687088"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="65687088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:57:24 -0800
X-CSE-ConnectionGUID: PLkuk88sTxSEV+agzUNbhQ==
X-CSE-MsgGUID: 2uf9Hn5YTiqFI3KajNNicA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194103927"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Nov 2025 23:57:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPymf-000000002eT-3fhM;
	Mon, 01 Dec 2025 07:57:21 +0000
Date: Mon, 1 Dec 2025 08:56:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12842/13171] Warning: ipc/sem.c:629 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512010812.sqmikT0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [12842/13171] docs: kdoc: various fixes for grammar, spelling, punctuation
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251201/202512010812.sqmikT0C-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010812.sqmikT0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512010812.sqmikT0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: ipc/sem.c:629 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * perform_atomic_semop[_slow] - Attempt to perform semaphore

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
