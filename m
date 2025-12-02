Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40922BE7BB
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764702701; cv=none; b=gv/sPEUq6L4rqBnmG4S9ItQ90lkFmvKOVYY6Yns9G8kp8SFOAZvIn8D9eZwUBbjieKo15qkVsv2X2Ojfb/eUT56jcKDA9IEduzY1BmzDmWCXh4zmWmD4W+Lrt4wXDpGjWs0NCrQ3CazzDrkHygPUqLVkxyt5ITlP40S/E7eJPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764702701; c=relaxed/simple;
	bh=vRg6k1miLvlRa0Ijjp44vr7l/ByaFEauckDLvK5B8zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqtsmcxkJaKHKIpSZxqMgMdBaHRuo4dQpvTheWMZWRjqs5YM1N9Lzst8/KKSxqHMupqLk7kBtKH/YvVl036AQxpkEDhWqo52VfBJFHuAtrPbVCkhZLYsuQHZh/MwTFWm7pT9qEwB9QfIOFcU9Z6N0xdTWXtFX7kH0VuoK8UVvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMICWbQF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMICWbQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764702700; x=1796238700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRg6k1miLvlRa0Ijjp44vr7l/ByaFEauckDLvK5B8zw=;
  b=KMICWbQFEzw/GbMld9kgKKFSMiukph7yVmZaXG+fvr6XfdwHcz594afb
   6BRgxeggSgtSoZSTTh8KzvLzTK2drCJaAAwGc1sTh7WdNWN74WflrT7w7
   S4alsE7Zb6TQtMrcq9gkragbBph/4Bt+jDGldGa0IOsQrznoQUrbY8hIx
   NkSEOH82onWqFb95s9xGlYPZmyi4tiUHu4e6ZGglT0uOrBFyGOTJaB24u
   1f3CgNUq/wvIQpSZhh1p5Uyjib2A+FeiLA8YicDiSxb6O6Y4KIlysE/xS
   z61LC7wUIWsqVx14LcjkASgAMSw9jny9XE7Cjrb57SHVCYl7yOT48jttS
   g==;
X-CSE-ConnectionGUID: tJzO7ZUhT5G/STiqh6z9NQ==
X-CSE-MsgGUID: ziqaWKG6SdyADu1Gc/OFjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66575955"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66575955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 11:11:39 -0800
X-CSE-ConnectionGUID: wHFUo0ryRdCkGHYyD+/ptA==
X-CSE-MsgGUID: yKmxeCbYTsurYYlLXvlf9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194700932"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 11:11:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQVmi-000000002xR-0pKH;
	Tue, 02 Dec 2025 19:11:36 +0000
Date: Tue, 2 Dec 2025 20:10:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rgushchin:bpfoom.3.1 28/28] kernel/bpf/bpf_struct_ops.c:1211:21:
 error: incompatible pointer types passing 'struct bpf_struct_ops_link *' to
 parameter of type 'struct bpf_struct_st_link *'
Message-ID: <202512022023.eTYc5Xdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   dca9f586d5471222d105b51cf2ceb5eb91fdda01
commit: dca9f586d5471222d105b51cf2ceb5eb91fdda01 [28/28] tmp
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512022023.eTYc5Xdy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022023.eTYc5Xdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022023.eTYc5Xdy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_struct_ops.c:1205:32: warning: declaration of 'struct bpf_struct_st_link' will not be visible outside of this function [-Wvisibility]
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                ^
>> kernel/bpf/bpf_struct_ops.c:1211:21: error: incompatible pointer types passing 'struct bpf_struct_ops_link *' to parameter of type 'struct bpf_struct_st_link *' [-Werror,-Wincompatible-pointer-types]
    1211 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
   kernel/bpf/bpf_struct_ops.c:1205:52: note: passing argument to parameter 'st_link' here
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                                    ^
   1 warning and 1 error generated.


vim +1211 kernel/bpf/bpf_struct_ops.c

dca9f586d54712 Roman Gushchin 2025-12-01  1204  
dca9f586d54712 Roman Gushchin 2025-12-01 @1205  void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
dca9f586d54712 Roman Gushchin 2025-12-01  1206  void bpf_struct_ops_link_detach_cgroup(struct bpf_struct_ops_link *st_link,
dca9f586d54712 Roman Gushchin 2025-12-01  1207  				       bool cgroup_locked)
dca9f586d54712 Roman Gushchin 2025-12-01  1208  {
dca9f586d54712 Roman Gushchin 2025-12-01  1209  	bool unref = false;
dca9f586d54712 Roman Gushchin 2025-12-01  1210  
dca9f586d54712 Roman Gushchin 2025-12-01 @1211  	bpf_oom_clear_link(st_link);
dca9f586d54712 Roman Gushchin 2025-12-01  1212  
dca9f586d54712 Roman Gushchin 2025-12-01  1213  	if (!cgroup_locked)
dca9f586d54712 Roman Gushchin 2025-12-01  1214  		cgroup_lock();
dca9f586d54712 Roman Gushchin 2025-12-01  1215  
dca9f586d54712 Roman Gushchin 2025-12-01  1216  	if (!st_link->cgroup)
dca9f586d54712 Roman Gushchin 2025-12-01  1217  		goto unlock;
dca9f586d54712 Roman Gushchin 2025-12-01  1218  
dca9f586d54712 Roman Gushchin 2025-12-01  1219  	cgroup_put(st_link->cgroup);
dca9f586d54712 Roman Gushchin 2025-12-01  1220  	st_link->cgroup = NULL;
dca9f586d54712 Roman Gushchin 2025-12-01  1221  	WARN_ON(list_empty(&st_link->links_list));
dca9f586d54712 Roman Gushchin 2025-12-01  1222  	list_del_init(&st_link->links_list);
dca9f586d54712 Roman Gushchin 2025-12-01  1223  	unref = true;
dca9f586d54712 Roman Gushchin 2025-12-01  1224  
dca9f586d54712 Roman Gushchin 2025-12-01  1225  unlock:
dca9f586d54712 Roman Gushchin 2025-12-01  1226  	if (!cgroup_locked)
dca9f586d54712 Roman Gushchin 2025-12-01  1227  		cgroup_unlock();
dca9f586d54712 Roman Gushchin 2025-12-01  1228  
dca9f586d54712 Roman Gushchin 2025-12-01  1229  	if (unref)
dca9f586d54712 Roman Gushchin 2025-12-01  1230  		bpf_link_put(&st_link->link);
dca9f586d54712 Roman Gushchin 2025-12-01  1231  }
dca9f586d54712 Roman Gushchin 2025-12-01  1232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
