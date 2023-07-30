Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D39376
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 01:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690679313; x=1722215313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxPHABSNitIGSm/QF/0VtkUkMcjzkhK4RzyP8TPnPAU=;
  b=i4JnQ51NirYAxk3kQfg31YhI9zcohbJenZ30+Y5NhulpH6f196FySUYy
   r7AaJmQDVeaeUUUJNulxkoNTn9plU5K/1D2qwiAK+oQtTxxPSEdE9/2X9
   Ew948u3xotjiX/uCzYn8EZfdmP9rouRPItY6ZB/zmJG9j2SVW0hBbhN2d
   +f+mhceGlj4X63lDXIDocXBxLFhgHZg6LkMHk/Mhv/sCH1YBZV+ZKz3us
   YtLNSpZ85n+3fdVguBAIKoaz6McnAvK7kih3PNRsd7pobKg/QC4WvZAFl
   uOvqPUB/ZjRXpOjq1DxHraU5PsEAvQgAb2eV3eQ2E4emPMFGPk1/4ZU9r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="349100545"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="349100545"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 18:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="762954223"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="762954223"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 18:08:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPuv7-0004Mh-34;
	Sun, 30 Jul 2023 01:08:29 +0000
Date: Sun, 30 Jul 2023 09:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307300902.tWiTL9YB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/test-drivers/vicodec/vicodec-core.c:1199:33: sparse: sparse: bad integer constant expression"
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
[also build test WARNING on linus/master]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: xtensa-randconfig-r071-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300902.tWiTL9YB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300902.tWiTL9YB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307300902.tWiTL9YB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/test-drivers/vicodec/vicodec-core.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/media/test-drivers/vicodec/vicodec-core.c:1199:33: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vicodec/vicodec-core.c:1199:33: sparse: sparse: static assertion failed: "clamp() low limit 640U greater than high limit q_data->coded_width"
   drivers/media/test-drivers/vicodec/vicodec-core.c:1202:34: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vicodec/vicodec-core.c:1202:34: sparse: sparse: static assertion failed: "clamp() low limit 360U greater than high limit q_data->coded_height"
--
   drivers/media/test-drivers/vivid/vivid-radio-common.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/media/test-drivers/vivid/vivid-radio-common.c:165:16: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-radio-common.c:165:16: sparse: sparse: static assertion failed: "clamp() low limit (u32)(vivid_radio_bands[band].rangelow) greater than high limit (u32)(vivid_radio_bands[band].rangehigh)"
--
   drivers/media/test-drivers/vivid/vivid-radio-rx.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/media/test-drivers/vivid/vivid-radio-rx.c:193:16: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-radio-rx.c:193:16: sparse: sparse: static assertion failed: "clamp() low limit low greater than high limit high"
--
   drivers/media/test-drivers/vivid/vivid-sdr-cap.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/media/test-drivers/vivid/vivid-sdr-cap.c:395:24: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-sdr-cap.c:395:24: sparse: sparse: static assertion failed: "clamp() low limit (unsigned)(bands_adc[band].rangelow) greater than high limit (unsigned)(bands_adc[band].rangehigh)"
   drivers/media/test-drivers/vivid/vivid-sdr-cap.c:409:36: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-sdr-cap.c:409:36: sparse: sparse: static assertion failed: "clamp() low limit (unsigned)(bands_fm[0].rangelow) greater than high limit (unsigned)(bands_fm[0].rangehigh)"
--
   drivers/media/test-drivers/vivid/vivid-vid-out.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/xtensa/include/asm/processor.h:103:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:133:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:856:23: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:856:23: sparse: sparse: static assertion failed: "clamp() low limit (int)(-dev->display_width) greater than high limit (int)(dev->display_width)"
   drivers/media/test-drivers/vivid/vivid-vid-out.c:858:22: sparse: sparse: bad integer constant expression
>> drivers/media/test-drivers/vivid/vivid-vid-out.c:858:22: sparse: sparse: static assertion failed: "clamp() low limit (int)(-dev->display_height) greater than high limit (int)(dev->display_height)"

vim +1199 drivers/media/test-drivers/vicodec/vicodec-core.c

9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1180  
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1181  static int vidioc_s_selection(struct file *file, void *priv,
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1182  			      struct v4l2_selection *s)
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1183  {
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1184  	struct vicodec_ctx *ctx = file2ctx(file);
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1185  	struct vicodec_q_data *q_data;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1186  
7243e5a06e4847 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-03-06  1187  	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
db9a01b32ca940 drivers/media/platform/vicodec/vicodec-core.c Hans Verkuil     2019-01-30  1188  		return -EINVAL;
db9a01b32ca940 drivers/media/platform/vicodec/vicodec-core.c Hans Verkuil     2019-01-30  1189  
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1190  	q_data = get_q_data(ctx, s->type);
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1191  	if (!q_data)
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1192  		return -EINVAL;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1193  
db9a01b32ca940 drivers/media/platform/vicodec/vicodec-core.c Hans Verkuil     2019-01-30  1194  	if (!ctx->is_enc || s->target != V4L2_SEL_TGT_CROP)
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1195  		return -EINVAL;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1196  
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1197  	s->r.left = 0;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1198  	s->r.top = 0;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21 @1199  	q_data->visible_width = clamp(s->r.width, MIN_WIDTH,
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1200  				      q_data->coded_width);
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1201  	s->r.width = q_data->visible_width;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21 @1202  	q_data->visible_height = clamp(s->r.height, MIN_HEIGHT,
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1203  				       q_data->coded_height);
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1204  	s->r.height = q_data->visible_height;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1205  	return 0;
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1206  }
9e812549883730 drivers/media/platform/vicodec/vicodec-core.c Dafna Hirschfeld 2019-01-21  1207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
