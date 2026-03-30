Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DD3B2FCD
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862157; cv=none; b=m4LgPTEARS7FC3IYtQfhJBluj4wEAepD4Wk7Ypwh2DbQueIrJyVaVL56FmcSctS3DHu2ZX1KoM5gEK8HI7ICP0Jkmq69AhheSBGt+e/eZlTWP242ThXTiCPALiR9idaAugNUvOfZlquUiWIfKB4nUyoNafDqnQdbClYzu1y4drM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862157; c=relaxed/simple;
	bh=bF9QhdGRz6ZQkBt0ewODy6oB1Bv62Tqorp5xmtcfbJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQK2X+V89R9OaAnNTYSSfkmfAu4mkRFkgkvag+vLfqP9LwAYiY+OW9cfC9VEgdDdm3zBMuUyC6Q23bkFdkyq8dxAPr2nSbW0uN9xVpncyi5ot+JjS8TDKVTyq2MDc7iP8uzM1D+4xoM8TWYM784k8INvgy164kC1iHBGOj3Ngjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hudpeWMP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hudpeWMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774862155; x=1806398155;
  h=date:from:to:cc:subject:message-id;
  bh=bF9QhdGRz6ZQkBt0ewODy6oB1Bv62Tqorp5xmtcfbJU=;
  b=hudpeWMPREn02XAnxyZhz1+1FN48OGV21yZt5771SV4OHteauR2pgp/o
   F2A730Li4wmgrGMgfuzxnO1zCc72WvB5LYnK6o8Jr16zE0dQjefZbbMet
   rmzvFpN1RknOarDVteLCacZFJAnFWh5wyW1/iuMt2Tv1AUm/gLLtCgHh0
   IxbU7IoaNyrNuKjQmk1LH8bHnRNz3ifLlOvREmyR67doPgkpo3+vnAqBv
   QVrs5m2vBTFNv7WAH9NL5LRkamsSmnHc+w6n3uQUP0ZAi9mgbSYOBBZ1v
   Eos1E8xirc4J50CVuAsDsud5s08XKdziXY6exJM4lYkuPidXQKDSdth+r
   g==;
X-CSE-ConnectionGUID: UN35VAGqSoejeGD9CyuIbw==
X-CSE-MsgGUID: wwRAw305R8KZCjJqyJ7Lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="93431905"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="93431905"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:15:51 -0700
X-CSE-ConnectionGUID: Lltxj5gKQeGLlAAawhUHDg==
X-CSE-MsgGUID: HgG9m+j0TvWoxQo1RrmzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="226256231"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Mar 2026 02:15:50 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w78ip-000000000tT-21Xc;
	Mon, 30 Mar 2026 09:15:47 +0000
Date: Mon, 30 Mar 2026 17:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 441/10350] fs/ntfs/namei.c:239
 ntfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202603301726.fP1khpJQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b [441/10350] ntfs: add Kconfig and Makefile
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301726.fP1khpJQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301726.fP1khpJQ-lkp@intel.com/

New smatch warnings:
fs/ntfs/namei.c:239 ntfs_lookup() warn: passing zero to 'ERR_PTR'
fs/ntfs/compress.c:718 ntfs_read_compressed_block() warn: potentially one past the end of array 'pages[cur_page]'
fs/ntfs/compress.c:718 ntfs_read_compressed_block() warn: potentially one past the end of array 'pages[cur_page]'
fs/ntfs/inode.c:2155 ntfs_read_inode_mount() warn: missing unwind goto?

Old smatch warnings:
fs/ntfs/namei.c:360 ntfs_sd_add_everyone() warn: assigning (-32764) to unsigned variable 'sd->control'
fs/ntfs/namei.c:1091 ntfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1175 __ntfs_link() warn: impossible condition '(name_len > 255) => (0-255 > 255)'
fs/ntfs/compress.c:751 ntfs_read_compressed_block() warn: potentially one past the end of array 'pages[cur_page]'
fs/ntfs/compress.c:751 ntfs_read_compressed_block() warn: potentially one past the end of array 'pages[cur_page]'
fs/ntfs/inode.c:3277 ntfs_inode_close() warn: variable dereferenced before check 'tmp_nis' (see line 3257)

vim +/ERR_PTR +239 fs/ntfs/namei.c

af0db57d4293cc Namjae Jeon 2026-02-13  100  
af0db57d4293cc Namjae Jeon 2026-02-13  101  /*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  102   * ntfs_lookup - find the inode represented by a dentry in a directory inode
1e9ea7e04472d4 Namjae Jeon 2025-12-30  103   * @dir_ino:	directory inode in which to look for the inode
1e9ea7e04472d4 Namjae Jeon 2025-12-30  104   * @dent:	dentry representing the inode to look for
1e9ea7e04472d4 Namjae Jeon 2025-12-30  105   * @flags:	lookup flags
1e9ea7e04472d4 Namjae Jeon 2025-12-30  106   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  107   * In short, ntfs_lookup() looks for the inode represented by the dentry @dent
1e9ea7e04472d4 Namjae Jeon 2025-12-30  108   * in the directory inode @dir_ino and if found attaches the inode to the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  109   * dentry @dent.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  110   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  111   * In more detail, the dentry @dent specifies which inode to look for by
1e9ea7e04472d4 Namjae Jeon 2025-12-30  112   * supplying the name of the inode in @dent->d_name.name. ntfs_lookup()
1e9ea7e04472d4 Namjae Jeon 2025-12-30  113   * converts the name to Unicode and walks the contents of the directory inode
1e9ea7e04472d4 Namjae Jeon 2025-12-30  114   * @dir_ino looking for the converted Unicode name. If the name is found in the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  115   * directory, the corresponding inode is loaded by calling ntfs_iget() on its
1e9ea7e04472d4 Namjae Jeon 2025-12-30  116   * inode number and the inode is associated with the dentry @dent via a call to
1e9ea7e04472d4 Namjae Jeon 2025-12-30  117   * d_splice_alias().
1e9ea7e04472d4 Namjae Jeon 2025-12-30  118   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  119   * If the name is not found in the directory, a NULL inode is inserted into the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  120   * dentry @dent via a call to d_add(). The dentry is then termed a negative
1e9ea7e04472d4 Namjae Jeon 2025-12-30  121   * dentry.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  122   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  123   * Only if an actual error occurs, do we return an error via ERR_PTR().
1e9ea7e04472d4 Namjae Jeon 2025-12-30  124   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  125   * In order to handle the case insensitivity issues of NTFS with regards to the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  126   * dcache and the dcache requiring only one dentry per directory, we deal with
1e9ea7e04472d4 Namjae Jeon 2025-12-30  127   * dentry aliases that only differ in case in ->ntfs_lookup() while maintaining
1e9ea7e04472d4 Namjae Jeon 2025-12-30  128   * a case sensitive dcache. This means that we get the full benefit of dcache
1e9ea7e04472d4 Namjae Jeon 2025-12-30  129   * speed when the file/directory is looked up with the same case as returned by
1e9ea7e04472d4 Namjae Jeon 2025-12-30  130   * ->ntfs_readdir() but that a lookup for any other case (or for the short file
1e9ea7e04472d4 Namjae Jeon 2025-12-30  131   * name) will not find anything in dcache and will enter ->ntfs_lookup()
1e9ea7e04472d4 Namjae Jeon 2025-12-30  132   * instead, where we search the directory for a fully matching file name
1e9ea7e04472d4 Namjae Jeon 2025-12-30  133   * (including case) and if that is not found, we search for a file name that
1e9ea7e04472d4 Namjae Jeon 2025-12-30  134   * matches with different case and if that has non-POSIX semantics we return
1e9ea7e04472d4 Namjae Jeon 2025-12-30  135   * that. We actually do only one search (case sensitive) and keep tabs on
1e9ea7e04472d4 Namjae Jeon 2025-12-30  136   * whether we have found a case insensitive match in the process.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  137   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  138   * To simplify matters for us, we do not treat the short vs long filenames as
1e9ea7e04472d4 Namjae Jeon 2025-12-30  139   * two hard links but instead if the lookup matches a short filename, we
1e9ea7e04472d4 Namjae Jeon 2025-12-30  140   * return the dentry for the corresponding long filename instead.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  141   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  142   * There are three cases we need to distinguish here:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  143   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  144   * 1) @dent perfectly matches (i.e. including case) a directory entry with a
1e9ea7e04472d4 Namjae Jeon 2025-12-30  145   *    file name in the WIN32 or POSIX namespaces. In this case
1e9ea7e04472d4 Namjae Jeon 2025-12-30  146   *    ntfs_lookup_inode_by_name() will return with name set to NULL and we
1e9ea7e04472d4 Namjae Jeon 2025-12-30  147   *    just d_splice_alias() @dent.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  148   * 2) @dent matches (not including case) a directory entry with a file name in
1e9ea7e04472d4 Namjae Jeon 2025-12-30  149   *    the WIN32 namespace. In this case ntfs_lookup_inode_by_name() will return
1e9ea7e04472d4 Namjae Jeon 2025-12-30  150   *    with name set to point to a kmalloc()ed ntfs_name structure containing
1e9ea7e04472d4 Namjae Jeon 2025-12-30  151   *    the properly cased little endian Unicode name. We convert the name to the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  152   *    current NLS code page, search if a dentry with this name already exists
1e9ea7e04472d4 Namjae Jeon 2025-12-30  153   *    and if so return that instead of @dent.  At this point things are
1e9ea7e04472d4 Namjae Jeon 2025-12-30  154   *    complicated by the possibility of 'disconnected' dentries due to NFS
1e9ea7e04472d4 Namjae Jeon 2025-12-30  155   *    which we deal with appropriately (see the code comments).  The VFS will
1e9ea7e04472d4 Namjae Jeon 2025-12-30  156   *    then destroy the old @dent and use the one we returned.  If a dentry is
1e9ea7e04472d4 Namjae Jeon 2025-12-30  157   *    not found, we allocate a new one, d_splice_alias() it, and return it as
1e9ea7e04472d4 Namjae Jeon 2025-12-30  158   *    above.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  159   * 3) @dent matches either perfectly or not (i.e. we don't care about case) a
1e9ea7e04472d4 Namjae Jeon 2025-12-30  160   *    directory entry with a file name in the DOS namespace. In this case
1e9ea7e04472d4 Namjae Jeon 2025-12-30  161   *    ntfs_lookup_inode_by_name() will return with name set to point to a
1e9ea7e04472d4 Namjae Jeon 2025-12-30  162   *    kmalloc()ed ntfs_name structure containing the mft reference (cpu endian)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  163   *    of the inode. We use the mft reference to read the inode and to find the
1e9ea7e04472d4 Namjae Jeon 2025-12-30  164   *    file name in the WIN32 namespace corresponding to the matched short file
1e9ea7e04472d4 Namjae Jeon 2025-12-30  165   *    name. We then convert the name to the current NLS code page, and proceed
1e9ea7e04472d4 Namjae Jeon 2025-12-30  166   *    searching for a dentry with this name, etc, as in case 2), above.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  167   *
1e9ea7e04472d4 Namjae Jeon 2025-12-30  168   * Locking: Caller must hold i_mutex on the directory.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  169   */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  170  static struct dentry *ntfs_lookup(struct inode *dir_ino, struct dentry *dent,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  171  		unsigned int flags)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  172  {
af0db57d4293cc Namjae Jeon 2026-02-13  173  	struct ntfs_volume *vol = NTFS_SB(dir_ino->i_sb);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  174  	struct inode *dent_inode;
af0db57d4293cc Namjae Jeon 2026-02-13  175  	__le16 *uname;
af0db57d4293cc Namjae Jeon 2026-02-13  176  	struct ntfs_name *name = NULL;
af0db57d4293cc Namjae Jeon 2026-02-13  177  	u64 mref;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  178  	unsigned long dent_ino;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  179  	int uname_len;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  180  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  181  	ntfs_debug("Looking up %pd in directory inode 0x%lx.",
1e9ea7e04472d4 Namjae Jeon 2025-12-30  182  			dent, dir_ino->i_ino);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  183  	/* Convert the name of the dentry to Unicode. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  184  	uname_len = ntfs_nlstoucs(vol, dent->d_name.name, dent->d_name.len,
af0db57d4293cc Namjae Jeon 2026-02-13  185  				  &uname, NTFS_MAX_NAME_LEN);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  186  	if (uname_len < 0) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  187  		if (uname_len != -ENAMETOOLONG)
af0db57d4293cc Namjae Jeon 2026-02-13  188  			ntfs_debug("Failed to convert name to Unicode.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  189  		return ERR_PTR(uname_len);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  190  	}
af0db57d4293cc Namjae Jeon 2026-02-13  191  	mutex_lock(&NTFS_I(dir_ino)->mrec_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  192  	mref = ntfs_lookup_inode_by_name(NTFS_I(dir_ino), uname, uname_len,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  193  			&name);
af0db57d4293cc Namjae Jeon 2026-02-13  194  	mutex_unlock(&NTFS_I(dir_ino)->mrec_lock);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  195  	kmem_cache_free(ntfs_name_cache, uname);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  196  	if (!IS_ERR_MREF(mref)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  197  		dent_ino = MREF(mref);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  198  		ntfs_debug("Found inode 0x%lx. Calling ntfs_iget.", dent_ino);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  199  		dent_inode = ntfs_iget(vol->sb, dent_ino);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  200  		if (!IS_ERR(dent_inode)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  201  			/* Consistency check. */
af0db57d4293cc Namjae Jeon 2026-02-13  202  			if (MSEQNO(mref) == NTFS_I(dent_inode)->seq_no ||
1e9ea7e04472d4 Namjae Jeon 2025-12-30  203  			    dent_ino == FILE_MFT) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  204  				/* Perfect WIN32/POSIX match. -- Case 1. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  205  				if (!name) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  206  					ntfs_debug("Done.  (Case 1.)");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  207  					return d_splice_alias(dent_inode, dent);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  208  				}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  209  				/*
1e9ea7e04472d4 Namjae Jeon 2025-12-30  210  				 * We are too indented.  Handle imperfect
1e9ea7e04472d4 Namjae Jeon 2025-12-30  211  				 * matches and short file names further below.
1e9ea7e04472d4 Namjae Jeon 2025-12-30  212  				 */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  213  				goto handle_name;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  214  			}
af0db57d4293cc Namjae Jeon 2026-02-13  215  			ntfs_error(vol->sb,
af0db57d4293cc Namjae Jeon 2026-02-13  216  				"Found stale reference to inode 0x%lx (reference sequence number = 0x%x, inode sequence number = 0x%x), returning -EIO. Run chkdsk.",
1e9ea7e04472d4 Namjae Jeon 2025-12-30  217  				dent_ino, MSEQNO(mref),
1e9ea7e04472d4 Namjae Jeon 2025-12-30  218  				NTFS_I(dent_inode)->seq_no);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  219  			iput(dent_inode);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  220  			dent_inode = ERR_PTR(-EIO);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  221  		} else
af0db57d4293cc Namjae Jeon 2026-02-13  222  			ntfs_error(vol->sb, "ntfs_iget(0x%lx) failed with error code %li.",
af0db57d4293cc Namjae Jeon 2026-02-13  223  					dent_ino, PTR_ERR(dent_inode));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  224  		kfree(name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  225  		/* Return the error code. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  226  		return ERR_CAST(dent_inode);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  227  	}
af0db57d4293cc Namjae Jeon 2026-02-13  228  	kfree(name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  229  	/* It is guaranteed that @name is no longer allocated at this point. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  230  	if (MREF_ERR(mref) == -ENOENT) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  231  		ntfs_debug("Entry was not found, adding negative dentry.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  232  		/* The dcache will handle negative entries. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  233  		d_add(dent, NULL);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  234  		ntfs_debug("Done.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  235  		return NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  236  	}
af0db57d4293cc Namjae Jeon 2026-02-13  237  	ntfs_error(vol->sb, "ntfs_lookup_ino_by_name() failed with error code %i.",
af0db57d4293cc Namjae Jeon 2026-02-13  238  			-MREF_ERR(mref));
1e9ea7e04472d4 Namjae Jeon 2025-12-30 @239  	return ERR_PTR(MREF_ERR(mref));
1e9ea7e04472d4 Namjae Jeon 2025-12-30  240  handle_name:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  241  	{
af0db57d4293cc Namjae Jeon 2026-02-13  242  		struct mft_record *m;
af0db57d4293cc Namjae Jeon 2026-02-13  243  		struct ntfs_attr_search_ctx *ctx;
af0db57d4293cc Namjae Jeon 2026-02-13  244  		struct ntfs_inode *ni = NTFS_I(dent_inode);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  245  		int err;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  246  		struct qstr nls_name;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  247  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  248  		nls_name.name = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  249  		if (name->type != FILE_NAME_DOS) {			/* Case 2. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  250  			ntfs_debug("Case 2.");
af0db57d4293cc Namjae Jeon 2026-02-13  251  			nls_name.len = (unsigned int)ntfs_ucstonls(vol,
af0db57d4293cc Namjae Jeon 2026-02-13  252  					(__le16 *)&name->name, name->len,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  253  					(unsigned char **)&nls_name.name, 0);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  254  			kfree(name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  255  		} else /* if (name->type == FILE_NAME_DOS) */ {		/* Case 3. */
af0db57d4293cc Namjae Jeon 2026-02-13  256  			struct file_name_attr *fn;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  257  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  258  			ntfs_debug("Case 3.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  259  			kfree(name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  260  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  261  			/* Find the WIN32 name corresponding to the matched DOS name. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  262  			ni = NTFS_I(dent_inode);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  263  			m = map_mft_record(ni);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  264  			if (IS_ERR(m)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  265  				err = PTR_ERR(m);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  266  				m = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  267  				ctx = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  268  				goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  269  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  270  			ctx = ntfs_attr_get_search_ctx(ni, m);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  271  			if (unlikely(!ctx)) {
1e9ea7e04472d4 Namjae Jeon 2025-12-30  272  				err = -ENOMEM;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  273  				goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  274  			}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  275  			do {
af0db57d4293cc Namjae Jeon 2026-02-13  276  				struct attr_record *a;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  277  				u32 val_len;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  278  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  279  				err = ntfs_attr_lookup(AT_FILE_NAME, NULL, 0, 0, 0,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  280  						NULL, 0, ctx);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  281  				if (unlikely(err)) {
af0db57d4293cc Namjae Jeon 2026-02-13  282  					ntfs_error(vol->sb,
af0db57d4293cc Namjae Jeon 2026-02-13  283  						"Inode corrupt: No WIN32 namespace counterpart to DOS file name. Run chkdsk.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  284  					if (err == -ENOENT)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  285  						err = -EIO;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  286  					goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  287  				}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  288  				/* Consistency checks. */
1e9ea7e04472d4 Namjae Jeon 2025-12-30  289  				a = ctx->attr;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  290  				if (a->non_resident || a->flags)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  291  					goto eio_err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  292  				val_len = le32_to_cpu(a->data.resident.value_length);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  293  				if (le16_to_cpu(a->data.resident.value_offset) +
1e9ea7e04472d4 Namjae Jeon 2025-12-30  294  						val_len > le32_to_cpu(a->length))
1e9ea7e04472d4 Namjae Jeon 2025-12-30  295  					goto eio_err_out;
af0db57d4293cc Namjae Jeon 2026-02-13  296  				fn = (struct file_name_attr *)((u8 *)ctx->attr + le16_to_cpu(
1e9ea7e04472d4 Namjae Jeon 2025-12-30  297  							ctx->attr->data.resident.value_offset));
af0db57d4293cc Namjae Jeon 2026-02-13  298  				if ((u32)(fn->file_name_length * sizeof(__le16) +
af0db57d4293cc Namjae Jeon 2026-02-13  299  							sizeof(struct file_name_attr)) > val_len)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  300  					goto eio_err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  301  			} while (fn->file_name_type != FILE_NAME_WIN32);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  302  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  303  			/* Convert the found WIN32 name to current NLS code page. */
af0db57d4293cc Namjae Jeon 2026-02-13  304  			nls_name.len = (unsigned int)ntfs_ucstonls(vol,
af0db57d4293cc Namjae Jeon 2026-02-13  305  					(__le16 *)&fn->file_name, fn->file_name_length,
1e9ea7e04472d4 Namjae Jeon 2025-12-30  306  					(unsigned char **)&nls_name.name, 0);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  307  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  308  			ntfs_attr_put_search_ctx(ctx);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  309  			unmap_mft_record(ni);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  310  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  311  		m = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  312  		ctx = NULL;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  313  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  314  		/* Check if a conversion error occurred. */
af0db57d4293cc Namjae Jeon 2026-02-13  315  		if ((int)nls_name.len < 0) {
af0db57d4293cc Namjae Jeon 2026-02-13  316  			err = (int)nls_name.len;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  317  			goto err_out;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  318  		}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  319  		nls_name.hash = full_name_hash(dent, nls_name.name, nls_name.len);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  320  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  321  		dent = d_add_ci(dent, dent_inode, &nls_name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  322  		kfree(nls_name.name);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  323  		return dent;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  324  
1e9ea7e04472d4 Namjae Jeon 2025-12-30  325  eio_err_out:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  326  		ntfs_error(vol->sb, "Illegal file name attribute. Run chkdsk.");
1e9ea7e04472d4 Namjae Jeon 2025-12-30  327  		err = -EIO;
1e9ea7e04472d4 Namjae Jeon 2025-12-30  328  err_out:
1e9ea7e04472d4 Namjae Jeon 2025-12-30  329  		if (ctx)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  330  			ntfs_attr_put_search_ctx(ctx);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  331  		if (m)
1e9ea7e04472d4 Namjae Jeon 2025-12-30  332  			unmap_mft_record(ni);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  333  		iput(dent_inode);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  334  		ntfs_error(vol->sb, "Failed, returning error code %i.", err);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  335  		return ERR_PTR(err);
1e9ea7e04472d4 Namjae Jeon 2025-12-30  336  	}
1e9ea7e04472d4 Namjae Jeon 2025-12-30  337  }
1e9ea7e04472d4 Namjae Jeon 2025-12-30  338  

:::::: The code at line 239 was first introduced by commit
:::::: 1e9ea7e04472d4e5e12e58c881eaacfb3e49b669 Revert "fs: Remove NTFS classic"

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
