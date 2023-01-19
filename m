Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F517CD
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674098430; x=1705634430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJjqEIPabbxJSJU9oAei1PlsxamPw2opBElh9MUIsGs=;
  b=C9WqzlQ96p7ai4l3TyoPffw1kmSTkgE1zO3PHyvCfshJFXlOcX5fdyaE
   TCP+MmRRfMYo763nbNJ9YPSpYD7I4BmMjZqE1G6tkj+42vouemEB4jLv4
   2t17xGFGddJfxT1srku89hI25eT8HLjAfMbQQVe8fsop2VW66EJgpeUll
   njYU3ODANrp4hXPF6fqD89Y3obbrUkTHWNOTbJAi4O4oSnAIgKHLnwXT+
   OFnvsZUdJ0L7gJHD/A5AOQbOkPl4mW2No1cg0/YKWayCdTklyI6QW6W1/
   IisFjjZGLyQFaieSPcYy+HAK22rWo2RRYOPy5PDa4NyyL7nB+Y61CtPF+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325229361"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325229361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728488288"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="728488288"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 19:20:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pILTX-000114-2r;
	Thu, 19 Jan 2023 03:20:27 +0000
Date: Thu, 19 Jan 2023 11:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/mc/mc-entity.c:47:27: warning: unused function
 'link_type_name'
Message-ID: <202301191158.i9yaFVnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Scally <djrscally@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "Jean-Michel Hautbois" <jeanmichel.hautbois@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 9d0c23bfe7083f182194ca235156a4098aa59344 media: entity: Add link_type_name() helper
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-r022-20230116 (https://download.01.org/0day-ci/archive/20230119/202301191158.i9yaFVnS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9d0c23bfe7083f182194ca235156a4098aa59344
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9d0c23bfe7083f182194ca235156a4098aa59344
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/mc/ drivers/mfd/ drivers/pinctrl/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/mc/mc-entity.c:17:27: warning: unused function 'intf_type' [-Wunused-function]
   static inline const char *intf_type(struct media_interface *intf)
                             ^
>> drivers/media/mc/mc-entity.c:47:27: warning: unused function 'link_type_name' [-Wunused-function]
   static inline const char *link_type_name(struct media_link *link)
                             ^
   2 warnings generated.


vim +/link_type_name +47 drivers/media/mc/mc-entity.c

53e269c102fbaf7 drivers/media/media-entity.c Laurent Pinchart      2009-12-09  16  
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20 @17  static inline const char *intf_type(struct media_interface *intf)
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  18  {
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  19  	switch (intf->type) {
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  20  	case MEDIA_INTF_T_DVB_FE:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  21  		return "dvb-frontend";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  22  	case MEDIA_INTF_T_DVB_DEMUX:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  23  		return "dvb-demux";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  24  	case MEDIA_INTF_T_DVB_DVR:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  25  		return "dvb-dvr";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  26  	case MEDIA_INTF_T_DVB_CA:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  27  		return  "dvb-ca";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  28  	case MEDIA_INTF_T_DVB_NET:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  29  		return "dvb-net";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  30  	case MEDIA_INTF_T_V4L_VIDEO:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  31  		return "v4l-video";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  32  	case MEDIA_INTF_T_V4L_VBI:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  33  		return "v4l-vbi";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  34  	case MEDIA_INTF_T_V4L_RADIO:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  35  		return "v4l-radio";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  36  	case MEDIA_INTF_T_V4L_SUBDEV:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  37  		return "v4l-subdev";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  38  	case MEDIA_INTF_T_V4L_SWRADIO:
66c1db1bc5e1a21 drivers/media/media-entity.c Shuah Khan            2016-03-04  39  		return "v4l-swradio";
b2fe22d0cf64708 drivers/media/media-entity.c Nick Dyer             2016-07-18  40  	case MEDIA_INTF_T_V4L_TOUCH:
b2fe22d0cf64708 drivers/media/media-entity.c Nick Dyer             2016-07-18  41  		return "v4l-touch";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  42  	default:
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  43  		return "unknown-intf";
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  44  	}
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  45  };
27e543fa87deea3 drivers/media/media-entity.c Mauro Carvalho Chehab 2015-08-20  46  
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02 @47  static inline const char *link_type_name(struct media_link *link)
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  48  {
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  49  	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  50  	case MEDIA_LNK_FL_DATA_LINK:
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  51  		return "data";
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  52  	case MEDIA_LNK_FL_INTERFACE_LINK:
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  53  		return "interface";
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  54  	case MEDIA_LNK_FL_ANCILLARY_LINK:
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  55  		return "ancillary";
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  56  	default:
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  57  		return "unknown";
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  58  	}
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  59  }
9d0c23bfe7083f1 drivers/media/mc/mc-entity.c Daniel Scally         2022-03-02  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
