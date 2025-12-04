Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21721E0AF
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864560; cv=none; b=OcHl2RDb6Xa9zJVsQfaiAHm928Xks8iHyotlscynrtftxCju2bnBRQJpwgqt1P+VXgY0+ZGkneps07o/OHiCR/3G+6KD04HxVILTjb+OKX8ogj86J33PGeoO67oZR9bosjB3KE/ZWFk4WWeBJHIBdq5HZKydLMKYbHGGqKSIoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864560; c=relaxed/simple;
	bh=CjrxqFiMOrHmpcJLUWiGW0YM1Jho0LMRN2BmdRtRewM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5/qddkY+0s1vZSxu7hO15dnbRbMecb/L6uVJW8b4GJDWIjT115pmvR8UanlB4+rsp6UQu9VkicJYRxDSDfFeyNrQgV0dH+5hUdZv/Px8McRCmjt9h0sTVP8/0bk2bE3DCwoU1gVLx2990YX2RGtFH/Gw2y51FkpXUZOYkSwBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh4DadiF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh4DadiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764864558; x=1796400558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CjrxqFiMOrHmpcJLUWiGW0YM1Jho0LMRN2BmdRtRewM=;
  b=Lh4DadiFEeRF9pdPY+VwMiARhnkppwyhtTpiMB02ehrbmhr+f28szNq9
   TiD9sd9E0k9ofHLV/CjrvFnGiC7ONjt3GDjDmfEs3Iu141XAsCTo+iZgU
   ySCI9uEajQPxuXL9QSRTVScN7hFJ8omZxihQjyzIcR+gNjMfEbrN/hYYK
   1/u6r0L6d1hsh9QnCtEejvUHqDxwLlb4sQIN8GE0FTBvCu7vuMaQuoCZD
   fSS+NwKtGnBTv4zjV55ZOHgHO0byfaZY99KWB2f+7jVIM3ZIAhLH1UiGl
   fJDHjr7jUN7SZpWmnxdX5rzmH6575PvboA1wN7TGUraKY8pAXwJpdEbXc
   g==;
X-CSE-ConnectionGUID: UvxxjJctSFOWhyS+1bPi3w==
X-CSE-MsgGUID: rFZ476hJQoCmxzQm5mIOYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65886900"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="65886900"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 08:09:18 -0800
X-CSE-ConnectionGUID: tMj35oanRVWmv5ZrpJUrPQ==
X-CSE-MsgGUID: Mpg7i+ZgQ2ye9Cjm29klDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="199447935"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2025 08:09:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRBtK-00000000Dx7-3nf7;
	Thu, 04 Dec 2025 16:09:14 +0000
Date: Fri, 5 Dec 2025 00:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ext2: factor out ext2_fill_super() teardown path
Message-ID: <202512042321.fuAOlXGn-lkp@intel.com>
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
In-Reply-To: <20251203045048.2463502-1-vivek.balachandhar@gmail.com>
References: <20251203045048.2463502-1-vivek.balachandhar@gmail.com>
TO: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
TO: jack@suse.com
CC: linux-ext4@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: vivek.balachandhar@gmail.com

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jack-fs/for_next]
[also build test WARNING on linus/master v6.18 next-20251204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-BalachandharTN/ext2-factor-out-ext2_fill_super-teardown-path/20251203-125544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
patch link:    https://lore.kernel.org/r/20251203045048.2463502-1-vivek.balachandhar%40gmail.com
patch subject: [PATCH] ext2: factor out ext2_fill_super() teardown path
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20251204 (https://download.01.org/0day-ci/archive/20251204/202512042321.fuAOlXGn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512042321.fuAOlXGn-lkp@intel.com/

smatch warnings:
fs/ext2/super.c:1268 ext2_fill_super() error: uninitialized symbol 'bh'.
fs/ext2/super.c:1268 ext2_fill_super() error: double free of 'bh' (line 1020)

vim +/bh +1268 fs/ext2/super.c

123e9caf1e8500 Christoph Hellwig    2010-05-19  1223  
52fcf7032935b3 David Howells        2008-02-07  1224  	root = ext2_iget(sb, EXT2_ROOT_INO);
52fcf7032935b3 David Howells        2008-02-07  1225  	if (IS_ERR(root)) {
52fcf7032935b3 David Howells        2008-02-07  1226  		ret = PTR_ERR(root);
0216bfcffe424a Mingming Cao         2006-06-23  1227  		goto failed_mount3;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1228  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1229  	if (!S_ISDIR(root->i_mode) || !root->i_blocks || !root->i_size) {
52fcf7032935b3 David Howells        2008-02-07  1230  		iput(root);
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1231  		ext2_msg(sb, KERN_ERR, "error: corrupt root inode, run e2fsck");
0216bfcffe424a Mingming Cao         2006-06-23  1232  		goto failed_mount3;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1233  	}
52fcf7032935b3 David Howells        2008-02-07  1234  
48fde701aff662 Al Viro              2012-01-08  1235  	sb->s_root = d_make_root(root);
52fcf7032935b3 David Howells        2008-02-07  1236  	if (!sb->s_root) {
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1237  		ext2_msg(sb, KERN_ERR, "error: get root inode failed");
52fcf7032935b3 David Howells        2008-02-07  1238  		ret = -ENOMEM;
52fcf7032935b3 David Howells        2008-02-07  1239  		goto failed_mount3;
52fcf7032935b3 David Howells        2008-02-07  1240  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1241  	if (EXT2_HAS_COMPAT_FEATURE(sb, EXT3_FEATURE_COMPAT_HAS_JOURNAL))
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1242  		ext2_msg(sb, KERN_WARNING,
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1243  			"warning: mounting ext3 filesystem as ext2");
bc98a42c1f7d0f David Howells        2017-07-17  1244  	if (ext2_setup_super (sb, es, sb_rdonly(sb)))
1751e8a6cb935e Linus Torvalds       2017-11-27  1245  		sb->s_flags |= SB_RDONLY;
4c96a68bfc110d Jan Blunck           2010-04-14  1246  	ext2_write_super(sb);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1247  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1248  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1249  cantfind_ext2:
^1da177e4c3f41 Linus Torvalds       2005-04-16  1250  	if (!silent)
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1251  		ext2_msg(sb, KERN_ERR,
2314b07cb47ef7 Oleksij Rempel       2009-11-19  1252  			"error: can't find an ext2 filesystem on dev %s.",
^1da177e4c3f41 Linus Torvalds       2005-04-16  1253  			sb->s_id);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1254  	goto failed_mount;
0216bfcffe424a Mingming Cao         2006-06-23  1255  failed_mount3:
47387409ee2e09 Tahsin Erdogan       2017-06-22  1256  	ext2_xattr_destroy_cache(sbi->s_ea_block_cache);
0216bfcffe424a Mingming Cao         2006-06-23  1257  	percpu_counter_destroy(&sbi->s_freeblocks_counter);
0216bfcffe424a Mingming Cao         2006-06-23  1258  	percpu_counter_destroy(&sbi->s_freeinodes_counter);
0216bfcffe424a Mingming Cao         2006-06-23  1259  	percpu_counter_destroy(&sbi->s_dirs_counter);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1260  failed_mount2:
^1da177e4c3f41 Linus Torvalds       2005-04-16  1261  	for (i = 0; i < db_count; i++)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1262  		brelse(sbi->s_group_desc[i]);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1263  failed_mount_group_desc:
e7c7fbb9a8574e Jan Kara             2022-09-14  1264  	kvfree(sbi->s_group_desc);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1265  	kfree(sbi->s_debts);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1266  failed_mount:
^1da177e4c3f41 Linus Torvalds       2005-04-16  1267  failed_sbi:
c3cbba42714903 Vivek BalachandharTN 2025-12-03 @1268  	ext2_free_sbi(sb, sbi, bh);
52fcf7032935b3 David Howells        2008-02-07  1269  	return ret;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1270  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  1271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
