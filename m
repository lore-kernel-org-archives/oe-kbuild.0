Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA392565;
	Mon,  7 Nov 2022 07:48:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id h9so14921339wrt.0;
        Sun, 06 Nov 2022 23:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1jSgj+U/oKtaUwAKWdJ0q9enxrmXsa4MWrdIDPYzjo=;
        b=YwB1XtYslLRT+McdZxUKV8yMM4nmOwfu0SWqcHcFyHZRzqC3CR1yDxEnbBhQhBbjbT
         TklYKnvLtsMtVFk9qhnwLTnVGJ0dWpn1l7zQxaUOEoIyywFshy+dZ2xjHAK22bzuocuk
         RkoPnXDIrpBo8Usygsjo2qMg3LVnUlomg7t2714EWbM0CbrCbbC79p/cNioQn0MNSSA/
         GllxnGVZls4gUCvuMoILe8u/r/qjLa/9ZNqSZ36gscBHKLF1VQTEk8FPbD0meaSKYVoU
         v+lleHze+8TwEXJpXjTc6xd1H+M1tlNfxMhH5MAR/ww5NYCjvhMSZBp1mHW2tZKeP7Hk
         quvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1jSgj+U/oKtaUwAKWdJ0q9enxrmXsa4MWrdIDPYzjo=;
        b=cr7bo32tbwQ64nMCwGLlj4out4T/l5EgHJi7/v6AS3li7bvN+hUjpc8sHv0tGtWoo1
         RqcXRcKRm2HspbLfRROVim4T2rPD63EWg8B0vohdVaCFcmAnPzlylaKWlAKkVNaMfH5r
         euLM3LJk8G5kFRcwCqe6dnIdTFVLBhKY+XxZ9574vpH69wubWRyCcoOi9dyaHqVlen+4
         NaOGZvaLeKwRqHYsB9OzqWb1afJBZjMJb0zFyaqFHQuXAhMvzDDqmKQpF4I98Ay54CSu
         n+j2u8YBuFU5d+AFoRxZ0izUWw5YIYRWsVr3n0YFtSr1vs/In3OzD0d93VOmYLKV+L07
         k+YQ==
X-Gm-Message-State: ACrzQf0Ep0iJ28XOh4Fcz19LTV57NljHeMJaE74Ir+W6BKyB31Qk5oT0
	bjm0u/hG71Z8VxXu+0yH/cE=
X-Google-Smtp-Source: AMsMyM7pgVeuWyX0WAdA8dyzBSWxvK9Sdd171FLRVAi/fD0R8nx5LC8yte9TNyXAEVfdJCoqdEdW9Q==
X-Received: by 2002:a5d:59af:0:b0:236:6b90:1e65 with SMTP id p15-20020a5d59af000000b002366b901e65mr30272621wrr.362.1667807293295;
        Sun, 06 Nov 2022 23:48:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fc15-20020a05600c524f00b003cf57329221sm11571562wmb.14.2022.11.06.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 23:48:12 -0800 (PST)
Date: Mon, 7 Nov 2022 10:48:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	Jeff Layton <jlayton@kernel.org>, "lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: fs/nfsd/filecache.c:1118 nfsd_file_do_acquire() warn: passing
 freed memory 'nf'
Message-ID: <Y2i4Olz9GHpO02bP@kadam>
References: <202211051543.2bnSgTQW-lkp@intel.com>
 <6F00D08C-6D94-486A-A3F2-B11C9FF5E9E2@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6F00D08C-6D94-486A-A3F2-B11C9FF5E9E2@oracle.com>

On Sat, Nov 05, 2022 at 03:39:59PM +0000, Chuck Lever III wrote:
> 
> 
> > On Nov 5, 2022, at 7:17 AM, Dan Carpenter <error27@gmail.com> wrote:
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b208b9fbbcba743fb269d15cb46a4036b01936b1
> > commit: 243a5263014a30436c93ed3f1f864c1da845455e nfsd: rework hashtable handling in nfsd_do_file_acquire
> > config: alpha-randconfig-m041-20221030
> > compiler: alpha-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > fs/nfsd/filecache.c:1118 nfsd_file_do_acquire() warn: passing freed memory 'nf'
> > 
> > vim +/nf +1118 fs/nfsd/filecache.c
> > 
> > fb70bf124b051d Chuck Lever     2022-03-30  1036  static __be32
> > be0230069fcbf7 Chuck Lever     2022-07-08  1037  nfsd_file_do_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
> > fb70bf124b051d Chuck Lever     2022-03-30  1038  		     unsigned int may_flags, struct nfsd_file **pnf, bool open)
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1039  {
> > ce502f81ba884c Chuck Lever     2022-07-08  1040  	struct nfsd_file_lookup_key key = {
> > ce502f81ba884c Chuck Lever     2022-07-08  1041  		.type	= NFSD_FILE_KEY_FULL,
> > ce502f81ba884c Chuck Lever     2022-07-08  1042  		.need	= may_flags & NFSD_FILE_MAY_MASK,
> > ce502f81ba884c Chuck Lever     2022-07-08  1043  		.net	= SVC_NET(rqstp),
> > ce502f81ba884c Chuck Lever     2022-07-08  1044  	};
> > 243a5263014a30 Jeff Layton     2022-10-04  1045  	bool open_retry = true;
> > 243a5263014a30 Jeff Layton     2022-10-04  1046  	struct nfsd_file *nf;
> > ce502f81ba884c Chuck Lever     2022-07-08  1047  	__be32 status;
> > 243a5263014a30 Jeff Layton     2022-10-04  1048  	int ret;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1049  
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1050  	status = fh_verify(rqstp, fhp, S_IFREG,
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1051  				may_flags|NFSD_MAY_OWNER_OVERRIDE);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1052  	if (status != nfs_ok)
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1053  		return status;
> > ce502f81ba884c Chuck Lever     2022-07-08  1054  	key.inode = d_inode(fhp->fh_dentry);
> > ce502f81ba884c Chuck Lever     2022-07-08  1055  	key.cred = get_current_cred();
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1056  
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1057  retry:
> > 243a5263014a30 Jeff Layton     2022-10-04  1058  	rcu_read_lock();
> > 243a5263014a30 Jeff Layton     2022-10-04  1059  	nf = rhashtable_lookup(&nfsd_file_rhash_tbl, &key,
> > ce502f81ba884c Chuck Lever     2022-07-08  1060  			       nfsd_file_rhash_params);
> > ce502f81ba884c Chuck Lever     2022-07-08  1061  	if (nf)
> > ce502f81ba884c Chuck Lever     2022-07-08  1062  		nf = nfsd_file_get(nf);
> > 243a5263014a30 Jeff Layton     2022-10-04  1063  	rcu_read_unlock();
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1064  	if (nf)
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1065  		goto wait_for_construction;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1066  
> > 243a5263014a30 Jeff Layton     2022-10-04  1067  	nf = nfsd_file_alloc(&key, may_flags);
> > 243a5263014a30 Jeff Layton     2022-10-04  1068  	if (!nf) {
> > 54f7df7094b329 Chuck Lever     2022-07-08  1069  		status = nfserr_jukebox;
> > 54f7df7094b329 Chuck Lever     2022-07-08  1070  		goto out_status;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1071  	}
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1072  
> > 243a5263014a30 Jeff Layton     2022-10-04  1073  	ret = rhashtable_lookup_insert_key(&nfsd_file_rhash_tbl,
> > 243a5263014a30 Jeff Layton     2022-10-04  1074  					   &key, &nf->nf_rhash,
> > ce502f81ba884c Chuck Lever     2022-07-08  1075  					   nfsd_file_rhash_params);
> > 243a5263014a30 Jeff Layton     2022-10-04  1076  	if (likely(ret == 0))
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1077  		goto open_file;
> > 243a5263014a30 Jeff Layton     2022-10-04  1078  
> > 243a5263014a30 Jeff Layton     2022-10-04  1079  	nfsd_file_slab_free(&nf->nf_rcu);
> > 243a5263014a30 Jeff Layton     2022-10-04  1080  	if (ret == -EEXIST)
> > 243a5263014a30 Jeff Layton     2022-10-04  1081  		goto retry;
> > 243a5263014a30 Jeff Layton     2022-10-04  1082  	trace_nfsd_file_insert_err(rqstp, key.inode, may_flags, ret);
> > 243a5263014a30 Jeff Layton     2022-10-04  1083  	status = nfserr_jukebox;
> > 243a5263014a30 Jeff Layton     2022-10-04  1084  	goto out_status;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1085  
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1086  wait_for_construction:
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1087  	wait_on_bit(&nf->nf_flags, NFSD_FILE_PENDING, TASK_UNINTERRUPTIBLE);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1088  
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1089  	/* Did construction of this file fail? */
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1090  	if (!test_bit(NFSD_FILE_HASHED, &nf->nf_flags)) {
> > ce502f81ba884c Chuck Lever     2022-07-08  1091  		trace_nfsd_file_cons_err(rqstp, key.inode, may_flags, nf);
> > 243a5263014a30 Jeff Layton     2022-10-04  1092  		if (!open_retry) {
> > 28c7d86bb6172f Trond Myklebust 2020-01-06  1093  			status = nfserr_jukebox;
> > 28c7d86bb6172f Trond Myklebust 2020-01-06  1094  			goto out;
> > 28c7d86bb6172f Trond Myklebust 2020-01-06  1095  		}
> > 243a5263014a30 Jeff Layton     2022-10-04  1096  		open_retry = false;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1097  		nfsd_file_put_noref(nf);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1098  		goto retry;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1099  	}
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1100  
> > 4a0e73e635e3f3 Chuck Lever     2022-07-08  1101  	nfsd_file_lru_remove(nf);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1102  	this_cpu_inc(nfsd_file_cache_hits);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1103  
> > 23ba98de6dcec6 Jeff Layton     2022-07-29  1104  	status = nfserrno(nfsd_open_break_lease(file_inode(nf->nf_file), may_flags));
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1105  out:
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1106  	if (status == nfs_ok) {
> > 29d4bdbbb910f3 Chuck Lever     2022-07-08  1107  		if (open)
> > 29d4bdbbb910f3 Chuck Lever     2022-07-08  1108  			this_cpu_inc(nfsd_file_acquisitions);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1109  		*pnf = nf;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1110  	} else {
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1111  		nfsd_file_put(nf);
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1112  		nf = NULL;
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1113  	}
> > 65294c1f2c5e72 Jeff Layton     2019-08-18  1114  
> > 54f7df7094b329 Chuck Lever     2022-07-08  1115  out_status:
> > ce502f81ba884c Chuck Lever     2022-07-08  1116  	put_cred(key.cred);
> > be0230069fcbf7 Chuck Lever     2022-07-08  1117  	if (open)
> > ce502f81ba884c Chuck Lever     2022-07-08 @1118  		trace_nfsd_file_acquire(rqstp, key.inode, may_flags, nf, status);
> > 
> > Passing freed pointers to the trace code is a border line case...  Not
> > sure if we care.
> 
> Speaking only for NFSD, let me echo Jeff and say yes, we care.
> 
> In general, I think Linux users/customers and of course our fellow
> sustaining engineers want to feel confident that enabling tracing
> on a production kernel isn't going to result in less stability.
> 
> Thanks for the report!

Your welcome.  What I meant was that it's only a problem if we
dereference the pointer...  (I haven't used tracing output so I wasn't
sure on this).

regards,
dan carpenter

