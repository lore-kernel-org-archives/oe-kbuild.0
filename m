Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135630;
	b=QFQYhX40uUkcA/Ocgdr/A2/6Grt6jKTBpGKtMfquKIQ8fMMM7BJwsLerAA3FLe5XE2J3
	 ufWHgNIVmLBDJjUfQbjFI4AnAt6hWeejHBeH4wh1u2jKVL42akd43U3o6tozIOfh/qQWo
	 DwA+feeAuZxz3wE54wis40YRs797ZNPOZ4Pud68WKYLX/nPHWjv9ZOl4WmqzRbU1Bs6AA
	 Ex9AoBA3lBolDUtJbFln1VhwurAoR/5k54FV8BMNbe5CwRR5nf4NK29RpDaibtCGQrLmn
	 NKjdZYCqg1i/Q8dD1JhukZU7l9vNbn46W14DXCE+4a2QEadriCLp06cpXnhcdCJgJLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135630;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rc5T2iATopdz3u6oVaSee0jsGi2oXqYe5dOQLwaATkg=;
	b=ayq0qvbbHicuKCuaYZgOznEnRUBYnJWSC9ghSmlWibc7vKHvlAS6rndajFbuyyukUiuK
	 3i6OLOVAr3gMZV+J8QnexaSxcW0EwtCXU78SGchicTs6Sz/dBLe8I2Gt6OGfeWdZXQgcj
	 YphtZKPUyDX7FaGW/g8L4aIg9hstTsfzfYp1cTnFjtN5ucvpZ/XCELT30v7+rYsoumWY9
	 7VBvFcNay5qIZHf38ia5zw47BrZ5j8uZN1UDpSJ9Z/VuRMmwai78AR7fzkIfPMVSYKyEP
	 QMGfG7Wfs90prBP1a5ULMO/2UKiL4N/Ei5fgDIs6oOabFAK/a75ziJNp4gZr+be5TSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BNFbv37L;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC3606A321
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 11:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCC3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BNFbv37L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794135627; x=1825671627;
  h=date:from:to:cc:subject:message-id;
  bh=46UYuFr7b6AfTJbY5xcZjMLJs8GRZQ0M0I+g2qN2oe0=;
  b=BNFbv37LyS40CBXG9Bj/2416Ayxvj2Ii5LnfoMjpZOQjcb3r1IpDkUpC
   jjz2e6AuRfRqJUlREpeJVsgx97ifTeEJ6xsor5qZiqEOcqzWY84x5A9b1
   ZgIrpYLy6ohE6JFRA7ELAP+K31hoo/a0GnT4108rQfqMyZFw108e9ibV+
   hjzzxMWdMEEAyT3rP+sjsz8AnHAz2pwIxjEzOHaiztzcSchWtUf4VOqD8
   oI07DKnn5iz/yZDL797UPUF3jfTSgyhljxvgEDmdVIiM9kzooJRy6bcaI
   X+ahucj5hpgdHbNj3lpCEAd8nkEIgTpHu387GUF3Qqj0jiLeTYK1/G8k5
   Q==;
X-CSE-ConnectionGUID: K/8tigBYSjyXyRFsGYxG/A==
X-CSE-MsgGUID: 22y2uTK2ROeArCNUlcbETw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2763666"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2763666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 03:00:26 -0800
X-CSE-ConnectionGUID: exP/MvsZQtq6FDFx4QqLbg==
X-CSE-MsgGUID: WVWrCwc1Q/+PUACFSy2xgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7812220"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2026 03:00:22 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ0dG-00000000BR3-0iMr;
	Sun, 08 Nov 2026 11:00:18 +0000
Date: Sun, 08 Nov 2026 11:59:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 303/303]
 fs/btrfs/extent-tree.c:182 btrfs_lookup_extent_info() error: we previously
 assumed 'trans' could be null (see line 141)
Message-ID: <202611081134.CIwI3Nm5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f012a641c30644ec5bf95cf64d8835854b997f86
commit: 9c309d2434abbe880712af7e60da9ead8b6703fe [303/303] btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261108/202611081134.CIwI3Nm5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611081134.CIwI3Nm5-lkp@intel.com/

New smatch warnings:
fs/btrfs/extent-tree.c:182 btrfs_lookup_extent_info() error: we previously assumed 'trans' could be null (see line 141)

Old smatch warnings:
fs/btrfs/extent-tree.c:410 btrfs_get_extent_inline_ref_type() warn: argument 4 to %lx specifier is cast from pointer
fs/btrfs/extent-tree.c:5082 do_walk_down() warn: missing unwind goto?

vim +/trans +182 fs/btrfs/extent-tree.c

7bb86316c3961d1 Chris Mason               2007-12-11  103  
a22285a6a323901 Yan, Zheng                2010-05-16  104  /*
3173a18f70554fe Josef Bacik               2013-03-07  105   * helper function to lookup reference count and flags of a tree block.
a22285a6a323901 Yan, Zheng                2010-05-16  106   *
a22285a6a323901 Yan, Zheng                2010-05-16  107   * the head node for delayed ref is used to store the sum of all the
a22285a6a323901 Yan, Zheng                2010-05-16  108   * reference count modifications queued up in the rbtree. the head
a22285a6a323901 Yan, Zheng                2010-05-16  109   * node may also store the extent flags to set. This way you can check
a22285a6a323901 Yan, Zheng                2010-05-16  110   * to see what the reference count and extent flags would be if all of
a22285a6a323901 Yan, Zheng                2010-05-16  111   * the delayed refs are not processed.
a22285a6a323901 Yan, Zheng                2010-05-16  112   */
a22285a6a323901 Yan, Zheng                2010-05-16  113  int btrfs_lookup_extent_info(struct btrfs_trans_handle *trans,
2ff7e61e0d30ff1 Jeff Mahoney              2016-06-22  114  			     struct btrfs_fs_info *fs_info, u64 bytenr,
3173a18f70554fe Josef Bacik               2013-03-07  115  			     u64 offset, int metadata, u64 *refs, u64 *flags)
a22285a6a323901 Yan, Zheng                2010-05-16  116  {
a22285a6a323901 Yan, Zheng                2010-05-16  117  	struct btrfs_delayed_ref_head *head;
a22285a6a323901 Yan, Zheng                2010-05-16  118  	struct btrfs_delayed_ref_root *delayed_refs;
a22285a6a323901 Yan, Zheng                2010-05-16  119  	struct btrfs_path *path;
a22285a6a323901 Yan, Zheng                2010-05-16  120  	struct btrfs_extent_item *ei;
a22285a6a323901 Yan, Zheng                2010-05-16  121  	struct extent_buffer *leaf;
a22285a6a323901 Yan, Zheng                2010-05-16  122  	struct btrfs_key key;
a22285a6a323901 Yan, Zheng                2010-05-16  123  	u32 item_size;
a22285a6a323901 Yan, Zheng                2010-05-16  124  	u64 num_refs;
a22285a6a323901 Yan, Zheng                2010-05-16  125  	u64 extent_flags;
a22285a6a323901 Yan, Zheng                2010-05-16  126  	int ret;
a22285a6a323901 Yan, Zheng                2010-05-16  127  
3173a18f70554fe Josef Bacik               2013-03-07  128  	/*
3173a18f70554fe Josef Bacik               2013-03-07  129  	 * If we don't have skinny metadata, don't bother doing anything
3173a18f70554fe Josef Bacik               2013-03-07  130  	 * different
3173a18f70554fe Josef Bacik               2013-03-07  131  	 */
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  132  	if (metadata && !btrfs_fs_incompat(fs_info, SKINNY_METADATA)) {
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  133  		offset = fs_info->nodesize;
3173a18f70554fe Josef Bacik               2013-03-07  134  		metadata = 0;
3173a18f70554fe Josef Bacik               2013-03-07  135  	}
3173a18f70554fe Josef Bacik               2013-03-07  136  
a22285a6a323901 Yan, Zheng                2010-05-16  137  	path = btrfs_alloc_path();
a22285a6a323901 Yan, Zheng                2010-05-16  138  	if (!path)
a22285a6a323901 Yan, Zheng                2010-05-16  139  		return -ENOMEM;
a22285a6a323901 Yan, Zheng                2010-05-16  140  
a22285a6a323901 Yan, Zheng                2010-05-16 @141  	if (!trans) {
a22285a6a323901 Yan, Zheng                2010-05-16  142  		path->skip_locking = 1;
a22285a6a323901 Yan, Zheng                2010-05-16  143  		path->search_commit_root = 1;
a22285a6a323901 Yan, Zheng                2010-05-16  144  	}
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  145  
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  146  search_again:
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  147  	key.objectid = bytenr;
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  148  	key.offset = offset;
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  149  	if (metadata)
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  150  		key.type = BTRFS_METADATA_ITEM_KEY;
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  151  	else
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  152  		key.type = BTRFS_EXTENT_ITEM_KEY;
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  153  
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  154  	ret = btrfs_search_slot(trans, fs_info->extent_root, &key, path, 0, 0);
a22285a6a323901 Yan, Zheng                2010-05-16  155  	if (ret < 0)
a22285a6a323901 Yan, Zheng                2010-05-16  156  		goto out_free;
a22285a6a323901 Yan, Zheng                2010-05-16  157  
3173a18f70554fe Josef Bacik               2013-03-07  158  	if (ret > 0 && metadata && key.type == BTRFS_METADATA_ITEM_KEY) {
74be9510876a66a Filipe David Borba Manana 2013-07-05  159  		if (path->slots[0]) {
74be9510876a66a Filipe David Borba Manana 2013-07-05  160  			path->slots[0]--;
74be9510876a66a Filipe David Borba Manana 2013-07-05  161  			btrfs_item_key_to_cpu(path->nodes[0], &key,
74be9510876a66a Filipe David Borba Manana 2013-07-05  162  					      path->slots[0]);
74be9510876a66a Filipe David Borba Manana 2013-07-05  163  			if (key.objectid == bytenr &&
74be9510876a66a Filipe David Borba Manana 2013-07-05  164  			    key.type == BTRFS_EXTENT_ITEM_KEY &&
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  165  			    key.offset == fs_info->nodesize)
74be9510876a66a Filipe David Borba Manana 2013-07-05  166  				ret = 0;
74be9510876a66a Filipe David Borba Manana 2013-07-05  167  		}
74be9510876a66a Filipe David Borba Manana 2013-07-05  168  	}
3173a18f70554fe Josef Bacik               2013-03-07  169  
a22285a6a323901 Yan, Zheng                2010-05-16  170  	if (ret == 0) {
a22285a6a323901 Yan, Zheng                2010-05-16  171  		leaf = path->nodes[0];
a22285a6a323901 Yan, Zheng                2010-05-16  172  		item_size = btrfs_item_size_nr(leaf, path->slots[0]);
a22285a6a323901 Yan, Zheng                2010-05-16  173  		if (item_size >= sizeof(*ei)) {
a22285a6a323901 Yan, Zheng                2010-05-16  174  			ei = btrfs_item_ptr(leaf, path->slots[0],
a22285a6a323901 Yan, Zheng                2010-05-16  175  					    struct btrfs_extent_item);
a22285a6a323901 Yan, Zheng                2010-05-16  176  			num_refs = btrfs_extent_refs(leaf, ei);
9c309d2434abbe8 Filipe Manana             2024-06-18  177  			if (unlikely(num_refs == 0)) {
9c309d2434abbe8 Filipe Manana             2024-06-18  178  				ret = -EUCLEAN;
9c309d2434abbe8 Filipe Manana             2024-06-18  179  				btrfs_err(fs_info,
9c309d2434abbe8 Filipe Manana             2024-06-18  180  			"unexpected zero reference count for extent item (%llu %u %llu)",
9c309d2434abbe8 Filipe Manana             2024-06-18  181  					  key.objectid, key.type, key.offset);
9c309d2434abbe8 Filipe Manana             2024-06-18 @182  				btrfs_abort_transaction(trans, ret);
9c309d2434abbe8 Filipe Manana             2024-06-18  183  				goto out_free;
9c309d2434abbe8 Filipe Manana             2024-06-18  184  			}
a22285a6a323901 Yan, Zheng                2010-05-16  185  			extent_flags = btrfs_extent_flags(leaf, ei);
a22285a6a323901 Yan, Zheng                2010-05-16  186  		} else {
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  187  			ret = -EINVAL;
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  188  			btrfs_print_v0_err(fs_info);
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  189  			if (trans)
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  190  				btrfs_abort_transaction(trans, ret);
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  191  			else
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  192  				btrfs_handle_fs_error(fs_info, ret, NULL);
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  193  
ba3c2b196bf59ba Nikolay Borisov           2018-06-26  194  			goto out_free;
a22285a6a323901 Yan, Zheng                2010-05-16  195  		}
a22285a6a323901 Yan, Zheng                2010-05-16  196  	} else {
a22285a6a323901 Yan, Zheng                2010-05-16  197  		num_refs = 0;
a22285a6a323901 Yan, Zheng                2010-05-16  198  		extent_flags = 0;
a22285a6a323901 Yan, Zheng                2010-05-16  199  		ret = 0;
a22285a6a323901 Yan, Zheng                2010-05-16  200  	}
a22285a6a323901 Yan, Zheng                2010-05-16  201  
a22285a6a323901 Yan, Zheng                2010-05-16  202  	if (!trans)
a22285a6a323901 Yan, Zheng                2010-05-16  203  		goto out;
a22285a6a323901 Yan, Zheng                2010-05-16  204  
a22285a6a323901 Yan, Zheng                2010-05-16  205  	delayed_refs = &trans->transaction->delayed_refs;
a22285a6a323901 Yan, Zheng                2010-05-16  206  	spin_lock(&delayed_refs->lock);
f72ad18e996338a Liu Bo                    2017-01-30  207  	head = btrfs_find_delayed_ref_head(delayed_refs, bytenr);
a22285a6a323901 Yan, Zheng                2010-05-16  208  	if (head) {
a22285a6a323901 Yan, Zheng                2010-05-16  209  		if (!mutex_trylock(&head->mutex)) {
d278850eff3053e Josef Bacik               2017-09-29  210  			refcount_inc(&head->refs);
a22285a6a323901 Yan, Zheng                2010-05-16  211  			spin_unlock(&delayed_refs->lock);
a22285a6a323901 Yan, Zheng                2010-05-16  212  
b3b4aa74b58bded David Sterba              2011-04-21  213  			btrfs_release_path(path);
a22285a6a323901 Yan, Zheng                2010-05-16  214  
8cc33e5c19bf01c David Sterba              2011-05-02  215  			/*
8cc33e5c19bf01c David Sterba              2011-05-02  216  			 * Mutex was contended, block until it's released and try
8cc33e5c19bf01c David Sterba              2011-05-02  217  			 * again
8cc33e5c19bf01c David Sterba              2011-05-02  218  			 */
a22285a6a323901 Yan, Zheng                2010-05-16  219  			mutex_lock(&head->mutex);
a22285a6a323901 Yan, Zheng                2010-05-16  220  			mutex_unlock(&head->mutex);
d278850eff3053e Josef Bacik               2017-09-29  221  			btrfs_put_delayed_ref_head(head);
639eefc8afd1b8b Filipe David Borba Manana 2013-12-08  222  			goto search_again;
a22285a6a323901 Yan, Zheng                2010-05-16  223  		}
d7df2c796d7eedd Josef Bacik               2014-01-23  224  		spin_lock(&head->lock);
9c309d2434abbe8 Filipe Manana             2024-06-18  225  		if (head->extent_op && head->extent_op->update_flags) {
a22285a6a323901 Yan, Zheng                2010-05-16  226  			extent_flags |= head->extent_op->flags_to_set;
9c309d2434abbe8 Filipe Manana             2024-06-18  227  		} else if (unlikely(num_refs == 0)) {
9c309d2434abbe8 Filipe Manana             2024-06-18  228  			spin_unlock(&head->lock);
9c309d2434abbe8 Filipe Manana             2024-06-18  229  			mutex_unlock(&head->mutex);
9c309d2434abbe8 Filipe Manana             2024-06-18  230  			spin_unlock(&delayed_refs->lock);
9c309d2434abbe8 Filipe Manana             2024-06-18  231  			ret = -EUCLEAN;
9c309d2434abbe8 Filipe Manana             2024-06-18  232  			btrfs_err(fs_info,
9c309d2434abbe8 Filipe Manana             2024-06-18  233  			  "unexpected zero reference count for extent %llu (%s)",
9c309d2434abbe8 Filipe Manana             2024-06-18  234  				  bytenr, metadata ? "metadata" : "data");
9c309d2434abbe8 Filipe Manana             2024-06-18  235  			btrfs_abort_transaction(trans, ret);
9c309d2434abbe8 Filipe Manana             2024-06-18  236  			goto out_free;
9c309d2434abbe8 Filipe Manana             2024-06-18  237  		}
a22285a6a323901 Yan, Zheng                2010-05-16  238  
d278850eff3053e Josef Bacik               2017-09-29  239  		num_refs += head->ref_mod;
d7df2c796d7eedd Josef Bacik               2014-01-23  240  		spin_unlock(&head->lock);
a22285a6a323901 Yan, Zheng                2010-05-16  241  		mutex_unlock(&head->mutex);
a22285a6a323901 Yan, Zheng                2010-05-16  242  	}
a22285a6a323901 Yan, Zheng                2010-05-16  243  	spin_unlock(&delayed_refs->lock);
a22285a6a323901 Yan, Zheng                2010-05-16  244  out:
a22285a6a323901 Yan, Zheng                2010-05-16  245  	WARN_ON(num_refs == 0);
a22285a6a323901 Yan, Zheng                2010-05-16  246  	if (refs)
a22285a6a323901 Yan, Zheng                2010-05-16  247  		*refs = num_refs;
a22285a6a323901 Yan, Zheng                2010-05-16  248  	if (flags)
a22285a6a323901 Yan, Zheng                2010-05-16  249  		*flags = extent_flags;
a22285a6a323901 Yan, Zheng                2010-05-16  250  out_free:
a22285a6a323901 Yan, Zheng                2010-05-16  251  	btrfs_free_path(path);
a22285a6a323901 Yan, Zheng                2010-05-16  252  	return ret;
a22285a6a323901 Yan, Zheng                2010-05-16  253  }
a22285a6a323901 Yan, Zheng                2010-05-16  254  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
