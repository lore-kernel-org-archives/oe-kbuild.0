Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6523EA83
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765555883; cv=none; b=tUVab4QaLqG+RfjWDJqo5IVYKAILhKoDvf7D5aejzZw2lgl/7jfUckrLS/zh9guxqZCk33CQ6ko2jYzKOAs1D25v/pCaJmbBGyT7jgFDOuqFA3ZgFbxtLHtIwoNZYFJOfwEyIyGwxlvllmHbBAYn7rKbd2koknpDMXTJFdLWm+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765555883; c=relaxed/simple;
	bh=DG9AVsqCbQhmZD2FzHcrTVeUUuNaUVVaQtFe+xS+hAI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o01ARVxWe3jBamrNHXhIyMNjNmgwn2tXhh1D67Ba4kIE+IjV6uzrplqGPdbaWiNuDERyUnK3HKJz0veoMhmLnyRIa9xUMFiw1XqNTgdKJ3QaJryIRirOEJGGeRa5Sg19Nuu3FHzTtB3cuSAsvcuqeSU1PU2hexNpoi6fgxt5BCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIgJOv3V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIgJOv3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765555882; x=1797091882;
  h=date:from:to:subject:message-id:mime-version;
  bh=DG9AVsqCbQhmZD2FzHcrTVeUUuNaUVVaQtFe+xS+hAI=;
  b=NIgJOv3Vvfa6FI7wC78fXHmIF02Kev0eE+qo0eG7VMTw/QdbFRiSQbJQ
   eVpCF9GlvjcPo4cI1a6y+FpEUgg/joijQGzWMDCHOizm+c4FY179LY2S2
   6q2A/FqhZcJ4bnEkvvBwbDk13s/rTOXi0uh5a1SBzXRraAzznP/weznlD
   WEMpaHl9NH8qBdxGgzT/NsYHi7w0zw28Jx833l5linjjIRdNkYRpRBNdn
   7TyHXCr2EMjfGFhFfD2rBMwa/qHKeQk3Y6WPpScm9N7nqPmqjLx+qYOlr
   pyCkv5+5NiSaNMess/Z06hc/p0lgNtqreilBZuKnR8mMYK9BwVZyKzfBv
   A==;
X-CSE-ConnectionGUID: UI0vPo9SS4Cyc7XJYAQKbg==
X-CSE-MsgGUID: z8KXKNSKTwKkTnwALnaouQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79017078"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="79017078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 08:11:17 -0800
X-CSE-ConnectionGUID: vewIPqdDRWu1JKq4o0jz8A==
X-CSE-MsgGUID: QMSH4pfeTk+yo2ZBGQWAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202045179"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 08:11:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU5jd-000000001lA-1suQ
	for oe-kbuild@lists.linux.dev;
	Fri, 12 Dec 2025 16:11:13 +0000
Date: Fri, 12 Dec 2025 17:10:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/992 1/2] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512121753.PXW3xpdA-lkp@intel.com>
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
head:   a744c170d883e5e8085eca560317e8683bb5f159
commit: dc932f40ad7647081d91eb8d54c72e082e5916ec [1/2] Revert "Remove bcachefs core code"
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512121753.PXW3xpdA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#18395: FILE: fs/bcachefs/btree_cache.c:520:
+			--touched;;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#23031: FILE: fs/bcachefs/btree_io.c:2023:
+	bch2_bkey_buf_exit(&scrub->key, c);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#26750: FILE: fs/bcachefs/btree_iter.c:2749:
+	iter->pos = bpos_min(iter->pos, k.k->p);;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#28798: FILE: fs/bcachefs/btree_iter.h:987:
+typedef struct btree_trans * class_btree_trans_t;

ERROR:SPACING: space required before the open brace '{'
#33610: FILE: fs/bcachefs/btree_trans_commit.c:720:
+		if (unlikely(ret)){

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#34503: FILE: fs/bcachefs/btree_types.h:486:
+	u16			size;;

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#43609: FILE: fs/bcachefs/chardev.h:18:
+				unsigned cmd, void __user * arg)

ERROR:SPACING: space required before that '*' (ctx:VxV)
#46646: FILE: fs/bcachefs/data_update.c:736:
+	m->bvecs = kmalloc_array(nr_vecs, sizeof*(m->bvecs), GFP_KERNEL);
 	                                        ^

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#48140: FILE: fs/bcachefs/dirent.c:46:
+	u64 last_u64 = ((u64*)d.v)[bkey_u64s - 1];

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#59892: FILE: fs/bcachefs/fast_list.h:12:
+	struct ida		slots_allocated;;

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#69887: FILE: fs/bcachefs/fsck.c:2179:
+		prt_printf(&buf, "subvol with wrong fs_path_parent, should be be %u\n",

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#73623: FILE: fs/bcachefs/io_misc.c:418:
+	switch (op->v.state) {
+case LOGGED_OP_FINSERT_start:
[...]
+case LOGGED_OP_FINSERT_shift_extents:
[...]
+case LOGGED_OP_FINSERT_finish:

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#78923: FILE: fs/bcachefs/journal.c:1325:
+	u64 *new_buckets = kcalloc(ja->nr, sizeof(u64), GFP_KERNEL);;

WARNING:MINMAX: min() should probably be min_t(size_t, bch2_nr_btree_keys_need_flush(c), 128)
#82978: FILE: fs/bcachefs/journal_reclaim.c:723:
+		min_key_cache = min(bch2_nr_btree_keys_need_flush(c), (size_t) 128);

ERROR:SPACING: space required before that '*' (ctx:OxV)
#89768: FILE: fs/bcachefs/opts.c:260:
+		.set_sb		= type_compatible_or_null(SET_##_sb_opt,*SET_BCH2_NO_SB_OPT),	\
 		       		                                        ^

ERROR:SPACING: space required before that '*' (ctx:OxV)
#89770: FILE: fs/bcachefs/opts.c:262:
+		.set_member	= type_compatible_or_null(SET_##_sb_opt,*SET_BCH2_NO_MEMBER_OPT),\
 		           	                                        ^

WARNING:REPEATED_WORD: Possible repeated word: 'lock'
#103498: FILE: fs/bcachefs/six.h:239:
+ * six_lock_ip - take a six lock lock

WARNING:REPEATED_WORD: Possible repeated word: 'lock'
#103518: FILE: fs/bcachefs/six.h:259:
+ * six_lock_type - take a six lock lock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
