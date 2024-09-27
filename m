Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C6D13A88D
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727401254; cv=none; b=qVhmI0ySswuy4JLct1W4OaO+y7acq+HlGEBqbf6EEtFjjOHeD4EFOaTtXGm12L6T5h2VisZgFFvr1TYinroJHCYfF34wyjd1Sf/MJOM15GKho8R+/g5/lWintGe+HR2q+SvJMrAIvbMuiQeazhkKBMcIAUPj5/+l+/5HXiu1JTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727401254; c=relaxed/simple;
	bh=+V0JSSW2MWkVMzHScDpczNIEP3KzJme6n+ShiTG7dVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2qtnM20K6arc/aPXB2kjiGKYkWz/S1y3djsxFHcHzPAGDT22UyGkSmehvUaSgWA0iUBNCzYJF4///jkgNGMRwwf3RBOqKgbs3phUA/p/STY+fSp3hEh6XApz90fMHS3Bwg40OcrBzqeGPeeNLfISw/9PzyeatuV2NY3wCykrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAYqadlh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAYqadlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727401253; x=1758937253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+V0JSSW2MWkVMzHScDpczNIEP3KzJme6n+ShiTG7dVk=;
  b=lAYqadlh/P1nkXHkBUShWDZAz81ApnUuQAzALAXdZvAuki7LAVWVx8xc
   PKPsNvUz2ZG7VIKgNZiZQhqH0Y4k80HDtBW/KjfgRfkiEf+aDZ16XF1yB
   A0oEOMn8Z9Mgwvfr1oxjsdiILMxBBtl6Ay0Gk3nj15WkJrz3RDt0R+zoc
   btdBV0Lm12m7I2tGeLEYHgDBDnjIg70iL8QQ0NulrC+FyXDFrJTNMPJDz
   jPAtCP+ObGon9+B6Qq1TWW2wG9uyXX4Up5eDeAPy57XyTK/wL6O5mVuPb
   waqIprRS4+7+nj/rETBgabLb8vj2mNDH8zTNuaqHU4Jx7pMnIqUw6/IhS
   A==;
X-CSE-ConnectionGUID: Vj2qOyqUQb27wsBvoRxb4g==
X-CSE-MsgGUID: tmaWIbAWQYO5SEJLToTUng==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37203930"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37203930"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 18:40:52 -0700
X-CSE-ConnectionGUID: 8EgfOlXmRmah+EUb2qxy5w==
X-CSE-MsgGUID: oCy08zucR/mWX+kwvz8YXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103175087"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 18:40:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzyS-000LMZ-1v;
	Fri, 27 Sep 2024 01:40:48 +0000
Date: Fri, 27 Sep 2024 09:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH for-next] RDMA/core: fix ENODEV error for iwarp test over
 vlan
Message-ID: <202409270901.6bDFVhkz-lkp@intel.com>
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
In-Reply-To: <20240926060708.82018-1-anumula@chelsio.com>
References: <20240926060708.82018-1-anumula@chelsio.com>
TO: Anumula Murali Mohan Reddy <anumula@chelsio.com>
TO: jgg@nvidia.com
TO: leonro@nvidia.com
CC: linux-rdma@vger.kernel.org
CC: Anumula Murali Mohan Reddy <anumula@chelsio.com>
CC: Potnuri Bharat Teja <bharat@chelsio.com>

Hi Anumula,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anumula-Murali-Mohan-Reddy/RDMA-core-fix-ENODEV-error-for-iwarp-test-over-vlan/20240926-140515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20240926060708.82018-1-anumula%40chelsio.com
patch subject: [PATCH for-next] RDMA/core: fix ENODEV error for iwarp test over vlan
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270901.6bDFVhkz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409270901.6bDFVhkz-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/addr.c:272 rdma_find_ndev_for_src_ip_rcu() error: we previously assumed 'dev' could be null (see line 256)

vim +/dev +272 drivers/infiniband/core/addr.c

7025fcd36bd62a Sean Hefty                 2006-06-17  244  
caf1e3ae9fa648 Parav Pandit               2018-09-05  245  static struct net_device *
caf1e3ae9fa648 Parav Pandit               2018-09-05  246  rdma_find_ndev_for_src_ip_rcu(struct net *net, const struct sockaddr *src_in)
caf1e3ae9fa648 Parav Pandit               2018-09-05  247  {
caf1e3ae9fa648 Parav Pandit               2018-09-05  248  	struct net_device *dev = NULL;
caf1e3ae9fa648 Parav Pandit               2018-09-05  249  	int ret = -EADDRNOTAVAIL;
caf1e3ae9fa648 Parav Pandit               2018-09-05  250  
caf1e3ae9fa648 Parav Pandit               2018-09-05  251  	switch (src_in->sa_family) {
caf1e3ae9fa648 Parav Pandit               2018-09-05  252  	case AF_INET:
caf1e3ae9fa648 Parav Pandit               2018-09-05  253  		dev = __ip_dev_find(net,
caf1e3ae9fa648 Parav Pandit               2018-09-05  254  				    ((const struct sockaddr_in *)src_in)->sin_addr.s_addr,
caf1e3ae9fa648 Parav Pandit               2018-09-05  255  				    false);
caf1e3ae9fa648 Parav Pandit               2018-09-05 @256  		if (dev)
caf1e3ae9fa648 Parav Pandit               2018-09-05  257  			ret = 0;
caf1e3ae9fa648 Parav Pandit               2018-09-05  258  		break;
caf1e3ae9fa648 Parav Pandit               2018-09-05  259  #if IS_ENABLED(CONFIG_IPV6)
caf1e3ae9fa648 Parav Pandit               2018-09-05  260  	case AF_INET6:
caf1e3ae9fa648 Parav Pandit               2018-09-05  261  		for_each_netdev_rcu(net, dev) {
caf1e3ae9fa648 Parav Pandit               2018-09-05  262  			if (ipv6_chk_addr(net,
caf1e3ae9fa648 Parav Pandit               2018-09-05  263  					  &((const struct sockaddr_in6 *)src_in)->sin6_addr,
caf1e3ae9fa648 Parav Pandit               2018-09-05  264  					  dev, 1)) {
caf1e3ae9fa648 Parav Pandit               2018-09-05  265  				ret = 0;
caf1e3ae9fa648 Parav Pandit               2018-09-05  266  				break;
caf1e3ae9fa648 Parav Pandit               2018-09-05  267  			}
caf1e3ae9fa648 Parav Pandit               2018-09-05  268  		}
caf1e3ae9fa648 Parav Pandit               2018-09-05  269  		break;
caf1e3ae9fa648 Parav Pandit               2018-09-05  270  #endif
caf1e3ae9fa648 Parav Pandit               2018-09-05  271  	}
b1d29f42e02d0c Anumula Murali Mohan Reddy 2024-09-26 @272  	if (is_vlan_dev(dev))
b1d29f42e02d0c Anumula Murali Mohan Reddy 2024-09-26  273  		dev = vlan_dev_real_dev(dev);
caf1e3ae9fa648 Parav Pandit               2018-09-05  274  	return ret ? ERR_PTR(ret) : dev;
caf1e3ae9fa648 Parav Pandit               2018-09-05  275  }
caf1e3ae9fa648 Parav Pandit               2018-09-05  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
