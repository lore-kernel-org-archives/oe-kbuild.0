Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FFB3EB815
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268071; cv=none; b=pyspaS3ON7klRHLxUUBLz0/juOc4cBynKbLvbSkN4Wq6NsnuoGurUQFFzY9jYX8illxdxoT8mag5kvkesXXrnYbaPCsnTFQ/whsVqudN6iHXjvxFzBIIFG7AywZ1Xroabj0xz9UzuFheku+jd/noJheDuqoPDiobSZvTN+X7XC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268071; c=relaxed/simple;
	bh=0nG40yUUtsTv5P7RHMBrMJFRqm1K1PuhaZvdptxEydk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sgt4if9cX+OTfxswgR42S8+GgKXaeKkpiJKG4RRnC2WyomuMoQAwl4/GwbgrNwRNHZ92adEsLlHa0U0ujcrDBtyCR8zAX1x5XNVo2aXK4HWhYy7hL5syzsnKNGtkrNcnLT0JjOKXVSlxq2BChbVLv8qeQzPjIhHj62/tuWlXBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5VsYVvy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5VsYVvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790268069; x=1821804069;
  h=date:from:to:cc:subject:message-id;
  bh=0nG40yUUtsTv5P7RHMBrMJFRqm1K1PuhaZvdptxEydk=;
  b=I5VsYVvyQNaTZC+zBjPt+b9gb37w8jry65AQZFECr2/UlZonMvB8WPVm
   iCYUMNqC/hIP2x825ZIaGXuilizmGaSyvXbxKAKvUZMZtdSOxggRU6Cor
   3PeSOHJ+7CVokgkaGx+7sq0WS51m+OkPvDrRJmPhZuQcatXdreMBQ/leR
   /KPWPN5VwPTS18VyCO98bsyDW9wYpc84TKkPMjc02e3hsNJT/Ctl1AXtP
   toxKb6WJRI+OdgHUTxLIZw3clCDGIZFuECkhAZNp3K1fspuLMkFpOad6h
   mA/5DYhE5mymd+OkZ4k151mTeYIAz3aXYXLXawR5hdEdXMq1OZCseFEII
   A==;
X-CSE-ConnectionGUID: bX8rhVeBR4afIE7+5zD3cg==
X-CSE-MsgGUID: ObiIXzDqRkmjA8GiTFQ33Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91152960"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91152960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 09:41:08 -0700
X-CSE-ConnectionGUID: 3LiMSzhYRPC9rFHNTx2kvw==
X-CSE-MsgGUID: 6MSEwGatQY2mJPM3PCpDYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="311994538"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 09:41:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mVM-00000000JB4-48Wt;
	Thu, 24 Sep 2026 16:41:04 +0000
Date: Fri, 25 Sep 2026 00:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/virtio/scatterlist_builder.c:196:28: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609250023.QgVOOkzB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936, commit: 2ca5e71ca70238e51de6d2f0ba28ebe1192b160c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre Courbot <gnurou@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Brian Daniels <briandaniels@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936
head:   e2cb6fe169d834d225215b07eac8cf91200e372a
commit: 2ca5e71ca70238e51de6d2f0ba28ebe1192b160c media: virtio: Add scatterlist builder
date:   7 days ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r1304-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250023.QgVOOkzB-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250023.QgVOOkzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250023.QgVOOkzB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/virtio/scatterlist_builder.c:196:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/scatterlist_builder.c:196:28: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/scatterlist_builder.c:196:28: sparse:     got int
>> drivers/media/virtio/scatterlist_builder.c:197:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] session_id @@     got unsigned int [usertype] id @@
   drivers/media/virtio/scatterlist_builder.c:197:31: sparse:     expected restricted __le32 [usertype] session_id
   drivers/media/virtio/scatterlist_builder.c:197:31: sparse:     got unsigned int [usertype] id
>> drivers/media/virtio/scatterlist_builder.c:198:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] code @@     got unsigned int @@
   drivers/media/virtio/scatterlist_builder.c:198:25: sparse:     expected restricted __le32 [usertype] code
   drivers/media/virtio/scatterlist_builder.c:198:25: sparse:     got unsigned int
>> drivers/media/virtio/scatterlist_builder.c:299:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] start @@     got unsigned long long @@
   drivers/media/virtio/scatterlist_builder.c:299:33: sparse:     expected restricted __le64 [usertype] start
   drivers/media/virtio/scatterlist_builder.c:299:33: sparse:     got unsigned long long
>> drivers/media/virtio/scatterlist_builder.c:300:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int length @@
   drivers/media/virtio/scatterlist_builder.c:300:31: sparse:     expected restricted __le32 [usertype] len
   drivers/media/virtio/scatterlist_builder.c:300:31: sparse:     got unsigned int length

vim +196 drivers/media/virtio/scatterlist_builder.c

2ca5e71ca70238e Alexandre Courbot 2026-09-17  182  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  183  /**
2ca5e71ca70238e Alexandre Courbot 2026-09-17  184   * scatterlist_builder_add_ioctl_cmd() - Add an ioctl command to the descriptor
2ca5e71ca70238e Alexandre Courbot 2026-09-17  185   *                                       chain.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  186   * @builder: builder to use.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  187   * @session: session on behalf of which the ioctl command is added.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  188   * @ioctl_code: code of the ioctl to add (i.e. ``VIDIOC_*``).
2ca5e71ca70238e Alexandre Courbot 2026-09-17  189   */
2ca5e71ca70238e Alexandre Courbot 2026-09-17  190  int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  191  				      struct virtio_media_session *session,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  192  				      u32 ioctl_code)
2ca5e71ca70238e Alexandre Courbot 2026-09-17  193  {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  194  	struct virtio_media_cmd_ioctl *cmd_ioctl = &session->cmd.ioctl;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  195  
2ca5e71ca70238e Alexandre Courbot 2026-09-17 @196  	cmd_ioctl->hdr.cmd = VIRTIO_MEDIA_CMD_IOCTL;
2ca5e71ca70238e Alexandre Courbot 2026-09-17 @197  	cmd_ioctl->session_id = session->id;
2ca5e71ca70238e Alexandre Courbot 2026-09-17 @198  	cmd_ioctl->code = VIRTIO_MEDIA_IOCTL_CODE(ioctl_code);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  199  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  200  	return scatterlist_builder_add_data(builder, cmd_ioctl,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  201  					    sizeof(*cmd_ioctl));
2ca5e71ca70238e Alexandre Courbot 2026-09-17  202  }
2ca5e71ca70238e Alexandre Courbot 2026-09-17  203  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  204  /**
2ca5e71ca70238e Alexandre Courbot 2026-09-17  205   * scatterlist_builder_add_ioctl_resp() - Add storage to receive an ioctl
2ca5e71ca70238e Alexandre Courbot 2026-09-17  206   *                                        response to the descriptor chain.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  207   * @builder: builder to use.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  208   * @session: session on behalf of which the ioctl response is added.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  209   */
2ca5e71ca70238e Alexandre Courbot 2026-09-17  210  int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  211  				       struct virtio_media_session *session)
2ca5e71ca70238e Alexandre Courbot 2026-09-17  212  {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  213  	struct virtio_media_resp_ioctl *resp_ioctl = &session->resp.ioctl;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  214  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  215  	return scatterlist_builder_add_data(builder, resp_ioctl,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  216  					    sizeof(*resp_ioctl));
2ca5e71ca70238e Alexandre Courbot 2026-09-17  217  }
2ca5e71ca70238e Alexandre Courbot 2026-09-17  218  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  219  /**
2ca5e71ca70238e Alexandre Courbot 2026-09-17  220   * __scatterlist_builder_add_userptr() - Add user pages to @builder.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  221   * @builder: builder to use.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  222   * @userptr: pointer to userspace memory that we want to add.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  223   * @length: length of the data to add.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  224   * @sg_list: output parameter. Upon success, points to the area of the shadow
2ca5e71ca70238e Alexandre Courbot 2026-09-17  225   *           buffer containing the array of SG entries to be added to the
2ca5e71ca70238e Alexandre Courbot 2026-09-17  226   *           descriptor chain.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  227   * @nents: output parameter. Upon success, contains the number of entries
2ca5e71ca70238e Alexandre Courbot 2026-09-17  228   *         pointed to by @sg_list.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  229   *
2ca5e71ca70238e Alexandre Courbot 2026-09-17  230   * Data referenced by userspace pointers can be potentially large and very
2ca5e71ca70238e Alexandre Courbot 2026-09-17  231   * scattered, which could overwhelm the descriptor chain if added as-is. For
2ca5e71ca70238e Alexandre Courbot 2026-09-17  232   * these, we instead build an array of &struct virtio_media_sg_entry in the
2ca5e71ca70238e Alexandre Courbot 2026-09-17  233   * shadow buffer and reference it using a single descriptor.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  234   *
2ca5e71ca70238e Alexandre Courbot 2026-09-17  235   * This function is a helper to perform that. Callers should then add the
2ca5e71ca70238e Alexandre Courbot 2026-09-17  236   * descriptor to the chain properly.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  237   *
2ca5e71ca70238e Alexandre Courbot 2026-09-17  238   * Returns %-EFAULT if @userptr is not a valid user address, which is a case the
2ca5e71ca70238e Alexandre Courbot 2026-09-17  239   * driver should consider as "normal" operation. All other failures signal a
2ca5e71ca70238e Alexandre Courbot 2026-09-17  240   * problem with the driver.
2ca5e71ca70238e Alexandre Courbot 2026-09-17  241   */
2ca5e71ca70238e Alexandre Courbot 2026-09-17  242  static int
2ca5e71ca70238e Alexandre Courbot 2026-09-17  243  __scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  244  				  unsigned long userptr, unsigned long length,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  245  				  struct virtio_media_sg_entry **sg_list,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  246  				  int *nents)
2ca5e71ca70238e Alexandre Courbot 2026-09-17  247  {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  248  	struct sg_table sg_table = {};
2ca5e71ca70238e Alexandre Courbot 2026-09-17  249  	struct frame_vector *framevec;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  250  	struct scatterlist *sg_iter;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  251  	struct page **pages;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  252  	const unsigned int offset = userptr & ~PAGE_MASK;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  253  	unsigned int pages_count;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  254  	size_t entries_size;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  255  	int i;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  256  	int ret;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  257  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  258  	framevec = vb2_create_framevec(userptr, length, true);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  259  	if (IS_ERR(framevec)) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  260  		if (PTR_ERR(framevec) != -EFAULT) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  261  			pr_warn("error %ld creating frame vector for userptr 0x%lx, length 0x%lx\n",
2ca5e71ca70238e Alexandre Courbot 2026-09-17  262  				PTR_ERR(framevec), userptr, length);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  263  		} else {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  264  			/* -EINVAL is expected in case of invalid userptr. */
2ca5e71ca70238e Alexandre Courbot 2026-09-17  265  			framevec = ERR_PTR(-EINVAL);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  266  		}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  267  		return PTR_ERR(framevec);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  268  	}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  269  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  270  	pages = frame_vector_pages(framevec);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  271  	if (IS_ERR(pages)) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  272  		pr_warn("error getting vector pages\n");
2ca5e71ca70238e Alexandre Courbot 2026-09-17  273  		ret = PTR_ERR(pages);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  274  		goto done;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  275  	}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  276  	pages_count = frame_vector_count(framevec);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  277  	ret = sg_alloc_table_from_pages(&sg_table, pages, pages_count, offset,
2ca5e71ca70238e Alexandre Courbot 2026-09-17  278  					length, 0);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  279  	if (ret) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  280  		pr_warn("error creating sg table\n");
2ca5e71ca70238e Alexandre Courbot 2026-09-17  281  		goto done;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  282  	}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  283  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  284  	/* Allocate our actual SG in the shadow buffer. */
2ca5e71ca70238e Alexandre Courbot 2026-09-17  285  	*nents = sg_nents(sg_table.sgl);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  286  	entries_size = sizeof(**sg_list) * *nents;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  287  	if (builder->shadow_buffer_pos + entries_size >
2ca5e71ca70238e Alexandre Courbot 2026-09-17  288  	    builder->shadow_buffer_size) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  289  		ret = -ENOMEM;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  290  		goto free_sg;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  291  	}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  292  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  293  	*sg_list = builder->shadow_buffer + builder->shadow_buffer_pos;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  294  	builder->shadow_buffer_pos += entries_size;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  295  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  296  	for_each_sgtable_sg(&sg_table, sg_iter, i) {
2ca5e71ca70238e Alexandre Courbot 2026-09-17  297  		struct virtio_media_sg_entry *sg_entry = &(*sg_list)[i];
2ca5e71ca70238e Alexandre Courbot 2026-09-17  298  
2ca5e71ca70238e Alexandre Courbot 2026-09-17 @299  		sg_entry->start = sg_phys(sg_iter);
2ca5e71ca70238e Alexandre Courbot 2026-09-17 @300  		sg_entry->len = sg_iter->length;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  301  	}
2ca5e71ca70238e Alexandre Courbot 2026-09-17  302  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  303  free_sg:
2ca5e71ca70238e Alexandre Courbot 2026-09-17  304  	sg_free_table(&sg_table);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  305  
2ca5e71ca70238e Alexandre Courbot 2026-09-17  306  done:
2ca5e71ca70238e Alexandre Courbot 2026-09-17  307  	vb2_destroy_framevec(framevec);
2ca5e71ca70238e Alexandre Courbot 2026-09-17  308  	return ret;
2ca5e71ca70238e Alexandre Courbot 2026-09-17  309  }
2ca5e71ca70238e Alexandre Courbot 2026-09-17  310  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
