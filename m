Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949DF3B058C
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275685; cv=none; b=uV5Zu0fp9jpqUn5MhkH8P3l923cVjZbsTRvkbtBFc1xGSIK0LZez6q806mR+lyiDKdCYj0epUucKVMbVHeqUS60Vy6szCJh82wnr0HgQAA5Z3Sq0qRgZU4YQ5ticbMMjSWbIxGwOa3WRIGz0NSowW+jyDjE0pmIUfI+uTA9gUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275685; c=relaxed/simple;
	bh=vYYv7CVREKMfVRWE2Uj/K+O/+24L5b6WfzkV3rleDJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+LLF/u6PTHszPt51WstzWkv0wjf2uOyG6klLBw20Lr7C5ljLLOA63OtbWQB3W8Kkw+Ws5SkONSxWKB7PCjKmmitXsSiSJx+jwVaofcp1uzsjjWNR279txZvyn9zDqA+4hQGe55QtjvJgYOMtWw/ieM1hSeBJK0N6GrGnXps2wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaFWHCrg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaFWHCrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790275673; x=1821811673;
  h=date:from:to:cc:subject:message-id;
  bh=vYYv7CVREKMfVRWE2Uj/K+O/+24L5b6WfzkV3rleDJ4=;
  b=EaFWHCrgenRDQqQVDo+VuQ/si68YOA0cwnhYIvyGGNNtLo3riuq1S6vj
   wCCSSI2pPD8sKEieSsEOUc2tfyHkEAVaRNbVhhRdRqVQFhCANv/CNIOO2
   I5CsjY7JQxQhxu/S8irqMYcAyOSBikhubLfJ1Q3Z0jl6l9IDVNYe8xzeZ
   aqfCwVutKIwEtXtZzEmGpiyJRwmVHk9dz4EPUVw7YSsFVwJD7vp5hf0SB
   2GvuBHPG5F47V2kMBuBJZU1AM/+4G/gmsfC4rFmhpnM25rIM3ebuYc/uP
   pHR2RXA4p/+c6V4hsnHPo2P1dn9Kwh0w5j92d7yeo/78Ebv50Lq1c9Mov
   A==;
X-CSE-ConnectionGUID: crVUg2XPQCqp1BTqhaG4lA==
X-CSE-MsgGUID: h6y7mNYrT0ieLRavozxq0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="78615851"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="78615851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:47:48 -0700
X-CSE-ConnectionGUID: /CCke2y9SCq5otvisIol4Q==
X-CSE-MsgGUID: aNcdjI88Q8uSx7M4J5SA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278838502"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2026 11:47:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9oTx-00000000JQ4-2CEL;
	Thu, 24 Sep 2026 18:47:45 +0000
Date: Fri, 25 Sep 2026 02:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/virtio/virtio_media_driver.c:670:33: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609250251.WeNlJhMg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936, commit: 077c39860aaefc30dff4435618f946d6b7fa3733"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre Courbot <gnurou@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Brian Daniels <briandaniels@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936
head:   e2cb6fe169d834d225215b07eac8cf91200e372a
commit: 077c39860aaefc30dff4435618f946d6b7fa3733 media: virtio: Add ioctl operations and driver logic
date:   7 days ago
:::::: branch date: 26 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r1304-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250251.WeNlJhMg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250251.WeNlJhMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250251.WeNlJhMg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_media_driver.c:144:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:144:28: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:144:28: sparse:     got int
   drivers/media/virtio/virtio_media_driver.c:145:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] session_id @@     got unsigned int [usertype] id @@
   drivers/media/virtio/virtio_media_driver.c:145:31: sparse:     expected restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:145:31: sparse:     got unsigned int [usertype] id
   drivers/media/virtio/virtio_media_driver.c:281:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:471:60: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] session_id @@
   drivers/media/virtio/virtio_media_driver.c:471:60: sparse:     expected unsigned int [usertype] id
   drivers/media/virtio/virtio_media_driver.c:471:60: sparse:     got restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:478:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:478:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:571:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:571:27: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:571:27: sparse:     got int
   drivers/media/virtio/virtio_media_driver.c:574:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] session_id @@     got restricted __le32 [usertype] session_id @@
   drivers/media/virtio/virtio_media_driver.c:574:20: sparse:     expected unsigned int [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:574:20: sparse:     got restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:669:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:669:29: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:669:29: sparse:     got int
>> drivers/media/virtio/virtio_media_driver.c:670:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] driver_addr @@     got unsigned long long @@
   drivers/media/virtio/virtio_media_driver.c:670:33: sparse:     expected restricted __le64 [usertype] driver_addr
   drivers/media/virtio/virtio_media_driver.c:670:33: sparse:     got unsigned long long
   drivers/media/virtio/virtio_media_driver.c:728:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:728:27: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:728:27: sparse:     got int
   drivers/media/virtio/virtio_media_driver.c:729:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] session_id @@     got unsigned int [usertype] id @@
   drivers/media/virtio/virtio_media_driver.c:729:30: sparse:     expected restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:729:30: sparse:     got unsigned int [usertype] id
>> drivers/media/virtio/virtio_media_driver.c:730:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/media/virtio/virtio_media_driver.c:730:25: sparse:     expected restricted __le32 [usertype] flags
   drivers/media/virtio/virtio_media_driver.c:730:25: sparse:     got unsigned long
>> drivers/media/virtio/virtio_media_driver.c:732:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] offset @@     got unsigned long @@
   drivers/media/virtio/virtio_media_driver.c:732:26: sparse:     expected restricted __le32 [usertype] offset
   drivers/media/virtio/virtio_media_driver.c:732:26: sparse:     got unsigned long
>> drivers/media/virtio/virtio_media_driver.c:756:35: sparse: sparse: restricted __le64 degrades to integer
>> drivers/media/virtio/virtio_media_driver.c:762:43: sparse: sparse: cast to restricted __le64
   drivers/media/virtio/virtio_media_driver.c:762:43: sparse: sparse: restricted __le64 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:762:43: sparse: sparse: restricted __le64 degrades to integer
>> drivers/media/virtio/virtio_media_driver.c:762:43: sparse: sparse: cast to restricted __le64
   drivers/media/virtio/virtio_media_driver.c:762:43: sparse: sparse: restricted __le64 degrades to integer

vim +670 drivers/media/virtio/virtio_media_driver.c

077c39860aaefc3 Alexandre Courbot 2026-09-17  653  
077c39860aaefc3 Alexandre Courbot 2026-09-17  654  static void virtio_media_vma_close_locked(struct vm_area_struct *vma)
077c39860aaefc3 Alexandre Courbot 2026-09-17  655  {
077c39860aaefc3 Alexandre Courbot 2026-09-17  656  	struct virtio_media *vv = vma->vm_private_data;
077c39860aaefc3 Alexandre Courbot 2026-09-17  657  	struct virtio_media_cmd_munmap *cmd_munmap = &vv->cmd.munmap;
077c39860aaefc3 Alexandre Courbot 2026-09-17  658  	struct virtio_media_resp_munmap *resp_munmap = &vv->resp.munmap;
077c39860aaefc3 Alexandre Courbot 2026-09-17  659  	struct scatterlist cmd_sg = {}, resp_sg = {};
077c39860aaefc3 Alexandre Courbot 2026-09-17  660  	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
077c39860aaefc3 Alexandre Courbot 2026-09-17  661  	int ret;
077c39860aaefc3 Alexandre Courbot 2026-09-17  662  
077c39860aaefc3 Alexandre Courbot 2026-09-17  663  	sg_set_buf(&cmd_sg, cmd_munmap, sizeof(*cmd_munmap));
077c39860aaefc3 Alexandre Courbot 2026-09-17  664  	sg_mark_end(&cmd_sg);
077c39860aaefc3 Alexandre Courbot 2026-09-17  665  
077c39860aaefc3 Alexandre Courbot 2026-09-17  666  	sg_set_buf(&resp_sg, resp_munmap, sizeof(*resp_munmap));
077c39860aaefc3 Alexandre Courbot 2026-09-17  667  	sg_mark_end(&resp_sg);
077c39860aaefc3 Alexandre Courbot 2026-09-17  668  
077c39860aaefc3 Alexandre Courbot 2026-09-17  669  	cmd_munmap->hdr.cmd = VIRTIO_MEDIA_CMD_MUNMAP;
077c39860aaefc3 Alexandre Courbot 2026-09-17 @670  	cmd_munmap->driver_addr =
077c39860aaefc3 Alexandre Courbot 2026-09-17  671  		(vma->vm_pgoff << PAGE_SHIFT) - vv->mmap_region.addr;
077c39860aaefc3 Alexandre Courbot 2026-09-17  672  	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_munmap),
077c39860aaefc3 Alexandre Courbot 2026-09-17  673  					NULL);
077c39860aaefc3 Alexandre Courbot 2026-09-17  674  	if (ret < 0) {
077c39860aaefc3 Alexandre Courbot 2026-09-17  675  		v4l2_err(&vv->v4l2_dev, "host failed to unmap buffer: %d\n",
077c39860aaefc3 Alexandre Courbot 2026-09-17  676  			 ret);
077c39860aaefc3 Alexandre Courbot 2026-09-17  677  	}
077c39860aaefc3 Alexandre Courbot 2026-09-17  678  }
077c39860aaefc3 Alexandre Courbot 2026-09-17  679  
077c39860aaefc3 Alexandre Courbot 2026-09-17  680  /**
077c39860aaefc3 Alexandre Courbot 2026-09-17  681   * virtio_media_vma_close() - Close a MMAP buffer mapping.
077c39860aaefc3 Alexandre Courbot 2026-09-17  682   * @vma: VMA of the mapping to close.
077c39860aaefc3 Alexandre Courbot 2026-09-17  683   *
077c39860aaefc3 Alexandre Courbot 2026-09-17  684   * Inform the host that a previously created MMAP mapping is no longer needed
077c39860aaefc3 Alexandre Courbot 2026-09-17  685   * and can be removed.
077c39860aaefc3 Alexandre Courbot 2026-09-17  686   */
077c39860aaefc3 Alexandre Courbot 2026-09-17  687  static void virtio_media_vma_close(struct vm_area_struct *vma)
077c39860aaefc3 Alexandre Courbot 2026-09-17  688  {
077c39860aaefc3 Alexandre Courbot 2026-09-17  689  	struct virtio_media *vv = vma->vm_private_data;
077c39860aaefc3 Alexandre Courbot 2026-09-17  690  
077c39860aaefc3 Alexandre Courbot 2026-09-17  691  	mutex_lock(&vv->vlock);
077c39860aaefc3 Alexandre Courbot 2026-09-17  692  	virtio_media_vma_close_locked(vma);
077c39860aaefc3 Alexandre Courbot 2026-09-17  693  	mutex_unlock(&vv->vlock);
077c39860aaefc3 Alexandre Courbot 2026-09-17  694  }
077c39860aaefc3 Alexandre Courbot 2026-09-17  695  
077c39860aaefc3 Alexandre Courbot 2026-09-17  696  static const struct vm_operations_struct virtio_media_vm_ops = {
077c39860aaefc3 Alexandre Courbot 2026-09-17  697  	.close = virtio_media_vma_close,
077c39860aaefc3 Alexandre Courbot 2026-09-17  698  };
077c39860aaefc3 Alexandre Courbot 2026-09-17  699  
077c39860aaefc3 Alexandre Courbot 2026-09-17  700  /**
077c39860aaefc3 Alexandre Courbot 2026-09-17  701   * virtio_media_device_mmap() - Perform a mmap request from userspace.
077c39860aaefc3 Alexandre Courbot 2026-09-17  702   * @file: opened file of the session to map for.
077c39860aaefc3 Alexandre Courbot 2026-09-17  703   * @vma: VM area struct describing the desired mapping.
077c39860aaefc3 Alexandre Courbot 2026-09-17  704   *
077c39860aaefc3 Alexandre Courbot 2026-09-17  705   * This requests the host to map a MMAP buffer for us, so we can then make that
077c39860aaefc3 Alexandre Courbot 2026-09-17  706   * mapping visible into user-space address space.
077c39860aaefc3 Alexandre Courbot 2026-09-17  707   */
077c39860aaefc3 Alexandre Courbot 2026-09-17  708  static int virtio_media_device_mmap(struct file *file,
077c39860aaefc3 Alexandre Courbot 2026-09-17  709  				    struct vm_area_struct *vma)
077c39860aaefc3 Alexandre Courbot 2026-09-17  710  {
077c39860aaefc3 Alexandre Courbot 2026-09-17  711  	struct video_device *video_dev = video_devdata(file);
077c39860aaefc3 Alexandre Courbot 2026-09-17  712  	struct virtio_media *vv = to_virtio_media(video_dev);
077c39860aaefc3 Alexandre Courbot 2026-09-17  713  	struct virtio_media_session *session =
077c39860aaefc3 Alexandre Courbot 2026-09-17  714  		fh_to_session(file->private_data);
077c39860aaefc3 Alexandre Courbot 2026-09-17  715  	struct virtio_media_cmd_mmap *cmd_mmap = &session->cmd.mmap;
077c39860aaefc3 Alexandre Courbot 2026-09-17  716  	struct virtio_media_resp_mmap *resp_mmap = &session->resp.mmap;
077c39860aaefc3 Alexandre Courbot 2026-09-17  717  	struct scatterlist cmd_sg = {}, resp_sg = {};
077c39860aaefc3 Alexandre Courbot 2026-09-17  718  	struct scatterlist *sgs[2] = { &cmd_sg, &resp_sg };
077c39860aaefc3 Alexandre Courbot 2026-09-17  719  	int ret;
077c39860aaefc3 Alexandre Courbot 2026-09-17  720  
077c39860aaefc3 Alexandre Courbot 2026-09-17  721  	if (!(vma->vm_flags & VM_SHARED))
077c39860aaefc3 Alexandre Courbot 2026-09-17  722  		return -EINVAL;
077c39860aaefc3 Alexandre Courbot 2026-09-17  723  	if (!(vma->vm_flags & (VM_READ | VM_WRITE)))
077c39860aaefc3 Alexandre Courbot 2026-09-17  724  		return -EINVAL;
077c39860aaefc3 Alexandre Courbot 2026-09-17  725  
077c39860aaefc3 Alexandre Courbot 2026-09-17  726  	mutex_lock(&vv->vlock);
077c39860aaefc3 Alexandre Courbot 2026-09-17  727  
077c39860aaefc3 Alexandre Courbot 2026-09-17  728  	cmd_mmap->hdr.cmd = VIRTIO_MEDIA_CMD_MMAP;
077c39860aaefc3 Alexandre Courbot 2026-09-17  729  	cmd_mmap->session_id = session->id;
077c39860aaefc3 Alexandre Courbot 2026-09-17 @730  	cmd_mmap->flags =
077c39860aaefc3 Alexandre Courbot 2026-09-17  731  		(vma->vm_flags & VM_WRITE) ? VIRTIO_MEDIA_MMAP_FLAG_RW_MASK : 0;
077c39860aaefc3 Alexandre Courbot 2026-09-17 @732  	cmd_mmap->offset = vma->vm_pgoff << PAGE_SHIFT;
077c39860aaefc3 Alexandre Courbot 2026-09-17  733  
077c39860aaefc3 Alexandre Courbot 2026-09-17  734  	sg_set_buf(&cmd_sg, cmd_mmap, sizeof(*cmd_mmap));
077c39860aaefc3 Alexandre Courbot 2026-09-17  735  	sg_mark_end(&cmd_sg);
077c39860aaefc3 Alexandre Courbot 2026-09-17  736  
077c39860aaefc3 Alexandre Courbot 2026-09-17  737  	sg_set_buf(&resp_sg, resp_mmap, sizeof(*resp_mmap));
077c39860aaefc3 Alexandre Courbot 2026-09-17  738  	sg_mark_end(&resp_sg);
077c39860aaefc3 Alexandre Courbot 2026-09-17  739  
077c39860aaefc3 Alexandre Courbot 2026-09-17  740  	/*
077c39860aaefc3 Alexandre Courbot 2026-09-17  741  	 * The host performs reference counting and is smart enough to return
077c39860aaefc3 Alexandre Courbot 2026-09-17  742  	 * the same guest physical address if this is called several times on
077c39860aaefc3 Alexandre Courbot 2026-09-17  743  	 * the same
077c39860aaefc3 Alexandre Courbot 2026-09-17  744  	 * buffer.
077c39860aaefc3 Alexandre Courbot 2026-09-17  745  	 */
077c39860aaefc3 Alexandre Courbot 2026-09-17  746  	ret = virtio_media_send_command(vv, sgs, 1, 1, sizeof(*resp_mmap),
077c39860aaefc3 Alexandre Courbot 2026-09-17  747  					NULL);
077c39860aaefc3 Alexandre Courbot 2026-09-17  748  	if (ret < 0)
077c39860aaefc3 Alexandre Courbot 2026-09-17  749  		goto end;
077c39860aaefc3 Alexandre Courbot 2026-09-17  750  
077c39860aaefc3 Alexandre Courbot 2026-09-17  751  	vma->vm_private_data = vv;
077c39860aaefc3 Alexandre Courbot 2026-09-17  752  	/*
077c39860aaefc3 Alexandre Courbot 2026-09-17  753  	 * Keep the guest address at which the buffer is mapped since we will
077c39860aaefc3 Alexandre Courbot 2026-09-17  754  	 * use that to unmap.
077c39860aaefc3 Alexandre Courbot 2026-09-17  755  	 */
077c39860aaefc3 Alexandre Courbot 2026-09-17 @756  	vma->vm_pgoff = (resp_mmap->driver_addr + vv->mmap_region.addr) >>
077c39860aaefc3 Alexandre Courbot 2026-09-17  757  			PAGE_SHIFT;
077c39860aaefc3 Alexandre Courbot 2026-09-17  758  
077c39860aaefc3 Alexandre Courbot 2026-09-17  759  	/*
077c39860aaefc3 Alexandre Courbot 2026-09-17  760  	 * We cannot let the mapping be larger than the buffer.
077c39860aaefc3 Alexandre Courbot 2026-09-17  761  	 */
077c39860aaefc3 Alexandre Courbot 2026-09-17 @762  	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(resp_mmap->len)) {
077c39860aaefc3 Alexandre Courbot 2026-09-17  763  		dev_dbg(&video_dev->dev,
077c39860aaefc3 Alexandre Courbot 2026-09-17  764  			"invalid MMAP, as it would overflow buffer length\n");
077c39860aaefc3 Alexandre Courbot 2026-09-17  765  		virtio_media_vma_close_locked(vma);
077c39860aaefc3 Alexandre Courbot 2026-09-17  766  		ret = -EINVAL;
077c39860aaefc3 Alexandre Courbot 2026-09-17  767  		goto end;
077c39860aaefc3 Alexandre Courbot 2026-09-17  768  	}
077c39860aaefc3 Alexandre Courbot 2026-09-17  769  
077c39860aaefc3 Alexandre Courbot 2026-09-17  770  	ret = io_remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff,
077c39860aaefc3 Alexandre Courbot 2026-09-17  771  				 vma->vm_end - vma->vm_start,
077c39860aaefc3 Alexandre Courbot 2026-09-17  772  				 vma->vm_page_prot);
077c39860aaefc3 Alexandre Courbot 2026-09-17  773  	if (ret)
077c39860aaefc3 Alexandre Courbot 2026-09-17  774  		goto end;
077c39860aaefc3 Alexandre Courbot 2026-09-17  775  
077c39860aaefc3 Alexandre Courbot 2026-09-17  776  	vma->vm_ops = &virtio_media_vm_ops;
077c39860aaefc3 Alexandre Courbot 2026-09-17  777  
077c39860aaefc3 Alexandre Courbot 2026-09-17  778  end:
077c39860aaefc3 Alexandre Courbot 2026-09-17  779  	mutex_unlock(&vv->vlock);
077c39860aaefc3 Alexandre Courbot 2026-09-17  780  	return ret;
077c39860aaefc3 Alexandre Courbot 2026-09-17  781  }
077c39860aaefc3 Alexandre Courbot 2026-09-17  782  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
