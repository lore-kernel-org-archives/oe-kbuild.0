Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41AE811
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 04:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVpVL8oJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697000225; x=1728536225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrBmPczYiKTwsKjNU/pzZka+pa9bEno1KcvKsmelR5k=;
  b=lVpVL8oJn90d2JbIigWQwLVQ7K//FFu7OiAZgx4oDvV7QiA+6I9w6ucP
   q9f3S7/sUAm5kbODYuCuBl9MSLIXpNebnqzAjyi3k9tw6NVpbPL5gkMGK
   V3rDB+k7B0NKwExaUZB/bRRM4ZscShNGVE2RcHnV644giucDamFhARK7t
   eoSGRZodHY4vXti21zI13eBvFm5ox9vDMLZKAEzyrh0RL1RDRkslsBHLg
   B4skhH6bwoxArdgWHwt4x/8/oeZLzC/mZdeFL/f95gYuBBstvrZBssxU5
   31ZgqwBbHdfM+31GSQlq92TckZth/fI/8WTh63UI+ul+pFuhhrvFyf2kv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381828282"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="381828282"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="824022522"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="824022522"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 21:57:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRHG-0001kb-0H;
	Wed, 11 Oct 2023 04:56:59 +0000
Date: Wed, 11 Oct 2023 12:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/smb2pdu.c:6131 smb2_read_pipe() error: double free of
 'rpc_resp'
Message-ID: <202310111236.IXH2OKfq-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: e2b76ab8b5c9327ab2dae6da05d0752eb2f4771d ksmbd: add support for read compound
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231011/202310111236.IXH2OKfq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111236.IXH2OKfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310111236.IXH2OKfq-lkp@intel.com/

New smatch warnings:
fs/smb/server/smb2pdu.c:6131 smb2_read_pipe() error: double free of 'rpc_resp'

Old smatch warnings:
fs/smb/server/smb2pdu.c:3389 smb2_open() warn: Function too hairy.  No more merges.
fs/smb/server/smb2pdu.c:6318 smb2_read() warn: passing freed memory 'aux_payload_buf'

vim +/rpc_resp +6131 fs/smb/server/smb2pdu.c

e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6069  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6070  /**
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6071   * smb2_read_pipe() - handler for smb2 read from IPC pipe
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6072   * @work:	smb work containing read IPC pipe command buffer
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6073   *
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6074   * Return:	0 on success, otherwise error
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6075   */
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6076  static noinline int smb2_read_pipe(struct ksmbd_work *work)
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6077  {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6078  	int nbytes = 0, err;
64b39f4a2fd293cf fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-30  6079  	u64 id;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6080  	struct ksmbd_rpc_command *rpc_resp;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6081  	struct smb2_read_req *req;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6082  	struct smb2_read_rsp *rsp;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6083  
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6084  	WORK_BUFFERS(work, req, rsp);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6085  
2d004c6cae567e33 fs/ksmbd/smb2pdu.c      Paulo Alcantara 2022-03-21  6086  	id = req->VolatileFileId;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6087  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6088  	rpc_resp = ksmbd_rpc_read(work->sess, id);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6089  	if (rpc_resp) {
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6090  		void *aux_payload_buf;
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6091  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6092  		if (rpc_resp->flags != KSMBD_RPC_OK) {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6093  			err = -EINVAL;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6094  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6095  		}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6096  
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6097  		aux_payload_buf =
81a94b27847f7d2e fs/smb/server/smb2pdu.c Namjae Jeon     2023-05-31  6098  			kvmalloc(rpc_resp->payload_sz, GFP_KERNEL);
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6099  		if (!aux_payload_buf) {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6100  			err = -ENOMEM;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6101  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6102  		}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6103  
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6104  		memcpy(aux_payload_buf, rpc_resp->payload, rpc_resp->payload_sz);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6105  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6106  		nbytes = rpc_resp->payload_sz;
79f6b11a104f3a32 fs/cifsd/smb2pdu.c      Namjae Jeon     2021-04-02  6107  		kvfree(rpc_resp);
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6108  		err = ksmbd_iov_pin_rsp_read(work, (void *)rsp,
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6109  					     offsetof(struct smb2_read_rsp, Buffer),
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6110  					     aux_payload_buf, nbytes);
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6111  		if (err)
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6112  			goto out;
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6113  	} else {
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6114  		err = ksmbd_iov_pin_rsp(work, (void *)rsp,
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6115  					offsetof(struct smb2_read_rsp, Buffer));
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6116  		if (err)
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6117  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6118  	}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6119  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6120  	rsp->StructureSize = cpu_to_le16(17);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6121  	rsp->DataOffset = 80;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6122  	rsp->Reserved = 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6123  	rsp->DataLength = cpu_to_le32(nbytes);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6124  	rsp->DataRemaining = 0;
699230f31bf55abc fs/ksmbd/smb2pdu.c      Ronnie Sahlberg 2021-09-09  6125  	rsp->Flags = 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6126  	return 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6127  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6128  out:
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6129  	rsp->hdr.Status = STATUS_UNEXPECTED_IO_ERROR;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6130  	smb2_set_err_rsp(work);
79f6b11a104f3a32 fs/cifsd/smb2pdu.c      Namjae Jeon     2021-04-02 @6131  	kvfree(rpc_resp);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6132  	return err;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6133  }
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6134  

:::::: The code at line 6131 was first introduced by commit
:::::: 79f6b11a104f3a32f4f4a6f7808a02c301c19710 cifsd: remove wrappers of kvmalloc/kvfree

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
