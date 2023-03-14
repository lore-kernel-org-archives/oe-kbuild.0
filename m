Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD893C30
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678817269; x=1710353269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k0W2Obv9c0aTDZR7GulzWAidPSsUH5ymmkAUvoy0Lj8=;
  b=Awomneh6iFnQ5YXs/ytgdqKRH0dTQFIFg5DxciLLr8IK//3dP0ujYUjT
   DAeEDa/3mlePaAumBaa/VQrwk9ACP4xHYTrXgTpMI88NA9R3U0IXifapr
   4G+sONoKfDfrY5NEUElzOidEd4iXMp84IVR25SYCCadE1kAC6F2qXyLFF
   J+uf4bff4Bsct5I8yn6x5Fnfeb+RgMpHom+hY0hIe1eaS/M3UVc3eCze2
   af6DUpprr4kBjAYjjqDOugLMYdX6Ty2esakPUmhpPhYOoOCVXUZ+NJK+u
   2pYdUCkYvCEkEi5GJQz4+sIRbtvQcH1O3PYehvp5Y1pYmESRAWMLTcJz9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365175928"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365175928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="925030693"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="925030693"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2023 11:07:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc93q-00075T-2t;
	Tue, 14 Mar 2023 18:07:46 +0000
Date: Wed, 15 Mar 2023 02:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 340/9999] undefined reference to
 `fb_set_suspend'
Message-ID: <202303150232.MBonYhiv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: (.text+0x772): undefined reference to `fb_set_suspend'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gwendal Grignou <gwendal@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Benson Leung <bleung@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   2ddbd0f967b34872290e0f98fae32b91b4de7b87
commit: 81e5b16de862866e7f09a1b00b49f97a9bc23a78 [340/9999] platform: chrome: Split trace include file
:::::: branch date: 33 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-s043-20230313 (https://download.01.org/0day-ci/archive/20230315/202303150232.MBonYhiv-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=81e5b16de862866e7f09a1b00b49f97a9bc23a78
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 81e5b16de862866e7f09a1b00b49f97a9bc23a78
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303150232.MBonYhiv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
>> (.text+0x772): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drm_fb_helper.c:(.text+0x7d2): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
>> (.text+0x952): undefined reference to `unregister_framebuffer'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
>> (.text+0x9a2): undefined reference to `fb_sys_read'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
>> (.text+0x2842): undefined reference to `fb_dealloc_cmap'
>> ia64-linux-ld: (.text+0x2852): undefined reference to `framebuffer_release'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
>> (.text+0x2da2): undefined reference to `framebuffer_alloc'
>> ia64-linux-ld: (.text+0x2de2): undefined reference to `fb_alloc_cmap'
   ia64-linux-ld: (.text+0x2e22): undefined reference to `framebuffer_release'
>> ia64-linux-ld: (.text+0x2eb2): undefined reference to `fb_dealloc_cmap'
   ia64-linux-ld: (.text+0x2ec2): undefined reference to `framebuffer_release'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drm_fb_helper.c:(.text+0x31f2): undefined reference to `fb_deferred_io_init'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drm_fb_helper.c:(.text+0x34d2): undefined reference to `register_framebuffer'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   (.text+0x4c72): undefined reference to `fb_set_suspend'
>> ia64-linux-ld: (.text+0x4cd2): undefined reference to `fb_set_suspend'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
>> (.text+0x6362): undefined reference to `fb_sys_write'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
>> (.text+0x6402): undefined reference to `sys_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
>> (.text+0x64a2): undefined reference to `sys_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
>> (.text+0x6542): undefined reference to `sys_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
>> (.text+0x65e2): undefined reference to `cfb_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
>> (.text+0x6682): undefined reference to `cfb_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
>> (.text+0x6722): undefined reference to `cfb_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_copyarea':
   drm_fb_helper.c:(.text+0x67f2): undefined reference to `cfb_copyarea'
   ia64-linux-ld: drm_fb_helper.c:(.text+0x6862): undefined reference to `sys_copyarea'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_fillrect':
   drm_fb_helper.c:(.text+0x6932): undefined reference to `cfb_fillrect'
   ia64-linux-ld: drm_fb_helper.c:(.text+0x69a2): undefined reference to `sys_fillrect'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_fb_imageblit':
   drm_fb_helper.c:(.text+0x6a72): undefined reference to `cfb_imageblit'
   ia64-linux-ld: drm_fb_helper.c:(.text+0x6ae2): undefined reference to `sys_imageblit'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drm_fb_helper.c:(.text+0x7162): undefined reference to `fb_deferred_io_cleanup'
   ia64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_client_unregister':
   drm_fb_helper.c:(.text+0x7342): undefined reference to `unregister_framebuffer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
