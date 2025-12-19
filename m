Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558867262B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131269; cv=none; b=TuATPN+7jXZPH6RIVa0lxclBWDEAm7nc9YLDw4ZmoInSscZ92MVZz6NgFfvHL/SSaolkydD3LjVbrd5mCydgmabo0aX8X8CHyufEq88v054ZtJIBdJVAnrs9ThBm7dUAiLZBU8ipKnXIkNeLg95QWwtbCFTZ/v/Of2h4K8mjYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131269; c=relaxed/simple;
	bh=OQd/TbLx7XDbc4Vo4eC0pB+MSiaIyVRvFDcJBrM+XV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jq0LxUZQKj///ejTBr3EUFZAQRowI3xirAObXxiXmg+hTSk76rL9udXrDUvZn41IY32a5iBoqmru72FkbNZ8x3yDHqcJsdnL2SXwJyU+tkbZV1/iXADdnsUdyDI+qtSFyz0jZoeuyR0NwEVnjIcMlK6tRf/KDigOkVhGp6TpRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Boh+M573; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Boh+M573"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766131267; x=1797667267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQd/TbLx7XDbc4Vo4eC0pB+MSiaIyVRvFDcJBrM+XV4=;
  b=Boh+M573JK+0SlBQ1TJ7Ur+y7VMNLc5DefRTYFLK2Nfk7HwR+GzVoiNw
   loud7G9w1fB2DDR+g7rAW9dSgB3oVjBFbElzurUvm/uAj6T/cMVdHFGhw
   orPj+RBc9qucvXVcN3pIapvdo1hX9EBTV9fZwV6JgWdhQI6+uL0Ew5/lY
   d/2TqJTORe5fe7UXJO9iUOOOr+sNlfuo3NeciupswGooo78yszSWtBYOn
   msv49o9K4ECu+r+euI4GUhrl9AOFVV7qAVkQKAO1pfsk++EZvFGZ7pdDx
   dK957qGUtpS7/JOAxYR6FFBBcx7qfvM/bkZW//de8GuBhpotNmWhVB/LO
   A==;
X-CSE-ConnectionGUID: AbGt+RZkSVWh9DROGztt6A==
X-CSE-MsgGUID: wzID8EJ6S8SQ7wHkG16m5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85675956"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="85675956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 00:01:04 -0800
X-CSE-ConnectionGUID: Fjdap3zxTLupWfaPk1tzyg==
X-CSE-MsgGUID: BHRc3MKhQXyGCCCENpbIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198709906"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2025 00:01:03 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWVQ5-000000003FF-1QTL;
	Fri, 19 Dec 2025 08:01:01 +0000
Date: Fri, 19 Dec 2025 16:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <202512191559.0oHMB8eD-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [43/43] ANDROID: ring-buffer: Introducing external writer support
:::::: branch date: 22 hours ago
:::::: commit date: 2 years, 11 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191559.0oHMB8eD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191559.0oHMB8eD-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2172)

vim +/buffer +2177 kernel/trace/ring_buffer.c

438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2154  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2155  /**
7a8e76a3829f10 Steven Rostedt            2008-09-29  2156   * ring_buffer_resize - resize the ring buffer
7a8e76a3829f10 Steven Rostedt            2008-09-29  2157   * @buffer: the buffer to resize.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2158   * @size: the new size.
d611851b421731 zhangwei(Jovi             2013-07-15  2159)  * @cpu_id: the cpu buffer to resize
7a8e76a3829f10 Steven Rostedt            2008-09-29  2160   *
7a8e76a3829f10 Steven Rostedt            2008-09-29  2161   * Minimum size is 2 * BUF_PAGE_SIZE.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2162   *
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2163   * Returns 0 on success and < 0 on failure.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2164   */
13292494379f92 Steven Rostedt (VMware    2019-12-13  2165) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2166  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2167  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2168  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2169) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2170  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2171  
5ecbcb61e172d8 Vincent Donnefort         2022-08-24 @2172  	if (unlikely(has_ext_writer(buffer)))
5ecbcb61e172d8 Vincent Donnefort         2022-08-24  2173  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2174  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2175  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2176  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2177  	if (!buffer)
0a1754b2a97efa Qiujun Huang              2020-10-19  2178  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2179  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2180  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2181  	if (cpu_id != RING_BUFFER_ALL_CPUS &&
6a31e1f135d1ab Steven Rostedt            2012-05-23  2182  	    !cpumask_test_cpu(cpu_id, buffer->cpumask))
0a1754b2a97efa Qiujun Huang              2020-10-19  2183  		return 0;
6a31e1f135d1ab Steven Rostedt            2012-05-23  2184  
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2185) 	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2186  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2187  	/* we need a minimum of two pages */
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2188) 	if (nr_pages < 2)
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2189) 		nr_pages = 2;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2190  
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2191) 	/* prevent another thread from changing buffer sizes */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2192) 	mutex_lock(&buffer->mutex);
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2193) 
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2194) 
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2195) 	if (cpu_id == RING_BUFFER_ALL_CPUS) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2196  		/*
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2197  		 * Don't succeed if resizing is disabled, as a reader might be
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2198  		 * manipulating the ring buffer and is expecting a sane state while
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2199  		 * this is true.
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2200  		 */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2201) 		for_each_buffer_cpu(buffer, cpu) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2202) 			cpu_buffer = buffer->buffers[cpu];
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2203) 			if (atomic_read(&cpu_buffer->resize_disabled)) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2204) 				err = -EBUSY;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2205) 				goto out_err_unlock;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2206) 			}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2207) 		}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2208  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2209  		/* calculate the pages to update */
7a8e76a3829f10 Steven Rostedt            2008-09-29  2210  		for_each_buffer_cpu(buffer, cpu) {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2211  			cpu_buffer = buffer->buffers[cpu];
7a8e76a3829f10 Steven Rostedt            2008-09-29  2212  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2213  			cpu_buffer->nr_pages_to_update = nr_pages -
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2214  							cpu_buffer->nr_pages;
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2215  			/*
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2216  			 * nothing more to do for removing pages or no update
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2217  			 */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2218  			if (cpu_buffer->nr_pages_to_update <= 0)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2219  				continue;
d7ec4bfed6c974 Vaibhav Nagarnaik         2011-06-07  2220  			/*
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2221  			 * to add pages, make sure all new pages can be
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2222  			 * allocated without receiving ENOMEM
d7ec4bfed6c974 Vaibhav Nagarnaik         2011-06-07  2223  			 */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2224  			INIT_LIST_HEAD(&cpu_buffer->new_pages);
74e2afc6df5782 Qiujun Huang              2020-10-15  2225  			if (__rb_allocate_pages(cpu_buffer, cpu_buffer->nr_pages_to_update,
74e2afc6df5782 Qiujun Huang              2020-10-15  2226  						&cpu_buffer->new_pages)) {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2227  				/* not enough memory for new pages */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2228  				err = -ENOMEM;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2229  				goto out_err;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2230  			}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2231  		}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2232  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2233  		cpus_read_lock();
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2234  		/*
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2235  		 * Fire off all the required work handlers
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2236  		 * We can't schedule on offline CPUs, but it's not necessary
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2237  		 * since we can change their buffer sizes without any race.
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2238  		 */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2239  		for_each_buffer_cpu(buffer, cpu) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2240  			cpu_buffer = buffer->buffers[cpu];
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2241  			if (!cpu_buffer->nr_pages_to_update)
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2242  				continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2243  
021c5b34452d52 Corey Minyard             2014-07-16  2244  			/* Can't run something on an offline CPU. */
021c5b34452d52 Corey Minyard             2014-07-16  2245  			if (!cpu_online(cpu)) {
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2246) 				rb_update_pages(cpu_buffer);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2247) 				cpu_buffer->nr_pages_to_update = 0;
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2248) 			} else {
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2249  				schedule_work_on(cpu,
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2250  						&cpu_buffer->update_pages_work);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2251) 			}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2252  		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2253  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2254  		/* wait for all the updates to complete */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2255  		for_each_buffer_cpu(buffer, cpu) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2256  			cpu_buffer = buffer->buffers[cpu];
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2257  			if (!cpu_buffer->nr_pages_to_update)
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2258  				continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2259  
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2260  			if (cpu_online(cpu))
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2261  				wait_for_completion(&cpu_buffer->update_done);
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2262  			cpu_buffer->nr_pages_to_update = 0;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2263  		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2264  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2265  		cpus_read_unlock();
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2266  	} else {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2267  		cpu_buffer = buffer->buffers[cpu_id];
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2268  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2269  		if (nr_pages == cpu_buffer->nr_pages)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2270  			goto out;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2271  
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2272) 		/*
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2273) 		 * Don't succeed if resizing is disabled, as a reader might be
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2274) 		 * manipulating the ring buffer and is expecting a sane state while
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2275) 		 * this is true.
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2276) 		 */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2277) 		if (atomic_read(&cpu_buffer->resize_disabled)) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2278) 			err = -EBUSY;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2279) 			goto out_err_unlock;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2280) 		}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2281) 
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2282  		cpu_buffer->nr_pages_to_update = nr_pages -
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2283  						cpu_buffer->nr_pages;
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2284  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2285  		INIT_LIST_HEAD(&cpu_buffer->new_pages);
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2286  		if (cpu_buffer->nr_pages_to_update > 0 &&
74e2afc6df5782 Qiujun Huang              2020-10-15  2287  			__rb_allocate_pages(cpu_buffer, cpu_buffer->nr_pages_to_update,
74e2afc6df5782 Qiujun Huang              2020-10-15  2288  					    &cpu_buffer->new_pages)) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2289  			err = -ENOMEM;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2290  			goto out_err;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2291  		}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2292  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2293  		cpus_read_lock();
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2294  
021c5b34452d52 Corey Minyard             2014-07-16  2295  		/* Can't run something on an offline CPU. */
021c5b34452d52 Corey Minyard             2014-07-16  2296  		if (!cpu_online(cpu_id))
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2297) 			rb_update_pages(cpu_buffer);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2298) 		else {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2299  			schedule_work_on(cpu_id,
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2300  					 &cpu_buffer->update_pages_work);
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2301  			wait_for_completion(&cpu_buffer->update_done);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2302) 		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2303  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2304  		cpu_buffer->nr_pages_to_update = 0;
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2305  		cpus_read_unlock();
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2306  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2307  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2308   out:
659f451ff21315 Steven Rostedt            2012-05-14  2309  	/*
659f451ff21315 Steven Rostedt            2012-05-14  2310  	 * The ring buffer resize can happen with the ring buffer
659f451ff21315 Steven Rostedt            2012-05-14  2311  	 * enabled, so that the update disturbs the tracing as little
659f451ff21315 Steven Rostedt            2012-05-14  2312  	 * as possible. But if the buffer is disabled, we do not need
659f451ff21315 Steven Rostedt            2012-05-14  2313  	 * to worry about that, and we can take the time to verify
659f451ff21315 Steven Rostedt            2012-05-14  2314  	 * that the buffer is not corrupt.
659f451ff21315 Steven Rostedt            2012-05-14  2315  	 */
659f451ff21315 Steven Rostedt            2012-05-14  2316  	if (atomic_read(&buffer->record_disabled)) {
659f451ff21315 Steven Rostedt            2012-05-14  2317  		atomic_inc(&buffer->record_disabled);
659f451ff21315 Steven Rostedt            2012-05-14  2318  		/*
659f451ff21315 Steven Rostedt            2012-05-14  2319  		 * Even though the buffer was disabled, we must make sure
659f451ff21315 Steven Rostedt            2012-05-14  2320  		 * that it is truly disabled before calling rb_check_pages.
659f451ff21315 Steven Rostedt            2012-05-14  2321  		 * There could have been a race between checking
659f451ff21315 Steven Rostedt            2012-05-14  2322  		 * record_disable and incrementing it.
659f451ff21315 Steven Rostedt            2012-05-14  2323  		 */
7440172974e85b Paul E. McKenney          2018-11-06  2324  		synchronize_rcu();
659f451ff21315 Steven Rostedt            2012-05-14  2325  		for_each_buffer_cpu(buffer, cpu) {
659f451ff21315 Steven Rostedt            2012-05-14  2326  			cpu_buffer = buffer->buffers[cpu];
659f451ff21315 Steven Rostedt            2012-05-14  2327  			rb_check_pages(cpu_buffer);
659f451ff21315 Steven Rostedt            2012-05-14  2328  		}
659f451ff21315 Steven Rostedt            2012-05-14  2329  		atomic_dec(&buffer->record_disabled);
659f451ff21315 Steven Rostedt            2012-05-14  2330  	}
659f451ff21315 Steven Rostedt            2012-05-14  2331  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2332  	mutex_unlock(&buffer->mutex);
0a1754b2a97efa Qiujun Huang              2020-10-19  2333  	return 0;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2334  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2335   out_err:
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2336  	for_each_buffer_cpu(buffer, cpu) {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2337  		struct buffer_page *bpage, *tmp;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2338  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2339  		cpu_buffer = buffer->buffers[cpu];
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2340  		cpu_buffer->nr_pages_to_update = 0;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2341  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2342  		if (list_empty(&cpu_buffer->new_pages))
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2343  			continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2344  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2345  		list_for_each_entry_safe(bpage, tmp, &cpu_buffer->new_pages,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2346  					list) {
044fa782ebb947 Steven Rostedt            2008-12-02  2347  			list_del_init(&bpage->list);
044fa782ebb947 Steven Rostedt            2008-12-02  2348  			free_buffer_page(bpage);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2349  		}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2350  	}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2351)  out_err_unlock:
641d2f63cfe245 Vegard Nossum             2008-11-18  2352  	mutex_unlock(&buffer->mutex);
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2353  	return err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2354  }
c4f50183f90fb1 Robert Richter            2008-12-11  2355  EXPORT_SYMBOL_GPL(ring_buffer_resize);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2356  

:::::: The code at line 2177 was first introduced by commit
:::::: ee51a1de7e3837577412be269e0100038068e691 tracing: fix mmiotrace resizing crash

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
