Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E037493
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX313gyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709136; x=1732245136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X3PqZLs932+9FZZ3W2P4HuD3YVPRquq+eaYu1btSqww=;
  b=mX313gyIYwnlt3s+j7+j80QWYwwonaUVqnLdmDGX8mSuL/YV91VfVn5M
   8zn9DRtU6yMLH0ydpGFS0OpQk5aBBFywwl5tojJ73TqfcMwVXL21de6hl
   6mwnTw/Lqp61lEzIzmsyn0Yf5gcIflH9yZ5QDnbv+ZxlOYscAWI4f3Xdl
   bHixUgRnlZq6PpoN+camuHt26Br10/WWpP2RkFypeUFAi5CubNF2gyvjC
   dBmjXmR8CJqH16CWpqeS/vlJSREUmEwz00N7qx41MPVQLdX+q/Br0zr5j
   37TuQMA7EL0HQhwlIjGrI2NCMUV8yqdFs2v2QUlyGHCngHSpi7HnA/48B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13744885"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13744885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8712759"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608Q-0001A3-0L;
	Thu, 23 Nov 2023 03:12:10 +0000
Date: Thu, 23 Nov 2023 11:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:507
 vchiq_ioc_await_completion() warn: inconsistent indenting
Message-ID: <202311230705.w4DPJjm0-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Umang Jain <umang.jain@ideasonboard.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b6de136b5f0158c60844f85286a593cb70fb364
commit: 1d8915cf889932e085880f4bdbf7ae0f3d8605e5 staging: vc04: Convert vchiq_log_error() to use dynamic debug
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311230705.w4DPJjm0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230705.w4DPJjm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311230705.w4DPJjm0-lkp@intel.com/

smatch warnings:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:507 vchiq_ioc_await_completion() warn: inconsistent indenting

vim +507 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

f05916281fd75db Ojaswin Mujoo   2021-07-21  431  
f05916281fd75db Ojaswin Mujoo   2021-07-21  432  static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
f05916281fd75db Ojaswin Mujoo   2021-07-21  433  				      struct vchiq_await_completion *args,
f05916281fd75db Ojaswin Mujoo   2021-07-21  434  				      int __user *msgbufcountp)
f05916281fd75db Ojaswin Mujoo   2021-07-21  435  {
f05916281fd75db Ojaswin Mujoo   2021-07-21  436  	int msgbufcount;
f05916281fd75db Ojaswin Mujoo   2021-07-21  437  	int remove;
f05916281fd75db Ojaswin Mujoo   2021-07-21  438  	int ret;
f05916281fd75db Ojaswin Mujoo   2021-07-21  439  
8dd56723240e431 Gaston Gonzalez 2021-10-24  440  	DEBUG_INITIALISE(g_state.local);
f05916281fd75db Ojaswin Mujoo   2021-07-21  441  
f05916281fd75db Ojaswin Mujoo   2021-07-21  442  	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
cfb24b67bfd6b7c Gaston Gonzalez 2021-09-12  443  	if (!instance->connected)
f05916281fd75db Ojaswin Mujoo   2021-07-21  444  		return -ENOTCONN;
f05916281fd75db Ojaswin Mujoo   2021-07-21  445  
f05916281fd75db Ojaswin Mujoo   2021-07-21  446  	mutex_lock(&instance->completion_mutex);
f05916281fd75db Ojaswin Mujoo   2021-07-21  447  
f05916281fd75db Ojaswin Mujoo   2021-07-21  448  	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
8757f705d936ad9 Gaston Gonzalez 2021-09-12  449  	while ((instance->completion_remove == instance->completion_insert) && !instance->closing) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  450  		int rc;
f05916281fd75db Ojaswin Mujoo   2021-07-21  451  
f05916281fd75db Ojaswin Mujoo   2021-07-21  452  		DEBUG_TRACE(AWAIT_COMPLETION_LINE);
f05916281fd75db Ojaswin Mujoo   2021-07-21  453  		mutex_unlock(&instance->completion_mutex);
8757f705d936ad9 Gaston Gonzalez 2021-09-12  454  		rc = wait_for_completion_interruptible(&instance->insert_event);
f05916281fd75db Ojaswin Mujoo   2021-07-21  455  		mutex_lock(&instance->completion_mutex);
f05916281fd75db Ojaswin Mujoo   2021-07-21  456  		if (rc) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  457  			DEBUG_TRACE(AWAIT_COMPLETION_LINE);
f05916281fd75db Ojaswin Mujoo   2021-07-21  458  			vchiq_log_info(vchiq_arm_log_level,
f05916281fd75db Ojaswin Mujoo   2021-07-21  459  				       "AWAIT_COMPLETION interrupted");
f05916281fd75db Ojaswin Mujoo   2021-07-21  460  			ret = -EINTR;
f05916281fd75db Ojaswin Mujoo   2021-07-21  461  			goto out;
f05916281fd75db Ojaswin Mujoo   2021-07-21  462  		}
f05916281fd75db Ojaswin Mujoo   2021-07-21  463  	}
f05916281fd75db Ojaswin Mujoo   2021-07-21  464  	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
f05916281fd75db Ojaswin Mujoo   2021-07-21  465  
f05916281fd75db Ojaswin Mujoo   2021-07-21  466  	msgbufcount = args->msgbufcount;
f05916281fd75db Ojaswin Mujoo   2021-07-21  467  	remove = instance->completion_remove;
f05916281fd75db Ojaswin Mujoo   2021-07-21  468  
f05916281fd75db Ojaswin Mujoo   2021-07-21  469  	for (ret = 0; ret < args->count; ret++) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  470  		struct vchiq_completion_data_kernel *completion;
f05916281fd75db Ojaswin Mujoo   2021-07-21  471  		struct vchiq_completion_data user_completion;
f05916281fd75db Ojaswin Mujoo   2021-07-21  472  		struct vchiq_service *service;
f05916281fd75db Ojaswin Mujoo   2021-07-21  473  		struct user_service *user_service;
f05916281fd75db Ojaswin Mujoo   2021-07-21  474  		struct vchiq_header *header;
f05916281fd75db Ojaswin Mujoo   2021-07-21  475  
f05916281fd75db Ojaswin Mujoo   2021-07-21  476  		if (remove == instance->completion_insert)
f05916281fd75db Ojaswin Mujoo   2021-07-21  477  			break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  478  
8757f705d936ad9 Gaston Gonzalez 2021-09-12  479  		completion = &instance->completions[remove & (MAX_COMPLETIONS - 1)];
f05916281fd75db Ojaswin Mujoo   2021-07-21  480  
f05916281fd75db Ojaswin Mujoo   2021-07-21  481  		/*
f05916281fd75db Ojaswin Mujoo   2021-07-21  482  		 * A read memory barrier is needed to stop
f05916281fd75db Ojaswin Mujoo   2021-07-21  483  		 * prefetch of a stale completion record
f05916281fd75db Ojaswin Mujoo   2021-07-21  484  		 */
f05916281fd75db Ojaswin Mujoo   2021-07-21  485  		rmb();
f05916281fd75db Ojaswin Mujoo   2021-07-21  486  
f05916281fd75db Ojaswin Mujoo   2021-07-21  487  		service = completion->service_userdata;
f05916281fd75db Ojaswin Mujoo   2021-07-21  488  		user_service = service->base.userdata;
f05916281fd75db Ojaswin Mujoo   2021-07-21  489  
f05916281fd75db Ojaswin Mujoo   2021-07-21  490  		memset(&user_completion, 0, sizeof(user_completion));
f05916281fd75db Ojaswin Mujoo   2021-07-21  491  		user_completion = (struct vchiq_completion_data) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  492  			.reason = completion->reason,
f05916281fd75db Ojaswin Mujoo   2021-07-21  493  			.service_userdata = user_service->userdata,
f05916281fd75db Ojaswin Mujoo   2021-07-21  494  		};
f05916281fd75db Ojaswin Mujoo   2021-07-21  495  
f05916281fd75db Ojaswin Mujoo   2021-07-21  496  		header = completion->header;
f05916281fd75db Ojaswin Mujoo   2021-07-21  497  		if (header) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  498  			void __user *msgbuf;
f05916281fd75db Ojaswin Mujoo   2021-07-21  499  			int msglen;
f05916281fd75db Ojaswin Mujoo   2021-07-21  500  
f05916281fd75db Ojaswin Mujoo   2021-07-21  501  			msglen = header->size + sizeof(struct vchiq_header);
f05916281fd75db Ojaswin Mujoo   2021-07-21  502  			/* This must be a VCHIQ-style service */
f05916281fd75db Ojaswin Mujoo   2021-07-21  503  			if (args->msgbufsize < msglen) {
1d8915cf889932e Umang Jain      2023-10-24  504  				vchiq_log_error(service->state->dev, VCHIQ_ARM,
f05916281fd75db Ojaswin Mujoo   2021-07-21  505  						"header %pK: msgbufsize %x < msglen %x",
f05916281fd75db Ojaswin Mujoo   2021-07-21  506  						header, args->msgbufsize, msglen);
f05916281fd75db Ojaswin Mujoo   2021-07-21 @507  						WARN(1, "invalid message size\n");
f05916281fd75db Ojaswin Mujoo   2021-07-21  508  				if (ret == 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  509  					ret = -EMSGSIZE;
f05916281fd75db Ojaswin Mujoo   2021-07-21  510  				break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  511  			}
f05916281fd75db Ojaswin Mujoo   2021-07-21  512  			if (msgbufcount <= 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  513  				/* Stall here for lack of a buffer for the message. */
f05916281fd75db Ojaswin Mujoo   2021-07-21  514  				break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  515  			/* Get the pointer from user space */
f05916281fd75db Ojaswin Mujoo   2021-07-21  516  			msgbufcount--;
f05916281fd75db Ojaswin Mujoo   2021-07-21  517  			if (vchiq_get_user_ptr(&msgbuf, args->msgbufs,
f05916281fd75db Ojaswin Mujoo   2021-07-21  518  					       msgbufcount)) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  519  				if (ret == 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  520  					ret = -EFAULT;
f05916281fd75db Ojaswin Mujoo   2021-07-21  521  				break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  522  			}
f05916281fd75db Ojaswin Mujoo   2021-07-21  523  
f05916281fd75db Ojaswin Mujoo   2021-07-21  524  			/* Copy the message to user space */
f05916281fd75db Ojaswin Mujoo   2021-07-21  525  			if (copy_to_user(msgbuf, header, msglen)) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  526  				if (ret == 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  527  					ret = -EFAULT;
f05916281fd75db Ojaswin Mujoo   2021-07-21  528  				break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  529  			}
f05916281fd75db Ojaswin Mujoo   2021-07-21  530  
f05916281fd75db Ojaswin Mujoo   2021-07-21  531  			/* Now it has been copied, the message can be released. */
14780bb174266e1 Adrien Thierry  2022-05-18  532  			vchiq_release_message(instance, service->handle, header);
f05916281fd75db Ojaswin Mujoo   2021-07-21  533  
f05916281fd75db Ojaswin Mujoo   2021-07-21  534  			/* The completion must point to the msgbuf. */
f05916281fd75db Ojaswin Mujoo   2021-07-21  535  			user_completion.header = msgbuf;
f05916281fd75db Ojaswin Mujoo   2021-07-21  536  		}
f05916281fd75db Ojaswin Mujoo   2021-07-21  537  
f05916281fd75db Ojaswin Mujoo   2021-07-21  538  		if ((completion->reason == VCHIQ_SERVICE_CLOSED) &&
f05916281fd75db Ojaswin Mujoo   2021-07-21  539  		    !instance->use_close_delivered)
f05916281fd75db Ojaswin Mujoo   2021-07-21  540  			vchiq_service_put(service);
f05916281fd75db Ojaswin Mujoo   2021-07-21  541  
f05916281fd75db Ojaswin Mujoo   2021-07-21  542  		/*
f05916281fd75db Ojaswin Mujoo   2021-07-21  543  		 * FIXME: address space mismatch, does bulk_userdata
f05916281fd75db Ojaswin Mujoo   2021-07-21  544  		 * actually point to user or kernel memory?
f05916281fd75db Ojaswin Mujoo   2021-07-21  545  		 */
f05916281fd75db Ojaswin Mujoo   2021-07-21  546  		user_completion.bulk_userdata = completion->bulk_userdata;
f05916281fd75db Ojaswin Mujoo   2021-07-21  547  
f05916281fd75db Ojaswin Mujoo   2021-07-21  548  		if (vchiq_put_completion(args->buf, &user_completion, ret)) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  549  			if (ret == 0)
f05916281fd75db Ojaswin Mujoo   2021-07-21  550  				ret = -EFAULT;
f05916281fd75db Ojaswin Mujoo   2021-07-21  551  			break;
f05916281fd75db Ojaswin Mujoo   2021-07-21  552  		}
f05916281fd75db Ojaswin Mujoo   2021-07-21  553  
f05916281fd75db Ojaswin Mujoo   2021-07-21  554  		/*
f05916281fd75db Ojaswin Mujoo   2021-07-21  555  		 * Ensure that the above copy has completed
f05916281fd75db Ojaswin Mujoo   2021-07-21  556  		 * before advancing the remove pointer.
f05916281fd75db Ojaswin Mujoo   2021-07-21  557  		 */
f05916281fd75db Ojaswin Mujoo   2021-07-21  558  		mb();
f05916281fd75db Ojaswin Mujoo   2021-07-21  559  		remove++;
f05916281fd75db Ojaswin Mujoo   2021-07-21  560  		instance->completion_remove = remove;
f05916281fd75db Ojaswin Mujoo   2021-07-21  561  	}
f05916281fd75db Ojaswin Mujoo   2021-07-21  562  
f05916281fd75db Ojaswin Mujoo   2021-07-21  563  	if (msgbufcount != args->msgbufcount) {
f05916281fd75db Ojaswin Mujoo   2021-07-21  564  		if (put_user(msgbufcount, msgbufcountp))
f05916281fd75db Ojaswin Mujoo   2021-07-21  565  			ret = -EFAULT;
f05916281fd75db Ojaswin Mujoo   2021-07-21  566  	}
f05916281fd75db Ojaswin Mujoo   2021-07-21  567  out:
f05916281fd75db Ojaswin Mujoo   2021-07-21  568  	if (ret)
f05916281fd75db Ojaswin Mujoo   2021-07-21  569  		complete(&instance->remove_event);
f05916281fd75db Ojaswin Mujoo   2021-07-21  570  	mutex_unlock(&instance->completion_mutex);
f05916281fd75db Ojaswin Mujoo   2021-07-21  571  	DEBUG_TRACE(AWAIT_COMPLETION_LINE);
f05916281fd75db Ojaswin Mujoo   2021-07-21  572  
f05916281fd75db Ojaswin Mujoo   2021-07-21  573  	return ret;
f05916281fd75db Ojaswin Mujoo   2021-07-21  574  }
f05916281fd75db Ojaswin Mujoo   2021-07-21  575  

:::::: The code at line 507 was first introduced by commit
:::::: f05916281fd75db2fe32294e26c04d666c762370 staging: vchiq: Move vchiq char driver to its own file

:::::: TO: Ojaswin Mujoo <ojaswin98@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
