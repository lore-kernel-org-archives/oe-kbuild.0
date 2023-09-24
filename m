Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801A365
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695537851; x=1727073851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERJ3t1o1qe6NE3ivFMsjRMEb9Dcw0668498sIKZDJXc=;
  b=ljhuV4zJAGV7TRCSkxKVF+Vtqeeky1nEvOv7JLdGVCPwA3DxU/m2GJwL
   jytWj/LUTlOP103S0umuWlgNq+LQZ9s0dtnWgU8oDQjVBiOrNvZDk6A4W
   hYFt+qoirIivxuz3ksNXs1v5ff8UjTkK2uHmoOZR29WKrn7R5cRTra9fN
   fuVQOC5QZlBHmsQM8mgFpD0WciP6gfjgdPp7Z2KsMHZTKQjH/d/N2qevq
   k6HJ/RAWo8oDAPBMe23ze+z/ccpxqiXLszcygfzu6rCR8BEvTHtr5CRtz
   KJmvidcWZhP4NCU7AaZwDl5+ke+2UpIyYUYaIj/MKl556tWFqAD/Z0VED
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="412010264"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="412010264"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 23:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777324257"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="777324257"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Sep 2023 23:44:08 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkIqc-0003KD-0m;
	Sun, 24 Sep 2023 06:44:06 +0000
Date: Sun, 24 Sep 2023 14:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM address
 translation interface
Message-ID: <202309241453.RCKvoFI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920192806.29960-14-fancer.lancer@gmail.com>
References: <20230920192806.29960-14-fancer.lancer@gmail.com>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Michal Simek <monstr@monstr.eu>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Tony Luck <tony.luck@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Robert Richter <rric@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-edac@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Serge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[cannot apply to xilinx-xlnx/master bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-synopsys-Convert-sysfs-nodes-to-debugfs-ones/20230921-035302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20230920192806.29960-14-fancer.lancer%40gmail.com
patch subject: [PATCH v4 13/18] EDAC/synopsys: Introduce System/SDRAM address translation interface
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241453.RCKvoFI9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241453.RCKvoFI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309241453.RCKvoFI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:482:13: warning: 'snps_map_sys_to_sdram' defined but not used [-Wunused-function]
     482 | static void snps_map_sys_to_sdram(struct snps_edac_priv *priv,
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/snps_map_sys_to_sdram +482 drivers/edac/synopsys_edac.c

07abea90e8d373 Serge Semin 2023-09-20  472  
07abea90e8d373 Serge Semin 2023-09-20  473  /**
07abea90e8d373 Serge Semin 2023-09-20  474   * snps_map_sys_to_sdram - Map System address to SDRAM address.
07abea90e8d373 Serge Semin 2023-09-20  475   * @priv:	DDR memory controller private instance data.
07abea90e8d373 Serge Semin 2023-09-20  476   * @sys:	System address (source).
07abea90e8d373 Serge Semin 2023-09-20  477   * @sdram:	SDRAM address (destination).
07abea90e8d373 Serge Semin 2023-09-20  478   *
07abea90e8d373 Serge Semin 2023-09-20  479   * Perform a full mapping of the system address (detected on the controller
07abea90e8d373 Serge Semin 2023-09-20  480   * ports) to the SDRAM address tuple row/column/bank/etc.
07abea90e8d373 Serge Semin 2023-09-20  481   */
07abea90e8d373 Serge Semin 2023-09-20 @482  static void snps_map_sys_to_sdram(struct snps_edac_priv *priv,
07abea90e8d373 Serge Semin 2023-09-20  483  				  dma_addr_t sys, struct snps_sdram_addr *sdram)
07abea90e8d373 Serge Semin 2023-09-20  484  {
07abea90e8d373 Serge Semin 2023-09-20  485  	u64 app, hif;
07abea90e8d373 Serge Semin 2023-09-20  486  
07abea90e8d373 Serge Semin 2023-09-20  487  	app = sys;
07abea90e8d373 Serge Semin 2023-09-20  488  
07abea90e8d373 Serge Semin 2023-09-20  489  	snps_map_app_to_hif(priv, app, &hif);
07abea90e8d373 Serge Semin 2023-09-20  490  
07abea90e8d373 Serge Semin 2023-09-20  491  	snps_map_hif_to_sdram(priv, hif, sdram);
07abea90e8d373 Serge Semin 2023-09-20  492  }
07abea90e8d373 Serge Semin 2023-09-20  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
