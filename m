Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A4217916
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731017798; cv=none; b=k4xYy4YArn31ZLNGZZeTfYcVz694xAKi49vcKt1/OgXwbwOgFRBCst5tcAXz6lhZv4P4inubG51ecgOHx2v2VFt4TgbwySyrLzUq8Ul/+xOZFw9i/HqSPV5P8mj/Cl1UHeimhwhQe4vQfgdabcaWHIYWf6JKbe0fN3C3xWUTjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731017798; c=relaxed/simple;
	bh=Z7yDgO56meFY6ItfX7aKY3sayE9xjnEVYDdyTtcTu+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BheJ7fdb3DPS0iLYyRYJpfek4jUfTD3gTIeTBwmWuR9mATmSZi8cXHmGMQzWcuJd9JOqmvrXbxOmcrJYtEKG5chQARDd6FMMK93cOYUiEVhfIFxmOSIFPol+y1UiwrjpjPYhBSkThJDcXdZUHE32+Wn9a7NIyTUQM533hqixPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsXTI6hS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsXTI6hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731017797; x=1762553797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7yDgO56meFY6ItfX7aKY3sayE9xjnEVYDdyTtcTu+4=;
  b=QsXTI6hS+1Pyh/k70f7FIk8vc4y5PUustlP+kcT9DrFRvGDPwwD9xe2B
   ypdJDVKGK3M7YEPSuiyGMVYkF16gK1hoqkYcFvC3U5myetZMWNo8gNzhu
   zJjwbsJJs5bNy5r1kp7dhYbjQkDngVIGDYOoaWQSNsy71jbybVSz/eNn9
   A5II+K6y1jZBEeTv9+mGHHA4IZqZ8DsVV1pzV5+lJO/7eYv2vVGhB8Abh
   khtoPyAPhD9oA7CHt3li9la8PlCMzAfoly/AcQh3I1JhM+7tZeITwIPe+
   1wo66hXdWQaSTxdkDklfrKLoECTmMHeVSZIBAjHex799RUK+G6OZT03KZ
   w==;
X-CSE-ConnectionGUID: 4SlVvJuBST6CXHKdCtTqrA==
X-CSE-MsgGUID: PBTkbeeTT4yE5oEBcf11lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41506917"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="41506917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 14:16:34 -0800
X-CSE-ConnectionGUID: Wja8pnPaQLavsCLk/3WiEA==
X-CSE-MsgGUID: juNXBiuxQg2bMeD7tiOcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89204497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 14:16:33 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Ann-000qii-09;
	Thu, 07 Nov 2024 22:16:31 +0000
Date: Fri, 8 Nov 2024 06:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH V10 12/12] ublk: support leasing io buffer to io_uring
Message-ID: <202411080639.shF21Vmc-lkp@intel.com>
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
In-Reply-To: <20241107110149.890530-13-ming.lei@redhat.com>
References: <20241107110149.890530-13-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: linux-block@vger.kernel.org
CC: Uday Shankar <ushankar@purestorage.com>
CC: Akilesh Kailash <akailash@google.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20241107]
[cannot apply to linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-rsrc-pass-struct-io_ring_ctx-reference-to-rsrc-helpers/20241107-190456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241107110149.890530-13-ming.lei%40redhat.com
patch subject: [PATCH V10 12/12] ublk: support leasing io buffer to io_uring
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-r063-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080639.shF21Vmc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411080639.shF21Vmc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:88:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +88 drivers/block/ublk_drv.c

79e9f68a5502d0 Ming Lei 2024-11-07  81  
0edb3696c1713c Ming Lei 2022-07-13  82  struct ublk_rq_data {
3ab6e94ca53924 Ming Lei 2022-10-29  83  	struct llist_node node;
8284066946e6d9 Ming Lei 2023-05-19  84  
8284066946e6d9 Ming Lei 2023-05-19  85  	struct kref ref;
79e9f68a5502d0 Ming Lei 2024-11-07  86  
79e9f68a5502d0 Ming Lei 2024-11-07  87  	bool allocated_bvec;
79e9f68a5502d0 Ming Lei 2024-11-07 @88  	struct uring_kbuf buf[0];
0edb3696c1713c Ming Lei 2022-07-13  89  };
0edb3696c1713c Ming Lei 2022-07-13  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
