Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD21362
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741242204; cv=none; b=YKtrZ+92LRQeUiWNK7lp7CA4TfPXULAUwhN4PhQHeqEc93ZlzEK3U53PKymskNKVIbfsM3TxdDeiq/+AQSAyUF8B2hsBfxrp2VhD3eoyYEGGCz3Q+66loXm4i+NDGfP027zabdRP1kP9PvqPETZWc+YLoG77u2Q/KK5Y/tgfzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741242204; c=relaxed/simple;
	bh=UYEeiY5Z/lNoKVTof46RftC+5pp2IqqGrkwWWXwcEv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLVPykikoUrqhAzFDNDhQznoAmMC8EagM1NF0TZPUIQfjsZP60Wvk2BWPbgUVsPNLUEaQ5k7i3ccWUWLSjIATxZbsVTl/kpqximqCjmtqyWfbPUQvNrBx70JFMexRQWnmmjny3EndOEogSoYKljTVg2Zqd22gHo/XWOMC/wBQN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWZ9BqEa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWZ9BqEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741242202; x=1772778202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UYEeiY5Z/lNoKVTof46RftC+5pp2IqqGrkwWWXwcEv4=;
  b=PWZ9BqEa19q+8VEyvwZo2bMV27yLNi3r5m02x/Xj7DMS97kK00lgx3Ww
   QhyMm+EEhSSyTvN0uImuMsfIbf5g2g8A2Gc7Q536O9ItBRTVruxAn0GOa
   Lm4ZQehdKoDCvrlc6GeWO/Kukc/PeGvwXRp0JL6SInOYx6CtsTjqsez6E
   4GE00AQ24zRJc8pCe04DwFkOhStMpO9wemF9LxnDPes+OJn23w0bFqNRZ
   FGK6ZO6htyVMEl9YbBum6kRf2CO/FcKtZoTTw3GhAU2jpyccy00uU2l60
   azkoUeANONoVrW/bLEvMFwCvK83UkfcksyFXedtGigXok+RTwgM5GIJMs
   g==;
X-CSE-ConnectionGUID: seIexThfRTGTZHGCC0KaSg==
X-CSE-MsgGUID: i+5SQfcuR8Wu5Bu9ppm0Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64684516"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="64684516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:23:22 -0800
X-CSE-ConnectionGUID: MdcuerfrQG+yBZ7wR2vzEg==
X-CSE-MsgGUID: FzeGX2pgRRWtgdZw4bImng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119841888"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 22:23:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq4da-000Mck-1h;
	Thu, 06 Mar 2025 06:23:18 +0000
Date: Thu, 6 Mar 2025 14:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 2/7] kexec: define functions to map and unmap segments
Message-ID: <202503061449.gbVGafZc-lkp@intel.com>
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
In-Reply-To: <20250304190351.96975-3-chenste@linux.microsoft.com>
References: <20250304190351.96975-3-chenste@linux.microsoft.com>
TO: steven chen <chenste@linux.microsoft.com>
TO: zohar@linux.ibm.com
TO: stefanb@linux.ibm.com
TO: roberto.sassu@huaweicloud.com
TO: roberto.sassu@huawei.com
TO: eric.snowberg@oracle.com
TO: ebiederm@xmission.com
TO: paul@paul-moore.com
TO: code@tyhicks.com
TO: bauermann@kolabnow.com
TO: linux-integrity@vger.kernel.org
TO: kexec@lists.infradead.org
TO: linux-security-module@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: madvenka@linux.microsoft.com
CC: nramas@linux.microsoft.com
CC: James.Bottomley@HansenPartnership.com
CC: bhe@redhat.com
CC: vgoyal@redhat.com
CC: dyoung@redhat.com

Hi steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on zohar-integrity/next-integrity]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/steven-chen/ima-copy-only-complete-measurement-records-across-kexec/20250305-031719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
patch link:    https://lore.kernel.org/r/20250304190351.96975-3-chenste%40linux.microsoft.com
patch subject: [PATCH v9 2/7] kexec: define functions to map and unmap segments
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061449.gbVGafZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503061449.gbVGafZc-lkp@intel.com/

smatch warnings:
kernel/kexec_core.c:896 kimage_map_segment() error: uninitialized symbol 'dest_page_addr'.

vim +/dest_page_addr +896 kernel/kexec_core.c

2965faa5e03d1e Dave Young  2015-09-09  869  
bf06eab7ae0f04 steven chen 2025-03-04  870  void *kimage_map_segment(struct kimage *image,
bf06eab7ae0f04 steven chen 2025-03-04  871  			 unsigned long addr, unsigned long size)
bf06eab7ae0f04 steven chen 2025-03-04  872  {
bf06eab7ae0f04 steven chen 2025-03-04  873  	unsigned long eaddr = addr + size;
bf06eab7ae0f04 steven chen 2025-03-04  874  	unsigned long src_page_addr, dest_page_addr;
bf06eab7ae0f04 steven chen 2025-03-04  875  	unsigned int npages;
bf06eab7ae0f04 steven chen 2025-03-04  876  	struct page **src_pages;
bf06eab7ae0f04 steven chen 2025-03-04  877  	int i;
bf06eab7ae0f04 steven chen 2025-03-04  878  	kimage_entry_t *ptr, entry;
bf06eab7ae0f04 steven chen 2025-03-04  879  	void *vaddr = NULL;
bf06eab7ae0f04 steven chen 2025-03-04  880  
bf06eab7ae0f04 steven chen 2025-03-04  881  	/*
bf06eab7ae0f04 steven chen 2025-03-04  882  	 * Collect the source pages and map them in a contiguous VA range.
bf06eab7ae0f04 steven chen 2025-03-04  883  	 */
bf06eab7ae0f04 steven chen 2025-03-04  884  	npages = PFN_UP(eaddr) - PFN_DOWN(addr);
bf06eab7ae0f04 steven chen 2025-03-04  885  	src_pages = kmalloc_array(npages, sizeof(*src_pages), GFP_KERNEL);
bf06eab7ae0f04 steven chen 2025-03-04  886  	if (!src_pages) {
bf06eab7ae0f04 steven chen 2025-03-04  887  		pr_err("Could not allocate ima pages array.\n");
bf06eab7ae0f04 steven chen 2025-03-04  888  		return NULL;
bf06eab7ae0f04 steven chen 2025-03-04  889  	}
bf06eab7ae0f04 steven chen 2025-03-04  890  
bf06eab7ae0f04 steven chen 2025-03-04  891  	i = 0;
bf06eab7ae0f04 steven chen 2025-03-04  892  	for_each_kimage_entry(image, ptr, entry) {
bf06eab7ae0f04 steven chen 2025-03-04  893  		if (entry & IND_DESTINATION) {
bf06eab7ae0f04 steven chen 2025-03-04  894  			dest_page_addr = entry & PAGE_MASK;
bf06eab7ae0f04 steven chen 2025-03-04  895  		} else if (entry & IND_SOURCE) {
bf06eab7ae0f04 steven chen 2025-03-04 @896  			if (dest_page_addr >= addr && dest_page_addr < eaddr) {
bf06eab7ae0f04 steven chen 2025-03-04  897  				src_page_addr = entry & PAGE_MASK;
bf06eab7ae0f04 steven chen 2025-03-04  898  				src_pages[i++] =
bf06eab7ae0f04 steven chen 2025-03-04  899  					virt_to_page(__va(src_page_addr));
bf06eab7ae0f04 steven chen 2025-03-04  900  				if (i == npages)
bf06eab7ae0f04 steven chen 2025-03-04  901  					break;
bf06eab7ae0f04 steven chen 2025-03-04  902  				dest_page_addr += PAGE_SIZE;
bf06eab7ae0f04 steven chen 2025-03-04  903  			}
bf06eab7ae0f04 steven chen 2025-03-04  904  		}
bf06eab7ae0f04 steven chen 2025-03-04  905  	}
bf06eab7ae0f04 steven chen 2025-03-04  906  
bf06eab7ae0f04 steven chen 2025-03-04  907  	/* Sanity check. */
bf06eab7ae0f04 steven chen 2025-03-04  908  	WARN_ON(i < npages);
bf06eab7ae0f04 steven chen 2025-03-04  909  
bf06eab7ae0f04 steven chen 2025-03-04  910  	vaddr = vmap(src_pages, npages, VM_MAP, PAGE_KERNEL);
bf06eab7ae0f04 steven chen 2025-03-04  911  	kfree(src_pages);
bf06eab7ae0f04 steven chen 2025-03-04  912  
bf06eab7ae0f04 steven chen 2025-03-04  913  	if (!vaddr)
bf06eab7ae0f04 steven chen 2025-03-04  914  		pr_err("Could not map ima buffer.\n");
bf06eab7ae0f04 steven chen 2025-03-04  915  
bf06eab7ae0f04 steven chen 2025-03-04  916  	return vaddr;
bf06eab7ae0f04 steven chen 2025-03-04  917  }
bf06eab7ae0f04 steven chen 2025-03-04  918  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
