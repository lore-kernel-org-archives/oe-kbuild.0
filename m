Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BD8241F8
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEmy8Ygf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699048861; x=1730584861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zVXgKofRSn+vJzVWgbcch0IXBwhkvSYx2om3vCOE8A=;
  b=VEmy8Ygflj00pAL6OIfhgr/Qsm9tBxZSkbJKkBdd/JXu3W/alV6kKhWA
   5N4o3g+d59jbleTluh5ioTTj+iwlX4KvuGsYYOTAXJyjtnLGAwj/yfqJp
   yOuZJm0LKuQv//5oEL3KdWMIWZn1aDPZfjhPV2GXzabKLcQC2ctOUthH9
   PRfulmccopLAWi/oe4kh+OtE2KmtnwP20TyLPBInU61ktXxaiZs0Q10XT
   obT1ahbnrKN7Xd8w7RgMfs+Zmt3egHF2+hiuSlBgLVziRdBMPU7dlm+tc
   7udoEFosqli8WMCCUDfRQKKE+9KXxgmoOm1MtysrIgTT4HFyJvWb0v7zz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387918179"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="387918179"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765385313"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765385313"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 15:00:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2Dm-0002yx-2c;
	Fri, 03 Nov 2023 22:00:54 +0000
Date: Sat, 4 Nov 2023 05:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.11.01a 15/37] arch/x86/kernel/nmi.c:441:6:
 warning: no previous prototype for 'set_nmi_torture'
Message-ID: <202311040550.Ztqr6HE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 15ff657545e64ac97a69bccacc286422bc9ab0c4 was found in branch paulmck-rcu/dev.2023.11.01a, not in new branch paulmck-rcu/dev.2023.11.02a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.11.01a
head:   20f4197bb35ccf39ddfb8563865092eb09450556
commit: 15ff657545e64ac97a69bccacc286422bc9ab0c4 [15/37] EXP x86/nmi: Add a set_nmi_torture() function to control NMI testing
:::::: branch date: 26 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-002-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040550.Ztqr6HE2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040550.Ztqr6HE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311040550.Ztqr6HE2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for 'set_nmi_torture' [-Wmissing-prototypes]
     441 | void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
         |      ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV7640
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_GO7007 [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && MEDIA_ANALOG_TV_SUPPORT [=y] && VIDEO_DEV [=y] && I2C [=y] && SND [=y] && USB [=y] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_OV7670
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_CAFE_CCIC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && PCI [=y] && I2C [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

15ff657545e64ac Paul E. McKenney 2023-01-20  439  
15ff657545e64ac Paul E. McKenney 2023-01-20  440  /* Set the test values as desired. */
15ff657545e64ac Paul E. McKenney 2023-01-20 @441  void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
15ff657545e64ac Paul E. McKenney 2023-01-20  442  {
15ff657545e64ac Paul E. McKenney 2023-01-20  443  	WRITE_ONCE(nmi_delay, nmi_delay_in);
15ff657545e64ac Paul E. McKenney 2023-01-20  444  	WRITE_ONCE(nmi_halt1, nmi_halt1_in);
15ff657545e64ac Paul E. McKenney 2023-01-20  445  	WRITE_ONCE(nmi_halt2, nmi_halt2_in);
15ff657545e64ac Paul E. McKenney 2023-01-20  446  	WRITE_ONCE(nmi_halt3, nmi_halt3_in);
15ff657545e64ac Paul E. McKenney 2023-01-20  447  	pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
15ff657545e64ac Paul E. McKenney 2023-01-20  448  		__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
15ff657545e64ac Paul E. McKenney 2023-01-20  449  }
15ff657545e64ac Paul E. McKenney 2023-01-20  450  EXPORT_SYMBOL_GPL(set_nmi_torture);
15ff657545e64ac Paul E. McKenney 2023-01-20  451  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
