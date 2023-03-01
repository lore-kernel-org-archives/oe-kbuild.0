Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64B7A3F
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677643333; x=1709179333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmBXkRoMoAcwArJ33O8tK0jPHXI2dBIlYsUtDCY7Y9Q=;
  b=J2NuVdO1Q/Xu2fH0Eb6JaeiZDTVuWntDk1RKs0kuEZvKo6BBkoJZ5n9z
   9OQCPNWiNpv23Wh9oFCWo6K/O9fGncxPUPZp6tPMmFoLhq+RkrS7d1ojY
   KaTMnPhod0IZwRBDTX/pUiQ3mDWf4LhgcHxa7+kcntZoEg09JuMj5Kl/J
   k6lmiLwH0i8DtjJzEKRZn7fFaUKpKyh+jlW3JC000/RWIjRNWa8KyO7TT
   wO+20cjOfG8Jkmwnca3gg0S0xAqTk8iyASPGEqC3BWB4QbuXEYhIQWEbO
   miitCfW5b6jOzoUzxYyR0CIbWaq5ebsJ/L1MseixuEGLZatunxcl+TvgU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333043860"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="333043860"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 20:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="784170829"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="784170829"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 20:02:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXDfG-0005rn-2u;
	Wed, 01 Mar 2023 04:02:02 +0000
Date: Wed, 1 Mar 2023 12:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/ti/omap3isp/ispccp2.c:678:17: warning: use of
 NULL where non-null expected [CWE-476]
Message-ID: <202303011134.WWB2KW3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/platform/ti/omap3isp/ispccp2.c:678:17: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
commit: 2ba3e38517f5a4ebf9c997168079dca01b7f9fc6 media: v4l: subdev: Fail graciously when getting try data for NULL state
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011134.WWB2KW3l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ba3e38517f5a4ebf9c997168079dca01b7f9fc6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2ba3e38517f5a4ebf9c997168079dca01b7f9fc6
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303011134.WWB2KW3l-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/ti/omap3isp/ispccp2.c: In function 'ccp2_try_format':
>> drivers/media/platform/ti/omap3isp/ispccp2.c:678:17: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     678 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ccp2_try_format': events 1-4
       |
       |  625 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
       |      |            ~ 
       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'which == 0')...
       |......
       |  640 | static void ccp2_try_format(struct isp_ccp2_device *ccp2,
       |      |             ^~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'ccp2_try_format'
       |......
       |  648 |         switch (pad) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |
     'ccp2_try_format': event 5
       |
       |include/media/v4l2-subdev.h:1101:9:
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
   drivers/media/platform/ti/omap3isp/ispccp2.c:626:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  626 |                 return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'ccp2_try_format': event 6
       |
       |include/media/v4l2-subdev.h:1101:9:
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) calling 'v4l2_subdev_get_pad_format' from 'ccp2_try_format'
   drivers/media/platform/ti/omap3isp/ispccp2.c:626:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  626 |                 return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'v4l2_subdev_get_pad_format': events 7-8
              |
              |include/media/v4l2-subdev.h:1045:1:
              | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to 'v4l2_subdev_get_pad_format'
              |......
              | 1049 |         if (WARN_ON(!state))
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch...
              |
            'v4l2_subdev_get_pad_format': event 9
              |
              |cc1:
              | (9): ...to here
              |
       <------+
       |
     'ccp2_try_format': event 10
       |
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (10) returning to 'ccp2_try_format' from 'v4l2_subdev_get_pad_format'
   drivers/media/platform/ti/omap3isp/ispccp2.c:626:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  626 |                 return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'ccp2_try_format': event 11
       |
       |  678 |                 memcpy(fmt, format, sizeof(*fmt));
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (11) argument 2 ('<unknown>') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from drivers/media/platform/ti/omap3isp/ispccp2.c:14:
   arch/arm/include/asm/string.h:20:15: note: argument 2 of 'memcpy' must be non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~
   drivers/media/platform/ti/omap3isp/ispccp2.c:678:17: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     678 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ccp2_set_format': events 1-6
       |
       |  625 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
       |      |            ~
--
   drivers/media/platform/ti/omap3isp/ispcsi2.c: In function 'csi2_try_format':
>> drivers/media/platform/ti/omap3isp/ispcsi2.c:875:17: warning: use of NULL where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     875 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'csi2_try_format': events 1-4
       |
       |  834 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch (when 'which == 0')...
       |......
       |  842 | csi2_try_format(struct isp_csi2_device *csi2,
       |      | ^~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'csi2_try_format'
       |......
       |  852 |         switch (pad) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  868 |         case CSI2_PAD_SOURCE:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |
     'csi2_try_format': event 5
       |
       |include/media/v4l2-subdev.h:1101:9:
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
   drivers/media/platform/ti/omap3isp/ispcsi2.c:835:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  835 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'csi2_try_format': event 6
       |
       |include/media/v4l2-subdev.h:1101:9:
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) calling 'v4l2_subdev_get_pad_format' from 'csi2_try_format'
   drivers/media/platform/ti/omap3isp/ispcsi2.c:835:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  835 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'v4l2_subdev_get_pad_format': events 7-8
              |
              |include/media/v4l2-subdev.h:1045:1:
              | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to 'v4l2_subdev_get_pad_format'
              |......
              | 1049 |         if (WARN_ON(!state))
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch...
              |
            'v4l2_subdev_get_pad_format': event 9
              |
              |cc1:
              | (9): ...to here
              |
       <------+
       |
     'csi2_try_format': event 10
       |
       | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (10) returning to 'csi2_try_format' from 'v4l2_subdev_get_pad_format'
   drivers/media/platform/ti/omap3isp/ispcsi2.c:835:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
       |  835 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'csi2_try_format': event 11
       |
       |  875 |                 memcpy(fmt, format, sizeof(*fmt));
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (11) argument 2 ('<unknown>') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from drivers/media/platform/ti/omap3isp/ispcsi2.c:13:
   arch/arm/include/asm/string.h:20:15: note: argument 2 of 'memcpy' must be non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~
   drivers/media/platform/ti/omap3isp/ispcsi2.c:875:17: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     875 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +678 drivers/media/platform/ti/omap3isp/ispccp2.c

121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  631  
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  632  /*
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  633   * ccp2_try_format - Handle try format by pad subdev method
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  634   * @ccp2  : Pointer to ISP CCP2 device
f7234138f14c22 drivers/media/platform/omap3isp/ispccp2.c Hans Verkuil     2015-03-04  635   * @cfg: V4L2 subdev pad configuration
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  636   * @pad   : pad num
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  637   * @fmt   : pointer to v4l2 mbus format structure
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  638   * @which : wanted subdev format
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  639   */
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  640  static void ccp2_try_format(struct isp_ccp2_device *ccp2,
0d346d2a6f54f0 drivers/media/platform/omap3isp/ispccp2.c Tomi Valkeinen   2021-06-10  641  			       struct v4l2_subdev_state *sd_state,
0d346d2a6f54f0 drivers/media/platform/omap3isp/ispccp2.c Tomi Valkeinen   2021-06-10  642  			       unsigned int pad,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  643  			       struct v4l2_mbus_framefmt *fmt,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  644  			       enum v4l2_subdev_format_whence which)
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  645  {
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  646  	struct v4l2_mbus_framefmt *format;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  647  
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  648  	switch (pad) {
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  649  	case CCP2_PAD_SINK:
27ffaeb0ab1608 drivers/media/platform/omap3isp/ispccp2.c Boris Brezillon  2014-11-10  650  		if (fmt->code != MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8)
27ffaeb0ab1608 drivers/media/platform/omap3isp/ispccp2.c Boris Brezillon  2014-11-10  651  			fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  652  
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  653  		if (ccp2->input == CCP2_INPUT_SENSOR) {
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  654  			fmt->width = clamp_t(u32, fmt->width,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  655  					     ISPCCP2_DAT_START_MIN,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  656  					     ISPCCP2_DAT_START_MAX);
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  657  			fmt->height = clamp_t(u32, fmt->height,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  658  					      ISPCCP2_DAT_SIZE_MIN,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  659  					      ISPCCP2_DAT_SIZE_MAX);
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  660  		} else if (ccp2->input == CCP2_INPUT_MEMORY) {
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  661  			fmt->width = clamp_t(u32, fmt->width,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  662  					     ISPCCP2_LCM_HSIZE_COUNT_MIN,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  663  					     ISPCCP2_LCM_HSIZE_COUNT_MAX);
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  664  			fmt->height = clamp_t(u32, fmt->height,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  665  					      ISPCCP2_LCM_VSIZE_MIN,
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  666  					      ISPCCP2_LCM_VSIZE_MAX);
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  667  		}
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  668  		break;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  669  
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  670  	case CCP2_PAD_SOURCE:
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  671  		/* Source format - copy sink format and change pixel code
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  672  		 * to SGRBG10_1X10 as we don't support CCP2 write to memory.
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  673  		 * When CCP2 write to memory feature will be added this
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  674  		 * should be changed properly.
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  675  		 */
0d346d2a6f54f0 drivers/media/platform/omap3isp/ispccp2.c Tomi Valkeinen   2021-06-10  676  		format = __ccp2_get_format(ccp2, sd_state, CCP2_PAD_SINK,
0d346d2a6f54f0 drivers/media/platform/omap3isp/ispccp2.c Tomi Valkeinen   2021-06-10  677  					   which);
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12 @678  		memcpy(fmt, format, sizeof(*fmt));
27ffaeb0ab1608 drivers/media/platform/omap3isp/ispccp2.c Boris Brezillon  2014-11-10  679  		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  680  		break;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  681  	}
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  682  
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  683  	fmt->field = V4L2_FIELD_NONE;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  684  	fmt->colorspace = V4L2_COLORSPACE_SRGB;
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  685  }
121e9f1c4c49c7 drivers/media/video/omap3isp/ispccp2.c    Laurent Pinchart 2011-02-12  686  

:::::: The code at line 678 was first introduced by commit
:::::: 121e9f1c4c49c76aac2425e3a9baef70f73f50a4 [media] omap3isp: CCP2/CSI2 receivers

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
