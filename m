Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674884;
	b=fAW+1SFvU51zepfekrCQLTb/4ZXIvPv+m/EqNF2ep6PGRYUVu2KAZi4uilnbiy1fL1Tn
	 bsxcRVPKGiuQxLW5ANJ6O3X9FLPZdUSst43PcJmdnmITjvixc+78u3ZZxKG+4vlO+Y9mm
	 lV8d5oFJWWpolLztoXelZJ46p0qP2nBTJ7xA2Tx1lSi5yrXnJ9DNfb/5Og9wegcKDfgNn
	 csyNtj1JApb2kIyUDId2iqjSM3s5zjszsik+ODvtAzJtRi2kvj8rUQCiqUgPYm/+jBNCK
	 N6TGx48T1bMjGFXM2eq1PMysH1GYqQHk1Mo0vl4BADAVPt52gEv03dPHrkahtSnpGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674884;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=b7axfxLFALzEoFtotAdD8s20jLH2XZhg9+Y07ND32zQ=;
	b=pIdhc1ldZw0vmXlrvk2yv6dUcqB2h1K6kDB3UmVbryQ3+j6ITs5VmKrGHSqMpECEKluE
	 1QqlKCqytP0STYXTPorWMtZVQkamETNaK3LexC7QLZD2lTWnAvPPbkBdu7EsMQUrUGI7J
	 cG4wuyclFN4cQCMd+S+IPGaP8Nm9KAvcyfYQE/iuwSoCmQsrMp8vRCzg8mz5drOjdQkjY
	 w0bQgtTv2Dpf0Ff6QYsN5ue+mA9mOPZcAP5KCQkpq6DYbvAY817M/+IGmlUR1w+yzxSyh
	 3+VqJpVO69HSxhgc6ovehUaxy6F3aKKhjcs8/qW0WDdb9YfUiGXZzNRUbsw0cBt0Wnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eRx+kPM6;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EF606A32E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 16:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572EF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eRx+kPM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794674882; x=1826210882;
  h=date:from:to:cc:subject:message-id;
  bh=m5lpbW118K48yWPzi78Gv1buEbVHXyoKUg34Yqie9G4=;
  b=eRx+kPM666kZxr84LKtNuuTo89BQzywlhh/PmVpgUmkEGVT3UetCKCDP
   yosqrfSVsWJg/qWuBsBxyZBGd247Id4eidcuKKa7JmVC00cP19B6Kldm4
   QyQWqm+r4T/SSOMWy8z4NFlLGsVkYqG+NtEU9ayGwsagc63GKH5XiqmOF
   x8YBEYNqcfoaWaVJ05MgNw54c3x6wEIbb20vOnvnUZitRix7xck0OffpS
   njBLgLVV2Qtx8pArVPga1Nxu2b45SmaVFir2zrbPUS5LmjjmKCaKDLK8m
   s22hracfL7zOJwggrskDs0X16i6g/vqenMwWP0lzWFY4FzP3dvba2bVUJ
   A==;
X-CSE-ConnectionGUID: OaE0GTu3RbCu1NkV77eu1w==
X-CSE-MsgGUID: ptb3GfXLQk6UtEiUuCHaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3338560"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3338560"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 08:48:02 -0800
X-CSE-ConnectionGUID: o28lqMNyTQOgz5mSLCM3xw==
X-CSE-MsgGUID: jyaWnKvQSVe6U8yYzIIusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="8984056"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2026 08:48:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSGuz-000000001p1-3gQF;
	Sat, 14 Nov 2026 16:47:57 +0000
Date: Sat, 14 Nov 2026 17:47:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-nonmm-unstable 130/152]
 fs/squashfs/namei.c:141:5-10: WARNING: Unsigned expression compared with
 zero: block < 0
Message-ID: <202611141716.fhmOi3Fb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

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
head:   9bfc44c252525344c5aebf880259647edf35eda8
commit: d0a5fe53cf5d2f8f64bf1791ac8d72e2ae69710a [130/152] Squashfs: sanity check directory metadata block location
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: sparc64-randconfig-r2106-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141716.fhmOi3Fb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611141716.fhmOi3Fb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/squashfs/namei.c:141:5-10: WARNING: Unsigned expression compared with zero: block < 0

vim +141 fs/squashfs/namei.c

c88da2c979369e Phillip Lougher 2009-01-05  123  
c88da2c979369e Phillip Lougher 2009-01-05  124  
c88da2c979369e Phillip Lougher 2009-01-05  125  static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
00cd8dd3bf95f2 Al Viro         2012-06-10  126  				 unsigned int flags)
c88da2c979369e Phillip Lougher 2009-01-05  127  {
c88da2c979369e Phillip Lougher 2009-01-05  128  	const unsigned char *name = dentry->d_name.name;
c88da2c979369e Phillip Lougher 2009-01-05  129  	int len = dentry->d_name.len;
c88da2c979369e Phillip Lougher 2009-01-05  130  	struct inode *inode = NULL;
c88da2c979369e Phillip Lougher 2009-01-05  131  	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
c88da2c979369e Phillip Lougher 2009-01-05  132  	struct squashfs_dir_header dirh;
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  133  	struct squashfs_dir_entry *dire = NULL;
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  134  	u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
c88da2c979369e Phillip Lougher 2009-01-05  135  	int offset = squashfs_i(dir)->offset;
52e9ce1c0f2060 Phillip Lougher 2013-09-03  136  	int err, length;
52e9ce1c0f2060 Phillip Lougher 2013-09-03  137  	unsigned int dir_count, size;
c88da2c979369e Phillip Lougher 2009-01-05  138  
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  139  	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  140  
d0a5fe53cf5d2f Phillip Lougher 2026-11-11 @141  	if (block < 0)
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  142  		goto data_error;
c88da2c979369e Phillip Lougher 2009-01-05  143  
c88da2c979369e Phillip Lougher 2009-01-05  144  	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
c88da2c979369e Phillip Lougher 2009-01-05  145  	if (dire == NULL) {
c88da2c979369e Phillip Lougher 2009-01-05  146  		ERROR("Failed to allocate squashfs_dir_entry\n");
c88da2c979369e Phillip Lougher 2009-01-05  147  		return ERR_PTR(-ENOMEM);
c88da2c979369e Phillip Lougher 2009-01-05  148  	}
c88da2c979369e Phillip Lougher 2009-01-05  149  
c88da2c979369e Phillip Lougher 2009-01-05  150  	if (len > SQUASHFS_NAME_LEN) {
c88da2c979369e Phillip Lougher 2009-01-05  151  		err = -ENAMETOOLONG;
c88da2c979369e Phillip Lougher 2009-01-05  152  		goto failed;
c88da2c979369e Phillip Lougher 2009-01-05  153  	}
c88da2c979369e Phillip Lougher 2009-01-05  154  
c88da2c979369e Phillip Lougher 2009-01-05  155  	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
c88da2c979369e Phillip Lougher 2009-01-05  156  				squashfs_i(dir)->dir_idx_start,
c88da2c979369e Phillip Lougher 2009-01-05  157  				squashfs_i(dir)->dir_idx_offset,
040bf9a717885d Phillip Lougher 2024-04-03  158  				squashfs_i(dir)->dir_idx_cnt, name);
c88da2c979369e Phillip Lougher 2009-01-05  159  
c88da2c979369e Phillip Lougher 2009-01-05  160  	while (length < i_size_read(dir)) {
c88da2c979369e Phillip Lougher 2009-01-05  161  		/*
c88da2c979369e Phillip Lougher 2009-01-05  162  		 * Read directory header.
c88da2c979369e Phillip Lougher 2009-01-05  163  		 */
c88da2c979369e Phillip Lougher 2009-01-05  164  		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
c88da2c979369e Phillip Lougher 2009-01-05  165  				&offset, sizeof(dirh));
c88da2c979369e Phillip Lougher 2009-01-05  166  		if (err < 0)
c88da2c979369e Phillip Lougher 2009-01-05  167  			goto read_failure;
c88da2c979369e Phillip Lougher 2009-01-05  168  
c88da2c979369e Phillip Lougher 2009-01-05  169  		length += sizeof(dirh);
c88da2c979369e Phillip Lougher 2009-01-05  170  
c88da2c979369e Phillip Lougher 2009-01-05  171  		dir_count = le32_to_cpu(dirh.count) + 1;
44cff8a9ee8a97 Phillip Lougher 2011-03-15  172  
4826d83d9c4f6b Ajeet Yadav     2012-02-02  173  		if (dir_count > SQUASHFS_DIR_COUNT)
44cff8a9ee8a97 Phillip Lougher 2011-03-15  174  			goto data_error;
44cff8a9ee8a97 Phillip Lougher 2011-03-15  175  
c88da2c979369e Phillip Lougher 2009-01-05  176  		while (dir_count--) {
c88da2c979369e Phillip Lougher 2009-01-05  177  			/*
c88da2c979369e Phillip Lougher 2009-01-05  178  			 * Read directory entry.
c88da2c979369e Phillip Lougher 2009-01-05  179  			 */
c88da2c979369e Phillip Lougher 2009-01-05  180  			err = squashfs_read_metadata(dir->i_sb, dire, &block,
c88da2c979369e Phillip Lougher 2009-01-05  181  					&offset, sizeof(*dire));
c88da2c979369e Phillip Lougher 2009-01-05  182  			if (err < 0)
c88da2c979369e Phillip Lougher 2009-01-05  183  				goto read_failure;
c88da2c979369e Phillip Lougher 2009-01-05  184  
c88da2c979369e Phillip Lougher 2009-01-05  185  			size = le16_to_cpu(dire->size) + 1;
c88da2c979369e Phillip Lougher 2009-01-05  186  
44cff8a9ee8a97 Phillip Lougher 2011-03-15  187  			/* size should never be larger than SQUASHFS_NAME_LEN */
44cff8a9ee8a97 Phillip Lougher 2011-03-15  188  			if (size > SQUASHFS_NAME_LEN)
44cff8a9ee8a97 Phillip Lougher 2011-03-15  189  				goto data_error;
44cff8a9ee8a97 Phillip Lougher 2011-03-15  190  
c88da2c979369e Phillip Lougher 2009-01-05  191  			err = squashfs_read_metadata(dir->i_sb, dire->name,
c88da2c979369e Phillip Lougher 2009-01-05  192  					&block, &offset, size);
c88da2c979369e Phillip Lougher 2009-01-05  193  			if (err < 0)
c88da2c979369e Phillip Lougher 2009-01-05  194  				goto read_failure;
c88da2c979369e Phillip Lougher 2009-01-05  195  
c88da2c979369e Phillip Lougher 2009-01-05  196  			length += sizeof(*dire) + size;
c88da2c979369e Phillip Lougher 2009-01-05  197  
c88da2c979369e Phillip Lougher 2009-01-05  198  			if (name[0] < dire->name[0])
c88da2c979369e Phillip Lougher 2009-01-05  199  				goto exit_lookup;
c88da2c979369e Phillip Lougher 2009-01-05  200  
c88da2c979369e Phillip Lougher 2009-01-05  201  			if (len == size && !strncmp(name, dire->name, len)) {
c88da2c979369e Phillip Lougher 2009-01-05  202  				unsigned int blk, off, ino_num;
c88da2c979369e Phillip Lougher 2009-01-05  203  				long long ino;
c88da2c979369e Phillip Lougher 2009-01-05  204  				blk = le32_to_cpu(dirh.start_block);
c88da2c979369e Phillip Lougher 2009-01-05  205  				off = le16_to_cpu(dire->offset);
c88da2c979369e Phillip Lougher 2009-01-05  206  				ino_num = le32_to_cpu(dirh.inode_number) +
c88da2c979369e Phillip Lougher 2009-01-05  207  					(short) le16_to_cpu(dire->inode_number);
9a6badf613992e Phillip Lougher 2026-11-11  208  				ino = squashfs_mkinode(blk, off);
c88da2c979369e Phillip Lougher 2009-01-05  209  
c88da2c979369e Phillip Lougher 2009-01-05  210  				TRACE("calling squashfs_iget for directory "
c88da2c979369e Phillip Lougher 2009-01-05  211  					"entry %s, inode  %x:%x, %d\n", name,
c88da2c979369e Phillip Lougher 2009-01-05  212  					blk, off, ino_num);
c88da2c979369e Phillip Lougher 2009-01-05  213  
c88da2c979369e Phillip Lougher 2009-01-05  214  				inode = squashfs_iget(dir->i_sb, ino, ino_num);
c88da2c979369e Phillip Lougher 2009-01-05  215  				goto exit_lookup;
c88da2c979369e Phillip Lougher 2009-01-05  216  			}
c88da2c979369e Phillip Lougher 2009-01-05  217  		}
c88da2c979369e Phillip Lougher 2009-01-05  218  	}
c88da2c979369e Phillip Lougher 2009-01-05  219  
c88da2c979369e Phillip Lougher 2009-01-05  220  exit_lookup:
c88da2c979369e Phillip Lougher 2009-01-05  221  	kfree(dire);
c88da2c979369e Phillip Lougher 2009-01-05  222  	return d_splice_alias(inode, dentry);
c88da2c979369e Phillip Lougher 2009-01-05  223  
44cff8a9ee8a97 Phillip Lougher 2011-03-15  224  data_error:
44cff8a9ee8a97 Phillip Lougher 2011-03-15  225  	err = -EIO;
44cff8a9ee8a97 Phillip Lougher 2011-03-15  226  
c88da2c979369e Phillip Lougher 2009-01-05  227  read_failure:
c88da2c979369e Phillip Lougher 2009-01-05  228  	ERROR("Unable to read directory block [%llx:%x]\n",
d0a5fe53cf5d2f Phillip Lougher 2026-11-11  229  		squashfs_i(dir)->start, squashfs_i(dir)->offset);
c88da2c979369e Phillip Lougher 2009-01-05  230  failed:
c88da2c979369e Phillip Lougher 2009-01-05  231  	kfree(dire);
c88da2c979369e Phillip Lougher 2009-01-05  232  	return ERR_PTR(err);
c88da2c979369e Phillip Lougher 2009-01-05  233  }
c88da2c979369e Phillip Lougher 2009-01-05  234  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
