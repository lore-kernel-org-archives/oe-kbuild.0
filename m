Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE1080C
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687423716; x=1718959716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65fCJgsppMa/rIRXZBW68tseNTMCEkL3b6y0c75r8DU=;
  b=FhOYIu9IxwL+bbO87E7e9gzqwpbOZd04FhpkkkuzR4PoxQQiNkLXQ1pp
   t5lfXpr3y5wKcqxRZLxZXh90ehLgSquBhAwRb0I3Goaxkwtc8enQw1afe
   bSL3GWlQmRiLHl2LMMDRKRddeBGfkukeUoTfL808Dd+QKz3OzlKZ0asbb
   W+feL98LWHj1meU4KsVVvqq7HwdTyAPtHYfv5dEuRkt5+c6fdvpIDhl8L
   3X68AiEsabOeNzZffl90hIiik8Logr6MSY/ClMGwLJr8LWCmoYnjsw9Zw
   Kd6UQHYJKqCuo/ewxp1ppV8GmPyhaFV7o2+YQASLzGYd1crNVeDDmdZU9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350165535"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="350165535"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 01:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784819394"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="784819394"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2023 01:48:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCFzV-0007SP-37;
	Thu, 22 Jun 2023 08:48:33 +0000
Date: Thu, 22 Jun 2023 16:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2829/11867] drivers/scsi/scsi.c:591:1-3: WARNING:
 possible condition with no effect (if == else)
Message-ID: <202306221657.BJHEADkz-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Damien Le Moal <dlemoal@kernel.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Niklas Cassel <niklas.cassel@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 624885209f31eb9985bf51abe204ecbffe2fdeea [2829/11867] scsi: core: Detect support for command duration limits
:::::: branch date: 28 hours ago
:::::: commit date: 4 weeks ago
config: csky-randconfig-c041-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221657.BJHEADkz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221657.BJHEADkz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306221657.BJHEADkz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/scsi.c:591:1-3: WARNING: possible condition with no effect (if == else)

vim +591 drivers/scsi/scsi.c

624885209f31eb Damien Le Moal 2023-05-11  574  
624885209f31eb Damien Le Moal 2023-05-11  575  static bool scsi_cdl_check_cmd(struct scsi_device *sdev, u8 opcode, u16 sa,
624885209f31eb Damien Le Moal 2023-05-11  576  			       unsigned char *buf)
624885209f31eb Damien Le Moal 2023-05-11  577  {
624885209f31eb Damien Le Moal 2023-05-11  578  	int ret;
624885209f31eb Damien Le Moal 2023-05-11  579  	u8 cdlp;
624885209f31eb Damien Le Moal 2023-05-11  580  
624885209f31eb Damien Le Moal 2023-05-11  581  	/* Check operation code */
624885209f31eb Damien Le Moal 2023-05-11  582  	ret = scsi_report_opcode(sdev, buf, SCSI_CDL_CHECK_BUF_LEN, opcode, sa);
624885209f31eb Damien Le Moal 2023-05-11  583  	if (ret <= 0)
624885209f31eb Damien Le Moal 2023-05-11  584  		return false;
624885209f31eb Damien Le Moal 2023-05-11  585  
624885209f31eb Damien Le Moal 2023-05-11  586  	if ((buf[1] & 0x03) != 0x03)
624885209f31eb Damien Le Moal 2023-05-11  587  		return false;
624885209f31eb Damien Le Moal 2023-05-11  588  
624885209f31eb Damien Le Moal 2023-05-11  589  	/* See SPC-6, one command format of REPORT SUPPORTED OPERATION CODES */
624885209f31eb Damien Le Moal 2023-05-11  590  	cdlp = (buf[1] & 0x18) >> 3;
624885209f31eb Damien Le Moal 2023-05-11 @591  	if (buf[0] & 0x01) {
624885209f31eb Damien Le Moal 2023-05-11  592  		/* rwcdlp == 1 */
624885209f31eb Damien Le Moal 2023-05-11  593  		switch (cdlp) {
624885209f31eb Damien Le Moal 2023-05-11  594  		case 0x01:
624885209f31eb Damien Le Moal 2023-05-11  595  			/* T2A page */
624885209f31eb Damien Le Moal 2023-05-11  596  			return true;
624885209f31eb Damien Le Moal 2023-05-11  597  		case 0x02:
624885209f31eb Damien Le Moal 2023-05-11  598  			/* T2B page */
624885209f31eb Damien Le Moal 2023-05-11  599  			return true;
624885209f31eb Damien Le Moal 2023-05-11  600  		}
624885209f31eb Damien Le Moal 2023-05-11  601  	} else {
624885209f31eb Damien Le Moal 2023-05-11  602  		/* rwcdlp == 0 */
624885209f31eb Damien Le Moal 2023-05-11  603  		switch (cdlp) {
624885209f31eb Damien Le Moal 2023-05-11  604  		case 0x01:
624885209f31eb Damien Le Moal 2023-05-11  605  			/* A page */
624885209f31eb Damien Le Moal 2023-05-11  606  			return true;
624885209f31eb Damien Le Moal 2023-05-11  607  		case 0x02:
624885209f31eb Damien Le Moal 2023-05-11  608  			/* B page */
624885209f31eb Damien Le Moal 2023-05-11  609  			return true;
624885209f31eb Damien Le Moal 2023-05-11  610  		}
624885209f31eb Damien Le Moal 2023-05-11  611  	}
624885209f31eb Damien Le Moal 2023-05-11  612  
624885209f31eb Damien Le Moal 2023-05-11  613  	return false;
624885209f31eb Damien Le Moal 2023-05-11  614  }
624885209f31eb Damien Le Moal 2023-05-11  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
