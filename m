Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298118466
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Aug 2023 18:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691952584; x=1723488584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1kUg0mZHAnAkldAX/WBRZg5huHnvutVmd1lKrf14BI=;
  b=lV3l60RAgOZ2EUrzVOjakXxzFNgE0Ebs8JQgd6pwRdOWu5+gg4dP3A4u
   uNzpb1zv1RT+YnVgcARaMVnLUhzleVG1Sgh+jUbFZJnTVRWdci2mJuEo1
   0/xMallBRo386VQQvu0YVu1AHvUhyPJ14CLjMzKs9OG64y8otkWOqrY50
   fetBhDDVEpvj1ZboPBRtGUz/fBY/L5I2KHZkTyX8jfWYNQtyxRvsxKNKR
   0lHgJz47YsObiWLA7JLc74gCJdns/E+S/WuW4g5vMOMR4FN3QtpXfPTlQ
   3eTFo8Ya+Tk/Vjp+iOjfhyhSnRNQ/hyHWuYzSQPFI+7+ZRILbfYOzhLat
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370815811"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="370815811"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 11:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856841513"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="856841513"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Aug 2023 11:49:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVG9k-0009Bk-0p;
	Sun, 13 Aug 2023 18:49:40 +0000
Date: Mon, 14 Aug 2023 02:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/media/atomisp/pci/atomisp_cmd.c:4141
 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see
 line 4125)
Message-ID: <202308140256.ytjPsLKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4c75bf7e4a0e5472bd8f0bf0a4a418ac717a9b70
commit: 9f221053342ab943c4bac8d5cf10ca256793a878 media: atomisp: Add input helper variable for isp->asd->inputs[asd->input_curr]
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230814/202308140256.ytjPsLKK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308140256.ytjPsLKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308140256.ytjPsLKK-lkp@intel.com/

New smatch warnings:
drivers/staging/media/atomisp/pci/atomisp_cmd.c:4141 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4125)

Old smatch warnings:
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

vim +/asd +4141 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4118  
df1697fa1778be drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-03-05  4119  static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_pix_format *f,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4120  				  unsigned int padding_w, unsigned int padding_h,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4121  				  unsigned int dvs_env_w, unsigned int dvs_env_h)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4122  {
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4123  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
71665d81621412 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2021-11-10  4124  	struct atomisp_sub_device *asd = pipe->asd;
9f221053342ab9 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-29 @4125  	struct atomisp_device *isp = asd->isp;
9f221053342ab9 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-29  4126  	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4127  	const struct atomisp_format_bridge *format;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4128  	struct v4l2_subdev_pad_config pad_cfg;
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tomi Valkeinen        2021-06-10  4129  	struct v4l2_subdev_state pad_state = {
a1e259872f3ea2 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Laurent Pinchart      2023-02-15  4130  		.pads = &pad_cfg,
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tomi Valkeinen        2021-06-10  4131  	};
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4132  	struct v4l2_subdev_format vformat = {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4133  		.which = V4L2_SUBDEV_FORMAT_TRY,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4134  	};
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4135  	struct v4l2_mbus_framefmt *ffmt = &vformat.format;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4136  	struct v4l2_mbus_framefmt *req_ffmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4137  	struct atomisp_input_stream_info *stream_info =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4138  	    (struct atomisp_input_stream_info *)ffmt->reserved;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4139  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4140  
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18 @4141  	if (!asd) {
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4142  		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4143  			__func__, vdev->name);
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4144  		return -EINVAL;
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4145  	}
c10bcb13462e9c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Tsuchiya Yuto         2021-10-18  4146  
df1697fa1778be drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-03-05  4147  	format = atomisp_get_format_bridge(f->pixelformat);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4148  	if (!format)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4149  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4150  
97b34809ec240d drivers/staging/media/atomisp/pci/atomisp_cmd.c          Arnd Bergmann         2021-02-26  4151  	v4l2_fill_mbus_format(ffmt, f, format->mbus_code);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4152  	ffmt->height += padding_h + dvs_env_h;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4153  	ffmt->width += padding_w + dvs_env_w;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4154  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4155  	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4156  		ffmt->width, ffmt->height, padding_w, padding_h,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4157  		dvs_env_w, dvs_env_h);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4158  
1e32f6ea43c44c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2022-09-09  4159  	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4160  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4161  	req_ffmt = ffmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4162  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4163  	/* Disable dvs if resolution can't be supported by sensor */
ea3600379e0f38 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-07  4164  	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4165  		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
9f221053342ab9 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-29  4166  		ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &vformat);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4167  		if (ret)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4168  			return ret;
9a542497cc887d drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2021-11-04  4169  
9a542497cc887d drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2021-11-04  4170  		dev_dbg(isp->dev, "video dis: sensor width: %d, height: %d\n",
9a542497cc887d drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2021-11-04  4171  			ffmt->width, ffmt->height);
9a542497cc887d drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2021-11-04  4172  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4173  		if (ffmt->width < req_ffmt->width ||
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4174  		    ffmt->height < req_ffmt->height) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4175  			req_ffmt->height -= dvs_env_h;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4176  			req_ffmt->width -= dvs_env_w;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4177  			ffmt = req_ffmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4178  			dev_warn(isp->dev,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4179  				 "can not enable video dis due to sensor limitation.");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4180  			asd->params.video_dis_en = false;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4181  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4182  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4183  	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
9f221053342ab9 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-29  4184  	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4185  	if (ret)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4186  		return ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4187  
1e32f6ea43c44c drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2022-09-09  4188  	__atomisp_update_stream_env(asd, ATOMISP_INPUT_STREAM_GENERAL, stream_info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4189  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4190  	dev_dbg(isp->dev, "sensor width: %d, height: %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4191  		ffmt->width, ffmt->height);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4192  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4193  	if (ffmt->width < ATOM_ISP_STEP_WIDTH ||
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4194  	    ffmt->height < ATOM_ISP_STEP_HEIGHT)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4195  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4196  
ea3600379e0f38 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-07  4197  	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4198  	    (ffmt->width < req_ffmt->width || ffmt->height < req_ffmt->height)) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4199  		dev_warn(isp->dev,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4200  			 "can not enable video dis due to sensor limitation.");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4201  		asd->params.video_dis_en = false;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4202  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4203  
e79fae3d150955 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-05-29  4204  	atomisp_subdev_set_ffmt(&asd->subdev, NULL,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4205  				V4L2_SUBDEV_FORMAT_ACTIVE,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4206  				ATOMISP_SUBDEV_PAD_SINK, ffmt);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4207  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4208  	return css_input_resolution_changed(asd, ffmt);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4209  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  4210  

:::::: The code at line 4141 was first introduced by commit
:::::: c10bcb13462e9cf43111d17f1e08b4bb4d4401b0 media: atomisp: add NULL check for asd obtained from atomisp_video_pipe

:::::: TO: Tsuchiya Yuto <kitakar@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
