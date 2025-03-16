Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233A8C1F
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742117327; cv=none; b=taWm1YNFMi119K3YKcLJ6fBaYkuNw2QBwuos0PCbCv4T6Hvjj55dARhewiRkTq+P6o0uabLCOjME14rGomNkTczPkip52nA4T3BoQx66Xt979JcwpqaZK2E/LRpVSIDX9aCDRZ8KDVh70UxFnheMuz7uLGBRbFy4s0l55dE7vLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742117327; c=relaxed/simple;
	bh=kLVmoDTptokBKUDPwZQZ6zK4dGtMLWZYHO/15TtdfJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AX6QGTIBCb35/6K8yQl376XswIDKO/iqEXOO0hk5w8CgNJy4MIui6ZujWsvOrAHa9NXe96Ij/souH2nJ1l/iZRTwsTRFkx/avpHl8QOZFWQSDV39WNeZd+ElwuLeghC9rX7hFrFbhWaS8L7S+m8IPyzcz4hHo4xOOEyn2DpkBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmlcJYT2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmlcJYT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742117324; x=1773653324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLVmoDTptokBKUDPwZQZ6zK4dGtMLWZYHO/15TtdfJk=;
  b=AmlcJYT2RHvfmoSqqNWZtgcXvk/eLh4Vq1vRI+8+awOLACRC7y6Jj5F9
   q24BqjyJ2g1KZoge1Q8DxznpiP+/y+2CU6b1WEOdplkpe2y2ekiQJ1FLx
   WWy4ZkVLzjgvZTMnJOyq2txS3DV/dTPD9ivjt6CbSomKMbuoxVDLslKoJ
   8CfSiYfqdsNoVu0jT+0vddeYLrEj3T6QaeucbNj5SR1BPTWHrxL/0ybsS
   S9L7ZUenotsk9gBYAHIyZDBROLkr32e4NsW0wo2pgRG2WFDWY8jeItz0/
   ZXzINn/xe9By+XauNQNibxQrt2BiklWo+Uvsoqb7SzOUYqBYaE2Y286Ib
   w==;
X-CSE-ConnectionGUID: F6JHFO8ERBSHcwu3C9fUVg==
X-CSE-MsgGUID: Kr7aDlLAQAiW7SFTmAPamQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="30812145"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="30812145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 02:28:42 -0700
X-CSE-ConnectionGUID: 3r6VUTISQnyvjgIfAPlcCQ==
X-CSE-MsgGUID: IW0qGsZSQeaMZcE/vNcIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126536985"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2025 02:28:41 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttkIQ-000Bvb-2F;
	Sun, 16 Mar 2025 09:28:38 +0000
Date: Sun, 16 Mar 2025 17:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-testing 137/160]
 fs/bcachefs/sysfs.c:670:47-54: ERROR: ca is NULL but dereferenced.
Message-ID: <202503161720.QjMsmKAa-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6d7f54c162635934218ea0cede09f68e40e3bc2f
commit: 864ff7743569d302f47681629973680dd52d5584 [137/160] bcachefs: Filesystem discard option now propagates to devices
:::::: branch date: 8 hours ago
:::::: commit date: 32 hours ago
config: mips-randconfig-r064-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161720.QjMsmKAa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503161720.QjMsmKAa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/sysfs.c:670:47-54: ERROR: ca is NULL but dereferenced.
   fs/bcachefs/sysfs.c:670:63-70: ERROR: ca is NULL but dereferenced.

vim +670 fs/bcachefs/sysfs.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  618  
35e8417972f9735 Kent Overstreet 2025-03-11  619  static ssize_t sysfs_opt_store(struct bch_fs *c,
35e8417972f9735 Kent Overstreet 2025-03-11  620  			       struct bch_dev *ca,
35e8417972f9735 Kent Overstreet 2025-03-11  621  			       enum bch_opt_id id,
35e8417972f9735 Kent Overstreet 2025-03-11  622  			       const char *buf, size_t size)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  623  {
35e8417972f9735 Kent Overstreet 2025-03-11  624  	const struct bch_option *opt = bch2_opt_table + id;
35e8417972f9735 Kent Overstreet 2025-03-11  625  	int ret = 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  626  
f0cc5d2931378b7 Kent Overstreet 2022-03-06  627  	/*
f0cc5d2931378b7 Kent Overstreet 2022-03-06  628  	 * We don't need to take c->writes for correctness, but it eliminates an
f0cc5d2931378b7 Kent Overstreet 2022-03-06  629  	 * unsightly error message in the dmesg log when we're RO:
f0cc5d2931378b7 Kent Overstreet 2022-03-06  630  	 */
d94189ad568f6cb Kent Overstreet 2023-02-09  631  	if (unlikely(!bch2_write_ref_tryget(c, BCH_WRITE_REF_sysfs)))
f0cc5d2931378b7 Kent Overstreet 2022-03-06  632  		return -EROFS;
f0cc5d2931378b7 Kent Overstreet 2022-03-06  633  
a94f317aaacb7f1 Kent Overstreet 2025-03-13  634  	down_write(&c->state_lock);
a94f317aaacb7f1 Kent Overstreet 2025-03-13  635  
35e8417972f9735 Kent Overstreet 2025-03-11  636  	char *tmp = kstrdup(buf, GFP_KERNEL);
f0cc5d2931378b7 Kent Overstreet 2022-03-06  637  	if (!tmp) {
f0cc5d2931378b7 Kent Overstreet 2022-03-06  638  		ret = -ENOMEM;
f0cc5d2931378b7 Kent Overstreet 2022-03-06  639  		goto err;
f0cc5d2931378b7 Kent Overstreet 2022-03-06  640  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  641  
35e8417972f9735 Kent Overstreet 2025-03-11  642  	u64 v;
35e8417972f9735 Kent Overstreet 2025-03-11  643  	ret =   bch2_opt_parse(c, opt, strim(tmp), &v, NULL) ?:
35e8417972f9735 Kent Overstreet 2025-03-11  644  		bch2_opt_check_may_set(c, ca, id, v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  645  	kfree(tmp);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  646  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  647  	if (ret < 0)
f0cc5d2931378b7 Kent Overstreet 2022-03-06  648  		goto err;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  649  
35e8417972f9735 Kent Overstreet 2025-03-11  650  	bch2_opt_set_sb(c, ca, opt, v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  651  	bch2_opt_set_by_id(&c->opts, id, v);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  652  
d7e77f53e90e1eb Kent Overstreet 2024-01-16  653  	if (v &&
d7e77f53e90e1eb Kent Overstreet 2024-01-16  654  	    (id == Opt_background_target ||
f4a9c8c16ff8e90 Kent Overstreet 2025-03-13  655  	     (id == Opt_foreground_target && !c->opts.background_target) ||
d7e77f53e90e1eb Kent Overstreet 2024-01-16  656  	     id == Opt_background_compression ||
d7e77f53e90e1eb Kent Overstreet 2024-01-16  657  	     (id == Opt_compression && !c->opts.background_compression)))
fb3f57bb1177ae4 Kent Overstreet 2023-10-20  658  		bch2_set_rebalance_needs_scan(c, 0);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  659  
c22508470439014 Kent Overstreet 2024-10-24  660  	if (v && id == Opt_rebalance_enabled)
c22508470439014 Kent Overstreet 2024-10-24  661  		rebalance_wakeup(c);
c22508470439014 Kent Overstreet 2024-10-24  662  
c22508470439014 Kent Overstreet 2024-10-24  663  	if (v && id == Opt_copygc_enabled &&
c22508470439014 Kent Overstreet 2024-10-24  664  	    c->copygc_thread)
c22508470439014 Kent Overstreet 2024-10-24  665  		wake_up_process(c->copygc_thread);
c22508470439014 Kent Overstreet 2024-10-24  666  
864ff7743569d30 Kent Overstreet 2025-03-13  667  	if (id == Opt_discard && !ca) {
864ff7743569d30 Kent Overstreet 2025-03-13  668  		mutex_lock(&c->sb_lock);
864ff7743569d30 Kent Overstreet 2025-03-13  669  		for_each_member_device(c, ca)
864ff7743569d30 Kent Overstreet 2025-03-13 @670  			opt->set_member(bch2_members_v2_get_mut(ca->disk_sb.sb, ca->dev_idx), v);
864ff7743569d30 Kent Overstreet 2025-03-13  671  
864ff7743569d30 Kent Overstreet 2025-03-13  672  		bch2_write_super(c);
864ff7743569d30 Kent Overstreet 2025-03-13  673  		mutex_unlock(&c->sb_lock);
864ff7743569d30 Kent Overstreet 2025-03-13  674  	}
864ff7743569d30 Kent Overstreet 2025-03-13  675  
f0cc5d2931378b7 Kent Overstreet 2022-03-06  676  	ret = size;
f0cc5d2931378b7 Kent Overstreet 2022-03-06  677  err:
a94f317aaacb7f1 Kent Overstreet 2025-03-13  678  	up_write(&c->state_lock);
d94189ad568f6cb Kent Overstreet 2023-02-09  679  	bch2_write_ref_put(c, BCH_WRITE_REF_sysfs);
f0cc5d2931378b7 Kent Overstreet 2022-03-06  680  	return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  681  }
35e8417972f9735 Kent Overstreet 2025-03-11  682  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
