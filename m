Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90234378
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675042227; x=1706578227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kKUFVJtRDv5DkZMlaBlnUpGLz7ZdtEX1NNk97QgOgyA=;
  b=BwMzy7zFCetGpHTBGsE0j8ZwkVC1/5UBpMDXTP0bWBl9c0Z1fYopb7wY
   BZv2/9GnKsHZ65ASpSXLd/Jzk+1DQt1CqsxoNprOy1FxCEbUuVbz+wI7B
   Amywnzg8KYKzHftgyQaUsRuHoerv/OA9tl6HnG82SJJlCjEVhtj8g+DtP
   ePWSKzLdmZVmpnszDu+Qa1/yx0TAELfMj+MtrZASwquDcUvp9TDfv8JaO
   BncBMjaFRG/BhJM7WO9L1k01XBghcIvve1urhtSxVVkX+OQPinbY/3QSk
   y3jQitTHKomJCmpXdBKkxi9AviMllK7fsUgzRjLwl0+rz7FzgQs2iKxhN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="329578285"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="329578285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 17:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="663927140"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="663927140"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 17:30:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMJ03-0003Ey-0R;
	Mon, 30 Jan 2023 01:30:23 +0000
Date: Mon, 30 Jan 2023 09:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/fortify-string.h:45:33: warning: use of NULL 'format'
 where non-null expected [CWE-476]
Message-ID: <202301300912.FbKkYLtB-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: 2ba3e38517f5a4ebf9c997168079dca01b7f9fc6 media: v4l: subdev: Fail graciously when getting try data for NULL state
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20230128 (https://download.01.org/0day-ci/archive/20230130/202301300912.FbKkYLtB-lkp@intel.com/config)
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
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/delay.h:23,
                    from drivers/staging/media/omap4iss/iss_csi2.c:10:
   drivers/staging/media/omap4iss/iss_csi2.c: In function 'csi2_try_format':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:874:17: note: in expansion of macro 'memcpy'
     874 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'csi2_enum_frame_size': events 1-4
       |
       |  935 | static int csi2_enum_frame_size(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'csi2_enum_frame_size'
       |......
       |  942 |         if (fse->index != 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  945 |         format.code = fse->code;
       |      |                       ~~~~~~~~~
       |      |                          |
       |      |                          (3) ...to here
       |......
       |  948 |         csi2_try_format(csi2, sd_state, fse->pad, &format, fse->which);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (4) calling 'csi2_try_format' from 'csi2_enum_frame_size'
       |
       +--> 'csi2_try_format': events 5-8
              |
              |  840 | csi2_try_format(struct iss_csi2_device *csi2,
              |      | ^~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'csi2_try_format'
              |......
              |  851 |         switch (pad) {
              |      |         ~~~~~~
              |      |         |
              |      |         (6) following 'case 1:' branch...
              |......
              |  867 |         case CSI2_PAD_SOURCE:
              |      |         ~~~~
              |      |         |
              |      |         (7) ...to here
              |......
              |  872 |                 format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (8) calling '__csi2_get_format' from 'csi2_try_format'
              |  873 |                                            which);
              |      |                                            ~~~~~~
              |
              +--> '__csi2_get_format': events 9-10
                     |
                     |  827 | __csi2_get_format(struct iss_csi2_device *csi2,
                     |      | ^~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (9) entry to '__csi2_get_format'
                     |......
                     |  832 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'true' branch (when 'which == 0')...
                     |
                   '__csi2_get_format': event 11
                     |
                     |include/media/v4l2-subdev.h:1101:9:
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (11) ...to here
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   '__csi2_get_format': event 12
                     |
                     |include/media/v4l2-subdev.h:1101:9:
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (12) calling 'v4l2_subdev_get_pad_format' from '__csi2_get_format'
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
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
                   '__csi2_get_format': event 16
                     |
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) returning to '__csi2_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
              <------+
              |
            'csi2_try_format': event 17
              |
              |  872 |                 format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SINK,
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (17) returning to 'csi2_try_format' from '__csi2_get_format'
              |  873 |                                            which);
              |      |                                            ~~~~~~
              |
            'csi2_try_format': event 18
              |
              |include/linux/fortify-string.h:45:33:
              |   45 | #define __underlying_memcpy     __builtin_memcpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (18) argument 2 ('format') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
              |  378 |         __underlying_##op(p, q, __fortify_size);                        \
              |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
              |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
              |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:874:17: note: in expansion of macro 'memcpy'
              |  874 |                 memcpy(fmt, format, sizeof(*fmt));
              |      |                 ^~~~~~
              |
   <built-in>: note: argument 2 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:874:17: note: in expansion of macro 'memcpy'
     874 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'csi2_set_format': events 1-6
       |
       |  994 | static int csi2_set_format(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'csi2_set_format'
       |......
       | 1002 |         if (!format)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'format' is non-NULL)...
       |......
       | 1005 |         csi2_try_format(csi2, sd_state, fmt->pad, &fmt->format, fmt->which);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1009 |         if (fmt->pad == CSI2_PAD_SINK) {
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       | 1010 |                 format = __csi2_get_format(csi2, sd_state, CSI2_PAD_SOURCE,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (6) calling '__csi2_get_format' from 'csi2_set_format'
       | 1011 |                                            fmt->which);
       |      |                                            ~~~~~~~~~~~
       |      |                                               |
       |      |                                               (5) ...to here
       |
       +--> '__csi2_get_format': events 7-8
              |
              |  827 | __csi2_get_format(struct iss_csi2_device *csi2,
              |      | ^~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to '__csi2_get_format'
              |......
              |  832 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch (when 'which == 0')...
              |
            '__csi2_get_format': event 9
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (9) ...to here
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            '__csi2_get_format': event 10
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (10) calling 'v4l2_subdev_get_pad_format' from '__csi2_get_format'
   drivers/staging/media/omap4iss/iss_csi2.c:833:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  833 |                 return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'v4l2_subdev_get_pad_format': events 11-12
                     |
                     |include/media/v4l2-subdev.h:1045:1:
                     | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (11) entry to 'v4l2_subdev_get_pad_format'
                     |......
                     | 1049 |         if (WARN_ON(!state))
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'true' branch...
                     |
                   'v4l2_subdev_get_pad_format': event 13
                     |
                     |cc1:
                     | (13): ...to here
                     |
              <------+
              |
            '__csi2_get_format': event 14
              |
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
--
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/staging/media/omap4iss/iss_ipipeif.c:10:
   drivers/staging/media/omap4iss/iss_ipipeif.c: In function 'ipipeif_try_format':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:410:17: note: in expansion of macro 'memcpy'
     410 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipeif_init_entities': events 1-4
       |
       |  733 | static int ipipeif_init_entities(struct iss_ipipeif_device *ipipeif)
       |      |            ^~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipeif_init_entities'
       |......
       |  755 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  758 |         ipipeif_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipeif_init_formats' from 'ipipeif_init_entities'
       |
       +--> 'ipipeif_init_formats': events 5-8
              |
              |  607 | static int ipipeif_init_formats(struct v4l2_subdev *sd,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipeif_init_formats'
              |......
              |  618 |         ipipeif_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipeif_set_format' from 'ipipeif_init_formats'
              |
              +--> 'ipipeif_set_format': events 9-10
                     |
                     |  545 | static int ipipeif_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipeif_set_format'
                     |......
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipeif_get_format' from 'ipipeif_set_format'
                     |
                     +--> '__ipipeif_get_format': events 11-13
                            |
                            |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                            |      | ^~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipeif_get_format'
                            |......
                            |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  366 |         return &ipipeif->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipeif_set_format': events 14-19
                     |
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipeif_set_format' from '__ipipeif_get_format'
                     |  553 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  556 |         ipipeif_try_format(ipipeif, sd_state, fmt->pad, &fmt->format,
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |  557 |                            fmt->which);
                     |      |                            ~~~~~~~~~~~
                     |......
                     |  561 |         if (fmt->pad == IPIPEIF_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |  562 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                     |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (19) calling '__ipipeif_get_format' from 'ipipeif_set_format'
--
                            |  408 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  409 |                                               which);
                            |      |                                               ~~~~~~
                            |
                            +--> '__ipipeif_get_format': events 29-30
                                   |
                                   |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                                   |      | ^~~~~~~~~~~~~~~~~~~~
                                   |      | |
                                   |      | (29) entry to '__ipipeif_get_format'
                                   |......
                                   |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                                   |      |            ~
                                   |      |            |
                                   |      |            (30) following 'true' branch (when 'which == 0')...
                                   |
                                 '__ipipeif_get_format': event 31
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (31) ...to here
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                 '__ipipeif_get_format': event 32
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (32) calling 'v4l2_subdev_get_pad_format' from '__ipipeif_get_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                   +--> 'v4l2_subdev_get_pad_format': events 33-34
                                          |
                                          |include/media/v4l2-subdev.h:1045:1:
                                          | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                                          |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      | |
                                          |      | (33) entry to 'v4l2_subdev_get_pad_format'
                                          |......
                                          | 1049 |         if (WARN_ON(!state))
                                          |      |            ~
                                          |      |            |
                                          |      |            (34) following 'true' branch...
                                          |
                                        'v4l2_subdev_get_pad_format': event 35
                                          |
                                          |cc1:
                                          | (35): ...to here
                                          |
                                   <------+
                                   |
                                 '__ipipeif_get_format': event 36
                                   |
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (36) returning to '__ipipeif_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'ipipeif_try_format': event 37
                            |
                            |  407 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                            |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                          |
                            |      |                          (37) returning to 'ipipeif_try_format' from '__ipipeif_get_format'
                            |  408 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  409 |                                               which);
                            |      |                                               ~~~~~~
                            |
                          'ipipeif_try_format': event 38
                            |
                            |include/linux/fortify-string.h:45:33:
                            |   45 | #define __underlying_memcpy     __builtin_memcpy
                            |      |                                 ^
                            |      |                                 |
                            |      |                                 (38) argument 2 ('format') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
                            |  378 |         __underlying_##op(p, q, __fortify_size);                        \
                            |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
                            |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:410:17: note: in expansion of macro 'memcpy'
                            |  410 |                 memcpy(fmt, format, sizeof(*fmt));
                            |      |                 ^~~~~~
                            |
   <built-in>: note: argument 2 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:410:17: note: in expansion of macro 'memcpy'
     410 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipeif_init_entities': events 1-4
       |
       |  733 | static int ipipeif_init_entities(struct iss_ipipeif_device *ipipeif)
       |      |            ^~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipeif_init_entities'
       |......
       |  755 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  758 |         ipipeif_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipeif_init_formats' from 'ipipeif_init_entities'
       |
       +--> 'ipipeif_init_formats': events 5-8
              |
              |  607 | static int ipipeif_init_formats(struct v4l2_subdev *sd,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipeif_init_formats'
              |......
              |  618 |         ipipeif_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipeif_set_format' from 'ipipeif_init_formats'
              |
              +--> 'ipipeif_set_format': events 9-10
                     |
                     |  545 | static int ipipeif_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipeif_set_format'
                     |......
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipeif_get_format' from 'ipipeif_set_format'
                     |
                     +--> '__ipipeif_get_format': events 11-13
                            |
                            |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                            |      | ^~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipeif_get_format'
                            |......
                            |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  366 |         return &ipipeif->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipeif_set_format': events 14-19
                     |
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipeif_set_format' from '__ipipeif_get_format'
                     |  553 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  556 |         ipipeif_try_format(ipipeif, sd_state, fmt->pad, &fmt->format,
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |  557 |                            fmt->which);
                     |      |                            ~~~~~~~~~~~
                     |......
                     |  561 |         if (fmt->pad == IPIPEIF_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |  562 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                     |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (19) calling '__ipipeif_get_format' from 'ipipeif_set_format'
--
                            |  408 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  409 |                                               which);
                            |      |                                               ~~~~~~
                            |
                            +--> '__ipipeif_get_format': events 34-35
                                   |
                                   |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                                   |      | ^~~~~~~~~~~~~~~~~~~~
                                   |      | |
                                   |      | (34) entry to '__ipipeif_get_format'
                                   |......
                                   |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                                   |      |            ~
                                   |      |            |
                                   |      |            (35) following 'true' branch (when 'which == 0')...
                                   |
                                 '__ipipeif_get_format': event 36
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (36) ...to here
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                 '__ipipeif_get_format': event 37
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (37) calling 'v4l2_subdev_get_pad_format' from '__ipipeif_get_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                   +--> 'v4l2_subdev_get_pad_format': events 38-39
                                          |
                                          |include/media/v4l2-subdev.h:1045:1:
                                          | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                                          |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      | |
                                          |      | (38) entry to 'v4l2_subdev_get_pad_format'
                                          |......
                                          | 1049 |         if (WARN_ON(!state))
                                          |      |            ~
                                          |      |            |
                                          |      |            (39) following 'true' branch...
                                          |
                                        'v4l2_subdev_get_pad_format': event 40
                                          |
                                          |cc1:
                                          | (40): ...to here
                                          |
                                   <------+
                                   |
                                 '__ipipeif_get_format': event 41
                                   |
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (41) returning to '__ipipeif_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'ipipeif_try_format': event 42
                            |
                            |  407 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                            |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                          |
                            |      |                          (42) returning to 'ipipeif_try_format' from '__ipipeif_get_format'
                            |  408 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  409 |                                               which);
                            |      |                                               ~~~~~~
                            |
                          'ipipeif_try_format': event 43
                            |
                            |include/linux/fortify-string.h:45:33:
                            |   45 | #define __underlying_memcpy     __builtin_memcpy
                            |      |                                 ^
                            |      |                                 |
                            |      |                                 (43) argument 1 ('fmt') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
                            |  378 |         __underlying_##op(p, q, __fortify_size);                        \
                            |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
                            |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:410:17: note: in expansion of macro 'memcpy'
                            |  410 |                 memcpy(fmt, format, sizeof(*fmt));
                            |      |                 ^~~~~~
                            |
   <built-in>: note: argument 1 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:426:17: note: in expansion of macro 'memcpy'
     426 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipeif_init_entities': events 1-4
       |
       |  733 | static int ipipeif_init_entities(struct iss_ipipeif_device *ipipeif)
       |      |            ^~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipeif_init_entities'
       |......
       |  755 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  758 |         ipipeif_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipeif_init_formats' from 'ipipeif_init_entities'
       |
       +--> 'ipipeif_init_formats': events 5-8
              |
              |  607 | static int ipipeif_init_formats(struct v4l2_subdev *sd,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipeif_init_formats'
              |......
              |  618 |         ipipeif_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipeif_set_format' from 'ipipeif_init_formats'
              |
              +--> 'ipipeif_set_format': events 9-10
                     |
                     |  545 | static int ipipeif_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipeif_set_format'
                     |......
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipeif_get_format' from 'ipipeif_set_format'
                     |
                     +--> '__ipipeif_get_format': events 11-13
                            |
                            |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                            |      | ^~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipeif_get_format'
                            |......
                            |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  366 |         return &ipipeif->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipeif_set_format': events 14-19
                     |
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipeif_set_format' from '__ipipeif_get_format'
                     |  553 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  556 |         ipipeif_try_format(ipipeif, sd_state, fmt->pad, &fmt->format,
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |  557 |                            fmt->which);
                     |      |                            ~~~~~~~~~~~
                     |......
                     |  561 |         if (fmt->pad == IPIPEIF_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |  562 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                     |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (19) calling '__ipipeif_get_format' from 'ipipeif_set_format'
--
                            |  424 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  425 |                                               which);
                            |      |                                               ~~~~~~
                            |
                            +--> '__ipipeif_get_format': events 44-45
                                   |
                                   |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                                   |      | ^~~~~~~~~~~~~~~~~~~~
                                   |      | |
                                   |      | (44) entry to '__ipipeif_get_format'
                                   |......
                                   |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                                   |      |            ~
                                   |      |            |
                                   |      |            (45) following 'true' branch (when 'which == 0')...
                                   |
                                 '__ipipeif_get_format': event 46
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (46) ...to here
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                 '__ipipeif_get_format': event 47
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (47) calling 'v4l2_subdev_get_pad_format' from '__ipipeif_get_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                   +--> 'v4l2_subdev_get_pad_format': events 48-49
                                          |
                                          |include/media/v4l2-subdev.h:1045:1:
                                          | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                                          |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      | |
                                          |      | (48) entry to 'v4l2_subdev_get_pad_format'
                                          |......
                                          | 1049 |         if (WARN_ON(!state))
                                          |      |            ~
                                          |      |            |
                                          |      |            (49) following 'true' branch...
                                          |
                                        'v4l2_subdev_get_pad_format': event 50
                                          |
                                          |cc1:
                                          | (50): ...to here
                                          |
                                   <------+
                                   |
                                 '__ipipeif_get_format': event 51
                                   |
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (51) returning to '__ipipeif_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_ipipeif.c:364:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  364 |                 return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'ipipeif_try_format': event 52
                            |
                            |  423 |                 format = __ipipeif_get_format(ipipeif, sd_state,
                            |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                          |
                            |      |                          (52) returning to 'ipipeif_try_format' from '__ipipeif_get_format'
                            |  424 |                                               IPIPEIF_PAD_SINK,
                            |      |                                               ~~~~~~~~~~~~~~~~~
                            |  425 |                                               which);
                            |      |                                               ~~~~~~
                            |
                          'ipipeif_try_format': event 53
                            |
                            |include/linux/fortify-string.h:45:33:
                            |   45 | #define __underlying_memcpy     __builtin_memcpy
                            |      |                                 ^
                            |      |                                 |
                            |      |                                 (53) argument 2 ('format') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
                            |  378 |         __underlying_##op(p, q, __fortify_size);                        \
                            |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
                            |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:426:17: note: in expansion of macro 'memcpy'
                            |  426 |                 memcpy(fmt, format, sizeof(*fmt));
                            |      |                 ^~~~~~
                            |
   <built-in>: note: argument 2 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:426:17: note: in expansion of macro 'memcpy'
     426 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipeif_init_entities': events 1-4
       |
       |  733 | static int ipipeif_init_entities(struct iss_ipipeif_device *ipipeif)
       |      |            ^~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipeif_init_entities'
       |......
       |  755 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  758 |         ipipeif_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipeif_init_formats' from 'ipipeif_init_entities'
       |
       +--> 'ipipeif_init_formats': events 5-8
              |
              |  607 | static int ipipeif_init_formats(struct v4l2_subdev *sd,
              |      |            ^~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipeif_init_formats'
              |......
              |  618 |         ipipeif_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipeif_set_format' from 'ipipeif_init_formats'
              |
              +--> 'ipipeif_set_format': events 9-10
                     |
                     |  545 | static int ipipeif_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipeif_set_format'
                     |......
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipeif_get_format' from 'ipipeif_set_format'
                     |
                     +--> '__ipipeif_get_format': events 11-13
                            |
                            |  359 | __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
                            |      | ^~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipeif_get_format'
                            |......
                            |  363 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  366 |         return &ipipeif->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipeif_set_format': events 14-19
                     |
                     |  552 |         format = __ipipeif_get_format(ipipeif, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipeif_set_format' from '__ipipeif_get_format'
                     |  553 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  556 |         ipipeif_try_format(ipipeif, sd_state, fmt->pad, &fmt->format,
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |  557 |                            fmt->which);
                     |      |                            ~~~~~~~~~~~
                     |......
                     |  561 |         if (fmt->pad == IPIPEIF_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |......
                     |  564 |                                               fmt->which);
                     |      |                                               ~~~~~~~~~~
                     |      |                                                  |
--
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/staging/media/omap4iss/iss_ipipe.c:10:
   drivers/staging/media/omap4iss/iss_ipipe.c: In function 'ipipe_try_format':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:228:17: note: in expansion of macro 'memcpy'
     228 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipe_init_entities': events 1-4
       |
       |  498 | static int ipipe_init_entities(struct iss_ipipe_device *ipipe)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipe_init_entities'
       |......
       |  519 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  522 |         ipipe_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipe_init_formats' from 'ipipe_init_entities'
       |
       +--> 'ipipe_init_formats': events 5-8
              |
              |  388 | static int ipipe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipe_init_formats'
              |......
              |  398 |         ipipe_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipe_set_format' from 'ipipe_init_formats'
              |
              +--> 'ipipe_set_format': events 9-10
                     |
                     |  337 | static int ipipe_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipe_set_format'
                     |......
                     |  344 |         format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipe_get_format' from 'ipipe_set_format'
                     |
                     +--> '__ipipe_get_format': events 11-13
                            |
                            |  177 | __ipipe_get_format(struct iss_ipipe_device *ipipe,
                            |      | ^~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipe_get_format'
                            |......
                            |  182 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  186 |         return &ipipe->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipe_set_format': events 14-19
                     |
                     |  344 |         format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipe_set_format' from '__ipipe_get_format'
                     |  345 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  348 |         ipipe_try_format(ipipe, sd_state, fmt->pad, &fmt->format, fmt->which);
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |......
                     |  352 |         if (fmt->pad == IPIPE_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |  353 |                 format = __ipipe_get_format(ipipe, sd_state,
                     |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (19) calling '__ipipe_get_format' from 'ipipe_set_format'
                     |  354 |                                             IPIPE_PAD_SOURCE_VP,
                     |      |                                             ~~~~~~~~~~~~~~~~~~~~
--
                            |  226 |                 format = __ipipe_get_format(ipipe, sd_state, IPIPE_PAD_SINK,
                            |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                          |
                            |      |                          (28) calling '__ipipe_get_format' from 'ipipe_try_format'
                            |  227 |                                             which);
                            |      |                                             ~~~~~~
                            |
                            +--> '__ipipe_get_format': events 29-30
                                   |
                                   |  177 | __ipipe_get_format(struct iss_ipipe_device *ipipe,
                                   |      | ^~~~~~~~~~~~~~~~~~
                                   |      | |
                                   |      | (29) entry to '__ipipe_get_format'
                                   |......
                                   |  182 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                                   |      |            ~
                                   |      |            |
                                   |      |            (30) following 'true' branch (when 'which == 0')...
                                   |
                                 '__ipipe_get_format': event 31
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (31) ...to here
   drivers/staging/media/omap4iss/iss_ipipe.c:183:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                 '__ipipe_get_format': event 32
                                   |
                                   |include/media/v4l2-subdev.h:1101:9:
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (32) calling 'v4l2_subdev_get_pad_format' from '__ipipe_get_format'
   drivers/staging/media/omap4iss/iss_ipipe.c:183:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                   +--> 'v4l2_subdev_get_pad_format': events 33-34
                                          |
                                          |include/media/v4l2-subdev.h:1045:1:
                                          | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                                          |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      | |
                                          |      | (33) entry to 'v4l2_subdev_get_pad_format'
                                          |......
                                          | 1049 |         if (WARN_ON(!state))
                                          |      |            ~
                                          |      |            |
                                          |      |            (34) following 'true' branch...
                                          |
                                        'v4l2_subdev_get_pad_format': event 35
                                          |
                                          |cc1:
                                          | (35): ...to here
                                          |
                                   <------+
                                   |
                                 '__ipipe_get_format': event 36
                                   |
                                   | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (36) returning to '__ipipe_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_ipipe.c:183:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                                   |  183 |                 return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
                                   |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'ipipe_try_format': event 37
                            |
                            |  226 |                 format = __ipipe_get_format(ipipe, sd_state, IPIPE_PAD_SINK,
                            |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                          |
                            |      |                          (37) returning to 'ipipe_try_format' from '__ipipe_get_format'
                            |  227 |                                             which);
                            |      |                                             ~~~~~~
                            |
                          'ipipe_try_format': event 38
                            |
                            |include/linux/fortify-string.h:45:33:
                            |   45 | #define __underlying_memcpy     __builtin_memcpy
                            |      |                                 ^
                            |      |                                 |
                            |      |                                 (38) argument 2 ('format') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
                            |  378 |         __underlying_##op(p, q, __fortify_size);                        \
                            |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
                            |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:228:17: note: in expansion of macro 'memcpy'
                            |  228 |                 memcpy(fmt, format, sizeof(*fmt));
                            |      |                 ^~~~~~
                            |
   <built-in>: note: argument 2 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:228:17: note: in expansion of macro 'memcpy'
     228 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'ipipe_init_entities': events 1-4
       |
       |  498 | static int ipipe_init_entities(struct iss_ipipe_device *ipipe)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ipipe_init_entities'
       |......
       |  519 |         if (ret < 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret >= 0')...
       |......
       |  522 |         ipipe_init_formats(sd, NULL);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |      |         (4) calling 'ipipe_init_formats' from 'ipipe_init_entities'
       |
       +--> 'ipipe_init_formats': events 5-8
              |
              |  388 | static int ipipe_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'ipipe_init_formats'
              |......
              |  398 |         ipipe_set_format(sd, fh ? fh->state : NULL, &format);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) following 'false' branch (when 'fh' is NULL)...
              |      |         (7) ...to here
              |      |         (8) calling 'ipipe_set_format' from 'ipipe_init_formats'
              |
              +--> 'ipipe_set_format': events 9-10
                     |
                     |  337 | static int ipipe_set_format(struct v4l2_subdev *sd,
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'ipipe_set_format'
                     |......
                     |  344 |         format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling '__ipipe_get_format' from 'ipipe_set_format'
                     |
                     +--> '__ipipe_get_format': events 11-13
                            |
                            |  177 | __ipipe_get_format(struct iss_ipipe_device *ipipe,
                            |      | ^~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (11) entry to '__ipipe_get_format'
                            |......
                            |  182 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                            |      |            ~
                            |      |            |
                            |      |            (12) following 'false' branch (when 'which != 0')...
                            |......
                            |  186 |         return &ipipe->formats[pad];
                            |      |                ~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (13) ...to here
                            |
                     <------+
                     |
                   'ipipe_set_format': events 14-19
                     |
                     |  344 |         format = __ipipe_get_format(ipipe, sd_state, fmt->pad, fmt->which);
                     |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (14) returning to 'ipipe_set_format' from '__ipipe_get_format'
                     |  345 |         if (!format)
                     |      |            ~      
                     |      |            |
                     |      |            (15) following 'false' branch (when 'format' is non-NULL)...
                     |......
                     |  348 |         ipipe_try_format(ipipe, sd_state, fmt->pad, &fmt->format, fmt->which);
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (16) ...to here
                     |......
                     |  352 |         if (fmt->pad == IPIPE_PAD_SINK) {
                     |      |            ~      
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |  353 |                 format = __ipipe_get_format(ipipe, sd_state,
                     |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (19) calling '__ipipe_get_format' from 'ipipe_set_format'
                     |  354 |                                             IPIPE_PAD_SOURCE_VP,
                     |      |                                             ~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/staging/media/omap4iss/iss_resizer.c:10:
   drivers/staging/media/omap4iss/iss_resizer.c: In function 'resizer_try_format':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'format' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_resizer.c:468:17: note: in expansion of macro 'memcpy'
     468 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'resizer_set_format': events 1-6
       |
       |  605 | static int resizer_set_format(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'resizer_set_format'
       |......
       |  613 |         if (!format)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'format' is non-NULL)...
       |......
       |  616 |         resizer_try_format(resizer, sd_state, fmt->pad, &fmt->format,
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |  617 |                            fmt->which);
       |      |                            ~~~~~~~~~~~
       |......
       |  621 |         if (fmt->pad == RESIZER_PAD_SINK) {
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |......
       |  624 |                                               fmt->which);
       |      |                                               ~~~~~~~~~~
       |      |                                                  |
       |      |                                                  (5) ...to here
       |  625 |                 *format = fmt->format;
       |  626 |                 resizer_try_format(resizer, sd_state, RESIZER_PAD_SOURCE_MEM,
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'resizer_try_format' from 'resizer_set_format'
       |  627 |                                    format,
       |      |                                    ~~~~~~~
       |  628 |                                    fmt->which);
       |      |                                    ~~~~~~~~~~~
       |
       +--> 'resizer_try_format': events 7-10
              |
              |  436 | resizer_try_format(struct iss_resizer_device *resizer,
              |      | ^~~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to 'resizer_try_format'
              |......
              |  447 |         switch (pad) {
              |      |         ~~~~~~
              |      |         |
              |      |         (8) following 'case 1:' branch...
              |......
              |  463 |         case RESIZER_PAD_SOURCE_MEM:
              |      |         ~~~~
              |      |         |
              |      |         (9) ...to here
              |  464 |                 pixelcode = fmt->code;
              |  465 |                 format = __resizer_get_format(resizer, sd_state,
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (10) calling '__resizer_get_format' from 'resizer_try_format'
              |  466 |                                               RESIZER_PAD_SINK,
              |      |                                               ~~~~~~~~~~~~~~~~~
              |  467 |                                               which);
              |      |                                               ~~~~~~
              |
              +--> '__resizer_get_format': events 11-12
                     |
                     |  418 | __resizer_get_format(struct iss_resizer_device *resizer,
                     |      | ^~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (11) entry to '__resizer_get_format'
                     |......
                     |  422 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'true' branch (when 'which == 0')...
                     |
                   '__resizer_get_format': event 13
                     |
                     |include/media/v4l2-subdev.h:1101:9:
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (13) ...to here
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   '__resizer_get_format': event 14
                     |
                     |include/media/v4l2-subdev.h:1101:9:
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (14) calling 'v4l2_subdev_get_pad_format' from '__resizer_get_format'
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                     +--> 'v4l2_subdev_get_pad_format': events 15-16
                            |
                            |include/media/v4l2-subdev.h:1045:1:
                            | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                            |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      | |
                            |      | (15) entry to 'v4l2_subdev_get_pad_format'
                            |......
                            | 1049 |         if (WARN_ON(!state))
                            |      |            ~
                            |      |            |
                            |      |            (16) following 'true' branch...
                            |
                          'v4l2_subdev_get_pad_format': event 17
                            |
                            |cc1:
                            | (17): ...to here
                            |
                     <------+
                     |
                   '__resizer_get_format': event 18
                     |
                     | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (18) returning to '__resizer_get_format' from 'v4l2_subdev_get_pad_format'
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
                     |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
                     |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
              <------+
              |
            'resizer_try_format': event 19
              |
              |  465 |                 format = __resizer_get_format(resizer, sd_state,
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (19) returning to 'resizer_try_format' from '__resizer_get_format'
              |  466 |                                               RESIZER_PAD_SINK,
              |      |                                               ~~~~~~~~~~~~~~~~~
              |  467 |                                               which);
              |      |                                               ~~~~~~
              |
            'resizer_try_format': event 20
              |
              |include/linux/fortify-string.h:45:33:
              |   45 | #define __underlying_memcpy     __builtin_memcpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (20) argument 2 ('format') NULL where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
              |  378 |         __underlying_##op(p, q, __fortify_size);                        \
              |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
              |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
              |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_resizer.c:468:17: note: in expansion of macro 'memcpy'
              |  468 |                 memcpy(fmt, format, sizeof(*fmt));
              |      |                 ^~~~~~
              |
   <built-in>: note: argument 2 of '__builtin_memcpy' must be non-null
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'fmt' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__underlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fortify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_resizer.c:468:17: note: in expansion of macro 'memcpy'
     468 |                 memcpy(fmt, format, sizeof(*fmt));
         |                 ^~~~~~
     'resizer_set_format': events 1-6
       |
       |  605 | static int resizer_set_format(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'resizer_set_format'
       |......
       |  613 |         if (!format)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'format' is non-NULL)...
       |......
       |  616 |         resizer_try_format(resizer, sd_state, fmt->pad, &fmt->format,
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |  617 |                            fmt->which);
       |      |                            ~~~~~~~~~~~
       |......
       |  621 |         if (fmt->pad == RESIZER_PAD_SINK) {
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |  622 |                 format = __resizer_get_format(resizer, sd_state,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (6) calling '__resizer_get_format' from 'resizer_set_format'
       |  623 |                                               RESIZER_PAD_SOURCE_MEM,
       |      |                                               ~~~~~~~~~~~~~~~~~~~~~~~
       |  624 |                                               fmt->which);
       |      |                                               ~~~~~~~~~~~
       |      |                                                  |
       |      |                                                  (5) ...to here
       |
       +--> '__resizer_get_format': events 7-8
              |
              |  418 | __resizer_get_format(struct iss_resizer_device *resizer,
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (7) entry to '__resizer_get_format'
              |......
              |  422 |         if (which == V4L2_SUBDEV_FORMAT_TRY)
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch (when 'which == 0')...
              |
            '__resizer_get_format': event 9
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (9) ...to here
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            '__resizer_get_format': event 10
              |
              |include/media/v4l2-subdev.h:1101:9:
              | 1101 |         v4l2_subdev_get_pad_format(sd, state, pad)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (10) calling 'v4l2_subdev_get_pad_format' from '__resizer_get_format'
   drivers/staging/media/omap4iss/iss_resizer.c:423:24: note: in expansion of macro 'v4l2_subdev_get_try_format'
              |  423 |                 return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'v4l2_subdev_get_pad_format': events 11-12
                     |
                     |include/media/v4l2-subdev.h:1045:1:
                     | 1045 | v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (11) entry to 'v4l2_subdev_get_pad_format'
                     |......
                     | 1049 |         if (WARN_ON(!state))
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'true' branch...
                     |
                   'v4l2_subdev_get_pad_format': event 13
                     |
                     |cc1:
                     | (13): ...to here
                     |
              <------+
              |
            '__resizer_get_format': event 14

vim +/format +45 include/linux/fortify-string.h

3009f891bb9f32 Kees Cook      2021-08-02  30  
a28a6e860c6cf2 Francis Laniel 2021-02-25  31  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25  32  extern void *__underlying_memchr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25  33  extern int __underlying_memcmp(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25  34  extern void *__underlying_memcpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  35  extern void *__underlying_memmove(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  36  extern void *__underlying_memset(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  37  extern char *__underlying_strcat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  38  extern char *__underlying_strcpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  39  extern __kernel_size_t __underlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  40  extern char *__underlying_strncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  41  extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  42  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  43  #define __underlying_memchr	__builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  44  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25 @45  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  46  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  47  #define __underlying_memset	__builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  48  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  49  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  50  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  51  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  52  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  53  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  54  

:::::: The code at line 45 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
