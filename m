Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33747B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678567923; x=1710103923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YVTZA8hBUfv5jHiVoKXMriJUMvVjW3K6e0gw/A0D/3A=;
  b=Jdo0js6cMUAGU62Wb1BnPGtWQTW2I5qMfAxn885Z6aH5a8+EW4oYmSwP
   qyhRVCzkM3zTIQ0H955NFA8JVGnd7UmAw3hRJACTW6Jc7KVw3mLpOTUW5
   98wMrnnvZBF8GqBSYomByk0bkYZ1SKO+apV26fojRWx8nGLbvajCr8S8j
   Rb5sucThYTNMZYgexpB9xd82wGMoGX28wLA0NLjhGKOrUc3DOijPEJyIw
   gKiGrXsWyXIoaxXO0J8G5Ls6ZFxORNXuB/VKiRBY1qw+6N0NJCFnetzma
   8wbtE3qCVF18Yq4dPq0DUKINqpomqDZAMlFWnQNt4ZmIhdSjlaDXgcbXF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="316586429"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="316586429"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 12:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="767235293"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="767235293"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2023 12:52:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb6C9-0004nl-1r;
	Sat, 11 Mar 2023 20:52:01 +0000
Date: Sun, 12 Mar 2023 04:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] media: meson: vdec: add HEVC decode codec
Message-ID: <202303120441.YFGHDOya-lkp@intel.com>
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
In-Reply-To: <20230124034058.3407235-3-christianshewitt@gmail.com>
References: <20230124034058.3407235-3-christianshewitt@gmail.com>
TO: Christian Hewitt <christianshewitt@gmail.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
TO: linux-amlogic@lists.infradead.org
TO: linux-staging@lists.linux.dev
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Christian Hewitt <christianshewitt@gmail.com>
CC: Maxime Jourdan <mjourdan@baylibre.com>
CC: Benjamin Roszak <benjamin545@gmail.com>

Hi Christian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/media-meson-vdec-implement-10bit-bitstream-handling/20230124-114201
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230124034058.3407235-3-christianshewitt%40gmail.com
patch subject: [PATCH v2 2/2] media: meson: vdec: add HEVC decode codec
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-m031-20230310 (https://download.01.org/0day-ci/archive/20230312/202303120441.YFGHDOya-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303120441.YFGHDOya-lkp@intel.com/

smatch warnings:
drivers/staging/media/meson/vdec/codec_hevc.c:734 codec_hevc_prepare_new_frame() warn: possible memory leak of 'new_frame'

vim +/new_frame +734 drivers/staging/media/meson/vdec/codec_hevc.c

015f7814a5a991 Maxime Jourdan 2023-01-24  717  
015f7814a5a991 Maxime Jourdan 2023-01-24  718  static struct hevc_frame *
015f7814a5a991 Maxime Jourdan 2023-01-24  719  codec_hevc_prepare_new_frame(struct amvdec_session *sess)
015f7814a5a991 Maxime Jourdan 2023-01-24  720  {
015f7814a5a991 Maxime Jourdan 2023-01-24  721  	struct amvdec_core *core = sess->core;
015f7814a5a991 Maxime Jourdan 2023-01-24  722  	struct hevc_frame *new_frame = NULL;
015f7814a5a991 Maxime Jourdan 2023-01-24  723  	struct codec_hevc *hevc = sess->priv;
015f7814a5a991 Maxime Jourdan 2023-01-24  724  	struct vb2_v4l2_buffer *vbuf;
015f7814a5a991 Maxime Jourdan 2023-01-24  725  	union rpm_param *params = &hevc->rpm_param;
015f7814a5a991 Maxime Jourdan 2023-01-24  726  
015f7814a5a991 Maxime Jourdan 2023-01-24  727  	new_frame = kzalloc(sizeof(*new_frame), GFP_KERNEL);
015f7814a5a991 Maxime Jourdan 2023-01-24  728  	if (!new_frame)
015f7814a5a991 Maxime Jourdan 2023-01-24  729  		return NULL;
015f7814a5a991 Maxime Jourdan 2023-01-24  730  
015f7814a5a991 Maxime Jourdan 2023-01-24  731  	vbuf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx);
015f7814a5a991 Maxime Jourdan 2023-01-24  732  	if (!vbuf) {
015f7814a5a991 Maxime Jourdan 2023-01-24  733  		dev_err(sess->core->dev, "No dst buffer available\n");
015f7814a5a991 Maxime Jourdan 2023-01-24 @734  		return NULL;
015f7814a5a991 Maxime Jourdan 2023-01-24  735  	}
015f7814a5a991 Maxime Jourdan 2023-01-24  736  
015f7814a5a991 Maxime Jourdan 2023-01-24  737  	new_frame->vbuf = vbuf;
015f7814a5a991 Maxime Jourdan 2023-01-24  738  	new_frame->referenced = 1;
015f7814a5a991 Maxime Jourdan 2023-01-24  739  	new_frame->show = 1;
015f7814a5a991 Maxime Jourdan 2023-01-24  740  	new_frame->poc = hevc->curr_poc;
015f7814a5a991 Maxime Jourdan 2023-01-24  741  	new_frame->cur_slice_type = params->p.slice_type;
015f7814a5a991 Maxime Jourdan 2023-01-24  742  	new_frame->num_reorder_pic = params->p.sps_num_reorder_pics_0;
015f7814a5a991 Maxime Jourdan 2023-01-24  743  	new_frame->offset = amvdec_read_dos(core, HEVC_SHIFT_BYTE_COUNT);
015f7814a5a991 Maxime Jourdan 2023-01-24  744  
015f7814a5a991 Maxime Jourdan 2023-01-24  745  	list_add_tail(&new_frame->list, &hevc->ref_frames_list);
015f7814a5a991 Maxime Jourdan 2023-01-24  746  	hevc->frames_num++;
015f7814a5a991 Maxime Jourdan 2023-01-24  747  
015f7814a5a991 Maxime Jourdan 2023-01-24  748  	return new_frame;
015f7814a5a991 Maxime Jourdan 2023-01-24  749  }
015f7814a5a991 Maxime Jourdan 2023-01-24  750  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
