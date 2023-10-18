Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5437143
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a++s+2uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697668112; x=1729204112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPfOw9s+AWvY1dbHLZxeBo/X+zTaZnLil/lVux7qNbk=;
  b=a++s+2uut3MGj3Xdix8wQapixbmx2s7LgopBYtCNEUaVMcXuGR62v14E
   XtgDmKpu9uudtsL57YcUTv0FYaQ9pbD8plftjB56Nv+TXC80aGW2y2qy7
   kybWC9t/TerytaM/cjPcqz2Y9AgG1gXTSed+7mlEjZu7hBnDSI1nNfNlg
   znwwcorwcP7Is2G8877n2jlY244wTLqIcODHycCD0mzBXjF+k+B6PiIa5
   1/hOE7JRV6Z1ogBlD8hbB6qAE4OAF2gV5VmAT4Y5frkFnFakxzo2bLCr2
   x/YbvFVBcc/gU2y+l/3ZS5Q9yv3HlmiyTqdd60N49H6weJ2com8pVMF8G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376500366"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="376500366"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880398859"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="880398859"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Oct 2023 15:28:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtF1g-0001Ag-16;
	Wed, 18 Oct 2023 22:28:28 +0000
Date: Thu, 19 Oct 2023 06:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10253/11192]
 drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13:
 sparse: sparse: too long token expansion
Message-ID: <202310190649.jDHLjBmV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 8c4eff8c0106706bfe559cbd9c7c00e7cdf2f025 [10253/11192] minmax: allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-062-20231019 (https://download.01.org/0day-ci/archive/20231019/202310190649.jDHLjBmV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190649.jDHLjBmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310190649.jDHLjBmV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:58:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:60:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c:62:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:32:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:37:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:39:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c:40:20: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:36:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:38:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.c:41:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:45:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c:48:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/sh_css_params.c:3414:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3417:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3420:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/sh_css_params.c:3423:46: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:41:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:42:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:43:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.c:44:29: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:61:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:63:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:66:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:68:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:70:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:72:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:74:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:76:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:78:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c:80:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:55:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:57:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:59:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:73:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:90:21: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c:93:21: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c:47:23: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:41:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:43:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c:45:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:43:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:46:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:49:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c:52:13: sparse: sparse: too long token expansion
--
>> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: sparse: sparse: too long token expansion
>> drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:47:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:49:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:51:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:53:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:55:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:71:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:75:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:83:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:86:14: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:89:14: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:104:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:107:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: sparse: sparse: too long token expansion
   drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c:109:13: sparse: sparse: too long token expansion

vim +58 drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  48  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  49  void
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  50  ia_css_bh_encode(
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  51      struct sh_css_isp_bh_params *to,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  52      const struct ia_css_3a_config *from,
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  53      unsigned int size)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  54  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  55  	(void)size;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  56  	/* coefficients to calculate Y */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  57  	to->y_coef_r =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19 @58  	    uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  59  	to->y_coef_g =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  60  	    uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  61  	to->y_coef_b =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  62  	    uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  63  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/bh/bh_2/ia_css_bh.host.c Mauro Carvalho Chehab 2020-04-19  64  

:::::: The code at line 58 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
