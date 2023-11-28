Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D233FFB
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 06:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWJLd5Tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701151784; x=1732687784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmCS249xrJOqR8JPWqS4Vr6bA8tlkGjG2nEWZVZ7to8=;
  b=UWJLd5Tch3NRHpA9JmOw5CgD76Utq/xCKzwX3JBwMb66ebL6ZZrU1mKH
   uzn14VV/1iACWYyW6pOJFHr/hWh2zvhNk1NWmbk/EnB1HZd2QbkQ2ZlYM
   Vj9ohb+bxQhsB7S+20O1H84j5GYAq0KwV+9/jraVQgPw5y6w608CHNXGT
   gT0e9cTSVnVtQ5l0sACJQvaXY+qYqvirMCCwCE3dMjQKvQhyjjgFgpZdC
   e4mauGpSj3zu9Z3R6gnOAlXjGVQoijEfbaY2AlNRaDMUBzbNLJ6AtSBu6
   NVJsgIEoOy3mBPM3eCKtw2SiLr8/42RYvndgIS9KeKWEoA0mrTYKcmS9f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377886154"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="377886154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 22:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015815289"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="1015815289"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2023 22:09:42 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7rHw-00076O-1v;
	Tue, 28 Nov 2023 06:09:40 +0000
Date: Tue, 28 Nov 2023 14:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/perf/hv-gpci.c:506
 affinity_domain_via_partition_result_parse() error: uninitialized symbol
 'k'.
Message-ID: <202311281221.sawRNf2T-lkp@intel.com>
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
TO: Kajol Jain <kjain@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: a15e0d6a6929e737f71578ed4b05531fed5a96e8 powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r081-20231128 (https://download.01.org/0day-ci/archive/20231128/202311281221.sawRNf2T-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311281221.sawRNf2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311281221.sawRNf2T-lkp@intel.com/

smatch warnings:
arch/powerpc/perf/hv-gpci.c:506 affinity_domain_via_partition_result_parse() error: uninitialized symbol 'k'.

vim +/k +506 arch/powerpc/perf/hv-gpci.c

a69a57cac1ec89 Kajol Jain 2023-07-29  463  
a15e0d6a6929e7 Kajol Jain 2023-07-29  464  static void affinity_domain_via_partition_result_parse(int returned_values,
a15e0d6a6929e7 Kajol Jain 2023-07-29  465  			int element_size, char *buf, size_t *last_element,
a15e0d6a6929e7 Kajol Jain 2023-07-29  466  			size_t *n, struct hv_gpci_request_buffer *arg)
a15e0d6a6929e7 Kajol Jain 2023-07-29  467  {
a15e0d6a6929e7 Kajol Jain 2023-07-29  468  	size_t i = 0, j = 0;
a15e0d6a6929e7 Kajol Jain 2023-07-29  469  	size_t k, l, m;
a15e0d6a6929e7 Kajol Jain 2023-07-29  470  	uint16_t total_affinity_domain_ele, size_of_each_affinity_domain_ele;
a15e0d6a6929e7 Kajol Jain 2023-07-29  471  
a15e0d6a6929e7 Kajol Jain 2023-07-29  472  	/*
a15e0d6a6929e7 Kajol Jain 2023-07-29  473  	 * hcall H_GET_PERF_COUNTER_INFO populates the 'returned_values'
a15e0d6a6929e7 Kajol Jain 2023-07-29  474  	 * to show the total number of counter_value array elements
a15e0d6a6929e7 Kajol Jain 2023-07-29  475  	 * returned via hcall.
a15e0d6a6929e7 Kajol Jain 2023-07-29  476  	 * Unlike other request types, the data structure returned by this
a15e0d6a6929e7 Kajol Jain 2023-07-29  477  	 * request is variable-size. For this counter request type,
a15e0d6a6929e7 Kajol Jain 2023-07-29  478  	 * hcall populates 'cv_element_size' corresponds to minimum size of
a15e0d6a6929e7 Kajol Jain 2023-07-29  479  	 * the structure returned i.e; the size of the structure with no domain
a15e0d6a6929e7 Kajol Jain 2023-07-29  480  	 * information. Below loop go through all counter_value array
a15e0d6a6929e7 Kajol Jain 2023-07-29  481  	 * to determine the number and size of each domain array element and
a15e0d6a6929e7 Kajol Jain 2023-07-29  482  	 * add it to the output buffer.
a15e0d6a6929e7 Kajol Jain 2023-07-29  483  	 */
a15e0d6a6929e7 Kajol Jain 2023-07-29  484  	while (i < returned_values) {
a15e0d6a6929e7 Kajol Jain 2023-07-29  485  		k = j;
a15e0d6a6929e7 Kajol Jain 2023-07-29  486  		for (; k < j + element_size; k++)
a15e0d6a6929e7 Kajol Jain 2023-07-29  487  			*n += sprintf(buf + *n,  "%02x", (u8)arg->bytes[k]);
a15e0d6a6929e7 Kajol Jain 2023-07-29  488  		*n += sprintf(buf + *n,  "\n");
a15e0d6a6929e7 Kajol Jain 2023-07-29  489  
a15e0d6a6929e7 Kajol Jain 2023-07-29  490  		total_affinity_domain_ele = (u8)arg->bytes[k - 2] << 8 | (u8)arg->bytes[k - 3];
a15e0d6a6929e7 Kajol Jain 2023-07-29  491  		size_of_each_affinity_domain_ele = (u8)arg->bytes[k] << 8 | (u8)arg->bytes[k - 1];
a15e0d6a6929e7 Kajol Jain 2023-07-29  492  
a15e0d6a6929e7 Kajol Jain 2023-07-29  493  		for (l = 0; l < total_affinity_domain_ele; l++) {
a15e0d6a6929e7 Kajol Jain 2023-07-29  494  			for (m = 0; m < size_of_each_affinity_domain_ele; m++) {
a15e0d6a6929e7 Kajol Jain 2023-07-29  495  				*n += sprintf(buf + *n,  "%02x", (u8)arg->bytes[k]);
a15e0d6a6929e7 Kajol Jain 2023-07-29  496  				k++;
a15e0d6a6929e7 Kajol Jain 2023-07-29  497  			}
a15e0d6a6929e7 Kajol Jain 2023-07-29  498  			*n += sprintf(buf + *n,  "\n");
a15e0d6a6929e7 Kajol Jain 2023-07-29  499  		}
a15e0d6a6929e7 Kajol Jain 2023-07-29  500  
a15e0d6a6929e7 Kajol Jain 2023-07-29  501  		*n += sprintf(buf + *n,  "\n");
a15e0d6a6929e7 Kajol Jain 2023-07-29  502  		i++;
a15e0d6a6929e7 Kajol Jain 2023-07-29  503  		j = k;
a15e0d6a6929e7 Kajol Jain 2023-07-29  504  	}
a15e0d6a6929e7 Kajol Jain 2023-07-29  505  
a15e0d6a6929e7 Kajol Jain 2023-07-29 @506  	*last_element = k;
a15e0d6a6929e7 Kajol Jain 2023-07-29  507  }
a15e0d6a6929e7 Kajol Jain 2023-07-29  508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
