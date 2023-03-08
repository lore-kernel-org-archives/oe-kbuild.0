Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F58462
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Mar 2023 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678298764; x=1709834764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoyhJJVz8mRhmwNb2nUh1dNxjRLaV9YmQRQANujVc3w=;
  b=G4t0hps8Vn97JbGiTuZkcpW8TNnNucZ5lKVLn0r/82AMuGElky+zwFwC
   rXRANQ3D84aKoOPKjvZ6tLICW0upvgdy1UINbqbBux69/cG9ddT/+WfEC
   E04C56yIy0O3St7Xlh6YR156NPqvHaNY40jBiNXgesUPmQEg+5rcxnePT
   bs5Kk1KrhUQZ/nkOZsSHQTIBsO8Q3Eafw5buScZUib6qDm2FvSuqCun80
   HpWF4F4Pc7dl07Lczzho6Yp3BdCg+CxbGK5rV3nZSRh4yqPhYqgKrDAgN
   FXLbB9seRQFbZLC6bp01BFtE649dLFePDG2t2vQAlJNmGM+wtWhBIVP8a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324546698"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="324546698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 10:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709520510"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="709520510"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 10:05:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZyAk-0002KH-2M;
	Wed, 08 Mar 2023 18:05:54 +0000
Date: Thu, 9 Mar 2023 02:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded iterator
 loops
Message-ID: <202303090153.YeswNcW4-lkp@intel.com>
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
In-Reply-To: <20230308035416.2591326-4-andrii@kernel.org>
References: <20230308035416.2591326-4-andrii@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: bpf@vger.kernel.org
TO: ast@kernel.org
TO: daniel@iogearbox.net
CC: andrii@kernel.org
CC: kernel-team@meta.com
CC: Tejun Heo <tj@kernel.org>

Hi Andrii,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-115539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230308035416.2591326-4-andrii%40kernel.org
patch subject: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded iterator loops
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090153.YeswNcW4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303090153.YeswNcW4-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:1244 is_iter_reg_valid_uninit() error: uninitialized symbol 'j'.

vim +/j +1244 kernel/bpf/verifier.c

8f263e1296a91f Andrii Nakryiko 2023-03-07  1224  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1225  static bool is_iter_reg_valid_uninit(struct bpf_verifier_env *env,
8f263e1296a91f Andrii Nakryiko 2023-03-07  1226  				     struct bpf_reg_state *reg, int nr_slots)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1227  {
8f263e1296a91f Andrii Nakryiko 2023-03-07  1228  	struct bpf_func_state *state = func(env, reg);
8f263e1296a91f Andrii Nakryiko 2023-03-07  1229  	int spi, i, j;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1230  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1231  	/* For -ERANGE (i.e. spi not falling into allocated stack slots), we
8f263e1296a91f Andrii Nakryiko 2023-03-07  1232  	 * will do check_mem_access to check and update stack bounds later, so
8f263e1296a91f Andrii Nakryiko 2023-03-07  1233  	 * return true for that case.
8f263e1296a91f Andrii Nakryiko 2023-03-07  1234  	 */
8f263e1296a91f Andrii Nakryiko 2023-03-07  1235  	spi = iter_get_spi(env, reg, nr_slots);
8f263e1296a91f Andrii Nakryiko 2023-03-07  1236  	if (spi == -ERANGE)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1237  		return true;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1238  	if (spi < 0)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1239  		return spi;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1240  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1241  	for (i = 0; i < nr_slots; i++) {
8f263e1296a91f Andrii Nakryiko 2023-03-07  1242  		struct bpf_stack_state *slot = &state->stack[spi - i];
8f263e1296a91f Andrii Nakryiko 2023-03-07  1243  
8f263e1296a91f Andrii Nakryiko 2023-03-07 @1244  		if (slot->slot_type[j] == STACK_ITER)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1245  			return false;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1246  	}
8f263e1296a91f Andrii Nakryiko 2023-03-07  1247  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1248  	return true;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1249  }
8f263e1296a91f Andrii Nakryiko 2023-03-07  1250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
