Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D772617
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443817; cv=none; b=rhQS1nSIV82K6FU8EqwbZXHpqijF4oroQBbmIkmq1qQErlyCOmC75qiKKaverAk8fb0H5bRNuX9tVCeUgh2cmq2CGNlbQv/qEmlDt10Rf25jajz9J5eXNpOQZZ92/mn0OiPNOJ6Stw9poHPfKcOZi5J3n8B5r25fjLrcm/YXVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443817; c=relaxed/simple;
	bh=bqKTIXup3Lh/RSoFt/sGnf49mLtk+FNjEcMMPCUJ3+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enHChMsmM9n2V/ACdq+Cbhcxy5zzGMSA1AZzVXkP0Sbd7vVRF7P+aCJdDtS9SNYE9Nrbro8CGj3DCp/q7Q3YFkx9KQIDYYvIZylTJW+VSziXKSmA9c8IpvYr3cLcbAYsiTFvndHDfxD7YpSgHhTIAflcIGtSR6pr57nDJhftY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8HVhI65; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8HVhI65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766443815; x=1797979815;
  h=date:from:to:cc:subject:message-id;
  bh=bqKTIXup3Lh/RSoFt/sGnf49mLtk+FNjEcMMPCUJ3+I=;
  b=Z8HVhI65IAbNHJL5u21uugMvADKsxIQ6jhfvhB7JqLBLyCZSfCzDxzk1
   Tx3GuSe0aeIc1nTST8F8y/QqvB2P6sHEeit4hu9CNNxy5InfOJPzSSzPy
   4m01apveV+OHvi6EtOs0ZjfGyV+FNMrmT2IjCBoFt/tmiiKL+0uCBKPTK
   5p+hDFxty7/OhPG86T1T472udc0nj6K7JmdbE+CDmtxDmj0fP95cwzbvn
   UWcNG84F8h99Z684snheenBDmByf+4iAYPBa3vHHjJeJ9DD32LAt8hJbK
   UnwECIpm9y6hgRX9QRCl8slBPA+8iNrd11+vuAEEtbIR5hJdk/eJBZCO0
   A==;
X-CSE-ConnectionGUID: cSygHE8rSweETrldoR3kRg==
X-CSE-MsgGUID: WQRW++bvRgKlCg+Gc1G4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55870787"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="55870787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:50:14 -0800
X-CSE-ConnectionGUID: dqNbnU7+Q+S/4vnTLiAW3Q==
X-CSE-MsgGUID: DvURQagWQOiRRUBD+nmCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204114402"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 14:50:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXojC-000000001Bn-3owK;
	Mon, 22 Dec 2025 22:50:10 +0000
Date: Tue, 23 Dec 2025 06:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paragon-software-group-ntfs3:devel 7/9]
 fs/ntfs3/fsntfs.c:1265 ntfs_read_run_nb_ra() error: uninitialized symbol
 'clen'.
Message-ID: <202512230646.v5hrYXL0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ntfs3@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   f7edab0cee03a1cbe0e55a7bcab8d2d8b6b74278
commit: 989e29450efaf4983c66b7a628f2ffc03b6d02e8 [7/9] fs/ntfs3: improve readahead for bitmap initialization and large directory scans
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230646.v5hrYXL0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230646.v5hrYXL0-lkp@intel.com/

smatch warnings:
fs/ntfs3/fsntfs.c:1265 ntfs_read_run_nb_ra() error: uninitialized symbol 'clen'.
fs/ntfs3/fsntfs.c:1266 ntfs_read_run_nb_ra() error: uninitialized symbol 'idx'.

vim +/clen +1265 fs/ntfs3/fsntfs.c

82cae269cfa9530 Konstantin Komarov 2021-08-13  1166  
989e29450efaf49 Konstantin Komarov 2025-12-08  1167  int ntfs_read_run_nb_ra(struct ntfs_sb_info *sbi, const struct runs_tree *run,
989e29450efaf49 Konstantin Komarov 2025-12-08  1168  			u64 vbo, void *buf, u32 bytes, struct ntfs_buffers *nb,
989e29450efaf49 Konstantin Komarov 2025-12-08  1169  			struct file_ra_state *ra)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1170  {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1171  	int err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1172  	struct super_block *sb = sbi->sb;
989e29450efaf49 Konstantin Komarov 2025-12-08  1173  	struct address_space *mapping = sb->s_bdev->bd_mapping;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1174  	u32 blocksize = sb->s_blocksize;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1175  	u8 cluster_bits = sbi->cluster_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1176  	u32 off = vbo & sbi->cluster_mask;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1177  	u32 nbh = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1178  	CLST vcn_next, vcn = vbo >> cluster_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1179  	CLST lcn, clen;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1180  	u64 lbo, len;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1181  	size_t idx;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1182  	struct buffer_head *bh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1183  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1184  	if (!run) {
e8b8e97f91b80f0 Kari Argillander   2021-08-03  1185  		/* First reading of $Volume + $MFTMirr + $LogFile goes here. */
82cae269cfa9530 Konstantin Komarov 2021-08-13  1186  		if (vbo > MFT_REC_VOL * sbi->record_size) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1187  			err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1188  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1189  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1190  
e8b8e97f91b80f0 Kari Argillander   2021-08-03  1191  		/* Use absolute boot's 'MFTCluster' to read record. */
82cae269cfa9530 Konstantin Komarov 2021-08-13  1192  		lbo = vbo + sbi->mft.lbo;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1193  		len = sbi->record_size;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1194  	} else if (!run_lookup_entry(run, vcn, &lcn, &clen, &idx)) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1195  		err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1196  		goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1197  	} else {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1198  		if (lcn == SPARSE_LCN) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1199  			err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1200  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1201  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1202  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1203  		lbo = ((u64)lcn << cluster_bits) + off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1204  		len = ((u64)clen << cluster_bits) - off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1205  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1206  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1207  	off = lbo & (blocksize - 1);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1208  	if (nb) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1209  		nb->off = off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1210  		nb->bytes = bytes;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1211  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1212  
989e29450efaf49 Konstantin Komarov 2025-12-08  1213  	if (ra && !ra->ra_pages)
989e29450efaf49 Konstantin Komarov 2025-12-08  1214  		file_ra_state_init(ra, mapping);
989e29450efaf49 Konstantin Komarov 2025-12-08  1215  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1216  	for (;;) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1217  		u32 len32 = len >= bytes ? bytes : len;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1218  		sector_t block = lbo >> sb->s_blocksize_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1219  
989e29450efaf49 Konstantin Komarov 2025-12-08  1220  		if (ra) {
989e29450efaf49 Konstantin Komarov 2025-12-08  1221  			pgoff_t index = lbo >> PAGE_SHIFT;
989e29450efaf49 Konstantin Komarov 2025-12-08  1222  			if (!ra_has_index(ra, index)) {
989e29450efaf49 Konstantin Komarov 2025-12-08  1223  				page_cache_sync_readahead(mapping, ra, NULL,
989e29450efaf49 Konstantin Komarov 2025-12-08  1224  							  index, 1);
989e29450efaf49 Konstantin Komarov 2025-12-08  1225  				ra->prev_pos = (loff_t)index << PAGE_SHIFT;
989e29450efaf49 Konstantin Komarov 2025-12-08  1226  			}
989e29450efaf49 Konstantin Komarov 2025-12-08  1227  		}
989e29450efaf49 Konstantin Komarov 2025-12-08  1228  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1229  		do {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1230  			u32 op = blocksize - off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1231  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1232  			if (op > len32)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1233  				op = len32;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1234  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1235  			bh = ntfs_bread(sb, block);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1236  			if (!bh) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1237  				err = -EIO;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1238  				goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1239  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1240  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1241  			if (buf) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1242  				memcpy(buf, bh->b_data + off, op);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1243  				buf = Add2Ptr(buf, op);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1244  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1245  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1246  			if (!nb) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1247  				put_bh(bh);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1248  			} else if (nbh >= ARRAY_SIZE(nb->bh)) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1249  				err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1250  				goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1251  			} else {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1252  				nb->bh[nbh++] = bh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1253  				nb->nbufs = nbh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1254  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1255  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1256  			bytes -= op;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1257  			if (!bytes)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1258  				return 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1259  			len32 -= op;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1260  			block += 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1261  			off = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1262  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1263  		} while (len32);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1264  
82cae269cfa9530 Konstantin Komarov 2021-08-13 @1265  		vcn_next = vcn + clen;
82cae269cfa9530 Konstantin Komarov 2021-08-13 @1266  		if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen) ||
82cae269cfa9530 Konstantin Komarov 2021-08-13  1267  		    vcn != vcn_next) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1268  			err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1269  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1270  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1271  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1272  		if (lcn == SPARSE_LCN) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1273  			err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1274  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1275  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1276  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1277  		lbo = ((u64)lcn << cluster_bits);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1278  		len = ((u64)clen << cluster_bits);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1279  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1280  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1281  out:
82cae269cfa9530 Konstantin Komarov 2021-08-13  1282  	if (!nbh)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1283  		return err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1284  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1285  	while (nbh) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1286  		put_bh(nb->bh[--nbh]);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1287  		nb->bh[nbh] = NULL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1288  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1289  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1290  	nb->nbufs = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1291  	return err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1292  }
82cae269cfa9530 Konstantin Komarov 2021-08-13  1293  

:::::: The code at line 1265 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initialization of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
