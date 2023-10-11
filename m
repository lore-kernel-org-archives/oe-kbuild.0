Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E404689
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcKGA35u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696991230; x=1728527230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7HLPQkn49dwb/Xm+4Usy5YlxClVRDmegdI4XOuvAKY=;
  b=UcKGA35uXlZio0LxYVQo7cfKUkjzsZTDdf+M5+e+HOTpxGShjG2qJ574
   jFB+ZK+BtOEABF+/ugj3/AW3SicCxDYSp6a1KKhc0iT2YIAdh/efJJpCQ
   C/g+Qb4yd9RnhHA50xBbZ+ET0chVwhA3wnm7HoPMJzwcj/PBqs4N32HG5
   /gUPe51iWOQMB8n7Isjk+1SD4eoO66wOkc76RLFBgH4w3yzsrSdppjjJk
   T/4F8DiB9GbeXuo5lDZhMqGUl9kOtfhoTTDd2/CJGtZ+pfZtooCGzh97W
   k8bqfNJWc7CMX5Y1qA9d9FNgdOOBS06Hsp76NhXGYWv2SOWUsiqjRGD5c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364845172"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="364845172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 19:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897460733"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897460733"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 19:25:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqOwE-0001ZR-05;
	Wed, 11 Oct 2023 02:27:06 +0000
Date: Wed, 11 Oct 2023 10:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/oplock.c:1000 find_same_lease_key() warn: missing
 error code 'err'
Message-ID: <202310111052.j4RLfmsd-lkp@intel.com>
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
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231011/202310111052.j4RLfmsd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111052.j4RLfmsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310111052.j4RLfmsd-lkp@intel.com/

smatch warnings:
fs/smb/server/oplock.c:1000 find_same_lease_key() warn: missing error code 'err'

vim +/err +1000 fs/smb/server/oplock.c

e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   967  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   968  int find_same_lease_key(struct ksmbd_session *sess, struct ksmbd_inode *ci,
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   969  			struct lease_ctx_info *lctx)
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   970  {
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   971  	struct oplock_info *opinfo;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   972  	int err = 0;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   973  	struct lease_table *lb;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   974  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   975  	if (!lctx)
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   976  		return err;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   977  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   978  	read_lock(&lease_list_lock);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   979  	if (list_empty(&lease_table_list)) {
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   980  		read_unlock(&lease_list_lock);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   981  		return 0;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   982  	}
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   983  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   984  	list_for_each_entry(lb, &lease_table_list, l_entry) {
af7c39d971e43cd0 fs/ksmbd/oplock.c Namjae Jeon 2022-07-25   985  		if (!memcmp(lb->client_guid, sess->ClientGUID,
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   986  			    SMB2_CLIENT_GUID_SIZE))
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   987  			goto found;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   988  	}
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   989  	read_unlock(&lease_list_lock);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   990  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   991  	return 0;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   992  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   993  found:
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   994  	rcu_read_lock();
070fb21e5912b6aa fs/cifsd/oplock.c Namjae Jeon 2021-05-26   995  	list_for_each_entry_rcu(opinfo, &lb->lease_list, lease_entry) {
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   996  		if (!atomic_inc_not_zero(&opinfo->refcount))
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   997  			continue;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   998  		rcu_read_unlock();
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16   999  		if (opinfo->o_fp->f_ci == ci)
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16 @1000  			goto op_next;
af7c39d971e43cd0 fs/ksmbd/oplock.c Namjae Jeon 2022-07-25  1001  		err = compare_guid_key(opinfo, sess->ClientGUID,
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1002  				       lctx->lease_key);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1003  		if (err) {
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1004  			err = -EINVAL;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1005  			ksmbd_debug(OPLOCK,
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1006  				    "found same lease key is already used in other files\n");
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1007  			opinfo_put(opinfo);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1008  			goto out;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1009  		}
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1010  op_next:
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1011  		opinfo_put(opinfo);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1012  		rcu_read_lock();
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1013  	}
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1014  	rcu_read_unlock();
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1015  
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1016  out:
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1017  	read_unlock(&lease_list_lock);
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1018  	return err;
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1019  }
e2f34481b24db2fd fs/cifsd/oplock.c Namjae Jeon 2021-03-16  1020  

:::::: The code at line 1000 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
