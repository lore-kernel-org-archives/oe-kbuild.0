Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279DD2749DF
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Apr 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641096; cv=none; b=szNCdyqMbOM+f2Zqie3nkVxAFg29AUe1/lOMfm7ovnrawSX6bXHgJFpzj+yosJkPugR6OGwBaeI9eGlQgZO+FfWz5tUQutHraJTSDBWyonDPbc4u5QrCbGuhD+QFv9lUV9j24GEbngxM+UGc2ufPkUOG7xvyjXrfKBHN1soCY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641096; c=relaxed/simple;
	bh=rSnf+UvwbIdWCyWV6JjajnS82DU5wkDeTnnScP+iZ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsAzEHJJgdIbS/HzilRd17HvPZSLXAtn6UjKjfPUuzK+1ndxL+Yi5d6QTlz4HCbiV3LerM+67z2RS+TJjw5CmT3V0YHxRtgL8Ro00rSi0wmJ2ThmUqvIvMU0YDto5YZHrdJAzaPTyHwxV9fTQ8DbVwGFETXZAooXzI7Vq8Z34u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXFtNoac; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXFtNoac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744641094; x=1776177094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSnf+UvwbIdWCyWV6JjajnS82DU5wkDeTnnScP+iZ0s=;
  b=HXFtNoacOSukak967KnBQVCtzy3w/kSkdFSRal0UFHJZToN3Xdrwxzmu
   uSHKo5DAYlz7I5Y+ulXrHBb6kePfpJ7+01WLe5ERDK6ueFhxDgIBabgGz
   GVRnr9Qh8R+39vM74jFo2Z1J7fBA+xa7fFYwnnbgviLaEEtUr1TQTMORD
   pL8yqL3m4Yo6t7bZDbsu8mHAU5r13OHDy3HNL6Bme6e/dWMVueWsqC4qB
   IWcqHI+ZzeRy3SXo3BgWPXa1Df7g/6dChFgRDNpT9E5in+6ZWT4eoSIF8
   oUDjUarRRdEL12HFqRB0Yy31Xfe3ZtpKOfNsu8xLkkcavvj2NhUauKVCG
   A==;
X-CSE-ConnectionGUID: dkW3gQKMQGyj7t0suGLaWA==
X-CSE-MsgGUID: r+HTmSmHQjOEcOofhJ8fsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56756655"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56756655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 07:31:15 -0700
X-CSE-ConnectionGUID: 3BXIEpeCQ/mA+zan606Z0A==
X-CSE-MsgGUID: NGSFTW9fSjqstqycyXAD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134816457"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 07:31:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Kq7-000EJt-2b;
	Mon, 14 Apr 2025 14:31:11 +0000
Date: Mon, 14 Apr 2025 22:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/ftrace.c:3437 add_next_hash() warn: variable
 dereferenced before check 'filter_hash' (see line 3436)
Message-ID: <202504142245.rmvWCoRj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
commit: 0ae6b8ce200da00a78f33c055fdc4fe3225d22ec ftrace: Fix accounting of subop hashes
date:   3 days ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250414 (https://download.01.org/0day-ci/archive/20250414/202504142245.rmvWCoRj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504142245.rmvWCoRj-lkp@intel.com/

smatch warnings:
kernel/trace/ftrace.c:3437 add_next_hash() warn: variable dereferenced before check 'filter_hash' (see line 3436)

vim +/filter_hash +3437 kernel/trace/ftrace.c

0ae6b8ce200da0 Steven Rostedt 2025-04-09  3413  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3414  static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3415  			 struct ftrace_ops_hash *ops_hash, struct ftrace_ops_hash *subops_hash)
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3416  {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3417  	int size_bits;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3418  	int ret;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3419  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3420  	/* If the subops trace all functions so must the main ops */
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3421  	if (ftrace_hash_empty(ops_hash->filter_hash) ||
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3422  	    ftrace_hash_empty(subops_hash->filter_hash)) {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3423  		*filter_hash = EMPTY_HASH;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3424  	} else {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3425  		/*
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3426  		 * The main ops filter hash is not empty, so its
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3427  		 * notrace_hash had better be, as the notrace hash
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3428  		 * is only used for empty main filter hashes.
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3429  		 */
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3430  		WARN_ON_ONCE(!ftrace_hash_empty(ops_hash->notrace_hash));
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3431  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3432  		size_bits = max(ops_hash->filter_hash->size_bits,
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3433  				subops_hash->filter_hash->size_bits);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3434  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3435  		/* Copy the subops hash */
0ae6b8ce200da0 Steven Rostedt 2025-04-09 @3436  		*filter_hash = alloc_and_copy_ftrace_hash(size_bits, subops_hash->filter_hash);
0ae6b8ce200da0 Steven Rostedt 2025-04-09 @3437  		if (!filter_hash)
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3438  			return -ENOMEM;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3439  		/* Remove any notrace functions from the copy */
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3440  		remove_hash(*filter_hash, subops_hash->notrace_hash);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3441  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3442  		ret = append_hash(filter_hash, ops_hash->filter_hash,
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3443  				  size_bits);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3444  		if (ret < 0) {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3445  			free_ftrace_hash(*filter_hash);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3446  			return ret;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3447  		}
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3448  	}
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3449  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3450  	/*
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3451  	 * Only process notrace hashes if the main filter hash is empty
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3452  	 * (tracing all functions), otherwise the filter hash will just
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3453  	 * remove the notrace hash functions, and the notrace hash is
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3454  	 * not needed.
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3455  	 */
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3456  	if (ftrace_hash_empty(*filter_hash)) {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3457  		/*
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3458  		 * Intersect the notrace functions. That is, if two
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3459  		 * subops are not tracing a set of functions, the
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3460  		 * main ops will only not trace the functions that are
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3461  		 * in both subops, but has to trace the functions that
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3462  		 * are only notrace in one of the subops, for the other
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3463  		 * subops to be able to trace them.
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3464  		 */
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3465  		size_bits = max(ops_hash->notrace_hash->size_bits,
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3466  				subops_hash->notrace_hash->size_bits);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3467  		*notrace_hash = alloc_ftrace_hash(size_bits);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3468  		if (!*notrace_hash)
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3469  			return -ENOMEM;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3470  
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3471  		ret = intersect_hash(notrace_hash, ops_hash->notrace_hash,
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3472  				     subops_hash->notrace_hash);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3473  		if (ret < 0) {
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3474  			free_ftrace_hash(*notrace_hash);
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3475  			return ret;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3476  		}
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3477  	}
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3478  	return 0;
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3479  }
0ae6b8ce200da0 Steven Rostedt 2025-04-09  3480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
