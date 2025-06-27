Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16361C84C6
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048916; cv=none; b=p0v4MqtLT4ptQ9Mlbebw26GhhaZYXkRdW1CgKO0tpBjPX97jOKxmMqmLxW+ggt42OBv+cr+vmN5uS+tJLEE2YIq414ABiJtR1xBA+DiCThuutqOIsc/VE5r91D6/alO0gxcZA7OY9Nhev8ukKLyn63lc/psZ9JjjXCrr1SeaTGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048916; c=relaxed/simple;
	bh=WfSI3hncEVOd1gNms0kgP2Ci8OJKGNeguav5i656bdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKKKOVZwPBZqht2InmrxZPq7JPatTSoanDoBot34N33SBdlrdDESiN/ajYiztF9bGj7e+5hTqzoOYB2CfZbnQV2p7c+EoQD7TE2pjI+x3T3p4Krz97vleHQlA6/ywZ/i9E8rHrKWBu2cD5MAs8VyBl4GWKhkI3SjpVdMxmRD6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQOT+Yru; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQOT+Yru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751048915; x=1782584915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfSI3hncEVOd1gNms0kgP2Ci8OJKGNeguav5i656bdc=;
  b=VQOT+YruAVSC+lSn50ebs3Qt58WpgvOdU2nNy1PybNKotey70+X2RPVG
   TSghO1FbYJacqvO/d/OQ9DC1gYi/NWCroQ+cGYy8AXhRO4ZIa3PYlo4Kb
   eZQVYpymWrnGeHi8x+zYsXAUOftoHKMjind+PoGtE2QBOh8BtjwEbtxFJ
   Ob+HttTEI3EfgRJwvFW3WrAbEKCBEDA5smrg/c+FyqeAXXxSyt0bctkma
   rAo00xtf4p+pt+iI/6y4nLJj89iqpKjI08E6SS/9W4MTUf3Vrv0miXe3o
   sLdhTwpa3bjT9loUfFmisvrBfEjW1gzQLTJpYKt0Qd+Q7CuSv1as6GHzb
   g==;
X-CSE-ConnectionGUID: Xa+cDIvISDaakL4WNS92rw==
X-CSE-MsgGUID: JZ2pZhWcSNW/ng7MC6wFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57152715"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57152715"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 11:28:35 -0700
X-CSE-ConnectionGUID: quoFCSN9Qj6sLUwAcmRjRg==
X-CSE-MsgGUID: cSFjT0UYSfSrn9dUx1q/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="190055040"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2025 11:28:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVDoM-000WSk-1p;
	Fri, 27 Jun 2025 18:28:30 +0000
Date: Sat, 28 Jun 2025 02:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5459/5998] fs/bcachefs/btree_update.c:371
 __btree_trans_update_by_path() error: uninitialized symbol 'cmp'.
Message-ID: <202506280217.Pq2Hur19-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: d8dbafa23ed3dc07924ec45c78e866eecfbded7e [5459/5998] bcachefs: Evict/bypass key cache when deleting
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280217.Pq2Hur19-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280217.Pq2Hur19-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_update.c:371 __btree_trans_update_by_path() error: uninitialized symbol 'cmp'.

vim +/cmp +371 fs/bcachefs/btree_update.c

8079aab085f220 Kent Overstreet 2023-08-05  360  
8079aab085f220 Kent Overstreet 2023-08-05  361  	/*
8079aab085f220 Kent Overstreet 2023-08-05  362  	 * Pending updates are kept sorted: first, find position of new update,
8079aab085f220 Kent Overstreet 2023-08-05  363  	 * then delete/trim any updates the new update overwrites:
8079aab085f220 Kent Overstreet 2023-08-05  364  	 */
559e6c23367f4c Kent Overstreet 2023-12-16  365  	for (i = trans->updates; i < trans->updates + trans->nr_updates; i++) {
8079aab085f220 Kent Overstreet 2023-08-05  366  		cmp = btree_insert_entry_cmp(&n, i);
8079aab085f220 Kent Overstreet 2023-08-05  367  		if (cmp <= 0)
8079aab085f220 Kent Overstreet 2023-08-05  368  			break;
8079aab085f220 Kent Overstreet 2023-08-05  369  	}
8079aab085f220 Kent Overstreet 2023-08-05  370  
32ed4a620c5405 Kent Overstreet 2022-08-10 @371  	bool overwrite = !cmp && i < trans->updates + trans->nr_updates;
32ed4a620c5405 Kent Overstreet 2022-08-10  372  
32ed4a620c5405 Kent Overstreet 2022-08-10  373  	if (overwrite) {
8079aab085f220 Kent Overstreet 2023-08-05  374  		EBUG_ON(i->insert_trigger_run || i->overwrite_trigger_run);
8079aab085f220 Kent Overstreet 2023-08-05  375  
7f9821a7c10bca Kent Overstreet 2023-12-10  376  		bch2_path_put(trans, i->path, true);
8079aab085f220 Kent Overstreet 2023-08-05  377  		i->flags	= n.flags;
8079aab085f220 Kent Overstreet 2023-08-05  378  		i->cached	= n.cached;
8079aab085f220 Kent Overstreet 2023-08-05  379  		i->k		= n.k;
8079aab085f220 Kent Overstreet 2023-08-05  380  		i->path		= n.path;
8079aab085f220 Kent Overstreet 2023-08-05  381  		i->ip_allocated	= n.ip_allocated;
8079aab085f220 Kent Overstreet 2023-08-05  382  	} else {
8079aab085f220 Kent Overstreet 2023-08-05  383  		array_insert_item(trans->updates, trans->nr_updates,
8079aab085f220 Kent Overstreet 2023-08-05  384  				  i - trans->updates, n);
8079aab085f220 Kent Overstreet 2023-08-05  385  
8079aab085f220 Kent Overstreet 2023-08-05  386  		i->old_v = bch2_btree_path_peek_slot_exact(path, &i->old_k).v;
8079aab085f220 Kent Overstreet 2023-08-05  387  		i->old_btree_u64s = !bkey_deleted(&i->old_k) ? i->old_k.u64s : 0;
8079aab085f220 Kent Overstreet 2023-08-05  388  
8079aab085f220 Kent Overstreet 2023-08-05  389  		if (unlikely(trans->journal_replay_not_finished)) {
8079aab085f220 Kent Overstreet 2023-08-05  390  			struct bkey_i *j_k =
8079aab085f220 Kent Overstreet 2023-08-05  391  				bch2_journal_keys_peek_slot(c, n.btree_id, n.level, k->k.p);
8079aab085f220 Kent Overstreet 2023-08-05  392  
8079aab085f220 Kent Overstreet 2023-08-05  393  			if (j_k) {
8079aab085f220 Kent Overstreet 2023-08-05  394  				i->old_k = j_k->k;
8079aab085f220 Kent Overstreet 2023-08-05  395  				i->old_v = &j_k->v;
8079aab085f220 Kent Overstreet 2023-08-05  396  			}
8079aab085f220 Kent Overstreet 2023-08-05  397  		}
8079aab085f220 Kent Overstreet 2023-08-05  398  	}
8079aab085f220 Kent Overstreet 2023-08-05  399  
abbfc4db50e27a Kent Overstreet 2024-07-16  400  	__btree_path_get(trans, trans->paths + i->path, true);
8079aab085f220 Kent Overstreet 2023-08-05  401  
32ed4a620c5405 Kent Overstreet 2022-08-10  402  	trace_update_by_path(trans, path, i, overwrite);
d8dbafa23ed3dc Kent Overstreet 2025-06-24  403  	return i;
d8dbafa23ed3dc Kent Overstreet 2025-06-24  404  }
d8dbafa23ed3dc Kent Overstreet 2025-06-24  405  

:::::: The code at line 371 was first introduced by commit
:::::: 32ed4a620c5405be73a59c6407bd2c6dae9d50c3 bcachefs: Btree path tracepoints

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
