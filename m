Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA33112D3
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769320615; cv=none; b=qd1BBHAy7N6u+q+/FQQ12DzJjXa2Iuw2HJ5mHAqx7jvLDnp6zZmYsRJX4EVRoBPPLYkB9UjD9EWA/+5V/TiV4t53rF/9KX4T1DdGAM7ov0vKFg1AobI4GGkP0JRvGFfn9WJBlZwBtOZa+v2aYYihHcC+xmsNSq8IsTM4OFso2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769320615; c=relaxed/simple;
	bh=fmKn3LrfB+ZVxINtC2bE8WwMKc5ixxpLCQH0QHQNZ8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mxQD+xYhco2zv3uXuYjF+RgEQ9K5hHCZp0uFxh9HSDfOeExubnk3c+Gbr/DaDmHsP+5KcUpe6seX3avnEXImnPNjcjgSLCNIcNmJuikJuJbvG0PIxLwRgkBumhYwAnZ5xWH1RchXLKSwUrTtVAXqGbffeMJeoHitCifNxoM7WvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD90oh2F; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD90oh2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769320614; x=1800856614;
  h=date:from:to:cc:subject:message-id;
  bh=fmKn3LrfB+ZVxINtC2bE8WwMKc5ixxpLCQH0QHQNZ8U=;
  b=HD90oh2FNoBYphebMdx7H/Ds1jZs+lFg61Kj8bm5ztYKFbrOJWPk0Psy
   RMLbeS4FZ4p9v2/dNnAyBrIO8XYZydLevGZbibrcvAbFXdxJChdMan+qX
   VwWqW2CL/WgT+IMXHAUfro0dRURqnXty2qOEhLX/n/JWXr1RutdGQCCee
   QwqPUx+hoIpMZ4SulcFQMqQyvvLU0EN9d+ZFexFe03dYtBjAuB8v8uYPT
   tIOP0qLRYLXtZ67sipAnnSHFfGICOVjBxdjNlYDYZelKbFYE54et6C0ps
   /Qfvw8IvNiWjCpaZNf/PyjCQVi45/Y9sSlbS5MIANIHpdPvLk7pnWiurB
   g==;
X-CSE-ConnectionGUID: 4uv+5ldURQCStmxFWbqvlQ==
X-CSE-MsgGUID: ZPsx0lEtQNuB6i9uqgJQeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70240945"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70240945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 21:56:53 -0800
X-CSE-ConnectionGUID: zwwi1I2qRRWjtHnBE9h0JQ==
X-CSE-MsgGUID: GbdmAExhRy+PTW0QyNuqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="212243469"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2026 21:56:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjt7B-00000000Vp4-0TZS;
	Sun, 25 Jan 2026 05:56:49 +0000
Date: Sun, 25 Jan 2026 13:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 258/262]
 fs/bcachefs/data/ec/io.c:504 bch2_ec_read_extent() warn: inconsistent returns
 'trans'.
Message-ID: <202601251615.tfb7qPKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   26d354463350027a7ec8b3f79128052d1d956fb0
commit: 2ec73868586dfa0987eace53b249af440d5d7612 [258/262] bcachefs: Improve bch2_ec_read_extent()
:::::: branch date: 12 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251615.tfb7qPKI-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601251615.tfb7qPKI-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/ec/io.c:504 bch2_ec_read_extent() warn: inconsistent returns 'trans'.

vim +/trans +504 fs/bcachefs/data/ec/io.c

bde39b90107558a Kent Overstreet 2026-01-17  432  
bde39b90107558a Kent Overstreet 2026-01-17  433  int bch2_ec_read_extent(struct btree_trans *trans, struct bch_read_bio *rbio,
bde39b90107558a Kent Overstreet 2026-01-17  434  			struct bkey_s_c orig_k)
bde39b90107558a Kent Overstreet 2026-01-17  435  {
2ec73868586dfa0 Kent Overstreet 2026-01-24  436  	/*
2ec73868586dfa0 Kent Overstreet 2026-01-24  437  	 * We need the original extent to read to still be locked when we check
2ec73868586dfa0 Kent Overstreet 2026-01-24  438  	 * for non-spurious stale stripe pointers
2ec73868586dfa0 Kent Overstreet 2026-01-24  439  	 */
2ec73868586dfa0 Kent Overstreet 2026-01-24  440  	try(bch2_trans_relock(trans));
2ec73868586dfa0 Kent Overstreet 2026-01-24  441  
bde39b90107558a Kent Overstreet 2026-01-17  442  	struct bch_fs *c = trans->c;
bde39b90107558a Kent Overstreet 2026-01-17  443  
bde39b90107558a Kent Overstreet 2026-01-17  444  	BUG_ON(!rbio->pick.has_ec);
bde39b90107558a Kent Overstreet 2026-01-17  445  
2ec73868586dfa0 Kent Overstreet 2026-01-24  446  	struct ec_stripe_buf *buf __free(ec_stripe_buf_free) = kzalloc(sizeof(*buf), GFP_KERNEL);
bde39b90107558a Kent Overstreet 2026-01-17  447  	if (!buf)
bde39b90107558a Kent Overstreet 2026-01-17  448  		return bch_err_throw(c, ENOMEM_ec_read_extent);
bde39b90107558a Kent Overstreet 2026-01-17  449  
bde39b90107558a Kent Overstreet 2026-01-17  450  	int ret = lockrestart_do(trans, get_stripe_key_trans(trans, rbio->pick.ec.idx, buf));
bde39b90107558a Kent Overstreet 2026-01-17  451  	if (ret)
bde39b90107558a Kent Overstreet 2026-01-17  452  		return stripe_reconstruct_err(c, orig_k, "stripe not found");
bde39b90107558a Kent Overstreet 2026-01-17  453  
bde39b90107558a Kent Overstreet 2026-01-17  454  	struct bch_stripe *v = &bkey_i_to_stripe(&buf->key)->v;
bde39b90107558a Kent Overstreet 2026-01-17  455  	if (!bch2_ptr_matches_stripe(v, rbio->pick))
bde39b90107558a Kent Overstreet 2026-01-17  456  		return stripe_reconstruct_err(c, orig_k, "pointer doesn't match stripe");
bde39b90107558a Kent Overstreet 2026-01-17  457  
bde39b90107558a Kent Overstreet 2026-01-17  458  	unsigned offset = rbio->bio.bi_iter.bi_sector - v->ptrs[rbio->pick.ec.block].offset;
bde39b90107558a Kent Overstreet 2026-01-17  459  	if (offset + bio_sectors(&rbio->bio) > le16_to_cpu(v->sectors))
bde39b90107558a Kent Overstreet 2026-01-17  460  		return stripe_reconstruct_err(c, orig_k, "read is bigger than stripe");
bde39b90107558a Kent Overstreet 2026-01-17  461  
2ec73868586dfa0 Kent Overstreet 2026-01-24  462  	/* Check for stale pointers while we still have btree locks held */
2ec73868586dfa0 Kent Overstreet 2026-01-24  463  	bool have_stale = false;
2ec73868586dfa0 Kent Overstreet 2026-01-24  464  	scoped_guard(rcu) {
2ec73868586dfa0 Kent Overstreet 2026-01-24  465  		for (unsigned i = 0; i < v->nr_blocks; i++) {
2ec73868586dfa0 Kent Overstreet 2026-01-24  466  			struct bch_dev *ca = bch2_dev_rcu_noerror(c, v->ptrs[i].dev);
2ec73868586dfa0 Kent Overstreet 2026-01-24  467  			if (ca && dev_ptr_stale(ca, &v->ptrs[i])) {
2ec73868586dfa0 Kent Overstreet 2026-01-24  468  				__set_bit(i, buf->stale);
2ec73868586dfa0 Kent Overstreet 2026-01-24  469  				have_stale = true;
2ec73868586dfa0 Kent Overstreet 2026-01-24  470  			}
2ec73868586dfa0 Kent Overstreet 2026-01-24  471  		}
2ec73868586dfa0 Kent Overstreet 2026-01-24  472  	}
2ec73868586dfa0 Kent Overstreet 2026-01-24  473  
2ec73868586dfa0 Kent Overstreet 2026-01-24  474  	if (have_stale) {
2ec73868586dfa0 Kent Overstreet 2026-01-24  475  		CLASS(bch_log_msg_ratelimited, msg)(c);
2ec73868586dfa0 Kent Overstreet 2026-01-24  476  		prt_printf(&msg.m, "Stripe with stale pointer(s):\n");
2ec73868586dfa0 Kent Overstreet 2026-01-24  477  		bch2_bkey_val_to_text(&msg.m, c, bkey_i_to_s_c(&buf->key));
2ec73868586dfa0 Kent Overstreet 2026-01-24  478  
2ec73868586dfa0 Kent Overstreet 2026-01-24  479  		bch2_count_fsck_err(c, stale_dirty_ptr, &msg.m);
2ec73868586dfa0 Kent Overstreet 2026-01-24  480  		bch2_run_explicit_recovery_pass(c, &msg.m, BCH_RECOVERY_PASS_check_allocations, 0);
2ec73868586dfa0 Kent Overstreet 2026-01-24  481  	}
2ec73868586dfa0 Kent Overstreet 2026-01-24  482  
338d415ab4ad7f8 Kent Overstreet 2026-01-23  483  	/* Don't hold btree locks for stripe buffer allocations, or IO */
338d415ab4ad7f8 Kent Overstreet 2026-01-23  484  	bch2_trans_unlock(trans);
338d415ab4ad7f8 Kent Overstreet 2026-01-23  485  
bde39b90107558a Kent Overstreet 2026-01-17  486  	ret = bch2_ec_stripe_buf_init(c, buf, offset, bio_sectors(&rbio->bio));
bde39b90107558a Kent Overstreet 2026-01-17  487  	if (ret)
bde39b90107558a Kent Overstreet 2026-01-17  488  		return stripe_reconstruct_err(c, orig_k, "-ENOMEM");
bde39b90107558a Kent Overstreet 2026-01-17  489  
3e5348ee5858246 Kent Overstreet 2026-01-23  490  	bch2_stripe_buf_read(c, buf);
bde39b90107558a Kent Overstreet 2026-01-17  491  
2ec73868586dfa0 Kent Overstreet 2026-01-24  492  	ret = bch2_stripe_buf_validate(c, buf);
2ec73868586dfa0 Kent Overstreet 2026-01-24  493  	if (ret) {
2ec73868586dfa0 Kent Overstreet 2026-01-24  494  		for (unsigned i = 0; i < v->nr_blocks; i++)
2ec73868586dfa0 Kent Overstreet 2026-01-24  495  			if (buf->err[i] == -BCH_ERR_stripe_read_ptr_stale &&
2ec73868586dfa0 Kent Overstreet 2026-01-24  496  			    !test_bit(i, buf->stale))
2ec73868586dfa0 Kent Overstreet 2026-01-24  497  				ret = bch_err_throw(c, data_read_ptr_stale_race);
2ec73868586dfa0 Kent Overstreet 2026-01-24  498  		bch_err_fn(c, ret);
2ec73868586dfa0 Kent Overstreet 2026-01-24  499  		return ret;
2ec73868586dfa0 Kent Overstreet 2026-01-24  500  	}
bde39b90107558a Kent Overstreet 2026-01-17  501  
bde39b90107558a Kent Overstreet 2026-01-17  502  	memcpy_to_bio(&rbio->bio, rbio->bio.bi_iter,
bde39b90107558a Kent Overstreet 2026-01-17  503  		      buf->data[rbio->pick.ec.block] + ((offset - buf->offset) << 9));
bde39b90107558a Kent Overstreet 2026-01-17 @504  	return 0;

:::::: The code at line 504 was first introduced by commit
:::::: bde39b90107558a6e5c84934716bf171ced1cef5 bcachefs: Split up data/ec.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
