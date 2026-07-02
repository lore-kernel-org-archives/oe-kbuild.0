Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312D331EA4
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963856; cv=none; b=uSiAaynf0YXZTNTW8gbWCANjUxIYjtb5LP+peZeqni/DyZT2bKjGwJi6gpcv3wuF/29ZreaIs6J0BRnayWC/bxt69g9EcplW+O2PSF51ix0lfXWbock/l/JfzPS2QwP4hiZZDTvixLdt8RWdF6zth4ceYqysTZDyI+5jrY9c9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963856; c=relaxed/simple;
	bh=F9RRI3mLFIO5klGlUXGTMV0tSHCnaApTz92o7AVTIBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WJcxgbf5xShemcKNJ5JUgWtRFYD3jRHr7pX6pTg1CaaP2R04ct/8OIdF7L++gCKOfrefDG+ikppcQnA+YOE4GI9I/mJnhclAbBGGy3vFXtsMa70khCwtNsqYPJG0aRlIazBZlubmgmSYVRkvNMiVHVTk6Sime4nOgcqA/Fk84FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwhTaIUX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwhTaIUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782963856; x=1814499856;
  h=date:from:to:cc:subject:message-id;
  bh=F9RRI3mLFIO5klGlUXGTMV0tSHCnaApTz92o7AVTIBs=;
  b=lwhTaIUXf3W5qmp8V1oDt+XImD+zLl6yed3vdu6GwqKyLj4CqX4eREUz
   vUKCxHBrMiDSzvrl6HFSb8F/WnQCUFmZ/Y5AclAot0XJV/R+fQr7TpH+V
   4vdyc4mgtg75af1VIqFw8CPVu9kdYJuyXxpaYUlHCvoX3BI3s7w7hOMsc
   Rwi69S/9LXSjUxUyhPTubpJg5Y+yTqG6nPQ3pkBWXrKisk8m+c40J1XpJ
   IGJ6cH+mS2jGqnzQhXgmh79Tx0U974zEemBQBQ2OUNN3qPa3GoGaiXQkd
   c9r5FVzgh1leOlO9qRIgOKHPDdzhEQb5hWPIlcZNd1309VIxp0vgPKkya
   Q==;
X-CSE-ConnectionGUID: u2CqL4CtRCejYR4iUKVERw==
X-CSE-MsgGUID: jwP1gEnPR06IIu/HKP0xRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83696515"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83696515"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:44:14 -0700
X-CSE-ConnectionGUID: /KhA4nW5S6mAoEgmNQtCZA==
X-CSE-MsgGUID: lxBJkMhOSbi6YOjQENMKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251696601"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 20:44:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8LR-000000009x9-2k4V;
	Thu, 02 Jul 2026 03:44:09 +0000
Date: Thu, 02 Jul 2026 11:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/netfilter/nf_conntrack_expect.c:669:30-31: WARNING
 opportunity for max()
Message-ID: <202607021136.LkMhwGNv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: b8b09dc2bf35a00d4e0556b5d6308c7b917ebda2 netfilter: nf_conntrack_expect: use conntrack GC to reap expectations
date:   11 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-053-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021136.LkMhwGNv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b8b09dc2bf35 ("netfilter: nf_conntrack_expect: use conntrack GC to reap expectations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607021136.LkMhwGNv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/netfilter/nf_conntrack_expect.c:669:30-31: WARNING opportunity for max()

vim +669 net/netfilter/nf_conntrack_expect.c

77ab9cff0f4112 Martin Josefsson  2006-11-29  651  
77ab9cff0f4112 Martin Josefsson  2006-11-29  652  static int exp_seq_show(struct seq_file *s, void *v)
77ab9cff0f4112 Martin Josefsson  2006-11-29  653  {
5d08ad440feae1 Patrick McHardy   2007-07-07  654  	struct nf_conntrack_expect *expect;
b87921bdf25485 Patrick McHardy   2010-02-11  655  	struct nf_conntrack_helper *helper;
3db5647984de03 Pablo Neira Ayuso 2026-03-25  656  	struct net *net = seq_file_net(s);
5d08ad440feae1 Patrick McHardy   2007-07-07  657  	struct hlist_node *n = v;
359b9ab614aba7 Patrick McHardy   2008-03-25  658  	char *delim = "";
b8b09dc2bf35a0 Pablo Neira Ayuso 2026-06-18  659  	__s32 timeout;
5d08ad440feae1 Patrick McHardy   2007-07-07  660  
5d08ad440feae1 Patrick McHardy   2007-07-07  661  	expect = hlist_entry(n, struct nf_conntrack_expect, hnode);
77ab9cff0f4112 Martin Josefsson  2006-11-29  662  
3db5647984de03 Pablo Neira Ayuso 2026-03-25  663  	if (!net_eq(nf_ct_exp_net(expect), net))
3db5647984de03 Pablo Neira Ayuso 2026-03-25  664  		return 0;
b8b09dc2bf35a0 Pablo Neira Ayuso 2026-06-18  665  	if (nf_ct_exp_is_expired(expect))
b8b09dc2bf35a0 Pablo Neira Ayuso 2026-06-18  666  		return 0;
3db5647984de03 Pablo Neira Ayuso 2026-03-25  667  
b8b09dc2bf35a0 Pablo Neira Ayuso 2026-06-18  668  	timeout = (__s32)(READ_ONCE(expect->timeout) - nfct_time_stamp) / HZ;
b8b09dc2bf35a0 Pablo Neira Ayuso 2026-06-18 @669  	seq_printf(s, "%d ", timeout > 0 ? timeout : 0);
77ab9cff0f4112 Martin Josefsson  2006-11-29  670  	seq_printf(s, "l3proto = %u proto=%u ",
77ab9cff0f4112 Martin Josefsson  2006-11-29  671  		   expect->tuple.src.l3num,
77ab9cff0f4112 Martin Josefsson  2006-11-29  672  		   expect->tuple.dst.protonum);
77ab9cff0f4112 Martin Josefsson  2006-11-29  673  	print_tuple(s, &expect->tuple,
4a60dc748d121b Florian Westphal  2019-01-15  674  		    nf_ct_l4proto_find(expect->tuple.dst.protonum));
4bb119eab7b724 Patrick McHardy   2008-03-25  675  
359b9ab614aba7 Patrick McHardy   2008-03-25  676  	if (expect->flags & NF_CT_EXPECT_PERMANENT) {
cdec26858e7bd9 simran singhal    2017-03-29  677  		seq_puts(s, "PERMANENT");
359b9ab614aba7 Patrick McHardy   2008-03-25  678  		delim = ",";
359b9ab614aba7 Patrick McHardy   2008-03-25  679  	}
bc01befdcf3e40 Pablo Neira Ayuso 2010-09-28  680  	if (expect->flags & NF_CT_EXPECT_INACTIVE) {
359b9ab614aba7 Patrick McHardy   2008-03-25  681  		seq_printf(s, "%sINACTIVE", delim);
bc01befdcf3e40 Pablo Neira Ayuso 2010-09-28  682  		delim = ",";
bc01befdcf3e40 Pablo Neira Ayuso 2010-09-28  683  	}
bc01befdcf3e40 Pablo Neira Ayuso 2010-09-28  684  	if (expect->flags & NF_CT_EXPECT_USERSPACE)
bc01befdcf3e40 Pablo Neira Ayuso 2010-09-28  685  		seq_printf(s, "%sUSERSPACE", delim);
4bb119eab7b724 Patrick McHardy   2008-03-25  686  
f01794106042ee Pablo Neira Ayuso 2026-03-25  687  	helper = rcu_dereference(expect->helper);
b87921bdf25485 Patrick McHardy   2010-02-11  688  	if (helper) {
b87921bdf25485 Patrick McHardy   2010-02-11  689  		seq_printf(s, "%s%s", expect->flags ? " " : "", helper->name);
b173a28f62cf92 Liping Zhang      2016-08-08  690  		if (helper->expect_policy[expect->class].name[0])
b87921bdf25485 Patrick McHardy   2010-02-11  691  			seq_printf(s, "/%s",
b87921bdf25485 Patrick McHardy   2010-02-11  692  				   helper->expect_policy[expect->class].name);
b87921bdf25485 Patrick McHardy   2010-02-11  693  	}
b87921bdf25485 Patrick McHardy   2010-02-11  694  
1ca9e41770cba4 Joe Perches       2015-03-16  695  	seq_putc(s, '\n');
1ca9e41770cba4 Joe Perches       2015-03-16  696  
1ca9e41770cba4 Joe Perches       2015-03-16  697  	return 0;
77ab9cff0f4112 Martin Josefsson  2006-11-29  698  }
77ab9cff0f4112 Martin Josefsson  2006-11-29  699  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
