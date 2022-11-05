Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A51FBE;
	Sat,  5 Nov 2022 11:17:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id o4so10162390wrq.6;
        Sat, 05 Nov 2022 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Si94ZMOqZApo/tqZlFfwM+8QQ9+VSKuozugTWexiopk=;
        b=FZudOjhTEyATx22mqCzPBdqZtdiLw/ZQsxDbUYQg69eVMJVEkDv8KkdbJyOG1RnjaX
         t8U/rcjRHgUT8+Ksq47CcJQNfeLU0iOwRfct/eTPJXeqZZZ8USvyDs+if1b7hc3ANjFw
         TC82ULBhqqmB9ixGrN6bjdWuBXS8wFlTe3bRY7hMHPETh2gEM5W7kz0Fob4bwrl6JEc4
         NchrkQ5nw5EQM+cnvAorTtUtgdwkNqtUKjFrLsT3ifMU7ZOXMqOyWmARiZaffjELwsLu
         0NToNfY+DzLHr3uKsc32qHjsFQQ4xj2D/FP28qUnta/FzRUptfRpGguDajTCe0DWBIab
         3ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Si94ZMOqZApo/tqZlFfwM+8QQ9+VSKuozugTWexiopk=;
        b=btSCzzAGo7uyEEmVYO3vtI4e8zOlUOm0HO0WoR1+PXpT8V3UiJ5tTSx+Bbhe4Q+lO1
         AAfFFCBxn/7bJ2Ddklav5OewqRZZcmKx9HtYRpHiZNM6ImsQm7eo1qE0O0aPXGnK6Wmu
         FgdQ+Na3tEB94P6oEpdIBt0xodAg1x/tuuFPV454kOIpmcI7/forIDG/gwHVNXVsXD7x
         jGCn76pePXXtzKPh9tVttq1q5COc4mJSvPVDWYIdLPfDKxm1NWfGDTXj/2PHCPn+Ghyi
         3ddMwkAwE8EKdt5OhVrV15YSfFK9wQCW9twcauXeRCVvdSM0vVVpeupAFIRX7Cp1tmvj
         WYNQ==
X-Gm-Message-State: ACrzQf1ejtdP3tMbPqT6rw0BM0XoTd3A76qifjOgjRy+OU5zWxVpIC6x
	3nOf4NLTFRvv3P7tTIz8nGoDLvLrfQk=
X-Google-Smtp-Source: AMsMyM4nf41/lp9JammxVZcK55Sf6kQmNHZsIlvqeE93InYqSuQbXAypyCRg/dLIMwdLm6lU/y1PwA==
X-Received: by 2002:adf:feca:0:b0:236:b258:c19b with SMTP id q10-20020adffeca000000b00236b258c19bmr25022844wrs.57.1667647069528;
        Sat, 05 Nov 2022 04:17:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c320800b003b4935f04a4sm2533392wmp.5.2022.11.05.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 04:17:49 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:17:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>
Subject: fs/nfsd/filecache.c:1118 nfsd_file_do_acquire() warn: passing freed
 memory 'nf'
Message-ID: <202211051543.2bnSgTQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221105111746.l-Jd9kMT02a0NL3NpGX4PBeH3yrC0dyXtJNwqYcOZao@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b208b9fbbcba743fb269d15cb46a4036b01936b1
commit: 243a5263014a30436c93ed3f1f864c1da845455e nfsd: rework hashtable handling in nfsd_do_file_acquire
config: alpha-randconfig-m041-20221030
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/nfsd/filecache.c:1118 nfsd_file_do_acquire() warn: passing freed memory 'nf'

vim +/nf +1118 fs/nfsd/filecache.c

fb70bf124b051d Chuck Lever     2022-03-30  1036  static __be32
be0230069fcbf7 Chuck Lever     2022-07-08  1037  nfsd_file_do_acquire(struct svc_rqst *rqstp, struct svc_fh *fhp,
fb70bf124b051d Chuck Lever     2022-03-30  1038  		     unsigned int may_flags, struct nfsd_file **pnf, bool open)
65294c1f2c5e72 Jeff Layton     2019-08-18  1039  {
ce502f81ba884c Chuck Lever     2022-07-08  1040  	struct nfsd_file_lookup_key key = {
ce502f81ba884c Chuck Lever     2022-07-08  1041  		.type	= NFSD_FILE_KEY_FULL,
ce502f81ba884c Chuck Lever     2022-07-08  1042  		.need	= may_flags & NFSD_FILE_MAY_MASK,
ce502f81ba884c Chuck Lever     2022-07-08  1043  		.net	= SVC_NET(rqstp),
ce502f81ba884c Chuck Lever     2022-07-08  1044  	};
243a5263014a30 Jeff Layton     2022-10-04  1045  	bool open_retry = true;
243a5263014a30 Jeff Layton     2022-10-04  1046  	struct nfsd_file *nf;
ce502f81ba884c Chuck Lever     2022-07-08  1047  	__be32 status;
243a5263014a30 Jeff Layton     2022-10-04  1048  	int ret;
65294c1f2c5e72 Jeff Layton     2019-08-18  1049  
65294c1f2c5e72 Jeff Layton     2019-08-18  1050  	status = fh_verify(rqstp, fhp, S_IFREG,
65294c1f2c5e72 Jeff Layton     2019-08-18  1051  				may_flags|NFSD_MAY_OWNER_OVERRIDE);
65294c1f2c5e72 Jeff Layton     2019-08-18  1052  	if (status != nfs_ok)
65294c1f2c5e72 Jeff Layton     2019-08-18  1053  		return status;
ce502f81ba884c Chuck Lever     2022-07-08  1054  	key.inode = d_inode(fhp->fh_dentry);
ce502f81ba884c Chuck Lever     2022-07-08  1055  	key.cred = get_current_cred();
65294c1f2c5e72 Jeff Layton     2019-08-18  1056  
65294c1f2c5e72 Jeff Layton     2019-08-18  1057  retry:
243a5263014a30 Jeff Layton     2022-10-04  1058  	rcu_read_lock();
243a5263014a30 Jeff Layton     2022-10-04  1059  	nf = rhashtable_lookup(&nfsd_file_rhash_tbl, &key,
ce502f81ba884c Chuck Lever     2022-07-08  1060  			       nfsd_file_rhash_params);
ce502f81ba884c Chuck Lever     2022-07-08  1061  	if (nf)
ce502f81ba884c Chuck Lever     2022-07-08  1062  		nf = nfsd_file_get(nf);
243a5263014a30 Jeff Layton     2022-10-04  1063  	rcu_read_unlock();
65294c1f2c5e72 Jeff Layton     2019-08-18  1064  	if (nf)
65294c1f2c5e72 Jeff Layton     2019-08-18  1065  		goto wait_for_construction;
65294c1f2c5e72 Jeff Layton     2019-08-18  1066  
243a5263014a30 Jeff Layton     2022-10-04  1067  	nf = nfsd_file_alloc(&key, may_flags);
243a5263014a30 Jeff Layton     2022-10-04  1068  	if (!nf) {
54f7df7094b329 Chuck Lever     2022-07-08  1069  		status = nfserr_jukebox;
54f7df7094b329 Chuck Lever     2022-07-08  1070  		goto out_status;
65294c1f2c5e72 Jeff Layton     2019-08-18  1071  	}
65294c1f2c5e72 Jeff Layton     2019-08-18  1072  
243a5263014a30 Jeff Layton     2022-10-04  1073  	ret = rhashtable_lookup_insert_key(&nfsd_file_rhash_tbl,
243a5263014a30 Jeff Layton     2022-10-04  1074  					   &key, &nf->nf_rhash,
ce502f81ba884c Chuck Lever     2022-07-08  1075  					   nfsd_file_rhash_params);
243a5263014a30 Jeff Layton     2022-10-04  1076  	if (likely(ret == 0))
65294c1f2c5e72 Jeff Layton     2019-08-18  1077  		goto open_file;
243a5263014a30 Jeff Layton     2022-10-04  1078  
243a5263014a30 Jeff Layton     2022-10-04  1079  	nfsd_file_slab_free(&nf->nf_rcu);
243a5263014a30 Jeff Layton     2022-10-04  1080  	if (ret == -EEXIST)
243a5263014a30 Jeff Layton     2022-10-04  1081  		goto retry;
243a5263014a30 Jeff Layton     2022-10-04  1082  	trace_nfsd_file_insert_err(rqstp, key.inode, may_flags, ret);
243a5263014a30 Jeff Layton     2022-10-04  1083  	status = nfserr_jukebox;
243a5263014a30 Jeff Layton     2022-10-04  1084  	goto out_status;
65294c1f2c5e72 Jeff Layton     2019-08-18  1085  
65294c1f2c5e72 Jeff Layton     2019-08-18  1086  wait_for_construction:
65294c1f2c5e72 Jeff Layton     2019-08-18  1087  	wait_on_bit(&nf->nf_flags, NFSD_FILE_PENDING, TASK_UNINTERRUPTIBLE);
65294c1f2c5e72 Jeff Layton     2019-08-18  1088  
65294c1f2c5e72 Jeff Layton     2019-08-18  1089  	/* Did construction of this file fail? */
65294c1f2c5e72 Jeff Layton     2019-08-18  1090  	if (!test_bit(NFSD_FILE_HASHED, &nf->nf_flags)) {
ce502f81ba884c Chuck Lever     2022-07-08  1091  		trace_nfsd_file_cons_err(rqstp, key.inode, may_flags, nf);
243a5263014a30 Jeff Layton     2022-10-04  1092  		if (!open_retry) {
28c7d86bb6172f Trond Myklebust 2020-01-06  1093  			status = nfserr_jukebox;
28c7d86bb6172f Trond Myklebust 2020-01-06  1094  			goto out;
28c7d86bb6172f Trond Myklebust 2020-01-06  1095  		}
243a5263014a30 Jeff Layton     2022-10-04  1096  		open_retry = false;
65294c1f2c5e72 Jeff Layton     2019-08-18  1097  		nfsd_file_put_noref(nf);
65294c1f2c5e72 Jeff Layton     2019-08-18  1098  		goto retry;
65294c1f2c5e72 Jeff Layton     2019-08-18  1099  	}
65294c1f2c5e72 Jeff Layton     2019-08-18  1100  
4a0e73e635e3f3 Chuck Lever     2022-07-08  1101  	nfsd_file_lru_remove(nf);
65294c1f2c5e72 Jeff Layton     2019-08-18  1102  	this_cpu_inc(nfsd_file_cache_hits);
65294c1f2c5e72 Jeff Layton     2019-08-18  1103  
23ba98de6dcec6 Jeff Layton     2022-07-29  1104  	status = nfserrno(nfsd_open_break_lease(file_inode(nf->nf_file), may_flags));
65294c1f2c5e72 Jeff Layton     2019-08-18  1105  out:
65294c1f2c5e72 Jeff Layton     2019-08-18  1106  	if (status == nfs_ok) {
29d4bdbbb910f3 Chuck Lever     2022-07-08  1107  		if (open)
29d4bdbbb910f3 Chuck Lever     2022-07-08  1108  			this_cpu_inc(nfsd_file_acquisitions);
65294c1f2c5e72 Jeff Layton     2019-08-18  1109  		*pnf = nf;
65294c1f2c5e72 Jeff Layton     2019-08-18  1110  	} else {
65294c1f2c5e72 Jeff Layton     2019-08-18  1111  		nfsd_file_put(nf);
65294c1f2c5e72 Jeff Layton     2019-08-18  1112  		nf = NULL;
65294c1f2c5e72 Jeff Layton     2019-08-18  1113  	}
65294c1f2c5e72 Jeff Layton     2019-08-18  1114  
54f7df7094b329 Chuck Lever     2022-07-08  1115  out_status:
ce502f81ba884c Chuck Lever     2022-07-08  1116  	put_cred(key.cred);
be0230069fcbf7 Chuck Lever     2022-07-08  1117  	if (open)
ce502f81ba884c Chuck Lever     2022-07-08 @1118  		trace_nfsd_file_acquire(rqstp, key.inode, may_flags, nf, status);

Passing freed pointers to the trace code is a border line case...  Not
sure if we care.

65294c1f2c5e72 Jeff Layton     2019-08-18  1119  	return status;
65294c1f2c5e72 Jeff Layton     2019-08-18  1120  
65294c1f2c5e72 Jeff Layton     2019-08-18  1121  open_file:
b40a2839470cd6 Chuck Lever     2022-07-08  1122  	trace_nfsd_file_alloc(nf);
427f5f83a3191c Chuck Lever     2022-07-08  1123  	nf->nf_mark = nfsd_file_mark_find_or_create(nf, key.inode);
fb70bf124b051d Chuck Lever     2022-03-30  1124  	if (nf->nf_mark) {
0122e882119ddb Chuck Lever     2022-03-27  1125  		if (open) {
f4d84c52643ae1 Chuck Lever     2022-03-27  1126  			status = nfsd_open_verified(rqstp, fhp, may_flags,
f4d84c52643ae1 Chuck Lever     2022-03-27  1127  						    &nf->nf_file);
0122e882119ddb Chuck Lever     2022-03-27  1128  			trace_nfsd_file_open(nf, status);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

