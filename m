Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187501AF0CB
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 18:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560473; cv=none; b=id/8VKsL8jjH8jvS1cVPodeWH3/44TdKKE06z94JCdw+lVJo2PjlqFJocUGDr3nvPInlWwhXjFIHwTkzd8ZZeBIHWz9H3eBDuOeZiLRA5YZ3RS92VV9bsIlT0sjYTskcyfTsgw5NvcCbQ+yd47k48wU1CpWnU8bCsHNmRHn2+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560473; c=relaxed/simple;
	bh=59IkH7PvaBJOouERCJOgZg0y72+DO4hUywPzOTprdZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdxVPCykI+RYNXXRmBa2oao1FD7Fks/U8Yy0uYlSMJKZXngm7N2xcj6l5SHsFvDDUwU7j5nLPhgeOt7cBOyCJG99WHhP8gDZJgwNqAKB06rs/a9O3Kn4b2f/+QPXVxXHyZEbLA7US28hrqUB9ocNiBXFesFFSDByw1Dzg2vNu1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmeDdAHw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmeDdAHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732560471; x=1764096471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59IkH7PvaBJOouERCJOgZg0y72+DO4hUywPzOTprdZQ=;
  b=bmeDdAHwHHuYAivckW3J1splwkDiLEWUWFdJ6uxM2GKG714FHsosF7h9
   5KgU6nCKn8u9m1k7Lb5P5nSXIYwUIBHuaqOhEQscpRe5U7ijOcrlQ7ftV
   8tfS8k8xg5IR/BYH/uquxzrq3aNA3MGeX3xTPG/O6/H8Q9FhZEMhAOqrL
   aSMR+mp4VfgtvTyLzb9U7FWoKl4AetpLPDinyV2FyByvwfcPL+uuVvi5K
   btg8b9P/JPnPhvPi8rlPUddTqONkAbpy1wH0n9VUS5VHIvyx20SYBMF2a
   M/lWPRakimQ2+fdnrhVK6lGf8DMDvH36c4pL+xn1j4ZCqGJvP4dyWuXsT
   w==;
X-CSE-ConnectionGUID: 6+4FfJSCTmitG4z7vycaRw==
X-CSE-MsgGUID: Zf5DBKiESn+HKJFPhen0rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32629718"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32629718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:47:50 -0800
X-CSE-ConnectionGUID: ZhO3kSLOSHiotuVCkC5raQ==
X-CSE-MsgGUID: 5VvglyQKQF6MHy41yBYnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="96137190"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2024 10:47:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFe7f-0006hJ-0W;
	Mon, 25 Nov 2024 18:47:47 +0000
Date: Tue, 26 Nov 2024 02:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:v4l2-loopback 6/7]
 drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error:
 uninitialized symbol 'index'.
Message-ID: <202411260207.Y7cyTmeG-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   3a755621b768ff98489ccb7cf9905866d724872b
commit: 4a6abc37d28f3a63e4f54d12b97c075744285f8d [6/7] media: v4l2-loopback
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260207.Y7cyTmeG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411260207.Y7cyTmeG-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error: uninitialized symbol 'index'.
drivers/media/v4l2-core/v4l2-loopback.c:2959 v4l2loopback_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/index +1892 drivers/media/v4l2-core/v4l2-loopback.c

4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1841  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1842  /* put buffer to dequeue
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1843   * called on VIDIOC_DQBUF
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1844   */
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1845  static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1846  {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1847  	struct v4l2_loopback_device *dev;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1848  	struct v4l2_loopback_opener *opener;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1849  	int index;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1850  	struct v4l2l_buffer *b;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1851  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1852  	dev = v4l2loopback_getdevice(file);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1853  	opener = fh_to_opener(fh);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1854  	if (opener->timeout_image_io) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1855  		*buf = dev->timeout_image_buffer.buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1856  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1857  	}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1858  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1859  	switch (buf->type) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1860  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1861  		index = get_capture_buffer(file);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1862  		if (index < 0)
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1863  			return index;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1864  		dprintkrw("capture DQBUF pos: %lld index: %d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1865  			  (long long)(opener->read_position - 1), index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1866  		if (!(dev->buffers[index].buffer.flags &
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1867  		      V4L2_BUF_FLAG_MAPPED)) {
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1868  			dprintk("trying to return not mapped buf[%d]\n", index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1869  			return -EINVAL;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1870  		}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1871  		unset_flags(&dev->buffers[index]);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1872  		*buf = dev->buffers[index].buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1873  		dprintkrw(
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1874  			"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1875  			index, buf->index, buf, buf->type, buf->bytesused,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1876  			buf->length, buf->flags, buf->field,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1877  			(long long)buf->timestamp.tv_sec,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1878  			(long int)buf->timestamp.tv_usec, buf->sequence);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1879  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1880  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1881  		spin_lock_bh(&dev->list_lock);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1882  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1883  		b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1884  			       list_head);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1885  		list_move_tail(&b->list_head, &dev->outbufs_list);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1886  
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1887  		spin_unlock_bh(&dev->list_lock);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1888  		dprintkrw("output DQBUF index: %d\n", b->buffer.index);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1889  		unset_flags(b);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1890  		*buf = b->buffer;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1891  		buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22 @1892  		dprintkrw(
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1893  			"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1894  			index, buf->index, buf, buf->type, buf->bytesused,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1895  			buf->length, buf->flags, buf->field,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1896  			(long long)buf->timestamp.tv_sec,
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1897  			(long int)buf->timestamp.tv_usec, buf->sequence);
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1898  		return 0;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1899  	default:
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1900  		return -EINVAL;
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1901  	}
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1902  }
4a6abc37d28f3a Jarkko Sakkinen 2024-11-22  1903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
