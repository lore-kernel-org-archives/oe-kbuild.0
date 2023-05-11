Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF391B90C
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683815250; x=1715351250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLh6fGH5XMAdsBF0447oMhZXSrQZ/FAhLtHCeMVC5p0=;
  b=gghSssJ0RIh03XRDk+i/n06gRJxMBIoIfULeUQ5Ek2H+OnmGclHmFNsM
   R898mL/q1Jiqd0ZOk5gWKU8YpfwJ4Zs26sH62O+ucYf/buReGjy5Dtqwj
   6CKRet+//iY4846P92dvcF2GzuDOQAYbFGVvirhvgGCooThGD2ls9bBnB
   HNOl+9mj5QuMPyty2/JgPeGAe7eVdDv5XOR5ssLpjMK3MicZfhMXK+ndQ
   f5XdSgcC6jo+Q+H9Ps1hLC/8GHdEN3NTdI9Bg7HQ4F5KcekjDzboWUPMZ
   Cz+CS9c7foFgj4j1QK7EWLyvpPgiig5ef5+NUXRO/DKkuOaj50KQjoaWq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="347985627"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="347985627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 07:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677253952"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="677253952"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2023 07:27:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px7GR-00042q-2l;
	Thu, 11 May 2023 14:27:27 +0000
Date: Thu, 11 May 2023 22:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Message-ID: <202305112231.bPWxVdqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230510174550.986965-5-alan.previn.teres.alexis@intel.com>
References: <20230510174550.986965-5-alan.previn.teres.alexis@intel.com>
TO: Alan Previn <alan.previn.teres.alexis@intel.com>

Hi Alan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92b7f1c42fc99ff1bad5e18d6b1aaa585f134d47]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230511-014737
base:   92b7f1c42fc99ff1bad5e18d6b1aaa585f134d47
patch link:    https://lore.kernel.org/r/20230510174550.986965-5-alan.previn.teres.alexis%40intel.com
patch subject: [PATCH v10 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230511/202305112231.bPWxVdqV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/f1ddfe299e51ec7da3580bbae92126dc61309c03
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alan-Previn/drm-i915-pxp-Add-GSC-CS-back-end-resource-init-and-cleanup/20230511-014737
        git checkout f1ddfe299e51ec7da3580bbae92126dc61309c03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305112231.bPWxVdqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from arch/x86/include/asm/perf_event.h:5,
                    from include/linux/perf_event.h:25,
                    from drivers/gpu/drm/i915/i915_pmu.h:11,
                    from drivers/gpu/drm/i915/gt/intel_engine_types.h:21,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gt/intel_context.h:13,
                    from drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:8:
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c: In function 'gsccs_send_message':
>> include/drm/drm_print.h:456:39: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_warn'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:466:9: note: in expansion of macro '__drm_printk'
     466 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:112:17: note: in expansion of macro 'drm_warn'
     112 |                 drm_warn(&i915->drm, "caller with insufficient PXP reply size %u (%ld)\n",
         |                 ^~~~~~~~
   cc1: all warnings being treated as errors


vim +456 include/drm/drm_print.h

e820f52577b14c Jim Cromie            2022-09-11  416  
02c9656b2f0d69 Haneen Mohammed       2017-10-17  417  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  418   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d69 Haneen Mohammed       2017-10-17  419   *
306589856399e1 Douglas Anderson      2021-09-21  420   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e1 Douglas Anderson      2021-09-21  421   *
091756bbb1a961 Haneen Mohammed       2017-10-17  422   * @dev: device pointer
091756bbb1a961 Haneen Mohammed       2017-10-17  423   * @fmt: printf() like format string.
02c9656b2f0d69 Haneen Mohammed       2017-10-17  424   */
db87086492581c Joe Perches           2018-03-16  425  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c Joe Perches           2018-03-16  426  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  427  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  428   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  429   *
306589856399e1 Douglas Anderson      2021-09-21  430   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e1 Douglas Anderson      2021-09-21  431   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  432   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  433   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  434   */
db87086492581c Joe Perches           2018-03-16  435  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  436  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  437  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  438   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  439   *
306589856399e1 Douglas Anderson      2021-09-21  440   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e1 Douglas Anderson      2021-09-21  441   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  442   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  443   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  444   */
db87086492581c Joe Perches           2018-03-16  445  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  446  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af Lyude Paul            2018-07-16  447  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  448  /*
fb6c7ab8718eb2 Jani Nikula           2019-12-10  449   * struct drm_device based logging
fb6c7ab8718eb2 Jani Nikula           2019-12-10  450   *
fb6c7ab8718eb2 Jani Nikula           2019-12-10  451   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb2 Jani Nikula           2019-12-10  452   */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  453  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  454  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  455  #define __drm_printk(drm, level, type, fmt, ...)			\
fb6c7ab8718eb2 Jani Nikula           2019-12-10 @456  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb2 Jani Nikula           2019-12-10  457  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
