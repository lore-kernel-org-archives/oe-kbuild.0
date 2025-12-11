Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2A3B8D48
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765486433; cv=none; b=ozxUj6Sy/YM9FOqGrYdlOuziWBc0jcAJjVDVh8gMsHXmo78moPG6h010BicaE/o6aNO3XHgzPGr4TLrZeZUQ119rJLBN0whokfgOP+8efrC/1xQNTV7X/byn37ho+Isb6ZLWUZe4FuqOP5Lu7ANRG5qYzfXnwCqGcWhnOkXPmnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765486433; c=relaxed/simple;
	bh=VWVGJmSGLwbmmzmwWgiI1piO9BVDkJA8/pEx7V1YWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i76yi/sQbmoO5uNKTCoCK3PjeZ0E9LMNBQjGkq0K7dwGTI46iMOKhvOOKM4v7KeeNtDwv66lc8lll07UkERBtqFAHsGlOMDr60joP+8+qVrgAdfqKs7sXRSKyhw5VRfSEafwKuZTJKy0biOBsTjEf/oIkTW84RfLmmWuRl3d4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caUg7wBB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caUg7wBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765486432; x=1797022432;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VWVGJmSGLwbmmzmwWgiI1piO9BVDkJA8/pEx7V1YWuE=;
  b=caUg7wBBBD4emTNkH+CS2G2jZPM0lvKPpSKMsy3PUI+AGzmBMOSAh1OL
   qAWkMIdilWovQ6vRUHdp/42a4YwDLJ1alpbryuVYmm/qDMHOHpinCQAqO
   2/VUZpSci/QnkZbauR774iWS5bbFmTutwmXdq9VFUsQRZDVzHxds3p4Fv
   w4XokvtjOdamzL0Vi3H9zckQ2vfPzBUfZ2sE7x+pOE0bnTmq3pMK0qUup
   czL+B6vpDV8MXwXowf04UU+WwSHUW/E8kLg2/hWVbFjghPs2dI5LhdB6/
   Q7wFxNaL8Jd/VcdFNG2yAdP246laXjdEyUzRrmgzmzMjm1EW0PJ4iN0g8
   w==;
X-CSE-ConnectionGUID: m7j3OgPRQ2qC3I3/VgqFZg==
X-CSE-MsgGUID: gCHr7OM2RHK2QRiDv76p9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67212117"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67212117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 12:53:50 -0800
X-CSE-ConnectionGUID: tgXagJB9SHaVzbyhqCDQNg==
X-CSE-MsgGUID: wajwNNdURJSDd5TGt0UKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201373160"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 12:53:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTnfW-0000000056z-2H39;
	Thu, 11 Dec 2025 20:53:46 +0000
Date: Fri, 12 Dec 2025 04:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/dir.c:1176 ceph_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202512120406.qXoszsdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120406.qXoszsdu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120406.qXoszsdu-lkp@intel.com/

New smatch warnings:
fs/ceph/dir.c:1176 ceph_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/ceph/dir.c:908 ceph_handle_notrace_create() warn: passing zero to 'PTR_ERR'

vim +/ERR_PTR +1176 fs/ceph/dir.c

2817b000b02c5f Sage Weil         2009-10-06  1094  
88d5baf69082e5 NeilBrown         2025-02-27  1095  static struct dentry *ceph_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  1096  				 struct dentry *dentry, umode_t mode)
2817b000b02c5f Sage Weil         2009-10-06  1097  {
2678da88f4b449 Xiubo Li          2020-09-03  1098  	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(dir->i_sb);
38d46409c4639a Xiubo Li          2023-06-12  1099  	struct ceph_client *cl = mdsc->fsc->client;
2817b000b02c5f Sage Weil         2009-10-06  1100  	struct ceph_mds_request *req;
5c31e92dffb94c Yan, Zheng        2019-05-26  1101  	struct ceph_acl_sec_ctx as_ctx = {};
4868e537fa867f Xiubo Li          2022-05-10  1102  	int err;
2817b000b02c5f Sage Weil         2009-10-06  1103  	int op;
2817b000b02c5f Sage Weil         2009-10-06  1104  
4868e537fa867f Xiubo Li          2022-05-10  1105  	err = ceph_wait_on_conflict_unlink(dentry);
4868e537fa867f Xiubo Li          2022-05-10  1106  	if (err)
88d5baf69082e5 NeilBrown         2025-02-27  1107  		return ERR_PTR(err);
4868e537fa867f Xiubo Li          2022-05-10  1108  
2817b000b02c5f Sage Weil         2009-10-06  1109  	if (ceph_snap(dir) == CEPH_SNAPDIR) {
2817b000b02c5f Sage Weil         2009-10-06  1110  		/* mkdir .snap/foo is a MKSNAP */
2817b000b02c5f Sage Weil         2009-10-06  1111  		op = CEPH_MDS_OP_MKSNAP;
38d46409c4639a Xiubo Li          2023-06-12  1112  		doutc(cl, "mksnap %llx.%llx/'%pd' dentry %p\n",
38d46409c4639a Xiubo Li          2023-06-12  1113  		      ceph_vinop(dir), dentry, dentry);
2817b000b02c5f Sage Weil         2009-10-06  1114  	} else if (ceph_snap(dir) == CEPH_NOSNAP) {
38d46409c4639a Xiubo Li          2023-06-12  1115  		doutc(cl, "mkdir %llx.%llx/'%pd' dentry %p mode 0%ho\n",
38d46409c4639a Xiubo Li          2023-06-12  1116  		      ceph_vinop(dir), dentry, dentry, mode);
2817b000b02c5f Sage Weil         2009-10-06  1117  		op = CEPH_MDS_OP_MKDIR;
2817b000b02c5f Sage Weil         2009-10-06  1118  	} else {
4868e537fa867f Xiubo Li          2022-05-10  1119  		err = -EROFS;
2817b000b02c5f Sage Weil         2009-10-06  1120  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1121  	}
b1ee94aa593abd Yan, Zheng        2014-09-16  1122  
2596366907f872 Yan, Zheng        2018-01-12  1123  	if (op == CEPH_MDS_OP_MKDIR &&
2596366907f872 Yan, Zheng        2018-01-12  1124  	    ceph_quota_is_max_files_exceeded(dir)) {
b7a2921765cf79 Luis Henriques    2018-01-05  1125  		err = -EDQUOT;
b7a2921765cf79 Luis Henriques    2018-01-05  1126  		goto out;
b7a2921765cf79 Luis Henriques    2018-01-05  1127  	}
abd4fc775857cd Luís Henriques    2022-08-25  1128  	if ((op == CEPH_MDS_OP_MKSNAP) && IS_ENCRYPTED(dir) &&
abd4fc775857cd Luís Henriques    2022-08-25  1129  	    !fscrypt_has_encryption_key(dir)) {
abd4fc775857cd Luís Henriques    2022-08-25  1130  		err = -ENOKEY;
abd4fc775857cd Luís Henriques    2022-08-25  1131  		goto out;
abd4fc775857cd Luís Henriques    2022-08-25  1132  	}
b7a2921765cf79 Luis Henriques    2018-01-05  1133  
b1ee94aa593abd Yan, Zheng        2014-09-16  1134  
2817b000b02c5f Sage Weil         2009-10-06  1135  	req = ceph_mdsc_create_request(mdsc, op, USE_AUTH_MDS);
2817b000b02c5f Sage Weil         2009-10-06  1136  	if (IS_ERR(req)) {
2817b000b02c5f Sage Weil         2009-10-06  1137  		err = PTR_ERR(req);
2817b000b02c5f Sage Weil         2009-10-06  1138  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1139  	}
2817b000b02c5f Sage Weil         2009-10-06  1140  
ec9595c080c6f0 Jeff Layton       2020-08-26  1141  	mode |= S_IFDIR;
ec9595c080c6f0 Jeff Layton       2020-08-26  1142  	req->r_new_inode = ceph_new_inode(dir, dentry, &mode, &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1143  	if (IS_ERR(req->r_new_inode)) {
ec9595c080c6f0 Jeff Layton       2020-08-26  1144  		err = PTR_ERR(req->r_new_inode);
ec9595c080c6f0 Jeff Layton       2020-08-26  1145  		req->r_new_inode = NULL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1146  		goto out_req;
ec9595c080c6f0 Jeff Layton       2020-08-26  1147  	}
ec9595c080c6f0 Jeff Layton       2020-08-26  1148  
2817b000b02c5f Sage Weil         2009-10-06  1149  	req->r_dentry = dget(dentry);
2817b000b02c5f Sage Weil         2009-10-06  1150  	req->r_num_caps = 2;
3dd69aabcef3d8 Jeff Layton       2017-01-31  1151  	req->r_parent = dir;
4c18347238ab5a Jeff Layton       2021-06-18  1152  	ihold(dir);
3dd69aabcef3d8 Jeff Layton       2017-01-31  1153  	set_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags);
09838f1bfd40f4 Christian Brauner 2023-08-07  1154  	if (op == CEPH_MDS_OP_MKDIR)
09838f1bfd40f4 Christian Brauner 2023-08-07  1155  		req->r_mnt_idmap = mnt_idmap_get(idmap);
2817b000b02c5f Sage Weil         2009-10-06  1156  	req->r_args.mkdir.mode = cpu_to_le32(mode);
d9d00f71ab5a2b Xiubo Li          2023-06-05  1157  	req->r_dentry_drop = CEPH_CAP_FILE_SHARED | CEPH_CAP_AUTH_EXCL |
d9d00f71ab5a2b Xiubo Li          2023-06-05  1158  			     CEPH_CAP_XATTR_EXCL;
2817b000b02c5f Sage Weil         2009-10-06  1159  	req->r_dentry_unless = CEPH_CAP_FILE_EXCL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1160  
ec9595c080c6f0 Jeff Layton       2020-08-26  1161  	ceph_as_ctx_to_req(req, &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1162  
2817b000b02c5f Sage Weil         2009-10-06  1163  	err = ceph_mdsc_do_request(mdsc, dir, req);
275dd19ea4e84c Yan, Zheng        2014-12-10  1164  	if (!err &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1165  	    !req->r_reply_info.head->is_target &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1166  	    !req->r_reply_info.head->is_dentry)
2817b000b02c5f Sage Weil         2009-10-06  1167  		err = ceph_handle_notrace_create(dir, dentry);
ec9595c080c6f0 Jeff Layton       2020-08-26  1168  out_req:
2817b000b02c5f Sage Weil         2009-10-06  1169  	ceph_mdsc_put_request(req);
2817b000b02c5f Sage Weil         2009-10-06  1170  out:
b20a95a0dd47c5 Yan, Zheng        2014-02-11  1171  	if (!err)
5c31e92dffb94c Yan, Zheng        2019-05-26  1172  		ceph_init_inode_acls(d_inode(dentry), &as_ctx);
b20a95a0dd47c5 Yan, Zheng        2014-02-11  1173  	else
2817b000b02c5f Sage Weil         2009-10-06  1174  		d_drop(dentry);
5c31e92dffb94c Yan, Zheng        2019-05-26  1175  	ceph_release_acl_sec_ctx(&as_ctx);
88d5baf69082e5 NeilBrown         2025-02-27 @1176  	return ERR_PTR(err);
2817b000b02c5f Sage Weil         2009-10-06  1177  }
2817b000b02c5f Sage Weil         2009-10-06  1178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
