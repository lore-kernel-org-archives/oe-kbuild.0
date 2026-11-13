Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593733;
	b=44Ty9FNTqNKBYWd88Zy8Q4pgjo3wabX0DmxBfnHTGmQS33hAPzdOPZrFLE3HOx3vkdRu
	 BthNb+BCOqOEf4BN6vPNxxvyA1YF4gpza3nej+dsx4Pn5aajprv9xVbnA7BH/Uz0rb8Yd
	 y3kEjA2pyAD78uPk/sd7Axg4LhM9OWv8MciWpy5wPd66F5DUOEh7BcuVe+sGsfBY1YxBh
	 52WmtqBYlIfs0CmG+0daT36tN/hTXVjcIh+Zyto1E0LAhZwhsGvx2wa5bLTNjGdLPvGYb
	 MTRhoRiv/4qYQvOsa0fY6rst7EqxrML2Nq38tV5j4F0ib0mFH8jTSa0L3ifkIosG5uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593733;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zF0nEFzf4vUsDxyJfoVan9OkMvEIZgq7lh4OE0gMh5o=;
	b=NFaWe2U48CiLSz1MB5vxjiKZ+7lOmFXh+BAcOn7+GDPSAQnWiRJwiDhdSRz8atTvjCbh
	 QAZPuA93UsUBYVHvJo9AqxmjZkaEZHaIi1J2Rh2NwaBGuybspQfDKXrLmX+PhDt4tYgG5
	 /CQDNaipeGVGMqNT13grfHyZktpoVw4cJespksrO7ynTnN2Rr5Foa3svl4PvmRzWBDh5m
	 YW+9235HTQT7fjV/H/LgUGzVIEuPsqOHT7wQRoyE2gaGZC7W9v8ivknD4VLLiaNyuk+KC
	 FJsZ1GMutZe17Q243kcyw9BQc8XX4xpSu79BsY1F2Wg6FxOUgg4d/YWTaYwjCYV4VvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="iPk4bi/D";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB460A5BD1
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 18:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CB460A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iPk4bi/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794593733; x=1826129733;
  h=date:from:to:cc:subject:message-id;
  bh=ogvdB69t2+kewGXifVKy/DUgE4Zobp1uuu/CmJZZiPM=;
  b=iPk4bi/Da/4oKc74+YuFc3AZajfRjbvPiRlJmauDG0PHVMnxSP31l/Rj
   Y4FwHKOeZ1MxUuhiRKlPZTf5OKnBD+R8jWCLhz9XhOP/ENYkzQQZn/c0G
   1MThWRyw6CLUa8BIKyq4gBa1UbnJzoER8tne1BrVZCnf2D+4fOCTGB6Uy
   TKoX7bHK2RtySho2hFsd5xJJF0LaU9WXTcb4d05L6HHqqBl92I//ZF4+d
   HqaHDYEy6H6P2QDQUBGwJJ4WqSxbthEx7ORBd7DMOclKjfWZz8gGqypVW
   qMNouewFVQt+sIeRlu9SPa7TYozqywtmMsIKROBNwqcrZUh/OqMjK/DiS
   w==;
X-CSE-ConnectionGUID: n/NaUxqxTr6F/RoTRqfj3Q==
X-CSE-MsgGUID: nVTIUB5NTTCUj1cmgP35qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3297888"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3297888"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:15:32 -0800
X-CSE-ConnectionGUID: zMnbGWPWSC+4KoiPqu540Q==
X-CSE-MsgGUID: Lnj428vhSxacEVEgFhCjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8872540"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 Nov 2026 10:15:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRvo9-000000001KB-1ZU9;
	Fri, 13 Nov 2026 18:15:29 +0000
Date: Fri, 13 Nov 2026 19:15:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 139/151] fs/squashfs/namei.c:283
 squashfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202611131955.0Gd7ipSP-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Phillip Lougher <phillip@squashfs.org.uk>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   152f0559e66c079f717de375f133ff127afb1f58
commit: 5213b0a08263b2191b86b046c3a63f11e8abc399 [139/151] Squashfs: fix variables in directory code and add more sanity checks
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131955.0Gd7ipSP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131955.0Gd7ipSP-lkp@intel.com/

New smatch warnings:
fs/squashfs/namei.c:283 squashfs_lookup() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/squashfs/namei.c:181 squashfs_lookup() warn: unsigned 'block' is never less than zero.
fs/squashfs/namei.c:181 squashfs_lookup() warn: error code type promoted to positive: 'block'

vim +/ERR_PTR +283 fs/squashfs/namei.c

c88da2c979369e6 Phillip Lougher 2009-01-05  162  
c88da2c979369e6 Phillip Lougher 2009-01-05  163  
c88da2c979369e6 Phillip Lougher 2009-01-05  164  static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
00cd8dd3bf95f2c Al Viro         2012-06-10  165  				 unsigned int flags)
c88da2c979369e6 Phillip Lougher 2009-01-05  166  {
c88da2c979369e6 Phillip Lougher 2009-01-05  167  	const unsigned char *name = dentry->d_name.name;
c88da2c979369e6 Phillip Lougher 2009-01-05  168  	int len = dentry->d_name.len;
c88da2c979369e6 Phillip Lougher 2009-01-05  169  	struct inode *inode = NULL;
c88da2c979369e6 Phillip Lougher 2009-01-05  170  	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
c88da2c979369e6 Phillip Lougher 2009-01-05  171  	struct squashfs_dir_header dirh;
4dddf794b08bef0 Phillip Lougher 2026-11-11  172  	struct squashfs_dir_entry *dire = NULL;
4dddf794b08bef0 Phillip Lougher 2026-11-11  173  	u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
c88da2c979369e6 Phillip Lougher 2009-01-05  174  	int offset = squashfs_i(dir)->offset;
5213b0a08263b21 Phillip Lougher 2026-11-11  175  	int err;
5213b0a08263b21 Phillip Lougher 2026-11-11  176  	loff_t length;
52e9ce1c0f20606 Phillip Lougher 2013-09-03  177  	unsigned int dir_count, size;
c88da2c979369e6 Phillip Lougher 2009-01-05  178  
4dddf794b08bef0 Phillip Lougher 2026-11-11  179  	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
4dddf794b08bef0 Phillip Lougher 2026-11-11  180  
4dddf794b08bef0 Phillip Lougher 2026-11-11  181  	if (block < 0)
4dddf794b08bef0 Phillip Lougher 2026-11-11  182  		goto data_error;
c88da2c979369e6 Phillip Lougher 2009-01-05  183  
c88da2c979369e6 Phillip Lougher 2009-01-05  184  	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
c88da2c979369e6 Phillip Lougher 2009-01-05  185  	if (dire == NULL) {
c88da2c979369e6 Phillip Lougher 2009-01-05  186  		ERROR("Failed to allocate squashfs_dir_entry\n");
c88da2c979369e6 Phillip Lougher 2009-01-05  187  		return ERR_PTR(-ENOMEM);
c88da2c979369e6 Phillip Lougher 2009-01-05  188  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  189  
c88da2c979369e6 Phillip Lougher 2009-01-05  190  	if (len > SQUASHFS_NAME_LEN) {
c88da2c979369e6 Phillip Lougher 2009-01-05  191  		err = -ENAMETOOLONG;
c88da2c979369e6 Phillip Lougher 2009-01-05  192  		goto failed;
c88da2c979369e6 Phillip Lougher 2009-01-05  193  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  194  
c88da2c979369e6 Phillip Lougher 2009-01-05  195  	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
c88da2c979369e6 Phillip Lougher 2009-01-05  196  				squashfs_i(dir)->dir_idx_start,
c88da2c979369e6 Phillip Lougher 2009-01-05  197  				squashfs_i(dir)->dir_idx_offset,
5213b0a08263b21 Phillip Lougher 2026-11-11  198  				squashfs_i(dir)->dir_idx_cnt,
5213b0a08263b21 Phillip Lougher 2026-11-11  199  				i_size_read(dir), name);
c88da2c979369e6 Phillip Lougher 2009-01-05  200  
c88da2c979369e6 Phillip Lougher 2009-01-05  201  	while (length < i_size_read(dir)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  202  		/*
c88da2c979369e6 Phillip Lougher 2009-01-05  203  		 * Read directory header.
c88da2c979369e6 Phillip Lougher 2009-01-05  204  		 */
5213b0a08263b21 Phillip Lougher 2026-11-11  205  		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
5213b0a08263b21 Phillip Lougher 2026-11-11  206  			goto read_failure;
5213b0a08263b21 Phillip Lougher 2026-11-11  207  
c88da2c979369e6 Phillip Lougher 2009-01-05  208  		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  209  				&offset, sizeof(dirh));
c88da2c979369e6 Phillip Lougher 2009-01-05  210  		if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  211  			goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  212  
c88da2c979369e6 Phillip Lougher 2009-01-05  213  		length += sizeof(dirh);
c88da2c979369e6 Phillip Lougher 2009-01-05  214  
c88da2c979369e6 Phillip Lougher 2009-01-05  215  		dir_count = le32_to_cpu(dirh.count) + 1;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  216  
4826d83d9c4f6bb Ajeet Yadav     2012-02-02  217  		if (dir_count > SQUASHFS_DIR_COUNT)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  218  			goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  219  
c88da2c979369e6 Phillip Lougher 2009-01-05  220  		while (dir_count--) {
c88da2c979369e6 Phillip Lougher 2009-01-05  221  			/*
c88da2c979369e6 Phillip Lougher 2009-01-05  222  			 * Read directory entry.
c88da2c979369e6 Phillip Lougher 2009-01-05  223  			 */
5213b0a08263b21 Phillip Lougher 2026-11-11  224  			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
5213b0a08263b21 Phillip Lougher 2026-11-11  225  				goto read_failure;
5213b0a08263b21 Phillip Lougher 2026-11-11  226  
c88da2c979369e6 Phillip Lougher 2009-01-05  227  			err = squashfs_read_metadata(dir->i_sb, dire, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  228  					&offset, sizeof(*dire));
c88da2c979369e6 Phillip Lougher 2009-01-05  229  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  230  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  231  
5213b0a08263b21 Phillip Lougher 2026-11-11  232  			length += sizeof(*dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  233  			size = le16_to_cpu(dire->size) + 1;
c88da2c979369e6 Phillip Lougher 2009-01-05  234  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  235  			/* size should never be larger than SQUASHFS_NAME_LEN */
44cff8a9ee8a974 Phillip Lougher 2011-03-15  236  			if (size > SQUASHFS_NAME_LEN)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  237  				goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  238  
5213b0a08263b21 Phillip Lougher 2026-11-11  239  			if (!squashfs_dir_space(dir, length, size))
5213b0a08263b21 Phillip Lougher 2026-11-11  240  				goto read_failure;
5213b0a08263b21 Phillip Lougher 2026-11-11  241  
c88da2c979369e6 Phillip Lougher 2009-01-05  242  			err = squashfs_read_metadata(dir->i_sb, dire->name,
c88da2c979369e6 Phillip Lougher 2009-01-05  243  					&block, &offset, size);
c88da2c979369e6 Phillip Lougher 2009-01-05  244  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  245  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  246  
5213b0a08263b21 Phillip Lougher 2026-11-11  247  			length += size;
c88da2c979369e6 Phillip Lougher 2009-01-05  248  
c88da2c979369e6 Phillip Lougher 2009-01-05  249  			if (name[0] < dire->name[0])
c88da2c979369e6 Phillip Lougher 2009-01-05  250  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  251  
c88da2c979369e6 Phillip Lougher 2009-01-05  252  			if (len == size && !strncmp(name, dire->name, len)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  253  				unsigned int blk, off, ino_num;
c88da2c979369e6 Phillip Lougher 2009-01-05  254  				long long ino;
c88da2c979369e6 Phillip Lougher 2009-01-05  255  				blk = le32_to_cpu(dirh.start_block);
c88da2c979369e6 Phillip Lougher 2009-01-05  256  				off = le16_to_cpu(dire->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  257  				ino_num = le32_to_cpu(dirh.inode_number) +
c88da2c979369e6 Phillip Lougher 2009-01-05  258  					(short) le16_to_cpu(dire->inode_number);
cec4a69189091ba Phillip Lougher 2026-11-11  259  				ino = squashfs_mkinode(blk, off);
c88da2c979369e6 Phillip Lougher 2009-01-05  260  
c88da2c979369e6 Phillip Lougher 2009-01-05  261  				TRACE("calling squashfs_iget for directory "
c88da2c979369e6 Phillip Lougher 2009-01-05  262  					"entry %s, inode  %x:%x, %d\n", name,
c88da2c979369e6 Phillip Lougher 2009-01-05  263  					blk, off, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  264  
c88da2c979369e6 Phillip Lougher 2009-01-05  265  				inode = squashfs_iget(dir->i_sb, ino, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  266  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  267  			}
c88da2c979369e6 Phillip Lougher 2009-01-05  268  		}
c88da2c979369e6 Phillip Lougher 2009-01-05  269  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  270  
c88da2c979369e6 Phillip Lougher 2009-01-05  271  exit_lookup:
c88da2c979369e6 Phillip Lougher 2009-01-05  272  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  273  	return d_splice_alias(inode, dentry);
c88da2c979369e6 Phillip Lougher 2009-01-05  274  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  275  data_error:
44cff8a9ee8a974 Phillip Lougher 2011-03-15  276  	err = -EIO;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  277  
c88da2c979369e6 Phillip Lougher 2009-01-05  278  read_failure:
c88da2c979369e6 Phillip Lougher 2009-01-05  279  	ERROR("Unable to read directory block [%llx:%x]\n",
4dddf794b08bef0 Phillip Lougher 2026-11-11  280  		squashfs_i(dir)->start, squashfs_i(dir)->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  281  failed:
c88da2c979369e6 Phillip Lougher 2009-01-05  282  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05 @283  	return ERR_PTR(err);
c88da2c979369e6 Phillip Lougher 2009-01-05  284  }
c88da2c979369e6 Phillip Lougher 2009-01-05  285  

:::::: The code at line 283 was first introduced by commit
:::::: c88da2c979369e6bf8d2c0c80fad2f90c35e64ce Squashfs: directory lookup operations

:::::: TO: Phillip Lougher <phillip@lougher.demon.co.uk>
:::::: CC: Phillip Lougher <phillip@lougher.demon.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
