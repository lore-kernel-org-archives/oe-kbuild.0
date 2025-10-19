Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C131F4617
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760855685; cv=none; b=RjRT3NSWULmAn5oL3XRvYGgSRobrm8Q7irmWgA54noRbHE3FHwPEAje0pg2wdvMJ3cMek5Rfys62yHqez7zpQ3bGNrMbXNnUu4na7lY7VDxmMY1HBNMtmPnD+/kH1tU3vYxl9Lp9N+47T2e66i5ugGvGOWlxzggax+mVknupaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760855685; c=relaxed/simple;
	bh=udgEEsPizthpXuzA/bQc1p2or2vipaOAiECWQBmv4bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Cc8w0XF2sgAe/hjv2mvDl4FLYC4j3ONPom5wO8rpw3EYLWhleV1EdBaHzWQQxKE6/McYBNaSST3crmTGS5D8S4tbLIlmtr/kvNfnzHKq6rkY0uYWmY7Pv2hEJNtJa5+F5n7cCqoht2ZkRgHLroLveZjQy9kzB56/SobZb9qvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+pS2K7X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+pS2K7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760855683; x=1792391683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udgEEsPizthpXuzA/bQc1p2or2vipaOAiECWQBmv4bg=;
  b=X+pS2K7Xb3AdazFUZnyAc1fX8vDu5b6C49mWAnMc0CCMJar4O+K44cdI
   lbZEZebjbC3WkeqGi4aP+RQ/jjR/CxPuv+QI+lilxjMgz4yujRD8NBX9F
   lRdjIcc2D22vjVwCAP1JieSbnQkPopfPziHS74V9Lz1GV9L8P6RKC7tZk
   EyZurlV88wAAKZJK+TlXjVgkFdAw2KNQiGejBwoq6VeJQ2rcx4JUI51j+
   wf0AV/GlAIdKS7JeIQnXDdtfkeI7nH8jOuPZ0Dog3LSbinUK5h8+3Tx/O
   3Lm8PM+9qFbqZ5qKDtSjNcZSFuEpffI8Abkhww+DRHsn9mhCzI9q93mjy
   Q==;
X-CSE-ConnectionGUID: hX4xIIwKT0qC5C4v0wy9MA==
X-CSE-MsgGUID: c1pt+G5ES+SSnLFyeMj8mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62223386"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62223386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 23:34:42 -0700
X-CSE-ConnectionGUID: GUSXdyPOScSRpS5mzCTjwQ==
X-CSE-MsgGUID: GtDQtYRNSN6PAQSGQSFYJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183034817"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2025 23:34:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAN02-0008u1-2b;
	Sun, 19 Oct 2025 06:34:38 +0000
Date: Sun, 19 Oct 2025 14:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/6] smb/server: fix return value of smb2_read()
Message-ID: <202510191309.Ab1nXgU0-lkp@intel.com>
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
In-Reply-To: <20251017104613.3094031-2-chenxiaosong.chenxiaosong@linux.dev>
References: <20251017104613.3094031-2-chenxiaosong.chenxiaosong@linux.dev>
TO: chenxiaosong.chenxiaosong@linux.dev

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chenxiaosong-chenxiaosong-linux-dev/smb-server-fix-return-value-of-smb2_read/20251017-184931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251017104613.3094031-2-chenxiaosong.chenxiaosong%40linux.dev
patch subject: [PATCH v2 1/6] smb/server: fix return value of smb2_read()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251019 (https://download.01.org/0day-ci/archive/20251019/202510191309.Ab1nXgU0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510191309.Ab1nXgU0-lkp@intel.com/

smatch warnings:
fs/smb/server/smb2pdu.c:6830 smb2_read() warn: missing unwind goto?

vim +6830 fs/smb/server/smb2pdu.c

e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6712  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6713  /**
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6714   * smb2_read() - handler for smb2 read from file
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6715   * @work:	smb work containing read command buffer
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6716   *
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6717   * Return:	0 on success, otherwise error
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6718   */
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6719  int smb2_read(struct ksmbd_work *work)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6720  {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6721  	struct ksmbd_conn *conn = work->conn;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6722  	struct smb2_read_req *req;
cb4517201b8acdb fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-11-03  6723  	struct smb2_read_rsp *rsp;
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6724  	struct ksmbd_file *fp = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6725  	loff_t offset;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6726  	size_t length, mincount;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6727  	ssize_t nbytes = 0, remain_bytes = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6728  	int err = 0;
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6729  	bool is_rdma_channel = false;
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6730  	unsigned int max_read_size = conn->vals->max_read_size;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6731  	unsigned int id = KSMBD_NO_FID, pid = KSMBD_NO_FID;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6732  	void *aux_payload_buf;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6733  
e333e77638b3cc8 fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  6734  	ksmbd_debug(SMB, "Received smb2 read request\n");
e333e77638b3cc8 fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  6735  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6736  	if (test_share_config_flag(work->tcon->share_conf,
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6737  				   KSMBD_SHARE_FLAG_PIPE)) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6738  		ksmbd_debug(SMB, "IPC pipe read request\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6739  		return smb2_read_pipe(work);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6740  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6741  
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6742  	if (work->next_smb2_rcv_hdr_off) {
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6743  		req = ksmbd_req_buf_next(work);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6744  		rsp = ksmbd_resp_buf_next(work);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6745  		if (!has_file_id(req->VolatileFileId)) {
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6746  			ksmbd_debug(SMB, "Compound request set FID = %llu\n",
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6747  					work->compound_fid);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6748  			id = work->compound_fid;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6749  			pid = work->compound_pfid;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6750  		}
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6751  	} else {
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6752  		req = smb2_get_msg(work->request_buf);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6753  		rsp = smb2_get_msg(work->response_buf);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6754  	}
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6755  
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6756  	if (!has_file_id(id)) {
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6757  		id = req->VolatileFileId;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6758  		pid = req->PersistentFileId;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6759  	}
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6760  
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6761  	if (req->Channel == SMB2_CHANNEL_RDMA_V1_INVALIDATE ||
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6762  	    req->Channel == SMB2_CHANNEL_RDMA_V1) {
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6763  		is_rdma_channel = true;
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6764  		max_read_size = get_smbd_max_read_write_size();
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6765  	}
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6766  
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6767  	if (is_rdma_channel == true) {
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6768  		unsigned int ch_offset = le16_to_cpu(req->ReadChannelInfoOffset);
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6769  
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6770  		if (ch_offset < offsetof(struct smb2_read_req, Buffer)) {
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6771  			err = -EINVAL;
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6772  			goto out;
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6773  		}
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6774  		err = smb2_set_remote_key_for_rdma(work,
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6775  						   (struct smb2_buffer_desc_v1 *)
6d896d3b44cf64a fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6776  						   ((char *)req + ch_offset),
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6777  						   req->Channel,
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6778  						   req->ReadChannelInfoLength);
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6779  		if (err)
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6780  			goto out;
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6781  	}
2fd5dcb1c8ef96c fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6782  
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6783  	fp = ksmbd_lookup_fd_slow(work, id, pid);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6784  	if (!fp) {
a4382db9bac3144 fs/cifsd/smb2pdu.c      Marios Makassikis 2021-05-06  6785  		err = -ENOENT;
a4382db9bac3144 fs/cifsd/smb2pdu.c      Marios Makassikis 2021-05-06  6786  		goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6787  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6788  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6789  	if (!(fp->daccess & (FILE_READ_DATA_LE | FILE_READ_ATTRIBUTES_LE))) {
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  6790  		pr_err("Not permitted to read : 0x%x\n", fp->daccess);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6791  		err = -EACCES;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6792  		goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6793  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6794  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6795  	offset = le64_to_cpu(req->Offset);
fc342cf86e2dc4d fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6796  	if (offset < 0) {
fc342cf86e2dc4d fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6797  		err = -EINVAL;
fc342cf86e2dc4d fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6798  		goto out;
fc342cf86e2dc4d fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6799  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6800  	length = le32_to_cpu(req->Length);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6801  	mincount = le32_to_cpu(req->MinimumCount);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6802  
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6803  	if (length > max_read_size) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6804  		ksmbd_debug(SMB, "limiting read size to max size(%u)\n",
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6805  			    max_read_size);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6806  		err = -EINVAL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6807  		goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6808  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6809  
369c1634cc7ae86 fs/ksmbd/smb2pdu.c      Al Viro           2022-01-30  6810  	ksmbd_debug(SMB, "filename %pD, offset %lld, len %zu\n",
369c1634cc7ae86 fs/ksmbd/smb2pdu.c      Al Viro           2022-01-30  6811  		    fp->filp, offset, length);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6812  
06a025448b572c3 fs/smb/server/smb2pdu.c Norbert Szetei    2024-11-30  6813  	aux_payload_buf = kvzalloc(ALIGN(length, 8), KSMBD_DEFAULT_GFP);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6814  	if (!aux_payload_buf) {
c1ea111fd1bb4c4 fs/cifsd/smb2pdu.c      Dan Carpenter     2021-03-22  6815  		err = -ENOMEM;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6816  		goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6817  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6818  
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6819  	nbytes = ksmbd_vfs_read(work, fp, length, &offset, aux_payload_buf);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6820  	if (nbytes < 0) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6821  		err = nbytes;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6822  		goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6823  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6824  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6825  	if ((nbytes == 0 && length != 0) || nbytes < mincount) {
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6826  		kvfree(aux_payload_buf);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6827  		rsp->hdr.Status = STATUS_END_OF_FILE;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6828  		smb2_set_err_rsp(work);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6829  		ksmbd_fd_put(work, fp);
ce8595fc9f38afd fs/smb/server/smb2pdu.c ChenXiaoSong      2025-10-17 @6830  		return -ENODATA;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6831  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6832  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6833  	ksmbd_debug(SMB, "nbytes %zu, offset %lld mincount %zu\n",
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6834  		    nbytes, offset, mincount);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6835  
7a84399e1ce3f5f fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6836  	if (is_rdma_channel == true) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6837  		/* write data to the client using rdma channel */
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6838  		remain_bytes = smb2_read_rdma_channel(work, req,
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6839  						      aux_payload_buf,
070fb21e5912b6a fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  6840  						      nbytes);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6841  		kvfree(aux_payload_buf);
59d8d24f4610333 fs/smb/server/smb2pdu.c Namjae Jeon       2023-09-12  6842  		aux_payload_buf = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6843  		nbytes = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6844  		if (remain_bytes < 0) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6845  			err = (int)remain_bytes;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6846  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6847  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6848  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6849  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6850  	rsp->StructureSize = cpu_to_le16(17);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6851  	rsp->DataOffset = 80;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6852  	rsp->Reserved = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6853  	rsp->DataLength = cpu_to_le32(nbytes);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6854  	rsp->DataRemaining = cpu_to_le32(remain_bytes);
699230f31bf55ab fs/ksmbd/smb2pdu.c      Ronnie Sahlberg   2021-09-09  6855  	rsp->Flags = 0;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6856  	err = ksmbd_iov_pin_rsp_read(work, (void *)rsp,
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6857  				     offsetof(struct smb2_read_rsp, Buffer),
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6858  				     aux_payload_buf, nbytes);
108a020c64434fe fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6859  	if (err) {
108a020c64434fe fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6860  		kvfree(aux_payload_buf);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6861  		goto out;
108a020c64434fe fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6862  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6863  	ksmbd_fd_put(work, fp);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6864  	return 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6865  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6866  out:
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6867  	if (err) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6868  		if (err == -EISDIR)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6869  			rsp->hdr.Status = STATUS_INVALID_DEVICE_REQUEST;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6870  		else if (err == -EAGAIN)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6871  			rsp->hdr.Status = STATUS_FILE_LOCK_CONFLICT;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6872  		else if (err == -ENOENT)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6873  			rsp->hdr.Status = STATUS_FILE_CLOSED;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6874  		else if (err == -EACCES)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6875  			rsp->hdr.Status = STATUS_ACCESS_DENIED;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6876  		else if (err == -ESHARE)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6877  			rsp->hdr.Status = STATUS_SHARING_VIOLATION;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6878  		else if (err == -EINVAL)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6879  			rsp->hdr.Status = STATUS_INVALID_PARAMETER;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6880  		else
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6881  			rsp->hdr.Status = STATUS_INVALID_HANDLE;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6882  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6883  		smb2_set_err_rsp(work);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6884  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6885  	ksmbd_fd_put(work, fp);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6886  	return err;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6887  }
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6888  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
