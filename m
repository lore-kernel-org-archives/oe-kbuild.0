Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FF5674D
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966209; cv=none; b=tsm3hl9eaRQObbfQjaH9u8rEHPRcYbPVkXn6zSoZikTLP9z1ycyBQyHCbtASrUefRgvDZDExXiwGH2zmjm7dB63bA/QSURbXtQKmkAlBcHIjY8t40hR4HYMvUkVU+Tc6+QdPYJJh/MpGVSvapZq3zv2EfCFb8pfsEXrIWmAGjMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966209; c=relaxed/simple;
	bh=o81FQpW2tMFqTMBLoyWGWJPYvIFvfLj1CcAPBRl1qPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EK/HjMvrIzF1pV3C39GWUAqs9Mpxf9m5w1MbdUqC6bBGGnHxea29cFdk95HVYnAlOEedsZYhWAk/FNJG45ZtmVGYZ37LIIqp4oM4bG5Clw1ASgxUYqavyqnWmzogxNAQNXygTs3wICU72mTvxfPjPyxnYU9qV3/ZyKmrYZloR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4smQsHa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4smQsHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725966208; x=1757502208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o81FQpW2tMFqTMBLoyWGWJPYvIFvfLj1CcAPBRl1qPY=;
  b=a4smQsHai4/fF2QA4X7MS8X9qK148KYErGWRiSXW3MBHvoQwlk/cQqum
   H39Kr1TjoCAXlfNe5J1f07om44TVz9wJjvr5Xu1aYWonhYCatHXvsTJLr
   ApmLYP6DVxOieOf9RD55vzV1SnqsQqL9onB+iSgjnQcAnFHUg0KCnq9QB
   8WBpvSl4IfRnMT+5eC2hZ11+U/DliJm08EMXiN6GRdMdglZbW7aAz5cEW
   reDEq0imcHapKn4uRgtcEI9ykCHWFv3h0kTYxQXurj2417NUPHp1rjQGP
   jpmafUVebixfjaAyFIvmBXkaAr9Jm9sF3mTvtLcknm5sBa5a5qooNw0Yu
   A==;
X-CSE-ConnectionGUID: SyMOe17QT4a28pS7UdJV2Q==
X-CSE-MsgGUID: FCwtp3IeSaOtyyYhjc8iEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24582313"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24582313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:03:28 -0700
X-CSE-ConnectionGUID: E4P4W4o4RCO82rYLUt5y8A==
X-CSE-MsgGUID: WBgXpFXIREGYDMT9NSuoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67237599"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2024 04:03:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snyea-0001yc-1Z;
	Tue, 10 Sep 2024 11:03:24 +0000
Date: Tue, 10 Sep 2024 19:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RESEND PATCH v1 5/7] vhost: Add the cgroup related function
Message-ID: <202409101810.lEzmyYtL-lkp@intel.com>
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
In-Reply-To: <20240909020138.1245873-6-lulu@redhat.com>
References: <20240909020138.1245873-6-lulu@redhat.com>
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
[also build test WARNING on linus/master v6.11-rc7 next-20240909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-kthread-support-in-function-vhost_worker_queue/20240909-110046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240909020138.1245873-6-lulu%40redhat.com
patch subject: [RESEND PATCH v1 5/7] vhost: Add the cgroup related function
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101810.lEzmyYtL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409101810.lEzmyYtL-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:700 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:695 vhost_attach_cgroups() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/vhost/vhost.c:334 vhost_dev_flush() warn: iterator 'i' not incremented

vim +/ret +700 drivers/vhost/vhost.c

b4aba797e119df Cindy Lu 2024-09-09  683  
b4aba797e119df Cindy Lu 2024-09-09  684  static int vhost_attach_cgroups(struct vhost_dev *dev)
b4aba797e119df Cindy Lu 2024-09-09  685  {
b4aba797e119df Cindy Lu 2024-09-09  686  	struct vhost_worker *worker;
b4aba797e119df Cindy Lu 2024-09-09  687  	unsigned long i;
b4aba797e119df Cindy Lu 2024-09-09  688  	int ret;
b4aba797e119df Cindy Lu 2024-09-09  689  
b4aba797e119df Cindy Lu 2024-09-09  690  	/*
b4aba797e119df Cindy Lu 2024-09-09  691  	 * Free the default worker we created and cleanup workers userspace
b4aba797e119df Cindy Lu 2024-09-09  692  	 * created but couldn't clean up (it forgot or crashed).
b4aba797e119df Cindy Lu 2024-09-09  693  	 */
b4aba797e119df Cindy Lu 2024-09-09  694  
b4aba797e119df Cindy Lu 2024-09-09 @695  	xa_for_each(&dev->worker_xa, i, worker) {
b4aba797e119df Cindy Lu 2024-09-09  696  		ret = vhost_worker_cgroups_kthread(worker);
b4aba797e119df Cindy Lu 2024-09-09  697  		if (ret)
b4aba797e119df Cindy Lu 2024-09-09  698  			return ret;
b4aba797e119df Cindy Lu 2024-09-09  699  	}
b4aba797e119df Cindy Lu 2024-09-09 @700  	return ret;
b4aba797e119df Cindy Lu 2024-09-09  701  }
b4aba797e119df Cindy Lu 2024-09-09  702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
