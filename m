Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B72FD695
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 03:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483551; cv=none; b=Nad3CYMvhEgfXTSZV6QAwLi9sFayCESQtNShf57vcm964KR1fIvr/Ox/R9pXV5GwB9anpQgmMid4YOOVE1awpxX8wtqMdfYZenMuyzcOYz1egS06TgFV+B1GA6JmzT5unA+RhNnGigmAjouehbN7qmhTW3aMwjTXSwC4NPyfu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483551; c=relaxed/simple;
	bh=lp1bdBI0CZdqXNoVEFUsBtUHh2uTlxP8+ifgSOdH7BU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yz6zHjuBOGXoOLunvfhlC1xX79hOC9n/uSHo0QnHYmhtypbjq9VBTBIh5dfuAuwuXbV7Bf2NmQv/KtnRaaPSAnUeJ/BLEI+eBS88WrAu7cnt9Jl8lU/lGYT/w8JaAxqmRQpSqPLFl7BJJDKCtwN5myS5yOTzzndRbPzMiUE2JMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlJQPCY8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlJQPCY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769483549; x=1801019549;
  h=date:from:to:cc:subject:message-id;
  bh=lp1bdBI0CZdqXNoVEFUsBtUHh2uTlxP8+ifgSOdH7BU=;
  b=nlJQPCY8NLL9Gf2P0nOkWWfVGueUYgSpN9B8xSyYaQYDyjNMguNEmZjI
   tlsn/3xHyX3eY3p8H54trpAuJcHjPYOORxbNg+AZUg1iuCJaw0C737t6R
   UrF2IdRlWnxFeo92UN6De9DxrjGjEB7XoQmsfN+xVryR/AnmvRMhCL4rS
   iwKTuLbLHRcs0T/3DOCzQlloAXHPX8Jllf06ZCdMh0JuSwRxKEuBemRGd
   p0g0udCG69aolUzqiNmS4hRpyu7VWi84/Ic5gdgeONnneXm8ddDafx2JQ
   s5GQqiH5nXruvVphTyc/OPTPS+ZNLoCY3A8kwX+jqGdsc7ZNdRIhpvO8P
   Q==;
X-CSE-ConnectionGUID: 3Bd25QKrT1OK4Hhjxx0jWQ==
X-CSE-MsgGUID: aiNjTAwPQ2m7YjO9GhUouQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70827168"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70827168"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:12:28 -0800
X-CSE-ConnectionGUID: gLRscwt8TiO+bYwnnZzQCQ==
X-CSE-MsgGUID: bSEe6tpZSmexW5jDGJ9KpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207731280"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jan 2026 19:12:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZVA-00000000XwJ-3pZl;
	Tue, 27 Jan 2026 03:12:24 +0000
Date: Tue, 27 Jan 2026 11:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 261/271]
 fs/bcachefs/alloc/foreground.c:1632 bch2_print_allocator_stuck() error: we
 previously assumed 'req' could be null (see line 1597)
Message-ID: <202601271143.cRMQOTPw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   6a245e77b8928515c6a78b5614cab8aeb632c03c
commit: bcea5b9b332af7dbfbf97f7c836889d18a68e4c8 [261/271] bcachefs: bch2_print_allocator_stuck() includes info from alloc_request
:::::: branch date: 3 hours ago
:::::: commit date: 33 hours ago
config: parisc-randconfig-r071-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271143.cRMQOTPw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601271143.cRMQOTPw-lkp@intel.com/

New smatch warnings:
fs/bcachefs/alloc/foreground.c:1632 bch2_print_allocator_stuck() error: we previously assumed 'req' could be null (see line 1597)

Old smatch warnings:
fs/bcachefs/alloc/foreground.c:479 bucket_alloc_to_text() warn: passing zero to 'PTR_ERR'
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting

vim +/req +1632 fs/bcachefs/alloc/foreground.c

bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1588  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1589  static noinline void bch2_print_allocator_stuck(struct bch_fs *c, struct alloc_request *req, int err)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1590  {
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1591  	CLASS(printbuf, buf)();
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1592  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1593  	prt_printf(&buf, "Allocator stuck? Waited for %u seconds, err %s\n",
cf2e5573074114 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-05  1594  		   c->opts.allocator_stuck_timeout,
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1595  		   bch2_err_str(err));
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1596  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25 @1597  	if (req) {
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1598  		printbuf_tabstop_push(&buf, 16);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1599  		prt_str(&buf, "Allocation:\n");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1600  		guard(printbuf_indent)(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1601  		prt_printf(&buf, "nr_replicas:\t%u\n", req->nr_replicas);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1602  		prt_str(&buf, "target:\t");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1603  		bch2_target_to_text(&buf, c, req->target);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1604  		prt_newline(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1605  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1606  		prt_printf(&buf, "watermark:\t%s\n", bch2_watermarks[req->watermark]);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1607  		prt_printf(&buf, "data_type:\t%s\n", __bch2_data_types[req->data_type]);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1608  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1609  		prt_str(&buf, "flags:\t");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1610  		prt_bitflags(&buf, bch2_write_flags, req->flags);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1611  		prt_newline(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1612  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1613  		if (req->devs_have && req->devs_have->nr) {
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1614  			prt_printf(&buf, "devs_have:\t");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1615  			bch2_devs_list_to_text(&buf, c, req->devs_have);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1616  			prt_newline(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1617  		}
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1618  	}
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1619  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1620  	if (err == -BCH_ERR_bucket_alloc_blocked) {
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1621  		prt_printf(&buf, "Allocator debug:\n");
1f6a66d990e636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-09-02  1622  		scoped_guard(printbuf_indent, &buf)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1623  			bch2_fs_alloc_debug_to_text(&buf, c);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1624  		prt_newline(&buf);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1625  
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1626  		bch2_printbuf_make_room(&buf, 4096);
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1627  
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1628  		scoped_guard(rcu) {
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1629  			guard(printbuf_atomic)(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1630  			prt_printf(&buf, "Devices elligible for allocation\n");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1631  			for_each_member_device_rcu(c, ca, NULL)
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25 @1632  				if (dev_may_alloc(c, ca, req))
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1633  					dev_alloc_debug_header(&buf, ca);
6bbcfab4a7c266 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-15  1634  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1635  			prt_printf(&buf, "Devices inelligible for allocation\n");
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1636  			for_each_member_device_rcu(c, ca, NULL)
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1637  				if (!dev_may_alloc(c, ca, req))
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1638  					dev_alloc_debug_header(&buf, ca);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1639  		}
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1640  
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1641  		prt_printf(&buf, "Copygc debug:\n");
1f6a66d990e636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-09-02  1642  		scoped_guard(printbuf_indent, &buf)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1643  			bch2_copygc_wait_to_text(&buf, c);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1644  		prt_newline(&buf);
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1645  	}
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1646  
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1647  	if (err == -BCH_ERR_open_bucket_alloc_blocked)
bcea5b9b332af7 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1648  		bch2_fs_open_buckets_to_text(&buf, c);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1649  
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1650  	prt_printf(&buf, "Journal debug:\n");
1f6a66d990e636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-09-02  1651  	scoped_guard(printbuf_indent, &buf)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1652  		bch2_journal_debug_to_text(&buf, &c->journal);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1653  
ebf561b2083d79 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-15  1654  	bch2_print_str(c, KERN_ERR, buf.buf);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1655  }
cecf72798b25fc fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-08-07  1656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
