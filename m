Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A401078E
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Mar 2023 23:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679440876; x=1710976876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEtYw5WPadHi8f2UUxvtTTYGjWXzLvifdBm0aCwCcho=;
  b=hBCBaXP7DuZ14H0754G/gMcIP5aW9AuFEi4v05Upzve1wg+0qRrQw8Jd
   3Cb6MO4zd+irJGisE4JC4E48Oj+Uw9AmxMahNZjGfVVeIltmaM9MZOurj
   BOEeAHLAvPuCPHyZ4bPxf5IXXhCBr9vMcucobq5GgDmvG50p2qyfJR2+L
   mWTPNUxaEU/8Cx7efhZPrUW2viBHoFAT/eqsZL4aGJE2jstLRsdgufEGF
   84RgR2SKhDPldfivD/072xA3Mno7tigCnqoqPURW/vPGNTKCP2yDt93iY
   AzIOJzTowhaSUCLEcTsPocK1AcEkT0Bj5DW7Y5A4JGfuKEO7uBc27zUmq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327460201"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="327460201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 16:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792307088"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792307088"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 16:21:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pelHn-000CXA-2h;
	Tue, 21 Mar 2023 23:20:59 +0000
Date: Wed, 22 Mar 2023 07:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 2/11] kernel/trace/ring_buffer.c:2141
 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see
 line 2136)
Message-ID: <202303220748.j1ALZI9J-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   01e5d4c8d9b1dc42d6b576c3574398c465ea56a4
commit: 13188635cc6b5d06a3c78b1200d28511b7221385 [2/11] ANDROID: ring-buffer: Introducing external writer support
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230322/202303220748.j1ALZI9J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303220748.j1ALZI9J-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2141 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2136)

vim +/buffer +2141 kernel/trace/ring_buffer.c

438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2118  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2119  /**
7a8e76a3829f10 Steven Rostedt            2008-09-29  2120   * ring_buffer_resize - resize the ring buffer
7a8e76a3829f10 Steven Rostedt            2008-09-29  2121   * @buffer: the buffer to resize.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2122   * @size: the new size.
d611851b421731 zhangwei(Jovi             2013-07-15  2123)  * @cpu_id: the cpu buffer to resize
7a8e76a3829f10 Steven Rostedt            2008-09-29  2124   *
7a8e76a3829f10 Steven Rostedt            2008-09-29  2125   * Minimum size is 2 * BUF_PAGE_SIZE.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2126   *
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2127   * Returns 0 on success and < 0 on failure.
7a8e76a3829f10 Steven Rostedt            2008-09-29  2128   */
13292494379f92 Steven Rostedt (VMware    2019-12-13  2129) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2130  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2131  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2132  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2133) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2134  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2135  
13188635cc6b5d Vincent Donnefort         2022-08-24 @2136  	if (unlikely(has_ext_writer(buffer)))
13188635cc6b5d Vincent Donnefort         2022-08-24  2137  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2138  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2139  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2140  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2141  	if (!buffer)
0a1754b2a97efa Qiujun Huang              2020-10-19  2142  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2143  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2144  	/* Make sure the requested buffer exists */
6a31e1f135d1ab Steven Rostedt            2012-05-23  2145  	if (cpu_id != RING_BUFFER_ALL_CPUS &&
6a31e1f135d1ab Steven Rostedt            2012-05-23  2146  	    !cpumask_test_cpu(cpu_id, buffer->cpumask))
0a1754b2a97efa Qiujun Huang              2020-10-19  2147  		return 0;
6a31e1f135d1ab Steven Rostedt            2012-05-23  2148  
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2149) 	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2150  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2151  	/* we need a minimum of two pages */
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2152) 	if (nr_pages < 2)
59643d1535eb22 Steven Rostedt (Red Hat   2016-05-13  2153) 		nr_pages = 2;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2154  
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2155) 	/* prevent another thread from changing buffer sizes */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2156) 	mutex_lock(&buffer->mutex);
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2157) 
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2158) 
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2159) 	if (cpu_id == RING_BUFFER_ALL_CPUS) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2160  		/*
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2161  		 * Don't succeed if resizing is disabled, as a reader might be
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2162  		 * manipulating the ring buffer and is expecting a sane state while
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2163  		 * this is true.
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2164  		 */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2165) 		for_each_buffer_cpu(buffer, cpu) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2166) 			cpu_buffer = buffer->buffers[cpu];
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2167) 			if (atomic_read(&cpu_buffer->resize_disabled)) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2168) 				err = -EBUSY;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2169) 				goto out_err_unlock;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2170) 			}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2171) 		}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2172  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2173  		/* calculate the pages to update */
7a8e76a3829f10 Steven Rostedt            2008-09-29  2174  		for_each_buffer_cpu(buffer, cpu) {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2175  			cpu_buffer = buffer->buffers[cpu];
7a8e76a3829f10 Steven Rostedt            2008-09-29  2176  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2177  			cpu_buffer->nr_pages_to_update = nr_pages -
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2178  							cpu_buffer->nr_pages;
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2179  			/*
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2180  			 * nothing more to do for removing pages or no update
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2181  			 */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2182  			if (cpu_buffer->nr_pages_to_update <= 0)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2183  				continue;
d7ec4bfed6c974 Vaibhav Nagarnaik         2011-06-07  2184  			/*
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2185  			 * to add pages, make sure all new pages can be
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2186  			 * allocated without receiving ENOMEM
d7ec4bfed6c974 Vaibhav Nagarnaik         2011-06-07  2187  			 */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2188  			INIT_LIST_HEAD(&cpu_buffer->new_pages);
74e2afc6df5782 Qiujun Huang              2020-10-15  2189  			if (__rb_allocate_pages(cpu_buffer, cpu_buffer->nr_pages_to_update,
74e2afc6df5782 Qiujun Huang              2020-10-15  2190  						&cpu_buffer->new_pages)) {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2191  				/* not enough memory for new pages */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2192  				err = -ENOMEM;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2193  				goto out_err;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2194  			}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2195  		}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2196  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2197  		cpus_read_lock();
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2198  		/*
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2199  		 * Fire off all the required work handlers
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2200  		 * We can't schedule on offline CPUs, but it's not necessary
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2201  		 * since we can change their buffer sizes without any race.
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2202  		 */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2203  		for_each_buffer_cpu(buffer, cpu) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2204  			cpu_buffer = buffer->buffers[cpu];
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2205  			if (!cpu_buffer->nr_pages_to_update)
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2206  				continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2207  
021c5b34452d52 Corey Minyard             2014-07-16  2208  			/* Can't run something on an offline CPU. */
021c5b34452d52 Corey Minyard             2014-07-16  2209  			if (!cpu_online(cpu)) {
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2210) 				rb_update_pages(cpu_buffer);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2211) 				cpu_buffer->nr_pages_to_update = 0;
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2212) 			} else {
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2213  				schedule_work_on(cpu,
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2214  						&cpu_buffer->update_pages_work);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2215) 			}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2216  		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2217  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2218  		/* wait for all the updates to complete */
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2219  		for_each_buffer_cpu(buffer, cpu) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2220  			cpu_buffer = buffer->buffers[cpu];
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2221  			if (!cpu_buffer->nr_pages_to_update)
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2222  				continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2223  
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2224  			if (cpu_online(cpu))
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2225  				wait_for_completion(&cpu_buffer->update_done);
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2226  			cpu_buffer->nr_pages_to_update = 0;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2227  		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2228  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2229  		cpus_read_unlock();
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2230  	} else {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2231  		cpu_buffer = buffer->buffers[cpu_id];
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2232  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2233  		if (nr_pages == cpu_buffer->nr_pages)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2234  			goto out;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2235  
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2236) 		/*
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2237) 		 * Don't succeed if resizing is disabled, as a reader might be
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2238) 		 * manipulating the ring buffer and is expecting a sane state while
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2239) 		 * this is true.
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2240) 		 */
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2241) 		if (atomic_read(&cpu_buffer->resize_disabled)) {
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2242) 			err = -EBUSY;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2243) 			goto out_err_unlock;
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2244) 		}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2245) 
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2246  		cpu_buffer->nr_pages_to_update = nr_pages -
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2247  						cpu_buffer->nr_pages;
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2248  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2249  		INIT_LIST_HEAD(&cpu_buffer->new_pages);
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2250  		if (cpu_buffer->nr_pages_to_update > 0 &&
74e2afc6df5782 Qiujun Huang              2020-10-15  2251  			__rb_allocate_pages(cpu_buffer, cpu_buffer->nr_pages_to_update,
74e2afc6df5782 Qiujun Huang              2020-10-15  2252  					    &cpu_buffer->new_pages)) {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2253  			err = -ENOMEM;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2254  			goto out_err;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2255  		}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2256  
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2257  		cpus_read_lock();
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2258  
021c5b34452d52 Corey Minyard             2014-07-16  2259  		/* Can't run something on an offline CPU. */
021c5b34452d52 Corey Minyard             2014-07-16  2260  		if (!cpu_online(cpu_id))
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2261) 			rb_update_pages(cpu_buffer);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2262) 		else {
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2263  			schedule_work_on(cpu_id,
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2264  					 &cpu_buffer->update_pages_work);
05fdd70d2fe1e3 Vaibhav Nagarnaik         2012-05-18  2265  			wait_for_completion(&cpu_buffer->update_done);
f5eb5588262cab Steven Rostedt (Red Hat   2013-03-07  2266) 		}
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2267  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2268  		cpu_buffer->nr_pages_to_update = 0;
99c37d1a63eafc Sebastian Andrzej Siewior 2021-08-03  2269  		cpus_read_unlock();
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2270  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  2271  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2272   out:
659f451ff21315 Steven Rostedt            2012-05-14  2273  	/*
659f451ff21315 Steven Rostedt            2012-05-14  2274  	 * The ring buffer resize can happen with the ring buffer
659f451ff21315 Steven Rostedt            2012-05-14  2275  	 * enabled, so that the update disturbs the tracing as little
659f451ff21315 Steven Rostedt            2012-05-14  2276  	 * as possible. But if the buffer is disabled, we do not need
659f451ff21315 Steven Rostedt            2012-05-14  2277  	 * to worry about that, and we can take the time to verify
659f451ff21315 Steven Rostedt            2012-05-14  2278  	 * that the buffer is not corrupt.
659f451ff21315 Steven Rostedt            2012-05-14  2279  	 */
659f451ff21315 Steven Rostedt            2012-05-14  2280  	if (atomic_read(&buffer->record_disabled)) {
659f451ff21315 Steven Rostedt            2012-05-14  2281  		atomic_inc(&buffer->record_disabled);
659f451ff21315 Steven Rostedt            2012-05-14  2282  		/*
659f451ff21315 Steven Rostedt            2012-05-14  2283  		 * Even though the buffer was disabled, we must make sure
659f451ff21315 Steven Rostedt            2012-05-14  2284  		 * that it is truly disabled before calling rb_check_pages.
659f451ff21315 Steven Rostedt            2012-05-14  2285  		 * There could have been a race between checking
659f451ff21315 Steven Rostedt            2012-05-14  2286  		 * record_disable and incrementing it.
659f451ff21315 Steven Rostedt            2012-05-14  2287  		 */
7440172974e85b Paul E. McKenney          2018-11-06  2288  		synchronize_rcu();
659f451ff21315 Steven Rostedt            2012-05-14  2289  		for_each_buffer_cpu(buffer, cpu) {
659f451ff21315 Steven Rostedt            2012-05-14  2290  			cpu_buffer = buffer->buffers[cpu];
659f451ff21315 Steven Rostedt            2012-05-14  2291  			rb_check_pages(cpu_buffer);
659f451ff21315 Steven Rostedt            2012-05-14  2292  		}
659f451ff21315 Steven Rostedt            2012-05-14  2293  		atomic_dec(&buffer->record_disabled);
659f451ff21315 Steven Rostedt            2012-05-14  2294  	}
659f451ff21315 Steven Rostedt            2012-05-14  2295  
7a8e76a3829f10 Steven Rostedt            2008-09-29  2296  	mutex_unlock(&buffer->mutex);
0a1754b2a97efa Qiujun Huang              2020-10-19  2297  	return 0;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2298  
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2299   out_err:
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2300  	for_each_buffer_cpu(buffer, cpu) {
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2301  		struct buffer_page *bpage, *tmp;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2302  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2303  		cpu_buffer = buffer->buffers[cpu];
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2304  		cpu_buffer->nr_pages_to_update = 0;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2305  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2306  		if (list_empty(&cpu_buffer->new_pages))
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2307  			continue;
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2308  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2309  		list_for_each_entry_safe(bpage, tmp, &cpu_buffer->new_pages,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2310  					list) {
044fa782ebb947 Steven Rostedt            2008-12-02  2311  			list_del_init(&bpage->list);
044fa782ebb947 Steven Rostedt            2008-12-02  2312  			free_buffer_page(bpage);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2313  		}
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2314  	}
07b8b10ec94f85 Steven Rostedt (VMware    2020-03-27  2315)  out_err_unlock:
641d2f63cfe245 Vegard Nossum             2008-11-18  2316  	mutex_unlock(&buffer->mutex);
83f40318dab00e Vaibhav Nagarnaik         2012-05-03  2317  	return err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2318  }
c4f50183f90fb1 Robert Richter            2008-12-11  2319  EXPORT_SYMBOL_GPL(ring_buffer_resize);
7a8e76a3829f10 Steven Rostedt            2008-09-29  2320  

:::::: The code at line 2141 was first introduced by commit
:::::: ee51a1de7e3837577412be269e0100038068e691 tracing: fix mmiotrace resizing crash

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
