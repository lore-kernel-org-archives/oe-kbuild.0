Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737E53802
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5aPzJKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700581272; x=1732117272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQNcg70KEYCIduZb4BmFp/xldfa+AYiD0lvSNSIoHv0=;
  b=L5aPzJKkKEKNpCgDya+J5amZY9TelCEgvRer4wjlzSBRHtaN/KM0gz72
   Vw6d5R62DLEbUA035GEfzg7WG+aKBscTmK68VozQCLdg33ijGm5iEpH5U
   bZa4luaL/yRSPWnEWGN68Yi9/+rNosTxMjbkqIdva6bBiqVN1Wuq8E51i
   qo8fr1idvFZUwMljdKb3ybYRu2jmJ9OOzzVQ1l9RGAHkj9dfJ6LtbLTG5
   rkbGvO9GI5ZreLD2DYWlDRh6mVVlnaQ/vXSKrool5mFWdYP1IB2niW4Po
   fVsyRAEJ9JYI6pajbQB/ulCyJD4SVoz5syCsaoBmDUTgqRqtmHxjLN01V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458357661"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458357661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 07:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="8119388"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2023 07:41:09 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Ss6-0007xx-0m;
	Tue, 21 Nov 2023 15:41:06 +0000
Date: Tue, 21 Nov 2023 23:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/typec/ucsi/trace.c:1: warning: no structured comments
 found
Message-ID: <202311212331.qOQLkUxf-lkp@intel.com>
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
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: c1b0bc2dabfa884dea49c02adaf3cd6b52b33d2f usb: typec: Add support for UCSI interface
date:   6 years ago
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231121/202311212331.qOQLkUxf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212331.qOQLkUxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311212331.qOQLkUxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/typec/ucsi/trace.h:9:0,
                    from drivers/usb/typec/ucsi/trace.c:2:
   drivers/usb/typec/ucsi/ucsi.h:331:39: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
    struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm);
                                          ^~~~~~
>> drivers/usb/typec/ucsi/trace.c:1: warning: no structured comments found


vim +1 drivers/usb/typec/ucsi/trace.c

c1b0bc2dabfa88 Heikki Krogerus 2017-06-16 @1  #define CREATE_TRACE_POINTS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
