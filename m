Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A870DF55
	for <oe-kbuild@lists.linux.dev>; Thu, 25 May 2023 11:00:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso2285355e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 25 May 2023 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685012455; x=1687604455;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rqj2R5VuSBSRdprNafoMq6sDP8E5u1nhquT0491/zR0=;
        b=UWaQ/DLvg6GBwBG95pq+jSlhge41cxXvyoXJRnaPl6cag6kx3tH4FqJ9xxnRSorPqP
         mx9HqsNnjSd0/KQ5jr4OsNZsKbgBypPCjCY8yRmJeDjFc1P+uEcmoy/griA4x8HPuckz
         wq3lCzygXk2hw7lvQsny56RMLvb7eOHIzhf8aFtdsu44EXeNAf8DePCQ9ubS4aSKyNoz
         kFFES7CkyUwHTX3L5/clG+CoNfj+kjFT5PGpuZ6Pvh4DysorBneAAW/7ypXcCMriRJUw
         hVNKYaFuWuD5uHFKe9wj/zEvRfyQ5P4faJgxHrH5K9uSMbOHWsCjizqwaBQLDAB+yT7u
         bqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685012455; x=1687604455;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqj2R5VuSBSRdprNafoMq6sDP8E5u1nhquT0491/zR0=;
        b=AdaSU3P4I65aCnxAmC6n2NW6AYauO0F0VRYzJgwjKIGdJri01ff4kpEMhhvjwZdLpr
         5x0iFwOgTfI59YTrOc4ZVNHtCUBrAUQEiQcxhVNpAOlEFwf+MxQVCAbDftK3KE60lso9
         +jAzgIFbt7sc7M/CBdwk/HTMeBeggLZpjeOH1q47JEnXnXhoPtUipP2EoXOf+vngqHiu
         aupM0qirt/PJxyZ6LKZquk8fIMftAQ/N4TzPSNp3yRt7fLS9vGVsczomjHuWXmuw5Bky
         EMm/tOALiBxYLnK0ZDwKmdzcuESGObE4k9XdMfyRrzBdqXUEfUMhB4kg/SYAjOKe8HvD
         k3cg==
X-Gm-Message-State: AC+VfDzUaDoFDDjSCp2NZlim/wl5POTZdxfUddG1rVvct5LCeE7wKh1W
	CY9QNvE2D0xPThpr4Q76ekvcpDsgnseiGpaIySg=
X-Google-Smtp-Source: ACHHUZ6Fr60njcI441sX3QpCS+yHPq/OFN8icALR4CLyEhKbR8qUJzj0BYvbTmuK0ysSpWSyeryIzg==
X-Received: by 2002:a05:600c:228e:b0:3f6:2ee:699d with SMTP id 14-20020a05600c228e00b003f602ee699dmr2112722wmf.37.1685012455191;
        Thu, 25 May 2023 04:00:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g5-20020a5d5405000000b0030aa8f15c57sm1429410wrv.68.2023.05.25.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 04:00:52 -0700 (PDT)
Date: Thu, 25 May 2023 14:00:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steve French <stfrench@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4604/4815] fs/smb/client/smb2pdu.c:3729
 SMB2_change_notify() error: we previously assumed 'plen' could be null (see
 line 3688)
Message-ID: <6e3c1bbf-72c5-4433-a80e-a897c563ab38@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d [4604/4815] smb: move client and server files to common directory fs/smb
config: x86_64-randconfig-m001-20230524
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305251831.3V1gbbFs-lkp@intel.com/

smatch warnings:
fs/smb/client/smb2pdu.c:3729 SMB2_change_notify() error: we previously assumed 'plen' could be null (see line 3688)
fs/smb/client/cifssmb.c:4089 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4216 CIFSFindNext() warn: missing error code? 'rc'

vim +/plen +3729 fs/smb/client/smb2pdu.c

c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3663  int
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3664  SMB2_change_notify(const unsigned int xid, struct cifs_tcon *tcon,
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3665  		u64 persistent_fid, u64 volatile_fid, bool watch_tree,
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3666  		u32 completion_filter, u32 max_out_data_len, char **out_data,
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3667  		u32 *plen /* returned data len */)
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3668  {
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3669  	struct cifs_ses *ses = tcon->ses;
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3670  	struct TCP_Server_Info *server = cifs_pick_channel(ses);
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3671  	struct smb_rqst rqst;
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3672  	struct smb2_change_notify_rsp *smb_rsp;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3673  	struct kvec iov[1];
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3674  	struct kvec rsp_iov = {NULL, 0};
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3675  	int resp_buftype = CIFS_NO_BUFFER;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3676  	int flags = 0;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3677  	int rc = 0;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3678  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3679  	cifs_dbg(FYI, "change notify\n");
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3680  	if (!ses || !server)
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3681  		return -EIO;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3682  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3683  	if (smb3_encryption_required(tcon))
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3684  		flags |= CIFS_TRANSFORM_REQ;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3685  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3686  	memset(&rqst, 0, sizeof(struct smb_rqst));
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3687  	memset(&iov, 0, sizeof(iov));
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15 @3688  	if (plen)

This assume "plen" can be NULL.

e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3689  		*plen = 0;
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3690  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3691  	rqst.rq_iov = iov;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3692  	rqst.rq_nvec = 1;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3693  
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3694  	rc = SMB2_notify_init(xid, &rqst, tcon, server,
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3695  			      persistent_fid, volatile_fid,
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3696  			      completion_filter, watch_tree);
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3697  	if (rc)
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3698  		goto cnotify_exit;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3699  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3700  	trace_smb3_notify_enter(xid, persistent_fid, tcon->tid, ses->Suid,
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3701  				(u8)watch_tree, completion_filter);
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3702  	rc = cifs_send_recv(xid, ses, server,
352d96f3acc6e0 fs/cifs/smb2pdu.c Aurelien Aptel 2020-05-31  3703  			    &rqst, &resp_buftype, flags, &rsp_iov);
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3704  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3705  	if (rc != 0) {
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3706  		cifs_stats_fail_inc(tcon, SMB2_CHANGE_NOTIFY_HE);
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3707  		trace_smb3_notify_err(xid, persistent_fid, tcon->tid, ses->Suid,
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3708  				(u8)watch_tree, completion_filter, rc);
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3709  	} else {
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3710  		trace_smb3_notify_done(xid, persistent_fid, tcon->tid,
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3711  			ses->Suid, (u8)watch_tree, completion_filter);
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3712  		/* validate that notify information is plausible */
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3713  		if ((rsp_iov.iov_base == NULL) ||
eb3e28c1e89b49 fs/cifs/smb2pdu.c Kees Cook      2023-02-17  3714  		    (rsp_iov.iov_len < sizeof(struct smb2_change_notify_rsp) + 1))
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3715  			goto cnotify_exit;

Is this an error path?  It returns success.

e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3716  
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3717  		smb_rsp = (struct smb2_change_notify_rsp *)rsp_iov.iov_base;
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3718  
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3719  		smb2_validate_iov(le16_to_cpu(smb_rsp->OutputBufferOffset),
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3720  				le32_to_cpu(smb_rsp->OutputBufferLength), &rsp_iov,
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3721  				sizeof(struct file_notify_information));
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3722  
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3723  		*out_data = kmemdup((char *)smb_rsp + le16_to_cpu(smb_rsp->OutputBufferOffset),
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3724  				le32_to_cpu(smb_rsp->OutputBufferLength), GFP_KERNEL);
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3725  		if (*out_data == NULL) {
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3726  			rc = -ENOMEM;
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3727  			goto cnotify_exit;
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3728  		} else
e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15 @3729  			*plen = le32_to_cpu(smb_rsp->OutputBufferLength);

But this dereferences it without checking.

e3e9463414f610 fs/cifs/smb2pdu.c Steve French   2022-10-15  3730  	}
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3731  
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3732   cnotify_exit:
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3733  	if (rqst.rq_iov)
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3734  		cifs_small_buf_release(rqst.rq_iov[0].iov_base); /* request */
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3735  	free_rsp_buf(resp_buftype, rsp_iov.iov_base);
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3736  	return rc;
c3498185b7898d fs/cifs/smb2pdu.c Steve French   2019-09-15  3737  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

