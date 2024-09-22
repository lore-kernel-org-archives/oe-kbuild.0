Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FE1E529
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 03:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726974437; cv=none; b=ZnI5d3+ZvUWA/JELYTKWMnfNFw/G1oDlpfRasfwvJzllssBgUa2aIETXKo6GsQ4ml58qBYrceCE3Y9HER7WIWqJMKihjPRlvaINDvZouEou0Z8hKWnJFzg5eA0Ujm8PvmJgP6dyjILMVHtrBoR7zbCkx0D+of6at0ERGWR6+TT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726974437; c=relaxed/simple;
	bh=UjN86H8wUJmZiWgXYPcY2qoqeQPp5BqtIm1MnZxmrB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fiqj7sw4jqzoB0ZckXPYO94p65y2FVH51qGRFe9yoAlwP8zaWg9/OiuyJRkmXuYjettAAIZccOeip5cI6ugp3r0uvTeBHeaYha91ymZg4OoY+S6ZSsGNvD0onw3oFIjUgMhyIRF25fE1Te9GN26/9LhsgVWS8nYGxvYWhOr2dCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMNmTG8G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMNmTG8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726974435; x=1758510435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjN86H8wUJmZiWgXYPcY2qoqeQPp5BqtIm1MnZxmrB8=;
  b=fMNmTG8GOfn5ur+0l1K/IevvMggaPyvww8K6oh7Sc2IsK36EbhUyiQeU
   zVwzi5HTzPef77LT42tUR5tjil2C0FbE94kG3HHvu29jOyQ4yHRPEfFvk
   ymFkzoJocNewKgfvj9DiDzrP9N6bg2vqC/MI0IbN5lQnsaaecCIFcj3j6
   tGPWGilCuXd9feoJPyyCC71HPFGnFJqHpfRByT+Ff4vgJmMCUH6aM7698
   x82qvd+n3BP2CHq+fnmUCejbwJr4f110kNDiYIDc1vOm+iPFVaDCks+1n
   z8okinwYsvPCfjbzp4Di2N3WmM0t3svuU82rS4TuutuzRqNihHZWOIvoL
   g==;
X-CSE-ConnectionGUID: 9fV1SGlqRg2kPp7oEh5x7w==
X-CSE-MsgGUID: H4J0QGEXSSeuq6VRqR9Nkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43415247"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="43415247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 20:07:15 -0700
X-CSE-ConnectionGUID: 829ukApsRQmo8QC//Sp0ow==
X-CSE-MsgGUID: HUduPFD4TZSJgrhuSIMjSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75474837"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Sep 2024 20:07:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssCwI-000Fz6-2v;
	Sun, 22 Sep 2024 03:07:10 +0000
Date: Sun, 22 Sep 2024 11:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 9912/30000] fs/incfs/vfs.c:1222
 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
Message-ID: <202409221052.YsEbHigM-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 040942fc50b20325bb56737c32b303268bb6f35c [9912/30000] ANDROID: Initial commit of Incremental FS
:::::: branch date: 3 weeks ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240922/202409221052.YsEbHigM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221052.YsEbHigM-lkp@intel.com/

smatch warnings:
fs/incfs/vfs.c:1222 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
fs/incfs/vfs.c:1522 dir_lookup() warn: passing zero to 'ERR_PTR'
fs/incfs/vfs.c:2153 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

vim +/named_file_dentry +1222 fs/incfs/vfs.c

040942fc50b203 Eugene Zemtsov 2019-11-18  1155  
040942fc50b203 Eugene Zemtsov 2019-11-18  1156  static long ioctl_create_file(struct mount_info *mi,
040942fc50b203 Eugene Zemtsov 2019-11-18  1157  			struct incfs_new_file_args __user *usr_args)
040942fc50b203 Eugene Zemtsov 2019-11-18  1158  {
040942fc50b203 Eugene Zemtsov 2019-11-18  1159  	struct incfs_new_file_args args;
040942fc50b203 Eugene Zemtsov 2019-11-18  1160  	char *file_id_str = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1161  	struct dentry *index_file_dentry = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1162  	struct dentry *named_file_dentry = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1163  	struct path parent_dir_path = {};
040942fc50b203 Eugene Zemtsov 2019-11-18  1164  	struct inode *index_dir_inode = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1165  	__le64 size_attr_value = 0;
040942fc50b203 Eugene Zemtsov 2019-11-18  1166  	char *file_name = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1167  	char *attr_value = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1168  	int error = 0;
040942fc50b203 Eugene Zemtsov 2019-11-18  1169  	bool locked = false;
040942fc50b203 Eugene Zemtsov 2019-11-18  1170  
040942fc50b203 Eugene Zemtsov 2019-11-18  1171  	if (!mi || !mi->mi_index_dir) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1172  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1173  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1174  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1175  	if (!access_ok(VERIFY_READ, usr_args, sizeof(args))) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1176  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1177  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1178  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1179  	if (copy_from_user(&args, usr_args, sizeof(args)) > 0) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1180  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1181  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1182  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1183  
040942fc50b203 Eugene Zemtsov 2019-11-18  1184  	file_name = strndup_user(u64_to_user_ptr(args.file_name), PATH_MAX);
040942fc50b203 Eugene Zemtsov 2019-11-18  1185  	if (IS_ERR(file_name)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1186  		error = PTR_ERR(file_name);
040942fc50b203 Eugene Zemtsov 2019-11-18  1187  		file_name = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1188  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1189  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1190  
040942fc50b203 Eugene Zemtsov 2019-11-18  1191  	error = validate_name(file_name);
040942fc50b203 Eugene Zemtsov 2019-11-18  1192  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1193  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1194  
040942fc50b203 Eugene Zemtsov 2019-11-18  1195  	file_id_str = file_id_to_str(args.file_id);
040942fc50b203 Eugene Zemtsov 2019-11-18  1196  	if (!file_id_str) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1197  		error = -ENOMEM;
040942fc50b203 Eugene Zemtsov 2019-11-18  1198  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1199  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1200  
040942fc50b203 Eugene Zemtsov 2019-11-18  1201  	error = mutex_lock_interruptible(&mi->mi_dir_struct_mutex);
040942fc50b203 Eugene Zemtsov 2019-11-18  1202  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1203  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1204  	locked = true;
040942fc50b203 Eugene Zemtsov 2019-11-18  1205  
040942fc50b203 Eugene Zemtsov 2019-11-18  1206  	/* Find a directory to put the file into. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1207  	error = dir_relative_path_resolve(mi,
040942fc50b203 Eugene Zemtsov 2019-11-18  1208  			u64_to_user_ptr(args.directory_path),
040942fc50b203 Eugene Zemtsov 2019-11-18  1209  			&parent_dir_path);
040942fc50b203 Eugene Zemtsov 2019-11-18  1210  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1211  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1212  
040942fc50b203 Eugene Zemtsov 2019-11-18  1213  	if (parent_dir_path.dentry == mi->mi_index_dir) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1214  		/* Can't create a file directly inside .index */
040942fc50b203 Eugene Zemtsov 2019-11-18  1215  		error = -EBUSY;
040942fc50b203 Eugene Zemtsov 2019-11-18  1216  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1217  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1218  
040942fc50b203 Eugene Zemtsov 2019-11-18  1219  	/* Look up a dentry in the parent dir. It should be negative. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1220  	named_file_dentry = incfs_lookup_dentry(parent_dir_path.dentry,
040942fc50b203 Eugene Zemtsov 2019-11-18  1221  					file_name);
040942fc50b203 Eugene Zemtsov 2019-11-18 @1222  	if (!named_file_dentry) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1223  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1224  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1225  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1226  	if (IS_ERR(named_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1227  		error = PTR_ERR(named_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1228  		named_file_dentry = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1229  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1230  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1231  	if (d_really_is_positive(named_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1232  		/* File with this path already exists. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1233  		error = -EEXIST;
040942fc50b203 Eugene Zemtsov 2019-11-18  1234  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1235  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1236  	/* Look up a dentry in the .index dir. It should be negative. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1237  	index_file_dentry = incfs_lookup_dentry(mi->mi_index_dir, file_id_str);
040942fc50b203 Eugene Zemtsov 2019-11-18  1238  	if (!index_file_dentry) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1239  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1240  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1241  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1242  	if (IS_ERR(index_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1243  		error = PTR_ERR(index_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1244  		index_file_dentry = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1245  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1246  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1247  	if (d_really_is_positive(index_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1248  		/* File with this ID already exists in index. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1249  		error = -EEXIST;
040942fc50b203 Eugene Zemtsov 2019-11-18  1250  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1251  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1252  
040942fc50b203 Eugene Zemtsov 2019-11-18  1253  	/* Creating a file in the .index dir. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1254  	index_dir_inode = d_inode(mi->mi_index_dir);
040942fc50b203 Eugene Zemtsov 2019-11-18  1255  	inode_lock_nested(index_dir_inode, I_MUTEX_PARENT);
040942fc50b203 Eugene Zemtsov 2019-11-18  1256  	error = vfs_create(index_dir_inode, index_file_dentry,
040942fc50b203 Eugene Zemtsov 2019-11-18  1257  			args.mode, true);
040942fc50b203 Eugene Zemtsov 2019-11-18  1258  	inode_unlock(index_dir_inode);
040942fc50b203 Eugene Zemtsov 2019-11-18  1259  
040942fc50b203 Eugene Zemtsov 2019-11-18  1260  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1261  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1262  	if (!d_really_is_positive(index_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1263  		error = -EINVAL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1264  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1265  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1266  
040942fc50b203 Eugene Zemtsov 2019-11-18  1267  	/* Save the file's ID as an xattr for easy fetching in future. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1268  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_ID_NAME,
040942fc50b203 Eugene Zemtsov 2019-11-18  1269  		file_id_str, strlen(file_id_str), XATTR_CREATE);
040942fc50b203 Eugene Zemtsov 2019-11-18  1270  	if (error) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1271  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
040942fc50b203 Eugene Zemtsov 2019-11-18  1272  		goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1273  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1274  
040942fc50b203 Eugene Zemtsov 2019-11-18  1275  	/* Save the file's size as an xattr for easy fetching in future. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1276  	size_attr_value = cpu_to_le64(args.size);
040942fc50b203 Eugene Zemtsov 2019-11-18  1277  	error = vfs_setxattr(index_file_dentry, INCFS_XATTR_SIZE_NAME,
040942fc50b203 Eugene Zemtsov 2019-11-18  1278  		(char *)&size_attr_value, sizeof(size_attr_value),
040942fc50b203 Eugene Zemtsov 2019-11-18  1279  		XATTR_CREATE);
040942fc50b203 Eugene Zemtsov 2019-11-18  1280  	if (error) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1281  		pr_debug("incfs: vfs_setxattr err:%d\n", error);
040942fc50b203 Eugene Zemtsov 2019-11-18  1282  		goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1283  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1284  
040942fc50b203 Eugene Zemtsov 2019-11-18  1285  	/* Save the file's attrubute as an xattr */
040942fc50b203 Eugene Zemtsov 2019-11-18  1286  	if (args.file_attr_len && args.file_attr) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1287  		if (args.file_attr_len > INCFS_MAX_FILE_ATTR_SIZE) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1288  			error = -E2BIG;
040942fc50b203 Eugene Zemtsov 2019-11-18  1289  			goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1290  		}
040942fc50b203 Eugene Zemtsov 2019-11-18  1291  
040942fc50b203 Eugene Zemtsov 2019-11-18  1292  		attr_value = kmalloc(args.file_attr_len, GFP_NOFS);
040942fc50b203 Eugene Zemtsov 2019-11-18  1293  		if (!attr_value) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1294  			error = -ENOMEM;
040942fc50b203 Eugene Zemtsov 2019-11-18  1295  			goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1296  		}
040942fc50b203 Eugene Zemtsov 2019-11-18  1297  
040942fc50b203 Eugene Zemtsov 2019-11-18  1298  		if (!access_ok(VERIFY_READ, u64_to_user_ptr(args.file_attr),
040942fc50b203 Eugene Zemtsov 2019-11-18  1299  			       args.file_attr_len)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1300  			error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1301  			goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1302  		}
040942fc50b203 Eugene Zemtsov 2019-11-18  1303  
040942fc50b203 Eugene Zemtsov 2019-11-18  1304  		if (copy_from_user(attr_value,
040942fc50b203 Eugene Zemtsov 2019-11-18  1305  				u64_to_user_ptr(args.file_attr),
040942fc50b203 Eugene Zemtsov 2019-11-18  1306  				args.file_attr_len) > 0) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1307  			error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1308  			goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1309  		}
040942fc50b203 Eugene Zemtsov 2019-11-18  1310  
040942fc50b203 Eugene Zemtsov 2019-11-18  1311  		error = vfs_setxattr(index_file_dentry,
040942fc50b203 Eugene Zemtsov 2019-11-18  1312  				INCFS_XATTR_METADATA_NAME,
040942fc50b203 Eugene Zemtsov 2019-11-18  1313  				attr_value, args.file_attr_len,
040942fc50b203 Eugene Zemtsov 2019-11-18  1314  				XATTR_CREATE);
040942fc50b203 Eugene Zemtsov 2019-11-18  1315  
040942fc50b203 Eugene Zemtsov 2019-11-18  1316  		if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1317  			goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1318  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1319  
040942fc50b203 Eugene Zemtsov 2019-11-18  1320  	/* Initializing a newly created file. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1321  	error = init_new_file(mi, index_file_dentry, &args.file_id, args.size,
040942fc50b203 Eugene Zemtsov 2019-11-18  1322  			range(attr_value, args.file_attr_len),
040942fc50b203 Eugene Zemtsov 2019-11-18  1323  			(struct incfs_file_signature_info __user *)
040942fc50b203 Eugene Zemtsov 2019-11-18  1324  				args.signature_info);
040942fc50b203 Eugene Zemtsov 2019-11-18  1325  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1326  		goto delete_index_file;
040942fc50b203 Eugene Zemtsov 2019-11-18  1327  
040942fc50b203 Eugene Zemtsov 2019-11-18  1328  	/* Linking a file with it's real name from the requested dir. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1329  	error = incfs_link(index_file_dentry, named_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1330  
040942fc50b203 Eugene Zemtsov 2019-11-18  1331  	if (!error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1332  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1333  
040942fc50b203 Eugene Zemtsov 2019-11-18  1334  delete_index_file:
040942fc50b203 Eugene Zemtsov 2019-11-18  1335  	incfs_unlink(index_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1336  
040942fc50b203 Eugene Zemtsov 2019-11-18  1337  out:
040942fc50b203 Eugene Zemtsov 2019-11-18  1338  	if (error)
040942fc50b203 Eugene Zemtsov 2019-11-18  1339  		pr_debug("incfs: %s err:%d\n", __func__, error);
040942fc50b203 Eugene Zemtsov 2019-11-18  1340  
040942fc50b203 Eugene Zemtsov 2019-11-18  1341  	kfree(file_id_str);
040942fc50b203 Eugene Zemtsov 2019-11-18  1342  	kfree(file_name);
040942fc50b203 Eugene Zemtsov 2019-11-18  1343  	kfree(attr_value);
040942fc50b203 Eugene Zemtsov 2019-11-18  1344  	dput(named_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1345  	dput(index_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1346  	path_put(&parent_dir_path);
040942fc50b203 Eugene Zemtsov 2019-11-18  1347  	if (locked)
040942fc50b203 Eugene Zemtsov 2019-11-18  1348  		mutex_unlock(&mi->mi_dir_struct_mutex);
040942fc50b203 Eugene Zemtsov 2019-11-18  1349  	return error;
040942fc50b203 Eugene Zemtsov 2019-11-18  1350  }
040942fc50b203 Eugene Zemtsov 2019-11-18  1351  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
