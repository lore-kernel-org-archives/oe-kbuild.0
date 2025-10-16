Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061332D0C6
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632944; cv=none; b=mgjODvaqU5Q1/QxqRXVn3QBKGo2BEQAbYL6H4EzMu0l2g1ClrV1CmCg3X6HOz7h+2vRzAraJMi8R2buGDjjhHxyuV3Sb0ArHPjwokosfBqhq8nzT8FgOsRJNRhzxrg2akF0sorBfA3vediA9nKi7e+1vrATE4H5sdNxVFXBme5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632944; c=relaxed/simple;
	bh=IEyyYwWs6s8OabwLoNxhIjFyiTSQiMlG9/BtqeMYFUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsXiObQzKplcAtJCCNx6Z7BYkDkKRA9r4Vh/WaMIjttDGtv04IBpawLzBw5qL3fBZxaMMlAJ8WCecKWdWkO0Hq7eVGThSL7lgw19zF8GieJQF/FAP7HQN6HYzGnZWZKOHjSeklA17s80oEftzFkSCHtrxV/+sFuWEjSkrWVt5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv0yDos9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv0yDos9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760632943; x=1792168943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEyyYwWs6s8OabwLoNxhIjFyiTSQiMlG9/BtqeMYFUQ=;
  b=Pv0yDos9Ru7Zb2eqI/bcQ1t+zKDetfAHv0YI+Cr55ZuLwvdc/zcl80Ou
   qozxfHCjUEUWoSdigZsyy1pf1OftUmTvnHX9R8He4B7xwSHJ14A3nx2/1
   QycksZ4v9UXkiSr9yuEp4gp/TztY+N6dQOcF2q35oXPQgEcoM3nppGV8g
   +NoSKWikbGQL6jlh4kJRZ1f4ZXB1qdunJ5LtySfWfrMbV1ftYdQA/IM0v
   DqUQHnkm681utVvfffBC0OV8UQ3kHDzn9HkcwHQSenyU3kFDUwvSZ7KTO
   D7VIr3a7eQ+rIzMpSkYwNM1HKOSfLTuNXo3P7D90sl6/wqi11diNqQlPs
   Q==;
X-CSE-ConnectionGUID: 3danDhNJRPWgzt0xPu3DWQ==
X-CSE-MsgGUID: JXJfWQu4T+O/lySeCcBuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62736826"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62736826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 09:42:22 -0700
X-CSE-ConnectionGUID: mtqXdKziQweja/pqG5djhA==
X-CSE-MsgGUID: 5JvBXE1OSma0lRBTzdQ0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182185767"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2025 09:42:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9R3P-000531-17;
	Thu, 16 Oct 2025 16:42:16 +0000
Date: Fri, 17 Oct 2025 00:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock
 initialization
Message-ID: <202510170051.yMGKcZjz-lkp@intel.com>
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
[also build test WARNING on linus/master next-20251015]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/Forwarded-PATCH-ntfs3-add-debug-warnings-for-run_lock-initialization/20251014-195051
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/68ee38b5.050a0220.ac43.00fd.GAE%40google.com
patch subject: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock initialization
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251017/202510170051.yMGKcZjz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510170051.yMGKcZjz-lkp@intel.com/

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
