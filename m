Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE2AD5F
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690364510; x=1721900510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYic6IwrKmi3lxafkGNzeVejdPTH8aDLu4syEg3ihzs=;
  b=l9x431M9IVQRENcLFYJkPSWc3tIXcrQlWW/MVMPPzZ/6DShyRWxR91XL
   fsT7fd2pD+xZ+SWfLEtrn/eIgJHW1sGjnoRmyOqcLmMeQf+KVUgfyxXlC
   gm45hbz5tmpwpRPi6esuUMlEzdMeyyYp1RSo6l+RLFnvSIvfU/QjR9iqf
   07JRxIuiLHqIhd7nYQQgbZ+TaaHVkFSnMD2DLJoleMzrvEZaxVbakgNRJ
   WrcOu3e6QCkFPt08z9u4JNCx1DCJYsetR7tGcTJIBf/C3SRqL7/iiXt2r
   4oqhzIBENNeH98noHWVDD2sqeCd8nGqZYZVs+Z/J61RfQemQjngtJ7/lT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398900950"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398900950"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729779818"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729779818"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 02:41:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOb18-0000rl-19;
	Wed, 26 Jul 2023 09:41:21 +0000
Date: Wed, 26 Jul 2023 17:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261747.cMfONhUI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hid/hid-udraw-ps3.c:92:16: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-x061-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261747.cMfONhUI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261747.cMfONhUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261747.cMfONhUI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-udraw-ps3.c:92:16: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-udraw-ps3.c:92:16: sparse: sparse: static assertion failed: "clamp() low limit accel_limits[offset].min greater than high limit accel_limits[offset].max"
--
>> drivers/media/pci/bt8xx/bttv-vbi.c:271:33: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-vbi.c:271:33: sparse: sparse: static assertion failed: "clamp() low limit min_start greater than high limit max_start"
   drivers/media/pci/bt8xx/bttv-vbi.c:275:39: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-vbi.c:275:39: sparse: sparse: static assertion failed: "clamp() low limit (s64) 1 greater than high limit max_end - start"
--
>> drivers/media/pci/bt8xx/bttv-driver.c:1979:26: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:1979:26: sparse: sparse: static assertion failed: "clamp() low limit min_width greater than high limit max_width"
   drivers/media/pci/bt8xx/bttv-driver.c:1980:27: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:1980:27: sparse: sparse: static assertion failed: "clamp() low limit min_height greater than high limit max_height"
   drivers/media/pci/bt8xx/bttv-driver.c:2443:23: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:2443:23: sparse: sparse: static assertion failed: "clamp() low limit (s32)(b_left) greater than high limit (s32)(b_right - 48)"
   drivers/media/pci/bt8xx/bttv-driver.c:2446:24: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:2446:24: sparse: sparse: static assertion failed: "clamp() low limit (s32)(48) greater than high limit (s32)(b_right - c.rect.left)"
   drivers/media/pci/bt8xx/bttv-driver.c:2449:22: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:2449:22: sparse: sparse: static assertion failed: "clamp() low limit (s32)(b_top) greater than high limit (s32)(b_bottom - 32)"
   drivers/media/pci/bt8xx/bttv-driver.c:2453:25: sparse: sparse: bad integer constant expression
>> drivers/media/pci/bt8xx/bttv-driver.c:2453:25: sparse: sparse: static assertion failed: "clamp() low limit (s32)(32) greater than high limit (s32)(b_bottom - c.rect.top)"
--
>> drivers/media/pci/ivtv/ivtv-ioctl.c:851:24: sparse: sparse: bad integer constant expression
>> drivers/media/pci/ivtv/ivtv-ioctl.c:851:24: sparse: sparse: static assertion failed: "clamp() low limit 16U greater than high limit r.width"
   drivers/media/pci/ivtv/ivtv-ioctl.c:852:25: sparse: sparse: bad integer constant expression
>> drivers/media/pci/ivtv/ivtv-ioctl.c:852:25: sparse: sparse: static assertion failed: "clamp() low limit 16U greater than high limit r.height"
   drivers/media/pci/ivtv/ivtv-ioctl.c:853:23: sparse: sparse: bad integer constant expression
>> drivers/media/pci/ivtv/ivtv-ioctl.c:853:23: sparse: sparse: static assertion failed: "clamp() low limit (unsigned)(0) greater than high limit (unsigned)(r.width - sel->r.width)"
   drivers/media/pci/ivtv/ivtv-ioctl.c:854:22: sparse: sparse: bad integer constant expression
>> drivers/media/pci/ivtv/ivtv-ioctl.c:854:22: sparse: sparse: static assertion failed: "clamp() low limit (unsigned)(0) greater than high limit (unsigned)(r.height - sel->r.height)"

vim +92 drivers/hid/hid-udraw-ps3.c

0edffe655a52d7c Bastien Nocera 2016-11-15   89  
0edffe655a52d7c Bastien Nocera 2016-11-15   90  static int clamp_accel(int axis, int offset)
0edffe655a52d7c Bastien Nocera 2016-11-15   91  {
0edffe655a52d7c Bastien Nocera 2016-11-15  @92  	axis = clamp(axis,
0edffe655a52d7c Bastien Nocera 2016-11-15   93  			accel_limits[offset].min,
0edffe655a52d7c Bastien Nocera 2016-11-15   94  			accel_limits[offset].max);
0edffe655a52d7c Bastien Nocera 2016-11-15   95  	axis = (axis - accel_limits[offset].min) /
0edffe655a52d7c Bastien Nocera 2016-11-15   96  			((accel_limits[offset].max -
0edffe655a52d7c Bastien Nocera 2016-11-15   97  			  accel_limits[offset].min) * 0xFF);
0edffe655a52d7c Bastien Nocera 2016-11-15   98  	return axis;
0edffe655a52d7c Bastien Nocera 2016-11-15   99  }
0edffe655a52d7c Bastien Nocera 2016-11-15  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
