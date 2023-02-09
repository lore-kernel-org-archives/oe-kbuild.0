Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A3C371
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675935276; x=1707471276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0yzDCgOVNm1YFgYBPqgBMVKjsc5EnErjEgL8H9ezJ0M=;
  b=mTtV0E67Iq4PAapdQrd3Gd/9CZhsgF7ACUWwqYeF/JG2CXBEGFJ/KBe0
   Pk/kPsu4QnlxuaaXGxWqSgKBfktHgqINOOvpbZV1Qae9wwfpATVuBwV+M
   Gt9mDBFF6qKlo3Jh6OOfD8131tGs9972eYDnleZHG1jsmtg6pStAYGjvG
   +wDYINYCDq4NaQ+SIaaOsZjpo11N9J4ZyHIIQKqlKLtzPodrSdlECxY00
   eOJWCCfBuRfhoTd12HyJQc31k9qYSB25soWWO01U5XUH5ESkmFnIXMezA
   6KZdhj+EwEfm8G0OPCf0xjQ+Ech4el20YYNaAcZqVcvdQj5+bgucTX3B4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="330086917"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="330086917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 01:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="810274429"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="810274429"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 01:34:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ3K5-0004yA-2n;
	Thu, 09 Feb 2023 09:34:33 +0000
Date: Thu, 9 Feb 2023 17:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/8] ACPI: property: Parse _CRS CSI-2 descriptor
Message-ID: <202302091722.YCT7d1kl-lkp@intel.com>
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
In-Reply-To: <20230208212712.3184953-3-sakari.ailus@linux.intel.com>
References: <20230208212712.3184953-3-sakari.ailus@linux.intel.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-acpi@vger.kernel.org
CC: linux-media@vger.kernel.org
CC: rafael@kernel.org
CC: andriy.shevchenko@linux.intel.com
CC: heikki.krogerus@linux.intel.com

Hi Sakari,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on sailus-media-tree/streams linus/master v6.2-rc7 next-20230209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/ACPI-property-Parse-data-node-string-references-in-properties/20230209-053017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230208212712.3184953-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v5 2/8] ACPI: property: Parse _CRS CSI-2 descriptor
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230209/202302091722.YCT7d1kl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302091722.YCT7d1kl-lkp@intel.com

smatch warnings:
drivers/acpi/mipi.c:241 acpi_crs_csi2_alloc_fill_swnodes() warn: variable dereferenced before check 'ads' (see line 237)

vim +/ads +241 drivers/acpi/mipi.c

06167f6b99bad9 Sakari Ailus 2023-02-08  201  
06167f6b99bad9 Sakari Ailus 2023-02-08  202  /*
06167f6b99bad9 Sakari Ailus 2023-02-08  203   * Allocate memory and set up software nodes for an ACPI device with given
06167f6b99bad9 Sakari Ailus 2023-02-08  204   * number of CSI-2 ports.
06167f6b99bad9 Sakari Ailus 2023-02-08  205   */
06167f6b99bad9 Sakari Ailus 2023-02-08  206  void acpi_crs_csi2_alloc_fill_swnodes(size_t ports_count, acpi_handle handle)
06167f6b99bad9 Sakari Ailus 2023-02-08  207  {
06167f6b99bad9 Sakari Ailus 2023-02-08  208  	struct acpi_device_software_nodes *ads;
06167f6b99bad9 Sakari Ailus 2023-02-08  209  	struct crs_csi2_swnodes *swnodes;
06167f6b99bad9 Sakari Ailus 2023-02-08  210  	size_t alloc_size;
06167f6b99bad9 Sakari Ailus 2023-02-08  211  	unsigned int i;
06167f6b99bad9 Sakari Ailus 2023-02-08  212  	bool overflow;
06167f6b99bad9 Sakari Ailus 2023-02-08  213  	void *end;
06167f6b99bad9 Sakari Ailus 2023-02-08  214  
06167f6b99bad9 Sakari Ailus 2023-02-08  215  	/*
06167f6b99bad9 Sakari Ailus 2023-02-08  216  	 * Allocate memory for ports, node pointers (number of nodes +
06167f6b99bad9 Sakari Ailus 2023-02-08  217  	 * 1 (guardian), nodes (root + number of ports * 2 (for for
06167f6b99bad9 Sakari Ailus 2023-02-08  218  	 * every port there is an endpoint)).
06167f6b99bad9 Sakari Ailus 2023-02-08  219  	 */
06167f6b99bad9 Sakari Ailus 2023-02-08  220  	overflow = check_mul_overflow(sizeof(*ads->ports) +
06167f6b99bad9 Sakari Ailus 2023-02-08  221  				      sizeof(*ads->nodes) * 2 +
06167f6b99bad9 Sakari Ailus 2023-02-08  222  				      sizeof(*ads->nodeptrs) * 2,
06167f6b99bad9 Sakari Ailus 2023-02-08  223  				      ports_count, &alloc_size);
06167f6b99bad9 Sakari Ailus 2023-02-08  224  	overflow = overflow ||
06167f6b99bad9 Sakari Ailus 2023-02-08  225  		   check_add_overflow(sizeof(*ads) + sizeof(*ads->nodes) +
06167f6b99bad9 Sakari Ailus 2023-02-08  226  				      sizeof(*ads->nodeptrs) * 2,
06167f6b99bad9 Sakari Ailus 2023-02-08  227  				      alloc_size, &alloc_size);
06167f6b99bad9 Sakari Ailus 2023-02-08  228  	if (overflow) {
06167f6b99bad9 Sakari Ailus 2023-02-08  229  		acpi_handle_warn(handle,
06167f6b99bad9 Sakari Ailus 2023-02-08  230  				 "too many _CRS CSI2 resource handles (%zu)",
06167f6b99bad9 Sakari Ailus 2023-02-08  231  				 ports_count);
06167f6b99bad9 Sakari Ailus 2023-02-08  232  		return;
06167f6b99bad9 Sakari Ailus 2023-02-08  233  	}
06167f6b99bad9 Sakari Ailus 2023-02-08  234  
06167f6b99bad9 Sakari Ailus 2023-02-08  235  	swnodes = kzalloc(sizeof(*swnodes), GFP_KERNEL);
06167f6b99bad9 Sakari Ailus 2023-02-08  236  	ads = kzalloc(alloc_size, GFP_KERNEL);
06167f6b99bad9 Sakari Ailus 2023-02-08 @237  	ads->ports = (void *)(ads + 1);
06167f6b99bad9 Sakari Ailus 2023-02-08  238  	ads->nodes = (void *)(ads->ports + ports_count);
06167f6b99bad9 Sakari Ailus 2023-02-08  239  	ads->nodeptrs = (void *)(ads->nodes + ports_count * 2 + 1);
06167f6b99bad9 Sakari Ailus 2023-02-08  240  	end = ads->nodeptrs + ports_count * 2 + 2;
06167f6b99bad9 Sakari Ailus 2023-02-08 @241  	if (!swnodes || !ads || WARN_ON((void *)ads + alloc_size != end)) {
06167f6b99bad9 Sakari Ailus 2023-02-08  242  		kfree(swnodes);
06167f6b99bad9 Sakari Ailus 2023-02-08  243  		kfree(ads);
06167f6b99bad9 Sakari Ailus 2023-02-08  244  		acpi_handle_debug(handle,
06167f6b99bad9 Sakari Ailus 2023-02-08  245  				  "cannot allocate for %zu software nodes\n",
06167f6b99bad9 Sakari Ailus 2023-02-08  246  				  ports_count);
06167f6b99bad9 Sakari Ailus 2023-02-08  247  		return;
06167f6b99bad9 Sakari Ailus 2023-02-08  248  	}
06167f6b99bad9 Sakari Ailus 2023-02-08  249  
06167f6b99bad9 Sakari Ailus 2023-02-08  250  	ads->num_ports = ports_count;
06167f6b99bad9 Sakari Ailus 2023-02-08  251  	for (i = 0; i < ports_count * 2 + 1; i++)
06167f6b99bad9 Sakari Ailus 2023-02-08  252  		ads->nodeptrs[i] = &ads->nodes[i];
06167f6b99bad9 Sakari Ailus 2023-02-08  253  	ads->nodeptrs[i] = NULL;
06167f6b99bad9 Sakari Ailus 2023-02-08  254  	for (i = 0; i < ports_count; i++)
06167f6b99bad9 Sakari Ailus 2023-02-08  255  		ads->ports[i].port_nr = NO_CSI2_PORT;
06167f6b99bad9 Sakari Ailus 2023-02-08  256  	swnodes->handle = handle;
06167f6b99bad9 Sakari Ailus 2023-02-08  257  	swnodes->ads = ads;
06167f6b99bad9 Sakari Ailus 2023-02-08  258  	list_add(&swnodes->list, &crs_csi2_swnodes);
06167f6b99bad9 Sakari Ailus 2023-02-08  259  }
06167f6b99bad9 Sakari Ailus 2023-02-08  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
