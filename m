Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75B23A2
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695090568; x=1726626568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=16q5b5MtFWrG3jdyuOV6M9mR1H7hOmZwMLrczV6JR0k=;
  b=NcaRBXWIY4qmMUwtZqLskjRKC0j3Tly2R7eN6CItX8NoHHZhNccVQNZW
   ljLtv6rYpXnzXHVaKMvqWTN5+yKXBU1OrKXRlb90uAeRKkASM4bN9NliW
   ei6Zwn5mhRbILtk/zlV2U9Q/NZSP75L8N01KxcuwczeWtbpAO2efiHe+Q
   pe2QBbNn9bw7y+qQFd3ZXPbqqkt9FrBxnSqPe/fosbv6f+A4WpBbMj4wh
   lI3O1fZala8MKtJzOEAk9k6nh0v1/ssB0LU5BNpD5eQ+CA4K3MW1ynPBA
   +D1ecIUYm+xC8Fgx+LcJTY+7Isn5538ajePbv4Iezex9+DHEViLLODq+R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378735223"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="378735223"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 19:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="889333738"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="889333738"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2023 19:28:41 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiQUO-0006mu-0N;
	Tue, 19 Sep 2023 02:29:24 +0000
Date: Tue, 19 Sep 2023 10:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202309191015.AQJPCIDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/xen/setup.c:809:23: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
References: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc2]
[cannot apply to next-20230918 next-20230918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/fe7e6c542e094bfca655abcd323c1c98%40AcuMS.aculab.com
patch subject: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-121-20230919 (https://download.01.org/0day-ci/archive/20230919/202309191015.AQJPCIDL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191015.AQJPCIDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309191015.AQJPCIDL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/xen/setup.c:809:23: sparse: sparse: too long token expansion
>> arch/x86/xen/setup.c:809:23: sparse: sparse: too long token expansion
>> arch/x86/xen/setup.c:809:23: sparse: sparse: too long token expansion
>> arch/x86/xen/setup.c:809:23: sparse: sparse: too long token expansion

vim +809 arch/x86/xen/setup.c

1d988ed46543ca arch/x86/xen/setup.c  Juergen Gross         2019-02-14  752  
9e9a5fcb04e3af arch/x86/xen/setup.c  Ian Campbell          2010-09-02  753  	op = xen_initial_domain() ?
9e9a5fcb04e3af arch/x86/xen/setup.c  Ian Campbell          2010-09-02  754  		XENMEM_machine_memory_map :
9e9a5fcb04e3af arch/x86/xen/setup.c  Ian Campbell          2010-09-02  755  		XENMEM_memory_map;
9e9a5fcb04e3af arch/x86/xen/setup.c  Ian Campbell          2010-09-02  756  	rc = HYPERVISOR_memory_op(op, &memmap);
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  757  	if (rc == -ENOSYS) {
9ec23a7f6d2537 arch/x86/xen/setup.c  Ian Campbell          2010-10-28  758  		BUG_ON(xen_initial_domain());
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  759  		memmap.nr_entries = 1;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  760  		xen_e820_table.entries[0].addr = 0ULL;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  761  		xen_e820_table.entries[0].size = mem_end;
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  762  		/* 8MB slack (to balance backend allocations). */
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  763  		xen_e820_table.entries[0].size += 8ULL << 20;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  764  		xen_e820_table.entries[0].type = E820_TYPE_RAM;
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  765  		rc = 0;
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  766  	}
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  767  	BUG_ON(rc);
1ea644c8f93f34 arch/x86/xen/setup.c  Martin Kelly          2014-10-16  768  	BUG_ON(memmap.nr_entries == 0);
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  769  	xen_e820_table.nr_entries = memmap.nr_entries;
8006ec3e911f93 arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-05-26  770  
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  771  	if (xen_initial_domain()) {
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  772  		/*
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  773  		 * Xen won't allow a 1:1 mapping to be created to UNUSABLE
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  774  		 * regions, so if we're using the machine memory map leave the
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  775  		 * region as RAM as it is in the pseudo-physical map.
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  776  		 *
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  777  		 * UNUSABLE regions in domUs are not handled and will need
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  778  		 * a patch in the future.
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  779  		 */
69632ecfcd03b1 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  780  		xen_ignore_unusable();
3bc38cbceb8588 arch/x86/xen/setup.c  David Vrabel          2013-08-16  781  
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  782  #ifdef CONFIG_ISCSI_IBFT_FIND
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  783  		/* Reserve 0.5 MiB to 1 MiB region so iBFT can be found */
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  784  		xen_e820_table.entries[xen_e820_table.nr_entries].addr = IBFT_START;
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  785  		xen_e820_table.entries[xen_e820_table.nr_entries].size = IBFT_END - IBFT_START;
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  786  		xen_e820_table.entries[xen_e820_table.nr_entries].type = E820_TYPE_RESERVED;
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  787  		xen_e820_table.nr_entries++;
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  788  #endif
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  789  	}
9338c2233b97f9 arch/x86/xen/setup.c  Ross Lagerwall        2023-06-05  790  
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  791  	/* Make sure the Xen-supplied memory map is well-ordered. */
f9748fa0458510 arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  792  	e820__update_table(&xen_e820_table);
b5b43ced7a6e79 arch/x86/xen/setup.c  Jeremy Fitzhardinge   2010-09-02  793  
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  794  	max_pages = xen_get_max_pages();
7cb31b752c71e0 arch/x86/xen/setup.c  Stefano Stabellini    2011-01-27  795  
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  796  	/* How many extra pages do we need due to remapping? */
dd14be92fbf5bc arch/x86/xen/setup.c  Juergen Gross         2016-05-18  797  	max_pages += xen_foreach_remap_area(max_pfn, xen_count_remap_pages);
eafd72e016c69d arch/x86/xen/setup.c  Juergen Gross         2015-08-19  798  
eafd72e016c69d arch/x86/xen/setup.c  Juergen Gross         2015-08-19  799  	if (max_pages > max_pfn)
eafd72e016c69d arch/x86/xen/setup.c  Juergen Gross         2015-08-19  800  		extra_pages += max_pages - max_pfn;
2e2fb75475c2fc arch/x86/xen/setup.c  Konrad Rzeszutek Wilk 2012-04-06  801  
2f14ddc3a7146e arch/x86/xen/setup.c  Zhang, Fengzhe        2011-02-16  802  	/*
af44a387e743ab arch/x86/xen/setup.c  Roger Pau Monne       2021-03-24  803  	 * Clamp the amount of extra memory to a EXTRA_MEM_RATIO
882213990d32fd arch/x86/xen/setup.c  Juergen Gross         2021-02-24  804  	 * factor the base size.
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  805  	 *
c70727a5bc18a5 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  806  	 * Make sure we have no memory above max_pages, as this area
c70727a5bc18a5 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  807  	 * isn't handled by the p2m management.
2f14ddc3a7146e arch/x86/xen/setup.c  Zhang, Fengzhe        2011-02-16  808  	 */
af44a387e743ab arch/x86/xen/setup.c  Roger Pau Monne       2021-03-24 @809  	extra_pages = min3(EXTRA_MEM_RATIO * min(max_pfn, PFN_DOWN(MAXMEM)),
c70727a5bc18a5 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  810  			   extra_pages, max_pages - max_pfn);
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  811  	i = 0;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  812  	addr = xen_e820_table.entries[0].addr;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  813  	size = xen_e820_table.entries[0].size;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  814  	while (i < xen_e820_table.nr_entries) {
123664101aa215 arch/x86/xen/setup.c  Igor Druzhinin        2018-11-27  815  		bool discard = false;
f5775e0b6116b7 arch/x86/xen/setup.c  David Vrabel          2015-01-19  816  
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  817  		chunk_size = size;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  818  		type = xen_e820_table.entries[i].type;
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  819  
358cd9afd06999 arch/x86/xen/setup.c  Juergen Gross         2023-06-12  820  		if (type == E820_TYPE_RESERVED)
358cd9afd06999 arch/x86/xen/setup.c  Juergen Gross         2023-06-12  821  			xen_pv_pci_possible = true;
358cd9afd06999 arch/x86/xen/setup.c  Juergen Gross         2023-06-12  822  
09821ff1d50a1e arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  823  		if (type == E820_TYPE_RAM) {
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  824  			if (addr < mem_end) {
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  825  				chunk_size = min(size, mem_end - addr);
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  826  			} else if (extra_pages) {
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  827  				chunk_size = min(size, PFN_PHYS(extra_pages));
626d7508664c4b arch/x86/xen/setup.c  Juergen Gross         2015-09-04  828  				pfn_s = PFN_UP(addr);
626d7508664c4b arch/x86/xen/setup.c  Juergen Gross         2015-09-04  829  				n_pfns = PFN_DOWN(addr + chunk_size) - pfn_s;
626d7508664c4b arch/x86/xen/setup.c  Juergen Gross         2015-09-04  830  				extra_pages -= n_pfns;
626d7508664c4b arch/x86/xen/setup.c  Juergen Gross         2015-09-04  831  				xen_add_extra_mem(pfn_s, n_pfns);
626d7508664c4b arch/x86/xen/setup.c  Juergen Gross         2015-09-04  832  				xen_max_p2m_pfn = pfn_s + n_pfns;
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  833  			} else
123664101aa215 arch/x86/xen/setup.c  Igor Druzhinin        2018-11-27  834  				discard = true;
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  835  		}
be5bf9fa1c327f arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  836  
123664101aa215 arch/x86/xen/setup.c  Igor Druzhinin        2018-11-27  837  		if (!discard)
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  838  			xen_align_and_add_e820_region(addr, chunk_size, type);
b5b43ced7a6e79 arch/x86/xen/setup.c  Jeremy Fitzhardinge   2010-09-02  839  
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  840  		addr += chunk_size;
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  841  		size -= chunk_size;
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  842  		if (size == 0) {
dc91c728fddc29 arch/x86/xen/setup.c  David Vrabel          2011-09-29  843  			i++;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  844  			if (i < xen_e820_table.nr_entries) {
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  845  				addr = xen_e820_table.entries[i].addr;
e7dbf7ad4172ef arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  846  				size = xen_e820_table.entries[i].size;
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  847  			}
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  848  		}
35ae11fd146384 arch/x86/xen/setup.c  Ian Campbell          2009-02-06  849  	}
b792c755907cff arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  850  
25b884a83d487f arch/x86/xen/setup.c  David Vrabel          2014-01-03  851  	/*
25b884a83d487f arch/x86/xen/setup.c  David Vrabel          2014-01-03  852  	 * Set the rest as identity mapped, in case PCI BARs are
25b884a83d487f arch/x86/xen/setup.c  David Vrabel          2014-01-03  853  	 * located here.
25b884a83d487f arch/x86/xen/setup.c  David Vrabel          2014-01-03  854  	 */
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  855  	set_phys_range_identity(addr / PAGE_SIZE, ~0ul);
25b884a83d487f arch/x86/xen/setup.c  David Vrabel          2014-01-03  856  
b792c755907cff arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  857  	/*
9ec23a7f6d2537 arch/x86/xen/setup.c  Ian Campbell          2010-10-28  858  	 * In domU, the ISA region is normal, usable memory, but we
9ec23a7f6d2537 arch/x86/xen/setup.c  Ian Campbell          2010-10-28  859  	 * reserve ISA memory anyway because too many things poke
b792c755907cff arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  860  	 * about in there.
b792c755907cff arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  861  	 */
f9748fa0458510 arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  862  	e820__range_add(ISA_START_ADDRESS, ISA_END_ADDRESS - ISA_START_ADDRESS, E820_TYPE_RESERVED);
5ead97c84fa7d6 arch/i386/xen/setup.c Jeremy Fitzhardinge   2007-07-17  863  
f9748fa0458510 arch/x86/xen/setup.c  Ingo Molnar           2017-01-28  864  	e820__update_table(e820_table);
be5bf9fa1c327f arch/x86/xen/setup.c  Jeremy Fitzhardinge   2008-06-16  865  
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  866  	/*
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  867  	 * Check whether the kernel itself conflicts with the target E820 map.
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  868  	 * Failing now is better than running into weird problems later due
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  869  	 * to relocating (and even reusing) pages with kernel text or data.
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  870  	 */
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  871  	if (xen_is_e820_reserved(__pa_symbol(_text),
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  872  			__pa_symbol(__bss_stop) - __pa_symbol(_text))) {
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  873  		xen_raw_console_write("Xen hypervisor allocated kernel memory conflicts with E820 map\n");
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  874  		BUG();
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  875  	}
808fdb71936c41 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  876  
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  877  	/*
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  878  	 * Check for a conflict of the hypervisor supplied page tables with
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  879  	 * the target E820 map.
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  880  	 */
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  881  	xen_pt_check_e820();
04414baab5ba86 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  882  
8f5b0c63987207 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  883  	xen_reserve_xen_mfnlist();
8f5b0c63987207 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  884  
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  885  	/* Check for a conflict of the initrd with the target E820 map. */
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  886  	if (xen_is_e820_reserved(boot_params.hdr.ramdisk_image,
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  887  				 boot_params.hdr.ramdisk_size)) {
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  888  		phys_addr_t new_area, start, size;
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  889  
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  890  		new_area = xen_find_free_area(boot_params.hdr.ramdisk_size);
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  891  		if (!new_area) {
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  892  			xen_raw_console_write("Can't find new memory area for initrd needed due to E820 map conflict\n");
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  893  			BUG();
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  894  		}
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  895  
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  896  		start = boot_params.hdr.ramdisk_image;
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  897  		size = boot_params.hdr.ramdisk_size;
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  898  		xen_phys_memcpy(new_area, start, size);
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  899  		pr_info("initrd moved from [mem %#010llx-%#010llx] to [mem %#010llx-%#010llx]\n",
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  900  			start, start + size, new_area, new_area + size);
3ecc68349bbab6 arch/x86/xen/setup.c  Mike Rapoport         2021-11-05  901  		memblock_phys_free(start, size);
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  902  		boot_params.hdr.ramdisk_image = new_area;
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  903  		boot_params.ext_ramdisk_image = new_area >> 32;
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  904  	}
4b9c15377f96e2 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  905  
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  906  	/*
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  907  	 * Set identity map on non-RAM pages and prepare remapping the
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  908  	 * underlying RAM.
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  909  	 */
dd14be92fbf5bc arch/x86/xen/setup.c  Juergen Gross         2016-05-18  910  	xen_foreach_remap_area(max_pfn, xen_set_identity_and_remap_chunk);
dd14be92fbf5bc arch/x86/xen/setup.c  Juergen Gross         2016-05-18  911  
dd14be92fbf5bc arch/x86/xen/setup.c  Juergen Gross         2016-05-18  912  	pr_info("Released %ld page(s)\n", xen_released_pages);
5097cdf6cef154 arch/x86/xen/setup.c  Juergen Gross         2015-07-17  913  
5ead97c84fa7d6 arch/i386/xen/setup.c Jeremy Fitzhardinge   2007-07-17  914  	return "Xen";
5ead97c84fa7d6 arch/i386/xen/setup.c Jeremy Fitzhardinge   2007-07-17  915  }
5ead97c84fa7d6 arch/i386/xen/setup.c Jeremy Fitzhardinge   2007-07-17  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
