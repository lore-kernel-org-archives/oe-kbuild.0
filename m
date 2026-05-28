Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2B175A9C
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 01:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779932083; cv=none; b=ttHnRVYd5tiCAqfCjNOqUF5rkLPRj9GtPfiP45Elq6jUgQv3Z/jVqFsRPn+0UMRoPAwStEGOnJt2p3zLDl4X1e3gNRCEx+NE7895V2v3u5hfDF6jJNkZujWYpoIhW/WIvf3XtZH4rfJKr3KDD1eCACBSl7cwOyg7z8n+KZfzVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779932083; c=relaxed/simple;
	bh=7zvtM7Bt1lQDg5V78R/tDpJBXWRngqdE84ewjZDpqvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g2SeChZ+6ssX4HPv8fr7+97hH91zNRIcORfGPJzuED5oY6JF4rYJ+Don3xUQ0++h34Bqd+iX8LsdS+A3GN1TiZdku8sD/C7/BhUib18HHrRwwqYk5XbFfy740vo1iupv1yOKfdHBZxqT1y4tdSOzS2CeOVR35K0j8AdZFm43MUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YE1wb5ob; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YE1wb5ob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779932081; x=1811468081;
  h=date:from:to:cc:subject:message-id;
  bh=7zvtM7Bt1lQDg5V78R/tDpJBXWRngqdE84ewjZDpqvw=;
  b=YE1wb5oblP5nN5zfEvLu/WuKrq5+feJQ6tSUwzWtrkL9wd2gCO19aAut
   +urC9REx99PgPWeb5YIw2xvkVTdJW8JUrqweHP6Uw2cdsxjuP5rb+6o/b
   DyAHNiPyL5WBPhvmIZ480AUboqHuFIaP05XqyUQpqBQhkuhrLt9rr2OSm
   mG0ZFgmjQiSjhgPypi82DGwWlYcgHj3r5HO+P8AKJd8u5RVvU5rH04WsV
   KggkuvHcH0A7J97tIx4XR0eeY6koatYJn434rYjGpHv1jZsBFXMuy0cPw
   /qRDxlTtLQvPedU37VsUWgv78Ji8q5EBTr2/YNikCJu7VNGfqggpotW/N
   w==;
X-CSE-ConnectionGUID: 91aMpvtfRiOhQkgexy8mzQ==
X-CSE-MsgGUID: 0GglE2o1RmWl5nDacatxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106224943"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="106224943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:34:41 -0700
X-CSE-ConnectionGUID: QSejOCbhQJK5M/O9M0+OJw==
X-CSE-MsgGUID: Z7mrwPNrSHeFDttSjoBWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="272743153"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 May 2026 18:34:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSPdt-000000005PU-0PgW;
	Thu, 28 May 2026 01:34:37 +0000
Date: Thu, 28 May 2026 09:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-lts 2/2]
 fs/bcachefs/ec.c:1233 ec_stripe_key_update() error: we previously assumed
 'old' could be null (see line 1213)
Message-ID: <202605280947.hqVDmvx1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: cb6055e66faa0d4c15587ef67be18bc199aef085 [2/2] bcachefs: Handle race between stripe reuse, invalidate_stripe_to_dev
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260528/202605280947.hqVDmvx1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cb6055e66faa ("bcachefs: Handle race between stripe reuse, invalidate_stripe_to_dev")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605280947.hqVDmvx1-lkp@intel.com/

New smatch warnings:
fs/bcachefs/ec.c:1233 ec_stripe_key_update() error: we previously assumed 'old' could be null (see line 1213)

Old smatch warnings:
fs/bcachefs/ec.c:430 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 408)
fs/bcachefs/ec.c:2171 bch2_ec_stripe_head_get() error: we previously assumed 'h->s' could be null (see line 2163)

vim +/old +1233 fs/bcachefs/ec.c

dfe9bfb32e380d Kent Overstreet 2018-11-24  1207  
4b1e669995a6c1 Kent Overstreet 2023-02-18  1208  static int ec_stripe_key_update(struct btree_trans *trans,
cb6055e66faa0d Kent Overstreet 2024-10-13  1209  				struct bkey_i_stripe *old,
cb6055e66faa0d Kent Overstreet 2024-10-13  1210  				struct bkey_i_stripe *new)
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1211  {
4b1e669995a6c1 Kent Overstreet 2023-02-18  1212  	struct bch_fs *c = trans->c;
cb6055e66faa0d Kent Overstreet 2024-10-13 @1213  	bool create = !old;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1214  
cb6055e66faa0d Kent Overstreet 2024-10-13  1215  	struct btree_iter iter;
cb6055e66faa0d Kent Overstreet 2024-10-13  1216  	struct bkey_s_c k = bch2_bkey_get_iter(trans, &iter, BTREE_ID_stripes,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  1217  					       new->k.p, BTREE_ITER_intent);
cb6055e66faa0d Kent Overstreet 2024-10-13  1218  	int ret = bkey_err(k);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1219  	if (ret)
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1220  		goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1221  
cb6055e66faa0d Kent Overstreet 2024-10-13  1222  	if (bch2_fs_inconsistent_on(k.k->type != (create ? KEY_TYPE_deleted : KEY_TYPE_stripe),
cb6055e66faa0d Kent Overstreet 2024-10-13  1223  				    c, "error %s stripe: got existing key type %s",
4b1e669995a6c1 Kent Overstreet 2023-02-18  1224  				    create ? "creating" : "updating",
cb6055e66faa0d Kent Overstreet 2024-10-13  1225  				    bch2_bkey_types[k.k->type])) {
4b1e669995a6c1 Kent Overstreet 2023-02-18  1226  		ret = -EINVAL;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1227  		goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1228  	}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1229  
4b1e669995a6c1 Kent Overstreet 2023-02-18  1230  	if (k.k->type == KEY_TYPE_stripe) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1231  		const struct bch_stripe *v = bkey_s_c_to_stripe(k).v;
cb6055e66faa0d Kent Overstreet 2024-10-13  1232  
cb6055e66faa0d Kent Overstreet 2024-10-13 @1233  		BUG_ON(old->v.nr_blocks != new->v.nr_blocks);
cb6055e66faa0d Kent Overstreet 2024-10-13  1234  		BUG_ON(old->v.nr_blocks != v->nr_blocks);
cb6055e66faa0d Kent Overstreet 2024-10-13  1235  
cb6055e66faa0d Kent Overstreet 2024-10-13  1236  		for (unsigned i = 0; i < new->v.nr_blocks; i++) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1237  			unsigned sectors = stripe_blockcount_get(v, i);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1238  
cb6055e66faa0d Kent Overstreet 2024-10-13  1239  			if (!bch2_extent_ptr_eq(old->v.ptrs[i], new->v.ptrs[i]) && sectors) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1240  				struct printbuf buf = PRINTBUF;
cb6055e66faa0d Kent Overstreet 2024-10-13  1241  
cb6055e66faa0d Kent Overstreet 2024-10-13  1242  				prt_printf(&buf, "stripe changed nonempty block %u", i);
cb6055e66faa0d Kent Overstreet 2024-10-13  1243  				prt_str(&buf, "\nold: ");
cb6055e66faa0d Kent Overstreet 2024-10-13  1244  				bch2_bkey_val_to_text(&buf, c, k);
cb6055e66faa0d Kent Overstreet 2024-10-13  1245  				prt_str(&buf, "\nnew: ");
cb6055e66faa0d Kent Overstreet 2024-10-13  1246  				bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&new->k_i));
cb6055e66faa0d Kent Overstreet 2024-10-13  1247  				bch2_fs_inconsistent(c, "%s", buf.buf);
cb6055e66faa0d Kent Overstreet 2024-10-13  1248  				printbuf_exit(&buf);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1249  				ret = -EINVAL;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1250  				goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1251  			}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1252  
cb6055e66faa0d Kent Overstreet 2024-10-13  1253  			/*
cb6055e66faa0d Kent Overstreet 2024-10-13  1254  			 * If the stripe ptr changed underneath us, it must have
cb6055e66faa0d Kent Overstreet 2024-10-13  1255  			 * been dev_remove_stripes() -> * invalidate_stripe_to_dev()
cb6055e66faa0d Kent Overstreet 2024-10-13  1256  			 */
cb6055e66faa0d Kent Overstreet 2024-10-13  1257  			if (!bch2_extent_ptr_eq(old->v.ptrs[i], v->ptrs[i])) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1258  				BUG_ON(v->ptrs[i].dev != BCH_SB_MEMBER_INVALID);
9d32097f3b6617 Kent Overstreet 2023-03-03  1259  
cb6055e66faa0d Kent Overstreet 2024-10-13  1260  				if (bch2_extent_ptr_eq(old->v.ptrs[i], new->v.ptrs[i]))
cb6055e66faa0d Kent Overstreet 2024-10-13  1261  					new->v.ptrs[i].dev = BCH_SB_MEMBER_INVALID;
cb6055e66faa0d Kent Overstreet 2024-10-13  1262  			}
9d32097f3b6617 Kent Overstreet 2023-03-03  1263  
cb6055e66faa0d Kent Overstreet 2024-10-13  1264  			stripe_blockcount_set(&new->v, i, sectors);
9d32097f3b6617 Kent Overstreet 2023-03-03  1265  		}
4b1e669995a6c1 Kent Overstreet 2023-02-18  1266  	}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1267  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1268  	ret = bch2_trans_update(trans, &iter, &new->k_i, 0);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1269  err:
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1270  	bch2_trans_iter_exit(trans, &iter);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1271  	return ret;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1272  }
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1273  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
