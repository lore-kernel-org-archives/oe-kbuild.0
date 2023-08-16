Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AD101F6
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Aug 2023 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692195541; x=1723731541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJiovYSbsg/15s7mxdP5YLFjN0s5RCWkK+hv2SEmKVM=;
  b=Q6caflN2yGvSr9ERcl5m6z9ZFriztgkVdfW9Q0c9XFkUaRRt8Uc+UPcH
   4RnpX36X9JhbmajPw7F4mUP0jnNfzYggtIDws6F1tojmeX06AmE0J9Q/4
   h0cSO9UyB77uimUvyu9BoMSUXGtfDpltEa+JgX2nyeRnXv1r4k3x8hKR5
   vFsZr6SCo5cyYWNoqTc4UBjMQCSs/6iawqNaO76jv+DAt6KeHMdpjFZ1/
   eg6S4/JthU6rUCms9OejwU0nk53ekApyFuiDkaE1F7Z1ZveRGiErAWKv1
   BJ1gRiwAc/KPx91vU0B7A+SW5VTfr+CCuvGyMhJp1dvsT5QdtVSbGyisB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362696529"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="362696529"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 07:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908034121"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="908034121"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Aug 2023 07:18:59 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWHMQ-0000Mj-2H;
	Wed, 16 Aug 2023 14:18:58 +0000
Date: Wed, 16 Aug 2023 22:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.08.02a 35/49] arch/x86/kernel/nmi.c:441:6:
 warning: no previous declaration for 'set_nmi_torture'
Message-ID: <202308162201.3tIrprbg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit e88478e3fcd3b7648c1283c2be45b376f1563882 was found in branch paulmck-rcu/dev.2023.08.02a, not in new branch paulmck-rcu/dev.2023.08.14a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.02a
head:   a90c4cbc91475bd5df35f712a954972fbfff40a1
commit: e88478e3fcd3b7648c1283c2be45b376f1563882 [35/49] EXP x86/nmi: Add a set_nmi_torture() function to control NMI testing
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230816/202308162201.3tIrprbg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162201.3tIrprbg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308162201.3tIrprbg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous declaration for 'set_nmi_torture' [-Wmissing-declarations]
    void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
         ^~~~~~~~~~~~~~~


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

e88478e3fcd3b7 Paul E. McKenney 2023-01-20  439  
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  440  /* Set the test values as desired. */
e88478e3fcd3b7 Paul E. McKenney 2023-01-20 @441  void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  442  {
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  443  	WRITE_ONCE(nmi_delay, nmi_delay_in);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  444  	WRITE_ONCE(nmi_halt1, nmi_halt1_in);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  445  	WRITE_ONCE(nmi_halt2, nmi_halt2_in);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  446  	WRITE_ONCE(nmi_halt3, nmi_halt3_in);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  447  	pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  448  		__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  449  }
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  450  EXPORT_SYMBOL_GPL(set_nmi_torture);
e88478e3fcd3b7 Paul E. McKenney 2023-01-20  451  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
