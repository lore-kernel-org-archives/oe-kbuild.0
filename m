Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00465D
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 02:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690598507; x=1722134507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82qnXk84ZgKiBMP8PzejPgVhhXbTqfR6Uxlf14Ikl8I=;
  b=fWbbbI1OBYzBJaqtf+BDVTRAZOSteGxCS2d4VabFvHrqNg9HXajxLtkq
   UQOSS8O+/M+3EhwX0ITN44GhLHjesNXWkBiJRzzEsUGFOBmz9KS47Ou1D
   18gdc76XA7axRnCgWYJ80PjTzCaZa6bORTHMdbf1Op0E2uCP8lZVSqMdJ
   tXdw95I2XZ4B1n/HF4wmas1ZUZKew+1nZ/mqj6lUQ2P940O8bfoqqnbyh
   +4siR2RYKnHsFnZ7IlpFQGmJppYUJxKtTYJ9HDL/VSJ3X0pVsI9qBNvZw
   WSuaym9YuBXkOiVTi5B6X4OaFTQwFYx+Kz2SYO+UOmlgPnl+ym5Fracc+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367606323"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="367606323"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="1058339351"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="1058339351"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2023 19:41:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPZto-0003lv-2l;
	Sat, 29 Jul 2023 02:41:44 +0000
Date: Sat, 29 Jul 2023 10:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307291049.THzIoWG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/staging/media/imx/imx-media-csc-scaler.c:367:22: sparse: sparse: bad integer constant expression"
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
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-r081-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291049.THzIoWG5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291049.THzIoWG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307291049.THzIoWG5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/media/imx/imx-media-csc-scaler.c: note: in included file (through include/video/imx-ipu-v3.h):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
>> drivers/staging/media/imx/imx-media-csc-scaler.c:367:22: sparse: sparse: bad integer constant expression
>> drivers/staging/media/imx/imx-media-csc-scaler.c:367:22: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(8) greater than high limit (unsigned int)(((q_data->cur_fmt.width) & ~((__typeof__(q_data->cur_fmt.width))((8)-1))))"
   drivers/staging/media/imx/imx-media-csc-scaler.c:369:23: sparse: sparse: bad integer constant expression
>> drivers/staging/media/imx/imx-media-csc-scaler.c:369:23: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(1) greater than high limit (unsigned int)(q_data->cur_fmt.height)"
   drivers/staging/media/imx/imx-media-csc-scaler.c:371:21: sparse: sparse: bad integer constant expression
>> drivers/staging/media/imx/imx-media-csc-scaler.c:371:21: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(0) greater than high limit (unsigned int)(q_data->cur_fmt.width - s->r.width)"
   drivers/staging/media/imx/imx-media-csc-scaler.c:373:20: sparse: sparse: bad integer constant expression
>> drivers/staging/media/imx/imx-media-csc-scaler.c:373:20: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(0) greater than high limit (unsigned int)(q_data->cur_fmt.height - s->r.height)"
--
>> drivers/staging/media/omap4iss/iss_ipipe.c:231:30: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_ipipe.c:231:30: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->width)"
   drivers/staging/media/omap4iss/iss_ipipe.c:232:31: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_ipipe.c:232:31: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->height)"
--
>> drivers/staging/media/omap4iss/iss_video.c:143:23: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_video.c:143:23: sparse: sparse: static assertion failed: "clamp() low limit min_bpl greater than high limit video->bpl_max"
--
>> drivers/staging/media/omap4iss/iss_ipipeif.c:417:30: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_ipipeif.c:417:30: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)((fmt->width + 15) & ~15)"
   drivers/staging/media/omap4iss/iss_ipipeif.c:419:31: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_ipipeif.c:419:31: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->height)"
   drivers/staging/media/omap4iss/iss_ipipeif.c:428:30: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_ipipeif.c:428:30: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->width)"
   drivers/staging/media/omap4iss/iss_ipipeif.c:429:31: sparse: sparse: bad integer constant expression
   drivers/staging/media/omap4iss/iss_ipipeif.c:429:31: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->height)"
--
>> drivers/staging/media/omap4iss/iss_resizer.c:479:30: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_resizer.c:479:30: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)((fmt->width + 15) & ~15)"
   drivers/staging/media/omap4iss/iss_resizer.c:481:31: sparse: sparse: bad integer constant expression
>> drivers/staging/media/omap4iss/iss_resizer.c:481:31: sparse: sparse: static assertion failed: "clamp() low limit (u32)(32) greater than high limit (u32)(fmt->height)"

vim +367 drivers/staging/media/imx/imx-media-csc-scaler.c

a8ef0488cc5929 Philipp Zabel 2019-08-14  333  
a8ef0488cc5929 Philipp Zabel 2019-08-14  334  static int ipu_csc_scaler_s_selection(struct file *file, void *priv,
a8ef0488cc5929 Philipp Zabel 2019-08-14  335  				      struct v4l2_selection *s)
a8ef0488cc5929 Philipp Zabel 2019-08-14  336  {
a8ef0488cc5929 Philipp Zabel 2019-08-14  337  	struct ipu_csc_scaler_ctx *ctx = fh_to_ctx(priv);
a8ef0488cc5929 Philipp Zabel 2019-08-14  338  	struct ipu_csc_scaler_q_data *q_data;
a8ef0488cc5929 Philipp Zabel 2019-08-14  339  
a8ef0488cc5929 Philipp Zabel 2019-08-14  340  	switch (s->target) {
a8ef0488cc5929 Philipp Zabel 2019-08-14  341  	case V4L2_SEL_TGT_CROP:
a8ef0488cc5929 Philipp Zabel 2019-08-14  342  		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
a8ef0488cc5929 Philipp Zabel 2019-08-14  343  			return -EINVAL;
a8ef0488cc5929 Philipp Zabel 2019-08-14  344  		break;
a8ef0488cc5929 Philipp Zabel 2019-08-14  345  	case V4L2_SEL_TGT_COMPOSE:
a8ef0488cc5929 Philipp Zabel 2019-08-14  346  		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
a8ef0488cc5929 Philipp Zabel 2019-08-14  347  			return -EINVAL;
a8ef0488cc5929 Philipp Zabel 2019-08-14  348  		break;
a8ef0488cc5929 Philipp Zabel 2019-08-14  349  	default:
a8ef0488cc5929 Philipp Zabel 2019-08-14  350  		return -EINVAL;
a8ef0488cc5929 Philipp Zabel 2019-08-14  351  	}
a8ef0488cc5929 Philipp Zabel 2019-08-14  352  
a8ef0488cc5929 Philipp Zabel 2019-08-14  353  	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
a8ef0488cc5929 Philipp Zabel 2019-08-14  354  	    s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
a8ef0488cc5929 Philipp Zabel 2019-08-14  355  		return -EINVAL;
a8ef0488cc5929 Philipp Zabel 2019-08-14  356  
a8ef0488cc5929 Philipp Zabel 2019-08-14  357  	q_data = get_q_data(ctx, s->type);
a8ef0488cc5929 Philipp Zabel 2019-08-14  358  
a8ef0488cc5929 Philipp Zabel 2019-08-14  359  	/* The input's frame width to the IC must be a multiple of 8 pixels
a8ef0488cc5929 Philipp Zabel 2019-08-14  360  	 * When performing resizing the frame width must be multiple of burst
a8ef0488cc5929 Philipp Zabel 2019-08-14  361  	 * size - 8 or 16 pixels as defined by CB#_BURST_16 parameter.
a8ef0488cc5929 Philipp Zabel 2019-08-14  362  	 */
a8ef0488cc5929 Philipp Zabel 2019-08-14  363  	if (s->flags & V4L2_SEL_FLAG_GE)
a8ef0488cc5929 Philipp Zabel 2019-08-14  364  		s->r.width = round_up(s->r.width, 8);
a8ef0488cc5929 Philipp Zabel 2019-08-14  365  	if (s->flags & V4L2_SEL_FLAG_LE)
a8ef0488cc5929 Philipp Zabel 2019-08-14  366  		s->r.width = round_down(s->r.width, 8);
a8ef0488cc5929 Philipp Zabel 2019-08-14 @367  	s->r.width = clamp_t(unsigned int, s->r.width, 8,
a8ef0488cc5929 Philipp Zabel 2019-08-14  368  			     round_down(q_data->cur_fmt.width, 8));
a8ef0488cc5929 Philipp Zabel 2019-08-14 @369  	s->r.height = clamp_t(unsigned int, s->r.height, 1,
a8ef0488cc5929 Philipp Zabel 2019-08-14  370  			      q_data->cur_fmt.height);
a8ef0488cc5929 Philipp Zabel 2019-08-14 @371  	s->r.left = clamp_t(unsigned int, s->r.left, 0,
a8ef0488cc5929 Philipp Zabel 2019-08-14  372  			    q_data->cur_fmt.width - s->r.width);
a8ef0488cc5929 Philipp Zabel 2019-08-14 @373  	s->r.top = clamp_t(unsigned int, s->r.top, 0,
a8ef0488cc5929 Philipp Zabel 2019-08-14  374  			   q_data->cur_fmt.height - s->r.height);
a8ef0488cc5929 Philipp Zabel 2019-08-14  375  
a8ef0488cc5929 Philipp Zabel 2019-08-14  376  	/* V4L2_SEL_FLAG_KEEP_CONFIG is only valid for subdevices */
a8ef0488cc5929 Philipp Zabel 2019-08-14  377  	q_data->rect = s->r;
a8ef0488cc5929 Philipp Zabel 2019-08-14  378  
a8ef0488cc5929 Philipp Zabel 2019-08-14  379  	return 0;
a8ef0488cc5929 Philipp Zabel 2019-08-14  380  }
a8ef0488cc5929 Philipp Zabel 2019-08-14  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
