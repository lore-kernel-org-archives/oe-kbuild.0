Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D4405C57
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778957460; cv=none; b=NYbvlD8jeh4pFCcmrNopSDDDL2k1SA76oAr4tzNP7WEzdNtWCObVWBLzASsP7HSMf2tkWMFOlVyUDCyYLO28iBMC9K8CBgzaSUGJLzddkiD3/CIjM9ZsDzNI+qFV59aVBF3hWuVUZ1vnPaSpIGwSlUaUjti2jKFyUVefi6TmR68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778957460; c=relaxed/simple;
	bh=ra9D6ozFMpyY3E7Posonna+oODEB7VGRMTE51643Xr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gqnmB3igzo2Ml9gtcP0rFaZd8SEgm6Z0mqqUQbrmyqe/wEE50jD4GbDOAebwaRm0/ILINqEt2DXI2kDrZgAjrMqsSZy/ezj9aXfB9TybuQ5QtldND6KL6s0Ip8OJWJuKZS6sX5P1RBdx2/3VnbH1VSFZOECeBnF7pkYujUROgTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6Iqr0TA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6Iqr0TA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778957457; x=1810493457;
  h=date:from:to:cc:subject:message-id;
  bh=ra9D6ozFMpyY3E7Posonna+oODEB7VGRMTE51643Xr4=;
  b=a6Iqr0TAiHk2LpoC+sGhjdkMjOOKqC6Gx3JycYtSjdvcfXWt9gmoBrbM
   KggTxK+WYNLngqI8y/HrBCnLD7C6qYx2xEnINAsOOCTaLia/v0rPMKU3q
   8+zaiTpi+WT/wHfT+kl/LL0Fs82Y4gjvhLQhpgP/WFbpJNBjkdd307F91
   mWManimVLrQK3TNNLbJiFbrQNBMfBT0ytoJ2ZF1F6EQ1BgPnk7lQbTbtA
   pqXRw3RLJ5w6f708G42Lwn/5h7elf/h9O5zyclJAB4S0gVA9rQT8w57dS
   vjKnkQzUz5prckHs1vCvS2G82i7THAiOOOzBF+TZ2UK17aVxEVcGSrUF9
   A==;
X-CSE-ConnectionGUID: AmVv5XwERZyHIjUkv7K9OQ==
X-CSE-MsgGUID: P/JUAGc4QP+dtIATaehoWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79773382"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79773382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 11:50:55 -0700
X-CSE-ConnectionGUID: V+vNC6EmTeqXMIxjeM20QA==
X-CSE-MsgGUID: YVhND1l7TLahrR7z3Njj5g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 May 2026 11:50:54 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOK67-0000000013U-2h6o;
	Sat, 16 May 2026 18:50:51 +0000
Date: Sun, 17 May 2026 02:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/smb2pdu.c:6835 smb2_read() warn: missing
 unwind goto?
Message-ID: <202605170214.uVLvXFA9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: ChenXiaoSong <chenxiaosong@kylinos.cn>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: c5b462e35373a68a5a7954f5e00383998cc7fe92 smb/server: fix return value of smb2_read()
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r072-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170214.uVLvXFA9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c5b462e35373 ("smb/server: fix return value of smb2_read()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605170214.uVLvXFA9-lkp@intel.com/

smatch warnings:
fs/smb/server/smb2pdu.c:6835 smb2_read() warn: missing unwind goto?

vim +6835 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6712  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6713  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6714   * smb2_read() - handler for smb2 read from file
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6715   * @work:	smb work containing read command buffer
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6716   *
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6717   * Return:	0 on success, otherwise error
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6718   */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6719  int smb2_read(struct ksmbd_work *work)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6720  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6721  	struct ksmbd_conn *conn = work->conn;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6722  	struct smb2_read_req *req;
cb4517201b8acd fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-11-03  6723  	struct smb2_read_rsp *rsp;
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6724  	struct ksmbd_file *fp = NULL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6725  	loff_t offset;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6726  	size_t length, mincount;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6727  	ssize_t nbytes = 0, remain_bytes = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6728  	int err = 0;
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6729  	bool is_rdma_channel = false;
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6730  	unsigned int max_read_size = conn->vals->max_read_size;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6731  	unsigned int id = KSMBD_NO_FID, pid = KSMBD_NO_FID;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6732  	void *aux_payload_buf;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6733  
e333e77638b3cc fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  6734  	ksmbd_debug(SMB, "Received smb2 read request\n");
e333e77638b3cc fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  6735  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6736  	if (test_share_config_flag(work->tcon->share_conf,
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6737  				   KSMBD_SHARE_FLAG_PIPE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6738  		ksmbd_debug(SMB, "IPC pipe read request\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6739  		return smb2_read_pipe(work);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6740  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6741  
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6742  	if (work->next_smb2_rcv_hdr_off) {
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6743  		req = ksmbd_req_buf_next(work);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6744  		rsp = ksmbd_resp_buf_next(work);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6745  		if (!has_file_id(req->VolatileFileId)) {
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6746  			ksmbd_debug(SMB, "Compound request set FID = %llu\n",
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6747  					work->compound_fid);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6748  			id = work->compound_fid;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6749  			pid = work->compound_pfid;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6750  		}
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6751  	} else {
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6752  		req = smb2_get_msg(work->request_buf);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6753  		rsp = smb2_get_msg(work->response_buf);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6754  	}
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6755  
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6756  	if (!has_file_id(id)) {
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6757  		id = req->VolatileFileId;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6758  		pid = req->PersistentFileId;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6759  	}
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6760  
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6761  	if (req->Channel == SMB2_CHANNEL_RDMA_V1_INVALIDATE ||
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6762  	    req->Channel == SMB2_CHANNEL_RDMA_V1) {
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6763  		is_rdma_channel = true;
03a38d846750f0 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-15  6764  		max_read_size = get_smbd_max_read_write_size(work->conn->transport);
03a38d846750f0 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-15  6765  		if (max_read_size == 0) {
03a38d846750f0 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-15  6766  			err = -EINVAL;
03a38d846750f0 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-15  6767  			goto out;
03a38d846750f0 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-15  6768  		}
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6769  	}
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6770  
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6771  	if (is_rdma_channel == true) {
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6772  		unsigned int ch_offset = le16_to_cpu(req->ReadChannelInfoOffset);
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6773  
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6774  		if (ch_offset < offsetof(struct smb2_read_req, Buffer)) {
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6775  			err = -EINVAL;
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6776  			goto out;
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6777  		}
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6778  		err = smb2_set_remote_key_for_rdma(work,
e7de2c4521ce86 fs/smb/server/smb2pdu.c Stefan Metzmacher 2025-08-06  6779  						   (struct smbdirect_buffer_descriptor_v1 *)
6d896d3b44cf64 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-20  6780  						   ((char *)req + ch_offset),
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6781  						   req->Channel,
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6782  						   req->ReadChannelInfoLength);
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6783  		if (err)
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6784  			goto out;
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6785  	}
2fd5dcb1c8ef96 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2022-01-13  6786  
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6787  	fp = ksmbd_lookup_fd_slow(work, id, pid);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6788  	if (!fp) {
a4382db9bac314 fs/cifsd/smb2pdu.c      Marios Makassikis 2021-05-06  6789  		err = -ENOENT;
a4382db9bac314 fs/cifsd/smb2pdu.c      Marios Makassikis 2021-05-06  6790  		goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6791  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6792  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6793  	if (!(fp->daccess & (FILE_READ_DATA_LE | FILE_READ_ATTRIBUTES_LE))) {
bde1694aecdb53 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  6794  		pr_err("Not permitted to read : 0x%x\n", fp->daccess);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6795  		err = -EACCES;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6796  		goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6797  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6798  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6799  	offset = le64_to_cpu(req->Offset);
fc342cf86e2dc4 fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6800  	if (offset < 0) {
fc342cf86e2dc4 fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6801  		err = -EINVAL;
fc342cf86e2dc4 fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6802  		goto out;
fc342cf86e2dc4 fs/smb/server/smb2pdu.c Jordy Zomer       2024-11-28  6803  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6804  	length = le32_to_cpu(req->Length);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6805  	mincount = le32_to_cpu(req->MinimumCount);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6806  
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6807  	if (length > max_read_size) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6808  		ksmbd_debug(SMB, "limiting read size to max size(%u)\n",
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6809  			    max_read_size);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6810  		err = -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6811  		goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6812  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6813  
369c1634cc7ae8 fs/ksmbd/smb2pdu.c      Al Viro           2022-01-30  6814  	ksmbd_debug(SMB, "filename %pD, offset %lld, len %zu\n",
369c1634cc7ae8 fs/ksmbd/smb2pdu.c      Al Viro           2022-01-30  6815  		    fp->filp, offset, length);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6816  
06a025448b572c fs/smb/server/smb2pdu.c Norbert Szetei    2024-11-30  6817  	aux_payload_buf = kvzalloc(ALIGN(length, 8), KSMBD_DEFAULT_GFP);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6818  	if (!aux_payload_buf) {
c1ea111fd1bb4c fs/cifsd/smb2pdu.c      Dan Carpenter     2021-03-22  6819  		err = -ENOMEM;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6820  		goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6821  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6822  
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6823  	nbytes = ksmbd_vfs_read(work, fp, length, &offset, aux_payload_buf);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6824  	if (nbytes < 0) {
6fced056d2cc8d fs/smb/server/smb2pdu.c ZhangGuoDong      2025-10-12  6825  		kvfree(aux_payload_buf);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6826  		err = nbytes;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6827  		goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6828  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6829  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6830  	if ((nbytes == 0 && length != 0) || nbytes < mincount) {
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6831  		kvfree(aux_payload_buf);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6832  		rsp->hdr.Status = STATUS_END_OF_FILE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6833  		smb2_set_err_rsp(work);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6834  		ksmbd_fd_put(work, fp);
c5b462e35373a6 fs/smb/server/smb2pdu.c ChenXiaoSong      2025-10-17 @6835  		return -ENODATA;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6836  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6837  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6838  	ksmbd_debug(SMB, "nbytes %zu, offset %lld mincount %zu\n",
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6839  		    nbytes, offset, mincount);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6840  
7a84399e1ce3f5 fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-05-16  6841  	if (is_rdma_channel == true) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6842  		/* write data to the client using rdma channel */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6843  		remain_bytes = smb2_read_rdma_channel(work, req,
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6844  						      aux_payload_buf,
070fb21e5912b6 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  6845  						      nbytes);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6846  		kvfree(aux_payload_buf);
59d8d24f461033 fs/smb/server/smb2pdu.c Namjae Jeon       2023-09-12  6847  		aux_payload_buf = NULL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6848  		nbytes = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6849  		if (remain_bytes < 0) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6850  			err = (int)remain_bytes;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6851  			goto out;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6852  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6853  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6854  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6855  	rsp->StructureSize = cpu_to_le16(17);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6856  	rsp->DataOffset = 80;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6857  	rsp->Reserved = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6858  	rsp->DataLength = cpu_to_le32(nbytes);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6859  	rsp->DataRemaining = cpu_to_le32(remain_bytes);
699230f31bf55a fs/ksmbd/smb2pdu.c      Ronnie Sahlberg   2021-09-09  6860  	rsp->Flags = 0;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6861  	err = ksmbd_iov_pin_rsp_read(work, (void *)rsp,
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6862  				     offsetof(struct smb2_read_rsp, Buffer),
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6863  				     aux_payload_buf, nbytes);
108a020c64434f fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6864  	if (err) {
108a020c64434f fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6865  		kvfree(aux_payload_buf);
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  6866  		goto out;
108a020c64434f fs/smb/server/smb2pdu.c Fedor Pchelkin    2024-02-05  6867  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6868  	ksmbd_fd_put(work, fp);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6869  	return 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6870  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6871  out:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6872  	if (err) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6873  		if (err == -EISDIR)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6874  			rsp->hdr.Status = STATUS_INVALID_DEVICE_REQUEST;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6875  		else if (err == -EAGAIN)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6876  			rsp->hdr.Status = STATUS_FILE_LOCK_CONFLICT;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6877  		else if (err == -ENOENT)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6878  			rsp->hdr.Status = STATUS_FILE_CLOSED;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6879  		else if (err == -EACCES)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6880  			rsp->hdr.Status = STATUS_ACCESS_DENIED;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6881  		else if (err == -ESHARE)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6882  			rsp->hdr.Status = STATUS_SHARING_VIOLATION;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6883  		else if (err == -EINVAL)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6884  			rsp->hdr.Status = STATUS_INVALID_PARAMETER;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6885  		else
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6886  			rsp->hdr.Status = STATUS_INVALID_HANDLE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6887  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6888  		smb2_set_err_rsp(work);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6889  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6890  	ksmbd_fd_put(work, fp);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6891  	return err;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6892  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  6893  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
