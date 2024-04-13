Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABDD1361
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Apr 2024 00:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712968621; cv=none; b=ZdVXacOOYjMTb0v+yOWA8aatV0n/6n7LPQGhORYZvVlteHNXsHxoPKlblmkHtXiUk/LKsgoKg3S3kDBpCCpqaBagY3Iaj70fGavt6Keho+rvSyOnN9eHp5oDGmB0jZ5+ADIp9j88e0/s9ytOEkpvvvBJHOOuq8x508tmwnwP358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712968621; c=relaxed/simple;
	bh=Eled8F+xfdqnRxqjvVYjfs42CCP7cECtb65anOyiFg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naMjqpYAQGuSg9VH2zmcqlgOPW9lNZuMWJaHJdQ+Ux+jURJRL9sQzUTGZE9lCNNfEBwT4xzjDEI5+eqD9AF+Lgt4My351nPIuXWMwVWMHM5r3MR1YDlDjaN4sF0I6Arw+ycLwBxDjnwHzYZQ/kiB1iv4Dx/Yv+aGmAnM95o+WpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffusKhyW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffusKhyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712968618; x=1744504618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eled8F+xfdqnRxqjvVYjfs42CCP7cECtb65anOyiFg4=;
  b=ffusKhyWxxkvhE3hShFwzITWoeHAb8RUB4iNTX1qEJa02xIC2E/algOz
   RIVIoVEPBBVZSqNZU4/sdLelCLrBynyBz4HAVzCF35V/S6OBHe6vkZ+94
   Htcbjg18EAJ6KsiblGYwANd42TjRcJXD7UtNIoLfDeCYMDfro75Pq+biT
   THF3Szy5j2gjICXA+55cPNH7k8bqN8haJ2ciCw31hQIq1CG8L8pWgfThG
   fnb7ygyyo9ZeXBOw6q3XJJYazGkaUAYdNUSpUTbvFFhNNuTr05ZN7GH/v
   mMl3XJIYwqHpksgcCufXN8+YFt7hVnfvcJ9audZyRemrJa5aH7zzNsX4x
   w==;
X-CSE-ConnectionGUID: E46A0vpTSDyMSgTwvpB0UA==
X-CSE-MsgGUID: tDBh+DCdT0+HtD38m7Hj1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25958892"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="25958892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 17:36:58 -0700
X-CSE-ConnectionGUID: X4pv028aSI2wnPiI+POaRA==
X-CSE-MsgGUID: 27FTtRCTSseYAmg24uVK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21470824"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2024 17:36:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvRNr-00014S-0f;
	Sat, 13 Apr 2024 00:36:45 +0000
Date: Sat, 13 Apr 2024 08:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH ipsec-next 3/3] xfrm: Add an inbound percpu state cache.
Message-ID: <202404130802.rDxN3ijD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240412060553.3483630-4-steffen.klassert@secunet.com>
References: <20240412060553.3483630-4-steffen.klassert@secunet.com>
TO: Steffen Klassert <steffen.klassert@secunet.com>
TO: netdev@vger.kernel.org
TO: devel@linux-ipsec.org
TO: Paul Wouters <paul@nohats.ca>
TO: Antony Antony <antony.antony@secunet.com>
TO: Tobias Brunner <tobias@strongswan.org>
TO: Daniel Xu <dxu@dxuuu.xyz>
CC: Steffen Klassert <steffen.klassert@secunet.com>

Hi Steffen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master net/main net-next/main linus/master v6.9-rc3 next-20240412]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Klassert/xfrm-Add-support-for-per-cpu-xfrm-state-handling/20240412-140746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20240412060553.3483630-4-steffen.klassert%40secunet.com
patch subject: [PATCH ipsec-next 3/3] xfrm: Add an inbound percpu state cache.
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-061-20240413 (https://download.01.org/0day-ci/archive/20240413/202404130802.rDxN3ijD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130802.rDxN3ijD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404130802.rDxN3ijD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/altera/altera_tse_ethtool.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]
>> include/net/netns/xfrm.h:46:39: sparse: sparse: multiple address spaces given: __rcu & __percpu
--
   drivers/net/ethernet/altera/altera_msgdma.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h):
>> include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]
>> include/net/netns/xfrm.h:46:39: sparse: sparse: multiple address spaces given: __rcu & __percpu
--
   drivers/net/ethernet/altera/altera_utils.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/if_vlan.h, ...):
>> include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]
>> include/net/netns/xfrm.h:46:39: sparse: sparse: multiple address spaces given: __rcu & __percpu
--
   drivers/net/ethernet/altera/altera_sgdma.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/if_vlan.h, ...):
>> include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]
>> include/net/netns/xfrm.h:46:39: sparse: sparse: multiple address spaces given: __rcu & __percpu
--
   drivers/net/ethernet/altera/altera_tse_main.c: note: in included file (through include/net/net_namespace.h, include/linux/netdevice.h, include/linux/etherdevice.h):
>> include/net/netns/xfrm.h:46:39: sparse: sparse: duplicate [noderef]
>> include/net/netns/xfrm.h:46:39: sparse: sparse: multiple address spaces given: __rcu & __percpu

vim +46 include/net/netns/xfrm.h

880a6fab8f6ba5b Christophe Gouault 2014-08-29  31  
d62ddc21b674b5a Alexey Dobriyan    2008-11-25  32  struct netns_xfrm {
9d4139c76905833 Alexey Dobriyan    2008-11-25  33  	struct list_head	state_all;
73d189dce486cd6 Alexey Dobriyan    2008-11-25  34  	/*
73d189dce486cd6 Alexey Dobriyan    2008-11-25  35  	 * Hash table to find appropriate SA towards given target (endpoint of
73d189dce486cd6 Alexey Dobriyan    2008-11-25  36  	 * tunnel or destination of transport mode) allowed by selector.
73d189dce486cd6 Alexey Dobriyan    2008-11-25  37  	 *
73d189dce486cd6 Alexey Dobriyan    2008-11-25  38  	 * Main use is finding SA after policy selected tunnel or transport
73d189dce486cd6 Alexey Dobriyan    2008-11-25  39  	 * mode. Also, it can be used by ah/esp icmp error handler to find
73d189dce486cd6 Alexey Dobriyan    2008-11-25  40  	 * offending SA.
73d189dce486cd6 Alexey Dobriyan    2008-11-25  41  	 */
d737a5805581c6f Florian Westphal   2016-08-09  42  	struct hlist_head	__rcu *state_bydst;
d737a5805581c6f Florian Westphal   2016-08-09  43  	struct hlist_head	__rcu *state_bysrc;
d737a5805581c6f Florian Westphal   2016-08-09  44  	struct hlist_head	__rcu *state_byspi;
fe9f1d8779cb470 Sabrina Dubroca    2021-04-25  45  	struct hlist_head	__rcu *state_byseq;
042bf7320e286f6 Steffen Klassert   2024-04-12 @46  	struct hlist_head	__rcu __percpu *state_cache_input;
529983ecabeae3d Alexey Dobriyan    2008-11-25  47  	unsigned int		state_hmask;
0bf7c5b019518d3 Alexey Dobriyan    2008-11-25  48  	unsigned int		state_num;
630827338585022 Alexey Dobriyan    2008-11-25  49  	struct work_struct	state_hash_work;
50a30657fd7ee77 Alexey Dobriyan    2008-11-25  50  
adfcf0b27e87d16 Alexey Dobriyan    2008-11-25  51  	struct list_head	policy_all;
93b851c1c93c7d5 Alexey Dobriyan    2008-11-25  52  	struct hlist_head	*policy_byidx;
8100bea7d619e84 Alexey Dobriyan    2008-11-25  53  	unsigned int		policy_idx_hmask;
3e4bc23926b83c3 Eric Dumazet       2023-09-08  54  	unsigned int		idx_generator;
53c2e285f970300 Herbert Xu         2014-11-13  55  	struct hlist_head	policy_inexact[XFRM_POLICY_MAX];
53c2e285f970300 Herbert Xu         2014-11-13  56  	struct xfrm_policy_hash	policy_bydst[XFRM_POLICY_MAX];
dc2caba7b321289 Alexey Dobriyan    2008-11-25  57  	unsigned int		policy_count[XFRM_POLICY_MAX * 2];
66caf628c3b634c Alexey Dobriyan    2008-11-25  58  	struct work_struct	policy_hash_work;
880a6fab8f6ba5b Christophe Gouault 2014-08-29  59  	struct xfrm_policy_hthresh policy_hthresh;
24969facd704a5f Florian Westphal   2018-11-07  60  	struct list_head	inexact_bins;
a6483b790f8efcd Alexey Dobriyan    2008-11-25  61  
d7c7544c3d5f590 Alexey Dobriyan    2010-01-24  62  
a6483b790f8efcd Alexey Dobriyan    2008-11-25  63  	struct sock		*nlsk;
d79d792ef9f99cc Eric W. Biederman  2009-12-03  64  	struct sock		*nlsk_stash;
b27aeadb5948d40 Alexey Dobriyan    2008-11-25  65  
b27aeadb5948d40 Alexey Dobriyan    2008-11-25  66  	u32			sysctl_aevent_etime;
b27aeadb5948d40 Alexey Dobriyan    2008-11-25  67  	u32			sysctl_aevent_rseqth;
b27aeadb5948d40 Alexey Dobriyan    2008-11-25  68  	int			sysctl_larval_drop;
b27aeadb5948d40 Alexey Dobriyan    2008-11-25  69  	u32			sysctl_acq_expires;
2d151d39073aff4 Steffen Klassert   2021-07-18  70  
b58b1f563ab7895 Nicolas Dichtel    2022-03-14  71  	u8			policy_default[XFRM_POLICY_MAX];
2d151d39073aff4 Steffen Klassert   2021-07-18  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
