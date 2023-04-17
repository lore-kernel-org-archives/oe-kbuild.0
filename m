Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD994C9A
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Apr 2023 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681726977; x=1713262977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yX+I6PKtpvaWwf9XIUeFBi7TToOePv4ffAqYuol12Lg=;
  b=ZqP0EZCGy7oG4cTsxjAX+LRIWgQHKjrPUeISY0VDdiuNR7/A/ohMAe4q
   Iz+LzsHK+xO9OncYAL+0pgvPSQx69ZaciOjiUJln6AFxXKfBIateM81OF
   0Wa+SGvgZQQEFStB1wDcMqRNynyPxv4kMTXjJFIExpbjs2+sIDHAT35nZ
   XAsXwf2roxfYH6SJ1N7Xm4bjB0PpFsr1z1Of/QPdqJkbWB9g9iQvtMkFt
   X5ivkTcSDG3virYABIvGFsFi/YlvmwqNd7qNONQ/MkdlbASvuh3kDDCxm
   c79loM0cXdXdtZ4GySME4SYeddTIBK6C7KVUz7jPF3NiVlUNTczgRLF/U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="347596106"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="347596106"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 03:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="802062795"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="802062795"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2023 03:22:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poM0O-000cHf-18;
	Mon, 17 Apr 2023 10:22:40 +0000
Date: Mon, 17 Apr 2023 18:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [chrome-os:chromeos-5.10 32/46] arch/x86/kvm/mmu/mmu.c:1630:6-25:
 atomic_dec_and_test variation before object free at line 1634.
Message-ID: <202304171837.DxLSmeNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   2348f131ec0b7be41e33d1f11043b6e5fc253b23
commit: 902b2879dd3118da604138e10829d7d7b5cec89d [32/46] CHROMIUM: mm: multigenerational lru: scan kvm mmu pages
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c022-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171837.DxLSmeNM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304171837.DxLSmeNM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/mmu.c:1630:6-25: atomic_dec_and_test variation before object free at line 1634.

vim +1630 arch/x86/kvm/mmu/mmu.c

260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity 2007-01-05  1627  
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1628  static void kvm_mmu_put_page(struct kvm *kvm, struct kvm_mmu_page *sp)
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1629  {
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23 @1630  	if (!atomic_dec_and_test(&sp->ref_count))
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1631  		return;
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1632  
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1633  	spin_lock(&kvm->arch.mmu_page_list_lock);
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23 @1634  	list_del_rcu(&sp->mmu_page_list);
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1635  	spin_unlock(&kvm->arch.mmu_page_list_lock);
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1636  
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1637  	call_rcu(&sp->rcu_head, kvm_mmu_free_page_rcu);
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1638  }
902b2879dd3118 arch/x86/kvm/mmu/mmu.c Yu Zhao    2021-06-23  1639  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
