Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58815154441
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Apr 2024 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713429097; cv=none; b=nzlxtjWNdC8iSY00dBMUxwYZ/4UVMiilJpuMnJFL3d0x0JNxvLz/orlmOAHeoujVfvpqxJPK0KmuEs37/azH7p1Zth89pWiZ+VvQPZOR6vTWsIc8PudInDbGzDoLdyt35I8r8hpkKH5SyXcAym0ge1BnuNqJq0rDXn0JCXLpdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713429097; c=relaxed/simple;
	bh=lpjXCCtUJhC8l1FxxmaJ6BWzzYHJL8EjIYYUw9KC+CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EjPXJ9UMOPHW/4SC9xv6eZuzWO5TWns1XnuJqmgbEZPPtbUGQv9Jc/FqjSqSy+fZE0OWr4yZ2dUD55HwMXfIHwO1x3u8ZxyTeozBqWk+BxIUgEwSmwUj579MAcS0Ksod6z4pr7ebbS6RU/CE0Fz6BFWVq8os6rZ789liEf0q8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+Jg/cBH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+Jg/cBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713429095; x=1744965095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lpjXCCtUJhC8l1FxxmaJ6BWzzYHJL8EjIYYUw9KC+CA=;
  b=C+Jg/cBH4ccaTvXR1Z04EgP385rJ3Zrl2D+6652moodXNp1pR27aRnzK
   hFWotOBvQO3PvacdMLa9YmfVE3knC+1lrrhn25L/39TLu4EZTHIacEx8R
   uxyr/L09pIwUskMFE131IqaHQlSD4+QVcmoH2g0XLlsanBR9l1X1i4t7M
   Lczpo/wqYg2RR14u7McXe8C6OCDrkwt6uDTN4EJjs88AVOYdhdfzy4gtF
   FByKhT9WCPsIPACORYRddlXTNN+mzZDkKyVroQxCvwhA6Tpd/+rP3JYGA
   9CvOxRPeNZOIBTgus0KdRIVaVLv5A3upbWkBJiNShFhNJOshz3B1P6dlg
   A==;
X-CSE-ConnectionGUID: gjRtW5wIQOqI1erRvNYrGw==
X-CSE-MsgGUID: ARJi61tGSrWtSG9wi/vnnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8822104"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="8822104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 01:31:28 -0700
X-CSE-ConnectionGUID: cvAaAnM1TPmG97k2dBaGPA==
X-CSE-MsgGUID: LH1etEswTleSv4CT+s3XOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22782142"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2024 01:31:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxNAc-0007Qo-2F;
	Thu, 18 Apr 2024 08:31:06 +0000
Date: Thu, 18 Apr 2024 16:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paragon-software-group-ntfs3:master 12/13] fs/ntfs3/super.c:1241
 ntfs_fill_super() error: uninitialized symbol 'attr'.
Message-ID: <202404181603.e7TTtQJr-lkp@intel.com>
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
CC: ntfs3@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   21b6b5bc6774720b8298d9e362bec01a53ec693b
commit: 6be30a7aa20b0ed8e6d065c714c41ff8cf419c17 [12/13] fs/ntfs3: Remove cached label from sbi
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240418 (https://download.01.org/0day-ci/archive/20240418/202404181603.e7TTtQJr-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404181603.e7TTtQJr-lkp@intel.com/

smatch warnings:
fs/ntfs3/super.c:1241 ntfs_fill_super() error: uninitialized symbol 'attr'.

vim +/attr +1241 fs/ntfs3/super.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1172  
e8b8e97f91b80f Kari Argillander   2021-08-03  1173  /*
e8b8e97f91b80f Kari Argillander   2021-08-03  1174   * ntfs_fill_super - Try to mount.
e8b8e97f91b80f Kari Argillander   2021-08-03  1175   */
610f8f5a7baf99 Kari Argillander   2021-09-07  1176  static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
82cae269cfa953 Konstantin Komarov 2021-08-13  1177  {
82cae269cfa953 Konstantin Komarov 2021-08-13  1178  	int err;
610f8f5a7baf99 Kari Argillander   2021-09-07  1179  	struct ntfs_sb_info *sbi = sb->s_fs_info;
82cae269cfa953 Konstantin Komarov 2021-08-13  1180  	struct block_device *bdev = sb->s_bdev;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1181  	struct ntfs_mount_options *options;
10b4f12c702839 Kari Argillander   2021-09-09  1182  	struct inode *inode;
82cae269cfa953 Konstantin Komarov 2021-08-13  1183  	struct ntfs_inode *ni;
ec5fc720137625 Konstantin Komarov 2022-10-11  1184  	size_t i, tt, bad_len, bad_frags;
82cae269cfa953 Konstantin Komarov 2021-08-13  1185  	CLST vcn, lcn, len;
82cae269cfa953 Konstantin Komarov 2021-08-13  1186  	struct ATTRIB *attr;
82cae269cfa953 Konstantin Komarov 2021-08-13  1187  	const struct VOLUME_INFO *info;
82cae269cfa953 Konstantin Komarov 2021-08-13  1188  	u16 *shared;
82cae269cfa953 Konstantin Komarov 2021-08-13  1189  	struct MFT_REF ref;
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1190  	bool ro = sb_rdonly(sb);
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1191  	struct NTFS_BOOT *boot2 = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1192  
82cae269cfa953 Konstantin Komarov 2021-08-13  1193  	ref.high = 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1194  
82cae269cfa953 Konstantin Komarov 2021-08-13  1195  	sbi->sb = sb;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1196  	sbi->options = options = fc->fs_private;
cd39981fb92adf Konstantin Komarov 2022-05-11  1197  	fc->fs_private = NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1198  	sb->s_flags |= SB_NODIRATIME;
82cae269cfa953 Konstantin Komarov 2021-08-13  1199  	sb->s_magic = 0x7366746e; // "ntfs"
82cae269cfa953 Konstantin Komarov 2021-08-13  1200  	sb->s_op = &ntfs_sops;
82cae269cfa953 Konstantin Komarov 2021-08-13  1201  	sb->s_export_op = &ntfs_export_ops;
82cae269cfa953 Konstantin Komarov 2021-08-13  1202  	sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
82cae269cfa953 Konstantin Komarov 2021-08-13  1203  	sb->s_xattr = ntfs_xattr_handlers;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1204  	sb->s_d_op = options->nocase ? &ntfs_dentry_ops : NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1205  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1206  	options->nls = ntfs_load_nls(options->nls_name);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1207  	if (IS_ERR(options->nls)) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1208  		options->nls = NULL;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1209  		errorf(fc, "Cannot load nls %s", options->nls_name);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1210  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1211  		goto out;
610f8f5a7baf99 Kari Argillander   2021-09-07  1212  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1213  
7b47ef52d0a202 Christoph Hellwig  2022-04-15  1214  	if (bdev_max_discard_sectors(bdev) && bdev_discard_granularity(bdev)) {
7b47ef52d0a202 Christoph Hellwig  2022-04-15  1215  		sbi->discard_granularity = bdev_discard_granularity(bdev);
82cae269cfa953 Konstantin Komarov 2021-08-13  1216  		sbi->discard_granularity_mask_inv =
82cae269cfa953 Konstantin Komarov 2021-08-13  1217  			~(u64)(sbi->discard_granularity - 1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1218  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1219  
e8b8e97f91b80f Kari Argillander   2021-08-03  1220  	/* Parse boot. */
f09dac9afb8e3c Christoph Hellwig  2022-04-15  1221  	err = ntfs_init_from_boot(sb, bdev_logical_block_size(bdev),
f1d325b8c75e90 Konstantin Komarov 2023-05-08  1222  				  bdev_nr_bytes(bdev), &boot2);
82cae269cfa953 Konstantin Komarov 2021-08-13  1223  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1224  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1225  
82cae269cfa953 Konstantin Komarov 2021-08-13  1226  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  1227  	 * Load $Volume. This should be done before $LogFile
ad4d82df0d44e5 Konstantin Komarov 2024-04-16  1228  	 * 'cause 'sbi->volume.ni' is used in 'ntfs_set_state'.
82cae269cfa953 Konstantin Komarov 2021-08-13  1229  	 */
82cae269cfa953 Konstantin Komarov 2021-08-13  1230  	ref.low = cpu_to_le32(MFT_REC_VOL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1231  	ref.seq = cpu_to_le16(MFT_REC_VOL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1232  	inode = ntfs_iget5(sb, &ref, &NAME_VOLUME);
82cae269cfa953 Konstantin Komarov 2021-08-13  1233  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1234  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1235  		ntfs_err(sb, "Failed to load $Volume (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1236  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1237  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1238  
82cae269cfa953 Konstantin Komarov 2021-08-13  1239  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1240  
82cae269cfa953 Konstantin Komarov 2021-08-13 @1241  	attr = ni_find_attr(ni, attr, NULL, ATTR_VOL_INFO, NULL, 0, NULL, NULL);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1242  	if (!attr || is_attr_ext(attr) ||
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1243  	    !(info = resident_data_ex(attr, SIZEOF_ATTRIBUTE_VOLUME_INFO))) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1244  		ntfs_err(sb, "$Volume is corrupted.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1245  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1246  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1247  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1248  
82cae269cfa953 Konstantin Komarov 2021-08-13  1249  	sbi->volume.major_ver = info->major_ver;
82cae269cfa953 Konstantin Komarov 2021-08-13  1250  	sbi->volume.minor_ver = info->minor_ver;
82cae269cfa953 Konstantin Komarov 2021-08-13  1251  	sbi->volume.flags = info->flags;
82cae269cfa953 Konstantin Komarov 2021-08-13  1252  	sbi->volume.ni = ni;
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1253  	if (info->flags & VOLUME_FLAG_DIRTY) {
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1254  		sbi->volume.real_dirty = true;
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1255  		ntfs_info(sb, "It is recommened to use chkdsk.");
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1256  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1257  
e8b8e97f91b80f Kari Argillander   2021-08-03  1258  	/* Load $MFTMirr to estimate recs_mirr. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1259  	ref.low = cpu_to_le32(MFT_REC_MIRR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1260  	ref.seq = cpu_to_le16(MFT_REC_MIRR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1261  	inode = ntfs_iget5(sb, &ref, &NAME_MIRROR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1262  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1263  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1264  		ntfs_err(sb, "Failed to load $MFTMirr (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1265  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1266  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1267  
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1268  	sbi->mft.recs_mirr = ntfs_up_cluster(sbi, inode->i_size) >>
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1269  			     sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1270  
82cae269cfa953 Konstantin Komarov 2021-08-13  1271  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1272  
d3624466b56dd5 Konstantin Komarov 2021-08-31  1273  	/* Load LogFile to replay. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1274  	ref.low = cpu_to_le32(MFT_REC_LOG);
82cae269cfa953 Konstantin Komarov 2021-08-13  1275  	ref.seq = cpu_to_le16(MFT_REC_LOG);
82cae269cfa953 Konstantin Komarov 2021-08-13  1276  	inode = ntfs_iget5(sb, &ref, &NAME_LOGFILE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1277  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1278  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1279  		ntfs_err(sb, "Failed to load \x24LogFile (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1280  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1281  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1282  
82cae269cfa953 Konstantin Komarov 2021-08-13  1283  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1284  
82cae269cfa953 Konstantin Komarov 2021-08-13  1285  	err = ntfs_loadlog_and_replay(ni, sbi);
82cae269cfa953 Konstantin Komarov 2021-08-13  1286  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1287  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1288  
82cae269cfa953 Konstantin Komarov 2021-08-13  1289  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1290  
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1291  	if ((sbi->flags & NTFS_FLAGS_NEED_REPLAY) && !ro) {
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1292  		ntfs_warn(sb, "failed to replay log file. Can't mount rw!");
9b75450d6c5801 Konstantin Komarov 2021-09-28  1293  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1294  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1295  	}
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1296  
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1297  	if ((sbi->volume.flags & VOLUME_FLAG_DIRTY) && !ro && !options->force) {
6a4cd3ea7d771b Konstantin Komarov 2023-05-08  1298  		ntfs_warn(sb, "volume is dirty and \"force\" flag is not set!");
9b75450d6c5801 Konstantin Komarov 2021-09-28  1299  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1300  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1301  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1302  
e8b8e97f91b80f Kari Argillander   2021-08-03  1303  	/* Load $MFT. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1304  	ref.low = cpu_to_le32(MFT_REC_MFT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1305  	ref.seq = cpu_to_le16(1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1306  
82cae269cfa953 Konstantin Komarov 2021-08-13  1307  	inode = ntfs_iget5(sb, &ref, &NAME_MFT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1308  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1309  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1310  		ntfs_err(sb, "Failed to load $MFT (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1311  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1312  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1313  
82cae269cfa953 Konstantin Komarov 2021-08-13  1314  	ni = ntfs_i(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1315  
82cae269cfa953 Konstantin Komarov 2021-08-13  1316  	sbi->mft.used = ni->i_valid >> sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1317  	tt = inode->i_size >> sbi->record_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1318  	sbi->mft.next_free = MFT_REC_USER;
82cae269cfa953 Konstantin Komarov 2021-08-13  1319  
82cae269cfa953 Konstantin Komarov 2021-08-13  1320  	err = wnd_init(&sbi->mft.bitmap, sb, tt);
82cae269cfa953 Konstantin Komarov 2021-08-13  1321  	if (err)
9b75450d6c5801 Konstantin Komarov 2021-09-28  1322  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1323  
82cae269cfa953 Konstantin Komarov 2021-08-13  1324  	err = ni_load_all_mi(ni);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1325  	if (err) {
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1326  		ntfs_err(sb, "Failed to load $MFT's subrecords (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1327  		goto put_inode_out;
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1328  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1329  
82cae269cfa953 Konstantin Komarov 2021-08-13  1330  	sbi->mft.ni = ni;
82cae269cfa953 Konstantin Komarov 2021-08-13  1331  
e8b8e97f91b80f Kari Argillander   2021-08-03  1332  	/* Load $Bitmap. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1333  	ref.low = cpu_to_le32(MFT_REC_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1334  	ref.seq = cpu_to_le16(MFT_REC_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1335  	inode = ntfs_iget5(sb, &ref, &NAME_BITMAP);
82cae269cfa953 Konstantin Komarov 2021-08-13  1336  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1337  		err = PTR_ERR(inode);
e43f6ec224c1b4 Konstantin Komarov 2023-02-15  1338  		ntfs_err(sb, "Failed to load $Bitmap (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1339  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1340  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1341  

:::::: The code at line 1241 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initialization of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
