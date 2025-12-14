Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563BB256C8D
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 05:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765691867; cv=none; b=qBXZCy6HNyOFhOSjuNFIgbE9FSGKdSRTTWLRT1TMG+ZB0B09bkaO/D+3o23zT3wbfPO5JJa4qH0KJr/72zN0j0QzkhqUfxmwn0/+doShgq/S0WYJDqpDhd6/Av5OgLd/SPz/RiGyoAwvPIylTOfT/aaedub2Qd8SQEcidT17KHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765691867; c=relaxed/simple;
	bh=Icr1ftodZpxcxgeuaIW61vdP3pyUmvcw8MVB1vp/aYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qndMA64dApvX1z0OBL1b7Kmbum6CE3eVMG4MUmhFgke5FJwHW9fmj6lClQ5j8cb6jPJDQGmZEvaJpYwElevyE72ghZ71G0kCpo//eTYldEQXYNjGj9h/RDecOA4npR1ZJU9+r0GpZvw1nxEwV5mZTsrecMMgpH7OeSJAksux8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAkKFfVI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAkKFfVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765691864; x=1797227864;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Icr1ftodZpxcxgeuaIW61vdP3pyUmvcw8MVB1vp/aYo=;
  b=eAkKFfVIK9PaTk4bD1PcKMuLk3OtSgvrJXe5F8yHH8toneFUK6AMSnjo
   NK4G6TM9Jids3q/4rKjyzRE3mLqvaAHH/m76VsGnaN3ImPZfwaMFDNGJW
   wCDaR1vHbkH7tQM2IqiJTMdeCrcf7l3cJUa1a4dea8jXk0E9NmJp07wS1
   Dk/OA7XSJtJpi4p6+WG5+S4sTjwlK7nBLH7Dov4RlDDstWl5KR/TtnC1b
   69yUno+/7Yb0vdxozAg13Mv9LyPlqrtuFrzeA32Xw5Woij75ChJt0Jqod
   YdfUK3aBIOGRhGjbRwWndSsu6ixCyOCI4fSFdVrKYuWmaPEFVR4DO8wF6
   A==;
X-CSE-ConnectionGUID: puFrTNJ2Q8KA/PrV2l+n/g==
X-CSE-MsgGUID: zZ3jl9ReSFaXRBLAeRMNhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78271974"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78271974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:57:43 -0800
X-CSE-ConnectionGUID: 3+OGJzYNRwqYKag1IHdNwA==
X-CSE-MsgGUID: fQZercbyQNmLNi+J2k9Wdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202540757"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 21:57:41 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUf6x-000000008dp-0u8x;
	Sun, 14 Dec 2025 05:57:39 +0000
Date: Sun, 14 Dec 2025 13:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/android/binder.c:4224 binder_thread_write() warn: check for
 integer overflow 'data_ptr'
Message-ID: <202512141331.58n8Vtpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Tiffany Y. Yang" <ynaffit@google.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 92d2261214a52f1c3a0db027b7818363acfb04c7 binder: use buffer offsets in debug logs
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141331.58n8Vtpz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141331.58n8Vtpz-lkp@intel.com/

New smatch warnings:
drivers/android/binder.c:4224 binder_thread_write() warn: check for integer overflow 'data_ptr'

Old smatch warnings:
drivers/android/binder.c:2379 binder_translate_fd() warn: fd re-used after fget(): 'fd'
drivers/android/binder.c:4229 binder_thread_write() warn: check for integer overflow 'data_ptr'
drivers/android/binder.c:4236 binder_thread_write() warn: check for integer overflow 'data_ptr'

vim +/data_ptr +4224 drivers/android/binder.c

44d8047f1d87adc drivers/android/binder.c         Todd Kjos              2018-08-28  4039  
fb07ebc3e82a98a drivers/staging/android/binder.c Bojan Prtvar           2013-09-02  4040  static int binder_thread_write(struct binder_proc *proc,
fb07ebc3e82a98a drivers/staging/android/binder.c Bojan Prtvar           2013-09-02  4041  			struct binder_thread *thread,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4042  			binder_uintptr_t binder_buffer, size_t size,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4043  			binder_size_t *consumed)
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4044  {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4045  	uint32_t cmd;
342e5c90b60134d drivers/android/binder.c         Martijn Coenen         2017-02-03  4046  	struct binder_context *context = proc->context;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4047  	void __user *buffer = (void __user *)(uintptr_t)binder_buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4048  	void __user *ptr = buffer + *consumed;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4049  	void __user *end = buffer + size;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4050  
26549d17741035b drivers/android/binder.c         Todd Kjos              2017-06-29  4051  	while (ptr < end && thread->return_error.cmd == BR_OK) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4052  		int ret;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4053  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4054  		if (get_user(cmd, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4055  			return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4056  		ptr += sizeof(uint32_t);
975a1ac9a9fe65d drivers/staging/android/binder.c Arve Hjønnevåg         2012-10-16  4057  		trace_binder_command(cmd);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4058  		if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.bc)) {
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4059  			atomic_inc(&binder_stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4060  			atomic_inc(&proc->stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce0 drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4061  			atomic_inc(&thread->stats.bc[_IOC_NR(cmd)]);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4062  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4063  		switch (cmd) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4064  		case BC_INCREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4065  		case BC_ACQUIRE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4066  		case BC_RELEASE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4067  		case BC_DECREFS: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4068  			uint32_t target;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4069  			const char *debug_string;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4070  			bool strong = cmd == BC_ACQUIRE || cmd == BC_RELEASE;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4071  			bool increment = cmd == BC_INCREFS || cmd == BC_ACQUIRE;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4072  			struct binder_ref_data rdata;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4073  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4074  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4075  				return -EFAULT;
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4076  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4077  			ptr += sizeof(uint32_t);
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4078  			ret = -1;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4079  			if (increment && !target) {
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4080  				struct binder_node *ctx_mgr_node;
6c20032c22d9823 drivers/android/binder.c         Andrew Bridges         2020-10-27  4081  
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4082  				mutex_lock(&context->context_mgr_node_lock);
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4083  				ctx_mgr_node = context->binder_context_mgr_node;
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4084  				if (ctx_mgr_node) {
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4085  					if (ctx_mgr_node->proc == proc) {
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4086  						binder_user_error("%d:%d context manager tried to acquire desc 0\n",
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4087  								  proc->pid, thread->pid);
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4088  						mutex_unlock(&context->context_mgr_node_lock);
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4089  						return -EINVAL;
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4090  					}
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4091  					ret = binder_inc_ref_for_node(
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4092  							proc, ctx_mgr_node,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4093  							strong, NULL, &rdata);
4b836a1426cb0f1 drivers/android/binder.c         Jann Horn              2020-07-27  4094  				}
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4095  				mutex_unlock(&context->context_mgr_node_lock);
c44b1231ff11709 drivers/android/binder.c         Todd Kjos              2017-06-29  4096  			}
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4097  			if (ret)
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4098  				ret = binder_update_ref_for_handle(
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4099  						proc, target, increment, strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4100  						&rdata);
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4101  			if (!ret && rdata.desc != target) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4102  				binder_user_error("%d:%d tried to acquire reference to desc %d, got %d instead\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4103  					proc->pid, thread->pid,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4104  					target, rdata.desc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4105  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4106  			switch (cmd) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4107  			case BC_INCREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4108  				debug_string = "IncRefs";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4109  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4110  			case BC_ACQUIRE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4111  				debug_string = "Acquire";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4112  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4113  			case BC_RELEASE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4114  				debug_string = "Release";
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4115  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4116  			case BC_DECREFS:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4117  			default:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4118  				debug_string = "DecRefs";
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4119  				break;
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4120  			}
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4121  			if (ret) {
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4122  				binder_user_error("%d:%d %s %d refcount change on invalid ref %d ret %d\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4123  					proc->pid, thread->pid, debug_string,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4124  					strong, target, ret);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4125  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4126  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4127  			binder_debug(BINDER_DEBUG_USER_REFS,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4128  				     "%d:%d %s ref %d desc %d s %d w %d\n",
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4129  				     proc->pid, thread->pid, debug_string,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4130  				     rdata.debug_id, rdata.desc, rdata.strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4131  				     rdata.weak);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4132  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4133  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4134  		case BC_INCREFS_DONE:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4135  		case BC_ACQUIRE_DONE: {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4136  			binder_uintptr_t node_ptr;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4137  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4138  			struct binder_node *node;
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4139  			bool free_node;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4140  
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4141  			if (get_user(node_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4142  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4143  			ptr += sizeof(binder_uintptr_t);
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4144  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4145  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4146  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4147  			node = binder_get_node(proc, node_ptr);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4148  			if (node == NULL) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4149  				binder_user_error("%d:%d %s u%016llx no match\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4150  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4151  					cmd == BC_INCREFS_DONE ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4152  					"BC_INCREFS_DONE" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4153  					"BC_ACQUIRE_DONE",
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4154  					(u64)node_ptr);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4155  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4156  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4157  			if (cookie != node->cookie) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4158  				binder_user_error("%d:%d %s u%016llx node %d cookie mismatch %016llx != %016llx\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4159  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4160  					cmd == BC_INCREFS_DONE ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4161  					"BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4162  					(u64)node_ptr, node->debug_id,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4163  					(u64)cookie, (u64)node->cookie);
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4164  				binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4165  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4166  			}
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4167  			binder_node_inner_lock(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4168  			if (cmd == BC_ACQUIRE_DONE) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4169  				if (node->pending_strong_ref == 0) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4170  					binder_user_error("%d:%d BC_ACQUIRE_DONE node %d has no pending acquire request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4171  						proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4172  						node->debug_id);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4173  					binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4174  					binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4175  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4176  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4177  				node->pending_strong_ref = 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4178  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4179  				if (node->pending_weak_ref == 0) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4180  					binder_user_error("%d:%d BC_INCREFS_DONE node %d has no pending increfs request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4181  						proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4182  						node->debug_id);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4183  					binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4184  					binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4185  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4186  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4187  				node->pending_weak_ref = 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4188  			}
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4189  			free_node = binder_dec_node_nilocked(node,
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4190  					cmd == BC_ACQUIRE_DONE, 0);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4191  			WARN_ON(free_node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4192  			binder_debug(BINDER_DEBUG_USER_REFS,
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4193  				     "%d:%d %s node %d ls %d lw %d tr %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4194  				     proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4195  				     cmd == BC_INCREFS_DONE ? "BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4196  				     node->debug_id, node->local_strong_refs,
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4197  				     node->local_weak_refs, node->tmp_refs);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4198  			binder_node_inner_unlock(node);
adc1884222276df drivers/android/binder.c         Todd Kjos              2017-06-29  4199  			binder_put_node(node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4200  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4201  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4202  		case BC_ATTEMPT_ACQUIRE:
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4203  			pr_err("BC_ATTEMPT_ACQUIRE not supported\n");
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4204  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4205  		case BC_ACQUIRE_RESULT:
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4206  			pr_err("BC_ACQUIRE_RESULT not supported\n");
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4207  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4208  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4209  		case BC_FREE_BUFFER: {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4210  			binder_uintptr_t data_ptr;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4211  			struct binder_buffer *buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4212  
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4213  			if (get_user(data_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4214  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4215  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4216  
53d311cfa19ad35 drivers/android/binder.c         Todd Kjos              2017-06-29  4217  			buffer = binder_alloc_prepare_to_free(&proc->alloc,
19c987241ca1216 drivers/android/binder.c         Todd Kjos              2017-06-29  4218  							      data_ptr);
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4219  			if (IS_ERR_OR_NULL(buffer)) {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4220  				if (PTR_ERR(buffer) == -EPERM) {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4221  					binder_user_error(
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4222  						"%d:%d BC_FREE_BUFFER matched unreturned or currently freeing buffer at offset %lx\n",
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4223  						proc->pid, thread->pid,
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01 @4224  						(unsigned long)data_ptr - proc->alloc.vm_start);
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4225  				} else {
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4226  					binder_user_error(
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4227  						"%d:%d BC_FREE_BUFFER no match for buffer at offset %lx\n",
7bada55ab506978 drivers/android/binder.c         Todd Kjos              2018-11-06  4228  						proc->pid, thread->pid,
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4229  						(unsigned long)data_ptr - proc->alloc.vm_start);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4230  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4231  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4232  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4233  			binder_debug(BINDER_DEBUG_FREE_BUFFER,
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4234  				     "%d:%d BC_FREE_BUFFER at offset %lx found buffer %d for %s transaction\n",
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4235  				     proc->pid, thread->pid,
92d2261214a52f1 drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4236  				     (unsigned long)data_ptr - proc->alloc.vm_start,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4237  				     buffer->debug_id,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4238  				     buffer->transaction ? "active" : "finished");
32e9f56a96d8d0f drivers/android/binder.c         Todd Kjos              2021-10-15  4239  			binder_free_buf(proc, thread, buffer, false);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4240  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4241  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4242  
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4243  		case BC_TRANSACTION_SG:
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4244  		case BC_REPLY_SG: {
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4245  			struct binder_transaction_data_sg tr;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4246  
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4247  			if (copy_from_user(&tr, ptr, sizeof(tr)))
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4248  				return -EFAULT;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4249  			ptr += sizeof(tr);
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4250  			binder_transaction(proc, thread, &tr.transaction_data,
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4251  					   cmd == BC_REPLY_SG, tr.buffers_size);
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4252  			break;
7980240b6d63e06 drivers/android/binder.c         Martijn Coenen         2017-02-03  4253  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4254  		case BC_TRANSACTION:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4255  		case BC_REPLY: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4256  			struct binder_transaction_data tr;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4257  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4258  			if (copy_from_user(&tr, ptr, sizeof(tr)))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4259  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4260  			ptr += sizeof(tr);
4bfac80af3a63f2 drivers/android/binder.c         Martijn Coenen         2017-02-03  4261  			binder_transaction(proc, thread, &tr,
4bfac80af3a63f2 drivers/android/binder.c         Martijn Coenen         2017-02-03  4262  					   cmd == BC_REPLY, 0);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4263  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4264  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4265  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4266  		case BC_REGISTER_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4267  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4268  				     "%d:%d BC_REGISTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4269  				     proc->pid, thread->pid);
b3e6861283790d7 drivers/android/binder.c         Todd Kjos              2017-06-29  4270  			binder_inner_proc_lock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4271  			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4272  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4273  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called after BC_ENTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4274  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4275  			} else if (proc->requested_threads == 0) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4276  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4277  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called without request\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4278  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4279  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4280  				proc->requested_threads--;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4281  				proc->requested_threads_started++;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4282  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4283  			thread->looper |= BINDER_LOOPER_STATE_REGISTERED;
b3e6861283790d7 drivers/android/binder.c         Todd Kjos              2017-06-29  4284  			binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4285  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4286  		case BC_ENTER_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4287  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4288  				     "%d:%d BC_ENTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4289  				     proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4290  			if (thread->looper & BINDER_LOOPER_STATE_REGISTERED) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4291  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4292  				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called after BC_REGISTER_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4293  					proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4294  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4295  			thread->looper |= BINDER_LOOPER_STATE_ENTERED;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4296  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4297  		case BC_EXIT_LOOPER:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4298  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4299  				     "%d:%d BC_EXIT_LOOPER\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4300  				     proc->pid, thread->pid);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4301  			thread->looper |= BINDER_LOOPER_STATE_EXITED;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4302  			break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4303  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4304  		case BC_REQUEST_DEATH_NOTIFICATION:
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4305  		case BC_CLEAR_DEATH_NOTIFICATION: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4306  			uint32_t target;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4307  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4308  			struct binder_ref *ref;
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4309  			struct binder_ref_death *death = NULL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4310  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4311  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4312  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4313  			ptr += sizeof(uint32_t);
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4314  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4315  				return -EFAULT;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4316  			ptr += sizeof(binder_uintptr_t);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4317  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4318  				/*
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4319  				 * Allocate memory for death notification
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4320  				 * before taking lock
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4321  				 */
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4322  				death = kzalloc(sizeof(*death), GFP_KERNEL);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4323  				if (death == NULL) {
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4324  					WARN_ON(thread->return_error.cmd !=
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4325  						BR_OK);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4326  					thread->return_error.cmd = BR_ERROR;
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4327  					binder_enqueue_thread_work(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4328  						thread,
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4329  						&thread->return_error.work);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4330  					binder_debug(
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4331  						BINDER_DEBUG_FAILED_TRANSACTION,
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4332  						"%d:%d BC_REQUEST_DEATH_NOTIFICATION failed\n",
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4333  						proc->pid, thread->pid);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4334  					break;
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4335  				}
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4336  			}
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4337  			binder_proc_lock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4338  			ref = binder_get_ref_olocked(proc, target, false);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4339  			if (ref == NULL) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4340  				binder_user_error("%d:%d %s invalid ref %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4341  					proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4342  					cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4343  					"BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4344  					"BC_CLEAR_DEATH_NOTIFICATION",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4345  					target);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4346  				binder_proc_unlock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4347  				kfree(death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4348  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4349  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4350  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4351  			binder_debug(BINDER_DEBUG_DEATH_NOTIFICATION,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4352  				     "%d:%d %s %016llx ref %d desc %d s %d w %d for node %d\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4353  				     proc->pid, thread->pid,
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4354  				     cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4355  				     "BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4356  				     "BC_CLEAR_DEATH_NOTIFICATION",
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4357  				     (u64)cookie, ref->data.debug_id,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4358  				     ref->data.desc, ref->data.strong,
372e3147df7016e drivers/android/binder.c         Todd Kjos              2017-06-29  4359  				     ref->data.weak, ref->node->debug_id);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4360  
ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         2017-06-29  4361  			binder_node_lock(ref->node);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4362  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4363  				if (ref->death) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4364  					binder_user_error("%d:%d BC_REQUEST_DEATH_NOTIFICATION death notification already set\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4365  						proc->pid, thread->pid);
ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         2017-06-29  4366  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4367  					binder_proc_unlock(proc);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4368  					kfree(death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4369  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4370  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4371  				binder_stats_created(BINDER_STAT_DEATH);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4372  				INIT_LIST_HEAD(&death->work.entry);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4373  				death->cookie = cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4374  				ref->death = death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4375  				if (ref->node->proc == NULL) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4376  					ref->death->work.type = BINDER_WORK_DEAD_BINDER;
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         2017-08-31  4377  
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         2017-08-31  4378  					binder_inner_proc_lock(proc);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         2017-08-31  4379  					binder_enqueue_work_ilocked(
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         2017-08-31  4380  						&ref->death->work, &proc->todo);
bb74562a7f83982 drivers/android/binder.c         Martijn Coenen         2017-08-31  4381  					binder_wakeup_proc_ilocked(proc);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         2017-08-31  4382  					binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4383  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4384  			} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4385  				if (ref->death == NULL) {
56b468fc709b2b9 drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4386  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification not active\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4387  						proc->pid, thread->pid);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4388  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4389  					binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4390  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4391  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4392  				death = ref->death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4393  				if (death->cookie != cookie) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4394  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch %016llx != %016llx\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4395  						proc->pid, thread->pid,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4396  						(u64)death->cookie,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4397  						(u64)cookie);
673068eee8560d5 drivers/android/binder.c         Todd Kjos              2017-06-29  4398  					binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4399  					binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4400  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4401  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4402  				ref->death = NULL;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4403  				binder_inner_proc_lock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4404  				if (list_empty(&death->work.entry)) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4405  					death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4406  					if (thread->looper &
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4407  					    (BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4408  					     BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4409  						binder_enqueue_thread_work_ilocked(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4410  								thread,
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4411  								&death->work);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4412  					else {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4413  						binder_enqueue_work_ilocked(
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4414  								&death->work,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4415  								&proc->todo);
1b77e9dcc3da935 drivers/android/binder.c         Martijn Coenen         2017-08-31  4416  						binder_wakeup_proc_ilocked(
408c68b17aea2f2 drivers/android/binder.c         Martijn Coenen         2017-08-31  4417  								proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4418  					}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4419  				} else {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4420  					BUG_ON(death->work.type != BINDER_WORK_DEAD_BINDER);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4421  					death->work.type = BINDER_WORK_DEAD_BINDER_AND_CLEAR;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4422  				}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4423  				binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4424  			}
ab51ec6bdf0b7af drivers/android/binder.c         Martijn Coenen         2017-06-29  4425  			binder_node_unlock(ref->node);
2c1838dc6817dd2 drivers/android/binder.c         Todd Kjos              2017-06-29  4426  			binder_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4427  		} break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4428  		case BC_DEAD_BINDER_DONE: {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4429  			struct binder_work *w;
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4430  			binder_uintptr_t cookie;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4431  			struct binder_ref_death *death = NULL;
10f62861b4a2f22 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4432  
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4433  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4434  				return -EFAULT;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4435  
7a64cd887fdb97f drivers/android/binder.c         Lisa Du                2016-02-17  4436  			ptr += sizeof(cookie);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4437  			binder_inner_proc_lock(proc);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4438  			list_for_each_entry(w, &proc->delivered_death,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4439  					    entry) {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4440  				struct binder_ref_death *tmp_death =
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4441  					container_of(w,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4442  						     struct binder_ref_death,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4443  						     work);
10f62861b4a2f22 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4444  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4445  				if (tmp_death->cookie == cookie) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4446  					death = tmp_death;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4447  					break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4448  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4449  			}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4450  			binder_debug(BINDER_DEBUG_DEAD_BINDER,
8ca86f1639ec589 drivers/android/binder.c         Todd Kjos              2018-02-07  4451  				     "%d:%d BC_DEAD_BINDER_DONE %016llx found %pK\n",
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4452  				     proc->pid, thread->pid, (u64)cookie,
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4453  				     death);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4454  			if (death == NULL) {
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4455  				binder_user_error("%d:%d BC_DEAD_BINDER_DONE %016llx not found\n",
da49889deb34d35 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4456  					proc->pid, thread->pid, (u64)cookie);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4457  				binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4458  				break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4459  			}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4460  			binder_dequeue_work_ilocked(&death->work);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4461  			if (death->work.type == BINDER_WORK_DEAD_BINDER_AND_CLEAR) {
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4462  				death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4463  				if (thread->looper &
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4464  					(BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4465  					 BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4466  					binder_enqueue_thread_work_ilocked(
148ade2c4d4f46b drivers/android/binder.c         Martijn Coenen         2017-11-15  4467  						thread, &death->work);
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4468  				else {
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4469  					binder_enqueue_work_ilocked(
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4470  							&death->work,
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4471  							&proc->todo);
408c68b17aea2f2 drivers/android/binder.c         Martijn Coenen         2017-08-31  4472  					binder_wakeup_proc_ilocked(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4473  				}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4474  			}
72196393a5e3d28 drivers/android/binder.c         Todd Kjos              2017-06-29  4475  			binder_inner_proc_unlock(proc);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4476  		} break;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4477  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4478  		case BC_REQUEST_FREEZE_NOTIFICATION: {
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4479  			struct binder_handle_cookie handle_cookie;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4480  			int error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4481  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4482  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4483  				return -EFAULT;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4484  			ptr += sizeof(handle_cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4485  			error = binder_request_freeze_notification(proc, thread,
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4486  								   &handle_cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4487  			if (error)
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4488  				return error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4489  		} break;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4490  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4491  		case BC_CLEAR_FREEZE_NOTIFICATION: {
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4492  			struct binder_handle_cookie handle_cookie;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4493  			int error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4494  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4495  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4496  				return -EFAULT;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4497  			ptr += sizeof(handle_cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4498  			error = binder_clear_freeze_notification(proc, thread, &handle_cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4499  			if (error)
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4500  				return error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4501  		} break;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4502  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4503  		case BC_FREEZE_NOTIFICATION_DONE: {
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4504  			binder_uintptr_t cookie;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4505  			int error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4506  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4507  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4508  				return -EFAULT;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4509  
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4510  			ptr += sizeof(cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4511  			error = binder_freeze_notification_done(proc, thread, cookie);
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4512  			if (error)
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4513  				return error;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4514  		} break;
d579b04a52a183d drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4515  
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4516  		default:
da4864962d768b3 drivers/android/binder.c         Carlos Llamas          2022-05-09  4517  			pr_err("%d:%d unknown command %u\n",
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4518  			       proc->pid, thread->pid, cmd);
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4519  			return -EINVAL;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4520  		}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4521  		*consumed = ptr - buffer;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4522  	}
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4523  	return 0;
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4524  }
355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4525  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
