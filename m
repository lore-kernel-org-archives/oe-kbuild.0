Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765272036E9
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148303; cv=none; b=MaCxLonBjfjQeAGJ1Ws7neValDM/ySsqAI1KCfl1eYq8KZ6TOpfojS7G0JFjGuiMSrmNMAr4JpcDZ8uOtPv/d5MlDM9e+Un5L0Joda2bVHJcW+ZUwQhu0rbIxXflQzJx2SUf7nyTPIvK2gVWcY7GGgMzdSStuVXsCj4JXWftt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148303; c=relaxed/simple;
	bh=64tjZNPVom2BBGXFM4yAGfCNfndjxbGyaE3zPl4N5JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Owsrdf6bY+C5VDc7WlIqk/cdn5oOPN2AfLrKvC6jHepOZPChZH5Qv+AyLvKNCvkWkrwxpQFLPZJQrEHSa85IkTW4NR20CjlofaeEFFQPtmZsXfC8PblHzSWgFh4tihS2UBmWxMn8jSlfWkpdGmiiLl/tZEFq0jIhENrHgQG8xP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF7XVRTD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF7XVRTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733148301; x=1764684301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64tjZNPVom2BBGXFM4yAGfCNfndjxbGyaE3zPl4N5JM=;
  b=GF7XVRTDJb+GkrQ7U1Jj4rm8QZ3TIzrFtoBBvxstdyPMnMw5Uny3vyNR
   AM3VFIxpaZO1pafepOWLMEl1XpyZrST8u5huyGbeVY+kZiXBBwOaLYtBa
   VF7nY/d/s3BU1sRLaGeKFYEul3oJjEhUYSTt/gzTsnlBhQ9cQ94lLeYxD
   ttCNnRAOX79YN/1KYOYCrk7Dg7uUyIzwPPhOwuHPSH+EyeUPtZFMv2Yhm
   EugMXzse/GtPms3W2f/cZpCrn6zSWWUye1mzLzVeQkP0rfBgm+tkAhajc
   IMFgmZTpd9gZ+BQ6JnqD4sfE4UbTKDflYNsIQfkQIkfVi9dKzN4A4usNm
   w==;
X-CSE-ConnectionGUID: 5ETtRc+jSnaHcNzkGsMSsg==
X-CSE-MsgGUID: LK5IF4gcRhWzBbbX7eGPyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43986716"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="43986716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:03:13 -0800
X-CSE-ConnectionGUID: TQPMdQJxR7+vjsUzUIow3w==
X-CSE-MsgGUID: Mi54kmKSTV6GUcdp9zj/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="123958729"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 06:03:12 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI713-0002TD-2r;
	Mon, 02 Dec 2024 14:03:09 +0000
Date: Mon, 2 Dec 2024 22:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/core/gro.c:38:25-29: ERROR: invalid reference to the index
 variable of the iterator on line 34
Message-ID: <202412022106.v6cskfGx-lkp@intel.com>
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
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 75082e7f46809432131749f4ecea66864d0f7438 net: add missing include in include/net/gro.h
date:   3 years, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 years, 1 month ago
config: csky-randconfig-r052-20241113 (https://download.01.org/0day-ci/archive/20241202/202412022106.v6cskfGx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412022106.v6cskfGx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/core/gro.c:38:25-29: ERROR: invalid reference to the index variable of the iterator on line 34

vim +38 net/core/gro.c

587652bbdd06ab3 Eric Dumazet 2021-11-15  16  
587652bbdd06ab3 Eric Dumazet 2021-11-15  17  /**
587652bbdd06ab3 Eric Dumazet 2021-11-15  18   *	dev_add_offload - register offload handlers
587652bbdd06ab3 Eric Dumazet 2021-11-15  19   *	@po: protocol offload declaration
587652bbdd06ab3 Eric Dumazet 2021-11-15  20   *
587652bbdd06ab3 Eric Dumazet 2021-11-15  21   *	Add protocol offload handlers to the networking stack. The passed
587652bbdd06ab3 Eric Dumazet 2021-11-15  22   *	&proto_offload is linked into kernel lists and may not be freed until
587652bbdd06ab3 Eric Dumazet 2021-11-15  23   *	it has been removed from the kernel lists.
587652bbdd06ab3 Eric Dumazet 2021-11-15  24   *
587652bbdd06ab3 Eric Dumazet 2021-11-15  25   *	This call does not sleep therefore it can not
587652bbdd06ab3 Eric Dumazet 2021-11-15  26   *	guarantee all CPU's that are in middle of receiving packets
587652bbdd06ab3 Eric Dumazet 2021-11-15  27   *	will see the new offload handlers (until the next received packet).
587652bbdd06ab3 Eric Dumazet 2021-11-15  28   */
587652bbdd06ab3 Eric Dumazet 2021-11-15  29  void dev_add_offload(struct packet_offload *po)
587652bbdd06ab3 Eric Dumazet 2021-11-15  30  {
587652bbdd06ab3 Eric Dumazet 2021-11-15  31  	struct packet_offload *elem;
587652bbdd06ab3 Eric Dumazet 2021-11-15  32  
587652bbdd06ab3 Eric Dumazet 2021-11-15  33  	spin_lock(&offload_lock);
587652bbdd06ab3 Eric Dumazet 2021-11-15 @34  	list_for_each_entry(elem, &offload_base, list) {
587652bbdd06ab3 Eric Dumazet 2021-11-15  35  		if (po->priority < elem->priority)
587652bbdd06ab3 Eric Dumazet 2021-11-15  36  			break;
587652bbdd06ab3 Eric Dumazet 2021-11-15  37  	}
587652bbdd06ab3 Eric Dumazet 2021-11-15 @38  	list_add_rcu(&po->list, elem->list.prev);
587652bbdd06ab3 Eric Dumazet 2021-11-15  39  	spin_unlock(&offload_lock);
587652bbdd06ab3 Eric Dumazet 2021-11-15  40  }
587652bbdd06ab3 Eric Dumazet 2021-11-15  41  EXPORT_SYMBOL(dev_add_offload);
587652bbdd06ab3 Eric Dumazet 2021-11-15  42  

:::::: The code at line 38 was first introduced by commit
:::::: 587652bbdd06ab38a4c1b85e40f933d2cf4a1147 net: gro: populate net/core/gro.c

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
