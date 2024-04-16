Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72C36E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226060; cv=none; b=LMb5RCmYAC3R5UD6SNbAH7umhnnQNVKoLyIpJmvK5LMVkKqjEemd0IJTRPE8c1u5mOlSLsd0UpyRT0dPXnRxKDXACWhcKUQe7gIy4wXwiWr8HMO9odeNO/djw2L1n8PQ0OtGBSxvBczF98kJYKGogNke+bo4n5hMuDydn28OfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226060; c=relaxed/simple;
	bh=8FSPQV7Ht+7KCf7M7XBpfq/hQiDYcuZREdHdzy8vMWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4rdH5J9gukYEP/6tJz9ZC71nsXPb2e5pk3EeBzh5+NrodECdRpp0JmkkEgopq2wPcmDqvRhlETMEJAKDAqo3WwMO52QfWK2retdH5+Jo/Esxn79ojw/XqPsOYzxsyBeIe5jCkb55LNnh/VHUR36v6dlnF9hlddk6NJzejyes/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIe6whdx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIe6whdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226059; x=1744762059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FSPQV7Ht+7KCf7M7XBpfq/hQiDYcuZREdHdzy8vMWE=;
  b=lIe6whdxb8wIAUO5kwyfKE9gBbWn0eFrnIpWpbdqrcWx4wqjriEbk7un
   Pqezin3jOewnVwtPdQthTog0otyRTMZMDAvmTKWIXL1J6KbPa+1AmqmZM
   USTBQ4w/vIfmIafxjEJN/pdKBecaYvT/M1lUJpyOj3ls9jyKqWww3nyfQ
   42VhMYwUTG6aaOgjXmQiOXsbTLz/xA64y4Fb+yhl/wtuSjGOZOXU6+Y5g
   8qb+t70N7+FdGjPj4Q+8TkQpOS0yaleKjRd5G9k8lBT930XyRFK8KaJTz
   bmLfc+i1Av7Yv2clTV6U+V8tigt+fVGWnthc+wPpOuo1K9KFG2IbENKjO
   w==;
X-CSE-ConnectionGUID: UF90RQVBSUWVUSWZ9JE6+Q==
X-CSE-MsgGUID: GED/6Zc/QMa8CCMSApZGeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12421769"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="12421769"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:07:37 -0700
X-CSE-ConnectionGUID: CoKDb1mZRYuyt8W9arHFkg==
X-CSE-MsgGUID: IvcET4dsQO63UxmN75w9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22158227"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2024 17:07:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWMI-0004k2-0L;
	Tue, 16 Apr 2024 00:07:34 +0000
Date: Tue, 16 Apr 2024 08:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 81/438] kernel/trace/trace_osnoise.c:2221
 osnoise_options_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202404160705.XjbuMswh-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   fe753ea36f846c5a5638f1db502ba023e76132ae
commit: 0a8611a070841cdb5c2d20eb33f56ef5b1a9951b [81/438] tracing: convert to read/write iterators
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-141-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160705.XjbuMswh-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404160705.XjbuMswh-lkp@intel.com/

smatch warnings:
kernel/trace/trace_osnoise.c:2221 osnoise_options_write() warn: potential spectre issue 'buf' [w]

vim +/buf +2221 kernel/trace/trace_osnoise.c

b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2198  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2199  /**
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2200   * osnoise_options_write - Write function for "options" entry
0a8611a070841c Jens Axboe                 2024-04-08  2201   * @iocb: Metadata for IO
0a8611a070841c Jens Axboe                 2024-04-08  2202   * @from: The user buffer that contains the value to write
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2203   *
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2204   * Writing the option name sets the option, writing the "NO_"
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2205   * prefix in front of the option name disables it.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2206   *
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2207   * Writing "DEFAULTS" resets the option values to the default ones.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2208   */
0a8611a070841c Jens Axboe                 2024-04-08  2209  static ssize_t osnoise_options_write(struct kiocb *iocb, struct iov_iter *from)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2210  {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2211  	int running, option, enable, retval;
0a8611a070841c Jens Axboe                 2024-04-08  2212  	size_t cnt = iov_iter_count(from);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2213  	char buf[256], *option_str;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2214  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2215  	if (cnt >= 256)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2216  		return -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2217  
0a8611a070841c Jens Axboe                 2024-04-08  2218  	if (!copy_from_iter_full(buf, cnt, from))
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2219  		return -EFAULT;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2220  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17 @2221  	buf[cnt] = 0;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2222  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2223  	if (strncmp(buf, "NO_", 3)) {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2224  		option_str = strstrip(buf);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2225  		enable = true;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2226  	} else {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2227  		option_str = strstrip(&buf[3]);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2228  		enable = false;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2229  	}
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2230  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2231  	option = match_string(osnoise_options_str, OSN_MAX, option_str);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2232  	if (option < 0)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2233  		return -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2234  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2235  	/*
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2236  	 * trace_types_lock is taken to avoid concurrency on start/stop.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2237  	 */
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2238  	mutex_lock(&trace_types_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2239  	running = osnoise_has_registered_instances();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2240  	if (running)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2241  		stop_per_cpu_kthreads();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2242  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2243  	mutex_lock(&interface_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2244  	/*
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2245  	 * avoid CPU hotplug operations that might read options.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2246  	 */
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2247  	cpus_read_lock();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2248  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2249  	retval = cnt;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2250  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2251  	if (enable) {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2252  		if (option == OSN_DEFAULTS)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2253  			osnoise_options = OSN_DEFAULT_OPTIONS;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2254  		else
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2255  			set_bit(option, &osnoise_options);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2256  	} else {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2257  		if (option == OSN_DEFAULTS)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2258  			retval = -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2259  		else
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2260  			clear_bit(option, &osnoise_options);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2261  	}
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2262  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2263  	cpus_read_unlock();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2264  	mutex_unlock(&interface_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2265  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2266  	if (running)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2267  		start_per_cpu_kthreads();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2268  	mutex_unlock(&trace_types_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2269  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2270  	return retval;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2271  }
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2272  

:::::: The code at line 2221 was first introduced by commit
:::::: b179d48b6aab21f3999f5006685ea4254c0618a9 tracing/osnoise: Add osnoise/options file

:::::: TO: Daniel Bristot de Oliveira <bristot@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
