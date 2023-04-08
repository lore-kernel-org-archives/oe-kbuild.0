Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407729B0
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680985813; x=1712521813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inQEFPI0ZIKYbNR/tJ2xK8cgFMY8HW6HtLlRtXUGqsQ=;
  b=R1Zf08YKF95vfx8eH77MkHDdKp7BL5th/mM/RelV4D0/FbpAZ0b3OXGF
   WRMFLpHo4Gg0tHrw+6di9uZBoGpc+iz8djfCCrWorkFOVVqqOMAM0nDAE
   EfeM+CCVuObwgoAD6zDxKOUUcwZBDh5bMphxt6P8mgyB9LNzJRgeuJ1UZ
   FrrOl4Dsqu6i59NAUaYYwkxXx/ScsOdZriG2ZqUFqq2hi0P0lzyT3wXnc
   8VpS/h620qWIChV4L16hDo8+yVutdWZTQxNCEMJMRb4bojQooAuwXIwYN
   MYh2eNcaDpquY5HNF8yLgyaYl2tSGo/3xfOc+4sScX4toMQ5KzWfBR0Ta
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="323532430"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="323532430"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 13:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681332897"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="681332897"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 13:30:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plFCN-000U4r-0K;
	Sat, 08 Apr 2023 20:30:11 +0000
Date: Sun, 9 Apr 2023 04:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:kvm-upstream-workaround 100/335] arch/x86/kvm/vmx/main.c:
 mmu.h is included more than once.
Message-ID: <202304090410.iQ7sU94Q-lkp@intel.com>
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
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3e6762343e0ddcb90b2e49af3a341051541d1a3a
commit: ffa7348a84c3a30f5ac09367f0a2136ad75a85cc [100/335] KVM: TDX: Require TDP MMU and mmio caching for TDX
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304090410.iQ7sU94Q-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/main.c: mmu.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
