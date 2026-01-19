Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9702773C3
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850111; cv=none; b=eDMIU5V7Ct1rCsnT3XEJLhcWAAKZJW6mL5PblmSzUHuClJCxCXBUVq2l2rcsNCZJrl0cSZsFAAqn+Khr0NI82lwO2E5RouFqZWI9LYObtE/IIEUdSgyr3XiqSC4H4WYjqMqu1Nx5hmpE6oEcHoQpsQslt+HddX4FvkUejyfaE34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850111; c=relaxed/simple;
	bh=636xAm3KSlP1gWGe0wHC81KP6kR7IGXrgjiKU6bsu14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iDugoBrcelC5ioRsXnL9LoHZnLOL9raMso8ysapQh4+V3TfKVzZxmqD+urwErpQwdMMGoXEn70vuuQS/bO5N31gNJvvruamaZqzXm/vRe9ZrYy7vQLdPTaIZomBagwhnq50o/9sME27AeVJ5SF9rety2Q01LZ2PwRZyKFHjwy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUnp6dyZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUnp6dyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768850111; x=1800386111;
  h=date:from:to:cc:subject:message-id;
  bh=636xAm3KSlP1gWGe0wHC81KP6kR7IGXrgjiKU6bsu14=;
  b=UUnp6dyZvyDvHLoYHk8LSgIZyLMSxtsDqfIECuuxugv/RguehN5twoU+
   dIavwcodjL9sJ/hdKwq5nmy5KJe9HUmL856DPRFuo4W5jH3a/ZJ0NKKLE
   SN6ZnLnotx3IIULNbXg1Q4VqKiLM+kJtgMpO50beIpCrnrl77z9PVtQ5m
   noGl99433mC+Wpfqbimo9jMYVYSliG2LHMa1NK7RkuzsjV+EbYbbuLCc9
   Ir2HLau2VsG3uiikvzWmUAvtANu5ExZld8/YN3WWFOtDmjNCxvSeRWzar
   STTW/lOwWkQMQZDmIFh5/ZIS+NX1z+LxIhX538rxq/AnbSrUwlP1kCl1J
   g==;
X-CSE-ConnectionGUID: 8cBIBcBtST2wJTXLX7c/XA==
X-CSE-MsgGUID: le+sMg29T7eCDazhgdfn3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70036915"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70036915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:15:10 -0800
X-CSE-ConnectionGUID: QOb/iukNQZyIzlFKG0nthQ==
X-CSE-MsgGUID: jNsxbdunT0iOwv7f3zFZ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237202419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 11:15:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuiQ-00000000OCw-3Dm8;
	Mon, 19 Jan 2026 19:15:06 +0000
Date: Tue, 20 Jan 2026 03:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/file.c:972 cifs_file_flush() error: we
 previously assumed 'cfile' could be null (see line 965)
Message-ID: <202601200301.wk0rUAMX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paulo Alcantara <pc@manguebit.org>
CC: Steve French <stfrench@microsoft.com>
CC: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 110fee6b9bb58a5c50047fc2594d415f741b591e smb: client: fix missing timestamp updates with O_TRUNC
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200301.wk0rUAMX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200301.wk0rUAMX-lkp@intel.com/

smatch warnings:
fs/smb/client/file.c:972 cifs_file_flush() error: we previously assumed 'cfile' could be null (see line 965)

vim +/cfile +972 fs/smb/client/file.c

b33879aa834ebe0 fs/cifs/file.c       Jeff Layton     2010-10-15  954  
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  955  int cifs_file_flush(const unsigned int xid, struct inode *inode,
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  956  		    struct cifsFileInfo *cfile)
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  957  {
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  958  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  959  	struct cifs_tcon *tcon;
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  960  	int rc;
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  961  
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  962  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOSSYNC)
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  963  		return 0;
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  964  
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07 @965  	if (cfile && (OPEN_FMODE(cfile->f_flags) & FMODE_WRITE)) {
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  966  		tcon = tlink_tcon(cfile->tlink);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  967  		return tcon->ses->server->ops->flush(xid, tcon,
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  968  						     &cfile->fid);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  969  	}
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  970  	rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  971  	if (!rc) {
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07 @972  		tcon = tlink_tcon(cfile->tlink);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  973  		rc = tcon->ses->server->ops->flush(xid, tcon, &cfile->fid);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  974  		cifsFileInfo_put(cfile);
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  975  	} else if (rc == -EBADF) {
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  976  		rc = 0;
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  977  	}
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  978  	return rc;
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  979  }
110fee6b9bb58a5 fs/smb/client/file.c Paulo Alcantara 2025-10-07  980  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
