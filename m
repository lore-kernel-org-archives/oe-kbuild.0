Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B594F49F107
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262843; cv=none; b=NGlZFTl3cDB74Qeu6KnJPR2FequOk4kgz9cf0EtPgUrW4+0AK/kt7o1Ffs9aSKHtOVbCQmDs86T8ouprYb7y1WXqxdxUhO/WsdaqCiCRgwULKT3OOsVdJIS75HnRzSJH/ZdoYF9jOtxavvg6UnVyhXpso1jMw9nAZXkRVuG/1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262843; c=relaxed/simple;
	bh=4lbaVqHA4+KdNHyQEll5CVU5G2FKzzpnDcBTBXoAQMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cJyzuobwKtZKPiU879OohmtmbKc7ZGxYxJEOf45zqRVhOh11zAJqPj2UaAI1NJ0rM1DWonf5GF9aRxQ3r/96ZJxkhaFQ0NSuEOmyr9CPJp9TvvIToK0GPZ65oHZGgjuMj8SWp14gZ1f+XixSG4OImeIwLQBhGmdRrVItI7x/+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMBA1Mh6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMBA1Mh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790262841; x=1821798841;
  h=date:from:to:cc:subject:message-id;
  bh=4lbaVqHA4+KdNHyQEll5CVU5G2FKzzpnDcBTBXoAQMQ=;
  b=lMBA1Mh6n4b7PIA2/Wyvrw1Rx0P5fPIWMDLlq3oKt/2+mJb9S6Si0C3f
   VYt3uCbfuDGkQy0Fc1D0M0i9wc6FDH6MkBrF6LAw66C0r9MurBw58beRG
   KUezRuLf7WZ0s7Bd9sitVWv9uHFLBQho+atQIrgMBGbJ2pivYfE1mCtNo
   yFHGZvVTIBXxagCnoQUJTVBaAMpznYfCo7TSL5KAPlZCvO+5nGIFu8vY4
   IWPl6Waaiy/OrUpEvZZ+XD5+eBxZJmH+9PoVi/nH2hnZk0DGcf1t22qKw
   cNrzJMlreCtxzb4HeqmqDw6kc8hl14Qk970mzBAEDwojxJ0D/vR5opsX+
   Q==;
X-CSE-ConnectionGUID: nlOpfoDtQsWPRMGLy2nV3Q==
X-CSE-MsgGUID: k0VbYLkZQmKPSgiTyQ+STQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90079345"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90079345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:14:00 -0700
X-CSE-ConnectionGUID: 7M7XbxZeS/WO+Lwa+g5lOw==
X-CSE-MsgGUID: ptPQZN/6QK+qZf/k0jAzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="274243927"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2026 08:13:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9l8z-00000000J1e-2kW1;
	Thu, 24 Sep 2026 15:13:53 +0000
Date: Thu, 24 Sep 2026 23:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/virtio/virtio_media_driver.c:135:28: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609242359.AZKGUgSK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936, commit: 70a69cb9bc258501e453e51b35468173aa4358b5"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexandre Courbot <gnurou@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Brian Daniels <briandaniels@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nick-Rogers/media-v4l2-ioctl-zero-the-ext-control-built-for-VIDIOC_-G-S-_CTRL/20260923-170936
head:   e2cb6fe169d834d225215b07eac8cf91200e372a
commit: 70a69cb9bc258501e453e51b35468173aa4358b5 media: virtio: Add session management
date:   7 days ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r1304-20260924 (https://download.01.org/0day-ci/archive/20260924/202609242359.AZKGUgSK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242359.AZKGUgSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609242359.AZKGUgSK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/virtio/virtio_media_driver.c:135:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:135:28: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:135:28: sparse:     got int
>> drivers/media/virtio/virtio_media_driver.c:136:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] session_id @@     got unsigned int [usertype] id @@
   drivers/media/virtio/virtio_media_driver.c:136:31: sparse:     expected restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:136:31: sparse:     got unsigned int [usertype] id
>> drivers/media/virtio/virtio_media_driver.c:272:32: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_media_driver.c:462:60: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] session_id @@
   drivers/media/virtio/virtio_media_driver.c:462:60: sparse:     expected unsigned int [usertype] id
   drivers/media/virtio/virtio_media_driver.c:462:60: sparse:     got restricted __le32 [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:469:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:469:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_media_driver.c:562:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/media/virtio/virtio_media_driver.c:562:27: sparse:     expected restricted __le32 [usertype] cmd
   drivers/media/virtio/virtio_media_driver.c:562:27: sparse:     got int
>> drivers/media/virtio/virtio_media_driver.c:565:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] session_id @@     got restricted __le32 [usertype] session_id @@
   drivers/media/virtio/virtio_media_driver.c:565:20: sparse:     expected unsigned int [usertype] session_id
   drivers/media/virtio/virtio_media_driver.c:565:20: sparse:     got restricted __le32 [usertype] session_id

vim +135 drivers/media/virtio/virtio_media_driver.c

70a69cb9bc25850 Alexandre Courbot 2026-09-17  116  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  117  /**
70a69cb9bc25850 Alexandre Courbot 2026-09-17  118   * virtio_media_session_close() - Close and free a session.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  119   * @vv: virtio-media device the session belongs to.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  120   * @session: session to close and destroy.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  121   *
70a69cb9bc25850 Alexandre Courbot 2026-09-17  122   * This sends the ``VIRTIO_MEDIA_CMD_CLOSE`` command to the device, and frees
70a69cb9bc25850 Alexandre Courbot 2026-09-17  123   * all resources used by @session.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  124   */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  125  static int virtio_media_session_close(struct virtio_media *vv,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  126  				      struct virtio_media_session *session)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  127  {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  128  	struct virtio_media_cmd_close *cmd_close = &session->cmd.close;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  129  	struct scatterlist cmd_sg = {};
70a69cb9bc25850 Alexandre Courbot 2026-09-17  130  	struct scatterlist *sgs[1] = { &cmd_sg };
70a69cb9bc25850 Alexandre Courbot 2026-09-17  131  	int ret;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  132  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  133  	mutex_lock(&vv->vlock);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  134  
70a69cb9bc25850 Alexandre Courbot 2026-09-17 @135  	cmd_close->hdr.cmd = VIRTIO_MEDIA_CMD_CLOSE;
70a69cb9bc25850 Alexandre Courbot 2026-09-17 @136  	cmd_close->session_id = session->id;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  137  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  138  	sg_set_buf(&cmd_sg, cmd_close, sizeof(*cmd_close));
70a69cb9bc25850 Alexandre Courbot 2026-09-17  139  	sg_mark_end(&cmd_sg);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  140  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  141  	ret = virtio_media_send_command(vv, sgs, 1, 0, 0, NULL);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  142  	mutex_unlock(&vv->vlock);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  143  	if (ret < 0)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  144  		return ret;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  145  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  146  	virtio_media_session_free(vv, session);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  147  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  148  	return 0;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  149  }
70a69cb9bc25850 Alexandre Courbot 2026-09-17  150  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  151  /**
70a69cb9bc25850 Alexandre Courbot 2026-09-17  152   * virtio_media_find_session() - Look up a session with a given ID.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  153   * @vv: virtio-media device to lookup the session from.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  154   * @id: ID of the session to lookup.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  155   */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  156  static struct virtio_media_session *
70a69cb9bc25850 Alexandre Courbot 2026-09-17  157  virtio_media_find_session(struct virtio_media *vv, u32 id)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  158  {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  159  	struct list_head *p;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  160  	struct virtio_media_session *session = NULL;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  161  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  162  	mutex_lock(&vv->sessions_lock);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  163  	list_for_each(p, &vv->sessions) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  164  		struct virtio_media_session *s =
70a69cb9bc25850 Alexandre Courbot 2026-09-17  165  			list_entry(p, struct virtio_media_session, list);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  166  		if (s->id == id) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  167  			session = s;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  168  			break;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  169  		}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  170  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  171  	mutex_unlock(&vv->sessions_lock);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  172  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  173  	return session;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  174  }
70a69cb9bc25850 Alexandre Courbot 2026-09-17  175  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  176  /**
70a69cb9bc25850 Alexandre Courbot 2026-09-17  177   * struct virtio_media_cmd_callback_param - Callback parameters to the virtio
70a69cb9bc25850 Alexandre Courbot 2026-09-17  178   *                                          command queue.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  179   * @vv: virtio-media device in use.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  180   * @done: flag to be switched once the command is completed.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  181   * @resp_len: length of the received response from the command. Only valid
70a69cb9bc25850 Alexandre Courbot 2026-09-17  182   *            after @done flag has switched to %true.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  183   */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  184  struct virtio_media_cmd_callback_param {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  185  	struct virtio_media *vv;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  186  	bool done;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  187  	size_t resp_len;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  188  };
70a69cb9bc25850 Alexandre Courbot 2026-09-17  189  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  190  /**
70a69cb9bc25850 Alexandre Courbot 2026-09-17  191   * commandq_callback() - Callback for the command queue.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  192   * @queue: command virtqueue.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  193   *
70a69cb9bc25850 Alexandre Courbot 2026-09-17  194   * This just wakes up the thread that was waiting on the command to complete.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  195   */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  196  static void commandq_callback(struct virtqueue *queue)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  197  {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  198  	unsigned int len;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  199  	struct virtio_media_cmd_callback_param *param;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  200  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  201  process_bufs:
70a69cb9bc25850 Alexandre Courbot 2026-09-17  202  	while ((param = virtqueue_get_buf(queue, &len))) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  203  		param->done = true;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  204  		param->resp_len = len;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  205  		wake_up(&param->vv->wq);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  206  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  207  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  208  	if (!virtqueue_enable_cb(queue)) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  209  		virtqueue_disable_cb(queue);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  210  		goto process_bufs;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  211  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  212  }
70a69cb9bc25850 Alexandre Courbot 2026-09-17  213  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  214  /**
70a69cb9bc25850 Alexandre Courbot 2026-09-17  215   * virtio_media_kick_command() - send a command to the commandq.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  216   * @vv: virtio-media device in use.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  217   * @sgs: descriptor chain to send.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  218   * @out_sgs: number of device-readable descriptors in @sgs.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  219   * @in_sgs: number of device-writable descriptors in @sgs.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  220   * @resp_len: output parameter. Upon success, contains the size of the response
70a69cb9bc25850 Alexandre Courbot 2026-09-17  221   *            in bytes.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  222   */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  223  static int virtio_media_kick_command(struct virtio_media *vv,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  224  				     struct scatterlist **sgs,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  225  				     const size_t out_sgs, const size_t in_sgs,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  226  				     size_t *resp_len)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  227  {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  228  	struct virtio_media_cmd_callback_param cb_param = {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  229  		.vv = vv,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  230  		.done = false,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  231  		.resp_len = 0,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  232  	};
70a69cb9bc25850 Alexandre Courbot 2026-09-17  233  	struct virtio_media_resp_header *resp_header;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  234  	int ret = virtqueue_add_sgs(vv->commandq, sgs, out_sgs, in_sgs,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  235  		  &cb_param, GFP_ATOMIC);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  236  	if (ret) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  237  		v4l2_err(&vv->v4l2_dev,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  238  			 "failed to add sgs to command virtqueue\n");
70a69cb9bc25850 Alexandre Courbot 2026-09-17  239  		return ret;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  240  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  241  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  242  	if (!virtqueue_kick(vv->commandq)) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  243  		v4l2_err(&vv->v4l2_dev, "failed to kick command virtqueue\n");
70a69cb9bc25850 Alexandre Courbot 2026-09-17  244  		return -EINVAL;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  245  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  246  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  247  	/* Wait for the response. */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  248  	ret = wait_event_timeout(vv->wq, cb_param.done, 5 * HZ);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  249  	if (ret == 0) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  250  		v4l2_err(&vv->v4l2_dev,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  251  			 "timed out waiting for response to command\n");
70a69cb9bc25850 Alexandre Courbot 2026-09-17  252  		return -ETIMEDOUT;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  253  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  254  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  255  	if (resp_len)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  256  		*resp_len = cb_param.resp_len;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  257  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  258  	if (in_sgs > 0) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  259  		/*
70a69cb9bc25850 Alexandre Courbot 2026-09-17  260  		 * If we expect a response, make sure we have at least a
70a69cb9bc25850 Alexandre Courbot 2026-09-17  261  		 * response header - anything shorter is invalid.
70a69cb9bc25850 Alexandre Courbot 2026-09-17  262  		 */
70a69cb9bc25850 Alexandre Courbot 2026-09-17  263  		if (cb_param.resp_len < sizeof(*resp_header)) {
70a69cb9bc25850 Alexandre Courbot 2026-09-17  264  			v4l2_err(&vv->v4l2_dev,
70a69cb9bc25850 Alexandre Courbot 2026-09-17  265  				 "received response header is too short\n");
70a69cb9bc25850 Alexandre Courbot 2026-09-17  266  			return -EINVAL;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  267  		}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  268  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  269  		resp_header = sg_virt(sgs[out_sgs]);
70a69cb9bc25850 Alexandre Courbot 2026-09-17  270  		if (resp_header->status)
70a69cb9bc25850 Alexandre Courbot 2026-09-17  271  			/* Host returns a positive error code. */
70a69cb9bc25850 Alexandre Courbot 2026-09-17 @272  			return -resp_header->status;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  273  	}
70a69cb9bc25850 Alexandre Courbot 2026-09-17  274  
70a69cb9bc25850 Alexandre Courbot 2026-09-17  275  	return 0;
70a69cb9bc25850 Alexandre Courbot 2026-09-17  276  }
70a69cb9bc25850 Alexandre Courbot 2026-09-17  277  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
