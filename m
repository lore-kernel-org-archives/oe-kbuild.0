Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF48820
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLjkXqcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700619184; x=1732155184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzifA3flee1CPeB4U7Rz1wXO6FGk1fbXmymyD23FpuQ=;
  b=eLjkXqcbmcY9GNgynDwmETRmkb4wXnHfiYnT2IYRDFdLALNUgolPa4gL
   /H/eyAWeb6VxRV9YNrOi8CDn9xsFWIXbPb0H+SoCv4OWaC3iMKbP4RPLa
   GpklaDEsoEKMcJJ0VVEE5nSBGaqJ9gCcn5IXUpV+yxEgsFB/xibUgWQsy
   sbFI8nMNgwnvLpamPbaGz5CxpoqtbFCAuDeJysW0UkpGkJgjQMJu4osT4
   Kx24v9LX7qmoxlCRPb6PDCSb7iAPIhlaibtHLI9iS75otZ5dbaOCR4WOx
   DqE094mZSZqX0ChYdksQP27HcIjIisV7Skz47hNxaLPtwpEeK2O0fkT1A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372139444"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="372139444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="14721662"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2023 18:13:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5cjV-0008XF-0U;
	Wed, 22 Nov 2023 02:12:58 +0000
Date: Wed, 22 Nov 2023 10:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 06/10] memory: scrub: Add scrub driver supports
 configuring memory scrubbers in the system
Message-ID: <202311221028.fsptP2bp-lkp@intel.com>
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
In-Reply-To: <20231121101844.1161-7-shiju.jose@huawei.com>
References: <20231121101844.1161-7-shiju.jose@huawei.com>
TO: shiju.jose@huawei.com
TO: linux-cxl@vger.kernel.org
TO: linux-mm@kvack.org
TO: dave@stgolabs.net
TO: jonathan.cameron@huawei.com
TO: dave.jiang@intel.com
TO: alison.schofield@intel.com
TO: vishal.l.verma@intel.com
TO: ira.weiny@intel.com
TO: dan.j.williams@intel.com
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: david@redhat.com
CC: Vilas.Sridharan@amd.com
CC: leo.duran@amd.com
CC: Yazen.Ghannam@amd.com
CC: rientjes@google.com
CC: jiaqiyan@google.com
CC: tony.luck@intel.com
CC: Jon.Grimm@amd.com
CC: dave.hansen@linux.intel.com
CC: rafael@kernel.org
CC: lenb@kernel.org
CC: naoya.horiguchi@nec.com
CC: james.morse@arm.com
CC: jthoughton@google.com
CC: somasundaram.a@hpe.com
CC: erdemaktas@google.com
CC: pgonda@google.com
CC: duenwen@google.com
CC: mike.malvestuto@intel.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiju-jose-huawei-com/cxl-mbox-Add-GET_SUPPORTED_FEATURES-mailbox-command/20231121-182247
base:   linus/master
patch link:    https://lore.kernel.org/r/20231121101844.1161-7-shiju.jose%40huawei.com
patch subject: [PATCH v2 06/10] memory: scrub: Add scrub driver supports configuring memory scrubbers in the system
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221028.fsptP2bp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221028.fsptP2bp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221028.fsptP2bp-lkp@intel.com/

smatch warnings:
drivers/memory/scrub/memory-scrub.c:71 scrub_dev_attr_is_visible() warn: this array is probably non-NULL. 'scrub_dev->name'

vim +71 drivers/memory/scrub/memory-scrub.c

248ee451a36346 Shiju Jose 2023-11-21  64  
248ee451a36346 Shiju Jose 2023-11-21  65  static umode_t scrub_dev_attr_is_visible(struct kobject *kobj,
248ee451a36346 Shiju Jose 2023-11-21  66  					    struct attribute *attr, int n)
248ee451a36346 Shiju Jose 2023-11-21  67  {
248ee451a36346 Shiju Jose 2023-11-21  68  	struct device *dev = kobj_to_dev(kobj);
248ee451a36346 Shiju Jose 2023-11-21  69  	struct scrub_device *scrub_dev = to_scrub_device(dev);
248ee451a36346 Shiju Jose 2023-11-21  70  
248ee451a36346 Shiju Jose 2023-11-21 @71  	if (attr == &dev_attr_name.attr && scrub_dev->name == NULL)
248ee451a36346 Shiju Jose 2023-11-21  72  		return 0;
248ee451a36346 Shiju Jose 2023-11-21  73  
248ee451a36346 Shiju Jose 2023-11-21  74  	return attr->mode;
248ee451a36346 Shiju Jose 2023-11-21  75  }
248ee451a36346 Shiju Jose 2023-11-21  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
