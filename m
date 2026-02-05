Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66221FF33
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770268913; cv=none; b=lquarj+pG6nrAExJWGUifnTHOwHD3BLaKWLSWiJMRWnG88JQ8TfMidpjj8s0/z0ASr7Q+KGqeVf4MC1Qo/OvOw3g+xYxxRE7ZNueIIM2P8bCO4m7N0kuDPB8dPIBbWoBvFMAyb5NfqAOl2xSofsT60gONKlYQ6om4GH9FdYzHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770268913; c=relaxed/simple;
	bh=nUKLEFzdJo+3WjAgbRKmaDSDNRIsl1HE0tFUMxahfgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZTMnKZXY1H/AOPM+OUW9ELIfjV+Us7La95yVV6Co0QycP6rtZuedBorOmj6Ir1Gi3PAEDXvopnrSxlSpSZiZiQ36bXbtOuuHo2Mi1SL5SmTQ8y5fSyfBgEzEf8YqjPMZoN3hRTzvqWOrsYzR3QTzNZ9VCihdbGb47AFPT9omzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfuoSzK/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfuoSzK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770268911; x=1801804911;
  h=date:from:to:cc:subject:message-id;
  bh=nUKLEFzdJo+3WjAgbRKmaDSDNRIsl1HE0tFUMxahfgA=;
  b=jfuoSzK/BbNkhOiwI31p71TIHpXJx0+zDtv+2yoc7EaDkllwpeVUabEu
   DrOTKGUA+kV8sDgnPPuZ5zU6orWK2SrfBQfTpXSVxAB6JVWBSi/KVf8jb
   3gry6ANpArs9wTjoW4eNruc/hPuK3x+OV6oAJrLhgpkvuNwjhzFp279q3
   hrqEfmRByDz8fvXLXZExyFQo7qaIDzEW3rptEODPPNs26HeVf4y7ZjbKR
   Xs6o5varJSNzHt/2UsCQN/7h9lKEnQqb6/rRsCG00V5SISyGUl3WdU/T4
   sScIu9mRAp5/JaYqXPXMiDDAAe/EhDDPVd1jgJZ3VO2cEChOLQxNjEpmU
   Q==;
X-CSE-ConnectionGUID: TXwXn2dGQCisn34vHbAosA==
X-CSE-MsgGUID: Mx+1LotgRgqXdqZL/vNgfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82579236"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="82579236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:21:50 -0800
X-CSE-ConnectionGUID: NQFHsMW3S/aKFgNZhlt+kQ==
X-CSE-MsgGUID: fooTxIRXSMqY9d9+sud5gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241059650"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2026 21:21:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnroI-00000000jQy-3rSH;
	Thu, 05 Feb 2026 05:21:46 +0000
Date: Thu, 05 Feb 2026 13:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 15/17] fs/ntfs/namei.c:1175
 __ntfs_link() warn: impossible condition '(name_len > 255) => (0-255 > 255)'
Message-ID: <202602051338.GkODvAWr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   329d1d6055016dd5e19c888232c1c2bd7b4d9574
commit: a19f9aa64e837b4981a2e831ca44c88473dda89e [15/17] ntfs: add Kconfig and Makefile
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: sparc64-randconfig-r073-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051338.GkODvAWr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602051338.GkODvAWr-lkp@intel.com/

New smatch warnings:
fs/ntfs/namei.c:1175 __ntfs_link() warn: impossible condition '(name_len > 255) => (0-255 > 255)'
fs/ntfs/mft.c:2463 ntfs_mft_record_alloc() warn: inconsistent indenting

Old smatch warnings:
fs/ntfs/namei.c:239 ntfs_lookup() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1091 ntfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ntfs/mft.c:1034 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2530 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2110)

vim +1175 fs/ntfs/namei.c

dc4b53d443a837 Namjae Jeon 2026-02-04  1134  
dc4b53d443a837 Namjae Jeon 2026-02-04  1135  /*
dc4b53d443a837 Namjae Jeon 2026-02-04  1136   * __ntfs_link - create hard link for file or directory
dc4b53d443a837 Namjae Jeon 2026-02-04  1137   * @ni:		ntfs inode for object to create hard link
dc4b53d443a837 Namjae Jeon 2026-02-04  1138   * @dir_ni:	ntfs inode for directory in which new link should be placed
dc4b53d443a837 Namjae Jeon 2026-02-04  1139   * @name:	unicode name of the new link
dc4b53d443a837 Namjae Jeon 2026-02-04  1140   * @name_len:	length of the name in unicode characters
dc4b53d443a837 Namjae Jeon 2026-02-04  1141   *
dc4b53d443a837 Namjae Jeon 2026-02-04  1142   * Create a new hard link. This involves adding an entry to the directory
dc4b53d443a837 Namjae Jeon 2026-02-04  1143   * index and adding a new FILE_NAME attribute to the target inode.
dc4b53d443a837 Namjae Jeon 2026-02-04  1144   *
dc4b53d443a837 Namjae Jeon 2026-02-04  1145   * Return 0 on success and -errno on error.
dc4b53d443a837 Namjae Jeon 2026-02-04  1146   */
dc4b53d443a837 Namjae Jeon 2026-02-04  1147  static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
dc4b53d443a837 Namjae Jeon 2026-02-04  1148  		__le16 *name, u8 name_len)
dc4b53d443a837 Namjae Jeon 2026-02-04  1149  {
dc4b53d443a837 Namjae Jeon 2026-02-04  1150  	struct super_block *sb;
dc4b53d443a837 Namjae Jeon 2026-02-04  1151  	struct inode *vi = VFS_I(ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1152  	struct file_name_attr *fn = NULL;
dc4b53d443a837 Namjae Jeon 2026-02-04  1153  	int fn_len, err = 0;
dc4b53d443a837 Namjae Jeon 2026-02-04  1154  	struct mft_record *dir_mrec = NULL, *ni_mrec = NULL;
dc4b53d443a837 Namjae Jeon 2026-02-04  1155  
dc4b53d443a837 Namjae Jeon 2026-02-04  1156  	ntfs_debug("Entering.\n");
dc4b53d443a837 Namjae Jeon 2026-02-04  1157  
dc4b53d443a837 Namjae Jeon 2026-02-04  1158  	sb = dir_ni->vol->sb;
dc4b53d443a837 Namjae Jeon 2026-02-04  1159  	if (NInoBeingDeleted(dir_ni) || NInoBeingDeleted(ni))
dc4b53d443a837 Namjae Jeon 2026-02-04  1160  		return -ENOENT;
dc4b53d443a837 Namjae Jeon 2026-02-04  1161  
dc4b53d443a837 Namjae Jeon 2026-02-04  1162  	ni_mrec = map_mft_record(ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1163  	if (IS_ERR(ni_mrec)) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1164  		err = -EIO;
dc4b53d443a837 Namjae Jeon 2026-02-04  1165  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1166  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1167  
dc4b53d443a837 Namjae Jeon 2026-02-04  1168  	if (le16_to_cpu(ni_mrec->link_count) == 0) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1169  		err = -ENOENT;
dc4b53d443a837 Namjae Jeon 2026-02-04  1170  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1171  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1172  
dc4b53d443a837 Namjae Jeon 2026-02-04  1173  	/* Create FILE_NAME attribute. */
dc4b53d443a837 Namjae Jeon 2026-02-04  1174  	fn_len = sizeof(struct file_name_attr) + name_len * sizeof(__le16);
dc4b53d443a837 Namjae Jeon 2026-02-04 @1175  	if (name_len > NTFS_MAX_NAME_LEN) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1176  		err = -EIO;
dc4b53d443a837 Namjae Jeon 2026-02-04  1177  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1178  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1179  	fn = kzalloc(fn_len, GFP_NOFS);
dc4b53d443a837 Namjae Jeon 2026-02-04  1180  	if (!fn) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1181  		err = -ENOMEM;
dc4b53d443a837 Namjae Jeon 2026-02-04  1182  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1183  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1184  
dc4b53d443a837 Namjae Jeon 2026-02-04  1185  	dir_mrec = map_mft_record(dir_ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1186  	if (IS_ERR(dir_mrec)) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1187  		err = -EIO;
dc4b53d443a837 Namjae Jeon 2026-02-04  1188  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1189  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1190  
dc4b53d443a837 Namjae Jeon 2026-02-04  1191  	fn->parent_directory = MK_LE_MREF(dir_ni->mft_no,
dc4b53d443a837 Namjae Jeon 2026-02-04  1192  			le16_to_cpu(dir_mrec->sequence_number));
dc4b53d443a837 Namjae Jeon 2026-02-04  1193  	unmap_mft_record(dir_ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1194  	fn->file_name_length = name_len;
dc4b53d443a837 Namjae Jeon 2026-02-04  1195  	fn->file_name_type = FILE_NAME_POSIX;
dc4b53d443a837 Namjae Jeon 2026-02-04  1196  	fn->file_attributes = ni->flags;
dc4b53d443a837 Namjae Jeon 2026-02-04  1197  	if (ni_mrec->flags & MFT_RECORD_IS_DIRECTORY) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1198  		fn->file_attributes |= FILE_ATTR_DUP_FILE_NAME_INDEX_PRESENT;
dc4b53d443a837 Namjae Jeon 2026-02-04  1199  		fn->allocated_size = fn->data_size = 0;
dc4b53d443a837 Namjae Jeon 2026-02-04  1200  	} else {
dc4b53d443a837 Namjae Jeon 2026-02-04  1201  		if (NInoSparse(ni) || NInoCompressed(ni))
dc4b53d443a837 Namjae Jeon 2026-02-04  1202  			fn->allocated_size =
dc4b53d443a837 Namjae Jeon 2026-02-04  1203  				cpu_to_le64(ni->itype.compressed.size);
dc4b53d443a837 Namjae Jeon 2026-02-04  1204  		else
dc4b53d443a837 Namjae Jeon 2026-02-04  1205  			fn->allocated_size = cpu_to_le64(ni->allocated_size);
dc4b53d443a837 Namjae Jeon 2026-02-04  1206  		fn->data_size = cpu_to_le64(ni->data_size);
dc4b53d443a837 Namjae Jeon 2026-02-04  1207  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1208  	if (NVolHideDotFiles(dir_ni->vol) && name_len > 0 && name[0] == cpu_to_le16('.'))
dc4b53d443a837 Namjae Jeon 2026-02-04  1209  		fn->file_attributes |= FILE_ATTR_HIDDEN;
dc4b53d443a837 Namjae Jeon 2026-02-04  1210  
dc4b53d443a837 Namjae Jeon 2026-02-04  1211  	fn->creation_time = utc2ntfs(ni->i_crtime);
dc4b53d443a837 Namjae Jeon 2026-02-04  1212  	fn->last_data_change_time = utc2ntfs(inode_get_mtime(vi));
dc4b53d443a837 Namjae Jeon 2026-02-04  1213  	fn->last_mft_change_time = utc2ntfs(inode_get_ctime(vi));
dc4b53d443a837 Namjae Jeon 2026-02-04  1214  	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
dc4b53d443a837 Namjae Jeon 2026-02-04  1215  	memcpy(fn->file_name, name, name_len * sizeof(__le16));
dc4b53d443a837 Namjae Jeon 2026-02-04  1216  
dc4b53d443a837 Namjae Jeon 2026-02-04  1217  	/* Add FILE_NAME attribute to index. */
dc4b53d443a837 Namjae Jeon 2026-02-04  1218  	err = ntfs_index_add_filename(dir_ni, fn, MK_MREF(ni->mft_no,
dc4b53d443a837 Namjae Jeon 2026-02-04  1219  					le16_to_cpu(ni_mrec->sequence_number)));
dc4b53d443a837 Namjae Jeon 2026-02-04  1220  	if (err) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1221  		ntfs_error(sb, "Failed to add filename to the index");
dc4b53d443a837 Namjae Jeon 2026-02-04  1222  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1223  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1224  	/* Add FILE_NAME attribute to inode. */
dc4b53d443a837 Namjae Jeon 2026-02-04  1225  	err = ntfs_attr_add(ni, AT_FILE_NAME, AT_UNNAMED, 0, (u8 *)fn, fn_len);
dc4b53d443a837 Namjae Jeon 2026-02-04  1226  	if (err) {
dc4b53d443a837 Namjae Jeon 2026-02-04  1227  		ntfs_error(sb, "Failed to add FILE_NAME attribute.\n");
dc4b53d443a837 Namjae Jeon 2026-02-04  1228  		/* Try to remove just added attribute from index. */
dc4b53d443a837 Namjae Jeon 2026-02-04  1229  		if (ntfs_index_remove(dir_ni, fn, fn_len))
dc4b53d443a837 Namjae Jeon 2026-02-04  1230  			goto rollback_failed;
dc4b53d443a837 Namjae Jeon 2026-02-04  1231  		goto err_out;
dc4b53d443a837 Namjae Jeon 2026-02-04  1232  	}
dc4b53d443a837 Namjae Jeon 2026-02-04  1233  	/* Increment hard links count. */
dc4b53d443a837 Namjae Jeon 2026-02-04  1234  	ni_mrec->link_count = cpu_to_le16(le16_to_cpu(ni_mrec->link_count) + 1);
dc4b53d443a837 Namjae Jeon 2026-02-04  1235  	inc_nlink(VFS_I(ni));
dc4b53d443a837 Namjae Jeon 2026-02-04  1236  
dc4b53d443a837 Namjae Jeon 2026-02-04  1237  	/* Done! */
dc4b53d443a837 Namjae Jeon 2026-02-04  1238  	mark_mft_record_dirty(ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1239  	kfree(fn);
dc4b53d443a837 Namjae Jeon 2026-02-04  1240  	unmap_mft_record(ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1241  
dc4b53d443a837 Namjae Jeon 2026-02-04  1242  	ntfs_debug("Done.\n");
dc4b53d443a837 Namjae Jeon 2026-02-04  1243  
dc4b53d443a837 Namjae Jeon 2026-02-04  1244  	return 0;
dc4b53d443a837 Namjae Jeon 2026-02-04  1245  rollback_failed:
dc4b53d443a837 Namjae Jeon 2026-02-04  1246  	ntfs_error(sb, "Rollback failed. Leaving inconsistent metadata.\n");
dc4b53d443a837 Namjae Jeon 2026-02-04  1247  err_out:
dc4b53d443a837 Namjae Jeon 2026-02-04  1248  	kfree(fn);
dc4b53d443a837 Namjae Jeon 2026-02-04  1249  	if (!IS_ERR_OR_NULL(ni_mrec))
dc4b53d443a837 Namjae Jeon 2026-02-04  1250  		unmap_mft_record(ni);
dc4b53d443a837 Namjae Jeon 2026-02-04  1251  	return err;
dc4b53d443a837 Namjae Jeon 2026-02-04  1252  }
dc4b53d443a837 Namjae Jeon 2026-02-04  1253  

:::::: The code at line 1175 was first introduced by commit
:::::: dc4b53d443a837e14d7729ab86d41863a6b2425e ntfs: update inode operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
