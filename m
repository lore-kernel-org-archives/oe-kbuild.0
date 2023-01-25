Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A481A20
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Jan 2023 00:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674606270; x=1706142270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSkbXusLtuWZ+4dnq0dTOtEjUjZ1zySv/C4112/gp6U=;
  b=fUCifAN1xPWpOpPNRd1pPs8xu/HjuERtl7ypa9c4URn8L+ncq9P0T/uI
   tgt34cT1mSfNBnCDC16wDTK1TX8MjEwIrgWGDSXkQfJFeWbZsz/nHFks5
   j+O3Abi3Jbj83l5DqI/Hf/P/SjBW+zuSjvUSreucqnyts8zZWX0/btrRR
   sN9EQfQsyQ9Y06maHGcUjgdbSSiZvYgNnrHpR84xqaqZPprq9Fdh9woK/
   wQasOLf7pwvpiG0L+P12B9i+FpBoU+FeEeYXn2rPfG2F+rE+y0b78pfYB
   0AtrzYGTj2xgV+5+/l3lKyyyxAaDsJHH+Tow+dcc4oTgGPebJWI7ihB2s
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306802550"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="306802550"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 16:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692771763"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="692771763"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 16:24:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKTaV-0006u0-0F;
	Wed, 25 Jan 2023 00:24:27 +0000
Date: Wed, 25 Jan 2023 08:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/media/omap4iss/iss_csi2.c:874:17: warning: use of
 NULL 'format' where non-null expected [CWE-476]
Message-ID: <202301250849.bDc1TuR2-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/staging/media/omap4iss/iss_csi2.c:874:17: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi Sakari,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bf70dbb18820b37406fdfa2aaf14c2f5c71a11a
commit: 2ba3e38517f5a4ebf9c997168079dca01b7f9fc6 media: v4l: subdev: Fail graciously when getting try data for NULL state
date:   4 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20230123 (https://download.01.org/0day-ci/archive/20230125/202301250849.bDc1TuR2-lkp@intel.com/config)
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

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/staging/media/omap4iss/iss_csi2.c: In function 'csi2_try_format':
>> drivers/staging/media/omap4iss/iss_csi2.c:874:17: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     874 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'csi2_try_format': events 1-4
       |
       |  840 | csi2_try_format(struct iss_csi2_device *csi2,
       |      | ^~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'csi2_try_format'
       |......
       |  851 |         switch (pad) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  867 |         case CSI2_PAD_SOURCE:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       |  872 |                 format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) calling '__csi2_get_format' from 'csi2_try_format'
       |  873 |                                            which);
       |      |                                            ~~~~~~
       |
       +--> '__csi2_get_format': events 5-7
              |
              |  827 | __csi2_get_format(struct iss_csi2_device *csi2,
              |      | ^~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to '__csi2_get_format'
              |......
              |  832 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch (when 'which == 0')...
              |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) ...to here
              |
            '__csi2_get_format': event 8
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'v4l2_subdev_get_pad_format' from '__csi2_get_format'
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'v4l2_subdev_get_pad_format': events 9-10
                     |
                     |include/media/v4l2-subdev.h:1045:1:
                     | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (9) entry to 'v4l2_subdev_get_pad_format'
                     |......
                     | 1049 |         if (WARN_ON(!state))
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch...
                     |
                   'v4l2_subdev_get_pad_format': event 11
                     |
                     |cc1:
                     | (11): ...to here
                     |
              <------+
              |
            '__csi2_get_format': event 12
              |
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (12) returning to '__csi2_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'csi2_try_format': events 13-14
       |
       |  872 |                 format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
       |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (13) returning to 'csi2_try_format' from '__csi2_get_format'
       |  873 |                                            which);
       |      |                                            ~~~~~~
       |  874 |                 memcpy(fmt, format, sizeof(*fmt));
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (14) argument 2 ('format') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
--
   drivers/staging/media/omap4iss/iss_ipipeif.c: In function 'ipipeif_try_format':
>> drivers/staging/media/omap4iss/iss_ipipeif.c:410:17: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     410 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ipipeif_enum_frame_size': events 1-4
       |
       |  482 | static int ipipeif_enum_frame_size(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipeif_enum_frame_size'
       |......
       |  489 |         if (fse->index != 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  492 |         format.code = fse->code;
       |      |         ~~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       |  495 |         ipipeif_try_format(ipipeif, sd_state, fse->pad, &format, fse->which);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (4) calling 'ipipeif_try_format' from 'ipipeif_enum_frame_size'
       |
       +--> 'ipipeif_try_format': events 5-8
              |
              |  377 | ipipeif_try_format(struct iss_ipipeif_device *ipipeif,
              |      | ^~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'ipipeif_try_format'
              |......
              |  387 |         switch (pad) {
              |      |         ~~~~~~
              |      |         |
              |      |         (6) following 'case 1:' branch...
              |......
              |  406 |         case IPIPEIF_PAD_SOURCE_ISIF_SF:
              |      |         ~~~~
              |      |         |
              |      |         (7) ...to here
              |  407 |                 format = __ipipeif_get_format(ipipeif, sd_state,
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (8) calling '__ipipeif_get_format' from 'ipipeif_try_format'
              |  408 |                                               IPIPEIF_PAD_SINK,
              |      |                                               ~~~~~~~~~~~~~~~~~
              |  409 |                                               which);
              |      |                                               ~~~~~~
              |
              +--> '__ipipeif_get_format': events 9-11
                     |
                     |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                     |      | ^~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (9) entry to '__ipipeif_get_format'
                     |......
                     |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch (when 'which == 0')...
                     |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (11) ...to here
                     |
                   '__ipipeif_get_format': event 12
                     |
                     |include/media/v4l2-subdev.h:1101:9:
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (12) calling 'v4l2_subdev_get_pad_format' from '__ipipeif_get_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                     +--> 'v4l2_subdev_get_pad_format': events 13-14
                            |
                            |include/media/v4l2-subdev.h:1045:1:
                            | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (13) entry to 'v4l2_subdev_get_pad_format'
                            |......
                            | 1049 |         if (WARN_ON(!state))
                            |      |            ~
                            |      |            |
                            |      |            (14) following 'true' branch...
                            |
                          'v4l2_subdev_get_pad_format': event 15
                            |
                            |cc1:
                            | (15): ...to here
                            |
                     <------+
                     |
                   '__ipipeif_get_format': event 16
                     |
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/omap4iss/iss_ipipe.c: In function 'ipipe_try_format':
>> drivers/staging/media/omap4iss/iss_ipipe.c:228:17: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     228 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ipipe_try_format': events 1-4
       |
       |  197 | ipipe_try_format(struct iss_ipipe_device *ipipe,
       |      | ^~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'ipipe_try_format'
       |......
       |  208 |         switch (pad) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  225 |         case IPIPE_PAD_SOURCE_VP:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  226 |                 format = __ipipe_get_format(ipipe, sd_state, IPIPE_PAD_SINK,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) calling '__ipipe_get_format' from 'ipipe_try_format'
       |  227 |                                             which);
       |      |                                             ~~~~~~
       |
       +--> '__ipipe_get_format': events 5-7
              |
              |  177 | __ipipe_get_format(struct iss_ipipe_device *ipipe,
              |      | ^~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to '__ipipe_get_format'
              |......
              |  182 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch (when 'which == 0')...
              |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) ...to here
              |
            '__ipipe_get_format': event 8
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'v4l2_subdev_get_pad_format' from '__ipipe_get_format'
   drivers/staging/media/omap4iss/iss_ipipe.c:183:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'v4l2_subdev_get_pad_format': events 9-10
                     |
                     |include/media/v4l2-subdev.h:1045:1:
                     | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (9) entry to 'v4l2_subdev_get_pad_format'
                     |......
                     | 1049 |         if (WARN_ON(!state))
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch...
                     |
                   'v4l2_subdev_get_pad_format': event 11
                     |
                     |cc1:
                     | (11): ...to here
                     |
              <------+
              |
            '__ipipe_get_format': event 12
              |
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (12) returning to '__ipipe_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_ipipe.c:183:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'ipipe_try_format': events 13-14
       |
       |  226 |                 format = __ipipe_get_format(ipipe, sd_state, IPIPE_PAD_SINK,
       |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (13) returning to 'ipipe_try_format' from '__ipipe_get_format'
       |  227 |                                             which);
       |      |                                             ~~~~~~
       |  228 |                 memcpy(fmt, format, sizeof(*fmt));
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (14) argument 2 ('format') NULL where non-null expected
       |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
--
   drivers/staging/media/omap4iss/iss_resizer.c: In function 'resizer_try_format':
>> drivers/staging/media/omap4iss/iss_resizer.c:468:17: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     468 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'resizer_try_format': events 1-4
       |
       |  436 | resizer_try_format(struct iss_resizer_device *resizer,
       |      | ^~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'resizer_try_format'
       |......
       |  447 |         switch (pad) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  463 |         case RESIZER_PAD_SOURCE_MEM:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  464 |                 pixelcode = fmt->code;
       |  465 |                 format = __resizer_get_format(resizer, sd_state,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) calling '__resizer_get_format' from 'resizer_try_format'
       |  466 |                                               RESIZER_PAD_SINK,
       |      |                                               ~~~~~~~~~~~~~~~~~
       |  467 |                                               which);
       |      |                                               ~~~~~~
       |
       +--> '__resizer_get_format': events 5-7
              |
              |  418 | __resizer_get_format(struct iss_resizer_device *resizer,
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to '__resizer_get_format'
              |......
              |  422 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch (when 'which == 0')...
              |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) ...to here
              |
            '__resizer_get_format': event 8
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'v4l2_subdev_get_pad_format' from '__resizer_get_format'
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'v4l2_subdev_get_pad_format': events 9-10
                     |
                     |include/media/v4l2-subdev.h:1045:1:
                     | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (9) entry to 'v4l2_subdev_get_pad_format'
                     |......
                     | 1049 |         if (WARN_ON(!state))
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch...
                     |
                   'v4l2_subdev_get_pad_format': event 11
                     |
                     |cc1:
                     | (11): ...to here
                     |
              <------+
              |
            '__resizer_get_format': event 12
              |
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (12) returning to '__resizer_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'resizer_try_format': events 13-14
       |
       |  465 |                 format = __resizer_get_format(resizer, sd_state,
       |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (13) returning to 'resizer_try_format' from '__resizer_get_format'
       |  466 |                                               RESIZER_PAD_SINK,
       |      |                                               ~~~~~~~~~~~~~~~~~
       |  467 |                                               which);
       |      |                                               ~~~~~~
       |  468 |                 memcpy(fmt, format, sizeof(*fmt));
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |

vim +/format +874 drivers/staging/media/omap4iss/iss_csi2.c

b4a0477c0b87c5b Sergio Aguirre      2011-01-24  838  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  839  static void
ee8defeceafa054 Piotr S. Staszewski 2015-05-26  840  csi2_try_format(struct iss_csi2_device *csi2,
0d346d2a6f54f06 Tomi Valkeinen      2021-06-10  841  		struct v4l2_subdev_state *sd_state,
ee8defeceafa054 Piotr S. Staszewski 2015-05-26  842  		unsigned int pad,
ee8defeceafa054 Piotr S. Staszewski 2015-05-26  843  		struct v4l2_mbus_framefmt *fmt,
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  844  		enum v4l2_subdev_format_whence which)
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  845  {
3336f07aa6bccf8 Boris Brezillon     2014-11-10  846  	u32 pixelcode;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  847  	struct v4l2_mbus_framefmt *format;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  848  	const struct iss_format_info *info;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  849  	unsigned int i;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  850  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  851  	switch (pad) {
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  852  	case CSI2_PAD_SINK:
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  853  		/* Clamp the width and height to valid range (1-8191). */
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  854  		for (i = 0; i < ARRAY_SIZE(csi2_input_fmts); i++) {
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  855  			if (fmt->code == csi2_input_fmts[i])
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  856  				break;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  857  		}
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  858  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  859  		/* If not found, use SGRBG10 as default */
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  860  		if (i >= ARRAY_SIZE(csi2_input_fmts))
3336f07aa6bccf8 Boris Brezillon     2014-11-10  861  			fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  862  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  863  		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  864  		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  865  		break;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  866  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  867  	case CSI2_PAD_SOURCE:
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  868  		/* Source format same as sink format, except for DPCM
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  869  		 * compression.
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  870  		 */
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  871  		pixelcode = fmt->code;
0d346d2a6f54f06 Tomi Valkeinen      2021-06-10  872  		format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
0d346d2a6f54f06 Tomi Valkeinen      2021-06-10  873  					   which);
b4a0477c0b87c5b Sergio Aguirre      2011-01-24 @874  		memcpy(fmt, format, sizeof(*fmt));
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  875  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  876  		/*
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  877  		 * Only Allow DPCM decompression, and check that the
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  878  		 * pattern is preserved
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  879  		 */
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  880  		info = omap4iss_video_format_info(fmt->code);
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  881  		if (info->uncompressed == pixelcode)
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  882  			fmt->code = pixelcode;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  883  		break;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  884  	}
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  885  
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  886  	/* RGB, non-interlaced */
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  887  	fmt->colorspace = V4L2_COLORSPACE_SRGB;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  888  	fmt->field = V4L2_FIELD_NONE;
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  889  }
b4a0477c0b87c5b Sergio Aguirre      2011-01-24  890  

:::::: The code at line 874 was first introduced by commit
:::::: b4a0477c0b87c5b7a20a84df8cf81311d1efb226 [media] v4l: omap4iss: Add support for OMAP4 camera interface - CSI receivers

:::::: TO: Sergio Aguirre <sergio.a.aguirre@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
