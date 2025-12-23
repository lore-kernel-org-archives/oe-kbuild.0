Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39533A00F
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508930; cv=none; b=DUFI+MomazbYgpBp6DrnfYl55ehzHu7PaV8F4jG2Ap08K11Fz+1sRGxXvCcwUS8rww8tBNyOt5nX1um7CTRWy9Oh00tVxo9nknRHkX1SgdPZdJzZU61jwa3ifyFU+y7611pEkOxJc9QGorM4SiZ+kJ4LAASg6pdFAksJFY0iSjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508930; c=relaxed/simple;
	bh=YCy94bGhAiZJkSa4UJHBDJWEi0HS0EgCzdWTIoBsq7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oSYCuhUjtywjQ+1jSp+QTk3BCcRsBZYatthtp460T0zQJ1LA+K2KMmmhlMtvU/UJUsYBayxvYaLwBo3mL0xw/h6sw1d9+9k9kPnaFjWtpTIFI4+4Z6e2om8wiGXWzJiQ9/mq2HzXD+IZ4DrCZjNLffZr8jACZfsc4ya+TsYZais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7Bm2OrA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7Bm2OrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766508928; x=1798044928;
  h=date:from:to:cc:subject:message-id;
  bh=YCy94bGhAiZJkSa4UJHBDJWEi0HS0EgCzdWTIoBsq7A=;
  b=i7Bm2OrA9+vHN20SDz2D6+MkWfGfPKXE+eNOf2Dbjad5dwz1KZqwqQ/e
   1g7VzCYjLgyG4/ASxT2fqzjHVQwthBtCnyvEntkhkaqjvgls++xc8IVe8
   vkcz1N6XC6kDcxiBVdTF6zc64TkrdwsZcpoz8DGXOeqw4Q77/Iy7Bxl6h
   40O93Q2Dx66nmqPdGHfpcIZHz9QVfci6cEP9yNNyNiHCFkyW+3jZ4H7Pf
   YvGzMlzKWQFZryyE7R/Im1UCEYHEGNOLIe9Mhf4LVWV6ZmCglDQGAcxGS
   SpNJfq85XAwC5bFTHDr+CIp9ktUniVv0o3ugq1luiPJipri/p7Jl3yXXk
   w==;
X-CSE-ConnectionGUID: ogZHYtB9T9+pWc5I0OdTWg==
X-CSE-MsgGUID: KabhGBJkTISSzFKivpqS9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68513701"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68513701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:55:26 -0800
X-CSE-ConnectionGUID: 64Y+07CQR/quVOpuEaDV0A==
X-CSE-MsgGUID: OeAe6osbQNex8rrIoBhH5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230482202"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 08:55:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY5fP-000000002Bh-05As;
	Tue, 23 Dec 2025 16:55:23 +0000
Date: Wed, 24 Dec 2025 00:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:214
 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202512240028.EKDG3Wu6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
CC: Tyrel Datwyler <tyreld@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86 powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
config: powerpc64-randconfig-r071-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240028.EKDG3Wu6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512240028.EKDG3Wu6-lkp@intel.com/

smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:214 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes remaining?
arch/powerpc/platforms/pseries/papr-hvpipe.c:360 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes remaining?

vim +214 arch/powerpc/platforms/pseries/papr-hvpipe.c

814ef095f12c9f Haren Myneni 2025-09-09  166  
cebdb522fd3edd Haren Myneni 2025-09-09  167  /*
cebdb522fd3edd Haren Myneni 2025-09-09  168   * This work function collects receive buffer with recv HVPIPE
cebdb522fd3edd Haren Myneni 2025-09-09  169   * RTAS call. Called from read()
cebdb522fd3edd Haren Myneni 2025-09-09  170   * @buf: User specified buffer to copy the payload that returned
cebdb522fd3edd Haren Myneni 2025-09-09  171   *       from recv HVPIPE RTAS.
cebdb522fd3edd Haren Myneni 2025-09-09  172   * @size: Size of buffer user passed.
cebdb522fd3edd Haren Myneni 2025-09-09  173   */
cebdb522fd3edd Haren Myneni 2025-09-09  174  static int hvpipe_rtas_recv_msg(char __user *buf, int size)
cebdb522fd3edd Haren Myneni 2025-09-09  175  {
cebdb522fd3edd Haren Myneni 2025-09-09  176  	struct rtas_work_area *work_area;
cebdb522fd3edd Haren Myneni 2025-09-09  177  	u32 srcID, bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  178  	int ret;
cebdb522fd3edd Haren Myneni 2025-09-09  179  
cebdb522fd3edd Haren Myneni 2025-09-09  180  	work_area = rtas_work_area_alloc(SZ_4K);
cebdb522fd3edd Haren Myneni 2025-09-09  181  	if (!work_area) {
cebdb522fd3edd Haren Myneni 2025-09-09  182  		pr_err("Could not allocate RTAS buffer for recv pipe\n");
cebdb522fd3edd Haren Myneni 2025-09-09  183  		return -ENOMEM;
cebdb522fd3edd Haren Myneni 2025-09-09  184  	}
cebdb522fd3edd Haren Myneni 2025-09-09  185  
cebdb522fd3edd Haren Myneni 2025-09-09  186  	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
cebdb522fd3edd Haren Myneni 2025-09-09  187  					&bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  188  	if (!ret) {
cebdb522fd3edd Haren Myneni 2025-09-09  189  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  190  		 * Recv HVPIPE RTAS is successful.
cebdb522fd3edd Haren Myneni 2025-09-09  191  		 * When releasing FD or no one is waiting on the
cebdb522fd3edd Haren Myneni 2025-09-09  192  		 * specific source, issue recv HVPIPE RTAS call
cebdb522fd3edd Haren Myneni 2025-09-09  193  		 * so that pipe is not blocked - this func is called
cebdb522fd3edd Haren Myneni 2025-09-09  194  		 * with NULL buf.
cebdb522fd3edd Haren Myneni 2025-09-09  195  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  196  		if (buf) {
cebdb522fd3edd Haren Myneni 2025-09-09  197  			if (size < bytes_written) {
cebdb522fd3edd Haren Myneni 2025-09-09  198  				pr_err("Received the payload size = %d, but the buffer size = %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  199  					bytes_written, size);
cebdb522fd3edd Haren Myneni 2025-09-09  200  				bytes_written = size;
cebdb522fd3edd Haren Myneni 2025-09-09  201  			}
cebdb522fd3edd Haren Myneni 2025-09-09  202  			ret = copy_to_user(buf,
cebdb522fd3edd Haren Myneni 2025-09-09  203  					rtas_work_area_raw_buf(work_area),
cebdb522fd3edd Haren Myneni 2025-09-09  204  					bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  205  			if (!ret)
cebdb522fd3edd Haren Myneni 2025-09-09  206  				ret = bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  207  		}
cebdb522fd3edd Haren Myneni 2025-09-09  208  	} else {
cebdb522fd3edd Haren Myneni 2025-09-09  209  		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  210  				ret);
cebdb522fd3edd Haren Myneni 2025-09-09  211  	}
cebdb522fd3edd Haren Myneni 2025-09-09  212  
cebdb522fd3edd Haren Myneni 2025-09-09  213  	rtas_work_area_free(work_area);
cebdb522fd3edd Haren Myneni 2025-09-09 @214  	return ret;
cebdb522fd3edd Haren Myneni 2025-09-09  215  }
cebdb522fd3edd Haren Myneni 2025-09-09  216  
814ef095f12c9f Haren Myneni 2025-09-09  217  /*
814ef095f12c9f Haren Myneni 2025-09-09  218   * papr_hvpipe_handle_write -  Issue send HVPIPE RTAS and return
cebdb522fd3edd Haren Myneni 2025-09-09  219   * the size (payload + HVPIPE_HDR_LEN) for RTAS success.
cebdb522fd3edd Haren Myneni 2025-09-09  220   * Otherwise returns the status of RTAS to the user space
814ef095f12c9f Haren Myneni 2025-09-09  221   */
814ef095f12c9f Haren Myneni 2025-09-09  222  static ssize_t papr_hvpipe_handle_write(struct file *file,
814ef095f12c9f Haren Myneni 2025-09-09  223  	const char __user *buf, size_t size, loff_t *off)
814ef095f12c9f Haren Myneni 2025-09-09  224  {
814ef095f12c9f Haren Myneni 2025-09-09  225  	struct hvpipe_source_info *src_info = file->private_data;
56dbc6678bbb9c Haren Myneni 2025-09-09  226  	struct rtas_work_area *work_area, *work_buf;
56dbc6678bbb9c Haren Myneni 2025-09-09  227  	unsigned long ret, len;
56dbc6678bbb9c Haren Myneni 2025-09-09  228  	__be64 *area_be;
814ef095f12c9f Haren Myneni 2025-09-09  229  
814ef095f12c9f Haren Myneni 2025-09-09  230  	if (!src_info)
814ef095f12c9f Haren Myneni 2025-09-09  231  		return -EIO;
814ef095f12c9f Haren Myneni 2025-09-09  232  
56dbc6678bbb9c Haren Myneni 2025-09-09  233  	/*
56dbc6678bbb9c Haren Myneni 2025-09-09  234  	 * Send HVPIPE RTAS is used to send payload to the specific
56dbc6678bbb9c Haren Myneni 2025-09-09  235  	 * source with the input parameters source ID and the payload
56dbc6678bbb9c Haren Myneni 2025-09-09  236  	 * as buffer list. Each entry in the buffer list contains
56dbc6678bbb9c Haren Myneni 2025-09-09  237  	 * address/length pair of the buffer.
56dbc6678bbb9c Haren Myneni 2025-09-09  238  	 *
56dbc6678bbb9c Haren Myneni 2025-09-09  239  	 * The buffer list format is as follows:
56dbc6678bbb9c Haren Myneni 2025-09-09  240  	 *
56dbc6678bbb9c Haren Myneni 2025-09-09  241  	 * Header (length of address/length pairs and the header length)
56dbc6678bbb9c Haren Myneni 2025-09-09  242  	 * Address of 4K buffer 1
56dbc6678bbb9c Haren Myneni 2025-09-09  243  	 * Length of 4K buffer 1 used
56dbc6678bbb9c Haren Myneni 2025-09-09  244  	 * ...
56dbc6678bbb9c Haren Myneni 2025-09-09  245  	 * Address of 4K buffer n
56dbc6678bbb9c Haren Myneni 2025-09-09  246  	 * Length of 4K buffer n used
56dbc6678bbb9c Haren Myneni 2025-09-09  247  	 *
56dbc6678bbb9c Haren Myneni 2025-09-09  248  	 * See PAPR 7.3.32.2 ibm,send-hvpipe-msg
56dbc6678bbb9c Haren Myneni 2025-09-09  249  	 *
56dbc6678bbb9c Haren Myneni 2025-09-09  250  	 * Even though can support max 1MB payload, the hypervisor
56dbc6678bbb9c Haren Myneni 2025-09-09  251  	 * supports only 4048 bytes payload at present and also
56dbc6678bbb9c Haren Myneni 2025-09-09  252  	 * just one address/length entry.
56dbc6678bbb9c Haren Myneni 2025-09-09  253  	 *
56dbc6678bbb9c Haren Myneni 2025-09-09  254  	 * writev() interface can be added in future when the
56dbc6678bbb9c Haren Myneni 2025-09-09  255  	 * hypervisor supports multiple buffer list entries.
56dbc6678bbb9c Haren Myneni 2025-09-09  256  	 */
56dbc6678bbb9c Haren Myneni 2025-09-09  257  	/* HVPIPE_MAX_WRITE_BUFFER_SIZE = 4048 bytes */
56dbc6678bbb9c Haren Myneni 2025-09-09  258  	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
56dbc6678bbb9c Haren Myneni 2025-09-09  259  		(size <= HVPIPE_HDR_LEN))
56dbc6678bbb9c Haren Myneni 2025-09-09  260  		return -EINVAL;
56dbc6678bbb9c Haren Myneni 2025-09-09  261  
56dbc6678bbb9c Haren Myneni 2025-09-09  262  	/*
56dbc6678bbb9c Haren Myneni 2025-09-09  263  	 * The length of (address + length) pair + the length of header
56dbc6678bbb9c Haren Myneni 2025-09-09  264  	 */
56dbc6678bbb9c Haren Myneni 2025-09-09  265  	len = (2 * sizeof(u64)) + sizeof(u64);
56dbc6678bbb9c Haren Myneni 2025-09-09  266  	size -= HVPIPE_HDR_LEN;
56dbc6678bbb9c Haren Myneni 2025-09-09  267  	buf += HVPIPE_HDR_LEN;
56dbc6678bbb9c Haren Myneni 2025-09-09  268  	mutex_lock(&rtas_ibm_send_hvpipe_msg_lock);
56dbc6678bbb9c Haren Myneni 2025-09-09  269  	work_area = rtas_work_area_alloc(SZ_4K);
56dbc6678bbb9c Haren Myneni 2025-09-09  270  	if (!work_area) {
56dbc6678bbb9c Haren Myneni 2025-09-09  271  		ret = -ENOMEM;
56dbc6678bbb9c Haren Myneni 2025-09-09  272  		goto out;
56dbc6678bbb9c Haren Myneni 2025-09-09  273  	}
56dbc6678bbb9c Haren Myneni 2025-09-09  274  	area_be = (__be64 *)rtas_work_area_raw_buf(work_area);
56dbc6678bbb9c Haren Myneni 2025-09-09  275  	/* header */
56dbc6678bbb9c Haren Myneni 2025-09-09  276  	area_be[0] = cpu_to_be64(len);
56dbc6678bbb9c Haren Myneni 2025-09-09  277  
56dbc6678bbb9c Haren Myneni 2025-09-09  278  	work_buf = rtas_work_area_alloc(SZ_4K);
56dbc6678bbb9c Haren Myneni 2025-09-09  279  	if (!work_buf) {
56dbc6678bbb9c Haren Myneni 2025-09-09  280  		ret = -ENOMEM;
56dbc6678bbb9c Haren Myneni 2025-09-09  281  		goto out_work;
56dbc6678bbb9c Haren Myneni 2025-09-09  282  	}
56dbc6678bbb9c Haren Myneni 2025-09-09  283  	/* First buffer address */
56dbc6678bbb9c Haren Myneni 2025-09-09  284  	area_be[1] = cpu_to_be64(rtas_work_area_phys(work_buf));
56dbc6678bbb9c Haren Myneni 2025-09-09  285  	/* First buffer address length */
56dbc6678bbb9c Haren Myneni 2025-09-09  286  	area_be[2] = cpu_to_be64(size);
56dbc6678bbb9c Haren Myneni 2025-09-09  287  
56dbc6678bbb9c Haren Myneni 2025-09-09  288  	if (!copy_from_user(rtas_work_area_raw_buf(work_buf), buf, size)) {
56dbc6678bbb9c Haren Myneni 2025-09-09  289  		ret = rtas_ibm_send_hvpipe_msg(work_area, src_info->srcID);
56dbc6678bbb9c Haren Myneni 2025-09-09  290  		if (!ret)
56dbc6678bbb9c Haren Myneni 2025-09-09  291  			ret = size + HVPIPE_HDR_LEN;
56dbc6678bbb9c Haren Myneni 2025-09-09  292  	} else
56dbc6678bbb9c Haren Myneni 2025-09-09  293  		ret = -EPERM;
56dbc6678bbb9c Haren Myneni 2025-09-09  294  
56dbc6678bbb9c Haren Myneni 2025-09-09  295  	rtas_work_area_free(work_buf);
56dbc6678bbb9c Haren Myneni 2025-09-09  296  out_work:
56dbc6678bbb9c Haren Myneni 2025-09-09  297  	rtas_work_area_free(work_area);
56dbc6678bbb9c Haren Myneni 2025-09-09  298  out:
56dbc6678bbb9c Haren Myneni 2025-09-09  299  	mutex_unlock(&rtas_ibm_send_hvpipe_msg_lock);
56dbc6678bbb9c Haren Myneni 2025-09-09  300  	return ret;
814ef095f12c9f Haren Myneni 2025-09-09  301  }
814ef095f12c9f Haren Myneni 2025-09-09  302  
814ef095f12c9f Haren Myneni 2025-09-09  303  /*
814ef095f12c9f Haren Myneni 2025-09-09  304   * papr_hvpipe_handle_read - If the payload for the specific
814ef095f12c9f Haren Myneni 2025-09-09  305   * source is pending in the hypervisor, issue recv HVPIPE RTAS
814ef095f12c9f Haren Myneni 2025-09-09  306   * and return the payload to the user space.
814ef095f12c9f Haren Myneni 2025-09-09  307   *
814ef095f12c9f Haren Myneni 2025-09-09  308   * When the payload is available for the partition, the
814ef095f12c9f Haren Myneni 2025-09-09  309   * hypervisor notifies HVPIPE event with the source ID
814ef095f12c9f Haren Myneni 2025-09-09  310   * and the event handler wakeup FD(s) that are waiting.
814ef095f12c9f Haren Myneni 2025-09-09  311   */
814ef095f12c9f Haren Myneni 2025-09-09  312  static ssize_t papr_hvpipe_handle_read(struct file *file,
814ef095f12c9f Haren Myneni 2025-09-09  313  		char __user *buf, size_t size, loff_t *off)
814ef095f12c9f Haren Myneni 2025-09-09  314  {
814ef095f12c9f Haren Myneni 2025-09-09  315  
814ef095f12c9f Haren Myneni 2025-09-09  316  	struct hvpipe_source_info *src_info = file->private_data;
cebdb522fd3edd Haren Myneni 2025-09-09  317  	struct papr_hvpipe_hdr hdr;
cebdb522fd3edd Haren Myneni 2025-09-09  318  	long ret;
814ef095f12c9f Haren Myneni 2025-09-09  319  
814ef095f12c9f Haren Myneni 2025-09-09  320  	if (!src_info)
814ef095f12c9f Haren Myneni 2025-09-09  321  		return -EIO;
814ef095f12c9f Haren Myneni 2025-09-09  322  
cebdb522fd3edd Haren Myneni 2025-09-09  323  	/*
cebdb522fd3edd Haren Myneni 2025-09-09  324  	 * Max payload is 4048 (HVPIPE_MAX_WRITE_BUFFER_SIZE)
cebdb522fd3edd Haren Myneni 2025-09-09  325  	 */
cebdb522fd3edd Haren Myneni 2025-09-09  326  	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
cebdb522fd3edd Haren Myneni 2025-09-09  327  		(size < HVPIPE_HDR_LEN))
cebdb522fd3edd Haren Myneni 2025-09-09  328  		return -EINVAL;
cebdb522fd3edd Haren Myneni 2025-09-09  329  
cebdb522fd3edd Haren Myneni 2025-09-09  330  	/*
cebdb522fd3edd Haren Myneni 2025-09-09  331  	 * Payload is not available to receive or source pipe
cebdb522fd3edd Haren Myneni 2025-09-09  332  	 * is not closed.
cebdb522fd3edd Haren Myneni 2025-09-09  333  	 */
cebdb522fd3edd Haren Myneni 2025-09-09  334  	if (!src_info->hvpipe_status)
814ef095f12c9f Haren Myneni 2025-09-09  335  		return 0;
cebdb522fd3edd Haren Myneni 2025-09-09  336  
cebdb522fd3edd Haren Myneni 2025-09-09  337  	hdr.version = 0;
cebdb522fd3edd Haren Myneni 2025-09-09  338  	hdr.flags = 0;
cebdb522fd3edd Haren Myneni 2025-09-09  339  
cebdb522fd3edd Haren Myneni 2025-09-09  340  	/*
cebdb522fd3edd Haren Myneni 2025-09-09  341  	 * In case if the hvpipe has payload and also the
cebdb522fd3edd Haren Myneni 2025-09-09  342  	 * hypervisor closed the pipe to the source, retrieve
cebdb522fd3edd Haren Myneni 2025-09-09  343  	 * the payload and return to the user space first and
cebdb522fd3edd Haren Myneni 2025-09-09  344  	 * then notify the userspace about the hvpipe close in
cebdb522fd3edd Haren Myneni 2025-09-09  345  	 * next read().
cebdb522fd3edd Haren Myneni 2025-09-09  346  	 */
cebdb522fd3edd Haren Myneni 2025-09-09  347  	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE)
cebdb522fd3edd Haren Myneni 2025-09-09  348  		hdr.flags = HVPIPE_MSG_AVAILABLE;
cebdb522fd3edd Haren Myneni 2025-09-09  349  	else if (src_info->hvpipe_status & HVPIPE_LOST_CONNECTION)
cebdb522fd3edd Haren Myneni 2025-09-09  350  		hdr.flags = HVPIPE_LOST_CONNECTION;
cebdb522fd3edd Haren Myneni 2025-09-09  351  	else
cebdb522fd3edd Haren Myneni 2025-09-09  352  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  353  		 * Should not be here without one of the above
cebdb522fd3edd Haren Myneni 2025-09-09  354  		 * flags set
cebdb522fd3edd Haren Myneni 2025-09-09  355  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  356  		return -EIO;
cebdb522fd3edd Haren Myneni 2025-09-09  357  
cebdb522fd3edd Haren Myneni 2025-09-09  358  	ret = copy_to_user(buf, &hdr, HVPIPE_HDR_LEN);
cebdb522fd3edd Haren Myneni 2025-09-09  359  	if (ret)
cebdb522fd3edd Haren Myneni 2025-09-09 @360  		return ret;
cebdb522fd3edd Haren Myneni 2025-09-09  361  
cebdb522fd3edd Haren Myneni 2025-09-09  362  	/*
cebdb522fd3edd Haren Myneni 2025-09-09  363  	 * Message event has payload, so get the payload with
cebdb522fd3edd Haren Myneni 2025-09-09  364  	 * recv HVPIPE RTAS.
cebdb522fd3edd Haren Myneni 2025-09-09  365  	 */
cebdb522fd3edd Haren Myneni 2025-09-09  366  	if (hdr.flags & HVPIPE_MSG_AVAILABLE) {
cebdb522fd3edd Haren Myneni 2025-09-09  367  		ret = hvpipe_rtas_recv_msg(buf + HVPIPE_HDR_LEN,
cebdb522fd3edd Haren Myneni 2025-09-09  368  				size - HVPIPE_HDR_LEN);
cebdb522fd3edd Haren Myneni 2025-09-09  369  		if (ret > 0) {
cebdb522fd3edd Haren Myneni 2025-09-09  370  			src_info->hvpipe_status &= ~HVPIPE_MSG_AVAILABLE;
cebdb522fd3edd Haren Myneni 2025-09-09  371  			ret += HVPIPE_HDR_LEN;
cebdb522fd3edd Haren Myneni 2025-09-09  372  		}
cebdb522fd3edd Haren Myneni 2025-09-09  373  	} else if (hdr.flags & HVPIPE_LOST_CONNECTION) {
cebdb522fd3edd Haren Myneni 2025-09-09  374  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  375  		 * Hypervisor is closing the pipe for the specific
cebdb522fd3edd Haren Myneni 2025-09-09  376  		 * source. So notify user space.
cebdb522fd3edd Haren Myneni 2025-09-09  377  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  378  		src_info->hvpipe_status &= ~HVPIPE_LOST_CONNECTION;
cebdb522fd3edd Haren Myneni 2025-09-09  379  		ret = HVPIPE_HDR_LEN;
cebdb522fd3edd Haren Myneni 2025-09-09  380  	}
cebdb522fd3edd Haren Myneni 2025-09-09  381  
cebdb522fd3edd Haren Myneni 2025-09-09  382  	return ret;
814ef095f12c9f Haren Myneni 2025-09-09  383  }
814ef095f12c9f Haren Myneni 2025-09-09  384  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
