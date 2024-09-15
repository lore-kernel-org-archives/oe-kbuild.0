Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C6B9463
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 08:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387541; cv=none; b=WyufSAOI9d2DIEpxQ690hDj0ve66/6ndlJMp47LjVr9mfPR2nopjRx23dNv6M9Rz4kSf6xk6Otv6gaiJxfegebUvZZ7C15SrxBqt0clcZmQmUSqGo7knoWsVQ7UDYP569TquYM3aNB0e/rvuCtX5+SvrxRyzYCyj/x87RLLQ4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387541; c=relaxed/simple;
	bh=6mnXC+7wJdqSrM4+SV7ak5sClTZHBGwIRs1/elo9azo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDt/BFN5k4P7o7yUhNER5UNTGhBAZlJvUjxvdXQ3BwfB8/G/LhpgchGtxkHVuBI//z+EL8RgMDbf9tMQWyI5idnBbQZce5RV/CpD8nKVhy85MDNt50bt47gJrQyjk7Nl5IBreOAxY/p7rmIrIqLTy8Kn5Pej2TQVte67k0PuYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAlhYpTd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAlhYpTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726387538; x=1757923538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mnXC+7wJdqSrM4+SV7ak5sClTZHBGwIRs1/elo9azo=;
  b=fAlhYpTdBviyvZqVHvgQZof1hkrim55n/3kFCgB7Whf3LeMcHRaXZv2x
   SmQO7+mmwH7GyELzGarLX7vi7Qnk33JeyBm+PSdkrHeI42bUOyI1sjx/b
   qYBm8Y8xZlxDXxIRmVg4a+kjk3Utx+Jt2zFFhLq4XxPxv1AWNeQPQpZBM
   ynlzigM/HlgVbCWDsdn46UxkbKBZ+EyLayB5yVbA2TMT3CZJwnHoJiQyS
   6dcumU/H109KWD/P9ZlGsOsYxjWP0Fo3uXgFiErdHPFynUChelWD66Jhe
   mx+equ+9uqj9EFmr8rFniohQxWKIAe0Er5yP5jaqYrEg9+6rSnHpwJh9n
   w==;
X-CSE-ConnectionGUID: TPa6W2yNSvCa2QCqiVgPFQ==
X-CSE-MsgGUID: vbATVI1oQXuBOF6Fv6xOrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35920347"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35920347"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 01:05:37 -0700
X-CSE-ConnectionGUID: YadXO5K7SMmDl7GY+ldwjQ==
X-CSE-MsgGUID: YwB+DBh3T1GfxleZ7WgnSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="72671232"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2024 01:05:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spkGE-0008Vy-0x;
	Sun, 15 Sep 2024 08:05:34 +0000
Date: Sun, 15 Sep 2024 16:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
Message-ID: <202409151657.C9e2MDGb-lkp@intel.com>
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
In-Reply-To: <37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe@kernel.org>
References: <37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc7 next-20240913]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409151657.C9e2MDGb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409151657.C9e2MDGb-lkp@intel.com/

smatch warnings:
kernel/unwind/sframe.c:107 find_fde() error: uninitialized symbol 'found'.
kernel/unwind/sframe.c:161 find_fre() error: uninitialized symbol 'last_f'.
kernel/unwind/sframe.c:166 find_fre() error: uninitialized symbol 'offset_size'.
kernel/unwind/sframe.c:167 find_fre() error: uninitialized symbol 'offset_count'.
kernel/unwind/sframe.c:188 find_fre() error: uninitialized symbol 'fre_info'.

vim +/found +107 kernel/unwind/sframe.c

6ce9812d0cc74f Josh Poimboeuf 2024-09-14   85  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   86  static int find_fde(struct sframe_section *sec, unsigned long ip,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   87  		    struct sframe_fde *fde)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   88  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   89  	s32 func_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   90  	struct sframe_fde __user *first, *last, *mid, *found;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   91  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   92  	ip_off = ip - sec->sframe_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   93  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   94  	first = (void *)sec->fdes_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   95  	last = first + sec->fdes_nr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   96  	while (first <= last) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   97  		mid = first + ((last - first) / 2);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   98  		if (get_user(func_off, (s32 *)mid))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   99  			return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  100  		if (ip_off >= func_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  101  			found = mid;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  102  			first = mid + 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  103  		} else
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  104  			last = mid - 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  105  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  106  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @107  	if (!found)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  108  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  109  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  110  	if (copy_from_user(fde, found, sizeof(*fde)))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  111  		return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  112  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  113  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  114  }
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  115  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  116  static int find_fre(struct sframe_section *sec, struct sframe_fde *fde,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  117  		    unsigned long ip, struct user_unwind_frame *frame)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  118  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  119  	unsigned char fde_type = SFRAME_FUNC_FDE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  120  	unsigned char fre_type = SFRAME_FUNC_FRE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  121  	s32 fre_ip_off, cfa_off, ra_off, fp_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  122  	unsigned char offset_count, offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  123  	unsigned char addr_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  124  	void __user *f, *last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  125  	u8 fre_info;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  126  	int i;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  127  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  128  	addr_size = fre_type_to_size(fre_type);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  129  	if (!addr_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  130  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  131  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  132  	ip_off = ip - sec->sframe_addr - fde->start_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  133  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  134  	f = (void *)sec->fres_addr + fde->fres_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  135  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  136  	for (i = 0; i < fde->fres_num; i++) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  137  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  138  		SFRAME_GET_USER_UNSIGNED(fre_ip_off, f, addr_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  139  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  140  		if (fde_type == SFRAME_FDE_TYPE_PCINC) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  141  			if (fre_ip_off > ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  142  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  143  		} else {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  144  			/* SFRAME_FDE_TYPE_PCMASK */
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  145  			if (ip_off % fde->rep_size < fre_ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  146  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  147  		}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  148  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  149  		SFRAME_GET_USER_UNSIGNED(fre_info, f, 1);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  150  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  151  		offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  152  		offset_size  = offset_size_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  153  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  154  		if (!offset_count || !offset_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  155  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  156  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  157  		last_f = f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  158  		f += offset_count * offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  159  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  160  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @161  	if (!last_f)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  162  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  163  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  164  	f = last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  165  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @166  	SFRAME_GET_USER_UNSIGNED(cfa_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @167  	offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  168  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  169  	ra_off = sec->ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  170  	if (!ra_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  171  		if (!offset_count--)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  172  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  173  		SFRAME_GET_USER_SIGNED(ra_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  174  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  175  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  176  	fp_off = sec->fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  177  	if (!fp_off && offset_count) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  178  		offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  179  		SFRAME_GET_USER_SIGNED(fp_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  180  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  181  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  182  	if (offset_count)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  183  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  184  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  185  	frame->cfa_off = cfa_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  186  	frame->ra_off = ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  187  	frame->fp_off = fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @188  	frame->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  189  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  190  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  191  }
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
