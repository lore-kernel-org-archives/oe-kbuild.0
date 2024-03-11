Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E2747F
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710134216; cv=none; b=CQ3JqJnZKGxji8J1Ks0cBco2TGTeVdv0mPj6c41Lt7ZIsVwJBa0KUe5ZnarEDlx6nHOmf1hUZ0EI5sAtoOlCxKhv3cEb48F9wwIh/801rzP0is+ATZdcuOfsSUFPtyAuxixOiaxjvaRwV+biiSmBBy2d7M1PkZ5dOec7Igxg0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710134216; c=relaxed/simple;
	bh=60qHtYrS0Ksa6aSDj/S4jjrR/MC1NOdT9HznGlMvLes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxqnm1pTxJg0l+fO38yQ5MZ3RYMsgjy5bAojSJfmkKQwCtedt9AG3jRk+fS3uC/SAgGm1YmEgb/HFQoIqurRARA4bFXZc5pEzOWmj3CHxiLBfvf8F7SQfnPWnGFU/UD5rvyqM99CCL4FKJnULAdBK2Ube1DpkB+ywB6LEXehPcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHxTjlJi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHxTjlJi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e94c12f33so836600f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 22:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710134212; x=1710739012; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ek1Zi+hihLEVWBhehYF03ZpyvGMuyoS9rgUx9gnNTuQ=;
        b=AHxTjlJiO6VR2S0Xh7kRE8ERYDULVmXQYTEZzHXUOaFPChr8V0K/KFTPR/tv/SimZ+
         wiq6iD4QolN/b9JCQeb18c0QtB8gVmIfk9UzrYiCFxYnK3Ahsc7KjG6njj5o1Lf/Rj43
         wndV5lZ4mofsxZtO3gUlic6C3qCnmxe9HjCKEkEw49tmi/o5ijmdBL1qnOMnyL29WhS2
         SvfVkQs+5iEsJ6FfqOLXsj5zg6sTbXB64N19XD6I9XfcA5LMO1Ahfz5RIxQGiGKUYdAT
         Wmfc03rebnAR3XhqQtswqoSGNRGG4JQYh3vgVneKHKbUu2f+hdLyV/jiKbb+AcH1rg+g
         kb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710134212; x=1710739012;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek1Zi+hihLEVWBhehYF03ZpyvGMuyoS9rgUx9gnNTuQ=;
        b=NYIksLJ3nLkRGdKnpjAC6bSnOBF2sTNXqPKoN6syMZrQntkvQ07n7Sur7+F71r+FRz
         xJQ9ill9hVxFghcOzouaHpFg4HDiLhFzXZaDIxEuzCvRVotx/rQneVQEe01lka5ZZPqu
         IBj9swIRSO5on2I0gynhFKPq1ZEPKdA6iYNIEhD7Zws7uH8J14CSehDyw2ws8UGzhCaG
         XKVrK5/iwWyRfYMT+gsVVxaqt2wlr0++Ultpejj0HYaPJpUg/b53Tgbbv/phGO/gyCgf
         1iLXO1WDTI00c5psIWucehO/pHmBKwk/a3em2tYRBiJjA6rPPWSBp+Mn9D5u/Gg0eWjK
         qmQA==
X-Gm-Message-State: AOJu0YygAM6U4kFIik3fNYK6MM4Adqjjt38PmRV+OoGxeZi+U0u9Z/5u
	0pbAl+NPwuiQMOCPQrzPRDUq38OkoyhnWRAnTY+Q6Vs9GFLB2zo614bchL6dqbak6lwU0mXM0kZ
	m
X-Google-Smtp-Source: AGHT+IGndmYAMqw7Y/83wk/khGxdRLkfIE044XfuVd6vNKX1ZvOzw5DnQk6+X8rwuwzcM5sxA/vffg==
X-Received: by 2002:a05:6000:230:b0:33e:96ba:2d48 with SMTP id l16-20020a056000023000b0033e96ba2d48mr808089wrz.57.1710134211588;
        Sun, 10 Mar 2024 22:16:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f13-20020adfb60d000000b0033e43756d11sm5376311wre.85.2024.03.10.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:16:51 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:16:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/smb2pdu.c:2654
 parse_durable_handle_context() warn: passing zero to 'PTR_ERR'
Message-ID: <cd61edb3-b938-42e9-b9c3-d5c05827b4e1@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   f4ab0ca366e96a297b511d020a7fcd212f0268c9
commit: f4ab0ca366e96a297b511d020a7fcd212f0268c9 [4/4] ksmbd: add support for durable handles v1/v2
config: i386-randconfig-141-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110538.jBX2iDwP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403110538.jBX2iDwP-lkp@intel.com/

smatch warnings:
fs/smb/server/smb2pdu.c:2654 parse_durable_handle_context() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2654 fs/smb/server/smb2pdu.c

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

The smb2_find_context_vals() return ERR_PTR(-EINVAL) on error or NULL on
not found.  But you're not doing yourself a favor to write it this way...
It's confusing to the reader and what about if we add new error codes?
Better to write it like:

		context = smb2_find_context_vals(req, durable_arr[dh_idx - 1], 4);
		if (IS_ERR(context)) {
			err = PTR_ERR(context);
			goto out;
		}
		if (!context)
			continue;

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

