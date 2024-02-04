Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD51D10FF
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707016125; cv=none; b=WljPk/Ep3Ym6NQVMNydDt8xjIhlgR6S6Nl+zGmGbWXZmRsQsB8uv9kas/Ah38fdSvWPl9BD+8uL4aWNT7P5rQ4sXG6xcULmtBSK3U3dNpA16LWAE1v1c/mxYddIWafU/hit7qNv6zcuxIfNO8u/+M4MvzS13QlJN6qVPZORcEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707016125; c=relaxed/simple;
	bh=LGvFIT8B4bNdemFKY16q9TSKdOosWDqlUXpOC20KZgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ItsnV25qfBVfQEsrgzIoTKRZICwFeRhFKRA9BdT7b6cB8Q06w3elKK3Zl9K8VHuV26K0OnmXM4PFWv78ZPoT/HoiMo8rnf0dNt1VvLcPPBPabIERibpz+36+TySAOCHv3X70Ev8CS3ceZPFGjzuBXgqJ0bAhkWvQ+wOSdpeRzvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAifE3qB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAifE3qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707016123; x=1738552123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGvFIT8B4bNdemFKY16q9TSKdOosWDqlUXpOC20KZgo=;
  b=YAifE3qB1CfP43GyFEReiHSRW1mr8atBpMVbnMMLDlS3kqHnMfdYlrjy
   /Sk+AVlMMAL7x/zZuK+mQffQBRDkgGAMQvACq6W4GwavGd6XjGeDe/35j
   Q5GASOzdl6kNAgHkeGu4qMDuZ6JAXu3hhXZ6+m4N/Qt8dgL2yLwuB9Hi3
   3BeVntGbJFvNxA30QJDVnUimwOxXzXHk91vj/6W+E5zwGdnxPJuJIZS5a
   uZMgJIZzvdpOfmisYNnAdMTDQslZSVDNLIKMzCQdbO2G/6khyMV7eVGKV
   WovnbqHyyMC75OUZOBpZV83WF4sQLs+g8bKAO4XwvToJt2MVBc54FNPoi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="518485"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="518485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 19:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="23679479"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2024 19:08:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWSs1-0005wK-09;
	Sun, 04 Feb 2024 03:08:37 +0000
Date: Sun, 4 Feb 2024 11:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 net-next 07/16] af_unix: Detect Strongly Connected
 Components.
Message-ID: <202402041057.5d2Ok6Ck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/unix/garbage.c:257:9: sparse: sparse: statement expected after label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240203030058.60750-8-kuniyu@amazon.com>
References: <20240203030058.60750-8-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/af_unix-Add-struct-unix_vertex-in-struct-unix_sock/20240203-110847
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240203030058.60750-8-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 07/16] af_unix: Detect Strongly Connected Components.
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-121-20240203 (https://download.01.org/0day-ci/archive/20240204/202402041057.5d2Ok6Ck-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041057.5d2Ok6Ck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402041057.5d2Ok6Ck-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/unix/garbage.c:257:9: sparse: sparse: statement expected after label
   net/unix/garbage.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +257 net/unix/garbage.c

9606332e33dd2a Kuniyuki Iwashima 2024-02-02  227  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  228  static void __unix_walk_scc(struct unix_vertex *vertex)
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  229  {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  230  	unsigned long index = UNIX_VERTEX_INDEX_START;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  231  	LIST_HEAD(vertex_stack);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  232  	struct unix_edge *edge;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  233  	LIST_HEAD(edge_stack);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  234  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  235  next_vertex:
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  236  	vertex->index = index;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  237  	vertex->lowlink = index;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  238  	index++;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  239  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  240  	vertex->on_stack = true;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  241  	list_move(&vertex->scc_entry, &vertex_stack);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  242  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  243  	list_for_each_entry(edge, &vertex->edges, entry) {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  244  		if (!edge->successor->out_degree)
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  245  			continue;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  246  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  247  		if (edge->successor->index == UNIX_VERTEX_INDEX_UNVISITED) {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  248  			list_add(&edge->stack_entry, &edge_stack);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  249  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  250  			vertex = edge->successor;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  251  			goto next_vertex;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  252  		}
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  253  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  254  		if (edge->successor->on_stack)
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  255  			vertex->lowlink = min(vertex->lowlink, edge->successor->index);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  256  next_edge:
9606332e33dd2a Kuniyuki Iwashima 2024-02-02 @257  	}
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  258  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  259  	if (vertex->index == vertex->lowlink) {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  260  		LIST_HEAD(scc);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  261  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  262  		list_cut_position(&scc, &vertex_stack, &vertex->scc_entry);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  263  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  264  		list_for_each_entry_reverse(vertex, &scc, scc_entry) {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  265  			list_move_tail(&vertex->entry, &unix_visited_vertices);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  266  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  267  			vertex->on_stack = false;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  268  		}
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  269  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  270  		list_del(&scc);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  271  	}
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  272  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  273  	if (!list_empty(&edge_stack)) {
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  274  		edge = list_first_entry(&edge_stack, typeof(*edge), stack_entry);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  275  		list_del_init(&edge->stack_entry);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  276  
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  277  		vertex = edge->predecessor;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  278  		vertex->lowlink = min(vertex->lowlink, edge->successor->lowlink);
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  279  		goto next_edge;
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  280  	}
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  281  }
9606332e33dd2a Kuniyuki Iwashima 2024-02-02  282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
