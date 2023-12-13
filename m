Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E56E28DBE
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kA7Ro4Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702469170; x=1734005170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dqNqnygXn43bp2PGZTmNfr+5yq4E4F2hnAkeLaeZUw=;
  b=kA7Ro4DmbxO5h2Q4ZgvlU5i1nh8lV21QL5DO+cHqpKo/Qb9RPllvFdEP
   6OVnDsglWQep2f2rvmexzasyAvsOwSN83nvTTg4fusm5DQHPdB846O1l8
   y1JbQZ3SfEYlyON5h+mzlmwRuqz4jKZ1EbBWqx8mMl2gHGmqrEKxpWMLX
   sbGOuYaS6dc9OJ8VzwVSL55ea7nsWNIB+s/989loRwhM/oylJIfDaqbUS
   WVxrUKS799dCkIAZSezUKwkdakCiD6xtZmdcphFcEPjZTEVg1duHDIYfq
   Mc9fEFDv7KUpqfVx9Pk7nx7MLQOW5dnojFbijmzzH3qQrzal2BHu8jSiB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="13650224"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="13650224"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 04:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947167015"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="947167015"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 04:06:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDO03-000KWN-0n;
	Wed, 13 Dec 2023 12:06:03 +0000
Date: Wed, 13 Dec 2023 20:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [trace:ring-buffer-multi-page-subbufers 30/31]
 kernel/trace/trace.c:7385 tracing_mark_raw_write() error: uninitialized
 symbol 'buffer'.
Message-ID: <202312132036.ySJsgDai-lkp@intel.com>
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
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer-multi-page-subbufers
head:   cf9d2732932a8071635166afd4fd282889edc056
commit: 51ea7c0e6660f763f8bc81abe1ad737594d0f88d [30/31] tracing: Increase size of trace_marker_raw to max ring buffer entry
:::::: branch date: 15 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20231213 (https://download.01.org/0day-ci/archive/20231213/202312132036.ySJsgDai-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312132036.ySJsgDai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312132036.ySJsgDai-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:7385 tracing_mark_raw_write() error: uninitialized symbol 'buffer'.

vim +/buffer +7385 kernel/trace/trace.c

656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7370) 
fa32e8557b470f Steven Rostedt            2016-07-06  7371  	if (tracing_disabled)
fa32e8557b470f Steven Rostedt            2016-07-06  7372  		return -EINVAL;
fa32e8557b470f Steven Rostedt            2016-07-06  7373  
fa32e8557b470f Steven Rostedt            2016-07-06  7374  	if (!(tr->trace_flags & TRACE_ITER_MARKERS))
fa32e8557b470f Steven Rostedt            2016-07-06  7375  		return -EINVAL;
fa32e8557b470f Steven Rostedt            2016-07-06  7376  
fa32e8557b470f Steven Rostedt            2016-07-06  7377  	/* The marker must at least have a tag id */
51ea7c0e6660f7 Steven Rostedt (Google    2023-12-09  7378) 	if (cnt < sizeof(unsigned int))
fa32e8557b470f Steven Rostedt            2016-07-06  7379  		return -EINVAL;
fa32e8557b470f Steven Rostedt            2016-07-06  7380  
fa32e8557b470f Steven Rostedt            2016-07-06  7381  	size = sizeof(*entry) + cnt;
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7382) 	if (cnt < FAULT_SIZE_ID)
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7383) 		size += FAULT_SIZE_ID - cnt;
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7384) 
51ea7c0e6660f7 Steven Rostedt (Google    2023-12-09 @7385) 	if (size > ring_buffer_max_event_size(buffer))
51ea7c0e6660f7 Steven Rostedt (Google    2023-12-09  7386) 		return -EINVAL;
51ea7c0e6660f7 Steven Rostedt (Google    2023-12-09  7387) 
1c5eb4481e0151 Steven Rostedt (VMware    2020-01-09  7388) 	buffer = tr->array_buffer.buffer;
3e9a8aadca4807 Steven Rostedt (Red Hat   2016-11-23  7389) 	event = __trace_buffer_lock_reserve(buffer, TRACE_RAW_DATA, size,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  7390  					    tracing_gen_ctx());
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7391) 	if (!event)
fa32e8557b470f Steven Rostedt            2016-07-06  7392  		/* Ring buffer disabled, return as if not open for write */
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7393) 		return -EBADF;
fa32e8557b470f Steven Rostedt            2016-07-06  7394  
fa32e8557b470f Steven Rostedt            2016-07-06  7395  	entry = ring_buffer_event_data(event);
fa32e8557b470f Steven Rostedt            2016-07-06  7396  
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7397) 	len = __copy_from_user_inatomic(&entry->id, ubuf, cnt);
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7398) 	if (len) {
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7399) 		entry->id = -1;
0f5e5a3ab7fa1c Rasmus Villemoes          2019-03-20  7400  		memcpy(&entry->buf, FAULTED_STR, FAULTED_SIZE);
656c7f0d2d2b32 Steven Rostedt (Red Hat   2016-12-08  7401) 		written = -EFAULT;
fa32e8557b470f Steven Rostedt            2016-07-06  7402  	} else
1aa54bca6ee0d0 Marcin Slusarz            2010-07-28  7403  		written = cnt;
1aa54bca6ee0d0 Marcin Slusarz            2010-07-28  7404  
fa32e8557b470f Steven Rostedt            2016-07-06  7405  	__buffer_unlock_commit(buffer, event);
fa32e8557b470f Steven Rostedt            2016-07-06  7406  
1aa54bca6ee0d0 Marcin Slusarz            2010-07-28  7407  	return written;
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  7408  }
5bf9a1ee350a10 Pekka Paalanen            2008-09-16  7409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
