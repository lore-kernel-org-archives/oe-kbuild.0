Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0C630
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTg8w4+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237349; x=1730773349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUy5sBfcepRSY5GgiZIhk7Q+ya92Rj83yjUgVFQ1SPA=;
  b=hTg8w4+5LHZr4Q6lPgr0IgJxzUcsWD41eD/dDzdwqaqxe/6wPNncPQwm
   KLFQR/HQsFTJHcb69sgXhes4tjoZ32TjkuzXvT9q8HDo0KH3P2JhtrPdl
   CDZt7pJumuIaHThh3MFWGV0NHb/TRyRtK7QlU/FmIFxYIIBqzLQtBom59
   3NMZbYLxObr7UBuSJN3TIISFbZFJakq3cCSpKotV1SwhfKkaMyNDM+Z9w
   9NlEudntgeOJBnpVACuI+yJvo2NWzLl8b1hX6sPdfKQNB9EWuc+ZaZyMS
   /aCTkrMNtF0Q8+icrcokT0TMzmPLdG1+Fqo7UcRnV4iuBHM/ZlL76Lsbz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393092709"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="393092709"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755711515"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="755711515"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Nov 2023 18:22:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpFu-00060m-30;
	Mon, 06 Nov 2023 02:22:22 +0000
Date: Mon, 6 Nov 2023 10:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_io.c:685 validate_bset() warn: was '== 1' instead
 of '='
Message-ID: <202311060909.WMA8kLss-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 494dcc57a7bf639c39364b5f84c1b6db39a0f83a bcachefs: Plumb saw_error through to btree_err()
date:   2 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060909.WMA8kLss-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060909.WMA8kLss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311060909.WMA8kLss-lkp@intel.com/

New smatch warnings:
fs/bcachefs/btree_io.c:685 validate_bset() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:823 validate_bset_keys() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:1334 btree_node_read_all_replicas_done() warn: was '== 1' instead of '='

Old smatch warnings:
fs/bcachefs/btree_io.c:695 validate_bset() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:709 validate_bset() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:830 validate_bset_keys() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:879 validate_bset_keys() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:1337 btree_node_read_all_replicas_done() warn: was '== 1' instead of '='
fs/bcachefs/btree_io.c:1340 btree_node_read_all_replicas_done() warn: was '== 1' instead of '='

vim +685 fs/bcachefs/btree_io.c

aae15aafcd43ec Kent Overstreet 2021-04-24  667  
91f6ad6f947c96 Kent Overstreet 2021-02-02  668  static int validate_bset(struct bch_fs *c, struct bch_dev *ca,
91f6ad6f947c96 Kent Overstreet 2021-02-02  669  			 struct btree *b, struct bset *i,
e719fc34f00004 Kent Overstreet 2021-07-16  670  			 unsigned offset, unsigned sectors,
494dcc57a7bf63 Kent Overstreet 2023-01-03  671  			 int write, bool have_retry, bool *saw_error)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  672  {
39fb2983c58629 Kent Overstreet 2020-01-07  673  	unsigned version = le16_to_cpu(i->version);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  674  	const char *err;
fa8e94faeece12 Kent Overstreet 2022-02-25  675  	struct printbuf buf1 = PRINTBUF;
fa8e94faeece12 Kent Overstreet 2022-02-25  676  	struct printbuf buf2 = PRINTBUF;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  677  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  678  
39fb2983c58629 Kent Overstreet 2020-01-07  679  	btree_err_on((version != BCH_BSET_VERSION_OLD &&
39fb2983c58629 Kent Overstreet 2020-01-07  680  		      version < bcachefs_metadata_version_min) ||
39fb2983c58629 Kent Overstreet 2020-01-07  681  		     version >= bcachefs_metadata_version_max,
91f6ad6f947c96 Kent Overstreet 2021-02-02  682  		     BTREE_ERR_FATAL, c, ca, b, i,
39fb2983c58629 Kent Overstreet 2020-01-07  683  		     "unsupported bset version");
39fb2983c58629 Kent Overstreet 2020-01-07  684  
84cc758d6b19ae Kent Overstreet 2021-03-21 @685  	if (btree_err_on(version < c->sb.version_min,
84cc758d6b19ae Kent Overstreet 2021-03-21  686  			 BTREE_ERR_FIXABLE, c, NULL, b, i,
84cc758d6b19ae Kent Overstreet 2021-03-21  687  			 "bset version %u older than superblock version_min %u",
84cc758d6b19ae Kent Overstreet 2021-03-21  688  			 version, c->sb.version_min)) {
84cc758d6b19ae Kent Overstreet 2021-03-21  689  		mutex_lock(&c->sb_lock);
84cc758d6b19ae Kent Overstreet 2021-03-21  690  		c->disk_sb.sb->version_min = cpu_to_le16(version);
84cc758d6b19ae Kent Overstreet 2021-03-21  691  		bch2_write_super(c);
84cc758d6b19ae Kent Overstreet 2021-03-21  692  		mutex_unlock(&c->sb_lock);
84cc758d6b19ae Kent Overstreet 2021-03-21  693  	}
84cc758d6b19ae Kent Overstreet 2021-03-21  694  
84cc758d6b19ae Kent Overstreet 2021-03-21  695  	if (btree_err_on(version > c->sb.version,
84cc758d6b19ae Kent Overstreet 2021-03-21  696  			 BTREE_ERR_FIXABLE, c, NULL, b, i,
84cc758d6b19ae Kent Overstreet 2021-03-21  697  			 "bset version %u newer than superblock version %u",
84cc758d6b19ae Kent Overstreet 2021-03-21  698  			 version, c->sb.version)) {
84cc758d6b19ae Kent Overstreet 2021-03-21  699  		mutex_lock(&c->sb_lock);
84cc758d6b19ae Kent Overstreet 2021-03-21  700  		c->disk_sb.sb->version = cpu_to_le16(version);
84cc758d6b19ae Kent Overstreet 2021-03-21  701  		bch2_write_super(c);
84cc758d6b19ae Kent Overstreet 2021-03-21  702  		mutex_unlock(&c->sb_lock);
84cc758d6b19ae Kent Overstreet 2021-03-21  703  	}
84cc758d6b19ae Kent Overstreet 2021-03-21  704  
5f65d74d791d9b Kent Overstreet 2021-03-29  705  	btree_err_on(BSET_SEPARATE_WHITEOUTS(i),
5f65d74d791d9b Kent Overstreet 2021-03-29  706  		     BTREE_ERR_FATAL, c, ca, b, i,
5f65d74d791d9b Kent Overstreet 2021-03-29  707  		     "BSET_SEPARATE_WHITEOUTS no longer supported");
5f65d74d791d9b Kent Overstreet 2021-03-29  708  
8244f3209b5b49 Kent Overstreet 2021-12-14  709  	if (btree_err_on(offset + sectors > btree_sectors(c),
91f6ad6f947c96 Kent Overstreet 2021-02-02  710  			 BTREE_ERR_FIXABLE, c, ca, b, i,
39fb2983c58629 Kent Overstreet 2020-01-07  711  			 "bset past end of btree node")) {
39fb2983c58629 Kent Overstreet 2020-01-07  712  		i->u64s = 0;
fa8e94faeece12 Kent Overstreet 2022-02-25  713  		ret = 0;
fa8e94faeece12 Kent Overstreet 2022-02-25  714  		goto out;
39fb2983c58629 Kent Overstreet 2020-01-07  715  	}
39fb2983c58629 Kent Overstreet 2020-01-07  716  
e719fc34f00004 Kent Overstreet 2021-07-16  717  	btree_err_on(offset && !i->u64s,
91f6ad6f947c96 Kent Overstreet 2021-02-02  718  		     BTREE_ERR_FIXABLE, c, ca, b, i,
39fb2983c58629 Kent Overstreet 2020-01-07  719  		     "empty bset");
39fb2983c58629 Kent Overstreet 2020-01-07  720  
e719fc34f00004 Kent Overstreet 2021-07-16  721  	btree_err_on(BSET_OFFSET(i) &&
e719fc34f00004 Kent Overstreet 2021-07-16  722  		     BSET_OFFSET(i) != offset,
e719fc34f00004 Kent Overstreet 2021-07-16  723  		     BTREE_ERR_WANT_RETRY, c, ca, b, i,
e719fc34f00004 Kent Overstreet 2021-07-16  724  		     "bset at wrong sector offset");
e719fc34f00004 Kent Overstreet 2021-07-16  725  
e719fc34f00004 Kent Overstreet 2021-07-16  726  	if (!offset) {
39fb2983c58629 Kent Overstreet 2020-01-07  727  		struct btree_node *bn =
39fb2983c58629 Kent Overstreet 2020-01-07  728  			container_of(i, struct btree_node, keys);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  729  		/* These indicate that we read the wrong btree node: */
f36dff2885ee70 Kent Overstreet 2020-05-12  730  
f36dff2885ee70 Kent Overstreet 2020-05-12  731  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
f36dff2885ee70 Kent Overstreet 2020-05-12  732  			struct bch_btree_ptr_v2 *bp =
f36dff2885ee70 Kent Overstreet 2020-05-12  733  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
f36dff2885ee70 Kent Overstreet 2020-05-12  734  
f36dff2885ee70 Kent Overstreet 2020-05-12  735  			/* XXX endianness */
f36dff2885ee70 Kent Overstreet 2020-05-12  736  			btree_err_on(bp->seq != bn->keys.seq,
91f6ad6f947c96 Kent Overstreet 2021-02-02  737  				     BTREE_ERR_MUST_RETRY, c, ca, b, NULL,
f36dff2885ee70 Kent Overstreet 2020-05-12  738  				     "incorrect sequence number (wrong btree node)");
f36dff2885ee70 Kent Overstreet 2020-05-12  739  		}
f36dff2885ee70 Kent Overstreet 2020-05-12  740  
39fb2983c58629 Kent Overstreet 2020-01-07  741  		btree_err_on(BTREE_NODE_ID(bn) != b->c.btree_id,
91f6ad6f947c96 Kent Overstreet 2021-02-02  742  			     BTREE_ERR_MUST_RETRY, c, ca, b, i,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  743  			     "incorrect btree id");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  744  
39fb2983c58629 Kent Overstreet 2020-01-07  745  		btree_err_on(BTREE_NODE_LEVEL(bn) != b->c.level,
91f6ad6f947c96 Kent Overstreet 2021-02-02  746  			     BTREE_ERR_MUST_RETRY, c, ca, b, i,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  747  			     "incorrect level");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  748  
39fb2983c58629 Kent Overstreet 2020-01-07  749  		if (!write)
39fb2983c58629 Kent Overstreet 2020-01-07  750  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c58629 Kent Overstreet 2020-01-07  751  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c58629 Kent Overstreet 2020-01-07  752  
548b3d209fa5c6 Kent Overstreet 2020-02-07  753  		if (b->key.k.type == KEY_TYPE_btree_ptr_v2) {
548b3d209fa5c6 Kent Overstreet 2020-02-07  754  			struct bch_btree_ptr_v2 *bp =
548b3d209fa5c6 Kent Overstreet 2020-02-07  755  				&bkey_i_to_btree_ptr_v2(&b->key)->v;
548b3d209fa5c6 Kent Overstreet 2020-02-07  756  
51d2dfb82d0553 Kent Overstreet 2021-01-26  757  			if (BTREE_PTR_RANGE_UPDATED(bp)) {
51d2dfb82d0553 Kent Overstreet 2021-01-26  758  				b->data->min_key = bp->min_key;
51d2dfb82d0553 Kent Overstreet 2021-01-26  759  				b->data->max_key = b->key.k.p;
51d2dfb82d0553 Kent Overstreet 2021-01-26  760  			}
51d2dfb82d0553 Kent Overstreet 2021-01-26  761  
e88a75ebe86c1d Kent Overstreet 2022-11-24  762  			btree_err_on(!bpos_eq(b->data->min_key, bp->min_key),
91f6ad6f947c96 Kent Overstreet 2021-02-02  763  				     BTREE_ERR_MUST_RETRY, c, ca, b, NULL,
f020bfcdb058e4 Kent Overstreet 2021-03-04  764  				     "incorrect min_key: got %s should be %s",
fa8e94faeece12 Kent Overstreet 2022-02-25  765  				     (printbuf_reset(&buf1),
fa8e94faeece12 Kent Overstreet 2022-02-25  766  				      bch2_bpos_to_text(&buf1, bn->min_key), buf1.buf),
fa8e94faeece12 Kent Overstreet 2022-02-25  767  				     (printbuf_reset(&buf2),
fa8e94faeece12 Kent Overstreet 2022-02-25  768  				      bch2_bpos_to_text(&buf2, bp->min_key), buf2.buf));
548b3d209fa5c6 Kent Overstreet 2020-02-07  769  		}
548b3d209fa5c6 Kent Overstreet 2020-02-07  770  
e88a75ebe86c1d Kent Overstreet 2022-11-24  771  		btree_err_on(!bpos_eq(bn->max_key, b->key.k.p),
91f6ad6f947c96 Kent Overstreet 2021-02-02  772  			     BTREE_ERR_MUST_RETRY, c, ca, b, i,
f020bfcdb058e4 Kent Overstreet 2021-03-04  773  			     "incorrect max key %s",
fa8e94faeece12 Kent Overstreet 2022-02-25  774  			     (printbuf_reset(&buf1),
fa8e94faeece12 Kent Overstreet 2022-02-25  775  			      bch2_bpos_to_text(&buf1, bn->max_key), buf1.buf));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  776  
39fb2983c58629 Kent Overstreet 2020-01-07  777  		if (write)
39fb2983c58629 Kent Overstreet 2020-01-07  778  			compat_btree_node(b->c.level, b->c.btree_id, version,
39fb2983c58629 Kent Overstreet 2020-01-07  779  					  BSET_BIG_ENDIAN(i), write, bn);
39fb2983c58629 Kent Overstreet 2020-01-07  780  
39fb2983c58629 Kent Overstreet 2020-01-07  781  		err = bch2_bkey_format_validate(&bn->format);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  782  		btree_err_on(err,
91f6ad6f947c96 Kent Overstreet 2021-02-02  783  			     BTREE_ERR_FATAL, c, ca, b, i,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  784  			     "invalid bkey format: %s", err);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  785  
39fb2983c58629 Kent Overstreet 2020-01-07  786  		compat_bformat(b->c.level, b->c.btree_id, version,
39fb2983c58629 Kent Overstreet 2020-01-07  787  			       BSET_BIG_ENDIAN(i), write,
39fb2983c58629 Kent Overstreet 2020-01-07  788  			       &bn->format);
39fb2983c58629 Kent Overstreet 2020-01-07  789  	}
fa8e94faeece12 Kent Overstreet 2022-02-25  790  out:
39fb2983c58629 Kent Overstreet 2020-01-07  791  fsck_err:
fa8e94faeece12 Kent Overstreet 2022-02-25  792  	printbuf_exit(&buf2);
fa8e94faeece12 Kent Overstreet 2022-02-25  793  	printbuf_exit(&buf1);
39fb2983c58629 Kent Overstreet 2020-01-07  794  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  795  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  796  
f0ac7df23d04f3 Kent Overstreet 2022-04-03  797  static int bset_key_invalid(struct bch_fs *c, struct btree *b,
f0ac7df23d04f3 Kent Overstreet 2022-04-03  798  			    struct bkey_s_c k,
275c8426fb8fd4 Kent Overstreet 2022-04-03  799  			    bool updated_range, int rw,
f0ac7df23d04f3 Kent Overstreet 2022-04-03  800  			    struct printbuf *err)
f0ac7df23d04f3 Kent Overstreet 2022-04-03  801  {
cf0dd697ebc909 Kent Overstreet 2022-04-10  802  	return __bch2_bkey_invalid(c, k, btree_node_type(b), READ, err) ?:
f0ac7df23d04f3 Kent Overstreet 2022-04-03  803  		(!updated_range ? bch2_bkey_in_btree_node(b, k, err) : 0) ?:
cf0dd697ebc909 Kent Overstreet 2022-04-10  804  		(rw == WRITE ? bch2_bkey_val_invalid(c, k, READ, err) : 0);
f0ac7df23d04f3 Kent Overstreet 2022-04-03  805  }
f0ac7df23d04f3 Kent Overstreet 2022-04-03  806  
39fb2983c58629 Kent Overstreet 2020-01-07  807  static int validate_bset_keys(struct bch_fs *c, struct btree *b,
494dcc57a7bf63 Kent Overstreet 2023-01-03  808  			 struct bset *i, int write,
494dcc57a7bf63 Kent Overstreet 2023-01-03  809  			 bool have_retry, bool *saw_error)
39fb2983c58629 Kent Overstreet 2020-01-07  810  {
39fb2983c58629 Kent Overstreet 2020-01-07  811  	unsigned version = le16_to_cpu(i->version);
39fb2983c58629 Kent Overstreet 2020-01-07  812  	struct bkey_packed *k, *prev = NULL;
f0ac7df23d04f3 Kent Overstreet 2022-04-03  813  	struct printbuf buf = PRINTBUF;
aae15aafcd43ec Kent Overstreet 2021-04-24  814  	bool updated_range = b->key.k.type == KEY_TYPE_btree_ptr_v2 &&
aae15aafcd43ec Kent Overstreet 2021-04-24  815  		BTREE_PTR_RANGE_UPDATED(&bkey_i_to_btree_ptr_v2(&b->key)->v);
39fb2983c58629 Kent Overstreet 2020-01-07  816  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  817  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  818  	for (k = i->start;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  819  	     k != vstruct_last(i);) {
1f49dafcd3191d Kent Overstreet 2020-02-06  820  		struct bkey_s u;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  821  		struct bkey tmp;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  822  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @823  		if (btree_err_on(bkey_next(k) > vstruct_last(i),
91f6ad6f947c96 Kent Overstreet 2021-02-02  824  				 BTREE_ERR_FIXABLE, c, NULL, b, i,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  825  				 "key extends past end of bset")) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  826  			i->u64s = cpu_to_le16((u64 *) k - i->_data);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  827  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  828  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  829  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  830  		if (btree_err_on(k->format > KEY_FORMAT_CURRENT,
91f6ad6f947c96 Kent Overstreet 2021-02-02  831  				 BTREE_ERR_FIXABLE, c, NULL, b, i,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  832  				 "invalid bkey format %u", k->format)) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  833  			i->u64s = cpu_to_le16(le16_to_cpu(i->u64s) - k->u64s);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  834  			memmove_u64s_down(k, bkey_next(k),
1c6fdbd8f2465d Kent Overstreet 2017-03-16  835  					  (u64 *) vstruct_end(i) - (u64 *) k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  836  			continue;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  837  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  838  
39fb2983c58629 Kent Overstreet 2020-01-07  839  		/* XXX: validate k->u64s */
39fb2983c58629 Kent Overstreet 2020-01-07  840  		if (!write)
39fb2983c58629 Kent Overstreet 2020-01-07  841  			bch2_bkey_compat(b->c.level, b->c.btree_id, version,
39fb2983c58629 Kent Overstreet 2020-01-07  842  				    BSET_BIG_ENDIAN(i), write,
39fb2983c58629 Kent Overstreet 2020-01-07  843  				    &b->format, k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  844  
1f49dafcd3191d Kent Overstreet 2020-02-06  845  		u = __bkey_disassemble(b, k, &tmp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  846  
f0ac7df23d04f3 Kent Overstreet 2022-04-03  847  		printbuf_reset(&buf);
f0ac7df23d04f3 Kent Overstreet 2022-04-03  848  		if (bset_key_invalid(c, b, u.s_c, updated_range, write, &buf)) {
f0ac7df23d04f3 Kent Overstreet 2022-04-03  849  			printbuf_reset(&buf);
401ec4db630802 Kent Overstreet 2023-02-03  850  			prt_printf(&buf, "invalid bkey:  ");
f0ac7df23d04f3 Kent Overstreet 2022-04-03  851  			bset_key_invalid(c, b, u.s_c, updated_range, write, &buf);
401ec4db630802 Kent Overstreet 2023-02-03  852  			prt_printf(&buf, "\n  ");
ae21f74e3135ef Kent Overstreet 2022-04-18  853  			bch2_bkey_val_to_text(&buf, c, u.s_c);
f0ac7df23d04f3 Kent Overstreet 2022-04-03  854  
f0ac7df23d04f3 Kent Overstreet 2022-04-03  855  			btree_err(BTREE_ERR_FIXABLE, c, NULL, b, i, "%s", buf.buf);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  856  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  857  			i->u64s = cpu_to_le16(le16_to_cpu(i->u64s) - k->u64s);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  858  			memmove_u64s_down(k, bkey_next(k),
1c6fdbd8f2465d Kent Overstreet 2017-03-16  859  					  (u64 *) vstruct_end(i) - (u64 *) k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  860  			continue;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  861  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  862  
39fb2983c58629 Kent Overstreet 2020-01-07  863  		if (write)
39fb2983c58629 Kent Overstreet 2020-01-07  864  			bch2_bkey_compat(b->c.level, b->c.btree_id, version,
39fb2983c58629 Kent Overstreet 2020-01-07  865  				    BSET_BIG_ENDIAN(i), write,
39fb2983c58629 Kent Overstreet 2020-01-07  866  				    &b->format, k);
26609b619fa230 Kent Overstreet 2018-11-01  867  
5f65d74d791d9b Kent Overstreet 2021-03-29  868  		if (prev && bkey_iter_cmp(b, prev, k) > 0) {
e3e464ac6d0926 Kent Overstreet 2019-12-30  869  			struct bkey up = bkey_unpack_key(b, prev);
f1f5f114cdd1af Kent Overstreet 2020-02-26  870  
f0ac7df23d04f3 Kent Overstreet 2022-04-03  871  			printbuf_reset(&buf);
401ec4db630802 Kent Overstreet 2023-02-03  872  			prt_printf(&buf, "keys out of order: ");
f0ac7df23d04f3 Kent Overstreet 2022-04-03  873  			bch2_bkey_to_text(&buf, &up);
401ec4db630802 Kent Overstreet 2023-02-03  874  			prt_printf(&buf, " > ");
f0ac7df23d04f3 Kent Overstreet 2022-04-03  875  			bch2_bkey_to_text(&buf, u.k);
f1f5f114cdd1af Kent Overstreet 2020-02-26  876  
a34782a0663cc3 Kent Overstreet 2020-06-17  877  			bch2_dump_bset(c, b, i, 0);
5f65d74d791d9b Kent Overstreet 2021-03-29  878  
f0ac7df23d04f3 Kent Overstreet 2022-04-03  879  			if (btree_err(BTREE_ERR_FIXABLE, c, NULL, b, i, "%s", buf.buf)) {
5f65d74d791d9b Kent Overstreet 2021-03-29  880  				i->u64s = cpu_to_le16(le16_to_cpu(i->u64s) - k->u64s);
5f65d74d791d9b Kent Overstreet 2021-03-29  881  				memmove_u64s_down(k, bkey_next(k),
5f65d74d791d9b Kent Overstreet 2021-03-29  882  						  (u64 *) vstruct_end(i) - (u64 *) k);
5f65d74d791d9b Kent Overstreet 2021-03-29  883  				continue;
5f65d74d791d9b Kent Overstreet 2021-03-29  884  			}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  885  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  886  
e3e464ac6d0926 Kent Overstreet 2019-12-30  887  		prev = k;
0390ea8ad8f407 Kent Overstreet 2021-03-24  888  		k = bkey_next(k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  889  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  890  fsck_err:
f0ac7df23d04f3 Kent Overstreet 2022-04-03  891  	printbuf_exit(&buf);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  892  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  893  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  894  

:::::: The code at line 685 was first introduced by commit
:::::: 84cc758d6b19ae8a92389306fe3510e58a08d90c bcachefs: Validate bset version field against sb version fields

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
