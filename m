Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21017B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060667; x=1705596667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnnhj8OiNZ6p3vm43Mu1f2VDCf29SWngVVvE+dvrPNw=;
  b=YXkKmNyZdm0siu7TvACUlQfSc0OMCppKSKX/guHAPxdNkICIPaKcMbv+
   pTTBuudu5eQQ1/ERlkbzC21qbwfKY36A+IOEdk5ytsttgUuuOza0S63mq
   fIpFJBJiBihHEuP5PGSCx2FS+u3nBMZkA891wSuo3v+id7Bq6rUVAkzav
   zjHkVuuROdpkefigc+H7ItFtYuX8B0x2L9NllFhQ2PMjQLqba/QMYAoRL
   6uZEYFEK5TyJrFsiKGxcmzuHi/itk+147fYVo2OpQVitPybhzAnLK/W7+
   srzqohwlLqVR7GmFb/zDPMZ/BP8k7MmHkhC0yIwjZmpyTAkMRhJ3P/mN/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323715915"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323715915"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="767824536"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="767824536"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 08:50:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBeK-0000X4-2K;
	Wed, 18 Jan 2023 16:50:56 +0000
Date: Thu, 19 Jan 2023 00:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pinchartl:next/imx290 14/18] drivers/media/i2c/imx290.c:1085:12:
 warning: unused function 'imx290_runtime_resume'
Message-ID: <202301190030.QdRrn0CW-lkp@intel.com>
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
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git next/imx290
head:   401820f21a4eb4ae086deb41fae64e7e8defe76a
commit: 390384271c0b9551e67dac81eec10e6023afd40d [14/18] media: i2c: imx290: Initialize runtime PM before subdev
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r041-20230117 (https://download.01.org/0day-ci/archive/20230119/202301190030.QdRrn0CW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=390384271c0b9551e67dac81eec10e6023afd40d
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl next/imx290
        git checkout 390384271c0b9551e67dac81eec10e6023afd40d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/imx290.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/i2c/imx290.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/i2c/imx290.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/i2c/imx290.c:1085:12: warning: unused function 'imx290_runtime_resume' [-Wunused-function]
   static int imx290_runtime_resume(struct device *dev)
              ^
>> drivers/media/i2c/imx290.c:1093:12: warning: unused function 'imx290_runtime_suspend' [-Wunused-function]
   static int imx290_runtime_suspend(struct device *dev)
              ^
   8 warnings generated.


vim +/imx290_runtime_resume +1085 drivers/media/i2c/imx290.c

390384271c0b95 Laurent Pinchart      2022-11-28  1084  
390384271c0b95 Laurent Pinchart      2022-11-28 @1085  static int imx290_runtime_resume(struct device *dev)
390384271c0b95 Laurent Pinchart      2022-11-28  1086  {
390384271c0b95 Laurent Pinchart      2022-11-28  1087  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
390384271c0b95 Laurent Pinchart      2022-11-28  1088  	struct imx290 *imx290 = to_imx290(sd);
390384271c0b95 Laurent Pinchart      2022-11-28  1089  
390384271c0b95 Laurent Pinchart      2022-11-28  1090  	return imx290_power_on(imx290);
390384271c0b95 Laurent Pinchart      2022-11-28  1091  }
390384271c0b95 Laurent Pinchart      2022-11-28  1092  
390384271c0b95 Laurent Pinchart      2022-11-28 @1093  static int imx290_runtime_suspend(struct device *dev)
390384271c0b95 Laurent Pinchart      2022-11-28  1094  {
390384271c0b95 Laurent Pinchart      2022-11-28  1095  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
390384271c0b95 Laurent Pinchart      2022-11-28  1096  	struct imx290 *imx290 = to_imx290(sd);
390384271c0b95 Laurent Pinchart      2022-11-28  1097  
390384271c0b95 Laurent Pinchart      2022-11-28  1098  	imx290_power_off(imx290);
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1099  
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1100  	return 0;
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1101  }
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
