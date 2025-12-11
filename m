Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DF423BF91
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 23:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494536; cv=none; b=YjH34/eWdfaCnXWYpVcirV8ga8TpVMUrK+CFyadW7ITn2mT+oDyTWU6SnMVCRPFofTFbGcmVlLfazUVm0baa/hDX/uWk6cHoQXXeBfg8mYtkDG++FEWr3fkPmQXqwEux15dBjTvTPFM0zLASHRTb7hclWVRO6ANGrqjAyiSYHYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494536; c=relaxed/simple;
	bh=ruiFrHpkxUaR2tkzG5ilU674zW1ulSb7jqjvTLG8GcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlELfOXZ225uUGqmr4Sz9nq4qGm6M/V+5NSCs1gMCzFsJKBGGdF9vuOI0B/YssenMAjbI2EXpYlEIV+3GFIiCgX3vQVKFBv+du0ct/YezqlBBzYCU94MbcY57VBsitghOFWLBoRiTYPoRbkx0cPDO7aO0VNwcsTkLIQHwlHDNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJzhT93z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJzhT93z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765494534; x=1797030534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ruiFrHpkxUaR2tkzG5ilU674zW1ulSb7jqjvTLG8GcE=;
  b=FJzhT93zDc/DcZfSPs2oD0TQa7gmFLPhrtDXEaHWtNgoyCR+9YlSx+72
   qIiojOr0TH7O2dbOBcHzneBjcIiohKu7C7hWZU/T3QMTX2PKE/As9iz+A
   8RPMwgnwCV8fcBOy+mLmAkgT7YIvEGkjjR/auWmztMt/sdXPubmUZK6bC
   PXkkzR3Gfo9S2oBJ5pPTkNqAHYURl3WK6D143nwUiWH2PNnTWEMUz7d05
   r0yblh4nLiesZSALUbUiO20b/Gx2JIzjH9CUpNOmQvudBTCkBNFmGSdk6
   SDEiSyM9JxJz3FBjh58NfBusQFV9Ek8wpZeBJ+G0jgYnu+yBDAYFfD1UQ
   g==;
X-CSE-ConnectionGUID: q0SC+4O8SoWR8ksoppD9fg==
X-CSE-MsgGUID: IzKeP+4zSZmy+4hRBJADmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="85094791"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="85094791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:08:53 -0800
X-CSE-ConnectionGUID: IoM+nF7sThWvN0JTDpOPWw==
X-CSE-MsgGUID: WCWh8ZDaS9GTtlapnp91Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196008858"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 15:08:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpmE-000000005B5-1Mv6;
	Thu, 11 Dec 2025 23:08:50 +0000
Date: Fri, 12 Dec 2025 07:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 2/2] kernel/bpf/verifier.c:18881
 add_used_map_from_fd() warn: fd re-used after fget(): 'fd'
Message-ID: <202512120614.iDi4QmRb-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: 535ead44ffd08479212e31729a7118bd4e9ac699 [2/2] bpf: factor out fetching bpf_map from FD and adding it to used_maps list
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 4 months ago
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120614.iDi4QmRb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120614.iDi4QmRb-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18881 add_used_map_from_fd() warn: fd re-used after fget(): 'fd'

vim +/fd +18881 kernel/bpf/verifier.c

b741f1630346de Roman Gushchin  2018-09-28  18867  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18868  /* Add map behind fd to used maps list, if it's not already there, and return
535ead44ffd084 Andrii Nakryiko 2024-08-06  18869   * its index. Also set *reused to true if this map was already in the list of
535ead44ffd084 Andrii Nakryiko 2024-08-06  18870   * used maps.
535ead44ffd084 Andrii Nakryiko 2024-08-06  18871   * Returns <0 on error, or >= 0 index, on success.
535ead44ffd084 Andrii Nakryiko 2024-08-06  18872   */
535ead44ffd084 Andrii Nakryiko 2024-08-06  18873  static int add_used_map_from_fd(struct bpf_verifier_env *env, int fd, bool *reused)
535ead44ffd084 Andrii Nakryiko 2024-08-06  18874  {
535ead44ffd084 Andrii Nakryiko 2024-08-06  18875  	struct fd f = fdget(fd);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18876  	struct bpf_map *map;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18877  	int i;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18878  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18879  	map = __bpf_map_get(f);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18880  	if (IS_ERR(map)) {
535ead44ffd084 Andrii Nakryiko 2024-08-06 @18881  		verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18882  		return PTR_ERR(map);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18883  	}
535ead44ffd084 Andrii Nakryiko 2024-08-06  18884  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18885  	/* check whether we recorded this map already */
535ead44ffd084 Andrii Nakryiko 2024-08-06  18886  	for (i = 0; i < env->used_map_cnt; i++) {
535ead44ffd084 Andrii Nakryiko 2024-08-06  18887  		if (env->used_maps[i] == map) {
535ead44ffd084 Andrii Nakryiko 2024-08-06  18888  			*reused = true;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18889  			fdput(f);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18890  			return i;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18891  		}
535ead44ffd084 Andrii Nakryiko 2024-08-06  18892  	}
535ead44ffd084 Andrii Nakryiko 2024-08-06  18893  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18894  	if (env->used_map_cnt >= MAX_USED_MAPS) {
535ead44ffd084 Andrii Nakryiko 2024-08-06  18895  		verbose(env, "The total number of maps per program has reached the limit of %u\n",
535ead44ffd084 Andrii Nakryiko 2024-08-06  18896  			MAX_USED_MAPS);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18897  		fdput(f);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18898  		return -E2BIG;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18899  	}
535ead44ffd084 Andrii Nakryiko 2024-08-06  18900  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18901  	if (env->prog->sleepable)
535ead44ffd084 Andrii Nakryiko 2024-08-06  18902  		atomic64_inc(&map->sleepable_refcnt);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18903  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18904  	/* hold the map. If the program is rejected by verifier,
535ead44ffd084 Andrii Nakryiko 2024-08-06  18905  	 * the map will be released by release_maps() or it
535ead44ffd084 Andrii Nakryiko 2024-08-06  18906  	 * will be used by the valid program until it's unloaded
535ead44ffd084 Andrii Nakryiko 2024-08-06  18907  	 * and all maps are released in bpf_free_used_maps()
535ead44ffd084 Andrii Nakryiko 2024-08-06  18908  	 */
535ead44ffd084 Andrii Nakryiko 2024-08-06  18909  	bpf_map_inc(map);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18910  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18911  	*reused = false;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18912  	env->used_maps[env->used_map_cnt++] = map;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18913  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18914  	fdput(f);
535ead44ffd084 Andrii Nakryiko 2024-08-06  18915  
535ead44ffd084 Andrii Nakryiko 2024-08-06  18916  	return env->used_map_cnt - 1;
535ead44ffd084 Andrii Nakryiko 2024-08-06  18917  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
