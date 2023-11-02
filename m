Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0762134F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Nov 2023 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgM9dMVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698964616; x=1730500616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuducVA62pRY4CjA/86yvaW/DCcVow+5SHzOdWDPjU8=;
  b=QgM9dMVhRQeQgx2jCaSdSpZvTZ6uY1gJ7AxqyOBH1O9I3V36h15NII+C
   dBiNglbalrFpyWX/enzSvcBa3HoU4Ks0ko4ls6gTMHGfKdZFgZJYQlqNk
   JUHeQ5RWxo8DxqHPwrbqyQNdNBkoiN6NP0D2NI9iSzfuN5aAPN0fZdlg8
   KdeIFBV0NRDWge8KZu8W+wLNI+mCWmCr3wtm+w+dBRBWsNNFhry3CSQbe
   DtQPTnZkL9yAPIRVQvy6Xi58Z372BttaApMbjwXr3kZRN0R3S1QrqMeqr
   mg/ToImJLKg0skYM25VoLVh9OG4zi0x859SeAPS+dvPnrPXaLQx4OkA5D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455324730"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="455324730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 15:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761425398"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="761425398"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Nov 2023 15:36:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qygIv-0001xJ-0w;
	Thu, 02 Nov 2023 22:36:45 +0000
Date: Fri, 3 Nov 2023 06:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/chardev.c:391 bch2_ioctl_fs_usage() warn: check for
 integer overflow 'replica_entries_bytes'
Message-ID: <202311030618.5bKFt0YI-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 22502ac23a2eaa3714b77d4a9242df352a9cd0c0 bcachefs: Redo filesystem usage ioctls
date:   11 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030618.5bKFt0YI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030618.5bKFt0YI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311030618.5bKFt0YI-lkp@intel.com/

New smatch warnings:
fs/bcachefs/chardev.c:391 bch2_ioctl_fs_usage() warn: check for integer overflow 'replica_entries_bytes'

Old smatch warnings:
fs/bcachefs/chardev.c:444 bch2_ioctl_fs_usage() warn: maybe return -EFAULT instead of the bytes remaining?
fs/bcachefs/chardev.c:524 bch2_ioctl_read_super() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/replica_entries_bytes +391 fs/bcachefs/chardev.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  374  
22502ac23a2eaa Kent Overstreet 2019-12-16  375  static long bch2_ioctl_fs_usage(struct bch_fs *c,
22502ac23a2eaa Kent Overstreet 2019-12-16  376  				struct bch_ioctl_fs_usage __user *user_arg)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  377  {
22502ac23a2eaa Kent Overstreet 2019-12-16  378  	struct bch_ioctl_fs_usage *arg = NULL;
22502ac23a2eaa Kent Overstreet 2019-12-16  379  	struct bch_replicas_usage *dst_e, *dst_end;
22502ac23a2eaa Kent Overstreet 2019-12-16  380  	struct bch_fs_usage_online *src;
22502ac23a2eaa Kent Overstreet 2019-12-16  381  	u32 replica_entries_bytes;
22502ac23a2eaa Kent Overstreet 2019-12-16  382  	unsigned i;
22502ac23a2eaa Kent Overstreet 2019-12-16  383  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  384  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  385  	if (!test_bit(BCH_FS_STARTED, &c->flags))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  386  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  387  
22502ac23a2eaa Kent Overstreet 2019-12-16  388  	if (get_user(replica_entries_bytes, &user_arg->replica_entries_bytes))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  389  		return -EFAULT;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  390  
22502ac23a2eaa Kent Overstreet 2019-12-16 @391  	arg = kzalloc(sizeof(*arg) + replica_entries_bytes, GFP_KERNEL);
22502ac23a2eaa Kent Overstreet 2019-12-16  392  	if (!arg)
22502ac23a2eaa Kent Overstreet 2019-12-16  393  		return -ENOMEM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  394  
22502ac23a2eaa Kent Overstreet 2019-12-16  395  	src = bch2_fs_usage_read(c);
22502ac23a2eaa Kent Overstreet 2019-12-16  396  	if (!src) {
22502ac23a2eaa Kent Overstreet 2019-12-16  397  		ret = -ENOMEM;
22502ac23a2eaa Kent Overstreet 2019-12-16  398  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  399  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  400  
22502ac23a2eaa Kent Overstreet 2019-12-16  401  	arg->capacity		= c->capacity;
22502ac23a2eaa Kent Overstreet 2019-12-16  402  	arg->used		= bch2_fs_sectors_used(c, src);
22502ac23a2eaa Kent Overstreet 2019-12-16  403  	arg->online_reserved	= src->online_reserved;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  404  
22502ac23a2eaa Kent Overstreet 2019-12-16  405  	for (i = 0; i < BCH_REPLICAS_MAX; i++)
22502ac23a2eaa Kent Overstreet 2019-12-16  406  		arg->persistent_reserved[i] = src->u.persistent_reserved[i];
7ef2a73a588132 Kent Overstreet 2019-01-21  407  
22502ac23a2eaa Kent Overstreet 2019-12-16  408  	dst_e	= arg->replicas;
22502ac23a2eaa Kent Overstreet 2019-12-16  409  	dst_end = (void *) arg->replicas + replica_entries_bytes;
7ef2a73a588132 Kent Overstreet 2019-01-21  410  
22502ac23a2eaa Kent Overstreet 2019-12-16  411  	for (i = 0; i < c->replicas.nr; i++) {
22502ac23a2eaa Kent Overstreet 2019-12-16  412  		struct bch_replicas_entry *src_e =
22502ac23a2eaa Kent Overstreet 2019-12-16  413  			cpu_replicas_entry(&c->replicas, i);
7ef2a73a588132 Kent Overstreet 2019-01-21  414  
22502ac23a2eaa Kent Overstreet 2019-12-16  415  		if (replicas_usage_next(dst_e) > dst_end) {
22502ac23a2eaa Kent Overstreet 2019-12-16  416  			ret = -ERANGE;
22502ac23a2eaa Kent Overstreet 2019-12-16  417  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  418  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  419  
22502ac23a2eaa Kent Overstreet 2019-12-16  420  		dst_e->sectors		= src->u.replicas[i];
22502ac23a2eaa Kent Overstreet 2019-12-16  421  		dst_e->r		= *src_e;
7ef2a73a588132 Kent Overstreet 2019-01-21  422  
22502ac23a2eaa Kent Overstreet 2019-12-16  423  		/* recheck after setting nr_devs: */
22502ac23a2eaa Kent Overstreet 2019-12-16  424  		if (replicas_usage_next(dst_e) > dst_end) {
22502ac23a2eaa Kent Overstreet 2019-12-16  425  			ret = -ERANGE;
22502ac23a2eaa Kent Overstreet 2019-12-16  426  			break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  427  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  428  
22502ac23a2eaa Kent Overstreet 2019-12-16  429  		memcpy(dst_e->r.devs, src_e->devs, src_e->nr_devs);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  430  
22502ac23a2eaa Kent Overstreet 2019-12-16  431  		dst_e = replicas_usage_next(dst_e);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  432  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  433  
22502ac23a2eaa Kent Overstreet 2019-12-16  434  	arg->replica_entries_bytes = (void *) dst_e - (void *) arg->replicas;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  435  
22502ac23a2eaa Kent Overstreet 2019-12-16  436  	percpu_up_read(&c->mark_lock);
22502ac23a2eaa Kent Overstreet 2019-12-16  437  	kfree(src);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  438  
22502ac23a2eaa Kent Overstreet 2019-12-16  439  	if (!ret)
22502ac23a2eaa Kent Overstreet 2019-12-16  440  		ret = copy_to_user(user_arg, arg,
22502ac23a2eaa Kent Overstreet 2019-12-16  441  			sizeof(*arg) + arg->replica_entries_bytes);
22502ac23a2eaa Kent Overstreet 2019-12-16  442  err:
22502ac23a2eaa Kent Overstreet 2019-12-16  443  	kfree(arg);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  444  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  445  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
