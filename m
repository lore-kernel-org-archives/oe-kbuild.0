Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255025569
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726546429; cv=none; b=D8QFAdfU6Uq3R/5a8K/+KGBUh2dOFVkFo4IXqH8ylGbBUL4gUaMlrfGmryrA4A/xZuPGVj7HtEkJlbOxs8aofH2zSCbfXZvBV7znLiNXc2KOYh+eQYZU7itcIXptp3aKU+KurhrnXPtKAZVJIRB7nvrbsrS8Dh4f+3LXSgXhwbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726546429; c=relaxed/simple;
	bh=WH7f07Q8WQvZdQYxc7akdMzOhrmVn5trlw+FEq7WzbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OlqE8IBmrgl0GFT5nrHawKNMPEMP7XGvzVB3gqYA0puOwPOr5/tQ4uR89906pu2T0WMsy4vskDD4hQrNFsVFkdno1DZod81hiT0jmODNr01Uz75FxDMxLW3w/zBlBJRJ6YbWxcaLpPK2DfRkVPDnB/pgRKJArjN3o6+3+JioYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjpGMnHX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjpGMnHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726546427; x=1758082427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WH7f07Q8WQvZdQYxc7akdMzOhrmVn5trlw+FEq7WzbU=;
  b=LjpGMnHXLPEe+MYw8YiGWnvNRmTMSq6HPrLYi39Uwx6CWAE2mJ2UPd5m
   ZrkmsAWO2ucEvai/sg3cbckIkJkCLJMfdQkgADi3w0596nFQlix/y65ix
   A5nx3ZXs2T0UuRQqUcDD13qzfEQIQS8jRyXNXdNY6yqnpOUb5/M2/r4rh
   DzMRjJEzZ2W7LPstZWSgTjJ5Q5sWF3m/oW/o5JDHjkbAsqbywedtut4P/
   n6GYAIZmc5iyTmj0qOorvwX42W3yUoFY/80Y+r1HOWamJP2hlGDCXnA4L
   QbvB3yoiBOwwXvRK9yJntnwWZeyNUmG6TWoSMg4yMX/uGD00rluePF42C
   Q==;
X-CSE-ConnectionGUID: b3oWDPubQuKFMlbitZDbfQ==
X-CSE-MsgGUID: 1M9tYrp8S/a3wGUD4KnwyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29175033"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="29175033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 21:13:46 -0700
X-CSE-ConnectionGUID: 9R6bOPCPRIeUmL92UDhFYw==
X-CSE-MsgGUID: CNbLdpqdTtOvFZxzXUu3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="99912158"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2024 21:13:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqPax-000Amg-1C;
	Tue, 17 Sep 2024 04:13:43 +0000
Date: Tue, 17 Sep 2024 12:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 80/447] kernel/trace/trace_osnoise.c:2238
 osnoise_options_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202409171206.JuPgi4tP-lkp@intel.com>
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
head:   78e9603229ee010d330a9ca61ef1a62ee7317352
commit: b2e39c5a38c224faac4347cc775789d17c51b0ee [80/447] tracing: convert to read/write iterators
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171206.JuPgi4tP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409171206.JuPgi4tP-lkp@intel.com/

smatch warnings:
kernel/trace/trace_osnoise.c:2238 osnoise_options_write() warn: potential spectre issue 'buf' [w]

vim +/buf +2238 kernel/trace/trace_osnoise.c

b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2215  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2216  /**
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2217   * osnoise_options_write - Write function for "options" entry
b2e39c5a38c224 Jens Axboe                 2024-04-08  2218   * @iocb: Metadata for IO
b2e39c5a38c224 Jens Axboe                 2024-04-08  2219   * @from: The user buffer that contains the value to write
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2220   *
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2221   * Writing the option name sets the option, writing the "NO_"
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2222   * prefix in front of the option name disables it.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2223   *
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2224   * Writing "DEFAULTS" resets the option values to the default ones.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2225   */
b2e39c5a38c224 Jens Axboe                 2024-04-08  2226  static ssize_t osnoise_options_write(struct kiocb *iocb, struct iov_iter *from)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2227  {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2228  	int running, option, enable, retval;
b2e39c5a38c224 Jens Axboe                 2024-04-08  2229  	size_t cnt = iov_iter_count(from);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2230  	char buf[256], *option_str;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2231  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2232  	if (cnt >= 256)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2233  		return -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2234  
b2e39c5a38c224 Jens Axboe                 2024-04-08  2235  	if (!copy_from_iter_full(buf, cnt, from))
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2236  		return -EFAULT;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2237  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17 @2238  	buf[cnt] = 0;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2239  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2240  	if (strncmp(buf, "NO_", 3)) {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2241  		option_str = strstrip(buf);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2242  		enable = true;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2243  	} else {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2244  		option_str = strstrip(&buf[3]);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2245  		enable = false;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2246  	}
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2247  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2248  	option = match_string(osnoise_options_str, OSN_MAX, option_str);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2249  	if (option < 0)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2250  		return -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2251  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2252  	/*
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2253  	 * trace_types_lock is taken to avoid concurrency on start/stop.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2254  	 */
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2255  	mutex_lock(&trace_types_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2256  	running = osnoise_has_registered_instances();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2257  	if (running)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2258  		stop_per_cpu_kthreads();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2259  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2260  	mutex_lock(&interface_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2261  	/*
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2262  	 * avoid CPU hotplug operations that might read options.
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2263  	 */
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2264  	cpus_read_lock();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2265  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2266  	retval = cnt;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2267  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2268  	if (enable) {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2269  		if (option == OSN_DEFAULTS)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2270  			osnoise_options = OSN_DEFAULT_OPTIONS;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2271  		else
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2272  			set_bit(option, &osnoise_options);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2273  	} else {
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2274  		if (option == OSN_DEFAULTS)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2275  			retval = -EINVAL;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2276  		else
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2277  			clear_bit(option, &osnoise_options);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2278  	}
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2279  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2280  	cpus_read_unlock();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2281  	mutex_unlock(&interface_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2282  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2283  	if (running)
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2284  		start_per_cpu_kthreads();
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2285  	mutex_unlock(&trace_types_lock);
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2286  
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2287  	return retval;
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2288  }
b179d48b6aab21 Daniel Bristot de Oliveira 2022-11-17  2289  

:::::: The code at line 2238 was first introduced by commit
:::::: b179d48b6aab21f3999f5006685ea4254c0618a9 tracing/osnoise: Add osnoise/options file

:::::: TO: Daniel Bristot de Oliveira <bristot@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
