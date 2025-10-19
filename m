Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A9354AC1
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 03:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760845037; cv=none; b=UIHdoqQLvGDuoy81fYZZfZXxj+FFh4wKDEZVc85UdQFw9fxUTmQEXwfEfEThmEUoLcP9y5G85VTQSvw8zHLC8+mIzTwSjnhzJEGi0KbU1ms8OlvfLFcxPofYHzfXu4609YgandkIL2LI8K/NPqxvwxttwJDbWbEFOnQ8rgFy9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760845037; c=relaxed/simple;
	bh=rNpD10Wmm626o+KU7TnxaOfBxgb1kFz4ia9njuk9Xjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GKzQ6yj3ca4Yg2LAJ8G9CsppViZQewoIgTubOcx+ojYLWv4ghXBcL7mrxn4Z5q38vJ7+NDRoqwMb5juoNDlOCkp+UvTaW2U3XheSSyxE5kKKN07yGPUSX5G9lin+g+vOn7LwtQAe+Tn79uTEOtLRVCwKiVRu6jfFOx1PVgjN2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDizDKjf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDizDKjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760845035; x=1792381035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNpD10Wmm626o+KU7TnxaOfBxgb1kFz4ia9njuk9Xjc=;
  b=oDizDKjfbP8Z0HtsG3i6F/yKslEPBo9NZU5OXmMamaUCqdkQGhCJqT6B
   e6Zl8TyAYiePjsKf8KH+OXf0u0RIZwS8NPEivBfebfIwqRlufT8RzBles
   7yJx87NbyUzPq+sv//MRIynyOqNOhUpzrOQgIqxLqAJhdOx+KYqAVP2Q5
   1EFI0lUTZWV91toQHTGfjFr1us0+5lINtn5FdH/3Bo0sU/oBsMg9rkxPd
   wZCS3DQfIKya78McvroNMJy8q1deaqvFAzD0jsGuXO/jqwn0tuXIpwNec
   qYxUFupYx9W0IxwjWEGncd4boGPoAM4cFMERvz6amaBmKbGXtJQLrZWab
   w==;
X-CSE-ConnectionGUID: WQQnSYItRySrWpMCNXWSRw==
X-CSE-MsgGUID: 6wIfmsY5SwS8un1IGNBXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62219971"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62219971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 20:37:14 -0700
X-CSE-ConnectionGUID: otMH5hbrS5+0PnPFlLuuqA==
X-CSE-MsgGUID: UdqNY3eCS5GSpyBTgh92Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183465926"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2025 20:37:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAKEJ-0008oH-0x;
	Sun, 19 Oct 2025 03:37:11 +0000
Date: Sun, 19 Oct 2025 11:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock
 initialization
Message-ID: <202510191137.8zbxBBKZ-lkp@intel.com>
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
In-Reply-To: <68ee38b5.050a0220.ac43.00fd.GAE@google.com>
References: <68ee38b5.050a0220.ac43.00fd.GAE@google.com>
TO: syzbot <syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com>
TO: linux-kernel@vger.kernel.org
TO: syzkaller-bugs@googlegroups.com

Hi syzbot,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18-rc1]
[also build test WARNING on linus/master next-20251017]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/Forwarded-PATCH-ntfs3-add-debug-warnings-for-run_lock-initialization/20251014-195051
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/68ee38b5.050a0220.ac43.00fd.GAE%40google.com
patch subject: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock initialization
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191137.8zbxBBKZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510191137.8zbxBBKZ-lkp@intel.com/

smatch warnings:
fs/ntfs3/inode.c:590 ntfs_iget5() warn: variable dereferenced before IS_ERR check 'inode' (see line 590)

vim +/inode +590 fs/ntfs3/inode.c

82cae269cfa9530 Konstantin Komarov 2021-08-13  561  
82cae269cfa9530 Konstantin Komarov 2021-08-13  562  struct inode *ntfs_iget5(struct super_block *sb, const struct MFT_REF *ref,
82cae269cfa9530 Konstantin Komarov 2021-08-13  563                           const struct cpu_str *name)
82cae269cfa9530 Konstantin Komarov 2021-08-13  564  {
82cae269cfa9530 Konstantin Komarov 2021-08-13  565      struct inode *inode;
9ca11d2cd5f563e syzbot             2025-10-14  566      unsigned long ino = ino_get(ref);
82cae269cfa9530 Konstantin Komarov 2021-08-13  567      
9ca11d2cd5f563e syzbot             2025-10-14  568      if (ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  569          printk(KERN_ERR "DEEPANSHU: ntfs_iget5 START for inode 25\n");
9ca11d2cd5f563e syzbot             2025-10-14  570          //dump_stack();
9ca11d2cd5f563e syzbot             2025-10-14  571      }
9ca11d2cd5f563e syzbot             2025-10-14  572      
9ca11d2cd5f563e syzbot             2025-10-14  573      inode = iget5_locked(sb, ino, ntfs_test_inode, ntfs_set_inode,
82cae269cfa9530 Konstantin Komarov 2021-08-13  574                           (void *)ref);
9ca11d2cd5f563e syzbot             2025-10-14  575      
82cae269cfa9530 Konstantin Komarov 2021-08-13  576      if (unlikely(!inode))
82cae269cfa9530 Konstantin Komarov 2021-08-13  577          return ERR_PTR(-ENOMEM);
82cae269cfa9530 Konstantin Komarov 2021-08-13  578      
9ca11d2cd5f563e syzbot             2025-10-14  579      if (inode->i_ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  580          printk(KERN_ERR "DEEPANSHU: After iget5_locked for inode 25, I_NEW=%d, i_state=0x%x\n", 
9ca11d2cd5f563e syzbot             2025-10-14  581                 !!(inode->i_state & I_NEW), inode->i_state);
9ca11d2cd5f563e syzbot             2025-10-14  582          //dump_stack();
9ca11d2cd5f563e syzbot             2025-10-14  583      }
9ca11d2cd5f563e syzbot             2025-10-14  584      
82cae269cfa9530 Konstantin Komarov 2021-08-13  585      /* If this is a freshly allocated inode, need to read it now. */
9ca11d2cd5f563e syzbot             2025-10-14  586      if (inode->i_state & I_NEW) {
9ca11d2cd5f563e syzbot             2025-10-14  587          if (inode->i_ino == 25)
9ca11d2cd5f563e syzbot             2025-10-14  588              printk(KERN_ERR "DEEPANSHU: Calling ntfs_read_mft for inode 25\n");
82cae269cfa9530 Konstantin Komarov 2021-08-13  589          inode = ntfs_read_mft(inode, name, ref);
9ca11d2cd5f563e syzbot             2025-10-14 @590          if (inode->i_ino == 25 && IS_ERR(inode))
9ca11d2cd5f563e syzbot             2025-10-14  591              printk(KERN_ERR "DEEPANSHU: ntfs_read_mft FAILED for inode 25\n");
9ca11d2cd5f563e syzbot             2025-10-14  592      } else if (ref->seq != ntfs_i(inode)->mi.mrec->seq) {
9ca11d2cd5f563e syzbot             2025-10-14  593          if (inode->i_ino == 25)
9ca11d2cd5f563e syzbot             2025-10-14  594              printk(KERN_ERR "DEEPANSHU: inode 25 seq mismatch\n");
1fd21919de6de24 Konstantin Komarov 2024-08-22  595          iput(inode);
1fd21919de6de24 Konstantin Komarov 2024-08-22  596          inode = ERR_PTR(-ESTALE);
9ca11d2cd5f563e syzbot             2025-10-14  597      } else if (inode->i_ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  598          printk(KERN_ERR "DEEPANSHU: inode 25 found in CACHE, skipping ntfs_read_mft!\n");
9ca11d2cd5f563e syzbot             2025-10-14  599          //dump_stack();
82cae269cfa9530 Konstantin Komarov 2021-08-13  600      }
82cae269cfa9530 Konstantin Komarov 2021-08-13  601  
1fd21919de6de24 Konstantin Komarov 2024-08-22  602      if (IS_ERR(inode))
0e8235d28f3a0e9 Konstantin Komarov 2022-10-10  603          ntfs_set_state(sb->s_fs_info, NTFS_DIRTY_ERROR);
0e8235d28f3a0e9 Konstantin Komarov 2022-10-10  604  
82cae269cfa9530 Konstantin Komarov 2021-08-13  605      return inode;
82cae269cfa9530 Konstantin Komarov 2021-08-13  606  }
82cae269cfa9530 Konstantin Komarov 2021-08-13  607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
