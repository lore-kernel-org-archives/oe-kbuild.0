Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF53B19A3
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638778; cv=none; b=YOPyM7fcrz2RvKviUb149YDJCGDfOMMdwvm95RhP5Eky/SYMaBSLRAa7hi6n9Jyra8IovBO/TfsDFtb2qCqEhMURvqD1DUxjgNxYh9afzUtoI3zK0MMq3KLh22ujiyr84nbAuwB0OC/lkDycMTCBMKKlPpxCqs5hYC2g7tYZbm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638778; c=relaxed/simple;
	bh=uyqIhAE6XIajCDsbjZ+rofrHcz61bkI0Tucu/s+7SyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F66PXibzuQJOD9DDWbrIvh4GmLoH0SwIi8DqTiqdED/Zb3Ax2Sp/VvoTEEpDEXvDjdyRiEX0qBoyFn6j9TrxvVvU1cFichAMrHtY/HAoqKxfQs98vEXT2jGftdSHG912/IcvetukjQrG4s4ReTngIMqDRIifFjFMPeHNRTuRBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLSMpizH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLSMpizH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787638775; x=1819174775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyqIhAE6XIajCDsbjZ+rofrHcz61bkI0Tucu/s+7SyM=;
  b=CLSMpizHwUaXVBy2yvelT6ErYJCejxjo+uoxn4qj8FAbRfeAJejQKNNV
   1SpB+6xX0BaVu93YSUhC0JL6bw4auq0gJzLe2N4dKEiqvp7qQbdxRW8E5
   AYS2dTwAiPPoCPQ36H3HwnQq4m5xMU60/9cnKhWSjNuJFjUbXXTDhX02r
   VRQDQlgUwXkFowaGe7/BOU6ndAPCjFDejQioPs5KJSX88Jz5M6as+8Cke
   mAK9IpjpqoyEyFggLgpam5AkUcaHzfPKpb2z7xhF2keGcEcUP0oPcdDZ9
   292V78pG19P6WXp8s/z3zEFZ70EGZAu9G6T0cmhmgpI0IxcHmucAPM6oe
   w==;
X-CSE-ConnectionGUID: aBPcHxVyRgKc5rDMS1328A==
X-CSE-MsgGUID: wBWZqWgrSciwJ1roFRKoPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98772369"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98772369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 23:19:35 -0700
X-CSE-ConnectionGUID: dWJ1QaNqQHmo+FlnjNFLKw==
X-CSE-MsgGUID: wveWy1EwTjS/zMFBcXotmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="305433942"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2026 23:19:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wykVQ-0000000056t-05g7;
	Tue, 25 Aug 2026 06:19:32 +0000
Date: Tue, 25 Aug 2026 14:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] net: add missing ref_tracker_dir_exit() to
 net_passive_dec()
Message-ID: <202608251419.KDzuLP1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <af7dabf3-d0d7-46dc-a878-e1715b3c9ac6@I-love.SAKURA.ne.jp>
References: <af7dabf3-d0d7-46dc-a878-e1715b3c9ac6@I-love.SAKURA.ne.jp>
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Network Development <netdev@vger.kernel.org>

Hi Tetsuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on linus/master v7.2]
[cannot apply to net/main next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/net-add-missing-ref_tracker_dir_exit-to-net_passive_dec/20260816-212649
base:   net-next/main
patch link:    https://lore.kernel.org/r/af7dabf3-d0d7-46dc-a878-e1715b3c9ac6%40I-love.SAKURA.ne.jp
patch subject: [PATCH] net: add missing ref_tracker_dir_exit() to net_passive_dec()
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260825/202608251419.KDzuLP1i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 771bdfdab2d66a4eb85b8ea7673cfa30152718b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251419.KDzuLP1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251419.KDzuLP1i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/net_namespace.c:541:28: error: no member named 'dead' in 'struct ref_tracker_dir'
     541 |                 if (!net->refcnt_tracker.dead)
         |                      ~~~~~~~~~~~~~~~~~~~ ^
   net/core/net_namespace.c:52:13: warning: variable 'init_net_initialized' set but not used [-Wunused-but-set-global]
      52 | static bool init_net_initialized;
         |             ^
   1 warning and 1 error generated.


vim +541 net/core/net_namespace.c

0f6ede9fbc747e2 Eric Dumazet       2024-12-04  533  
e57a6320215c396 Kuniyuki Iwashima  2025-02-17  534  void net_passive_dec(struct net *net)
486a87f1e562409 Daniel Lezcano     2009-02-22  535  {
41467d2ff4dfe18 Yajun Deng         2021-08-17  536  	if (refcount_dec_and_test(&net->passive)) {
416c51e17b8b31b Eric Dumazet       2014-09-09  537  		kfree(rcu_access_pointer(net->gen));
0cafd77dcd032d1 Eric Dumazet       2022-10-20  538  
0cafd77dcd032d1 Eric Dumazet       2022-10-20  539  		/* There should not be any trackers left there. */
0cafd77dcd032d1 Eric Dumazet       2022-10-20  540  		ref_tracker_dir_exit(&net->notrefcnt_tracker);
08b1eada8603705 Tetsuo Handa       2026-08-16 @541  		if (!net->refcnt_tracker.dead)
08b1eada8603705 Tetsuo Handa       2026-08-16  542  			ref_tracker_dir_exit(&net->refcnt_tracker);
0cafd77dcd032d1 Eric Dumazet       2022-10-20  543  
0f6ede9fbc747e2 Eric Dumazet       2024-12-04  544  		/* Wait for an extra rcu_barrier() before final free. */
0f6ede9fbc747e2 Eric Dumazet       2024-12-04  545  		llist_add(&net->defer_free_list, &defer_free_list);
45a19b0a725a04f Johann Felix Soden 2007-11-07  546  	}
41467d2ff4dfe18 Yajun Deng         2021-08-17  547  }
45a19b0a725a04f Johann Felix Soden 2007-11-07  548  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
