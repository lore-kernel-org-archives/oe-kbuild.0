Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5680107B5
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnJPSvGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703797229; x=1735333229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BD6KIi8hvgUAD7ky9pHP2eycgBZ/B9z9io+mkyrYkME=;
  b=AnJPSvGzt9b5HhkF31yd/oxuYW2bCx98UozyXF5CQqgLU2lGN793RWMX
   uxLKAhEXEMM5ohmCDUQLk5cGni3OoLZJVCzBYh64mg3FEoeF7vLgNzJks
   FA2tjnODVceqnBurXq0MQygn+hejcD4QZmPNWRpKmZyNlhp9PCg8BfeOt
   dXyMuAPIxTjhkQXfGBuZzKc04NeFqgMIvHQW8Uf+gF/qHtu9KLRO6e1pb
   qhJptIhuqtflL8BivYuabkIc/gT77zxoxDbXbwAjt8x07q6ENn+WZQiEb
   D0fkVEWH4Zd7adflsTzGXeNg8eyX/LAF+jjzzGQC4KWQ6XHn64WfjDN1G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3665605"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="3665605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 13:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="782129648"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="782129648"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Dec 2023 13:00:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIxUG-000Gph-0Z;
	Thu, 28 Dec 2023 21:00:16 +0000
Date: Fri, 29 Dec 2023 04:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_fentry_test1
Message-ID: <202312290459.16MNk0CP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "resolve_btfids: unresolved symbol"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5837722ffecbbedf1b1dbab072a063565f0dad1
commit: 5b481acab4ce017fda8166fa9428511da41109e5 bpf: do not rely on ALLOW_ERROR_INJECTION for fmod_ret
date:   1 year, 1 month ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r013-20230121 (https://download.01.org/0day-ci/archive/20231229/202312290459.16MNk0CP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290459.16MNk0CP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312290459.16MNk0CP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol cgroup_rstat_updated
   WARN: resolve_btfids: unresolved symbol bpf_modify_return_test
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_ref
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_pass_ctx
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_pass2
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_pass1
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_mem_len_pass1
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_mem_len_fail2
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_mem_len_fail1
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_kptr_get
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_get_rdwr_mem
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_get_rdonly_mem
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_fail3
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_fail2
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_fail1
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_destructive
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_acquire
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_acq_rdonly_mem
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test3
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test2
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test1
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_acquire
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb1_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_int_mem_release
>> WARN: resolve_btfids: unresolved symbol bpf_fentry_test1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
