Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE313C9C4
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709234996; cv=none; b=XKvqFDgzKM2wqtshyihHajcmOYAUrImQQl0njwWRNYa4veu7ap5e4NzZLzgi8cIaR6gS262DZbyQTR7+Rfq6+GSonTT6q/OvzUPlXQfpXxFy/1vKlySqgeec6O8lqIhmQCfxuDmznWjIOQ6Z8uzZFMDOysQJYq2hcIim2iiJ3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709234996; c=relaxed/simple;
	bh=u4dBVIHDmn0KRDa3Uh5aFoSf4qNmdqlbZu8WTVEsmAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAaO4KIfcEcrh54u3bbriu9n0hqxTMZ2BhvxERDhZNIMqg9VUiHpnsUt21UoSujAfuGALln5Z0CNDtZSafSr7N4pQVyIxPUYOWrYlW3OlbhSJ7HN69u84CgGm6Xb2IKhYLN1SwWHRbyq7Ais0qQ/qyZiJgvFPuT2KPh/3bZ+k6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL08VPdM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL08VPdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709234994; x=1740770994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4dBVIHDmn0KRDa3Uh5aFoSf4qNmdqlbZu8WTVEsmAo=;
  b=DL08VPdMvIcFxOeNE9HflwPmKDlpd5Upoxp7xQh4A3AqmQO/HTl22H6O
   24AW9rdFfTe4Xuc5tUvirM4ScddY/UF6YsvE+SgqDOXBYgzTHSXtEucV+
   CSZPenk2kn/MkOAtnOemlzkVlk5lyzkr78ciSUl13X5rbQXk5KAW3KZGc
   yfqEc26D9YcVzXECOelyZvQ4XD2BKHaI0eAW40mKo7PiQd5qtuXD0+YNO
   DDOdw7iZ+Q3DRvbSWp8sGn3LdLDzEdLWzbb5YqKlVtEqKQP3p3IjPTFwl
   WbJnNVpYqYIhxNdlhqLCMtVrgfZSRqPS+gcGCygudO53175RAu9bJYLE/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3852664"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3852664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 11:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7880121"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 11:29:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfm6I-000DEV-06;
	Thu, 29 Feb 2024 19:29:50 +0000
Date: Fri, 1 Mar 2024 03:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830] security/selinux/ss/avtab.c:262
 avtab_alloc_common() error: kvcalloc() does not make sense for no sleep code
Message-ID: <202403010359.m9lrKdX3-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240228 (https://download.01.org/0day-ci/archive/20240301/202403010359.m9lrKdX3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403010359.m9lrKdX3-lkp@intel.com/

New smatch warnings:
security/selinux/ss/avtab.c:262 avtab_alloc_common() error: kvcalloc() does not make sense for no sleep code
fs/btrfs/scrub.c:351 scrub_setup_ctx() error: kvzalloc() does not make sense for no sleep code
fs/btrfs/free-space-tree.c:179 alloc_bitmap() error: kvzalloc() does not make sense for no sleep code
fs/btrfs/raid56.c:138 btrfs_alloc_stripe_hash_table() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:410 xfs_ioc_attr_list() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:1488 xfs_ioc_getbmap() error: kvcalloc() does not make sense for no sleep code
fs/xfs/xfs_ioctl.c:1542 xfs_ioc_getfsmap() error: kvcalloc() does not make sense for no sleep code
fs/xfs/xfs_log.c:1616 xlog_alloc_log() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_acl.c:200 __xfs_set_acl() error: kvzalloc() does not make sense for no sleep code
fs/xfs/xfs_log_recover.c:104 xlog_alloc_buffer() error: kvzalloc() does not make sense for no sleep code
drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/input/evdev.c:477 evdev_open() error: kvzalloc() does not make sense for no sleep code
net/mpls/af_mpls.c:2531 resize_platform_label_table() error: kvzalloc() does not make sense for no sleep code
fs/pstore/platform.c:228 allocate_buf_for_compression() error: kvzalloc() does not make sense for no sleep code
fs/pstore/platform.c:613 decompress_record() error: kvzalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-event.c:238 v4l2_event_subscribe() error: kvzalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-subdev.c:1471 __v4l2_subdev_state_alloc() error: kvcalloc() does not make sense for no sleep code
drivers/media/v4l2-core/v4l2-subdev.c:1710 v4l2_subdev_init_stream_configs() error: kvcalloc() does not make sense for no sleep code
security/apparmor/match.c:63 unpack_table() error: kvzalloc() does not make sense for no sleep code
security/apparmor/policy_unpack.c:150 aa_loaddata_alloc() error: kvzalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:161 compute_fperms() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:185 compute_xmatch_perms() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_compat.c:260 compute_perms() error: kvcalloc() does not make sense for no sleep code

Old smatch warnings:
fs/btrfs/scrub.c:2145 scrub_simple_mirror() error: uninitialized symbol 'ret'.
fs/xfs/xfs_ioctl.c:1546 xfs_ioc_getfsmap() error: kvcalloc() does not make sense for no sleep code
security/apparmor/policy_unpack.c:137 aa_loaddata_kref() warn: can 'd' even be NULL?
security/apparmor/policy_unpack.c:1236 verify_profile() warn: can 'rules' even be NULL?

vim +262 security/selinux/ss/avtab.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  256  
d8f5f0ea5b8630 Ondrej Mosnacek 2021-04-02  257  static int avtab_alloc_common(struct avtab *h, u32 nslot)
3232c110b56bd0 Yuichi Nakamura 2007-08-24  258  {
d8f5f0ea5b8630 Ondrej Mosnacek 2021-04-02  259  	if (!nslot)
d8f5f0ea5b8630 Ondrej Mosnacek 2021-04-02  260  		return 0;
3232c110b56bd0 Yuichi Nakamura 2007-08-24  261  
acdf52d97f8240 Kent Overstreet 2019-03-11 @262  	h->htable = kvcalloc(nslot, sizeof(void *), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  263  	if (!h->htable)
^1da177e4c3f41 Linus Torvalds  2005-04-16  264  		return -ENOMEM;
3232c110b56bd0 Yuichi Nakamura 2007-08-24  265  
3232c110b56bd0 Yuichi Nakamura 2007-08-24  266  	h->nslot = nslot;
442dc00f82a972 Ondrej Mosnacek 2021-04-02  267  	h->mask = nslot - 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  268  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  269  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  270  

:::::: The code at line 262 was first introduced by commit
:::::: acdf52d97f824019888422842757013b37441dd1 selinux: convert to kvmalloc

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
