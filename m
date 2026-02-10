Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781142AEE4
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682867; cv=none; b=sIJuWZq9FTPzvW7ZvTstQSeIWWuptb7RdIL2DTdTkhGMdN8nQtyG02bfBoVYkrlaLvP0RyEbMm9EU1uJwc9QRn682FHX+6GNponZiWDdf7Id3GTtz5g3mNgT68sbFoU0Za9YtstSo69v0IGucTPOel9rKRezBuMLCjkUEpDM6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682867; c=relaxed/simple;
	bh=oGw+2r/4y0M1qOiHLi5JYDP5YgQDefyucv4ocyiU540=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gFwCL3NVuxejLfRsYS9DEEfl9Po+4aKXZt5p40I/DKlp+jQXsQ+d32UsGLTz6cgRaRQjSpBbP4+xuIe7qpLgpNX93bgl33AAf9mpLgjqzni7oBgy/m0b1f4wGYuuP084Y1YdUSi+rkIIYAKvSo7O852UpplW4JQqj8yIwLd8F0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJFOOFMu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJFOOFMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770682866; x=1802218866;
  h=date:from:to:cc:subject:message-id;
  bh=oGw+2r/4y0M1qOiHLi5JYDP5YgQDefyucv4ocyiU540=;
  b=RJFOOFMuymnmn0P//+wtBDJf9LBOw1s2+ic9noxpLMc6CjourCSfs5oi
   L4SF168dEp+DM0Nf2QgwdWo4JAlq51woc+jDZ0bq7ZgcyM01K2hI8pU56
   OyX2fGaDgsOElPPF6TET1TfX5LWnm+eZWNS4iKBiCmNDt4JUKKHx8pABE
   xgVhst2Iue8iuHJvXwiyxa3gwK8ly/tRtkHfyr9+OXiTt89k8JCq9G2rZ
   XzMih/J16sT23aG3+zlytNzrpYOaQ/dGGhfVB2MC9Ndqlgjed3fk5GV7Z
   69ft18yc/divQpxDAVklDPgoyc6+tttb5dnn+nqLPuyM+Jy0zO6ZBfczG
   A==;
X-CSE-ConnectionGUID: IhEFlBZjTyWj1OPO4lBxpQ==
X-CSE-MsgGUID: 3rFekHV2SWmHq3DMWM9LNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82910548"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82910548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:21:06 -0800
X-CSE-ConnectionGUID: LQh9Qg2XSVu5PAHRsC+QXg==
X-CSE-MsgGUID: pDfvVHT/TwOVsRIkvPAM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211055424"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 16:21:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbV0-00000000oRc-2P7h;
	Tue, 10 Feb 2026 00:21:02 +0000
Date: Tue, 10 Feb 2026 08:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 464/799]
 fs/bcachefs/journal/journal.c:910:20-21: WARNING opportunity for min()
Message-ID: <202602100826.bZuj5OlI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 3d1f4469e2743eb10d5450c26d37cac439a002f1 [464/799] bcachefs: move journal code to subdir
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100826.bZuj5OlI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602100826.bZuj5OlI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/journal.c:910:20-21: WARNING opportunity for min()

vim +910 fs/bcachefs/journal/journal.c

1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  891  
3956ff8bc2f39a7 fs/bcachefs/journal.c Kent Overstreet 2024-10-19  892  int bch2_journal_flush_seq(struct journal *j, u64 seq, unsigned task_state)
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  893  {
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  894  	u64 start_time = local_clock();
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  895  	int ret, ret2;
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  896  
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  897  	/*
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  898  	 * Don't update time_stats when @seq is already flushed:
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  899  	 */
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  900  	if (seq <= j->flushed_seq_ondisk)
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  901  		return 0;
991ba0211290884 fs/bcachefs/journal.c Kent Overstreet 2021-12-10  902  
3956ff8bc2f39a7 fs/bcachefs/journal.c Kent Overstreet 2024-10-19  903  	ret = wait_event_state(j->wait,
3956ff8bc2f39a7 fs/bcachefs/journal.c Kent Overstreet 2024-10-19  904  			       (ret2 = bch2_journal_flush_seq_async(j, seq, NULL)),
3956ff8bc2f39a7 fs/bcachefs/journal.c Kent Overstreet 2024-10-19  905  			       task_state);
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  906  
6a16ad951ae4cb0 fs/bcachefs/journal.c Kent Overstreet 2021-02-09  907  	if (!ret)
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  908  		bch2_time_stats_update(j->flush_seq_time, start_time);
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  909  
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16 @910  	return ret ?: ret2 < 0 ? ret2 : 0;
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  911  }
1c6fdbd8f2465dd fs/bcachefs/journal.c Kent Overstreet 2017-03-16  912  

:::::: The code at line 910 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
