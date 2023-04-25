Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4DA93E
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Apr 2023 21:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682458508; x=1713994508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3rwxv/JZ9wZcUf+aLgkvHlPsM+i7Dtyk1Fl/1kJmL0=;
  b=VVZjdoIJDedXxHtkBFgEFkqFeA35f/3uRUa5zt9KpYz9pQneSLabqpbv
   G+g+D2RTt6Y9DS0EJ97fdnUJ084BRdW6hWfKCCJBe14x1AnwzY72PocQj
   A/gojEKn3Hs7hY0oZYtFI5kz5dqfrXJwxY96tN71fadIa6GvW24I2CDTI
   QNgbjv/Ibznpa+Qs0LKm5r4rGtJ02yhZXRR6rJ3A+0n+O+GCBZah+eM5e
   h+X9GUiB5WHh9BqkF5Jo2MXZ9qenW21VKZyHIlvT5Nr5RyCDHzrXQgpZy
   VbMV63+Ah8cX98GZs1l5Tw3Zc9qU5AGi9j1zZJnRCYGt9vi1d2Q7goAjA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344367195"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="344367195"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="696366323"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="696366323"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 14:35:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prQJQ-000jnC-2u;
	Tue, 25 Apr 2023 21:35:00 +0000
Date: Wed, 26 Apr 2023 05:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stable:linux-5.15.y 7337/9999] ld:
 drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
Message-ID: <202304260542.FgwNJuME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ld: drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sasha Levin <sashal@kernel.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   3299fb36854fdc288bddc2c4d265f8a2e5105944
commit: 30f20ceb87f78a14645acd7996397af7fee6e518 [7337/9999] overflow: Implement size_t saturating arithmetic helpers
:::::: branch date: 5 days ago
:::::: commit date: 4 months ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230426/202304260542.FgwNJuME-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=30f20ceb87f78a14645acd7996397af7fee6e518
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 30f20ceb87f78a14645acd7996397af7fee6e518
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304260542.FgwNJuME-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
   drivers/gpu/drm/drm_fb_helper.c:370: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
   drivers/gpu/drm/drm_fb_helper.c:634: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:633: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
   drivers/gpu/drm/drm_fb_helper.c:1867: undefined reference to `register_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
   drivers/gpu/drm/drm_fb_helper.c:559: undefined reference to `framebuffer_alloc'
   ld: drivers/gpu/drm/drm_fb_helper.c:563: undefined reference to `fb_alloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.c:589: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/drm_fb_helper.c:587: undefined reference to `fb_dealloc_cmap'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_generic_probe':
   drivers/gpu/drm/drm_fb_helper.c:2360: undefined reference to `fb_deferred_io_init'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
>> ld: drivers/gpu/drm/drm_fb_helper.c:839: undefined reference to `cfb_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:824: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_cfb_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:809: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fbdev_cleanup':
   drivers/gpu/drm/drm_fb_helper.c:2054: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_fbi':
   drivers/gpu/drm/drm_fb_helper.c:605: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_read':
   drivers/gpu/drm/drm_fb_helper.c:728: undefined reference to `fb_sys_read'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_write':
   drivers/gpu/drm/drm_fb_helper.c:746: undefined reference to `fb_sys_write'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_fillrect':
   drivers/gpu/drm/drm_fb_helper.c:764: undefined reference to `sys_fillrect'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_copyarea':
   drivers/gpu/drm/drm_fb_helper.c:779: undefined reference to `sys_copyarea'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_sys_imageblit':
   drivers/gpu/drm/drm_fb_helper.c:794: undefined reference to `sys_imageblit'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
   drivers/gpu/drm/drm_fb_helper.c:856: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
   drivers/gpu/drm/drm_fb_helper.c:901: undefined reference to `fb_set_suspend'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_imageblit':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:382: undefined reference to `cfb_imageblit'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_copyarea':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:375: undefined reference to `cfb_copyarea'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_fillrect':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:368: undefined reference to `cfb_fillrect'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_init':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:650: undefined reference to `framebuffer_alloc'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:759: undefined reference to `framebuffer_release'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:743: undefined reference to `fb_deferred_io_init'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:745: undefined reference to `register_framebuffer'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:754: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.o: in function `vmw_fb_close':
   drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:777: undefined reference to `fb_deferred_io_cleanup'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:779: undefined reference to `unregister_framebuffer'
   ld: drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:786: undefined reference to `framebuffer_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
