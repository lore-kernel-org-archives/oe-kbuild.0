Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F873E54D
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFi6B2dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699201596; x=1730737596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Izadu4xlhziVv3Ep4qObSUJmDUTHvi4neZLirvWCOPU=;
  b=kFi6B2dhNXy4H+dzXwH10zw38q2x0GBZ4JkCpw3Hnim9/RSkjNBhm6Wh
   tOqPqwe/kgB5aCtMA7anna8FAROEZgY0vPUm2jP77rVmKobA4/4pgPZGz
   nIzIrRu5ZQ2ezILQepIkirRkTxhVPZfIL4Y1Cl4DibPC1zgn/Zpd6wz4x
   JyGjtySPVaimqxZI49TiCtJjT5nd0WBtF61CSYoPdORxSb2/izpMeTA9h
   GBas5Ra0lEDEanbfURc7l1S2hvdpYfmN4gTOmXuOZyjd+QG8tIJMRxBql
   pJYoem9KlvhfaSXKMlraBwWqZTJpLoEud8If5X8hMe9LV5zso5mo+6z1h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2067973"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2067973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 08:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762097271"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762097271"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 08:26:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfxH-0005bw-2v;
	Sun, 05 Nov 2023 16:26:31 +0000
Date: Mon, 6 Nov 2023 00:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/comedi/drivers/tests/../ni_stc.h:1140:35: warning:
 'range_ni_E_ao_ext' defined but not used
Message-ID: <202311060001.aEuf1q9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Greg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895 staging: comedi: move out of staging directory
date:   2 years, 7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 2 years, 7 months ago
config: i386-randconfig-013-20231101 (https://download.01.org/0day-ci/archive/20231106/202311060001.aEuf1q9y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060001.aEuf1q9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311060001.aEuf1q9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/comedi/drivers/tests/ni_routes_test.c:23:
>> drivers/comedi/drivers/tests/../ni_stc.h:1140:35: warning: 'range_ni_E_ao_ext' defined but not used [-Wunused-const-variable=]
    1140 | static const struct comedi_lrange range_ni_E_ao_ext;
         |                                   ^~~~~~~~~~~~~~~~~


vim +/range_ni_E_ao_ext +1140 drivers/comedi/drivers/tests/../ni_stc.h

a8b774308dd803 drivers/staging/comedi/drivers/ni_stc.h David Schleef     2009-02-12  1139  
35bb871663ddb0 drivers/staging/comedi/drivers/ni_stc.h H Hartley Sweeten 2015-05-01 @1140  static const struct comedi_lrange range_ni_E_ao_ext;
35bb871663ddb0 drivers/staging/comedi/drivers/ni_stc.h H Hartley Sweeten 2015-05-01  1141  

:::::: The code at line 1140 was first introduced by commit
:::::: 35bb871663ddb06df9d601b32deac5f4f06b65b4 staging: comedi: ni_stc.h: final cleanup

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
