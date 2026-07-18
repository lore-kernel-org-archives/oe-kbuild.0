Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45A175A84
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399256; cv=none; b=ZPzAMoxCdFw9KGqgxQLQZu4/EEiFU7coEtWqylh4yBK1ywnLK0FUANOBO8n05FZnNGE3DwEgdPSrGyjs8GglkdqKLgmZAsObqbSEEYyiRwXVJQR2UGO20w1EjKhTS7Eb2TIgFAsI4plfmOFhAesrNX9SLFDVroYiOR6o6hHSLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399256; c=relaxed/simple;
	bh=HSD3NJ3m5cVdRpYD6xRcmRRlww+LdCHMWBgEGLWg3FY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYhIleozXmWUt0h95X0T4Ax1lM/xqTCGkrNjdEzYnB+wwJyDpFqe7C91hp92iW6huXZbuLUn1+VrTIDiLCvY8SfHRwGxonbmy8hes3vDln10spH3cOy1p/nYYV1WykzWSLBTqJl57jnj6EdaqolUqg16mGFQQ7uK48OhM7az4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elwhcvfm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elwhcvfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784399254; x=1815935254;
  h=date:from:to:cc:subject:message-id;
  bh=HSD3NJ3m5cVdRpYD6xRcmRRlww+LdCHMWBgEGLWg3FY=;
  b=elwhcvfmbFKaaJO0kkDekfwNW04KSEhQZQ5M/E9xPAT1oubEWpWm+VIV
   lRM+H2uz1LcDvyFwNVph1jYW0OtJZXBksUAaRR2gLUOIdvSWW6WzKbEaW
   0I3Tp5nBfVWBrr6JHvscnWJUXgcFGji9GAvQavClU8nLUC3nQhH8pA4fj
   ZC2DIgCzLsBPerRHBh7x3+Z6azLs9jaMVF0wnbIbf9AAzM3R9Mmah3HVz
   RKQmzIwxGiWTyUj7vEt+H7DeE/XoW7/oeK23pLZDuZ8rkZg3pfypiZWdR
   /AWjfFP6u0WD+Cf+F5wzHkXw2slV6f2LrA7Plv4axVbI41wE5HvSb0hEM
   w==;
X-CSE-ConnectionGUID: 1WwR7ct9SX6QyvnJSUv4Kg==
X-CSE-MsgGUID: Fpw7GJmURtyW6mdtO2TajA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95635060"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95635060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 11:27:34 -0700
X-CSE-ConnectionGUID: OIx8k17tQEGC+0RCvmAtrw==
X-CSE-MsgGUID: d/qA4fkdT16p+v4U7YxSvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="262033442"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2026 11:27:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl9l3-00000000V1S-3RH5;
	Sat, 18 Jul 2026 18:27:29 +0000
Date: Sun, 19 Jul 2026 02:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 986/1155] fs/bcachefs/data/read.c:1327
 __bch2_read_extent() error: we previously assumed 'ca' could be null (see
 line 1307)
Message-ID: <202607190209.2KOYmnuT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 312c51e00acfd6ab012061bbb080ff0b524d7b29 [986/1155] bcachefs: read_extent_rbio_alloc()
:::::: branch date: 9 weeks ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260719/202607190209.2KOYmnuT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607190209.2KOYmnuT-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/read.c:1327 __bch2_read_extent() error: we previously assumed 'ca' could be null (see line 1307)

vim +/ca +1327 fs/bcachefs/data/read.c

312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1165  
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1166  int __bch2_read_extent(struct btree_trans *trans,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1167  		       struct bch_read_bio *orig,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1168  		       struct bvec_iter iter, struct bpos read_pos,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1169  		       enum btree_id data_btree, struct bkey_s_c k,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1170  		       unsigned offset_into_extent,
ca24130ee412d9 fs/bcachefs/io_read.c   Kent Overstreet 2024-12-28  1171  		       struct bch_io_failures *failed, unsigned flags, int dev)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1172  {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1173  	struct bch_fs *c = trans->c;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1174  	struct extent_ptr_decoded pick;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1175  	struct bch_read_bio *rbio = NULL;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1176  	bool bounce = false, read_full = false, narrow_crcs = false;
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1177  	struct data_update *u = rbio_data_update(orig);
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1178  	int ret = 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1179  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1180  	if (bkey_extent_is_inline_data(k.k)) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1181  		unsigned bytes = min_t(unsigned, iter.bi_size,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1182  				       bkey_inline_data_bytes(k.k));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1183  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1184  		swap(iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1185  		memcpy_to_bio(&orig->bio, iter, bkey_inline_data_p(k));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1186  		swap(iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1187  		bio_advance_iter(&orig->bio, &iter, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1188  		zero_fill_bio_iter(&orig->bio, iter);
1949a429883eb0 fs/bcachefs/data/read.c Kent Overstreet 2025-11-22  1189  		this_cpu_add(c->counters.now[BCH_COUNTER_io_read_inline],
157ea5834133c0 fs/bcachefs/io_read.c   Kent Overstreet 2025-02-03  1190  			     bvec_iter_sectors(iter));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1191  		goto out_read_done;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1192  	}
cb8336ca42e493 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1193  
cb8336ca42e493 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1194  	if ((bch2_bkey_extent_flags(k) & BIT_ULL(BCH_EXTENT_FLAG_poisoned)) &&
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1195  	    !orig->data_update) {
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1196  		ret = bch_err_throw(c, extent_poisoned);
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1197  		goto err;
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1198  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1199  retry_pick:
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1200  	ret = bch2_bkey_pick_read_device(c, k, failed, &pick, dev);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1201  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1202  	/* hole or reservation - just zero fill: */
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1203  	if (!ret)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1204  		goto hole;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1205  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1206  	if (unlikely(ret < 0)) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1207  		if (ret == -BCH_ERR_data_read_csum_err) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1208  			int ret2 = maybe_poison_extent(trans, orig, data_btree, k);
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1209  			if (ret2) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1210  				ret = ret2;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1211  				goto err;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1212  			}
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1213  
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1214  			trace_and_count(c, io_read_fail_and_poison, &orig->bio);
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1215  		}
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1216  
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1217  		if (!(flags & BCH_READ_in_retry)) {
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1218  			CLASS(printbuf, buf)();
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1219  			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1220  			prt_printf(&buf, "%s\n  ", bch2_err_str(ret));
bf611567b791f3 fs/bcachefs/io_read.c   Kent Overstreet 2024-09-06  1221  			bch2_bkey_val_to_text(&buf, c, k);
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1222  			bch_err_ratelimited(c, "%s", buf.buf);
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1223  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1224  		goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1225  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1226  
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1227  	if (bch2_csum_type_is_encryption(pick.crc.csum_type) &&
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1228  	    unlikely(!c->chacha20_key_set)) {
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1229  		if (!(flags & BCH_READ_in_retry)) {
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1230  			CLASS(printbuf, buf)();
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1231  			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1232  			prt_printf(&buf, "attempting to read encrypted data without encryption key\n  ");
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1233  			bch2_bkey_val_to_text(&buf, c, k);
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1234  
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1235  			bch_err_ratelimited(c, "%s", buf.buf);
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1236  		}
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1237  		ret = bch_err_throw(c, data_read_no_encryption_key);
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1238  		goto err;
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1239  	}
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1240  
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1241  	struct bch_dev *ca = bch2_dev_get_ioref(c, pick.ptr.dev, READ,
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1242  					BCH_DEV_READ_REF_io_read);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1243  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1244  	/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1245  	 * Stale dirty pointers are treated as IO errors, but @failed isn't
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1246  	 * allocated unless we're in the retry path - so if we're not in the
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1247  	 * retry path, don't check here, it'll be caught in bch2_read_endio()
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1248  	 * and we'll end up in the retry path:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1249  	 */
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1250  	if (unlikely(flags & BCH_READ_in_retry) &&
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1251  	    !pick.ptr.cached &&
465bf6f42aac14 fs/bcachefs/io_read.c   Kent Overstreet 2024-05-03  1252  	    ca &&
3858aa4268b2f7 fs/bcachefs/io_read.c   Kent Overstreet 2024-04-30  1253  	    unlikely(dev_ptr_stale(ca, &pick.ptr))) {
db39a35dde9dcf fs/bcachefs/io_read.c   Kent Overstreet 2024-05-01  1254  		read_from_stale_dirty_pointer(trans, ca, k, pick.ptr);
2a82b05ef052c3 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1255  		bch2_mark_io_failure(failed, &pick, bch_err_throw(c, data_read_ptr_stale_dirty));
44c1946444a82a fs/bcachefs/data/read.c Kent Overstreet 2025-11-05  1256  		propagate_io_error_to_data_update(c, rbio, &pick);
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1257  		enumerated_ref_put(&ca->io_ref[READ], BCH_DEV_READ_REF_io_read);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1258  		goto retry_pick;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1259  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1260  
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1261  	if (likely(!u)) {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1262  		if (!(flags & BCH_READ_last_fragment) ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1263  		    bio_flagged(&orig->bio, BIO_CHAIN))
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1264  			flags |= BCH_READ_must_clone;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1265  
1e9af0dcebc6b2 fs/bcachefs/data/read.c Kent Overstreet 2025-10-30  1266  		narrow_crcs = !(flags & BCH_READ_in_retry) && can_narrow_crc(pick.crc);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1267  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1268  		if (narrow_crcs && (flags & BCH_READ_user_mapped))
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1269  			flags |= BCH_READ_must_bounce;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1270  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1271  		EBUG_ON(offset_into_extent + bvec_iter_sectors(iter) > k.k->size);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1272  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1273  		if (crc_is_compressed(pick.crc) ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1274  		    (pick.crc.csum_type != BCH_CSUM_none &&
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1275  		     (bvec_iter_sectors(iter) != pick.crc.uncompressed_size ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1276  		      (bch2_csum_type_is_encryption(pick.crc.csum_type) &&
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1277  		       (flags & BCH_READ_user_mapped)) ||
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1278  		      (flags & BCH_READ_must_bounce)))) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1279  			read_full = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1280  			bounce = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1281  		}
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1282  	} else {
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1283  		/*
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1284  		 * can happen if we retry, and the extent we were going to read
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1285  		 * has been merged in the meantime:
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1286  		 */
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1287  		if (pick.crc.compressed_size > u->op.wbio.bio.bi_iter.bi_size) {
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1288  			if (ca)
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1289  				enumerated_ref_put(&ca->io_ref[READ],
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1290  					BCH_DEV_READ_REF_io_read);
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1291  			rbio->ret = bch_err_throw(c, data_read_buffer_too_small);
881b598ef144a1 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1292  			goto out_read_done;
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1293  		}
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1294  
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1295  		iter.bi_size	= pick.crc.compressed_size << 9;
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1296  		read_full = true;
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1297  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1298  
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1299  	rbio = read_extent_rbio_alloc(trans, orig, iter, read_pos, data_btree, k,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1300  				      pick, ca, offset_into_extent, failed, flags,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1301  				      bounce, read_full, narrow_crcs);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1302  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1303  	/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1304  	 * If it's being moved internally, we don't want to flag it as a cache
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1305  	 * hit:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1306  	 */
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12 @1307  	if (ca && pick.ptr.cached && !u)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1308  		bch2_bucket_io_time_reset(trans, pick.ptr.dev,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1309  			PTR_BUCKET_NR(ca, &pick.ptr), READ);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1310  
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1311  	/*
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1312  	 * Unlock the iterator while the btree node's lock is still in
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1313  	 * cache, before doing the IO:
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1314  	 */
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1315  	if (!(flags & BCH_READ_in_retry))
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1316  		bch2_trans_unlock(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1317  	else
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1318  		bch2_trans_unlock_long(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1319  
be31e412ac01f4 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1320  	if (likely(!rbio->pick.do_ec_reconstruct)) {
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1321  		if (unlikely(!rbio->have_ioref)) {
3d8e248b2e15f0 fs/bcachefs/data/read.c Kent Overstreet 2025-10-06  1322  			ret = bch_err_throw(c, data_read_retry_device_offline);
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1323  			bch2_rbio_error(rbio, ret);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1324  			goto out;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1325  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1326  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10 @1327  		this_cpu_add(ca->io_done->sectors[READ][BCH_DATA_user],
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1328  			     bio_sectors(&rbio->bio));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1329  		bio_set_dev(&rbio->bio, ca->disk_sb.bdev);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1330  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1331  		if (unlikely(c->opts.no_data_io)) {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1332  			if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1333  				bio_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1334  		} else {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1335  			if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1336  				submit_bio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1337  			else
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1338  				submit_bio_wait(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1339  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1340  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1341  		/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1342  		 * We just submitted IO which may block, we expect relock fail
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1343  		 * events and shouldn't count them:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1344  		 */
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1345  		trans->notrace_relock_fail = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1346  	} else {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1347  		/* Attempting reconstruct read: */
2aee59eb212266 fs/bcachefs/io_read.c   Kent Overstreet 2024-09-07  1348  		if (bch2_ec_read_extent(trans, rbio, k)) {
3d8e248b2e15f0 fs/bcachefs/data/read.c Kent Overstreet 2025-10-06  1349  			ret = bch_err_throw(c, data_read_retry_ec_reconstruct_err);
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1350  			bch2_rbio_error(rbio, ret);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1351  			goto out;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1352  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1353  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1354  		if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1355  			bio_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1356  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1357  out:
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1358  	if (likely(!(flags & BCH_READ_in_retry))) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1359  		return 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1360  	} else {
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1361  		bch2_trans_unlock(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1362  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1363  		int ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1364  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1365  		rbio->context = RBIO_CONTEXT_UNBOUND;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1366  		bch2_read_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1367  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1368  		ret = rbio->ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1369  		rbio = bch2_rbio_free(rbio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1370  
0806a669f58030 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1371  		if (bch2_err_matches(ret, BCH_ERR_data_read_retry_avoid) ||
0806a669f58030 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1372  		    bch2_err_matches(ret, BCH_ERR_blockdev_io_error)) {
2a82b05ef052c3 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1373  			bch2_mark_io_failure(failed, &pick, ret);
44c1946444a82a fs/bcachefs/data/read.c Kent Overstreet 2025-11-05  1374  			propagate_io_error_to_data_update(c, rbio, &pick);
0bf6463036f1c7 fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1375  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1376  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1377  		return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1378  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1379  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1380  err:
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1381  	if (flags & BCH_READ_in_retry)
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1382  		return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1383  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1384  	orig->ret = ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1385  	goto out_read_done;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1386  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1387  hole:
1949a429883eb0 fs/bcachefs/data/read.c Kent Overstreet 2025-11-22  1388  	this_cpu_add(c->counters.now[BCH_COUNTER_io_read_hole],
157ea5834133c0 fs/bcachefs/io_read.c   Kent Overstreet 2025-02-03  1389  		     bvec_iter_sectors(iter));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1390  	/*
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1391  	 * won't normally happen in the data update (bch2_move_extent()) path,
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1392  	 * but if we retry and the extent we wanted to read no longer exists we
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1393  	 * have to signal that:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1394  	 */
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1395  	if (u)
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1396  		orig->ret = bch_err_throw(c, data_read_key_overwritten);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1397  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1398  	zero_fill_bio_iter(&orig->bio, iter);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1399  out_read_done:
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1400  	if ((flags & BCH_READ_last_fragment) &&
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1401  	    !(flags & BCH_READ_in_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1402  		bch2_rbio_done(orig);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1403  	return 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1404  }
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1405  

:::::: The code at line 1327 was first introduced by commit
:::::: 1809b8cba756d32bd6e976ed4ee64efdf66c6d94 bcachefs: Break up io.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
