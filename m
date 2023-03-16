Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC233AD32
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679003216; x=1710539216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tPWx8pvlkdFa0Sw8ID9zQJXxLupWX8eIEw57hEFBrx4=;
  b=NI7tmAhOqTAATGR09xoIp0dSUQsxb7fSPdSUJevo18ZRj66CsAssFPhn
   cmr4AbbNe7e0INx0gLp7G5/ReAcMvFQTu6r6IgeqzcxeKq+xkJRiX4xmk
   R5c88fB+I884239lbzIuQRcISD7Tw3tk7l7erM7bku/6xXBB8vvZVXRwA
   kZ4VFwckkoj1FUqjozKxk3joNLyir6PoZL2JsuU5KY7p2pJGVMDt/DyLy
   aeuANjLNeYXUHERg1vmwVpkq1OhEq1JNRbj1HiIeA7/xJyZ3vvMDBIwq6
   l7L+O+VscKL8XvmdR3U+Wk9qFeIxVUbskxDTv7KRaqrd/4IWjyLIkT3sm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424390299"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="424390299"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 14:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="790478287"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="790478287"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2023 14:46:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcvQq-0008rG-35;
	Thu, 16 Mar 2023 21:46:44 +0000
Date: Fri, 17 Mar 2023 05:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pinchartl:drm/compile-test 5/8]
 drivers/gpu/drm/sti/sti_hqvdp.c:743:6: warning: Division by zero
 [clang-analyzer-core.DivideZero]
Message-ID: <202303170541.S4nfbGjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/sti/sti_hqvdp.c:743:6: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git drm/compile-test
head:   2ad2b695b4dae8be1f7f67bf4c1c87542cba32f2
commit: 07617d4d1e03e50de78fed4599bea3239b334d83 [5/8] drm/sti: Enable COMPILE_TEST on all architectures
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170541.S4nfbGjU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=07617d4d1e03e50de78fed4599bea3239b334d83
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl drm/compile-test
        git checkout 07617d4d1e03e50de78fed4599bea3239b334d83
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303170541.S4nfbGjU-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ret = regmap_write(regmap, RT6190_REG_RATIO, 0x20);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rt6190-regulator.c:358:2: note: Value stored to 'ret' is never read
           ret = regmap_write(regmap, RT6190_REG_RATIO, 0x20);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/extcon/extcon-ptn5150.c:192:2: warning: Value stored to 'vendor_id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id = FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:192:2: note: Value stored to 'vendor_id' is never read
   drivers/extcon/extcon-ptn5150.c:193:2: warning: Value stored to 'version_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id = FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:193:2: note: Value stored to 'version_id' is never read
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'struct muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name, irq, virq, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name, irq, virq, consider reordering the fields or adding explicit padding members
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (12 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   25 warnings generated.
>> drivers/gpu/drm/sti/sti_hqvdp.c:743:6: warning: Division by zero [clang-analyzer-core.DivideZero]
           lfw /= max(src_w, dst_w) * mode->clock / 1000;
               ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1036:6: note: Assuming 'crtc' is non-null
           if (!crtc || !fb)
               ^~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1036:6: note: Left side of '||' is false
   drivers/gpu/drm/sti/sti_hqvdp.c:1036:15: note: Assuming 'fb' is non-null
           if (!crtc || !fb)
                        ^~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1036:2: note: Taking false branch
           if (!crtc || !fb)
           ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1043:10: note: Assuming '__UNIQUE_ID___val282' is < '__UNIQUE_ID___hi284'
           dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
                   ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^~~~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1043:10: note: '?' condition is false
           dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
                   ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
            ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1043:10: note: Assuming '__UNIQUE_ID___val282' is <= '__UNIQUE_ID___lo283'
           dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
                   ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:41:27: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
                                    ^~~~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1043:10: note: '?' condition is true
           dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
                   ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^
   include/linux/minmax.h:41:27: note: expanded from macro '__clamp'
           ((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
                                    ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1044:10: note: Assuming '__UNIQUE_ID___val285' is >= '__UNIQUE_ID___hi287'
           dst_h = clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay - dst_y);
                   ^
   include/linux/minmax.h:159:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:146:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:59:3: note: expanded from macro '__careful_clamp'
                   __clamp_once(val, lo, hi, __UNIQUE_ID(__val),           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:47:3: note: expanded from macro '__clamp_once'
                   __clamp(unique_val, unique_lo, unique_hi); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:41:3: note: expanded from macro '__clamp'

vim +743 drivers/gpu/drm/sti/sti_hqvdp.c

4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  712  
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  713  /**
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  714   * sti_hqvdp_check_hw_scaling
29d1dc62e16181 Vincent Abriou    2015-08-03  715   * @hqvdp: hqvdp pointer
29d1dc62e16181 Vincent Abriou    2015-08-03  716   * @mode: display mode with timing constraints
29d1dc62e16181 Vincent Abriou    2015-08-03  717   * @src_w: source width
29d1dc62e16181 Vincent Abriou    2015-08-03  718   * @src_h: source height
29d1dc62e16181 Vincent Abriou    2015-08-03  719   * @dst_w: destination width
29d1dc62e16181 Vincent Abriou    2015-08-03  720   * @dst_h: destination height
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  721   *
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  722   * Check if the HW is able to perform the scaling request
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  723   * The firmware scaling limitation is "CEIL(1/Zy) <= FLOOR(LFW)" where:
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  724   *   Zy = OutputHeight / InputHeight
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  725   *   LFW = (Tx * IPClock) / (MaxNbCycles * Cp)
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  726   *     Tx : Total video mode horizontal resolution
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  727   *     IPClock : HQVDP IP clock (Mhz)
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  728   *     MaxNbCycles: max(InputWidth, OutputWidth)
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  729   *     Cp: Video mode pixel clock (Mhz)
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  730   *
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  731   * RETURNS:
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  732   * True if the HW can scale.
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  733   */
29d1dc62e16181 Vincent Abriou    2015-08-03  734  static bool sti_hqvdp_check_hw_scaling(struct sti_hqvdp *hqvdp,
29d1dc62e16181 Vincent Abriou    2015-08-03  735  				       struct drm_display_mode *mode,
29d1dc62e16181 Vincent Abriou    2015-08-03  736  				       int src_w, int src_h,
29d1dc62e16181 Vincent Abriou    2015-08-03  737  				       int dst_w, int dst_h)
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  738  {
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  739  	unsigned long lfw;
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  740  	unsigned int inv_zy;
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  741  
29d1dc62e16181 Vincent Abriou    2015-08-03  742  	lfw = mode->htotal * (clk_get_rate(hqvdp->clk) / 1000000);
29d1dc62e16181 Vincent Abriou    2015-08-03 @743  	lfw /= max(src_w, dst_w) * mode->clock / 1000;
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  744  
29d1dc62e16181 Vincent Abriou    2015-08-03  745  	inv_zy = DIV_ROUND_UP(src_h, dst_h);
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  746  
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  747  	return (inv_zy <= lfw) ? true : false;
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  748  }
4fdbc678fe4dc1 Benjamin Gaignard 2014-12-11  749  

:::::: The code at line 743 was first introduced by commit
:::::: 29d1dc62e1618192a25bd2eae9617529b9930cfc drm/sti: atomic crtc/plane update

:::::: TO: Vincent Abriou <vincent.abriou@st.com>
:::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
