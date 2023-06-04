Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3893A1FD6
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jun 2023 06:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685859015; x=1717395015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=poOgcZqvo7fj0K+leLO0cojYZUZT89jA6D6dTenQ8+k=;
  b=h3Ayjz1HGEyjtrPih9nADWHKP4P+lc8TOO0t704KOP0QtMEV8B6nr9z8
   6+4kHbU3wmBgJL8TH8W8ynNLDdqJT2CvVhtWvFwxS+2iuWR16e/VCwdJ4
   71s2hpACHKeujtjCaigKY1q20GPAyIUYt50EBOgpqTTRnFa3q27eWRccc
   uBLK080086XdVzFOge0z3V8/RD/U5ib/f7fqEt50tCBLuP8pvCh6MUimQ
   FCi6YPGOi0eYHMSboVExVXHZqzBjOOlFwvfm4OU+mBxCZWoBkUB6X8EMd
   iXtjPaSQf2YSgLXDTb1rWAJgHwuCm+NWJvCWTYWepj2vf0ZhdvfApbRui
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="384449489"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="384449489"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 23:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="852595616"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="852595616"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2023 23:10:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5gwO-0002Mv-2g;
	Sun, 04 Jun 2023 06:10:12 +0000
Date: Sun, 4 Jun 2023 14:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-qtg 6/26] lib/fw_table.c:60 acpi_get_entry_length()
 warn: statement has no effect 3
Message-ID: <202306041414.zZ7hyfAQ-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   d149ac9ae1abedde6933ea16e12a44b965bb1384
commit: a4f8e943725bf7bb5dfb88bbca1f30c03f041dfa [6/26] lib/firmware_table: tables: Add CDAT table parsing support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230604 (https://download.01.org/0day-ci/archive/20230604/202306041414.zZ7hyfAQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306041414.zZ7hyfAQ-lkp@intel.com/

smatch warnings:
lib/fw_table.c:60 acpi_get_entry_length() warn: statement has no effect 3

vim +60 lib/fw_table.c

773808188a9583 Dave Jiang 2023-05-11  46  
773808188a9583 Dave Jiang 2023-05-11  47  static unsigned long __init_or_acpilib
773808188a9583 Dave Jiang 2023-05-11  48  acpi_get_entry_length(struct acpi_subtable_entry *entry)
773808188a9583 Dave Jiang 2023-05-11  49  {
773808188a9583 Dave Jiang 2023-05-11  50  	switch (entry->type) {
773808188a9583 Dave Jiang 2023-05-11  51  	case ACPI_SUBTABLE_COMMON:
773808188a9583 Dave Jiang 2023-05-11  52  		return entry->hdr->common.length;
773808188a9583 Dave Jiang 2023-05-11  53  	case ACPI_SUBTABLE_HMAT:
773808188a9583 Dave Jiang 2023-05-11  54  		return entry->hdr->hmat.length;
773808188a9583 Dave Jiang 2023-05-11  55  	case ACPI_SUBTABLE_PRMT:
773808188a9583 Dave Jiang 2023-05-11  56  		return entry->hdr->prmt.length;
773808188a9583 Dave Jiang 2023-05-11  57  	case ACPI_SUBTABLE_CEDT:
773808188a9583 Dave Jiang 2023-05-11  58  		return entry->hdr->cedt.length;
a4f8e943725bf7 Dave Jiang 2023-05-24  59  	case CDAT_SUBTABLE:
a4f8e943725bf7 Dave Jiang 2023-05-24 @60  		__le16 length = (__force __le16)entry->hdr->cdat.length;
a4f8e943725bf7 Dave Jiang 2023-05-24  61  
a4f8e943725bf7 Dave Jiang 2023-05-24  62  		return le16_to_cpu(length);
773808188a9583 Dave Jiang 2023-05-11  63  	}
773808188a9583 Dave Jiang 2023-05-11  64  	return 0;
773808188a9583 Dave Jiang 2023-05-11  65  }
773808188a9583 Dave Jiang 2023-05-11  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
