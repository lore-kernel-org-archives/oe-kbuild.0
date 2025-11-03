Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6A22FE0E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157381; cv=none; b=qWuGJ++O6TOlYviXoUmDjfVI4kKBXyvDkEF0OTLQg1osJ6pJbScXW6xHNV8qJCCGGdNzQp/y6xsJNU2r4VNraqRGkUtUqDm6erNbXDvUGJt8o8QXudUyLG1jxe3vGviPnRvRoZDTFT7JkN8Oa3QGbQla+U3/brJ0gTilhjx+m+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157381; c=relaxed/simple;
	bh=LgDtB52Rbe68zXKU/1kuoyE0wfEMMmp+iFQy1DUCdyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLQO9uQMJyi3s+8VD1hSOiHPjcoQzDYBWR9C2HmmvrLyBfE/T6gUSMVICdLnW2Mu6+Xvs5Z8Nfiks8xErTw/G6c1uVN6EybjMNa/UJT1Q68DjqpNzavJQNdLaicIK7QyNRW7lcg1n6q9qKeLSNnBGjmu008n2b05uNsyxWk9NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmfWPf80; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmfWPf80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157379; x=1793693379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgDtB52Rbe68zXKU/1kuoyE0wfEMMmp+iFQy1DUCdyQ=;
  b=ZmfWPf80H+CjC1UJeBM9POYp11k04EwNLYDwwX1gBoFUiecDYkqQrTeP
   Xt9XtCUvbqPSnglXwHtB6nPxWzKYTEjwI/OAe+vvnoivQlc/VTimeabHc
   39OIAGY0ldah9wmdTXoeAlNCjN8N7jshsgfenKogtD/6lqu3uSx+3E0ZZ
   NlGx9/JctfxV2oi3nw5ODdU4sYZZrkCPjQgZC+2bx6gb2EHU9FLAlwnMc
   St+PBHR1Rzy59zE3v86t7+U4qgKTmDbFuHP6L/OnrzL+oCBusVTu0GR+s
   OyoZdHc5gimVr6uhft6anfyX32Te+6Fda2QgHB+sCM2mNXp1NKzeU6vNi
   w==;
X-CSE-ConnectionGUID: SVsdes9dS3KQ/ZVtbQyuBw==
X-CSE-MsgGUID: P1iv8fFlTu+JUTNcEXZhVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63432208"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="63432208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:09:39 -0800
X-CSE-ConnectionGUID: NUndG9vBQlGD7FL0maGAQg==
X-CSE-MsgGUID: NWt0w6k3S/Oz9TBIdl9/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186090892"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Nov 2025 00:09:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFpd9-000PwK-2f;
	Mon, 03 Nov 2025 08:09:35 +0000
Date: Mon, 3 Nov 2025 16:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 8/9] net/unix/af_unix.c:1224
 unix_find_bsd() error: uninitialized symbol 'err'.
Message-ID: <202511031622.KHegM2GM-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   fea79c89ff947a69a55fed5ce86a70840e6d719c
commit: cde5b9551377b1da18cf4330fbcfa61e3b674b64 [8/9] unix: don't copy creds
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031622.KHegM2GM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511031622.KHegM2GM-lkp@intel.com/

smatch warnings:
net/unix/af_unix.c:1224 unix_find_bsd() error: uninitialized symbol 'err'.

vim +/err +1224 net/unix/af_unix.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1201  
51bae889fe111e Kuniyuki Iwashima 2022-07-02  1202  static struct sock *unix_find_bsd(struct sockaddr_un *sunaddr, int addr_len,
a9194f88782afa Christian Brauner 2025-05-16  1203  				  int type, int flags)
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1204  {
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1205  	struct inode *inode;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1206  	struct path path;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1207  	struct sock *sk;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1208  	int err;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1209  
d2d8c9fddb1c11 Kuniyuki Iwashima 2021-11-24  1210  	unix_mkname_bsd(sunaddr, addr_len);
a9194f88782afa Christian Brauner 2025-05-16  1211  
a9194f88782afa Christian Brauner 2025-05-16  1212  	if (flags & SOCK_COREDUMP) {
a9194f88782afa Christian Brauner 2025-05-16  1213  		struct path root;
a9194f88782afa Christian Brauner 2025-05-16  1214  
a9194f88782afa Christian Brauner 2025-05-16  1215  		task_lock(&init_task);
a9194f88782afa Christian Brauner 2025-05-16  1216  		get_fs_root(init_task.fs, &root);
a9194f88782afa Christian Brauner 2025-05-16  1217  		task_unlock(&init_task);
a9194f88782afa Christian Brauner 2025-05-16  1218  
cde5b9551377b1 Christian Brauner 2025-11-03  1219  		scoped_with_kernel_creds()
a9194f88782afa Christian Brauner 2025-05-16  1220  			err = vfs_path_lookup(root.dentry, root.mnt, sunaddr->sun_path,
a9194f88782afa Christian Brauner 2025-05-16  1221  					      LOOKUP_BENEATH | LOOKUP_NO_SYMLINKS |
a9194f88782afa Christian Brauner 2025-05-16  1222  					      LOOKUP_NO_MAGICLINKS, &path);
a9194f88782afa Christian Brauner 2025-05-16  1223  		path_put(&root);
a9194f88782afa Christian Brauner 2025-05-16 @1224  		if (err)
a9194f88782afa Christian Brauner 2025-05-16  1225  			goto fail;
a9194f88782afa Christian Brauner 2025-05-16  1226  	} else {
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1227  		err = kern_path(sunaddr->sun_path, LOOKUP_FOLLOW, &path);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1228  		if (err)
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1229  			goto fail;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1230  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1231  		err = path_permission(&path, MAY_WRITE);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1232  		if (err)
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1233  			goto path_put;
a9194f88782afa Christian Brauner 2025-05-16  1234  	}
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1235  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1236  	err = -ECONNREFUSED;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1237  	inode = d_backing_inode(path.dentry);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1238  	if (!S_ISSOCK(inode->i_mode))
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1239  		goto path_put;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1240  
51bae889fe111e Kuniyuki Iwashima 2022-07-02  1241  	sk = unix_find_socket_byinode(inode);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1242  	if (!sk)
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1243  		goto path_put;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1244  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1245  	err = -EPROTOTYPE;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1246  	if (sk->sk_type == type)
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1247  		touch_atime(&path);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1248  	else
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1249  		goto sock_put;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1250  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1251  	path_put(&path);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1252  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1253  	return sk;
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1254  
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1255  sock_put:
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1256  	sock_put(sk);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1257  path_put:
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1258  	path_put(&path);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1259  fail:
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1260  	return ERR_PTR(err);
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1261  }
fa39ef0e472961 Kuniyuki Iwashima 2021-11-24  1262  

:::::: The code at line 1224 was first introduced by commit
:::::: a9194f88782afa1386641451a6c76beaa60485a0 coredump: add coredump socket

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
