Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09085ED8
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Mar 2024 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711650083; cv=none; b=BByPnDfR0T+FduLAmaX3/6wM2iwzsl5hYQrrsnCje64bLxjnEAHn+RTBmXkSHDPbmmc8C+/6S0Dbs02OU3Z7HNBNZfssgVjBuVhko1C6PCS+5UQjVcnjuRK5B3R8H/VCaiLvO6qS5Rf53i4UlXWLMaTklEUKl5HRsPRe5dAoWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711650083; c=relaxed/simple;
	bh=elo1PLdUO/cHF3xPOTA3GGJ0gBfuxf7Ke+fSkMIXIjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WO7P/pv4gv6sOPgV5asqIngjPg8lopdOp+/cTxIZn8RBvXB9MYmZK+XVCeXUsDxdjPoMSJ/7V1HgOFFkN2TVDvzd0h3pWYvarxwu8k4xC2XApzbRGJn4RduFRDJZX9/muOBr2pUtqRvMyOJT3WTzlSu5LD8x4TwOTAOShTgp3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tz063Yvg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tz063Yvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711650081; x=1743186081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elo1PLdUO/cHF3xPOTA3GGJ0gBfuxf7Ke+fSkMIXIjA=;
  b=Tz063Yvg6xFLgWqJiR1paDBuxG/VDu9biJZgb7puMgsHZ6bGn9KQg4Qw
   p5OLpDGzLhFnmcOCCAsQPxqSyVbyU+FzQjVtI8viF+rzWC1pFHk3dnJiG
   ozdFgJaSd8iW6mxNfq6PXm7y86vI0v3J1xDFVT822DcDTASiu938F8Y5Q
   xIkMhR+k1rtOaqaNC+cvftQNARS5cf+aay5ugqZlmd2tidKVTZunBmXv9
   07qUoaxgZwUy5AIRNG8zJtf/NiK+E0tOkXg/QrvpHNfA63I21QEa30n7p
   +pz3pnJatNIu7JqtD3CtyUVXnCcrUba8Ju6ZgW84NC1MWB2zcWRZvUqo3
   g==;
X-CSE-ConnectionGUID: y4icV+qtQ76kiLNtw8BdZg==
X-CSE-MsgGUID: 0CKERB0qTfyymEcgN+Of6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7426352"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7426352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 11:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17179140"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2024 11:21:19 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpuNI-0002QG-1N;
	Thu, 28 Mar 2024 18:21:16 +0000
Date: Fri, 29 Mar 2024 02:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 23/26] fs/netfs/write_issue.c:567
 netfs_begin_writethrough() error: 'wreq' dereferencing possible ERR_PTR()
Message-ID: <202403290209.izqDvT86-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   56d9c02d8386e1fbfc521da523af44cf48dd97f7
commit: 4426913c4e18c06cfcdb92418a89a936d72dfc09 [23/26] netfs: Cut over to using new writeback code
:::::: branch date: 3 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-r081-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290209.izqDvT86-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403290209.izqDvT86-lkp@intel.com/

smatch warnings:
fs/netfs/write_issue.c:567 netfs_begin_writethrough() error: 'wreq' dereferencing possible ERR_PTR()

vim +/wreq +567 fs/netfs/write_issue.c

c272eda1e8b823 David Howells 2024-03-18  551  
c272eda1e8b823 David Howells 2024-03-18  552  /*
c272eda1e8b823 David Howells 2024-03-18  553   * Begin a write operation for writing through the pagecache.
c272eda1e8b823 David Howells 2024-03-18  554   */
4426913c4e18c0 David Howells 2024-03-08  555  struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len)
c272eda1e8b823 David Howells 2024-03-18  556  {
c272eda1e8b823 David Howells 2024-03-18  557  	struct netfs_io_request *wreq = NULL;
c272eda1e8b823 David Howells 2024-03-18  558  	struct netfs_inode *ictx = netfs_inode(file_inode(iocb->ki_filp));
c272eda1e8b823 David Howells 2024-03-18  559  
c272eda1e8b823 David Howells 2024-03-18  560  	mutex_lock(&ictx->wb_lock);
c272eda1e8b823 David Howells 2024-03-18  561  
c272eda1e8b823 David Howells 2024-03-18  562  	wreq = netfs_create_write_req(iocb->ki_filp->f_mapping, iocb->ki_filp,
c272eda1e8b823 David Howells 2024-03-18  563  				      iocb->ki_pos, NETFS_WRITETHROUGH);
c272eda1e8b823 David Howells 2024-03-18  564  	if (IS_ERR(wreq))
c272eda1e8b823 David Howells 2024-03-18  565  		mutex_unlock(&ictx->wb_lock);
c272eda1e8b823 David Howells 2024-03-18  566  
c272eda1e8b823 David Howells 2024-03-18 @567  	wreq->io_streams[0].avail = true;
c272eda1e8b823 David Howells 2024-03-18  568  	trace_netfs_write(wreq, netfs_write_trace_writethrough);
c272eda1e8b823 David Howells 2024-03-18  569  	return wreq;
c272eda1e8b823 David Howells 2024-03-18  570  }
c272eda1e8b823 David Howells 2024-03-18  571  

:::::: The code at line 567 was first introduced by commit
:::::: c272eda1e8b823ac921a227ddcd7495d57a8226e netfs: New writeback implementation

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
