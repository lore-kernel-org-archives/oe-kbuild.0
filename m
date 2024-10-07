Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A173F13AF2
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728269008; cv=none; b=furT98cLFYQ4iL4vP//NfEPy3PWGmegP2lz9YEYBT8XGeHvsKS7b8EglbvM6AaDWmZd+rTf0KRRencq2+U7DBzMQtEHRq7RmyMNOOuH6Rmq8PZv8XhCw8OH4Gi/Ld7YITSbcjl+aSFbVPinqecirnJ/XlXbZP5heFl1dCHJgUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728269008; c=relaxed/simple;
	bh=quzn9VZl0y8jddPeZTgmA0ZIBIqdXdS8ogpTfKoTFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPXJ7FI/GP2rDIdFRdGyix3ZC68rsBlpjyLOcP6KQE5f0FnTV0lKkMG8A7cDZe4vNICILR0z6cGBTKi4E7PmpHbvJETCP20QFMaEhXaRU0j3gzob2z5CMdAUpJ42KiEIt/kSUSZuHjnrO3FpHDCaC505qKXEzgRIpVT2GPO1fPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQQtlaqF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQQtlaqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728269006; x=1759805006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quzn9VZl0y8jddPeZTgmA0ZIBIqdXdS8ogpTfKoTFuI=;
  b=fQQtlaqFPXhE5ups8sz+w8MO458ji8FeixUSuScNdpf9JKfSdYe679SL
   stnGu6238gJd7++2+HFHhBvVN2s1FY6w0c2fZrPIq0Q9baqFzs1BMxbv0
   UDbXUD8ZKaw0xyis/n/izLD15LymLRmdteymLQla0yUfPF/IjhYqqwhR8
   57xz+RyibjLIkMfq7nibyieNL0MiBT0EA9ZdPgKJfK3JzCdJV+3aX/hij
   erlIW4Kwt+RrOHT/2vRprPGzm87vN89MWKqhk3QbVOkl7oTGCdtRBqGoo
   s4NuexW69nCyStE1PbV8IjrcjmRs2FvwD8j614hswh2jDJyAONOITPkak
   A==;
X-CSE-ConnectionGUID: OAIsn/jwSge+UikwMLf4mA==
X-CSE-MsgGUID: jsZQrsh9RWSszSCb61VqQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="15024681"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="15024681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 19:43:26 -0700
X-CSE-ConnectionGUID: ONbUGW0YS72tP3nBxMQIXw==
X-CSE-MsgGUID: szH8TU0XRRqwrH1xYfZfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75675470"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Oct 2024 19:43:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxdiU-0004XE-2r;
	Mon, 07 Oct 2024 02:43:22 +0000
Date: Mon, 7 Oct 2024 10:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 5/7] vhost: Add the cgroup related function
Message-ID: <202410071046.iV6mE2XD-lkp@intel.com>
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
In-Reply-To: <20241004015937.2286459-6-lulu@redhat.com>
References: <20241004015937.2286459-6-lulu@redhat.com>
TO: Cindy Lu <lulu@redhat.com>
TO: lulu@redhat.com
TO: jasowang@redhat.com
TO: mst@redhat.com
TO: michael.christie@oracle.com
TO: linux-kernel@vger.kernel.org
TO: virtualization@lists.linux-foundation.org

Hi Cindy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-modparam-to-allow-userspace-select-vhost_task/20241004-100307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20241004015937.2286459-6-lulu%40redhat.com
patch subject: [PATCH v2 5/7] vhost: Add the cgroup related function
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071046.iV6mE2XD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410071046.iV6mE2XD-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:701 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:696 vhost_attach_cgroups() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/vhost/vhost.c:335 vhost_dev_flush() warn: iterator 'i' not incremented

vim +/ret +701 drivers/vhost/vhost.c

8af3761e8c2789 Cindy Lu 2024-10-04  684  
8af3761e8c2789 Cindy Lu 2024-10-04  685  static int vhost_attach_cgroups(struct vhost_dev *dev)
8af3761e8c2789 Cindy Lu 2024-10-04  686  {
8af3761e8c2789 Cindy Lu 2024-10-04  687  	struct vhost_worker *worker;
8af3761e8c2789 Cindy Lu 2024-10-04  688  	unsigned long i;
8af3761e8c2789 Cindy Lu 2024-10-04  689  	int ret;
8af3761e8c2789 Cindy Lu 2024-10-04  690  
8af3761e8c2789 Cindy Lu 2024-10-04  691  	/*
8af3761e8c2789 Cindy Lu 2024-10-04  692  	 * Free the default worker we created and cleanup workers userspace
8af3761e8c2789 Cindy Lu 2024-10-04  693  	 * created but couldn't clean up (it forgot or crashed).
8af3761e8c2789 Cindy Lu 2024-10-04  694  	 */
8af3761e8c2789 Cindy Lu 2024-10-04  695  
8af3761e8c2789 Cindy Lu 2024-10-04 @696  	xa_for_each(&dev->worker_xa, i, worker) {
8af3761e8c2789 Cindy Lu 2024-10-04  697  		ret = vhost_worker_cgroups_kthread(worker);
8af3761e8c2789 Cindy Lu 2024-10-04  698  		if (ret)
8af3761e8c2789 Cindy Lu 2024-10-04  699  			return ret;
8af3761e8c2789 Cindy Lu 2024-10-04  700  	}
8af3761e8c2789 Cindy Lu 2024-10-04 @701  	return ret;
8af3761e8c2789 Cindy Lu 2024-10-04  702  }
8af3761e8c2789 Cindy Lu 2024-10-04  703  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
