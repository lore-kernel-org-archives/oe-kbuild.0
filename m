Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF72433D2
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Aug 2024 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723760131; cv=none; b=CyzxvrUEmSjd9WFXhFjLjC1vCW479DXU1gwxSFbX/pKMTr8m8TwvwFdPHmIXwtqC+TWIgzXXGPgs1FMHN/D86PSmi4vd8RA49/Hw1teAxGEQOnozxtmXmLXkCv66s4ONs0UU2ktJ24NRV/ocIzYn6OCXEbJo+29Qu4bUeY8FOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723760131; c=relaxed/simple;
	bh=iMuEckow+e7PFOf7H+inm3FrolEYxbLjHq4DoZC7/08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZyyzRLL21RiodG090twVSpMIhti5Ts8slL/Sd1l9ZiyKP0qaDo+iIecVgFIUCLhMKe5hcxarGp0oq/S1yRUkA1PpgxEvv39W0uMn2kMmC1iQwb+66NzxHelRh+h5DfhFyOtJ4hfwCR7YrqJnLwFsSCcO5zKKwk/qN7VMFGzUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MI6d0HgM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MI6d0HgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723760129; x=1755296129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMuEckow+e7PFOf7H+inm3FrolEYxbLjHq4DoZC7/08=;
  b=MI6d0HgMD0sVfnECEEYDVf1549Y5N04VtrzCY0xjob17qy2Uu2RXdx9B
   vG94wfk1FgJbbiPD0ob/q2sLVtxapwW8wTxbaKrRsXoxGLxcRJHlo5/xR
   jjLfqVlrrpcW4ivANPojNwbOek1b6Cg8XPaehrwvpIGdRoyjBMPlagKST
   D4BpUwiiFOLk1aurQ75AiCi508WYs1cDrbj3+gS6JD15dq3/2WX4GTwog
   qN8kn8hpx8JzSQVd7Y+bk3mWbD1yv+YQ7tv4btivYLWnZmsAM/U+xvN2A
   /EsZsYCCJE8KzHhkz6NNzDYG/roD2Q9Zr5Jlw6cryx/acXAzfpqcOkVIh
   w==;
X-CSE-ConnectionGUID: c8T8Spm8Tna/5lIAZWYiBw==
X-CSE-MsgGUID: OP9Fd0j6SoSMLbFHSwbjhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22214610"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="22214610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 15:15:29 -0700
X-CSE-ConnectionGUID: ChV41d5hSPCGEjJDJ7XjPA==
X-CSE-MsgGUID: PogITIoJQIGSd2g3m38j1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59767987"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2024 15:15:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seikf-0005gA-0s;
	Thu, 15 Aug 2024 22:15:25 +0000
Date: Fri, 16 Aug 2024 06:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4185/4951] kernel/bpf/verifier.c:18881
 add_used_map_from_fd() warn: fd re-used after fget(): 'fd'
Message-ID: <202408160659.ThC0qtk1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
commit: 535ead44ffd08479212e31729a7118bd4e9ac699 [4185/4951] bpf: factor out fetching bpf_map from FD and adding it to used_maps list
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240816/202408160659.ThC0qtk1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408160659.ThC0qtk1-lkp@intel.com/

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
