Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5FF800
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735434512; cv=none; b=TwlVcOL5C5uQgwKp51m946m7iCaJ2kR02h7f6jUg7G9sYg5tI0YVq89qjcSF6C6vbvxyIMCLkJqAcDLUdziQR+BgEtUnomsBTVum39nej+bm539piDrqQSC37Mpp8XRTCBKsaNpO/FYIZ8Y5/72fvzYf59bt8A9JVOGBYT4Pzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735434512; c=relaxed/simple;
	bh=atp2Q4HYaCEUP9XFwUMIgoFugSDrQYyh23wCrFU3U54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzv8GMMXhAc3wwFLO6m/Ah+/++rEGdWln8XMTFYSv2ygFVB2BDqVV15DqpwIg24vahnqcOnhDdBXUdt3carGCDU2oJG2XAw4wBlS9/D6UHyWnbnSpKmtAjrVZUcpzc2m29zy7wwEfO9728s+S0i+nHJx7guAzv8L8Y/Oo0l/CZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cc9QXAY5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc9QXAY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735434510; x=1766970510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=atp2Q4HYaCEUP9XFwUMIgoFugSDrQYyh23wCrFU3U54=;
  b=cc9QXAY5iZAJ7LW+xRlQCUHFdLf+ATdSOSwKAiPUfU+lii69+E00dfgT
   zbVEAQMlIv8m98V9VVrF4mHe7JnF1pNrIRLg/oSUU+4MnsN4k/EGeczon
   RAHQSHHixpsUCEkh452prPejAoooicImsoW5b7wz9IytbmIfqUfQA1ceY
   +ytq0r62py/IFe+ZY+39GS0k0Bilo0iul+zfA4ZDizyAFq2JC0oj5+3iR
   4CfOx1cKW85YoKKdnhMegzFUH6314zLqIdMiLbHokLJyJwxKdWIWAcA9f
   34+ywSCWdc/e+/VXuqw6VQuGJ7cs7zYZFGKkDPibLG6keT5DoThVVxXRI
   A==;
X-CSE-ConnectionGUID: UYDz/VM8TNCINsidm8BGlQ==
X-CSE-MsgGUID: xVvEbepkQwyo+DYEj8JFEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39550121"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="39550121"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 17:08:29 -0800
X-CSE-ConnectionGUID: iUl+PlmTRDeXTVtYSpXmBg==
X-CSE-MsgGUID: /Wy2IghVSq2fJyD6G/0ijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100297934"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Dec 2024 17:08:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRhn7-0004PU-2N;
	Sun, 29 Dec 2024 01:08:25 +0000
Date: Sun, 29 Dec 2024 09:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error:
 uninitialized symbol 'index'.
Message-ID: <202412290916.2X6x53iM-lkp@intel.com>
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
head:   b244bda01c33df5d583f0e2e6517b2bd7f87eb0e
commit: b244bda01c33df5d583f0e2e6517b2bd7f87eb0e [2/2] media: v4l2-loopback
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: powerpc-randconfig-r071-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290916.2X6x53iM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412290916.2X6x53iM-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1892 vidioc_dqbuf() error: uninitialized symbol 'index'.
drivers/media/v4l2-core/v4l2-loopback.c:2959 v4l2loopback_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/index +1892 drivers/media/v4l2-core/v4l2-loopback.c

b244bda01c33df Jarkko Sakkinen 2024-11-22  1841  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1842  /* put buffer to dequeue
b244bda01c33df Jarkko Sakkinen 2024-11-22  1843   * called on VIDIOC_DQBUF
b244bda01c33df Jarkko Sakkinen 2024-11-22  1844   */
b244bda01c33df Jarkko Sakkinen 2024-11-22  1845  static int vidioc_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
b244bda01c33df Jarkko Sakkinen 2024-11-22  1846  {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1847  	struct v4l2_loopback_device *dev;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1848  	struct v4l2_loopback_opener *opener;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1849  	int index;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1850  	struct v4l2l_buffer *b;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1851  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1852  	dev = v4l2loopback_getdevice(file);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1853  	opener = fh_to_opener(fh);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1854  	if (opener->timeout_image_io) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1855  		*buf = dev->timeout_image_buffer.buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1856  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1857  	}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1858  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1859  	switch (buf->type) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1860  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1861  		index = get_capture_buffer(file);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1862  		if (index < 0)
b244bda01c33df Jarkko Sakkinen 2024-11-22  1863  			return index;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1864  		dprintkrw("capture DQBUF pos: %lld index: %d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1865  			  (long long)(opener->read_position - 1), index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1866  		if (!(dev->buffers[index].buffer.flags &
b244bda01c33df Jarkko Sakkinen 2024-11-22  1867  		      V4L2_BUF_FLAG_MAPPED)) {
b244bda01c33df Jarkko Sakkinen 2024-11-22  1868  			dprintk("trying to return not mapped buf[%d]\n", index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1869  			return -EINVAL;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1870  		}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1871  		unset_flags(&dev->buffers[index]);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1872  		*buf = dev->buffers[index].buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1873  		dprintkrw(
b244bda01c33df Jarkko Sakkinen 2024-11-22  1874  			"dqbuf(CAPTURE)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1875  			index, buf->index, buf, buf->type, buf->bytesused,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1876  			buf->length, buf->flags, buf->field,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1877  			(long long)buf->timestamp.tv_sec,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1878  			(long int)buf->timestamp.tv_usec, buf->sequence);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1879  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1880  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1881  		spin_lock_bh(&dev->list_lock);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1882  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1883  		b = list_entry(dev->outbufs_list.prev, struct v4l2l_buffer,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1884  			       list_head);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1885  		list_move_tail(&b->list_head, &dev->outbufs_list);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1886  
b244bda01c33df Jarkko Sakkinen 2024-11-22  1887  		spin_unlock_bh(&dev->list_lock);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1888  		dprintkrw("output DQBUF index: %d\n", b->buffer.index);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1889  		unset_flags(b);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1890  		*buf = b->buffer;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1891  		buf->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
b244bda01c33df Jarkko Sakkinen 2024-11-22 @1892  		dprintkrw(
b244bda01c33df Jarkko Sakkinen 2024-11-22  1893  			"dqbuf(OUTPUT)#%d: buffer#%d @ %p type=%d bytesused=%d length=%d flags=%x field=%d timestamp=%lld.%06ld sequence=%d\n",
b244bda01c33df Jarkko Sakkinen 2024-11-22  1894  			index, buf->index, buf, buf->type, buf->bytesused,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1895  			buf->length, buf->flags, buf->field,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1896  			(long long)buf->timestamp.tv_sec,
b244bda01c33df Jarkko Sakkinen 2024-11-22  1897  			(long int)buf->timestamp.tv_usec, buf->sequence);
b244bda01c33df Jarkko Sakkinen 2024-11-22  1898  		return 0;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1899  	default:
b244bda01c33df Jarkko Sakkinen 2024-11-22  1900  		return -EINVAL;
b244bda01c33df Jarkko Sakkinen 2024-11-22  1901  	}
b244bda01c33df Jarkko Sakkinen 2024-11-22  1902  }
b244bda01c33df Jarkko Sakkinen 2024-11-22  1903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
