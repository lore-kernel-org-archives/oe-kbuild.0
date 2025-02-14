Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4A11DB92A
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739569823; cv=none; b=Q81y8yEoxMvSVFQT/ff+0iTb34SnyFTw81VkcUnksZfs2ddsG9QDTX24tZ8b9Jx1G77QybD13qqeBdLCYR0ayztEIUq6AKLCm2mgQyR5Y8+DokvZcGwp/z2m955x9Ur8QBt5kuGKFi8TqwEppXLuxlM4V1TUrDTDs9ADFmQCVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739569823; c=relaxed/simple;
	bh=hbV544ZqJLBkuLtV7yfz9CHZrSgObQ6Yc7Oxl1Hs+fU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PqSdZVcH/Box0EknuaYv6kZEZRC6yNzzfnylUTsJmhOsPfet8w2WB3EljMEcCB48bmUmj7sKPKfsAERZLWfKmKYbV0jzWCqRJLD3WTXCf+fsLm2mYGUNygXsjEbzWReYo/wkdc+f+Z0+yEXfFsHhXuFk642Jq1PmRzPki1N6CUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GR/eZpid; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GR/eZpid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739569822; x=1771105822;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hbV544ZqJLBkuLtV7yfz9CHZrSgObQ6Yc7Oxl1Hs+fU=;
  b=GR/eZpidcxMPR2BLRc5YNm0Sua3/GWpQAhVbqE1wq4Q40LGma2AGd1Kn
   q6H7trFMmvnpogy/MnhJ8o7nBJElIhqCrXilqHWOYqETF+EemeKePqi3X
   ocFxF5Jc2Q5aPWCb0nit4BpJEMQC2BRHC/2iqoMlf0KtvCWAnsuy2q1vW
   9EGFn39c0Edh1ftu0R5XH6aX/opH2EWPFGyOJciTLbeVZ6SZSXrigyYP8
   NumqLzJibv147GqPfAQ/wJX5qydFJ0BBPxI+XpjrfMnZLs3cAKB/rP6OO
   jHro7D+M+F7XwiAK2E88MpjR2p6ELyHDq1jbOZe4MSt95xtV2PCbKMHpy
   Q==;
X-CSE-ConnectionGUID: 0BkjcC/2QCy8IYLmlqWb8g==
X-CSE-MsgGUID: e3W2X1qTQNm0vS80CtzBkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40191523"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40191523"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 13:50:22 -0800
X-CSE-ConnectionGUID: yeu71t20TzW1uig+gxdirw==
X-CSE-MsgGUID: YCYzxhGbTk+7ptJTzp7fRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="114193240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2025 13:50:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj3Zh-001ACL-0f;
	Fri, 14 Feb 2025 21:50:17 +0000
Date: Sat, 15 Feb 2025 05:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 14/26] net/xdp/xskmap.c:235
 xsk_map_delete_elem() error: uninitialized symbol 'old_xs'.
Message-ID: <202502150521.miO3yDbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: f7039fb7b3a9459a6c5ed166c267bdf294492c1b [14/26] rcu: Support Clang's capability analysis
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-r071-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150521.miO3yDbn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502150521.miO3yDbn-lkp@intel.com/

smatch warnings:
net/xdp/xskmap.c:235 xsk_map_delete_elem() error: uninitialized symbol 'old_xs'.

vim +/old_xs +235 net/xdp/xskmap.c

fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  221  
d7ba4cc900bf1e net/xdp/xskmap.c    JP Kobryn              2023-03-22  222  static long xsk_map_delete_elem(struct bpf_map *map, void *key)
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  223  {
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  224  	struct xsk_map *m = container_of(map, struct xsk_map, map);
782347b6bcad07 net/xdp/xskmap.c    Toke Høiland-Jørgensen 2021-06-24  225  	struct xdp_sock __rcu **map_entry;
782347b6bcad07 net/xdp/xskmap.c    Toke Høiland-Jørgensen 2021-06-24  226  	struct xdp_sock *old_xs;
32cd3db7de97c0 net/xdp/xskmap.c    Maciej Fijalkowski     2024-11-22  227  	u32 k = *(u32 *)key;
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  228  
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  229  	if (k >= map->max_entries)
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  230  		return -EINVAL;
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  231  
0402acd683c678 kernel/bpf/xskmap.c Björn Töpel            2019-08-15  232  	spin_lock_bh(&m->lock);
0402acd683c678 kernel/bpf/xskmap.c Björn Töpel            2019-08-15  233  	map_entry = &m->xsk_map[k];
782347b6bcad07 net/xdp/xskmap.c    Toke Høiland-Jørgensen 2021-06-24  234  	old_xs = unrcu_pointer(xchg(map_entry, NULL));
cee271678d0e31 kernel/bpf/xskmap.c Björn Töpel            2018-10-08 @235  	if (old_xs)
0402acd683c678 kernel/bpf/xskmap.c Björn Töpel            2019-08-15  236  		xsk_map_sock_delete(old_xs, map_entry);
0402acd683c678 kernel/bpf/xskmap.c Björn Töpel            2019-08-15  237  	spin_unlock_bh(&m->lock);
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  238  
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  239  	return 0;
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  240  }
fbfc504a24f53f kernel/bpf/xskmap.c Björn Töpel            2018-05-02  241  

:::::: The code at line 235 was first introduced by commit
:::::: cee271678d0e3177a25d0fcb2fa5e051d48e4262 xsk: do not call synchronize_net() under RCU read lock

:::::: TO: Björn Töpel <bjorn.topel@intel.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
