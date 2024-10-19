Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672D7BAEC
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729320628; cv=none; b=WkbMaqHqQoH4xPg8C2Pcg/PQvI8ABBXnSSyO8Qbom5Lm+5+T34yfBHnXddHcRSV9XJWPVPSlaAMZc3SZTmXJsFz7OxK8lUbxFDnWb+XflF9Cnpb7JXKgURlZ8QhNDahClrxzmVaRv6FE5UsKGYQspmVPB4w95IQ+1SrM7m0iMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729320628; c=relaxed/simple;
	bh=LFmaW/PlKUCJ/yI0NA5Am3HTKxTwNvCGkx6+6N2ex6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGyJav8n09Eu+GPcdznW/jl1stOU8VGyHZttqzsEOUtryLYF/R90CfUiy4zbWZ9rpW26wLUiBABIpCwH/7LJuqQLSr29mZeheLjhnC8TRsFz0ymsKtB8S+GCJwa/e7P2FOzf81P+R9v0te/e7UFjwMiYxJbdc+pG60PMnwuBlew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3uc8BYy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3uc8BYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729320626; x=1760856626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFmaW/PlKUCJ/yI0NA5Am3HTKxTwNvCGkx6+6N2ex6k=;
  b=O3uc8BYyEaTTB91MIoqvmHABIioiVvk4zZKbfkRs/oMN+gwZsDEspZ3d
   yJlyC8mvUbqVeSxLoYnCSkMupJw1Iv836mzACuicS4geAfCAMK+zhzZZl
   i0LsL5gMacNSCNY+bfNg02GBCNtEJ40+1B6Y/UkCVHJcTZSJC9+2pBJKZ
   HED23bhsnNNyOo6vpoWSoYRDyyAHnRQestd/Rqs1FsAYVGRdcq0JDUiQO
   ceeNEu21VrHyDKD4wqg3Ib7sW5nS5pMtJDHVNCQO9iufdjEtxJkppZpA1
   v2e5mDbmWLafJzW8mqDpUc9wgH+/qBmUTQq6sf3BQtDkthplaYZPeuY4C
   Q==;
X-CSE-ConnectionGUID: q5Q2oADRQx+y94Un+W+bfQ==
X-CSE-MsgGUID: f53HQ/eyRqqaFpkqVFMKBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28738370"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="28738370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 23:50:25 -0700
X-CSE-ConnectionGUID: siK4ax9gRy2SKK37mPdl3A==
X-CSE-MsgGUID: g7M4eUrrTt6ttPDEz4NmPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="78649671"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 23:50:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t23I5-000OlR-3C;
	Sat, 19 Oct 2024 06:50:21 +0000
Date: Sat, 19 Oct 2024 14:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/ec.c:1233 ec_stripe_key_update() error: we previously
 assumed 'old' could be null (see line 1213)
Message-ID: <202410191433.GaLmzKC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: cb6055e66faa0d4c15587ef67be18bc199aef085 bcachefs: Handle race between stripe reuse, invalidate_stripe_to_dev
date:   5 days ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 days ago
config: sparc-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241019/202410191433.GaLmzKC3-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191433.GaLmzKC3-lkp@intel.com/

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
