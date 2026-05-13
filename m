Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C633C192
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673626; cv=none; b=YXlMBMJ7lDxugxDGqThnRKHxqOVG8QNfOBeMa/Wf/6rHqrhHSIBy/SMscbBamFSyH8j2Dj0hoF+3HxLNee1B04UISyBAqacjhXihNCTfxU1n5szlm/OVpvOsOAprmruEYy/bmzPpIZy6xV9vC4lvGrrxd6VTkAVqRJ+Pwy/r3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673626; c=relaxed/simple;
	bh=i7vWSe4+QOKAMQVw9LYaPKs6IUmYFDfiboMF1wuqZGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/aGuBaLN8QqBeoF7H9KcC3l5Ckl94g3jNyfNDLRf4pl40x9DDC5GZLkEUZ2OBOWeu/tLIfFg10m0T1XZ4bNCkjZtOujkfoMaWXdN9E95THXwzPcRjDPwcF1Lz3tHGqTmyK8HcGmCcD/TcJMx4DE4EqThAfKy5kBOtwyzJDgTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R41Nne3e; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R41Nne3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778673625; x=1810209625;
  h=date:from:to:cc:subject:message-id;
  bh=i7vWSe4+QOKAMQVw9LYaPKs6IUmYFDfiboMF1wuqZGk=;
  b=R41Nne3exvsw8zskcXlEum2X7BAqlnAQGn1q9QvyPYRRQAYWIps0dPyw
   51gkCPtm5DX187Zhl4VGg46Jh85eWT5v+d4Z2bDTY0EPayBz5mWlwHJo3
   5rJeXLPRaP5WYu1ypfrKeobVVIPlddotUf2AVGlxLFr2hAorrFF+LVJFX
   XD+WHist2tPAK4un3S+/smlEkF/fQ52vrlWNRbU1NICUEYtNR+uK660J7
   AKcrasOOhHh/y5orU1jyxK1JtXbt5llbCyPZnLPItRIkWRjlajKj7KF84
   vbAbVyUzX9sV0yhE9ZBZI+ro88UM3DtmIRWoPFpMAroEpYDJoUKxf+84B
   g==;
X-CSE-ConnectionGUID: iMjQpRjGQTauQbyD1zSdhw==
X-CSE-MsgGUID: ppPNfyd0TMGhRF74Sqd/YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79629474"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79629474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:00:24 -0700
X-CSE-ConnectionGUID: 9siN87BaRAisNg079JqQ7A==
X-CSE-MsgGUID: weHZZbVNRjaLJl62Rz/I+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237966180"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2026 05:00:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8GC-0000000042X-229v;
	Wed, 13 May 2026 12:00:20 +0000
Date: Wed, 13 May 2026 20:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 248/332]
 fs/bcachefs/alloc/foreground.c:1632 bch2_print_allocator_stuck() error: we
 previously assumed 'req' could be null (see line 1597)
Message-ID: <202605131958.dPgrXDjB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 37b736119d44347abe102ee07dfd777a4e612cfa [248/332] bcachefs: bch2_print_allocator_stuck() includes info from alloc_request
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131958.dPgrXDjB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131958.dPgrXDjB-lkp@intel.com/

New smatch warnings:
fs/bcachefs/alloc/foreground.c:1632 bch2_print_allocator_stuck() error: we previously assumed 'req' could be null (see line 1597)

Old smatch warnings:
fs/bcachefs/alloc/foreground.c:479 bucket_alloc_to_text() warn: passing zero to 'PTR_ERR'
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting

vim +/req +1632 fs/bcachefs/alloc/foreground.c

37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1588  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1589  static noinline void bch2_print_allocator_stuck(struct bch_fs *c, struct alloc_request *req, int err)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1590  {
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1591  	CLASS(printbuf, buf)();
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1592  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1593  	prt_printf(&buf, "Allocator stuck? Waited for %u seconds, err %s\n",
cf2e5573074114 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-05  1594  		   c->opts.allocator_stuck_timeout,
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1595  		   bch2_err_str(err));
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1596  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25 @1597  	if (req) {
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1598  		printbuf_tabstop_push(&buf, 16);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1599  		prt_str(&buf, "Allocation:\n");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1600  		guard(printbuf_indent)(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1601  		prt_printf(&buf, "nr_replicas:\t%u\n", req->nr_replicas);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1602  		prt_str(&buf, "target:\t");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1603  		bch2_target_to_text(&buf, c, req->target);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1604  		prt_newline(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1605  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1606  		prt_printf(&buf, "watermark:\t%s\n", bch2_watermarks[req->watermark]);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1607  		prt_printf(&buf, "data_type:\t%s\n", __bch2_data_types[req->data_type]);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1608  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1609  		prt_str(&buf, "flags:\t");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1610  		prt_bitflags(&buf, bch2_write_flags, req->flags);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1611  		prt_newline(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1612  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1613  		if (req->devs_have && req->devs_have->nr) {
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1614  			prt_printf(&buf, "devs_have:\t");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1615  			bch2_devs_list_to_text(&buf, c, req->devs_have);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1616  			prt_newline(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1617  		}
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1618  	}
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1619  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1620  	if (err == -BCH_ERR_bucket_alloc_blocked) {
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1621  		prt_printf(&buf, "Allocator debug:\n");
1f6a66d990e636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-09-02  1622  		scoped_guard(printbuf_indent, &buf)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1623  			bch2_fs_alloc_debug_to_text(&buf, c);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1624  		prt_newline(&buf);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1625  
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1626  		bch2_printbuf_make_room(&buf, 4096);
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1627  
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1628  		scoped_guard(rcu) {
e4c8f5345f2559 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-14  1629  			guard(printbuf_atomic)(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1630  			prt_printf(&buf, "Devices elligible for allocation\n");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1631  			for_each_member_device_rcu(c, ca, NULL)
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25 @1632  				if (dev_may_alloc(c, ca, req))
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1633  					dev_alloc_debug_header(&buf, ca);
6bbcfab4a7c266 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-15  1634  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1635  			prt_printf(&buf, "Devices inelligible for allocation\n");
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1636  			for_each_member_device_rcu(c, ca, NULL)
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1637  				if (!dev_may_alloc(c, ca, req))
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1638  					dev_alloc_debug_header(&buf, ca);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1639  		}
9fa4a8a3bdb14c fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-04-18  1640  
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1641  		prt_printf(&buf, "Copygc debug:\n");
1f6a66d990e636 fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-09-02  1642  		scoped_guard(printbuf_indent, &buf)
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1643  			bch2_copygc_wait_to_text(&buf, c);
e98786ea855cb2 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-05-03  1644  		prt_newline(&buf);
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1645  	}
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1646  
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1647  	if (err == -BCH_ERR_open_bucket_alloc_blocked)
37b736119d4434 fs/bcachefs/alloc/foreground.c Kent Overstreet 2026-01-25  1648  		bch2_fs_open_buckets_to_text(&buf, c);
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
