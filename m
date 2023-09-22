Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6A45F77
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695411625; x=1726947625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNtoTEHMV80juBjOrMeJxW0mx3V8JHe2Hs9igx4aSR4=;
  b=Kdpfo0C0SkP+muUP/SPMrIlhRshOyqA6YXMHb+k5y8z453dxE+24qPqM
   kvqQm4mO0sIonSnrMb2ZBuF21fdx6ErzYQm5eNs4t5TdK5R09Vw6MGrZJ
   vcxcF9szLY0zcPMef9S+HgkRyah3neoMjgCCSRt0KsNIKWKeNsUW7enTa
   g0uvZ0l7CpJ4zMLVFh3g7iBKzKpDJoNgMS+M3SgJmqFzh2LVEeFoJAqIy
   0JZ/h778EcmAMARpuK7ECE5wJlqsl81wHkktotmxXeu9ntgHptiNiNmuV
   fyH/8LZeuq8GUDwZlA/lt4Jlk/cFhIHStAgFr8r4us6NDwhgsptBkZzYR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378208996"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="378208996"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 12:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="921287989"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="921287989"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Sep 2023 12:40:19 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjm0e-0001EB-2l;
	Fri, 22 Sep 2023 19:40:16 +0000
Date: Sat, 23 Sep 2023 03:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] ACPI, APEI, EINJ: Add CXL 1.1 EINJ error type
 support
Message-ID: <202309230339.w5H29jEj-lkp@intel.com>
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
In-Reply-To: <20230907191956.674833-3-Benjamin.Cheatham@amd.com>
References: <20230907191956.674833-3-Benjamin.Cheatham@amd.com>
TO: Ben Cheatham <Benjamin.Cheatham@amd.com>
TO: rafael@kernel.org
TO: dan.j.williams@intel.com
TO: linux-cxl@vger.kernel.org
TO: linux-acpi@vger.kernel.org
CC: bhelgaas@google.com
CC: benjamin.cheatham@amd.com
CC: yazen.ghannam@amd.com

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Cheatham/CXL-PCIE-Add-cxl_rcrb_addr-file-to-dport_dev/20230908-032235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230907191956.674833-3-Benjamin.Cheatham%40amd.com
patch subject: [PATCH v4 2/3] ACPI, APEI, EINJ: Add CXL 1.1 EINJ error type support
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230339.w5H29jEj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230339.w5H29jEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230339.w5H29jEj-lkp@intel.com/

smatch warnings:
drivers/acpi/apei/einj.c:526 is_valid_cxl_addr() warn: ignoring unreachable code.

vim +526 drivers/acpi/apei/einj.c

e40213450b5315 Huang Ying   2010-05-18  516  
b6c82d6a99fc77 Ben Cheatham 2023-09-07  517  static int is_valid_cxl_addr(u64 addr)
b6c82d6a99fc77 Ben Cheatham 2023-09-07  518  {
b6c82d6a99fc77 Ben Cheatham 2023-09-07  519  	struct cxl_dport *dport;
b6c82d6a99fc77 Ben Cheatham 2023-09-07  520  
b6c82d6a99fc77 Ben Cheatham 2023-09-07  521  	if (IS_REACHABLE(CONFIG_CXL_ACPI))
b6c82d6a99fc77 Ben Cheatham 2023-09-07  522  		dport = cxl_find_rch_dport_by_rcrb((resource_size_t) addr);
b6c82d6a99fc77 Ben Cheatham 2023-09-07  523  	else
b6c82d6a99fc77 Ben Cheatham 2023-09-07  524  		return 0;
b6c82d6a99fc77 Ben Cheatham 2023-09-07  525  
b6c82d6a99fc77 Ben Cheatham 2023-09-07 @526  	if (!IS_ERR_OR_NULL(dport))
b6c82d6a99fc77 Ben Cheatham 2023-09-07  527  		return 1;
b6c82d6a99fc77 Ben Cheatham 2023-09-07  528  
b6c82d6a99fc77 Ben Cheatham 2023-09-07  529  	pr_info("Could not find dport with rcrb 0x%llx\n", addr);
b6c82d6a99fc77 Ben Cheatham 2023-09-07  530  	return 0;
b6c82d6a99fc77 Ben Cheatham 2023-09-07  531  }
b6c82d6a99fc77 Ben Cheatham 2023-09-07  532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
