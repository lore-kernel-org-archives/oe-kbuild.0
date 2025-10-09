Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3C12CDA5
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026562; cv=none; b=qcIOKe92FrceTXNu4BcCtENkB4U3B1qRAGHJK2zvuN6bBNFXgCUsBqiykR3QfJUddM9UCFXV/c+2V3xTnnEW4ybrP3F2pesmdVRGnmQzCRYZQp7sQo9mTAJEAl/c0cKf2kGRmSJWZzNGyHPjI7CqMhkO0iVm51IPEScacnAgG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026562; c=relaxed/simple;
	bh=Zmv8Bxde1QQ0esPIyBGmiR7t8O6d911lcK8y+JH+pOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0LYtFkJDUJnH8y9cvO49MLzoICdowqvfts4ov2OfiOxQgOo/aD7pWE4uNOohHptdzDo1bB06lYUNHeOmDUsEfG/TI+4YH4Y78ny03awwx04+JlVbLIus7s2zYwlOrqiR0XieOZCJxD17cIF+u+4JrifR6PXVpLRJCA6ZYmD5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9gBl+g2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9gBl+g2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760026559; x=1791562559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zmv8Bxde1QQ0esPIyBGmiR7t8O6d911lcK8y+JH+pOk=;
  b=L9gBl+g2Ms+FeMQlmbxaZMO23IRrx4iqmI8dDnOHWsOiweeyQmn+F4HN
   FRcYd1uqnL7leA4bLZ7n1xuq3loXXj+sQQWFyqYBn/T+EsUiqGgVvuHAx
   kEoYyRpwhLKQ9iwoZWsRD2IuPY+wvSVMGwpFAHaxDxh0cwD411QWldGMc
   RrFkrcK3Z6PCLLc4lqQ2NAk/m7KNqIJdR3LoUMt34+ra3uMIiy2Aiu81/
   v3s9Wh/ASM0/Ge/ZzLSKsb3oaShYXip1rhjpT4mYIH13DpYk7Ib8G+4eS
   PLqqkGJ0n7jeGqYaYNPxmrwQsF6PLNvpa3QSPasY6l4QpJtlLksRKY0mp
   g==;
X-CSE-ConnectionGUID: xboCSKOfQMWdlDtCdIaWPQ==
X-CSE-MsgGUID: M7ylYC4zQsigYpXX/g4lnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72852875"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="72852875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:15:56 -0700
X-CSE-ConnectionGUID: irViXhPYTjuWxTkIFKKRMQ==
X-CSE-MsgGUID: KEBCVBMLRsilRu3B2AAFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="179990069"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 09:15:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tJ2-0000zG-29;
	Thu, 09 Oct 2025 16:15:52 +0000
Date: Fri, 10 Oct 2025 00:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [smfrench-smb3:pr/89 9/14] fs/smb/client/file.c:972
 cifs_file_flush() error: we previously assumed 'cfile' could be null (see
 line 965)
Message-ID: <202510100036.hj5QUGGl-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://github.com/smfrench/smb3-kernel.git pr/89
head:   d9408f7566553a2822031435e42da47444bd3fde
commit: 9a5cc9a592ad8968275e9e876d4feecc8665420a [9/14] smb: client: fix missing timestamp updates with O_TRUNC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100036.hj5QUGGl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510100036.hj5QUGGl-lkp@intel.com/

smatch warnings:
fs/smb/client/file.c:972 cifs_file_flush() error: we previously assumed 'cfile' could be null (see line 965)

vim +/cfile +972 fs/smb/client/file.c

b33879aa834ebe fs/cifs/file.c       Jeff Layton     2010-10-15  954  
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  955  int cifs_file_flush(const unsigned int xid, struct inode *inode,
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  956  		    struct cifsFileInfo *cfile)
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  957  {
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  958  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  959  	struct cifs_tcon *tcon;
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  960  	int rc;
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  961  
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  962  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOSSYNC)
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  963  		return 0;
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  964  
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07 @965  	if (cfile && (OPEN_FMODE(cfile->f_flags) & FMODE_WRITE)) {
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  966  		tcon = tlink_tcon(cfile->tlink);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  967  		return tcon->ses->server->ops->flush(xid, tcon,
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  968  						     &cfile->fid);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  969  	}
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  970  	rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  971  	if (!rc) {
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07 @972  		tcon = tlink_tcon(cfile->tlink);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  973  		rc = tcon->ses->server->ops->flush(xid, tcon, &cfile->fid);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  974  		cifsFileInfo_put(cfile);
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  975  	} else if (rc == -EBADF) {
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  976  		rc = 0;
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  977  	}
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  978  	return rc;
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  979  }
9a5cc9a592ad89 fs/smb/client/file.c Paulo Alcantara 2025-10-07  980  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
