Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3C1CCDF
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691842336; x=1723378336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gT/KfGkSQCubiOVobgDlBff43+i6rcoY4intXox9+Ng=;
  b=GObLXwYCzTrDFaCQwLkijZlqHycgj0j1u24Yjr+DxDGAuBSfmA7JCsfq
   oaYxnqzhVorxzWbepXGLfBWXL0bPdzOb4AYoIdMZMryMAArHJs4WruB4X
   MeDSuBx7HszBpugeubdUtYxWxUs3CpoRH5XiQO0R6MOk7ndzL75xGzRYt
   CA+QcMyFgySwnhAJqS/xMk5hMs436nEJfQubkvQDFI3FGGeccLH49CprX
   IQ6FgB77AcjYxP51PlEx4mCM38rFhXzAOe2QRehT4LAcbzL6hGPnOF+dE
   5qTUFXPtO21nGyCBIzpSVvBn8vEggOT1D81qbZBB6KKaUsVkHoJ5Spx+H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375532244"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="375532244"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 05:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063559699"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="1063559699"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Aug 2023 05:12:13 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUnTZ-0008ZI-0N;
	Sat, 12 Aug 2023 12:12:13 +0000
Date: Sat, 12 Aug 2023 20:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [intel-tdx:kvm-upstream-workaround 232/338]
 arch/x86/kvm/x86.c:13738:7-8: ERROR: iterator variable bound on line 13733
 cannot be NULL
Message-ID: <202308122020.KJ4asNyc-lkp@intel.com>
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
TO: Sagi Shahar <sagis@google.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   57250b72d19fb19552ae54811695727debe3a257
commit: f472774395a8dbe82fa34c9aa169e162ef793f2b [232/338] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-x052-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122020.KJ4asNyc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122020.KJ4asNyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308122020.KJ4asNyc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/x86.c:13738:7-8: ERROR: iterator variable bound on line 13733 cannot be NULL
   arch/x86/kvm/x86.c:13758:6-7: ERROR: iterator variable bound on line 13753 cannot be NULL

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
