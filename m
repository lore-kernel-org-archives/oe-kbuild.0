Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA6523CC
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jul 2023 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689019888; x=1720555888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCNaliIldcGuKXGuh33HPRbHYhY98c1OPVQXTAueGzo=;
  b=lGlwaXPIWtH08e1/eBHQL2iMtzcmBx5lCbezj5aXxTnqlxf8EH+N4Hv2
   MjWKaqss7xpyR+oJuukVTXbRjiqRSaJc2kwnF5nCTNqPCEBFvWvCr2g32
   ouQ0vqd4b3GXljVIZjc1lynmerBv08kH2yGqChTUzn1R+Ch608JcA/knE
   +Klyg6frJhHCuSCIscJ7WY9h8C/a9vvxg74rMgaNuACJwx/7CowRrP2dQ
   zoelD3/83dM8CwocD+oedJVQLefaTS6LUHBMaDCl/dFKueg5WkP5rpg75
   tMn240WH+myz3YX2n0yCGtlv1DEpQAmSoPNQYJGmGVfvl34UEEdXNePOo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363311535"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="363311535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 13:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="967539789"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="967539789"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2023 13:11:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIxED-0003x2-0k;
	Mon, 10 Jul 2023 20:11:25 +0000
Date: Tue, 11 Jul 2023 04:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
Message-ID: <202307110324.A5LMPHou-lkp@intel.com>
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
In-Reply-To: <20230704040044.681850-3-randy.li@synaptics.com>
References: <20230704040044.681850-3-randy.li@synaptics.com>
TO: "Hsia-Jun Li" <randy.li@synaptics.com>
TO: linux-media@vger.kernel.org
CC: ayaka@soulik.info
CC: hans.verkuil@cisco.com
CC: tfiga@chromium.org
CC: mchehab@kernel.org
CC: laurent.pinchart@ideasonboard.com
CC: hiroh@chromium.org
CC: hverkuil@xs4all.nl
CC: linux-kernel@vger.kernel.org
CC: nicolas@ndufresne.ca
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Hi Hsia-Jun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsia-Jun-Li/media-v4l2-mem2mem-allow-device-run-without-buf/20230704-120308
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230704040044.681850-3-randy.li%40synaptics.com
patch subject: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-m041-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110324.A5LMPHou-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110324.A5LMPHou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307110324.A5LMPHou-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-mem2mem.c:343 __v4l2_m2m_try_queue() error: uninitialized symbol 'src'.
drivers/media/v4l2-core/v4l2-mem2mem.c:343 __v4l2_m2m_try_queue() error: uninitialized symbol 'dst'.

vim +/src +343 drivers/media/v4l2-core/v4l2-mem2mem.c

7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  286  
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  287  /*
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  288   * __v4l2_m2m_try_queue() - queue a job
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  289   * @m2m_dev: m2m device
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  290   * @m2m_ctx: m2m context
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  291   *
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  292   * Check if this context is ready to queue a job.
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  293   *
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  294   * This function can run in interrupt context.
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  295   */
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  296  static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  297  				 struct v4l2_m2m_ctx *m2m_ctx)
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  298  {
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  299  	unsigned long flags_job;
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  300  	struct vb2_v4l2_buffer *dst, *src;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  301  
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  302  	dprintk("Trying to schedule a job for m2m_ctx: %p\n", m2m_ctx);
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  303  
f3e1a4c9d7a02d drivers/media/v4l2-core/v4l2-mem2mem.c Randy Li           2023-07-04  304  	if (!(m2m_ctx->out_q_ctx.q.streaming || m2m_ctx->out_q_ctx.buffered)
f3e1a4c9d7a02d drivers/media/v4l2-core/v4l2-mem2mem.c Randy Li           2023-07-04  305  	    || !(m2m_ctx->cap_q_ctx.q.streaming
f3e1a4c9d7a02d drivers/media/v4l2-core/v4l2-mem2mem.c Randy Li           2023-07-04  306  		 || m2m_ctx->cap_q_ctx.buffered)) {
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  307  		dprintk("Streaming needs to be on for both queues\n");
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  308  		return;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  309  	}
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  310  
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  311  	spin_lock_irqsave(&m2m_dev->job_spinlock, flags_job);
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  312  
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  313  	/* If the context is aborted then don't schedule it */
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  314  	if (m2m_ctx->job_flags & TRANS_ABORT) {
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  315  		dprintk("Aborted context\n");
cbec2836f8be61 drivers/media/v4l2-core/v4l2-mem2mem.c Sakari Ailus       2018-10-18  316  		goto job_unlock;
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  317  	}
2ad5389b341282 drivers/media/v4l2-core/v4l2-mem2mem.c Shaik Ameer Basha  2013-09-20  318  
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  319  	if (m2m_ctx->job_flags & TRANS_QUEUED) {
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  320  		dprintk("On job queue already\n");
cbec2836f8be61 drivers/media/v4l2-core/v4l2-mem2mem.c Sakari Ailus       2018-10-18  321  		goto job_unlock;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  322  	}
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  323  
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  324) 	if (list_empty(&m2m_ctx->out_q_ctx.hw_queue)) {
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  325  		src = v4l2_m2m_next_src_buf(m2m_ctx);
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  326) 
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  327  		if (!src && !m2m_ctx->out_q_ctx.buffered) {
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  328  			dprintk("No input buffers available\n");
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  329  			goto job_unlock;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  330  		}
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  331) 	}
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  332) 
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  333) 	if (list_empty(&m2m_ctx->cap_q_ctx.hw_queue)) {
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  334) 		dst = v4l2_m2m_next_dst_buf(m2m_ctx);
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  335  		if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  336  			dprintk("No output buffers available\n");
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  337  			goto job_unlock;
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  338  		}
cafbe530b02613 drivers/media/v4l2-core/v4l2-mem2mem.c Hsia-Jun(Randy  Li 2023-07-04  339) 	}
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  340  
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  341  	m2m_ctx->new_frame = true;
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  342  
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11 @343  	if (src && dst && dst->is_held &&
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  344  	    dst->vb2_buf.copied_timestamp &&
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  345  	    dst->vb2_buf.timestamp != src->vb2_buf.timestamp) {
86ef61ad686c17 drivers/media/v4l2-core/v4l2-mem2mem.c Nicolas Dufresne   2022-04-26  346  		dprintk("Timestamp mismatch, returning held capture buffer\n");
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  347  		dst->is_held = false;
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  348  		v4l2_m2m_dst_buf_remove(m2m_ctx);
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  349  		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  350  		dst = v4l2_m2m_next_dst_buf(m2m_ctx);
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  351  
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  352  		if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  353  			dprintk("No output buffers available after returning held buffer\n");
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  354  			goto job_unlock;
f8cca8c97a63d7 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  355  		}
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  356  	}
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  357  
1076df3a77b490 drivers/media/v4l2-core/v4l2-mem2mem.c Jernej Skrabec     2019-11-06  358  	if (src && dst && (m2m_ctx->out_q_ctx.q.subsystem_flags &
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  359  			   VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  360  		m2m_ctx->new_frame = !dst->vb2_buf.copied_timestamp ||
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  361  			dst->vb2_buf.timestamp != src->vb2_buf.timestamp;
f07602ac388723 drivers/media/v4l2-core/v4l2-mem2mem.c Hans Verkuil       2019-10-11  362  
2b48e113866a67 drivers/media/v4l2-core/v4l2-mem2mem.c Neil Armstrong     2020-03-03  363  	if (m2m_ctx->has_stopped) {
2b48e113866a67 drivers/media/v4l2-core/v4l2-mem2mem.c Neil Armstrong     2020-03-03  364  		dprintk("Device has stopped\n");
2b48e113866a67 drivers/media/v4l2-core/v4l2-mem2mem.c Neil Armstrong     2020-03-03  365  		goto job_unlock;
2b48e113866a67 drivers/media/v4l2-core/v4l2-mem2mem.c Neil Armstrong     2020-03-03  366  	}
2b48e113866a67 drivers/media/v4l2-core/v4l2-mem2mem.c Neil Armstrong     2020-03-03  367  
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  368  	if (m2m_dev->m2m_ops->job_ready
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  369  		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  370  		dprintk("Driver not ready\n");
cbec2836f8be61 drivers/media/v4l2-core/v4l2-mem2mem.c Sakari Ailus       2018-10-18  371  		goto job_unlock;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  372  	}
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  373  
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  374  	list_add_tail(&m2m_ctx->queue, &m2m_dev->job_queue);
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  375  	m2m_ctx->job_flags |= TRANS_QUEUED;
7f98639def42a6 drivers/media/video/v4l2-mem2mem.c     Pawel Osciak       2010-04-23  376  
cbec2836f8be61 drivers/media/v4l2-core/v4l2-mem2mem.c Sakari Ailus       2018-10-18  377  job_unlock:
cbec2836f8be61 drivers/media/v4l2-core/v4l2-mem2mem.c Sakari Ailus       2018-10-18  378  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  379  }
9db3bbf58be59a drivers/media/v4l2-core/v4l2-mem2mem.c Ezequiel Garcia    2018-07-25  380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
