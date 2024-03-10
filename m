Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FF3B295
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710108014; cv=none; b=Rrdni93pYv7HaPkXz1sj2ULf8gUphCmLwgZy0sthhpmjLDJwjGRJs2VoO6xfjTiwnBZfBr3ZXzPJkCH3OhAHgPVApNdi4Bc8S48vAwht3BX22eJU1MEynzqTtJXqwB+n6huz7qTfJNhEewmbQ+tcqyO8P8zbk/gYnpiNSkY6Mys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710108014; c=relaxed/simple;
	bh=YoOvzRinFoLpCMl7oqZMrkvUIJGAVQi1qkRB+doKMOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQvF4VwTW7e1UbqyDnJANN797rb1MvA1QEdTiO7cg7+ngW3vYr0EZegac2ueWKkC5If4Fn2r7r5Er0o5+OQlKnWWikdmPA6tiy+SNR0taE0JtPkQJ7GoPSR4RGG2nYCQJOfNJ5pFGHCgILLTL767QXQEpk7Opst1KYJuFZf4PbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvKLIHzl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvKLIHzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710108011; x=1741644011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoOvzRinFoLpCMl7oqZMrkvUIJGAVQi1qkRB+doKMOM=;
  b=PvKLIHzlTj1pvX72Lz76awGD4vhqmN5RZGmkoAKeHDvt7O8VVuwU3Kho
   IqiFEWHx1tr3GVIXkd+UFWecnwL2q83H0VclWvNP99sGrt3vLWgcRxghF
   CqAscCqQF6JfSmZfgGOUtiv0dFH/8vK0jIr7GSiff39WepDstx+mhIhEu
   xXMT9mW9mM1YWphK5Wv61AtzH9oxIJWeBNUI8wXkk3OoYoDrumpK4zbx4
   pW/NMqTSUqLvfdnGAGsE3KMzsUa6EN9tBEpiiPUiK2zBlfH+7lZPUHGAe
   /7F3rwqiGXd/HQ9h/Ptk6OU1Vb1+SEi6wJ80417e7DWUSPt1jtCYwwabI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30205206"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="30205206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 15:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="41906583"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2024 15:00:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjRDA-0008cx-2p;
	Sun, 10 Mar 2024 22:00:04 +0000
Date: Mon, 11 Mar 2024 05:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/smb2pdu.c:2654
 parse_durable_handle_context() warn: passing zero to 'PTR_ERR'
Message-ID: <202403110538.jBX2iDwP-lkp@intel.com>
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
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   f4ab0ca366e96a297b511d020a7fcd212f0268c9
commit: f4ab0ca366e96a297b511d020a7fcd212f0268c9 [4/4] ksmbd: add support for durable handles v1/v2
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-141-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110538.jBX2iDwP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403110538.jBX2iDwP-lkp@intel.com/

smatch warnings:
fs/smb/server/smb2pdu.c:2654 parse_durable_handle_context() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2654 fs/smb/server/smb2pdu.c

f4ab0ca366e96a Namjae Jeon 2024-03-10  2636  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2637  static int parse_durable_handle_context(struct ksmbd_work *work,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2638  					struct smb2_create_req *req,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2639  					struct lease_ctx_info *lc,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2640  					struct durable_info *dh_info)
f4ab0ca366e96a Namjae Jeon 2024-03-10  2641  {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2642  	struct ksmbd_conn *conn = work->conn;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2643  	struct create_context *context;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2644  	int dh_idx, err = 0;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2645  	u64 persistent_id = 0;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2646  	int req_op_level;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2647  	static const char * const durable_arr[] = {"DH2C", "DHnC", "DH2Q", "DHnQ"};
f4ab0ca366e96a Namjae Jeon 2024-03-10  2648  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2649  	req_op_level = req->RequestedOplockLevel;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2650  	for (dh_idx = DURABLE_RECONN_V2; dh_idx <= ARRAY_SIZE(durable_arr);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2651  	     dh_idx++) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2652  		context = smb2_find_context_vals(req, durable_arr[dh_idx - 1], 4);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2653  		if (IS_ERR_OR_NULL(context)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10 @2654  			err = PTR_ERR(context);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2655  			if (err == -EINVAL)
f4ab0ca366e96a Namjae Jeon 2024-03-10  2656  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2657  			err = 0;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2658  			continue;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2659  		}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2660  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2661  		switch (dh_idx) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2662  		case DURABLE_RECONN_V2:
f4ab0ca366e96a Namjae Jeon 2024-03-10  2663  		{
f4ab0ca366e96a Namjae Jeon 2024-03-10  2664  			struct create_durable_reconn_v2_req *recon_v2;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2665  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2666  			if (dh_info->type == DURABLE_RECONN ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2667  			    dh_info->type == DURABLE_REQ_V2) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2668  				err = -EINVAL;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2669  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2670  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2671  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2672  			recon_v2 = (struct create_durable_reconn_v2_req *)context;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2673  			persistent_id = le64_to_cpu(recon_v2->Fid.PersistentFileId);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2674  			dh_info->fp = ksmbd_lookup_durable_fd(persistent_id);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2675  			if (!dh_info->fp) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2676  				ksmbd_debug(SMB, "Failed to get durable handle state\n");
f4ab0ca366e96a Namjae Jeon 2024-03-10  2677  				err = -EBADF;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2678  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2679  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2680  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2681  			if (memcmp(dh_info->fp->create_guid, recon_v2->CreateGuid,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2682  				   SMB2_CREATE_GUID_SIZE)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2683  				err = -EBADF;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2684  				ksmbd_put_durable_fd(dh_info->fp);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2685  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2686  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2687  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2688  			dh_info->type = dh_idx;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2689  			dh_info->reconnected = true;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2690  			ksmbd_debug(SMB,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2691  				"reconnect v2 Persistent-id from reconnect = %llu\n",
f4ab0ca366e96a Namjae Jeon 2024-03-10  2692  					persistent_id);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2693  			break;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2694  		}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2695  		case DURABLE_RECONN:
f4ab0ca366e96a Namjae Jeon 2024-03-10  2696  		{
f4ab0ca366e96a Namjae Jeon 2024-03-10  2697  			struct create_durable_reconn_req *recon;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2698  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2699  			if (dh_info->type == DURABLE_RECONN_V2 ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2700  			    dh_info->type == DURABLE_REQ_V2) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2701  				err = -EINVAL;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2702  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2703  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2704  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2705  			recon = (struct create_durable_reconn_req *)context;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2706  			persistent_id = le64_to_cpu(recon->Data.Fid.PersistentFileId);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2707  			dh_info->fp = ksmbd_lookup_durable_fd(persistent_id);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2708  			if (!dh_info->fp) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2709  				ksmbd_debug(SMB, "Failed to get durable handle state\n");
f4ab0ca366e96a Namjae Jeon 2024-03-10  2710  				err = -EBADF;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2711  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2712  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2713  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2714  			dh_info->type = dh_idx;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2715  			dh_info->reconnected = true;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2716  			ksmbd_debug(SMB, "reconnect Persistent-id from reconnect = %llu\n",
f4ab0ca366e96a Namjae Jeon 2024-03-10  2717  				    persistent_id);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2718  			break;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2719  		}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2720  		case DURABLE_REQ_V2:
f4ab0ca366e96a Namjae Jeon 2024-03-10  2721  		{
f4ab0ca366e96a Namjae Jeon 2024-03-10  2722  			struct create_durable_req_v2 *durable_v2_blob;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2723  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2724  			if (dh_info->type == DURABLE_RECONN ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2725  			    dh_info->type == DURABLE_RECONN_V2) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2726  				err = -EINVAL;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2727  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2728  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2729  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2730  			durable_v2_blob =
f4ab0ca366e96a Namjae Jeon 2024-03-10  2731  				(struct create_durable_req_v2 *)context;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2732  			ksmbd_debug(SMB, "Request for durable v2 open\n");
f4ab0ca366e96a Namjae Jeon 2024-03-10  2733  			dh_info->fp = ksmbd_lookup_fd_cguid(durable_v2_blob->CreateGuid);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2734  			if (dh_info->fp) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2735  				if (!memcmp(conn->ClientGUID, dh_info->fp->client_guid,
f4ab0ca366e96a Namjae Jeon 2024-03-10  2736  					    SMB2_CLIENT_GUID_SIZE)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2737  					if (!(req->hdr.Flags & SMB2_FLAGS_REPLAY_OPERATION)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2738  						err = -ENOEXEC;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2739  						goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2740  					}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2741  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2742  					dh_info->fp->conn = conn;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2743  					dh_info->reconnected = true;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2744  					goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2745  				}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2746  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2747  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2748  			if (((lc && (lc->req_state & SMB2_LEASE_HANDLE_CACHING_LE)) ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2749  			     req_op_level == SMB2_OPLOCK_LEVEL_BATCH)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2750  				dh_info->CreateGuid =
f4ab0ca366e96a Namjae Jeon 2024-03-10  2751  					durable_v2_blob->CreateGuid;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2752  				dh_info->persistent =
f4ab0ca366e96a Namjae Jeon 2024-03-10  2753  					le32_to_cpu(durable_v2_blob->Flags);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2754  				dh_info->timeout =
f4ab0ca366e96a Namjae Jeon 2024-03-10  2755  					le32_to_cpu(durable_v2_blob->Timeout);
f4ab0ca366e96a Namjae Jeon 2024-03-10  2756  				dh_info->type = dh_idx;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2757  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2758  			break;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2759  		}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2760  		case DURABLE_REQ:
f4ab0ca366e96a Namjae Jeon 2024-03-10  2761  			if (dh_info->type == DURABLE_RECONN)
f4ab0ca366e96a Namjae Jeon 2024-03-10  2762  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2763  			if (dh_info->type == DURABLE_RECONN_V2 ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2764  			    dh_info->type == DURABLE_REQ_V2) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2765  				err = -EINVAL;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2766  				goto out;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2767  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2768  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2769  			if (((lc && (lc->req_state & SMB2_LEASE_HANDLE_CACHING_LE)) ||
f4ab0ca366e96a Namjae Jeon 2024-03-10  2770  			     req_op_level == SMB2_OPLOCK_LEVEL_BATCH)) {
f4ab0ca366e96a Namjae Jeon 2024-03-10  2771  				ksmbd_debug(SMB, "Request for durable open\n");
f4ab0ca366e96a Namjae Jeon 2024-03-10  2772  				dh_info->type = dh_idx;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2773  			}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2774  		}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2775  	}
f4ab0ca366e96a Namjae Jeon 2024-03-10  2776  
f4ab0ca366e96a Namjae Jeon 2024-03-10  2777  out:
f4ab0ca366e96a Namjae Jeon 2024-03-10  2778  	return err;
f4ab0ca366e96a Namjae Jeon 2024-03-10  2779  }
f4ab0ca366e96a Namjae Jeon 2024-03-10  2780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
