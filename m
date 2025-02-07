Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C52417E0
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895933; cv=none; b=k4bK2tpyGEF+c3nb3jmd7Q8lM87eLzUaXTTrAU11gdXvV7pAnJi6XOwQRKKauI1ZRwql9tmgebxWLLPdNIi1AKsd1wwLlbRViPnKKCyUjnXnFaGy2c6W8O7GrQ8jkzB1JOkmJRZ9Beoxeb+egIonoFEJBhtaOhltxK9B1Y8bVO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895933; c=relaxed/simple;
	bh=4PY0olLuDouk+W79SlRHsJbFvUowgsC8EHqSfPe19rY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn4re0mptC1BdI0wJPUvLU1HUu3tET11BfYuCGmeS8Ujt8TH4VimQVuKvsPZen/Q7hTMD/Sh2yiPsnghOVhPGfTMP4tkVWPxCsCbag3oMrKNr4UuGZ+K3XBq5fMFIBHke5L6CTwpBzqh9liOcZPJCjZnYkKdLwJBBZSScegw6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sibl6jaf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sibl6jaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738895931; x=1770431931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PY0olLuDouk+W79SlRHsJbFvUowgsC8EHqSfPe19rY=;
  b=Sibl6jaf5o8B/3anUydLi5sXn24zP8cOuyjj3fNvZzXhSkVfm9xY32qc
   FblXDfntrPaUaeyANJgaPkyZ1zBdLuecOXA5C889U5EX8RNbseVWtn2iI
   FyRq+Q8sjBh6LsJdu7qa5jOd9C3Ue1ras9HwZ4ydTuZatq/q7W4ww7+6I
   uDGwAKs73hrazpoGdUaBqE+q2ZeSX3Lhpe4ikVz7EW5rietbSgb9Xp6W3
   f7q+A2R8JamhNRdiA+3beHtTUYMuUaN8DYmzdHrj27zSbpj1AHdsyaFtc
   4MIse9T9BRE4cI5u8XH5zQ2ItZ4yg8WGtniuMnQjrnt9aH3vmTwSUmqSp
   A==;
X-CSE-ConnectionGUID: 50gP8li0SzC3E2K18mRqhQ==
X-CSE-MsgGUID: 0lREZ4u0TOe9ZRGifUnwAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39224807"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39224807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 18:38:50 -0800
X-CSE-ConnectionGUID: zIgNHLRLS/+aj75qehH/dA==
X-CSE-MsgGUID: mdA9Ey7xRTq8g1YMjkCoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116332098"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2025 18:38:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgEGV-000xfj-0Y;
	Fri, 07 Feb 2025 02:38:47 +0000
Date: Fri, 7 Feb 2025 10:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 36/36]
 net/vmw_vsock/virtio_transport.c:228:2: warning: releasing mutex
 'vsock->tx_lock' that was not held
Message-ID: <202502071035.uOQ6feeD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   ce14c650535d31959070629f347cb214f6e51d3d
commit: ce14c650535d31959070629f347cb214f6e51d3d [36/36] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: hexagon-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071035.uOQ6feeD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071035.uOQ6feeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502071035.uOQ6feeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/virtio_transport.c:228:2: warning: releasing mutex 'vsock->tx_lock' that was not held [-Wthread-safety-analysis]
     228 |         mutex_unlock(&vsock->tx_lock);
         |         ^
   1 warning generated.


vim +228 net/vmw_vsock/virtio_transport.c

0ea9e1d3a9e3ef Asias He           2016-07-28  210  
efcd71af38be40 Luigi Leonardi     2024-07-30  211  /* Caller need to hold RCU for vsock.
efcd71af38be40 Luigi Leonardi     2024-07-30  212   * Returns 0 if the packet is successfully put on the vq.
efcd71af38be40 Luigi Leonardi     2024-07-30  213   */
efcd71af38be40 Luigi Leonardi     2024-07-30  214  static int virtio_transport_send_skb_fast_path(struct virtio_vsock *vsock, struct sk_buff *skb)
efcd71af38be40 Luigi Leonardi     2024-07-30  215  {
efcd71af38be40 Luigi Leonardi     2024-07-30  216  	struct virtqueue *vq = vsock->vqs[VSOCK_VQ_TX];
efcd71af38be40 Luigi Leonardi     2024-07-30  217  	int ret;
efcd71af38be40 Luigi Leonardi     2024-07-30  218  
efcd71af38be40 Luigi Leonardi     2024-07-30  219  	/* Inside RCU, can't sleep! */
efcd71af38be40 Luigi Leonardi     2024-07-30  220  	ret = mutex_trylock(&vsock->tx_lock);
efcd71af38be40 Luigi Leonardi     2024-07-30  221  	if (unlikely(ret == 0))
efcd71af38be40 Luigi Leonardi     2024-07-30  222  		return -EBUSY;
efcd71af38be40 Luigi Leonardi     2024-07-30  223  
a194c985973276 Michael S. Tsirkin 2024-10-02  224  	ret = virtio_transport_send_skb(skb, vq, vsock, GFP_ATOMIC);
efcd71af38be40 Luigi Leonardi     2024-07-30  225  	if (ret == 0)
efcd71af38be40 Luigi Leonardi     2024-07-30  226  		virtqueue_kick(vq);
efcd71af38be40 Luigi Leonardi     2024-07-30  227  
efcd71af38be40 Luigi Leonardi     2024-07-30 @228  	mutex_unlock(&vsock->tx_lock);
efcd71af38be40 Luigi Leonardi     2024-07-30  229  
efcd71af38be40 Luigi Leonardi     2024-07-30  230  	return ret;
efcd71af38be40 Luigi Leonardi     2024-07-30  231  }
efcd71af38be40 Luigi Leonardi     2024-07-30  232  

:::::: The code at line 228 was first introduced by commit
:::::: efcd71af38be403fa52223092f79ada446e121ba vsock/virtio: avoid queuing packets when intermediate queue is empty

:::::: TO: Luigi Leonardi <luigi.leonardi@outlook.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
