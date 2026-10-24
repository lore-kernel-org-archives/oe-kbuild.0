Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874867;
	b=InB6UKSGU3dUGfezhK71XMbMZuGP5Z5pSZhN29YBE45fm4Sx7pYetQHV2IAvvbatoXpY
	 dVp9W90u8az8/rbli9rgqkP04kQnWNbFWqbc+w/9S73WHjyXrdscZELDxkXrTZwouCT8q
	 rSC8XQUtK4OMotUDtLGHR1jqCe6RtofsOdUcIj3AYBNUBvtztw8fOjtHbjrhuzLgbmgct
	 U8GL2FMTX85dHHpxhfl4FfLCcs7LuNIPlQ4TCot5R39KXsF2yOiEZzV2tCeOyIi50qNW1
	 HSOugH3taXDE3pc8ehKFdIwkWSOtp4SQ388K4hh7Ymet4xOyQK9ca9la81uehO1xWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874867;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mpipdaeNdR5btTlsrSvdgW+jXk/guEdh7ZS2x/KiXzE=;
	b=m4WTWhU+TbffbQDpfv3/2fJwhPsWvGSTwQ6xACG2vIuOJAfr477/mwyvxUFQOxmw0ztb
	 BVlqwjcbLRly0v4IdAU7SPBMEDfr+S7Ej8yZicghFeEwQtXNx6pTAfLgZ7JLwbojt5S0I
	 sq5ADiVosD3CH5z5crZMk3stkGDNQBD1xUEx8pR8xN6sLm1bp9nh11kHKO+bP2FB8FzML
	 +57A9KQyk862H1R02vlRQSapM3/DfB/tNq1XPZPHzIuGjV772PGvejGNSzAslZuiV9jRb
	 qEDxRd3krTQ0WVauK1uxTwblIl1RZSgkfPUOrw/FCgNHPVJWWHmirnEk/fZGZ6Wo3sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="JFyyMSy/";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE0606A31D
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 20:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFyyMSy/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792874865; x=1824410865;
  h=date:from:to:cc:subject:message-id;
  bh=MdAGD2UMbf9vXB9rz3J1yBCAUbPsRhvLrB293ChGfTk=;
  b=JFyyMSy/qQIoIcmaSqnEQ0VR/Px+Fn97iQFb7CuC6B8BaxEDnEkaB5ce
   Bj6LF572ERJoPMVftEIy7tCFt066pkaMwkWVjUpXSpdxMJWildPVp1ssN
   gzVPsDebQOp6W9s4rkXB0q4rprFhv4nAxFcfCYnjZ5DNm40dn9csNApiM
   B48jn5cLvoB6Wn7Hi0xORFtLk6AakYgBQLUvAeZf4dmE98JhtOST1/wHI
   kKnXE7JyY1besR3hJbklC5uXsc0TDbcYX/tM3jC90tNVUanaXu1L5cY57
   ugnZij6on5pfekVVoGle4gdH501jnrF4wtaJI/p+6cx0h7E5EaxxW8prt
   A==;
X-CSE-ConnectionGUID: yxoJFbVVTUCmhqV5pwzfpw==
X-CSE-MsgGUID: E6ZoBlU8RIiR+bLAgG1VLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1581417"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1581417"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 13:47:45 -0700
X-CSE-ConnectionGUID: rfj69wDjRUWl+MVks1hqzg==
X-CSE-MsgGUID: QkOpPPZ3TPqdgS7MDg68lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4036324"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2026 13:47:43 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKieT-00000000UFA-118f;
	Sat, 24 Oct 2026 20:47:41 +0000
Date: Sun, 25 Oct 2026 04:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/nfs/unlink.c:476:17: warning: assignment to 'struct
 dentry *' from 'int' makes pointer from integer without a cast
Message-ID: <202610250449.g8NC02c3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20261023-132215/NeilBrown/nfs-fix-open-blocking-with-d_fsdata/20261023-125011, commit: d05202b07b194252069991dde5cae5fe37df7e75"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: NeilBrown <neil@brown.name>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20261023-132215/NeilBrown/nfs-fix-open-blocking-with-d_fsdata/20261023-125011
head:   e3a7aa9117daa6410fe3ee62c36e5397e61a664d
commit: d05202b07b194252069991dde5cae5fe37df7e75 nfs: use d_alloc_trylock() in silly-rename
date:   25 hours ago
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20261025/202610250449.g8NC02c3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250449.g8NC02c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610250449.g8NC02c3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/unlink.c: In function 'nfs_sillyrename':
   fs/nfs/unlink.c:476:19: error: implicit declaration of function 'd_alloc_trylock'; did you mean 'folio_trylock'? [-Werror=implicit-function-declaration]
     476 |         sdentry = d_alloc_trylock(dentry->d_parent, &QSTR(silly));
         |                   ^~~~~~~~~~~~~~~
         |                   folio_trylock
>> fs/nfs/unlink.c:476:17: warning: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     476 |         sdentry = d_alloc_trylock(dentry->d_parent, &QSTR(silly));
         |                 ^
   cc1: some warnings being treated as errors


vim +476 fs/nfs/unlink.c

96f9d8c0740264 Jeff Layton     2014-03-17  415  
c2dd1378fa3b52 Trond Myklebust 2013-08-21  416  #define SILLYNAME_PREFIX ".nfs"
c2dd1378fa3b52 Trond Myklebust 2013-08-21  417  #define SILLYNAME_PREFIX_LEN ((unsigned)sizeof(SILLYNAME_PREFIX) - 1)
c2dd1378fa3b52 Trond Myklebust 2013-08-21  418  #define SILLYNAME_FILEID_LEN ((unsigned)sizeof(u64) << 1)
c2dd1378fa3b52 Trond Myklebust 2013-08-21  419  #define SILLYNAME_COUNTER_LEN ((unsigned)sizeof(unsigned int) << 1)
c2dd1378fa3b52 Trond Myklebust 2013-08-21  420  #define SILLYNAME_LEN (SILLYNAME_PREFIX_LEN + \
c2dd1378fa3b52 Trond Myklebust 2013-08-21  421  		SILLYNAME_FILEID_LEN + \
c2dd1378fa3b52 Trond Myklebust 2013-08-21  422  		SILLYNAME_COUNTER_LEN)
c2dd1378fa3b52 Trond Myklebust 2013-08-21  423  
779c51795bfb35 Jeff Layton     2010-09-17  424  /**
779c51795bfb35 Jeff Layton     2010-09-17  425   * nfs_sillyrename - Perform a silly-rename of a dentry
779c51795bfb35 Jeff Layton     2010-09-17  426   * @dir: inode of directory that contains dentry
779c51795bfb35 Jeff Layton     2010-09-17  427   * @dentry: dentry to be sillyrenamed
779c51795bfb35 Jeff Layton     2010-09-17  428   *
779c51795bfb35 Jeff Layton     2010-09-17  429   * NFSv2/3 is stateless and the server doesn't know when the client is
779c51795bfb35 Jeff Layton     2010-09-17  430   * holding a file open. To prevent application problems when a file is
779c51795bfb35 Jeff Layton     2010-09-17  431   * unlinked while it's still open, the client performs a "silly-rename".
779c51795bfb35 Jeff Layton     2010-09-17  432   * That is, it renames the file to a hidden file in the same directory,
779c51795bfb35 Jeff Layton     2010-09-17  433   * and only performs the unlink once the last reference to it is put.
779c51795bfb35 Jeff Layton     2010-09-17  434   *
779c51795bfb35 Jeff Layton     2010-09-17  435   * The final cleanup is done during dentry_iput.
674e405b8b3310 J. Bruce Fields 2011-07-15  436   *
674e405b8b3310 J. Bruce Fields 2011-07-15  437   * (Note: NFSv4 is stateful, and has opens, so in theory an NFSv4 server
674e405b8b3310 J. Bruce Fields 2011-07-15  438   * could take responsibility for keeping open files referenced.  The server
674e405b8b3310 J. Bruce Fields 2011-07-15  439   * would also need to ensure that opened-but-deleted files were kept over
674e405b8b3310 J. Bruce Fields 2011-07-15  440   * reboots.  However, we may not assume a server does so.  (RFC 5661
674e405b8b3310 J. Bruce Fields 2011-07-15  441   * does provide an OPEN4_RESULT_PRESERVE_UNLINKED flag that a server can
674e405b8b3310 J. Bruce Fields 2011-07-15  442   * use to advertise that it does this; some day we may take advantage of
674e405b8b3310 J. Bruce Fields 2011-07-15  443   * it.))
779c51795bfb35 Jeff Layton     2010-09-17  444   */
779c51795bfb35 Jeff Layton     2010-09-17  445  int
779c51795bfb35 Jeff Layton     2010-09-17  446  nfs_sillyrename(struct inode *dir, struct dentry *dentry)
779c51795bfb35 Jeff Layton     2010-09-17  447  {
779c51795bfb35 Jeff Layton     2010-09-17  448  	static unsigned int sillycounter;
c2dd1378fa3b52 Trond Myklebust 2013-08-21  449  	unsigned char silly[SILLYNAME_LEN + 1];
c2dd1378fa3b52 Trond Myklebust 2013-08-21  450  	unsigned long long fileid;
d05202b07b1942 NeilBrown       2026-10-23  451  	struct dentry *sdentry, *old;
3cb3fd6da4e9c8 Trond Myklebust 2018-04-09  452  	struct inode *inode = d_inode(dentry);
d3d4152a5d59af Jeff Layton     2010-09-17  453  	struct rpc_task *task;
4f5829d7263651 Geyslan G. Bem  2013-10-11  454  	int            error = -EBUSY;
779c51795bfb35 Jeff Layton     2010-09-17  455  
6de1472f1a4a3b Al Viro         2013-09-16  456  	dfprintk(VFS, "NFS: silly-rename(%pd2, ct=%d)\n",
6de1472f1a4a3b Al Viro         2013-09-16  457  		dentry, d_count(dentry));
779c51795bfb35 Jeff Layton     2010-09-17  458  	nfs_inc_stats(dir, NFSIOS_SILLYRENAME);
779c51795bfb35 Jeff Layton     2010-09-17  459  
779c51795bfb35 Jeff Layton     2010-09-17  460  	/*
779c51795bfb35 Jeff Layton     2010-09-17  461  	 * We don't allow a dentry to be silly-renamed twice.
779c51795bfb35 Jeff Layton     2010-09-17  462  	 */
779c51795bfb35 Jeff Layton     2010-09-17  463  	if (dentry->d_flags & DCACHE_NFSFS_RENAMED)
779c51795bfb35 Jeff Layton     2010-09-17  464  		goto out;
779c51795bfb35 Jeff Layton     2010-09-17  465  
2026c8a96afe6e Jeff Layton     2026-05-12  466  	fileid = d_inode(dentry)->i_ino;
779c51795bfb35 Jeff Layton     2010-09-17  467  
d05202b07b1942 NeilBrown       2026-10-23  468  newname:
779c51795bfb35 Jeff Layton     2010-09-17  469  	sillycounter++;
fa6fe07d153636 NeilBrown       2025-03-19  470  	scnprintf(silly, sizeof(silly),
c2dd1378fa3b52 Trond Myklebust 2013-08-21  471  		  SILLYNAME_PREFIX "%0*llx%0*x",
c2dd1378fa3b52 Trond Myklebust 2013-08-21  472  		  SILLYNAME_FILEID_LEN, fileid,
c2dd1378fa3b52 Trond Myklebust 2013-08-21  473  		  SILLYNAME_COUNTER_LEN, sillycounter);
779c51795bfb35 Jeff Layton     2010-09-17  474  
d05202b07b1942 NeilBrown       2026-10-23  475  	dfprintk(VFS, "NFS: trying to rename %pd to %s\n", dentry, silly);
d05202b07b1942 NeilBrown       2026-10-23 @476  	sdentry = d_alloc_trylock(dentry->d_parent, &QSTR(silly));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
