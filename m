Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C14323C
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcEvQYZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699138105; x=1730674105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARVbWVOVzhkS5BrFhzFG4woYIcNUEsR82na1GjN2Vg4=;
  b=DcEvQYZ7vBGgMD0A413qQ7v+5tBMlnWqmfw7BJujVfWgM8q8mGfDZ9M5
   LymJ1qQHujdeZzQp694YIIrmOG/boSC1hF2g2dfHuAMz3kLB7rf9VFOZj
   EIQiWQ60XW85xGkt5iyWqPSMsOj0l18zHEHVkzXvw6LiyH+2I9cUBlNZs
   KLlr6VboUWRF0aWFJ1PI2T2muQVxzC3vhg7AYYMK1m/dISDXnJU9/Zhop
   6ijCn0/xQmolbBQ7aMsNog5q04SvAiSA7Y2Omgjomm8OWHaQEXG0aQ2kP
   E9X6qJgPPUL21xj/djwZMKomjJrF3V5TN82rI6ApjDF9xiESZ+PcWi3JA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379505061"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379505061"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 15:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="1093412061"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="1093412061"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2023 15:48:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzPRE-0004lS-2N;
	Sat, 04 Nov 2023 22:48:20 +0000
Date: Sun, 5 Nov 2023 06:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 1/2]
 drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc()
 warn: Please consider using kvcalloc instead of kvmalloc_array
Message-ID: <202311050628.SanlxVUC-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   85ccc4a25c6007d2ac4284565b1864f9abd44808
commit: c8726f223084c769a10dc66c0a115114f36ec844 [1/2] ANDROID: GKI: add VIDEOBUF2_DMA_SG under GKI_HIDDEN_MEDIA_CONFIGS
:::::: branch date: 35 hours ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-randconfig-161-20231101 (https://download.01.org/0day-ci/archive/20231105/202311050628.SanlxVUC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311050628.SanlxVUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311050628.SanlxVUC-lkp@intel.com/

smatch warnings:
drivers/media/common/videobuf2/videobuf2-dma-sg.c:129 vb2_dma_sg_alloc() warn: Please consider using kvcalloc instead of kvmalloc_array

vim +129 drivers/media/common/videobuf2/videobuf2-dma-sg.c

df23728118cd0f drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  100  
e922d0b6e6a67a drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2021-09-09  101  static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *dev,
e922d0b6e6a67a drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2021-09-09  102  			      unsigned long size)
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  103  {
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  104  	struct vb2_dma_sg_buf *buf;
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  105  	struct sg_table *sgt;
df23728118cd0f drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  106  	int ret;
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  107  	int num_pages;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  108  
9cc25c4bea9e78 drivers/media/common/videobuf2/videobuf2-dma-sg.c Ricardo Ribalda       2021-03-09  109  	if (WARN_ON(!dev) || WARN_ON(!size))
0ff657b0f6120c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  110  		return ERR_PTR(-EINVAL);
0ff657b0f6120c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  111  
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  112  	buf = kzalloc(sizeof *buf, GFP_KERNEL);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  113  	if (!buf)
0ff657b0f6120c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  114  		return ERR_PTR(-ENOMEM);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  115  
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  116  	buf->vaddr = NULL;
e922d0b6e6a67a drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2021-09-09  117  	buf->dma_dir = vb->vb2_queue->dma_dir;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  118  	buf->offset = 0;
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  119  	buf->size = size;
7f8414594e4755 drivers/media/v4l2-core/videobuf2-dma-sg.c        Mauro Carvalho Chehab 2013-04-19  120  	/* size is already page aligned */
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  121  	buf->num_pages = size >> PAGE_SHIFT;
e078b79d8aa70a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  122  	buf->dma_sgt = &buf->sg_table;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  123  
d4db5eb57cab04 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2020-05-14  124  	/*
d4db5eb57cab04 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2020-05-14  125  	 * NOTE: dma-sg allocates memory using the page allocator directly, so
d4db5eb57cab04 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2020-05-14  126  	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
129134e5415d46 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2020-09-11  127  	 * attributes passed from the upper layer.
d4db5eb57cab04 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2020-05-14  128  	 */
758d90e161382c drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19 @129  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
758d90e161382c drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  130  				    GFP_KERNEL | __GFP_ZERO);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  131  	if (!buf->pages)
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  132  		goto fail_pages_array_alloc;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  133  
e922d0b6e6a67a drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2021-09-09  134  	ret = vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_flags);
df23728118cd0f drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  135  	if (ret)
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  136  		goto fail_pages_alloc;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  137  
e078b79d8aa70a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  138  	ret = sg_alloc_table_from_pages(buf->dma_sgt, buf->pages,
47bc59c52b005f drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-08-01  139  			buf->num_pages, 0, size, GFP_KERNEL);
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  140  	if (ret)
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  141  		goto fail_table_alloc;
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  142  
0c3a14c177aa85 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  143  	/* Prevent the device from being released while the buffer is used */
36c0f8b32c4bd4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15  144  	buf->dev = get_device(dev);
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  145  
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  146  	sgt = &buf->sg_table;
251a79f8f5adfd drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  147  	/*
251a79f8f5adfd drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  148  	 * No need to sync to the device, this will happen later when the
251a79f8f5adfd drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  149  	 * prepare() memop is called.
251a79f8f5adfd drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  150  	 */
8b7c0280ab03dd drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-09-04  151  	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
8b7c0280ab03dd drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-09-04  152  			    DMA_ATTR_SKIP_CPU_SYNC))
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  153  		goto fail_map;
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  154  
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  155  	buf->handler.refcount = &buf->refcount;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  156  	buf->handler.put = vb2_dma_sg_put;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  157  	buf->handler.arg = buf;
e922d0b6e6a67a drivers/media/common/videobuf2/videobuf2-dma-sg.c Sergey Senozhatsky    2021-09-09  158  	buf->vb = vb;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  159  
6c4bb65d0be8f3 drivers/media/v4l2-core/videobuf2-dma-sg.c        Elena Reshetova       2017-03-06  160  	refcount_set(&buf->refcount, 1);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  161  
ffdc78efe1a8a0 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2013-03-02  162  	dprintk(1, "%s: Allocated buffer of %d pages\n",
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  163  		__func__, buf->num_pages);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  164  	return buf;
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  165  
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  166  fail_map:
d790b7eda953df drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  167  	put_device(buf->dev);
e078b79d8aa70a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  168  	sg_free_table(buf->dma_sgt);
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  169  fail_table_alloc:
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  170  	num_pages = buf->num_pages;
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  171  	while (num_pages--)
223012475968fb drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  172  		__free_page(buf->pages[num_pages]);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  173  fail_pages_alloc:
758d90e161382c drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  174  	kvfree(buf->pages);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  175  fail_pages_array_alloc:
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  176  	kfree(buf);
0ff657b0f6120c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  177  	return ERR_PTR(-ENOMEM);
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  178  }
5ba3f757f0592c drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  179  

:::::: The code at line 129 was first introduced by commit
:::::: 758d90e161382c134b7cbd5f724df4de02f3c67e [media] v4l2-core: Use kvmalloc() for potentially big allocations

:::::: TO: Tomasz Figa <tfiga@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
