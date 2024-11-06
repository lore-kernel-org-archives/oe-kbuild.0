Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A91DFE13
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930878; cv=none; b=CQbgUr4sgeGpLMZZLdceMTEqKdk/ML1yJ0veVXMDJLqjKKAc+m40LvIEJpCSPxpDRsp6qKZDiIffuo9nliU9cUYUOhalLKzClD7XPKYWrTsIND4BTF+MannoJMd93z9QAkgWDkHKPOqC9vYmBL7Iw9nKQeezLPw49vwMpkJCoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930878; c=relaxed/simple;
	bh=9fexpo9Pak4eTxuVtlQLd6XqWbwo455FE4GCB36aUW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GA5yq6GZTVSQLRc+kGAOQ+ze4hCsla2sqPLEtNsBfAKQvpG+KdtM9a9/CA2zqAljMtZEj2aSjlk6Bu7sgCax+e6HmTORYgywfgiLw5vppR/izRmLWEN3Rr0OKTCAWhKQPxwAnrFUNd7rBaI/012EhYxIEV87nqSbQkLfEOiiQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJDWTRoQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJDWTRoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730930877; x=1762466877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9fexpo9Pak4eTxuVtlQLd6XqWbwo455FE4GCB36aUW4=;
  b=mJDWTRoQcXpaG+8Agi0i2aOiCOlYz1DOoGBsNKi9UWP1m9IgbDWHLc4u
   dCEU1OMrX+il39tmzPdvWbCR37BJh32dOkPlYbsTEcZmxyJ5OhobnHc41
   d1kvVYW1nj5GxsrfEfnusKyqAmTFJs5Sz4NGCFwsl/bENkyOzDbZ2Moi3
   IQ0EEIR0pOEbgBKKqg3waZMB5mcK29OOrXJ6o2utjrfjCYm5EzRdbgSh2
   MHP+VR5ygktwi0klAufH80edWhj9fBz8c145oq5QA9Mfoqj9muaL8K36b
   9pySLxaEeuXBHOQiCyoo8tVf0rALY7JgraMn4vbVifhP+dJ5kJWtk7g6a
   g==;
X-CSE-ConnectionGUID: GJQNfKFxQxaKfRrV2+43vA==
X-CSE-MsgGUID: ORDV08x9SR2cCEKuetvmRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30931522"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30931522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 14:07:56 -0800
X-CSE-ConnectionGUID: C88KnuJoTjyKi+oV1OhXTg==
X-CSE-MsgGUID: TMgTYAVkQsSuvKhzxYxauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="89319827"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 14:05:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8o9g-000pTS-0d;
	Wed, 06 Nov 2024 22:05:36 +0000
Date: Thu, 7 Nov 2024 06:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/9] vhost: Add the cgroup related function
Message-ID: <202411070509.uKGTT0Gq-lkp@intel.com>
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
In-Reply-To: <20241105072642.898710-4-lulu@redhat.com>
References: <20241105072642.898710-4-lulu@redhat.com>
TO: Cindy Lu <lulu@redhat.com>
TO: lulu@redhat.com
TO: jasowang@redhat.com
TO: mst@redhat.com
TO: michael.christie@oracle.com
TO: sgarzare@redhat.com
TO: linux-kernel@vger.kernel.org
TO: virtualization@lists.linux-foundation.org
TO: netdev@vger.kernel.org

Hi Cindy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20241105072642.898710-4-lulu%40redhat.com
patch subject: [PATCH v3 3/9] vhost: Add the cgroup related function
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070509.uKGTT0Gq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411070509.uKGTT0Gq-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:673 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:668 vhost_attach_cgroups() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/vhost/vhost.c:306 vhost_dev_flush() warn: iterator 'i' not incremented

vim +/ret +673 drivers/vhost/vhost.c

3d07ec0efe4c0d Cindy Lu 2024-11-05  656  
3d07ec0efe4c0d Cindy Lu 2024-11-05  657  static int vhost_attach_cgroups(struct vhost_dev *dev)
3d07ec0efe4c0d Cindy Lu 2024-11-05  658  {
3d07ec0efe4c0d Cindy Lu 2024-11-05  659  	struct vhost_worker *worker;
3d07ec0efe4c0d Cindy Lu 2024-11-05  660  	unsigned long i;
3d07ec0efe4c0d Cindy Lu 2024-11-05  661  	int ret;
3d07ec0efe4c0d Cindy Lu 2024-11-05  662  
3d07ec0efe4c0d Cindy Lu 2024-11-05  663  	/*
3d07ec0efe4c0d Cindy Lu 2024-11-05  664  	 * Free the default worker we created and cleanup workers userspace
3d07ec0efe4c0d Cindy Lu 2024-11-05  665  	 * created but couldn't clean up (it forgot or crashed).
3d07ec0efe4c0d Cindy Lu 2024-11-05  666  	 */
3d07ec0efe4c0d Cindy Lu 2024-11-05  667  
3d07ec0efe4c0d Cindy Lu 2024-11-05 @668  	xa_for_each(&dev->worker_xa, i, worker) {
3d07ec0efe4c0d Cindy Lu 2024-11-05  669  		ret = vhost_worker_cgroups_kthread(worker);
3d07ec0efe4c0d Cindy Lu 2024-11-05  670  		if (ret)
3d07ec0efe4c0d Cindy Lu 2024-11-05  671  			return ret;
3d07ec0efe4c0d Cindy Lu 2024-11-05  672  	}
3d07ec0efe4c0d Cindy Lu 2024-11-05 @673  	return ret;
3d07ec0efe4c0d Cindy Lu 2024-11-05  674  }
3d07ec0efe4c0d Cindy Lu 2024-11-05  675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
