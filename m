Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209921AB515
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730590445; cv=none; b=CRhXlzQIrhL+k4RWGGXK7OwZPTPk86vatKXGf8OBz6tklH47g2ed/q00Hmg5A6y0dJOKPL+Vv8GFOcrmM0V+fhbTiGxHKDmKnssK/YQqHycTwKsAcQs+/M0zKQuGFNlVbdHgQFBHo0W4MQw+UoViIR4N4mMmbwium+GiH5r2vIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730590445; c=relaxed/simple;
	bh=dCXLZtezpqwbXEzwg0oNYa6GtbuCA1pt1TLzirKuYBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VfABjAuzSm6YpRLkvR/BD6K4kBdr/Cs2TEoSEATvjF270PifiNh1AzG6s6Z3M3BTSLfKFiF8eUrG4KZmv5+/FbrKBT1637atGnOUd1IPTOcHQAgRICY5QSI9KVUhAzXme0BtMojCbNLcABh255XItgbsjEw1p4ZWJvLsAu1RNxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnBlryzK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnBlryzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730590443; x=1762126443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCXLZtezpqwbXEzwg0oNYa6GtbuCA1pt1TLzirKuYBw=;
  b=WnBlryzKYvxsmEel4eStae1WmZL3s1rwETsP/94PRdAvZeTCovJi+D+L
   +fLPwLrQ2eyFqXie/3yZE0vHqYxKcorZI9Nall1BKwMD+m3cdnA/IkQH4
   pHnJQ3NxpPzz7xhDxE59s3VtFKM2m+IQwNa2f0izaTlXjyzQdcPFAcYQk
   wn6vaUbElLw2L5SDkPOQ54rgqnq7o5cJmyavtvMV8SCUo9OmKpvvMZ+m2
   m1uJoaDZKqoOp2klg45ZBaB9HgLdwsgC3kDnryXlfI23I88Xk7/IAtXh/
   gpw3+vGj/XTZz7sSE3b2weolfGhR2RSEJ57C/QbRRh+gs7htcsHapiVhO
   g==;
X-CSE-ConnectionGUID: D/hZekgYQ1WW3CNF3puWvg==
X-CSE-MsgGUID: UUq26edWQEqM/bfzzrDN8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52883294"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52883294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 16:34:02 -0700
X-CSE-ConnectionGUID: Tp5qcmnKQpK6a+YB392+jQ==
X-CSE-MsgGUID: DsMplTLWQrSO61foxoUUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83636076"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 16:34:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Nd1-000jS7-0Y;
	Sat, 02 Nov 2024 23:33:59 +0000
Date: Sun, 3 Nov 2024 07:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387] fs/incfs/vfs.c:1223
 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
Message-ID: <202411030731.34PPiO81-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: 1be052b20ba04b635cf87bcff80de5314697953e [387/387] ANDROID: Initial commit of Incremental FS
:::::: branch date: 6 days ago
:::::: commit date: 4 years, 9 months ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241103/202411030731.34PPiO81-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411030731.34PPiO81-lkp@intel.com/

New smatch warnings:
fs/incfs/vfs.c:1223 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
fs/incfs/vfs.c:1523 dir_lookup() warn: passing zero to 'ERR_PTR'
fs/incfs/vfs.c:2154 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/incfs/data_mgmt.h:263 get_incfs_node() warn: always true condition '(inode->i_sb->s_magic != (357661101641)) => (0-u32max != 357661101641)'

vim +/named_file_dentry +1223 fs/incfs/vfs.c

1be052b20ba04b Eugene Zemtsov 2019-11-18  1156  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1157  static long ioctl_create_file(struct mount_info *mi,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1158  			struct incfs_new_file_args __user *usr_args)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1159  {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1160  	struct incfs_new_file_args args;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1161  	char *file_id_str = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1162  	struct dentry *index_file_dentry = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1163  	struct dentry *named_file_dentry = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1164  	struct path parent_dir_path = {};
1be052b20ba04b Eugene Zemtsov 2019-11-18  1165  	struct inode *index_dir_inode = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1166  	__le64 size_attr_value = 0;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1167  	char *file_name = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1168  	char *attr_value = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1169  	int error = 0;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1170  	bool locked = false;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1171  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1172  	if (!mi || !mi->mi_index_dir) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1173  		error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1174  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1175  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1176  	if (!access_ok(usr_args, sizeof(args))) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1177  		error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1178  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1179  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1180  	if (copy_from_user(&args, usr_args, sizeof(args)) > 0) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1181  		error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1182  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1183  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1184  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1185  	file_name = strndup_user(u64_to_user_ptr(args.file_name), PATH_MAX);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1186  	if (IS_ERR(file_name)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1187  		error = PTR_ERR(file_name);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1188  		file_name = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1189  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1190  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1191  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1192  	error = validate_name(file_name);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1193  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1194  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1195  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1196  	file_id_str = file_id_to_str(args.file_id);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1197  	if (!file_id_str) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1198  		error = -ENOMEM;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1199  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1200  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1201  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1202  	error = mutex_lock_interruptible(&mi->mi_dir_struct_mutex);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1203  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1204  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1205  	locked = true;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1206  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1207  	/* Find a directory to put the file into. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1208  	error = dir_relative_path_resolve(mi,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1209  			u64_to_user_ptr(args.directory_path),
1be052b20ba04b Eugene Zemtsov 2019-11-18  1210  			&parent_dir_path);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1211  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1212  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1213  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1214  	if (parent_dir_path.dentry == mi->mi_index_dir) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1215  		/* Can't create a file directly inside .index */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1216  		error = -EBUSY;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1217  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1218  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1219  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1220  	/* Look up a dentry in the parent dir. It should be negative. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1221  	named_file_dentry = incfs_lookup_dentry(parent_dir_path.dentry,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1222  					file_name);
1be052b20ba04b Eugene Zemtsov 2019-11-18 @1223  	if (!named_file_dentry) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1224  		error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1225  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1226  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1227  	if (IS_ERR(named_file_dentry)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1228  		error = PTR_ERR(named_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1229  		named_file_dentry = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1230  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1231  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1232  	if (d_really_is_positive(named_file_dentry)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1233  		/* File with this path already exists. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1234  		error = -EEXIST;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1235  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1236  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1237  	/* Look up a dentry in the .index dir. It should be negative. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1238  	index_file_dentry = incfs_lookup_dentry(mi->mi_index_dir, file_id_str);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1239  	if (!index_file_dentry) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1240  		error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1241  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1242  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1243  	if (IS_ERR(index_file_dentry)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1244  		error = PTR_ERR(index_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1245  		index_file_dentry = NULL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1246  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1247  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1248  	if (d_really_is_positive(index_file_dentry)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1249  		/* File with this ID already exists in index. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1250  		error = -EEXIST;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1251  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1252  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1253  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1254  	/* Creating a file in the .index dir. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1255  	index_dir_inode = d_inode(mi->mi_index_dir);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1256  	inode_lock_nested(index_dir_inode, I_MUTEX_PARENT);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1257  	error = vfs_create(index_dir_inode, index_file_dentry,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1258  			args.mode, true);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1259  	inode_unlock(index_dir_inode);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1260  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1261  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1262  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1263  	if (!d_really_is_positive(index_file_dentry)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1264  		error = -EINVAL;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1265  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1266  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1267  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1268  	/* Save the file's ID as an xattr for easy fetching in future. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1269  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_ID_NAME,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1270  		file_id_str, strlen(file_id_str), XATTR_CREATE);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1271  	if (error) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1272  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1273  		goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1274  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1275  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1276  	/* Save the file's size as an xattr for easy fetching in future. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1277  	size_attr_value = cpu_to_le64(args.size);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1278  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_SIZE_NAME,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1279  		(char *)&size_attr_value, sizeof(size_attr_value),
1be052b20ba04b Eugene Zemtsov 2019-11-18  1280  		XATTR_CREATE);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1281  	if (error) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1282  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1283  		goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1284  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1285  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1286  	/* Save the file's attrubute as an xattr */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1287  	if (args.file_attr_len && args.file_attr) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1288  		if (args.file_attr_len > INCFS_MAX_FILE_ATTR_SIZE) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1289  			error = -E2BIG;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1290  			goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1291  		}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1292  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1293  		attr_value = kmalloc(args.file_attr_len, GFP_NOFS);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1294  		if (!attr_value) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1295  			error = -ENOMEM;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1296  			goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1297  		}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1298  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1299  		if (!access_ok(u64_to_user_ptr(args.file_attr),
1be052b20ba04b Eugene Zemtsov 2019-11-18  1300  			       args.file_attr_len)) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1301  			error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1302  			goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1303  		}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1304  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1305  		if (copy_from_user(attr_value,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1306  				u64_to_user_ptr(args.file_attr),
1be052b20ba04b Eugene Zemtsov 2019-11-18  1307  				args.file_attr_len) > 0) {
1be052b20ba04b Eugene Zemtsov 2019-11-18  1308  			error = -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1309  			goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1310  		}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1311  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1312  		error = vfs_setxattr(index_file_dentry,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1313  				INCFS_XATTR_METADATA_NAME,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1314  				attr_value, args.file_attr_len,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1315  				XATTR_CREATE);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1316  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1317  		if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1318  			goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1319  	}
1be052b20ba04b Eugene Zemtsov 2019-11-18  1320  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1321  	/* Initializing a newly created file. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1322  	error = init_new_file(mi, index_file_dentry, &args.file_id, args.size,
1be052b20ba04b Eugene Zemtsov 2019-11-18  1323  			range(attr_value, args.file_attr_len),
1be052b20ba04b Eugene Zemtsov 2019-11-18  1324  			(struct incfs_file_signature_info __user *)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1325  				args.signature_info);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1326  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1327  		goto delete_index_file;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1328  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1329  	/* Linking a file with it's real name from the requested dir. */
1be052b20ba04b Eugene Zemtsov 2019-11-18  1330  	error = incfs_link(index_file_dentry, named_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1331  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1332  	if (!error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1333  		goto out;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1334  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1335  delete_index_file:
1be052b20ba04b Eugene Zemtsov 2019-11-18  1336  	incfs_unlink(index_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1337  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1338  out:
1be052b20ba04b Eugene Zemtsov 2019-11-18  1339  	if (error)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1340  		pr_debug("incfs: %s err:%d\n", __func__, error);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1341  
1be052b20ba04b Eugene Zemtsov 2019-11-18  1342  	kfree(file_id_str);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1343  	kfree(file_name);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1344  	kfree(attr_value);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1345  	dput(named_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1346  	dput(index_file_dentry);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1347  	path_put(&parent_dir_path);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1348  	if (locked)
1be052b20ba04b Eugene Zemtsov 2019-11-18  1349  		mutex_unlock(&mi->mi_dir_struct_mutex);
1be052b20ba04b Eugene Zemtsov 2019-11-18  1350  	return error;
1be052b20ba04b Eugene Zemtsov 2019-11-18  1351  }
1be052b20ba04b Eugene Zemtsov 2019-11-18  1352  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
