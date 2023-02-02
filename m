Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2FE7F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675324639; x=1706860639;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=unjzbZkunBs5lBCQVTUbtlusIgDR+pFZ40WWs56srvQ=;
  b=TMRq8hMWQY635VjsNhfEMqpBD76EiFX67PIPgXusZlV9uGC24lG1hAP6
   5pNAJMdOjAC+uxAslMk1Z1+rACltNk8DwUF33rqbTrDsve4fkjAwHbnoJ
   O57VRIo1AZEtn6LTMdnP08EyG3Rh9VGJluxy+zyfI/8xHhzCUdoGGh+hm
   uszC3pevcQ86Z5nUPCdvdwnIoa3zbHZQ9kllkmC8iDHX+I4wXKIx7HdAZ
   bAwl0GIdz53eFENrAw2CTiTtDGjjJRa47+JeGbWpWJ0C7eGaN7mzJzFTY
   otCrqXTT1pAC/4WsqIcBa25+6aVxNJRgqTik7+IOruiqQqWUBRxfX+N+m
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414590097"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="414590097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 23:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="753981534"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="753981534"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2023 23:57:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNUT7-0006Ic-1o;
	Thu, 02 Feb 2023 07:57:17 +0000
Date: Thu, 2 Feb 2023 15:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [driver-core:kobject-const 28/30] drivers/base/platform.c:886:57:
 warning: Parameter 'driver' can be declared as pointer to const
 [constParameter]
Message-ID: <202302021533.qdo93vxD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/base/platform.c:886:57: warning: Parameter 'driver' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const
head:   3c0eee8be59d8fbd2b794443bbe787c35c2e2076
commit: d09a225c093ae441ae080f65d7e032856f3f0bfd [28/30] driver core: platform: simplify __platform_driver_probe()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d09a225c093ae441ae080f65d7e032856f3f0bfd
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/soc.c:68:75: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
   static ssize_t soc_info_show(struct device *dev, struct device_attribute *attr,
                                                                             ^
--
>> drivers/base/platform.c:886:57: warning: Parameter 'driver' can be declared as pointer to const [constParameter]
   static int is_bound_to_driver(struct device *dev, void *driver)
                                                           ^

vim +/driver +886 drivers/base/platform.c

e21d740a3fe5ad2 Uwe Kleine-König   2020-11-19  885  
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30 @886  static int is_bound_to_driver(struct device *dev, void *driver)
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  887  {
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  888  	if (dev->driver == driver)
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  889  		return 1;
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  890  	return 0;
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  891  }
d09a225c093ae44 Greg Kroah-Hartman 2023-01-30  892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
