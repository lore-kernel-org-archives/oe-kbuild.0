Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75796221F0C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709242; cv=none; b=eZsXYtzVsiqiM6RtSeTBUdcNek5lcSE97dLemH6R8nNWszkIs9La/UVkZnTN6Nvr1lfiexONqNKiElJgX8jUTVjoAR7Ruc9cZIFbJifHoL2Kldpy4tTm7Nr2IGPqMXnAxf4ZGOUCU7InPhS9QZ+M+G6dY0NT0vlnFv69fYda6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709242; c=relaxed/simple;
	bh=kIEVr+rTCDkiEIl/Xe3XdAaLg6n1f0cUso/BFV1hi2A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTqri7LSeMRCA5JYnBrqOmwpJGkm9mZPvZ/08v9P8R9dlX25Bhade5a5C4fvC6pTwxFCnitt4d+HpDEZPrkB+62YOQalZIkEadcQNbKK8no6t+1fCJufRCngJvi/fD2LEFWpJvCO+ZsO58thm+5CuNe6H8qRRESIVT+MSrC54/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAwa7TI6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAwa7TI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764709240; x=1796245240;
  h=date:from:to:subject:message-id:mime-version;
  bh=kIEVr+rTCDkiEIl/Xe3XdAaLg6n1f0cUso/BFV1hi2A=;
  b=NAwa7TI6ViWxZDeyJO3qKBAWR0JBoLeyYc3E6DWC8U0S5d3X6J66y2zC
   oPXW8CoRVuce/CMQbxOMQCc2WAjA/++fPOgP2WwUjJB2P/GM51ysp/eXQ
   Zw1aj215cx+gOGRkbh7vd1X8aVvXdwkLD0HWrsW8wrfvND1y1ma5VXrJv
   rtN0hwaTWwQXCzoIUjh92X6DGi15nJto31mhbZF3oBqvCBS75574GE6nS
   wJfPnGyML1sivKIxfFCWuw7ukn3F8azrHO9GOT89cqC9LlZnb4KC3iYwP
   wlbgp0KtrzgszOHjQjzAXAMaCxTMbjiIgb37qYHm9VHltBE1sjlIrJjEl
   Q==;
X-CSE-ConnectionGUID: fZWEQhKHSlGj3MYznWJwlQ==
X-CSE-MsgGUID: eFAJ8tPPQ/WHGKMSYRyXVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77315923"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77315923"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 13:00:40 -0800
X-CSE-ConnectionGUID: gCh+GVCtS1eaTIzN8yCUFg==
X-CSE-MsgGUID: KEik6FTBS2qpfWYaz3r5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194471435"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2025 13:00:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQXUC-000000002yD-3TFR
	for oe-kbuild@lists.linux.dev;
	Tue, 02 Dec 2025 21:00:36 +0000
Date: Tue, 2 Dec 2025 22:00:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/992 1/2] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512022149.CK864EuH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jpsollie <janpieter.sollie@edpnet.be>

tree:   https://github.com/koverstreet/bcachefs pr/992
head:   39aff98c65bacc4dcd96c8ac030646bca1bfb183
commit: c311121b11316292213fa8f0e4761b6912eb338c [1/2] Revert "Remove bcachefs core code"
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512022149.CK864EuH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#18392: FILE: fs/bcachefs/btree_cache.c:520:
+			--touched;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#23028: FILE: fs/bcachefs/btree_io.c:2023:
+	bch2_bkey_buf_exit(&scrub->key, c);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#26747: FILE: fs/bcachefs/btree_iter.c:2749:
+	iter->pos = bpos_min(iter->pos, k.k->p);;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#28795: FILE: fs/bcachefs/btree_iter.h:987:
+typedef struct btree_trans * class_btree_trans_t;

ERROR:SPACING: space required before the open brace '{'
#33607: FILE: fs/bcachefs/btree_trans_commit.c:720:
+		if (unlikely(ret)){

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#34500: FILE: fs/bcachefs/btree_types.h:486:
+	u16			size;;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#43606: FILE: fs/bcachefs/chardev.h:18:
+				unsigned cmd, void __user * arg)

ERROR:SPACING: space required before that '*' (ctx:VxV)
#46643: FILE: fs/bcachefs/data_update.c:736:
+	m->bvecs = kmalloc_array(nr_vecs, sizeof*(m->bvecs), GFP_KERNEL);
 	                                        ^

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#48137: FILE: fs/bcachefs/dirent.c:46:
+	u64 last_u64 = ((u64*)d.v)[bkey_u64s - 1];

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#59889: FILE: fs/bcachefs/fast_list.h:12:
+	struct ida		slots_allocated;;

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#69884: FILE: fs/bcachefs/fsck.c:2179:
+		prt_printf(&buf, "subvol with wrong fs_path_parent, should be be %u\n",

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#73620: FILE: fs/bcachefs/io_misc.c:418:
+	switch (op->v.state) {
+case LOGGED_OP_FINSERT_start:
[...]
+case LOGGED_OP_FINSERT_shift_extents:
[...]
+case LOGGED_OP_FINSERT_finish:

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#78920: FILE: fs/bcachefs/journal.c:1325:
+	u64 *new_buckets = kcalloc(ja->nr, sizeof(u64), GFP_KERNEL);;

WARNING:MINMAX: min() should probably be min_t(size_t, bch2_nr_btree_keys_need_flush(c), 128)
#82975: FILE: fs/bcachefs/journal_reclaim.c:723:
+		min_key_cache = min(bch2_nr_btree_keys_need_flush(c), (size_t) 128);

ERROR:SPACING: space required before that '*' (ctx:OxV)
#89765: FILE: fs/bcachefs/opts.c:260:
+		.set_sb		= type_compatible_or_null(SET_##_sb_opt,*SET_BCH2_NO_SB_OPT),	\
 		       		                                        ^

ERROR:SPACING: space required before that '*' (ctx:OxV)
#89767: FILE: fs/bcachefs/opts.c:262:
+		.set_member	= type_compatible_or_null(SET_##_sb_opt,*SET_BCH2_NO_MEMBER_OPT),\
 		           	                                        ^

WARNING:REPEATED_WORD: Possible repeated word: 'lock'
#103495: FILE: fs/bcachefs/six.h:239:
+ * six_lock_ip - take a six lock lock

WARNING:REPEATED_WORD: Possible repeated word: 'lock'
#103515: FILE: fs/bcachefs/six.h:259:
+ * six_lock_type - take a six lock lock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
