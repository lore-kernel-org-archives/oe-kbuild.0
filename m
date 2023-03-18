Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3438236B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679157771; x=1710693771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cT/Y3U9SK3fx56B0CCnk4hcOHqTqsU243dWA33DyYQ=;
  b=ibTdHnuEIVhH7nfEdQEHv+zhYh2dAWZARxSjZs5zzeha4vM+GHzL1cBt
   1ANlH4SwqgACwhEiDAVBY6f6l9jVeOZCFEVZcvD6LTwGWb3Gy7iBegqEj
   iK8aAcJfWIFI9nATRxcpkd+ovtWmnQZ0jhEGBqAAuQRoBpIqYHGmdrw1A
   1gARCvUrYqRLP2v/3q7x/IKDkEvV4H1ybxi6iIFP2xCIsZl7lfxUl0vvY
   PuO03WvhK29qHQtgmAisXHwZ5haLF6lZ3CLgXb4IncVzlGUtZuv7QEBAs
   0MEzQ/vi5nbQwW/b1h2avvwm4KpbdaeUGZVpVfZ8vtIjulgHJb34qa/gi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318101329"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318101329"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 09:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="673894036"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="673894036"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2023 09:42:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdZdo-000AAE-3D;
	Sat, 18 Mar 2023 16:42:49 +0000
Date: Sun, 19 Mar 2023 00:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/formalize_shadow_mmu 27/39]
 arch/x86/kvm/mmu/shadow_mmu.c: paging_tmpl.h is included more than once.
Message-ID: <202303190047.mG5vEuUI-lkp@intel.com>
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
TO: Ben Gardon <bgardon@google.com>
CC: Sean Christopherson <seanjc@google.com>

Hi Ben,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/formalize_shadow_mmu
head:   dd395c7174581183cd66020ac5a784bdf2e79cd1
commit: 47e60247f1c316484333b71439780fd37a2c1014 [27/39] KVM: x86/MMU: Move paging_tmpl.h includes to shadow_mmu.c
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190047.mG5vEuUI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/shadow_mmu.c: paging_tmpl.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
