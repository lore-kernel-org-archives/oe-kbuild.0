Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E315D4
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Sep 2023 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695015543; x=1726551543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sB1EeeWTwh36eVp9Geev1BfHDGcNzVQsmG0DEU4ijzs=;
  b=g5sX1dVP9cTbfS5pku/VQnCnO6BzLnYidd9C/B+OqviBb5FZ2LWP35u+
   smiDvznNMVh01ZoF6iADHx7SDDAGizQbdV7S3v9CgebQyDmmE3miDKcVA
   VGbi70NtXCkXp5+2qJ2BEtdjJYS+1NrlbQCi+sDPQLJfUtOS41tGrwcOV
   sqSFi6b4uyWfavmAnrPvD068GKmfe86LQsBw+jJnN3pH14d6gGoxASDQM
   2Dj/99rYPnch2CTt1bUlDrq5smqvI7TzcczprY56xjaI87/psfIhaGcig
   JheLk4QDhijeeOByhz9FjMVdhY2jTXw7O7XShskbKNhuQFkbRf1WImRSj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="369896801"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="369896801"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 22:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="1076463545"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="1076463545"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2023 22:38:56 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi6yD-0005ly-2u;
	Mon, 18 Sep 2023 05:38:53 +0000
Date: Mon, 18 Sep 2023 13:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-stable:pending-6.4 3174/3239] kernel/bpf/verifier.c:5691
 coerce_reg_to_size_sx() warn: add some parenthesis here?
Message-ID: <202309181351.oI8ie9qM-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   31e7b9621bc356c04b80f15b7920ac9b67932874
commit: 3332a09a5a260600d5e2343832d63e74ac92331e [3174/3239] bpf: Support new sign-extension load insns
:::::: branch date: 17 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20230918 (https://download.01.org/0day-ci/archive/20230918/202309181351.oI8ie9qM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230918/202309181351.oI8ie9qM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309181351.oI8ie9qM-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:5691 coerce_reg_to_size_sx() warn: add some parenthesis here?

vim +5691 kernel/bpf/verifier.c

3332a09a5a2606 Yonghong Song 2023-07-27  5644  
3332a09a5a2606 Yonghong Song 2023-07-27  5645  static void coerce_reg_to_size_sx(struct bpf_reg_state *reg, int size)
3332a09a5a2606 Yonghong Song 2023-07-27  5646  {
3332a09a5a2606 Yonghong Song 2023-07-27  5647  	s64 init_s64_max, init_s64_min, s64_max, s64_min, u64_cval;
3332a09a5a2606 Yonghong Song 2023-07-27  5648  	u64 top_smax_value, top_smin_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5649  	u64 num_bits = size * 8;
3332a09a5a2606 Yonghong Song 2023-07-27  5650  
3332a09a5a2606 Yonghong Song 2023-07-27  5651  	if (tnum_is_const(reg->var_off)) {
3332a09a5a2606 Yonghong Song 2023-07-27  5652  		u64_cval = reg->var_off.value;
3332a09a5a2606 Yonghong Song 2023-07-27  5653  		if (size == 1)
3332a09a5a2606 Yonghong Song 2023-07-27  5654  			reg->var_off = tnum_const((s8)u64_cval);
3332a09a5a2606 Yonghong Song 2023-07-27  5655  		else if (size == 2)
3332a09a5a2606 Yonghong Song 2023-07-27  5656  			reg->var_off = tnum_const((s16)u64_cval);
3332a09a5a2606 Yonghong Song 2023-07-27  5657  		else
3332a09a5a2606 Yonghong Song 2023-07-27  5658  			/* size == 4 */
3332a09a5a2606 Yonghong Song 2023-07-27  5659  			reg->var_off = tnum_const((s32)u64_cval);
3332a09a5a2606 Yonghong Song 2023-07-27  5660  
3332a09a5a2606 Yonghong Song 2023-07-27  5661  		u64_cval = reg->var_off.value;
3332a09a5a2606 Yonghong Song 2023-07-27  5662  		reg->smax_value = reg->smin_value = u64_cval;
3332a09a5a2606 Yonghong Song 2023-07-27  5663  		reg->umax_value = reg->umin_value = u64_cval;
3332a09a5a2606 Yonghong Song 2023-07-27  5664  		reg->s32_max_value = reg->s32_min_value = u64_cval;
3332a09a5a2606 Yonghong Song 2023-07-27  5665  		reg->u32_max_value = reg->u32_min_value = u64_cval;
3332a09a5a2606 Yonghong Song 2023-07-27  5666  		return;
3332a09a5a2606 Yonghong Song 2023-07-27  5667  	}
3332a09a5a2606 Yonghong Song 2023-07-27  5668  
3332a09a5a2606 Yonghong Song 2023-07-27  5669  	top_smax_value = ((u64)reg->smax_value >> num_bits) << num_bits;
3332a09a5a2606 Yonghong Song 2023-07-27  5670  	top_smin_value = ((u64)reg->smin_value >> num_bits) << num_bits;
3332a09a5a2606 Yonghong Song 2023-07-27  5671  
3332a09a5a2606 Yonghong Song 2023-07-27  5672  	if (top_smax_value != top_smin_value)
3332a09a5a2606 Yonghong Song 2023-07-27  5673  		goto out;
3332a09a5a2606 Yonghong Song 2023-07-27  5674  
3332a09a5a2606 Yonghong Song 2023-07-27  5675  	/* find the s64_min and s64_min after sign extension */
3332a09a5a2606 Yonghong Song 2023-07-27  5676  	if (size == 1) {
3332a09a5a2606 Yonghong Song 2023-07-27  5677  		init_s64_max = (s8)reg->smax_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5678  		init_s64_min = (s8)reg->smin_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5679  	} else if (size == 2) {
3332a09a5a2606 Yonghong Song 2023-07-27  5680  		init_s64_max = (s16)reg->smax_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5681  		init_s64_min = (s16)reg->smin_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5682  	} else {
3332a09a5a2606 Yonghong Song 2023-07-27  5683  		init_s64_max = (s32)reg->smax_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5684  		init_s64_min = (s32)reg->smin_value;
3332a09a5a2606 Yonghong Song 2023-07-27  5685  	}
3332a09a5a2606 Yonghong Song 2023-07-27  5686  
3332a09a5a2606 Yonghong Song 2023-07-27  5687  	s64_max = max(init_s64_max, init_s64_min);
3332a09a5a2606 Yonghong Song 2023-07-27  5688  	s64_min = min(init_s64_max, init_s64_min);
3332a09a5a2606 Yonghong Song 2023-07-27  5689  
3332a09a5a2606 Yonghong Song 2023-07-27  5690  	/* both of s64_max/s64_min positive or negative */
3332a09a5a2606 Yonghong Song 2023-07-27 @5691  	if (s64_max >= 0 == s64_min >= 0) {
3332a09a5a2606 Yonghong Song 2023-07-27  5692  		reg->smin_value = reg->s32_min_value = s64_min;
3332a09a5a2606 Yonghong Song 2023-07-27  5693  		reg->smax_value = reg->s32_max_value = s64_max;
3332a09a5a2606 Yonghong Song 2023-07-27  5694  		reg->umin_value = reg->u32_min_value = s64_min;
3332a09a5a2606 Yonghong Song 2023-07-27  5695  		reg->umax_value = reg->u32_max_value = s64_max;
3332a09a5a2606 Yonghong Song 2023-07-27  5696  		reg->var_off = tnum_range(s64_min, s64_max);
3332a09a5a2606 Yonghong Song 2023-07-27  5697  		return;
3332a09a5a2606 Yonghong Song 2023-07-27  5698  	}
3332a09a5a2606 Yonghong Song 2023-07-27  5699  
3332a09a5a2606 Yonghong Song 2023-07-27  5700  out:
3332a09a5a2606 Yonghong Song 2023-07-27  5701  	set_sext64_default_val(reg, size);
3332a09a5a2606 Yonghong Song 2023-07-27  5702  }
3332a09a5a2606 Yonghong Song 2023-07-27  5703  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
