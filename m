Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D434320A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 03:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771819082; cv=none; b=JNbUwehTy83ybuET3c3mXRGWAua3FeAgNr0ENPvIPJIx2PTBVtw2O4kCH/aUAK/eF+iX2b9W40VSWfIbtl29XwXgxuksyTXUk0oY8eelW+5Wud4kVDatM1r7sL4ne3ae0e0kEBRuz1Nlxbp5nXvBo8FAryPaXPHAdO5cgoExEvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771819082; c=relaxed/simple;
	bh=EKOT8LDdh3EsNpDZBAa5ml/aaE5L87N7aNZSWtMED6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDzU9Ulo6o25E/oX4k+iu4GRgZyOBpNlPYUXSBTAUIDPZelY83d8fTg35WEbKQZoxJHMe5iPmvzWn4nSuoMEtOder/UainXiP3xTpwdj8G3QWioAiRPj/zrjm1ykMtymQk5Xiswz8XFhILLWM+KapeYROuFVGoZWYNpHzAnSgK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h33Ci8zY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h33Ci8zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771819079; x=1803355079;
  h=date:from:to:cc:subject:message-id;
  bh=EKOT8LDdh3EsNpDZBAa5ml/aaE5L87N7aNZSWtMED6g=;
  b=h33Ci8zYekeQ6bbGncuDh4PPV66MEmuE0bBshrJkpjeL+ZNl3KQa8B7O
   tWawRSIkMQFGLjbENjr2ErzpFpDT3E+SvUHUjiw4ar/zYQcmR0zb66tBI
   /SNdjAc6bukqUZcIo/+QxCeAONDgLDyufVByE7gfTRSAHD0DZ2aEeZNWD
   QdFbVKVVimhXHSAnOSHyCYx1CuxNOO/nv469Fn0Ao0N66cIvkkGrdYy5w
   EohwFDlRdwZNC8ypOqPS6wm33DNscWZnWixKfwQC7IlRJrRZV1g1wb3Wp
   HT1nVwPM3L8znCbk/hofs+GEiqFo0QstPYipGh1GeO2YUuPCPTlAiubhB
   Q==;
X-CSE-ConnectionGUID: BH9PH2RpTb68SWRt1RvOiQ==
X-CSE-MsgGUID: K7xmRlAsShGQ/N2aZ2c4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90394133"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="90394133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 19:57:58 -0800
X-CSE-ConnectionGUID: H0+Q3A6zSzixm6VWgaZFjw==
X-CSE-MsgGUID: EWggiXKYSsOo1NkUgPaKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="215278071"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2026 19:57:56 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuN4z-000000000JV-2zfZ;
	Mon, 23 Feb 2026 03:57:53 +0000
Date: Mon, 23 Feb 2026 11:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 738/799]
 fs/bcachefs/init/recovery.c:687 __bch2_fs_recovery() warn: variable
 dereferenced before check 'clean' (see line 619)
Message-ID: <202602231118.uHZLOP5d-lkp@intel.com>
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
commit: 4f8305ce7dfa6f1c5aee499b7e0c6778f34f2750 [738/799] bcachefs: bch2_fs_recovery() -> try()
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: i386-randconfig-r072-20260223 (https://download.01.org/0day-ci/archive/20260223/202602231118.uHZLOP5d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602231118.uHZLOP5d-lkp@intel.com/

smatch warnings:
fs/bcachefs/init/recovery.c:687 __bch2_fs_recovery() warn: variable dereferenced before check 'clean' (see line 619)

vim +/clean +687 fs/bcachefs/init/recovery.c

1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  609  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  610  static int __bch2_fs_recovery(struct bch_fs *c)
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  611  {
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  612  	struct bch_sb_field_clean *clean __free(kfree) = NULL;
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  613  	struct journal_start_info journal_start = {};
4932e07ea04bcc fs/bcachefs/recovery.c      Kent Overstreet 2021-04-24  614  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  615  
a37ad1a3aba957 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-05  616  	if (c->sb.clean) {
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  617  		clean = errptr_try(bch2_read_superblock_clean(c));
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  618  
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16 @619  		bch_info(c, "recovering from clean shutdown, journal seq %llu",
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  620  			 le64_to_cpu(clean->journal_seq));
8e7d3f6a43f5c9 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-02  621  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  622  		try(bch2_sb_journal_sort(c));
a37ad1a3aba957 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-05  623  	} else {
0a84a066f9a145 fs/bcachefs/recovery.c      Kent Overstreet 2021-11-15  624  		bch_info(c, "recovering from unclean shutdown");
a37ad1a3aba957 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-05  625  	}
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  626  
45150765d307c1 fs/bcachefs/recovery.c      Kent Overstreet 2024-04-26  627  	bch2_journal_pos_from_member_info_resume(c);
45150765d307c1 fs/bcachefs/recovery.c      Kent Overstreet 2024-04-26  628  
4dcd90b6d1b76b fs/bcachefs/recovery.c      Kent Overstreet 2024-03-30  629  	if (!c->sb.clean || c->opts.retain_recovery_info) {
ce6201c456571d fs/bcachefs/recovery.c      Kent Overstreet 2022-03-21  630  		struct genradix_iter iter;
ce6201c456571d fs/bcachefs/recovery.c      Kent Overstreet 2022-03-21  631  		struct journal_replay **i;
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  632  
365f64f36c55b7 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  633  		bch_verbose(c, "starting journal read");
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  634  		try(bch2_journal_read(c, &journal_start));
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  635  
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  636  		/*
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  637  		 * note: cmd_list_journal needs the blacklist table fully up to date so
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  638  		 * it can asterisk ignored journal entries:
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  639  		 */
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  640  		if (c->opts.read_journal_only)
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  641  			return 0;
e0de429a3ab5f9 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-01  642  
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  643  		if (mustfix_fsck_err_on(c->sb.clean && !journal_start.clean,
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  644  					c, clean_but_journal_not_empty,
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  645  					"filesystem marked clean but journal not empty")) {
19dd3172b0002a fs/bcachefs/recovery.c      Kent Overstreet 2021-04-04  646  			c->sb.compat &= ~(1ULL << BCH_COMPAT_alloc_info);
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  647  			SET_BCH_SB_CLEAN(c->disk_sb.sb, false);
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  648  			c->sb.clean = false;
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  649  		}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  650  
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  651  		struct jset *last_journal_entry = NULL;
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  652  		genradix_for_each_reverse(&c->journal_entries, iter, i)
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  653  			if (!journal_replay_ignore(*i)) {
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  654  				last_journal_entry = &(*i)->j;
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  655  				break;
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  656  			}
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  657  
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  658  		if (!last_journal_entry) {
b65db750e2bb92 fs/bcachefs/recovery.c      Kent Overstreet 2023-10-24  659  			fsck_err_on(!c->sb.clean, c,
b65db750e2bb92 fs/bcachefs/recovery.c      Kent Overstreet 2023-10-24  660  				    dirty_but_no_journal_entries,
b65db750e2bb92 fs/bcachefs/recovery.c      Kent Overstreet 2023-10-24  661  				    "no journal entries found");
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  662  			if (clean)
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  663  				goto use_clean;
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  664  
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  665  			genradix_for_each_reverse(&c->journal_entries, iter, i)
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  666  				if (*i) {
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  667  					last_journal_entry = &(*i)->j;
2cce3752cec5a8 fs/bcachefs/recovery.c      Kent Overstreet 2024-02-25  668  					(*i)->ignore_blacklisted = false;
2cce3752cec5a8 fs/bcachefs/recovery.c      Kent Overstreet 2024-02-25  669  					(*i)->ignore_not_dirty= false;
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  670  					/*
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  671  					 * This was probably a NO_FLUSH entry,
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  672  					 * so last_seq was garbage - but we know
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  673  					 * we're only using a single journal
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  674  					 * entry, set it here:
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  675  					 */
5a53f851e6fe0e fs/bcachefs/recovery.c      Kent Overstreet 2023-11-03  676  					(*i)->j.last_seq = (*i)->j.seq;
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  677  					break;
1ba8a796b427d3 fs/bcachefs/recovery.c      Kent Overstreet 2022-12-14  678  				}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  679  		}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  680  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  681  		try(bch2_journal_keys_sort(c));
d07343561e263f fs/bcachefs/recovery.c      Kent Overstreet 2019-04-11  682  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  683  		if (c->sb.clean && last_journal_entry)
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  684  			try(bch2_verify_superblock_clean(c, &clean, last_journal_entry));
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  685  	} else {
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  686  use_clean:
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14 @687  		if (!clean) {
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  688  			bch_err(c, "no superblock clean section found");
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  689  			return bch_err_throw(c, fsck_repair_impossible);
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  690  
adbcada43fa791 fs/bcachefs/recovery.c      Kent Overstreet 2020-11-14  691  		}
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  692  
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  693  		journal_start.start_seq = le64_to_cpu(clean->journal_seq) + 1;
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  694  	}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  695  
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  696  	c->journal_replay_seq_start	= journal_start.seq_read_start;
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  697  	c->journal_replay_seq_end	= journal_start.seq_read_end;
78328fec704e31 fs/bcachefs/recovery.c      Kent Overstreet 2023-07-08  698  
877da05ffb13c1 fs/bcachefs/recovery.c      Kent Overstreet 2021-07-30  699  	zero_out_btree_mem_ptr(&c->journal_keys);
877da05ffb13c1 fs/bcachefs/recovery.c      Kent Overstreet 2021-07-30  700  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  701  	try(journal_replay_early(c, clean));
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  702  
f0a5f22957fbf9 fs/bcachefs/recovery.c      Kent Overstreet 2025-07-14  703  	scoped_guard(rwsem_write, &c->state_lock)
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  704  		try(bch2_fs_resize_on_mount(c));
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  705  
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  706  	if (c->sb.features & BIT_ULL(BCH_FEATURE_small_image)) {
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  707  		bch_info(c, "filesystem is an unresized image file, mounting ro");
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  708  		c->opts.read_only = true;
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  709  	}
0ca375b1779f22 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-15  710  
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  711  	if (!c->opts.read_only &&
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  712  	    (c->sb.features & BIT_ULL(BCH_FEATURE_no_alloc_info))) {
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  713  		bch_info(c, "mounting a filesystem with no alloc info read-write; will recreate");
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  714  
00fa283a41fedc fs/bcachefs/recovery.c      Kent Overstreet 2024-12-10  715  		bch2_reconstruct_alloc(c);
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  716  	} else if (c->opts.reconstruct_alloc) {
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  717  		bch2_journal_log_msg(c, "dropping alloc info");
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  718  		bch_info(c, "dropping and reconstructing all alloc info");
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  719  
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  720  		bch2_reconstruct_alloc(c);
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  721  	}
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  722  
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  723  	if (c->sb.features & BIT_ULL(BCH_FEATURE_no_alloc_info)) {
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  724  		/* We can't go RW to fix errors without alloc info */
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  725  		if (c->opts.fix_errors == FSCK_FIX_yes ||
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  726  		    c->opts.fix_errors == FSCK_FIX_ask)
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  727  			c->opts.fix_errors = FSCK_FIX_no;
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  728  		if (c->opts.errors == BCH_ON_ERROR_fix_safe)
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  729  			c->opts.errors = BCH_ON_ERROR_continue;
203852d9db68e1 fs/bcachefs/recovery.c      Kent Overstreet 2025-04-03  730  	}
00fa283a41fedc fs/bcachefs/recovery.c      Kent Overstreet 2024-12-10  731  
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  732  	/*
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  733  	 * After an unclean shutdown, skip then next few journal sequence
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  734  	 * numbers as they may have been referenced by btree writes that
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  735  	 * happened before their corresponding journal writes - those btree
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  736  	 * writes need to be ignored, by skipping and blacklisting the next few
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  737  	 * journal sequence numbers:
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  738  	 */
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  739  	if (!c->sb.clean)
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  740  		journal_start.start_seq += JOURNAL_BUF_NR * 4;
9b6e2f1e7036d6 fs/bcachefs/recovery.c      Kent Overstreet 2022-01-04  741  
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  742  	if (journal_start.seq_read_end &&
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  743  	    journal_start.seq_read_end + 1 != journal_start.start_seq) {
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  744  		u64 blacklist_seq = journal_start.seq_read_end + 1;
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  745  		try(bch2_journal_log_msg(c, "blacklisting entries %llu-%llu",
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  746  					 blacklist_seq, journal_start.start_seq));
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  747  		try(bch2_journal_seq_blacklist_add(c, blacklist_seq, journal_start.start_seq));
f707e3d8f41e77 fs/bcachefs/recovery.c      Kent Overstreet 2019-06-18  748  	}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  749  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  750  	try(bch2_journal_log_msg(c, "starting journal at entry %llu, replaying %llu-%llu",
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  751  				 journal_start.start_seq,
8548df42b64298 fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  752  				 journal_start.seq_read_start,
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  753  				 journal_start.seq_read_end));
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  754  	try(bch2_fs_journal_start(&c->journal, journal_start));
42b72e0ba226fa fs/bcachefs/recovery.c      Kent Overstreet 2019-01-24  755  
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  756  	/*
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  757  	 * Skip past versions that might have possibly been used (as nonces),
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  758  	 * but hadn't had their pointers written:
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  759  	 */
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  760  	if (c->sb.encryption_type && !c->sb.clean)
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  761  		atomic64_add(1 << 16, &c->key_version);
1cab5a82cc67a0 fs/bcachefs/recovery.c      Kent Overstreet 2022-04-21  762  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  763  	try(read_btree_roots(c));
1c6fdbd8f2465d fs/bcachefs/recovery.c      Kent Overstreet 2017-03-16  764  
7773df19c35fab fs/bcachefs/recovery.c      Kent Overstreet 2024-04-25  765  	set_bit(BCH_FS_btree_running, &c->flags);
7773df19c35fab fs/bcachefs/recovery.c      Kent Overstreet 2024-04-25  766  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  767  	try(bch2_sb_set_upgrade_extra(c));
7773df19c35fab fs/bcachefs/recovery.c      Kent Overstreet 2024-04-25  768  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  769  	try(bch2_run_recovery_passes(c, 0));
14b393ee768e83 fs/bcachefs/recovery.c      Kent Overstreet 2021-03-16  770  
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  771  	/*
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  772  	 * Normally set by the appropriate recovery pass: when cleared, this
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  773  	 * indicates we're in early recovery and btree updates should be done by
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  774  	 * being applied to the journal replay keys. _Must_ be cleared before
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  775  	 * multithreaded use:
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  776  	 */
ef4f6c322bf4ca fs/bcachefs/recovery.c      Kent Overstreet 2024-10-31  777  	set_bit(BCH_FS_may_go_rw, &c->flags);
367cad09664aaf fs/bcachefs/recovery.c      Kent Overstreet 2025-05-10  778  	clear_bit(BCH_FS_in_fsck, &c->flags);
d55ddf6e7a81e1 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-31  779  
6d12d7ace99ec7 fs/bcachefs/recovery.c      Kent Overstreet 2024-09-22  780  	/* in case we don't run journal replay, i.e. norecovery mode */
6d12d7ace99ec7 fs/bcachefs/recovery.c      Kent Overstreet 2024-09-22  781  	set_bit(BCH_FS_accounting_replay_done, &c->flags);
6d12d7ace99ec7 fs/bcachefs/recovery.c      Kent Overstreet 2024-09-22  782  
c1f618f4f7cc7b fs/bcachefs/recovery.c      Kent Overstreet 2024-11-29  783  	bch2_async_btree_node_rewrites_flush(c);
c1f618f4f7cc7b fs/bcachefs/recovery.c      Kent Overstreet 2024-11-29  784  
4fe0eeeae47732 fs/bcachefs/recovery.c      Kent Overstreet 2024-03-28  785  	/* fsync if we fixed errors */
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  786  	bool errors_fixed = test_bit(BCH_FS_errors_fixed, &c->flags) ||
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  787  		test_bit(BCH_FS_errors_fixed_silent, &c->flags);
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  788  
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  789  	if (errors_fixed) {
4fe0eeeae47732 fs/bcachefs/recovery.c      Kent Overstreet 2024-03-28  790  		bch2_journal_flush_all_pins(&c->journal);
4fe0eeeae47732 fs/bcachefs/recovery.c      Kent Overstreet 2024-03-28  791  		bch2_journal_meta(&c->journal);
4fe0eeeae47732 fs/bcachefs/recovery.c      Kent Overstreet 2024-03-28  792  	}
4fe0eeeae47732 fs/bcachefs/recovery.c      Kent Overstreet 2024-03-28  793  
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  794  	/* If we fixed errors, verify that fs is actually clean now: */
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  795  	if (IS_ENABLED(CONFIG_BCACHEFS_DEBUG) &&
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  796  	    errors_fixed &&
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  797  	    !test_bit(BCH_FS_errors_not_fixed, &c->flags) &&
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  798  	    !test_bit(BCH_FS_error, &c->flags)) {
30418de09e6bda fs/bcachefs/recovery.c      Kent Overstreet 2023-11-13  799  		bch2_flush_fsck_errs(c);
30418de09e6bda fs/bcachefs/recovery.c      Kent Overstreet 2023-11-13  800  
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  801  		bch_info(c, "Fixed errors, running fsck a second time to verify fs is clean");
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  802  		errors_fixed = test_bit(BCH_FS_errors_fixed, &c->flags);
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  803  		clear_bit(BCH_FS_errors_fixed, &c->flags);
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  804  		clear_bit(BCH_FS_errors_fixed_silent, &c->flags);
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  805  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  806  		try(bch2_run_recovery_passes(c, BCH_RECOVERY_PASS_check_alloc_info));
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  807  
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  808  		if (errors_fixed ||
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  809  		    test_bit(BCH_FS_errors_not_fixed, &c->flags)) {
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  810  			bch_err(c, "Second fsck run was not clean");
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  811  			set_bit(BCH_FS_errors_not_fixed, &c->flags);
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  812  		}
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  813  
a34bc56df7c8a5 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-05  814  		if (errors_fixed)
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  815  			set_bit(BCH_FS_errors_fixed, &c->flags);
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  816  	}
b56b787c7d5e83 fs/bcachefs/recovery.c      Kent Overstreet 2023-08-02  817  
7b512638e03a1d fs/bcachefs/recovery.c      Kent Overstreet 2019-03-29  818  	if (enabled_qtypes(c)) {
619f5bee86b558 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-17  819  		bch_verbose(c, "reading quotas");
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  820  		try(bch2_fs_quota_read(c));
7b512638e03a1d fs/bcachefs/recovery.c      Kent Overstreet 2019-03-29  821  		bch_verbose(c, "quotas done");
7b512638e03a1d fs/bcachefs/recovery.c      Kent Overstreet 2019-03-29  822  	}
7b512638e03a1d fs/bcachefs/recovery.c      Kent Overstreet 2019-03-29  823  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  824  	scoped_guard(mutex, &c->sb_lock) {
ab69169ea6ba22 fs/bcachefs/recovery.c      Kent Overstreet 2025-08-02  825  		struct bch_sb_field_ext *ext = bch2_sb_field_get(c->disk_sb.sb, ext);
ab69169ea6ba22 fs/bcachefs/recovery.c      Kent Overstreet 2025-08-02  826  		bool write_sb = false;
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  827  
f87bf892ea9848 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  828  		if (BCH_SB_VERSION_UPGRADE_COMPLETE(c->disk_sb.sb) != le16_to_cpu(c->disk_sb.sb->version)) {
f87bf892ea9848 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  829  			SET_BCH_SB_VERSION_UPGRADE_COMPLETE(c->disk_sb.sb, le16_to_cpu(c->disk_sb.sb->version));
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  830  			write_sb = true;
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  831  		}
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  832  
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  833  		if (!test_bit(BCH_FS_error, &c->flags) &&
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  834  		    !(c->disk_sb.sb->compat[0] & cpu_to_le64(1ULL << BCH_COMPAT_alloc_info))) {
c0ebe3e48c75ab fs/bcachefs/recovery.c      Kent Overstreet 2021-05-23  835  			c->disk_sb.sb->compat[0] |= cpu_to_le64(1ULL << BCH_COMPAT_alloc_info);
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  836  			write_sb = true;
26609b619fa230 fs/bcachefs/recovery.c      Kent Overstreet 2018-11-01  837  		}
26609b619fa230 fs/bcachefs/recovery.c      Kent Overstreet 2018-11-01  838  
0a34c058fca84b fs/bcachefs/recovery.c      Kent Overstreet 2024-03-30  839  		if (!test_bit(BCH_FS_error, &c->flags) &&
27fcec6c27caec fs/bcachefs/recovery.c      Kent Overstreet 2024-03-30  840  		    !bch2_is_zero(ext->errors_silent, sizeof(ext->errors_silent))) {
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  841  			memset(ext->errors_silent, 0, sizeof(ext->errors_silent));
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  842  			write_sb = true;
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  843  		}
8b16413cda7c46 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-29  844  
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  845  		if (c->opts.fsck &&
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  846  		    !test_bit(BCH_FS_error, &c->flags) &&
68708efcac7119 fs/bcachefs/recovery.c      Kent Overstreet 2025-05-10  847  		    c->recovery.pass_done == BCH_RECOVERY_PASS_NR - 1 &&
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  848  		    ext->btrees_lost_data) {
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  849  			ext->btrees_lost_data = 0;
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  850  			write_sb = true;
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  851  		}
55936afe11077a fs/bcachefs/recovery.c      Kent Overstreet 2024-03-15  852  
0bc166ff564f9e fs/bcachefs/recovery.c      Kent Overstreet 2019-03-28  853  		if (c->opts.fsck &&
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  854  		    !test_bit(BCH_FS_error, &c->flags) &&
3c471b65889aa2 fs/bcachefs/recovery.c      Kent Overstreet 2023-11-26  855  		    !test_bit(BCH_FS_errors_not_fixed, &c->flags)) {
0bc166ff564f9e fs/bcachefs/recovery.c      Kent Overstreet 2019-03-28  856  			SET_BCH_SB_HAS_ERRORS(c->disk_sb.sb, 0);
aae15aafcd43ec fs/bcachefs/recovery.c      Kent Overstreet 2021-04-24  857  			SET_BCH_SB_HAS_TOPOLOGY_ERRORS(c->disk_sb.sb, 0);
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  858  			write_sb = true;
0bc166ff564f9e fs/bcachefs/recovery.c      Kent Overstreet 2019-03-28  859  		}
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  860  
f04158290d8bdd fs/bcachefs/recovery.c      Kent Overstreet 2024-04-20  861  		if (bch2_blacklist_entries_gc(c))
f04158290d8bdd fs/bcachefs/recovery.c      Kent Overstreet 2024-04-20  862  			write_sb = true;
f04158290d8bdd fs/bcachefs/recovery.c      Kent Overstreet 2024-04-20  863  
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  864  		if (!(c->sb.compat & BIT_ULL(BCH_COMPAT_no_stale_ptrs)) &&
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  865  		    (c->recovery.passes_complete & BIT_ULL(BCH_RECOVERY_PASS_check_extents)) &&
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  866  		    (c->recovery.passes_complete & BIT_ULL(BCH_RECOVERY_PASS_check_indirect_extents))) {
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  867  			c->disk_sb.sb->compat[0] |= cpu_to_le64(BIT_ULL(BCH_COMPAT_no_stale_ptrs));
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  868  			write_sb = true;
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  869  		}
4053532afa1c08 fs/bcachefs/recovery.c      Kent Overstreet 2025-09-07  870  
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  871  		if (write_sb)
932aa837453ada fs/bcachefs/recovery.c      Kent Overstreet 2019-03-11  872  			bch2_write_super(c);
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  873  	}
1dd7f9d98de074 fs/bcachefs/recovery.c      Kent Overstreet 2019-04-04  874  
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  875  	if (!(c->sb.compat & (1ULL << BCH_COMPAT_extents_above_btree_updates_done)) ||
73bd774d28d2b2 fs/bcachefs/recovery.c      Kent Overstreet 2023-07-06  876  	    c->sb.version_min < bcachefs_metadata_version_btree_ptr_sectors_written) {
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  877  		struct bch_move_stats stats;
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  878  
b2d1d56b1d34bc fs/bcachefs/recovery.c      Kent Overstreet 2022-11-13  879  		bch2_move_stats_init(&stats, "recovery");
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  880  
f0a5f22957fbf9 fs/bcachefs/recovery.c      Kent Overstreet 2025-07-14  881  		CLASS(printbuf, buf)();
fbf9270817249b fs/bcachefs/recovery.c      Kent Overstreet 2023-11-16  882  		bch2_version_to_text(&buf, c->sb.version_min);
fbf9270817249b fs/bcachefs/recovery.c      Kent Overstreet 2023-11-16  883  		bch_info(c, "scanning for old btree nodes: min_version %s", buf.buf);
fbf9270817249b fs/bcachefs/recovery.c      Kent Overstreet 2023-11-16  884  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  885  		try(bch2_fs_read_write_early(c));
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  886  		try(bch2_scan_old_btree_nodes(c, &stats));
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  887  		bch_info(c, "scanning for old btree nodes done");
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  888  	}
d93cf6858fe67a fs/bcachefs/recovery.c      Kent Overstreet 2021-12-27  889  
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  890  	if (test_bit(BCH_FS_need_delete_dead_snapshots, &c->flags) &&
62719cf33c3ad6 fs/bcachefs/recovery.c      Kent Overstreet 2023-12-23  891  	    !c->opts.nochanges) {
4ab35c34d5ab25 fs/bcachefs/recovery.c      Kent Overstreet 2022-07-14  892  		bch2_fs_read_write_early(c);
4ab35c34d5ab25 fs/bcachefs/recovery.c      Kent Overstreet 2022-07-14  893  		bch2_delete_dead_snapshots_async(c);
4ab35c34d5ab25 fs/bcachefs/recovery.c      Kent Overstreet 2022-07-14  894  	}
4932e07ea04bcc fs/bcachefs/recovery.c      Kent Overstreet 2021-04-24  895  fsck_err:
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  896  	return ret;
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  897  }
4f8305ce7dfa6f fs/bcachefs/init/recovery.c Kent Overstreet 2025-10-30  898  

:::::: The code at line 687 was first introduced by commit
:::::: adbcada43fa79197224b5a522b1faaf222b43bcd bcachefs: Don't require flush/fua on every journal write

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
