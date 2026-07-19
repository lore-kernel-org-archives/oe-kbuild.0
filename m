Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9FD175A6C
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784430270; cv=none; b=GsbUqOvZmRYhPSyUhsllRx4HbGU6lKkTs0jZ9Jal9GOEx8WmdIv6X1KvjNyKuj31eqPbkJykxTlHC5Ynb+733ax4k40QmHNKegqDapIDmeS4zHTGPYx2h5Q8cPolUZ/HXiKdEmV50hNj9US3CbB43/zcH05wU7MmKQrwNlWuJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784430270; c=relaxed/simple;
	bh=AgwLnnChAFIZWel11CXFns2iwJqPaq9jWzQto66OhmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sp8vKPnxSVK5r1IA6166Ha7Ru8i3y0lj7RzEuMwuaCc/PrmWvkQz+lxyPtCbx11IbX+pRZrlePpoRbxtIeqGqR3y+z4alaI4asupwaSa+lrZfqdxX6rir4GJHVbOpN1jcXvDlnkCxrOW9Z9FJI91F8mFJjKnA/qPA6ow6BhRigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODcYOcf4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODcYOcf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784430268; x=1815966268;
  h=date:from:to:cc:subject:message-id;
  bh=AgwLnnChAFIZWel11CXFns2iwJqPaq9jWzQto66OhmM=;
  b=ODcYOcf40gqO2YG6UCkurWSMU5uVgABNCxVzAihvJYIIEnZGunr0q7Jv
   /8nZdTPjnP7TK+HMuW0+COnp/GyCJYNwt+rSrlhvaDbqd3wsUckwwMent
   CD7qva21/7AE5q9n86oFvpv1rZNs5CWgVYu+1k9ZvOuRlsi/L83SDYhF9
   5tqyoGHWu9V7+BpYSagXXsRfcXw0yNwFesBd1GZwB+OY0kyKLLsaJdjvd
   rfGpGNN1WFh6bNbbp8Za6314m9j7Sm6984FCeA7vXo1MulWx3mGG8A20H
   nTpObulcg5InGCoVbWkT7w+Gq6cRjqpRFVhHEC4Qh/r4ZsVTErsB4kzdm
   w==;
X-CSE-ConnectionGUID: /YwzFXb6RKuVI5pDqvhudw==
X-CSE-MsgGUID: PDOSQgWpQeqSO0NU8z33yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96187229"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="96187229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 20:04:28 -0700
X-CSE-ConnectionGUID: uCilUo82Sl+2WcQQRGXBWA==
X-CSE-MsgGUID: 2JAyTJ+qQCOZ3SnCF5bGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="250775865"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jul 2026 20:04:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlHpH-00000000VHK-2Kse;
	Sun, 19 Jul 2026 03:04:23 +0000
Date: Sun, 19 Jul 2026 11:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 12/332]
 fs/bcachefs/fs/check.c:1331 bch2_check_key_has_inode() error: we previously
 assumed 'i' could be null (see line 1266)
Message-ID: <202607191028.9UxcUVgA-lkp@intel.com>
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
commit: 2f2a1c5cbc324204379c68bd25fda1a69c7ec5f4 [12/332] bcachefs: Improve bch2_check_key_has_inode()
:::::: branch date: 5 months ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260719/202607191028.9UxcUVgA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607191028.9UxcUVgA-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs/check.c:1331 bch2_check_key_has_inode() error: we previously assumed 'i' could be null (see line 1266)

vim +/i +1331 fs/bcachefs/fs/check.c

2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1254  
d08a170ec3e7db fs/bcachefs/fs/check.c Kent Overstreet 2025-10-04  1255  int bch2_check_key_has_inode(struct btree_trans *trans,
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1256  			     struct btree_iter *iter,
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1257  			     struct inode_walker *inode,
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1258  			     struct inode_walker_entry *i,
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1259  			     struct bkey_s_c k)
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1260  {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1261  	errptr_try(i);
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1262  
13ab885706d6f0 fs/bcachefs/fsck.c     Kent Overstreet 2025-07-24  1263  	if (bkey_extent_whiteout(k.k))
f6ecd9850b5e0b fs/bcachefs/fsck.c     Kent Overstreet 2025-07-30  1264  		return 0;
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1265  
855070dc0b349e fs/bcachefs/fsck.c     Kent Overstreet 2025-05-03 @1266  	bool have_inode = i && !i->whiteout;
855070dc0b349e fs/bcachefs/fsck.c     Kent Overstreet 2025-05-03  1267  
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1268  	if (have_inode && btree_matches_i_mode(iter->btree_id, i->inode.bi_mode))
f6ecd9850b5e0b fs/bcachefs/fsck.c     Kent Overstreet 2025-07-30  1269  		return 0;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1270  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1271  	struct bch_fs *c = trans->c;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1272  	CLASS(printbuf, buf)();
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1273  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1274  	if (have_inode)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1275  		prt_printf(&buf, "key for wrong inode mode %o", i->inode.bi_mode);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1276  	else
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1277  		prt_str(&buf, "key in missing inode");
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1278  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1279  	struct inode_walker_entry *good_ancestor = NULL;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1280  	darray_for_each(inode->inodes, i2)
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1281  		if (!i2->whiteout &&
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1282  		    bch2_snapshot_is_ancestor(c, k.k->p.snapshot, i2->inode.bi_snapshot) &&
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1283  		    btree_matches_i_mode(iter->btree_id, i2->inode.bi_mode)) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1284  			prt_printf(&buf, ", but found good inode in older snapshot");
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1285  			bch2_inode_unpacked_to_text(&buf, &i2->inode);
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1286  			prt_newline(&buf);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1287  			good_ancestor = i2;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1288  			break;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1289  		}
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1290  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1291  	prt_printf(&buf, "\nfound keys:\n");
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1292  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1293  	struct bpos inode_pos = SPOS(k.k->p.inode, 0, k.k->p.snapshot);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1294  	int ret = count_inode_keys(trans, inode_pos, iter->btree_id, &buf);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1295  	if (ret < 0)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1296  		return ret;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1297  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1298  	unsigned nr_keys = ret;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1299  	if (!nr_keys) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1300  		bch_err(c, "%s: error finding live keys in inode", __func__);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1301  		return bch_err_throw(c, shutdown_with_errors_unfixed);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1302  	}
4a7e1e4ce94f54 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-30  1303  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1304  	if (nr_keys > 100)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1305  		prt_printf(&buf, "found > %u keys for this inode\n", nr_keys);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1306  	else
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1307  		prt_printf(&buf, "found %u keys for this inode\n", nr_keys);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1308  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1309  	if (c->sb.btrees_lost_data & BIT_ULL(BTREE_ID_inodes))
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1310  		prt_str(&buf, "data was lost in inodes btree\n");
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1311  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1312  	if (!have_inode) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1313  		bool inode_looks_deleted =
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1314  			good_ancestor &&
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1315  			nr_keys < 3 &&
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1316  			!(c->sb.btrees_lost_data & BIT_ULL(BTREE_ID_inodes));
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1317  		if (inode_looks_deleted)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1318  			prt_str(&buf, "inode was deleted, will delete key\n");
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1319  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1320  		if (ret_fsck_err(trans, key_in_missing_inode, "%s", buf.buf)) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1321  			if (inode_looks_deleted)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1322  				return bch2_btree_delete_at(trans, iter, BTREE_UPDATE_internal_snapshot_node);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1323  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1324  			if (!good_ancestor) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1325  				try(reconstruct_inode(trans, iter->btree_id, k.k->p.snapshot, k.k->p.inode));
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1326  				try(bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc));
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1327  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1328  				inode->last_pos.inode--;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1329  				return bch_err_throw(c, transaction_restart_commit);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1330  			} else {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20 @1331  				u32 snapshot = i->inode.bi_snapshot;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1332  				i->inode = good_ancestor->inode;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1333  				i->inode.bi_snapshot = snapshot;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1334  				try(bch2_fsck_write_inode(trans, &i->inode));
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1335  				try(bch2_trans_commit_lazy(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc));
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1336  			}
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1337  		}
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1338  	} else {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1339  		if (ret_fsck_err(trans, key_in_wrong_inode_type, "%s", buf.buf)) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1340  			int nr_extents = iter->btree_id == BTREE_ID_extents
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1341  				? nr_keys : count_inode_keys(trans, inode_pos, BTREE_ID_extents, NULL);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1342  			if (nr_extents < 0)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1343  				return nr_extents;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1344  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1345  			int nr_dirents = iter->btree_id == BTREE_ID_dirents
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1346  				? nr_keys : count_inode_keys(trans, inode_pos, BTREE_ID_dirents, NULL);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1347  			if (nr_dirents < 0)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1348  				return nr_dirents;
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1349  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1350  			if (nr_extents && nr_dirents) {
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1351  				bch_err(c, "have both extents and dirents for inode with bad mode, cannot repair");
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1352  				return bch_err_throw(c, shutdown_with_errors_unfixed);
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1353  			}
4a7e1e4ce94f54 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-30  1354  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1355  			i->inode.bi_mode &= ~S_IFMT;
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1356  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1357  			if (nr_dirents)
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1358  				i->inode.bi_mode |= S_IFDIR;
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1359  			else
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1360  				i->inode.bi_mode |= S_IFREG;
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1361  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1362  			try(bch2_fsck_write_inode(trans, &i->inode));
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1363  			try(bch2_trans_commit_lazy(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc));
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1364  		}
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1365  	}
f2a701fd94f161 fs/bcachefs/fsck.c     Kent Overstreet 2025-06-15  1366  
2f2a1c5cbc3242 fs/bcachefs/fs/check.c Kent Overstreet 2025-12-20  1367  	return 0;
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1368  }
c13d526d9dc1aa fs/bcachefs/fsck.c     Kent Overstreet 2024-05-26  1369  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
