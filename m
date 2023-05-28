Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC9360
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685264822; x=1716800822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4ZjwS9kMscDjsLZFpQwjmVmiFXS9YMlba0KOH+ilqA=;
  b=e9jOHJxwxOoVGcqLHLTCV+Ac/D576wESsO6HdRCw403taOkiGDyHrchm
   nXFjB4jgT1RScSHADwxb0i+EqCcCpSpHmQ5ClIZjPDlnhdo4dPSTBMBnP
   TKKQojwc+gBlJ/Eut5dMErAmTmBRPlGGwPEcMuB4XCPZ43mngiOSIbSu3
   62lc8ZQdWq1ercKCv6zO0vRlkxJIKxWrx/7p9pVZkCPzgGb2ZZa00fxxn
   RPJesnnNqiXVnBvXe7Rjxz26HAoMqHCYTiY6eg7biJLObCVE9yVUZxTKo
   2O475XcHdEzx6WjbNz8GaSMKsEOqpzwWqTY9yJXQ1GDMIbLM551x3Z4hP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="354512321"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="354512321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 02:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="736503929"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="736503929"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 May 2023 02:07:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3CMe-000KVu-0V;
	Sun, 28 May 2023 09:07:00 +0000
Date: Sun, 28 May 2023 17:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djiang:cxl-qtg 8/27] lib/fw_table.c:59:17: sparse: sparse: typename
 in expression
Message-ID: <202305281651.MI4sETbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/fw_table.c:59:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   36e73b13967bf8146fe28cc8bea6706944eb564c
commit: b7e30c45269bc274639656da29b2692c64d25455 [8/27] lib/firmware_table: tables: Add CDAT table parsing support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-s053-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281651.MI4sETbG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=b7e30c45269bc274639656da29b2692c64d25455
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout b7e30c45269bc274639656da29b2692c64d25455
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305281651.MI4sETbG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/fw_table.c:59:17: sparse: sparse: typename in expression
   lib/fw_table.c:59:24: sparse: sparse: Expected ; at end of statement
   lib/fw_table.c:59:24: sparse: sparse: got length
   lib/fw_table.c:59:17: sparse: sparse: undefined identifier '__le16'
   lib/fw_table.c:61:24: sparse: sparse: undefined identifier 'length'
>> lib/fw_table.c:61:24: sparse: sparse: cast from unknown type

vim +59 lib/fw_table.c

4ccae80166acd5 Dave Jiang 2023-05-11  45  
4ccae80166acd5 Dave Jiang 2023-05-11  46  static unsigned long __init_or_fwtbllib
90ef9605f84c45 Dave Jiang 2023-05-23  47  fwtbl_get_entry_length(struct fwtbl_subtable_entry *entry)
4ccae80166acd5 Dave Jiang 2023-05-11  48  {
4ccae80166acd5 Dave Jiang 2023-05-11  49  	switch (entry->type) {
4ccae80166acd5 Dave Jiang 2023-05-11  50  	case ACPI_SUBTABLE_COMMON:
4ccae80166acd5 Dave Jiang 2023-05-11  51  		return entry->hdr->common.length;
4ccae80166acd5 Dave Jiang 2023-05-11  52  	case ACPI_SUBTABLE_HMAT:
4ccae80166acd5 Dave Jiang 2023-05-11  53  		return entry->hdr->hmat.length;
4ccae80166acd5 Dave Jiang 2023-05-11  54  	case ACPI_SUBTABLE_PRMT:
4ccae80166acd5 Dave Jiang 2023-05-11  55  		return entry->hdr->prmt.length;
4ccae80166acd5 Dave Jiang 2023-05-11  56  	case ACPI_SUBTABLE_CEDT:
4ccae80166acd5 Dave Jiang 2023-05-11  57  		return entry->hdr->cedt.length;
b7e30c45269bc2 Dave Jiang 2023-05-24  58  	case CDAT_SUBTABLE:
b7e30c45269bc2 Dave Jiang 2023-05-24 @59  		__le16 length = (__force __le16)entry->hdr->cdat.length;
b7e30c45269bc2 Dave Jiang 2023-05-24  60  
b7e30c45269bc2 Dave Jiang 2023-05-24 @61  		return le16_to_cpu(length);
4ccae80166acd5 Dave Jiang 2023-05-11  62  	}
4ccae80166acd5 Dave Jiang 2023-05-11  63  	return 0;
4ccae80166acd5 Dave Jiang 2023-05-11  64  }
4ccae80166acd5 Dave Jiang 2023-05-11  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
