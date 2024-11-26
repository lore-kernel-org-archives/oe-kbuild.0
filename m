Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308141BC07E
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732614079; cv=none; b=IGCqaX5Gq0HDSQl4FhMpfJGke2sUG1a78Zr4YX1MEbvl6/DtXvmZO+rlaPtC/bgufwhbtdFeXVkWOFfAPLc+aYYj47oGYLVwEF53uU1PjYMN0e4Ot3NSEq7SkF5ss6Wp0lhWR9Y2bwTedbVPoBYNbCLcl2ZBLstXTfDBDBYttS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732614079; c=relaxed/simple;
	bh=jvYFEo8ifocOsWJfBUxgoE7DEOp+WrAvSStodtwv/AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pf+Bz9IWDI0XGtA66Cwpo9npEqKTGz5+CIUBLo67yLa65AOj6rbFWBzXE80He1vK34XXycSMa4UipDExOgFGEESCJ+mabO0fxrlTNep4cFYHTplBtYhG1ckhmU8rHNorPqpTu7qrH2YlB+gx49MPIdhgsdUMfZn7iVc1ypPI/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKQoRW2S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKQoRW2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732614077; x=1764150077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvYFEo8ifocOsWJfBUxgoE7DEOp+WrAvSStodtwv/AE=;
  b=IKQoRW2Sm+A/u5Zd/j/yLq/uA69jDAXPohY8RO8Umhm5WZLV35LmFxVa
   YRACZ5zGDi3VvbjqkKlpQgmlK81z45+qhKddHxNhdrpH2xYLPN8vNHhMF
   2mEgaH0xHOy5HR5FmoH5j9ApFVj3bjogKOAOWzdMzRtJa5jqHryKFShzf
   GE1v6DhtZrhvpq/Ra6Sn2C+TjoCBtErpVvtRAm3Dhm6Ol2wBt9bY4Lup+
   AjVX+68fcaFHyuXCY+L98CHaMkXTUw/e0rxezyzFMdeqgu8psfnJZqc5r
   p3EopRgyJQTFcf/1yH52JWD8bI4uvFuCF+TFIAlNakStIUO+URS8/qheI
   Q==;
X-CSE-ConnectionGUID: cxzZH9OITw6uP84morvtmw==
X-CSE-MsgGUID: 8GiyYPY+TPS4+UPvYMdnkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32135554"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32135554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 01:41:15 -0800
X-CSE-ConnectionGUID: ZCamrMrsTE2lJ9osJaP8kQ==
X-CSE-MsgGUID: OM16c7IaTjK1qiPHkwEDmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="96485722"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2024 01:41:14 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFs4F-0007Cn-2C;
	Tue, 26 Nov 2024 09:41:11 +0000
Date: Tue, 26 Nov 2024 17:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/oplock.c:1000 find_same_lease_key() warn: missing
 error code 'err'
Message-ID: <202411261753.E6AvIsTJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Steve French <stfrench@microsoft.com>

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   1 year, 6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-randconfig-161-20241120 (https://download.01.org/0day-ci/archive/20241126/202411261753.E6AvIsTJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261753.E6AvIsTJ-lkp@intel.com/

smatch warnings:
fs/smb/server/oplock.c:1000 find_same_lease_key() warn: missing error code 'err'

vim +/err +1000 fs/smb/server/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   967  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   968  int find_same_lease_key(struct ksmbd_session *sess, struct ksmbd_inode *ci,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   969  			struct lease_ctx_info *lctx)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   970  {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   971  	struct oplock_info *opinfo;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   972  	int err = 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   973  	struct lease_table *lb;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   974  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   975  	if (!lctx)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   976  		return err;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   977  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   978  	read_lock(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   979  	if (list_empty(&lease_table_list)) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   980  		read_unlock(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   981  		return 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   982  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   983  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   984  	list_for_each_entry(lb, &lease_table_list, l_entry) {
af7c39d971e43c fs/ksmbd/oplock.c Namjae Jeon 2022-07-25   985  		if (!memcmp(lb->client_guid, sess->ClientGUID,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   986  			    SMB2_CLIENT_GUID_SIZE))
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   987  			goto found;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   988  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   989  	read_unlock(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   990  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   991  	return 0;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   992  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   993  found:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   994  	rcu_read_lock();
070fb21e5912b6 fs/cifsd/oplock.c Namjae Jeon 2021-05-26   995  	list_for_each_entry_rcu(opinfo, &lb->lease_list, lease_entry) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   996  		if (!atomic_inc_not_zero(&opinfo->refcount))
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   997  			continue;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   998  		rcu_read_unlock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16   999  		if (opinfo->o_fp->f_ci == ci)
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16 @1000  			goto op_next;
af7c39d971e43c fs/ksmbd/oplock.c Namjae Jeon 2022-07-25  1001  		err = compare_guid_key(opinfo, sess->ClientGUID,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1002  				       lctx->lease_key);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1003  		if (err) {
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1004  			err = -EINVAL;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1005  			ksmbd_debug(OPLOCK,
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1006  				    "found same lease key is already used in other files\n");
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1007  			opinfo_put(opinfo);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1008  			goto out;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1009  		}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1010  op_next:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1011  		opinfo_put(opinfo);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1012  		rcu_read_lock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1013  	}
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1014  	rcu_read_unlock();
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1015  
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1016  out:
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1017  	read_unlock(&lease_list_lock);
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1018  	return err;
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1019  }
e2f34481b24db2 fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1020  

:::::: The code at line 1000 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
