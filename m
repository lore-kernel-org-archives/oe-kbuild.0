Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502928694
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705703061; cv=none; b=gDDotrxFIgjSWc97fcP6CS4vxzCWN90XojUISZOnOktUB0EMY6JGckFfNRrW6tgNIzFmQNzbOZt+iOv/3m9vyHzbDsr3oFR2aRjchpp7L/wnpiA1eJ54xkMUiktZ07xLBepLtBSClFB32v+ulKhoJOn6B0UBKicbrP3CGvuTNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705703061; c=relaxed/simple;
	bh=ysuuavrRQ7EvStXDZN3hI6n+keSXHXm5sRK0CAhXRgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tk/zitfird0ggZItOMv2QO9YQPFbQLG48NOEVdKjR2ezolNyq9A2UgkEwyT+ao3DsyxiGG9HE93HWarpKz0jnepDg+JgULmGT0yqbR+yF5pnFBOFDe5KQIg2ea9pwYe7E4QUceJITc8qRLmGKqEvZbYcyh9mkDL4MAaUVhnKcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDXJaVh7; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDXJaVh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705703059; x=1737239059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ysuuavrRQ7EvStXDZN3hI6n+keSXHXm5sRK0CAhXRgo=;
  b=aDXJaVh7y460g/s6ncjVdFlut7SaDz4K0YefUPF0P5HuD5TUJLqxLvXr
   rbhtSz2JP1MaAWTVRVFUCnGyEIaDwVEndeKlfsu9MDa6MZAt3tMTz4LnU
   xCD2nfMdr0sIr/VtQjNFTeNugQ5sEl8rSok9vKemwtl0rOzqFOuRSkrFv
   PV4p2NZOAIfgYRUuEBy7DfZlN1DFPXuuUwWpCzPwoti+hRsbOUx0cS7Xo
   gippPgpH5A9S6nxQENdT9b7pcm8W3y/bmVZJ9bDkDov1jDS32+q0d2Kjg
   rksSSdjQfvbHgXi2gJ8VoHKvgsWtOehPd8Qr2NhMfkjj4JzbLC2mGELp2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="487007023"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="487007023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 14:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819174984"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="819174984"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2024 14:24:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQxHa-0004TU-22;
	Fri, 19 Jan 2024 22:24:14 +0000
Date: Sat, 20 Jan 2024 06:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13365/13959] fs/bcachefs/buckets.c:730
 bch2_trans_account_disk_usage_change() error: we previously assumed
 'trans->disk_res' could be null (see line 700)
Message-ID: <202401200610.aAkFYwOo-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: 28ce542437e992380e4a5487ee00d4ce0c15a16a [13365/13959] bcachefs: bch2_trans_account_disk_usage_change()
:::::: branch date: 20 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200610.aAkFYwOo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401200610.aAkFYwOo-lkp@intel.com/

smatch warnings:
fs/bcachefs/buckets.c:730 bch2_trans_account_disk_usage_change() error: we previously assumed 'trans->disk_res' could be null (see line 700)

vim +730 fs/bcachefs/buckets.c

920e69bc3db88d Kent Overstreet 2023-01-04  696  
28ce542437e992 Kent Overstreet 2023-11-11  697  void bch2_trans_account_disk_usage_change(struct btree_trans *trans)
35d5aff263629c Kent Overstreet 2021-04-03  698  {
35d5aff263629c Kent Overstreet 2021-04-03  699  	struct bch_fs *c = trans->c;
28ce542437e992 Kent Overstreet 2023-11-11 @700  	u64 disk_res_sectors = trans->disk_res ? trans->disk_res->sectors : 0;
35d5aff263629c Kent Overstreet 2021-04-03  701  	static int warned_disk_usage = 0;
35d5aff263629c Kent Overstreet 2021-04-03  702  	bool warn = false;
35d5aff263629c Kent Overstreet 2021-04-03  703  
58e1ea4bcb0573 Kent Overstreet 2021-11-28  704  	percpu_down_read(&c->mark_lock);
35d5aff263629c Kent Overstreet 2021-04-03  705  	preempt_disable();
28ce542437e992 Kent Overstreet 2023-11-11  706  	struct bch_fs_usage_base *dst = &fs_usage_ptr(c, trans->journal_res.seq, false)->b;
28ce542437e992 Kent Overstreet 2023-11-11  707  	struct bch_fs_usage_base *src = &trans->fs_usage_delta;
35d5aff263629c Kent Overstreet 2021-04-03  708  
28ce542437e992 Kent Overstreet 2023-11-11  709  	s64 added = src->btree + src->data + src->reserved;
35d5aff263629c Kent Overstreet 2021-04-03  710  
35d5aff263629c Kent Overstreet 2021-04-03  711  	/*
35d5aff263629c Kent Overstreet 2021-04-03  712  	 * Not allowed to reduce sectors_available except by getting a
35d5aff263629c Kent Overstreet 2021-04-03  713  	 * reservation:
35d5aff263629c Kent Overstreet 2021-04-03  714  	 */
28ce542437e992 Kent Overstreet 2023-11-11  715  	s64 should_not_have_added = added - (s64) disk_res_sectors;
35d5aff263629c Kent Overstreet 2021-04-03  716  	if (unlikely(should_not_have_added > 0)) {
290448ed2e0ac1 Kent Overstreet 2021-06-10  717  		u64 old, new, v = atomic64_read(&c->sectors_available);
290448ed2e0ac1 Kent Overstreet 2021-06-10  718  
290448ed2e0ac1 Kent Overstreet 2021-06-10  719  		do {
290448ed2e0ac1 Kent Overstreet 2021-06-10  720  			old = v;
290448ed2e0ac1 Kent Overstreet 2021-06-10  721  			new = max_t(s64, 0, old - should_not_have_added);
290448ed2e0ac1 Kent Overstreet 2021-06-10  722  		} while ((v = atomic64_cmpxchg(&c->sectors_available,
290448ed2e0ac1 Kent Overstreet 2021-06-10  723  					       old, new)) != old);
290448ed2e0ac1 Kent Overstreet 2021-06-10  724  
35d5aff263629c Kent Overstreet 2021-04-03  725  		added -= should_not_have_added;
35d5aff263629c Kent Overstreet 2021-04-03  726  		warn = true;
35d5aff263629c Kent Overstreet 2021-04-03  727  	}
35d5aff263629c Kent Overstreet 2021-04-03  728  
35d5aff263629c Kent Overstreet 2021-04-03  729  	if (added > 0) {
35d5aff263629c Kent Overstreet 2021-04-03 @730  		trans->disk_res->sectors -= added;
35d5aff263629c Kent Overstreet 2021-04-03  731  		this_cpu_sub(*c->online_reserved, added);
35d5aff263629c Kent Overstreet 2021-04-03  732  	}
35d5aff263629c Kent Overstreet 2021-04-03  733  
28ce542437e992 Kent Overstreet 2023-11-11  734  	dst->hidden	+= src->hidden;
28ce542437e992 Kent Overstreet 2023-11-11  735  	dst->btree	+= src->btree;
28ce542437e992 Kent Overstreet 2023-11-11  736  	dst->data	+= src->data;
28ce542437e992 Kent Overstreet 2023-11-11  737  	dst->cached	+= src->cached;
28ce542437e992 Kent Overstreet 2023-11-11  738  	dst->reserved	+= src->reserved;
28ce542437e992 Kent Overstreet 2023-11-11  739  	dst->nr_inodes	+= src->nr_inodes;
28ce542437e992 Kent Overstreet 2023-11-11  740  
35d5aff263629c Kent Overstreet 2021-04-03  741  	preempt_enable();
58e1ea4bcb0573 Kent Overstreet 2021-11-28  742  	percpu_up_read(&c->mark_lock);
35d5aff263629c Kent Overstreet 2021-04-03  743  
35d5aff263629c Kent Overstreet 2021-04-03  744  	if (unlikely(warn) && !xchg(&warned_disk_usage, 1))
ad5d3d820a9750 Kent Overstreet 2023-01-25  745  		bch2_trans_inconsistent(trans,
df94cb2e57b2cc Kent Overstreet 2023-10-27  746  					"disk usage increased %lli more than %llu sectors reserved)",
ad5d3d820a9750 Kent Overstreet 2023-01-25  747  					should_not_have_added, disk_res_sectors);
28ce542437e992 Kent Overstreet 2023-11-11  748  }
28ce542437e992 Kent Overstreet 2023-11-11  749  

:::::: The code at line 730 was first introduced by commit
:::::: 35d5aff263629caf98305d12c02d8b64d6981625 bcachefs: Kill bch2_fs_usage_scratch_get()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
