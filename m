Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870784;
	b=wNpVm3SsoGHq5ulG1LyEFrr+y7Ke+cgWq3Df3uIMV+g+rqA/9InIDKK7wA7+ShiuiElQ
	 7HOjKrFmewM6fAPm8cf2aycGgfC1m5F2E+zxM9sJC4tuV9hq203Dq9l7dXn8KTUgztOiq
	 1vvfyq6XirT64eY+fyZKvA6xrKYSySrhmw9OHQrAxY4WBxzVm0mqrFz4T0+HXtLScBM3C
	 /Hx/u610dxhCHga87HCai59ulN2hJEGvOU80RavH7zVj8Jl84P0kUwZ+4g3hvoj35cU6+
	 LEJEZ+iDHbN6O9MP9ZAJNm1o1I1Qw4549ezcWNHi80r7rU5k2eHxf01VzxmLh7LVRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870784;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OmxfC6NFyGcrQll/1GTFdRTPJJCRPRAwBm0tV5wI7TE=;
	b=s4Woj81m/B2MJSBgriho05sjLkFpqQnokuvCGjRiI4KLRrQrlQMjlLDcVCOBO9Sx0iY6
	 O0rneVZM1P1Jb/XY+OONdzH2Ylt5qKRpWtgPN7wVO/mddMukjWUfbK1HCWFF4kWErJxjo
	 GfmQFqNU8xbYpASxtntx/CAr09u89N1pIVQXPzi5ow0VqOXDGEv1R5we4sSLLLDIS8MoT
	 qeVme7WvL2GFPqwMSJnkpSM+4v2RL2QIi43bRSgFnS7AEZHyYv4F6n4vjijE7du7NIrm7
	 ENfNyiMQEUIttgcA6FokpYsLGxZAAKtj9j6bHkUBiFpqrA3RCJVuX0BrzJQhh1qSG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKbxTLyi;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCDE606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 19:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKbxTLyi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792870782; x=1824406782;
  h=date:from:to:cc:subject:message-id;
  bh=1ukVA1EIA1U4rdkohVwjDL6wcxBjnmfxbliM9wuk7tY=;
  b=oKbxTLyiDDq8VnURRUjdebLny+eqhSJw7HyAZ5AHGLDH6OTD9FNF6QJm
   GXK4mWIGESJnRrXwNJ/wDGA3k9Az9D9qwRuuNti7PdUEvv9vzarlOFdYa
   sK8/Muq2qUR1TSct2qw8YZYlQ+llBino/OYP4kgtkCQ/wVO6RgCkQxlAN
   NdvhePVDVz5/6erlpqWmWDWs4Z41tmV+Qallibj4XQBVOuiZqO1aiJH2+
   twvNdlOY7Q1vao1C5sLnMxgeIDiA2dNaq9SiXJA9ZuhDWOQ6S3ICjyiEV
   vV5Tytd7jaQnDDKE9z4zK9UEW53IzZ3xrylm3nwubKbLnHWfGGDSv+uFz
   Q==;
X-CSE-ConnectionGUID: gxS2MNDkTXCnQwBDLTem3Q==
X-CSE-MsgGUID: c8zUsSoZSM+Nf0D3UvSxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1477914"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1477914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 12:39:41 -0700
X-CSE-ConnectionGUID: S8tOhjVpTwSW++yX5LJFqA==
X-CSE-MsgGUID: NRCblK5qQRaFkO8auSt0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4260925"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2026 12:39:41 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKhab-00000000UBk-3AUk;
	Sat, 24 Oct 2026 19:39:37 +0000
Date: Sun, 25 Oct 2026 03:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/nfs/dir.c:754:18: error: implicit declaration of function
 'd_alloc_trylock'; did you mean 'folio_trylock'?
Message-ID: <202610250334.kJaJSkIT-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20261023-132215/NeilBrown/nfs-fix-open-blocking-with-d_fsdata/20261023-125011, commit: 35a484f473611abf930868ed5f6c1d55bc741880"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: NeilBrown <neil@brown.name>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20261023-132215/NeilBrown/nfs-fix-open-blocking-with-d_fsdata/20261023-125011
head:   e3a7aa9117daa6410fe3ee62c36e5397e61a664d
commit: 35a484f473611abf930868ed5f6c1d55bc741880 nfs: Use d_alloc_trylock() in nfs_prime_dcache()
date:   24 hours ago
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261025/202610250334.kJaJSkIT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250334.kJaJSkIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610250334.kJaJSkIT-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/dir.c: In function 'nfs_prime_dcache':
>> fs/nfs/dir.c:754:18: error: implicit declaration of function 'd_alloc_trylock'; did you mean 'folio_trylock'? [-Wimplicit-function-declaration]
     754 |         dentry = d_alloc_trylock(parent, &filename);
         |                  ^~~~~~~~~~~~~~~
         |                  folio_trylock
>> fs/nfs/dir.c:754:16: error: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     754 |         dentry = d_alloc_trylock(parent, &filename);
         |                ^


vim +754 fs/nfs/dir.c

230bc98f7a2a49e Trond Myklebust   2022-02-17  723  
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  724  static
a1147b8281bda99 Trond Myklebust   2020-02-05  725  void nfs_prime_dcache(struct dentry *parent, struct nfs_entry *entry,
a1147b8281bda99 Trond Myklebust   2020-02-05  726  		unsigned long dir_verifier)
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  727  {
26fe57502870394 Linus Torvalds    2012-05-10  728  	struct qstr filename = QSTR_INIT(entry->name, entry->len);
4a201d6e3f4253f Trond Myklebust   2010-10-23  729  	struct dentry *dentry;
4a201d6e3f4253f Trond Myklebust   2010-10-23  730  	struct dentry *alias;
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  731  	struct inode *inode;
aa9c2669626ca7e David Quigley     2013-05-22  732  	int status;
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  733  
fa9233699cc1dc2 Trond Myklebust   2015-02-23  734  	if (!(entry->fattr->valid & NFS_ATTR_FATTR_FILEID))
fa9233699cc1dc2 Trond Myklebust   2015-02-23  735  		return;
6c441c254eea235 Trond Myklebust   2015-02-22  736  	if (!(entry->fattr->valid & NFS_ATTR_FATTR_FSID))
6c441c254eea235 Trond Myklebust   2015-02-22  737  		return;
78d04af4995a135 Trond Myklebust   2016-09-20  738  	if (filename.len == 0)
78d04af4995a135 Trond Myklebust   2016-09-20  739  		return;
78d04af4995a135 Trond Myklebust   2016-09-20  740  	/* Validate that the name doesn't contain any illegal '\0' */
78d04af4995a135 Trond Myklebust   2016-09-20  741  	if (strnlen(filename.name, filename.len) != filename.len)
78d04af4995a135 Trond Myklebust   2016-09-20  742  		return;
78d04af4995a135 Trond Myklebust   2016-09-20  743  	/* ...or '/' */
78d04af4995a135 Trond Myklebust   2016-09-20  744  	if (strnchr(filename.name, filename.len, '/'))
78d04af4995a135 Trond Myklebust   2016-09-20  745  		return;
4a201d6e3f4253f Trond Myklebust   2010-10-23  746  	if (filename.name[0] == '.') {
4a201d6e3f4253f Trond Myklebust   2010-10-23  747  		if (filename.len == 1)
4a201d6e3f4253f Trond Myklebust   2010-10-23  748  			return;
4a201d6e3f4253f Trond Myklebust   2010-10-23  749  		if (filename.len == 2 && filename.name[1] == '.')
4a201d6e3f4253f Trond Myklebust   2010-10-23  750  			return;
4a201d6e3f4253f Trond Myklebust   2010-10-23  751  	}
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  752  
9ac3d3e8460e3fa Al Viro           2016-04-28  753  again:
35a484f473611ab NeilBrown         2026-10-23 @754  	dentry = d_alloc_trylock(parent, &filename);
9ac3d3e8460e3fa Al Viro           2016-04-28  755  	if (IS_ERR(dentry))
9ac3d3e8460e3fa Al Viro           2016-04-28  756  		return;
35a484f473611ab NeilBrown         2026-10-23  757  
9ac3d3e8460e3fa Al Viro           2016-04-28  758  	if (!d_in_lookup(dentry)) {
6c441c254eea235 Trond Myklebust   2015-02-22  759  		/* Is there a mountpoint here? If so, just exit */
6c441c254eea235 Trond Myklebust   2015-02-22  760  		if (!nfs_fsid_equal(&NFS_SB(dentry->d_sb)->fsid,
6c441c254eea235 Trond Myklebust   2015-02-22  761  					&entry->fattr->fsid))
6c441c254eea235 Trond Myklebust   2015-02-22  762  			goto out;
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  763  		if (nfs_same_file(dentry, entry)) {
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  764  			if (!entry->fh->size)
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  765  				goto out;
a1147b8281bda99 Trond Myklebust   2020-02-05  766  			nfs_set_verifier(dentry, dir_verifier);
2b0143b5c986be1 David Howells     2015-03-17  767  			status = nfs_refresh_inode(d_inode(dentry), entry->fattr);
aa9c2669626ca7e David Quigley     2013-05-22  768  			if (!status)
dd225cb3b02b827 Anna Schumaker    2021-10-22  769  				nfs_setsecurity(d_inode(dentry), entry->fattr);
eace45a18ccb34a Trond Myklebust   2022-02-19  770  			trace_nfs_readdir_lookup_revalidate(d_inode(parent),
eace45a18ccb34a Trond Myklebust   2022-02-19  771  							    dentry, 0, status);
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  772  			goto out;
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  773  		} else {
eace45a18ccb34a Trond Myklebust   2022-02-19  774  			trace_nfs_readdir_lookup_revalidate_failed(
eace45a18ccb34a Trond Myklebust   2022-02-19  775  				d_inode(parent), dentry, 0);
5542aa2fa7f6cdd Eric W. Biederman 2014-02-13  776  			d_invalidate(dentry);
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  777  			dput(dentry);
9ac3d3e8460e3fa Al Viro           2016-04-28  778  			dentry = NULL;
9ac3d3e8460e3fa Al Viro           2016-04-28  779  			goto again;
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  780  		}
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  781  	}
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  782  	if (!entry->fh->size) {
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  783  		d_lookup_done(dentry);
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  784  		goto out;
7dc72d5f7a0ec97 Trond Myklebust   2016-09-22  785  	}
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  786  
9bd545539b23372 Trond Myklebust   2025-11-19  787  	nfs_set_verifier(dentry, dir_verifier);
cf7ab00aabbf9c8 Anna Schumaker    2021-10-22  788  	inode = nfs_fhget(dentry->d_sb, entry->fh, entry->fattr);
41d28bca2da4bd7 Al Viro           2014-10-12  789  	alias = d_splice_alias(inode, dentry);
9ac3d3e8460e3fa Al Viro           2016-04-28  790  	d_lookup_done(dentry);
9ac3d3e8460e3fa Al Viro           2016-04-28  791  	if (alias) {
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  792  		if (IS_ERR(alias))
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  793  			goto out;
9bd545539b23372 Trond Myklebust   2025-11-19  794  		nfs_set_verifier(alias, dir_verifier);
9ac3d3e8460e3fa Al Viro           2016-04-28  795  		dput(dentry);
9ac3d3e8460e3fa Al Viro           2016-04-28  796  		dentry = alias;
9ac3d3e8460e3fa Al Viro           2016-04-28  797  	}
eace45a18ccb34a Trond Myklebust   2022-02-19  798  	trace_nfs_readdir_lookup(d_inode(parent), dentry, 0);
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  799  out:
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  800  	dput(dentry);
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  801  }
d39ab9de3b80da5 Bryan Schumaker   2010-09-24  802  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
