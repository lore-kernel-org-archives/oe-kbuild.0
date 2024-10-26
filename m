Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E3125A9
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Oct 2024 00:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729902824; cv=none; b=QBzvRV/dDDyQ1Z7zNYxMj6oR+m5W/q0raH98HEAHE5ZWrvzi7LGMxXRBCg++scceN/BeSDUY+366K/zzvkhde2EIxpRLj/oTEu2HIaj8RvS4fpPHtId7CRJ9oTjXSTXr/3nDunAzDBpqnxxJYkQ3PwGEoOLh3A7DvLd2Ga1qeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729902824; c=relaxed/simple;
	bh=C8ii17A9Qwn7nfTpNW7hMnAh7UlOGH7rCiuTheQ7PPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSW4PgG+fceM3Zoulg+p3sMSED3U5wjvJuv2olfgAAe0x8SpKzdQ07gyjSDw2Y9ZKALqIoualqzUgJC9hwMX8/v4pavDhUpXZGIRFh9fbkbwTXoc1AD973fT2brUZXjOfHXXYqFkOWUHizK2ooIVnIH3mgh72P3yoZSHZslMV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/MkP/gW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/MkP/gW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729902821; x=1761438821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8ii17A9Qwn7nfTpNW7hMnAh7UlOGH7rCiuTheQ7PPQ=;
  b=g/MkP/gWowPVRinCPxhDuUgFfQ3ovi0B2ltQPky+FPTWxaX3ZR+AnmGG
   gNS73oE4gqEna9qEb0NNse0aaaAWnuFgcCp45eqEbTBMSEweK8OXoZnWi
   Thv2RTTGwNdH4PMtjppBbzOseZAhL+/T5k4Q2XcuxiIrB2eBfK2mOWLLv
   WOjS8NOt4ZM9efEOFTuVPwmHEylDY2RWwo7I6RZXqNbCyoIxs1zOEzkD1
   NdXgT0T3w6H6ZKuQOGMANQ43B8gEFmxwh1YKxH0U8TDHu1hooq1AR6BPC
   whHWf/KpBUe2VnSB1RVsYHZeGzYHxHYXW+PzxQ5TX2aO7iXP5UQ9ZdwTT
   A==;
X-CSE-ConnectionGUID: iruokXfNTkmYP9mG46jVMQ==
X-CSE-MsgGUID: gvb9gSnuSvqjsrs19inbxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29037943"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29037943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 17:33:40 -0700
X-CSE-ConnectionGUID: v+y7+xeuSLSRPSuQUbdVSg==
X-CSE-MsgGUID: +D4ywCwPQpWPTce8yC6iUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="111881654"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 17:33:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4UkK-000Z5g-34;
	Sat, 26 Oct 2024 00:33:36 +0000
Date: Sat, 26 Oct 2024 08:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/1] report binder txn errors via generic netlink
Message-ID: <202410260847.NDByoPQo-lkp@intel.com>
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
In-Reply-To: <20241021182821.1259487-3-dualli@chromium.org>
References: <20241021182821.1259487-3-dualli@chromium.org>
TO: Li Li <dualli@chromium.org>
TO: dualli@google.com
TO: corbet@lwn.net
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: donald.hunter@gmail.com
TO: gregkh@linuxfoundation.org
TO: arve@android.com
TO: tkjos@android.com
TO: maco@android.com
TO: joel@joelfernandes.org
TO: brauner@kernel.org
TO: cmllamas@google.com
TO: surenb@google.com
TO: arnd@arndb.de
TO: masahiroy@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: netdev@vger.kernel.org
TO: hridya@google.com
TO: smoreland@google.com
CC: kernel-team@android.com

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Li/report-binder-txn-errors-via-generic-netlink/20241022-032903
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241021182821.1259487-3-dualli%40chromium.org
patch subject: [PATCH v3 1/1] report binder txn errors via generic netlink
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20241024 (https://download.01.org/0day-ci/archive/20241026/202410260847.NDByoPQo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410260847.NDByoPQo-lkp@intel.com/

New smatch warnings:
drivers/android/binder.c:7204 init_binder_device() warn: '&binder_device->miscdev' from misc_register() not released on lines: 7204.

Old smatch warnings:
drivers/android/binder.c:2374 binder_translate_fd() warn: fd re-used after fget(): 'fd'

vim +7204 drivers/android/binder.c

39854ac9458c74 Li Li             2024-10-21  7172  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7173  static int __init init_binder_device(const char *name)
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7174  {
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7175  	int ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7176  	struct binder_device *binder_device;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7177  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7178  	binder_device = kzalloc(sizeof(*binder_device), GFP_KERNEL);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7179  	if (!binder_device)
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7180  		return -ENOMEM;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7181  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7182  	binder_device->miscdev.fops = &binder_fops;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7183  	binder_device->miscdev.minor = MISC_DYNAMIC_MINOR;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7184  	binder_device->miscdev.name = name;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7185  
f0fe2c0f050d31 Christian Brauner 2020-03-03  7186  	refcount_set(&binder_device->ref, 1);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7187  	binder_device->context.binder_context_mgr_uid = INVALID_UID;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7188  	binder_device->context.name = name;
c44b1231ff1170 Todd Kjos         2017-06-29  7189  	mutex_init(&binder_device->context.context_mgr_node_lock);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7190  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7191  	ret = misc_register(&binder_device->miscdev);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7192  	if (ret < 0) {
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7193  		kfree(binder_device);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7194  		return ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7195  	}
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7196  
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7197  	hlist_add_head(&binder_device->hlist, &binder_devices);
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7198  
39854ac9458c74 Li Li             2024-10-21  7199  	binder_device->context.report_seq = (atomic_t)ATOMIC_INIT(0);
39854ac9458c74 Li Li             2024-10-21  7200  	ret = binder_genl_init(&binder_device->context.genl_family, name);
39854ac9458c74 Li Li             2024-10-21  7201  	if (ret < 0)
39854ac9458c74 Li Li             2024-10-21  7202  		kfree(binder_device);
39854ac9458c74 Li Li             2024-10-21  7203  
ac4812c5ffbb88 Martijn Coenen    2017-02-03 @7204  	return ret;
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7205  }
ac4812c5ffbb88 Martijn Coenen    2017-02-03  7206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
