Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F434DB6D
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634564; cv=none; b=KZq+fRSrutGnfT8VMG4i8BGVDNY27lveKNV7SysUq9zN636B80RK2Ph3Vo0W/WHh6YLvuVy7N2lGtrYKg6ZASN1vJD+E4B0n9T0AWoqYNJF7XxW/sEJDRysdpjwFpafuKk6XlA8O99CRA40QupjIL8NLfzEU1e5jhoZ25beI/Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634564; c=relaxed/simple;
	bh=VWFoUEtCgbKDkhft198z52V0RCfs7kACzwRP9+HHb1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmNZ8/BgbEmJOmIAmbLq5XR2Y7XCRKZglUAgmk3uBTCpXcaX0TGuzVXgidh2TE30zR8dqhpJCoQlvwsLqbbuxOop07DIM1/j43rhV5eYmCJLUWLjzJtB8iCcvivR3WMH191HtR9SZHKm4IACymJBTSTG/IbLyyYYEI3J3RXCOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSv7IMxL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSv7IMxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787634562; x=1819170562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWFoUEtCgbKDkhft198z52V0RCfs7kACzwRP9+HHb1A=;
  b=QSv7IMxLIlOhAmNWsAxlRAl/ScB2tW/SkYZYJYObpya9yDFSZEhOySpK
   Ae88EL4X/4K9rNUdVkHyZAhLwa1koZPSWsdkVmcfZcn6dSBoJEuW+xim+
   lkS1GAzWdhhrvnbx5q5PCcr3mM1bcdHl/A/n0ZWt9+vhSgjgrMzW7//6Z
   sYm7aEuSaduWBgVnW/qRHBrU7A1ICStuGura9bAG1jeVmLigeCjjBDIYY
   t+iH21W1VXxFptL20KrOk2AdUtJsAIMV84LzgoQqAiQErlrCe+DAPq80k
   823xfg/J2HWSetwOqpzFjq1BDRSrzJlJCLphnK+9QdRdZaapf8hN9HRKU
   A==;
X-CSE-ConnectionGUID: AQoROlOdRlWFMW/rYE73/Q==
X-CSE-MsgGUID: uUSh/m4vTreC6rTD/3zqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88219904"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88219904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 22:09:21 -0700
X-CSE-ConnectionGUID: S2Bki7WnQR+cUKR0ZsTPeg==
X-CSE-MsgGUID: 4mzN0K4hTAuEIClfdGEffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="261049632"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2026 22:09:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyjPS-0000000050N-0cCt;
	Tue, 25 Aug 2026 05:09:18 +0000
Date: Tue, 25 Aug 2026 13:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] net: add missing ref_tracker_dir_exit() to
 net_passive_dec()
Message-ID: <202608251243.dC6F8tYQ-lkp@intel.com>
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
[also build test ERROR on linus/master horms-ipvs/master v7.2]
[cannot apply to net/main next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/net-add-missing-ref_tracker_dir_exit-to-net_passive_dec/20260816-212649
base:   net-next/main
patch link:    https://lore.kernel.org/r/af7dabf3-d0d7-46dc-a878-e1715b3c9ac6%40I-love.SAKURA.ne.jp
patch subject: [PATCH] net: add missing ref_tracker_dir_exit() to net_passive_dec()
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260825/202608251243.dC6F8tYQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251243.dC6F8tYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251243.dC6F8tYQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/net_namespace.c: In function 'net_passive_dec':
>> net/core/net_namespace.c:541:41: error: 'struct ref_tracker_dir' has no member named 'dead'
     541 |                 if (!net->refcnt_tracker.dead)
         |                                         ^


vim +541 net/core/net_namespace.c

0f6ede9fbc747e Eric Dumazet       2024-12-04  533  
e57a6320215c39 Kuniyuki Iwashima  2025-02-17  534  void net_passive_dec(struct net *net)
486a87f1e56240 Daniel Lezcano     2009-02-22  535  {
41467d2ff4dfe1 Yajun Deng         2021-08-17  536  	if (refcount_dec_and_test(&net->passive)) {
416c51e17b8b31 Eric Dumazet       2014-09-09  537  		kfree(rcu_access_pointer(net->gen));
0cafd77dcd032d Eric Dumazet       2022-10-20  538  
0cafd77dcd032d Eric Dumazet       2022-10-20  539  		/* There should not be any trackers left there. */
0cafd77dcd032d Eric Dumazet       2022-10-20  540  		ref_tracker_dir_exit(&net->notrefcnt_tracker);
08b1eada860370 Tetsuo Handa       2026-08-16 @541  		if (!net->refcnt_tracker.dead)
08b1eada860370 Tetsuo Handa       2026-08-16  542  			ref_tracker_dir_exit(&net->refcnt_tracker);
0cafd77dcd032d Eric Dumazet       2022-10-20  543  
0f6ede9fbc747e Eric Dumazet       2024-12-04  544  		/* Wait for an extra rcu_barrier() before final free. */
0f6ede9fbc747e Eric Dumazet       2024-12-04  545  		llist_add(&net->defer_free_list, &defer_free_list);
45a19b0a725a04 Johann Felix Soden 2007-11-07  546  	}
41467d2ff4dfe1 Yajun Deng         2021-08-17  547  }
45a19b0a725a04 Johann Felix Soden 2007-11-07  548  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
