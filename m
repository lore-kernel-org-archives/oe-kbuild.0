Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104471A4F2F
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839530; cv=none; b=k9U2OZZ3ZMh6LwikXv9ILU5p3lmxbes8tQ5/6PvbaOXrKykuF4a2oqdEPWpTkizlh83y4JUbzPR3ruhRLWKOS+NINSlWoLupVG8XA8qb/fjCmXMx7vUC69fjIHlJVRiHgFVJ4hdhXvsw6S9P3Wq+LfqkpQCJkxYN72iKADLtVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839530; c=relaxed/simple;
	bh=tepivbPJzhPlHEmZvojDQ5upY2eoVl8NnmLEoiArLC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgGphcTvHpg4o4hbohpsgJNsoOyM10A8XP/mDI+9QyuWNlSvsKmhV7keCb8BrI6V0Wo9ntA4kGUnPxaYwblnv3jtI6kHgytzh66V4KYSWu1IU0kb0Vv1Y1wbuQKmBUjm0C+u6FnlOqJmzVEJOlhofp8pM1RDWV2HBiBC7EcAzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIP8bKKy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIP8bKKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729839528; x=1761375528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tepivbPJzhPlHEmZvojDQ5upY2eoVl8NnmLEoiArLC0=;
  b=KIP8bKKy7+9xS6M3WwvePMtqEd2XNwVxD02+rDRsE8GH6IPQW248aBTP
   IIjZhQlaEVSJfT13YIR0GCj8Aa9oK+uuPcsFMnOjgKyFYEm2ij45Zj+Qa
   kR5QUpBqey+ro0TQQb5LCwLY7tEnXG2Jpnzm7MRqcUCQ6wFJux3v1FwbC
   TEM8saDgZ7m0TaEHL4PFQI0HOSifomDVImIoIosjOwLq4+l+H3wsqLcKh
   tlzKxNK9soMQGa4lvKn515i+EwfZ1+y9NrJvUhBYxZdSOIOWlbERo8O0e
   9S5qEb8pBZKJcA4IDk4e7VKJCydMYF6j/HhV9gNst7Rxy4+/v8ONo8+Gr
   A==;
X-CSE-ConnectionGUID: eOAxexWaRnaiOavA+6cV5A==
X-CSE-MsgGUID: LdjRNDp4QPajTqPw83CipA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40896362"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40896362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:58:47 -0700
X-CSE-ConnectionGUID: fohGj+hkTk+RMmZwVmPm0A==
X-CSE-MsgGUID: 3XWKtl2ZQluw6z0TMxOnrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85414966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2024 23:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4EHU-000XkK-0I;
	Fri, 25 Oct 2024 06:58:44 +0000
Date: Fri, 25 Oct 2024 14:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 25/30] fs/afs/inode.c:51 afs_get_link()
 error: we previously assumed 'vnode->directory' could be null (see line 45)
Message-ID: <202410251424.vvxKgzBC-lkp@intel.com>
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
head:   d206dc1726472ebe2d929cc1ee51e4c272707977
commit: 525269c389deeb648c24b505ee2b067a40936167 [25/30] afs: Use netfslib for symlinks, allowing them to be cached
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251424.vvxKgzBC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251424.vvxKgzBC-lkp@intel.com/

smatch warnings:
fs/afs/inode.c:51 afs_get_link() error: we previously assumed 'vnode->directory' could be null (see line 45)

vim +51 fs/afs/inode.c

525269c389deeb David Howells 2024-07-26  35  
525269c389deeb David Howells 2024-07-26  36  const char *afs_get_link(struct dentry *dentry, struct inode *inode,
525269c389deeb David Howells 2024-07-26  37  			 struct delayed_call *callback)
525269c389deeb David Howells 2024-07-26  38  {
525269c389deeb David Howells 2024-07-26  39  	struct afs_vnode *vnode = AFS_FS_I(inode);
525269c389deeb David Howells 2024-07-26  40  	struct folio *folio;
525269c389deeb David Howells 2024-07-26  41  	char *content;
525269c389deeb David Howells 2024-07-26  42  	ssize_t ret;
525269c389deeb David Howells 2024-07-26  43  
525269c389deeb David Howells 2024-07-26  44  	if (atomic64_read(&vnode->cb_expires_at) == AFS_NO_CB_PROMISE ||
525269c389deeb David Howells 2024-07-26 @45  	    !vnode->directory) {
525269c389deeb David Howells 2024-07-26  46  		ret = afs_read_single(vnode, NULL);
525269c389deeb David Howells 2024-07-26  47  		if (ret < 0)
525269c389deeb David Howells 2024-07-26  48  			return ERR_PTR(ret);
525269c389deeb David Howells 2024-07-26  49  	}
525269c389deeb David Howells 2024-07-26  50  
525269c389deeb David Howells 2024-07-26 @51  	folio = folioq_folio(vnode->directory, 0);
525269c389deeb David Howells 2024-07-26  52  	folio_get(folio);
525269c389deeb David Howells 2024-07-26  53  	content = kmap_local_folio(folio, 0);
525269c389deeb David Howells 2024-07-26  54  	set_delayed_call(callback, afs_put_link, content);
525269c389deeb David Howells 2024-07-26  55  	return content;
525269c389deeb David Howells 2024-07-26  56  }
525269c389deeb David Howells 2024-07-26  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
