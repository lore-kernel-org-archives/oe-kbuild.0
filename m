Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC753D61;
	Sat, 24 Dec 2022 19:32:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z10so7218225wrh.10;
        Sat, 24 Dec 2022 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHrRohmk/5EGSbpuO2EUylcjcCywmL92fXUxzNQ0Csw=;
        b=MxjVDRWr9YThi0H3PTH1GZDUmmecyqj5F11rD+AYeRSY+mW/kXkP+DcMuoNUmzT9p8
         EIofoWM72Oek8+61PEYg8kP3I6imuULEA5xiy6KgJVZNF5sZ46wjTwN4bzIn98GXQOcG
         auuLRA+HzkP4kKufniGyHhG3jMdBYM6ZfIt2oZ4G2vbpfBcgkS1IH1p4oyApxONoBZlN
         0GhgNydbN49qVh7A3Sn8NdqTPmFjg4xEo0+HQ3QNn/4Y6LAMbHBdq6gFVL31pROJpiXE
         4K0hq19KgXrQkwWmY2sp5dclCqs44VB5ziAbhch/wFptRmWSN7ZWbao4m7bOhUNtOIbN
         Pcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHrRohmk/5EGSbpuO2EUylcjcCywmL92fXUxzNQ0Csw=;
        b=0UU9WbxbH74WwJTcJz7+2DRWkEzjYOorJKeNgtj4yWlICU8R56KkOCakOs2i0cOGCq
         Vk8ltwVzr349CCFVhpNd43ACrWwtPk3Du5U5eWD0/Nj+pGyAAs3KcfijVyxWfZ8W+ziW
         79Mv69TkhKjvL8CKbbuYg4Sc03uxA787mpZlm0Bw5A2qHDTOML82QZ3kxLTipfl+Qu3e
         /AqCPp0TOYiY9Q7JGZHYPetRgOfLfx1lMXJzaQQ+DJCyKXZV6JrPzymTNHHjVwQHMcB0
         V2sg+Id/NeUeL9BLAlOz83dEHRFSsPlVA81Cd57Nz14QQuRhlDbdsgs6dGvq3M/O3U4c
         eevQ==
X-Gm-Message-State: AFqh2kqTKVuWHEosXGEpGBjLHzzVClmdbGWZEO0NIe/7205fBAeTlfHe
	qCO4nROR96RTZQz34965uYwZimZVMyM7Ghq4
X-Google-Smtp-Source: AMrXdXti6eIlILnZx/DrwdrlOvZN7gqJsAAcTws+N/0db3SVZ3qu4uTefLrEtvUIv51UzA8yHslIWA==
X-Received: by 2002:adf:f183:0:b0:242:7fd1:e9d2 with SMTP id h3-20020adff183000000b002427fd1e9d2mr8475773wro.62.1671910358214;
        Sat, 24 Dec 2022 11:32:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm6125967wrq.94.2022.12.24.11.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 11:32:37 -0800 (PST)
Date: Sat, 24 Dec 2022 22:32:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.0 6/999] fs/cifs/smb2inode.c:419
 smb2_compound_op() error: potentially dereferencing uninitialized 'idata'.
Message-ID: <202212250020.fyWQFNzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221224193234.8MWHDhQ6tfCH6Jn6MFm8TCtZwIyp6U8L6UhoJsDyYd8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.0
head:   df4c2d480cc0e9be592dd3a16c430b20f59c02e7
commit: e4469058d117d3c5541e98f30ef5510239c0a71d [6/999] cifs: improve symlink handling for smb2+
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/cifs/smb2inode.c:419 smb2_compound_op() error: potentially dereferencing uninitialized 'idata'.
fs/cifs/smb2inode.c:430 smb2_compound_op() error: uninitialized symbol 'idata'.

vim +/idata +419 fs/cifs/smb2inode.c

a7d5c294628088 Ronnie Sahlberg 2020-05-20   50  
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   51  /*
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   52   * note: If cfile is passed, the reference to it is dropped here.
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   53   * So make sure that you do not reuse cfile after return from this func.
e4469058d117d3 Paulo Alcantara 2022-10-03   54   *
e4469058d117d3 Paulo Alcantara 2022-10-03   55   * If passing @err_iov and @err_buftype, ensure to make them both large enough (>= 3) to hold all
e4469058d117d3 Paulo Alcantara 2022-10-03   56   * error responses.  Caller is also responsible for freeing them up.
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   57   */
e4469058d117d3 Paulo Alcantara 2022-10-03   58  static int smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   59  			    struct cifs_sb_info *cifs_sb, const char *full_path,
e4469058d117d3 Paulo Alcantara 2022-10-03   60  			    __u32 desired_access, __u32 create_disposition, __u32 create_options,
e4469058d117d3 Paulo Alcantara 2022-10-03   61  			    umode_t mode, void *ptr, int command, struct cifsFileInfo *cfile,
e4469058d117d3 Paulo Alcantara 2022-10-03   62  			    struct kvec *err_iov, int *err_buftype)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   63  {
a7d5c294628088 Ronnie Sahlberg 2020-05-20   64  	struct cop_vars *vars = NULL;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   65  	struct kvec *rsp_iov;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   66  	struct smb_rqst *rqst;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   67  	int rc;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   68  	__le16 *utf16_path = NULL;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   69  	__u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   70  	struct cifs_fid fid;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   71  	struct cifs_ses *ses = tcon->ses;
352d96f3acc6e0 Aurelien Aptel  2020-05-31   72  	struct TCP_Server_Info *server;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   73  	int num_rqst = 0;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   74  	int resp_buftype[3];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03   75  	struct smb2_query_info_rsp *qi_rsp = NULL;
e4469058d117d3 Paulo Alcantara 2022-10-03   76  	struct cifs_open_info_data *idata;
                                                                                   ^^^^^^

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   77  	int flags = 0;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03   78  	__u8 delete_pending[8] = {1, 0, 0, 0, 0, 0, 0, 0};
bb435512cec806 Ronnie Sahlberg 2018-09-03   79  	unsigned int size[2];
bb435512cec806 Ronnie Sahlberg 2018-09-03   80  	void *data[2];
bb435512cec806 Ronnie Sahlberg 2018-09-03   81  	int len;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   82  
a7d5c294628088 Ronnie Sahlberg 2020-05-20   83  	vars = kzalloc(sizeof(*vars), GFP_ATOMIC);
a7d5c294628088 Ronnie Sahlberg 2020-05-20   84  	if (vars == NULL)
a7d5c294628088 Ronnie Sahlberg 2020-05-20   85  		return -ENOMEM;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   86  	rqst = &vars->rqst[0];
a7d5c294628088 Ronnie Sahlberg 2020-05-20   87  	rsp_iov = &vars->rsp_iov[0];
a7d5c294628088 Ronnie Sahlberg 2020-05-20   88  
352d96f3acc6e0 Aurelien Aptel  2020-05-31   89  	server = cifs_pick_channel(ses);
352d96f3acc6e0 Aurelien Aptel  2020-05-31   90  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   91  	if (smb3_encryption_required(tcon))
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   92  		flags |= CIFS_TRANSFORM_REQ;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   93  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   94  	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   95  
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   96  	/* We already have a handle so we can skip the open */
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   97  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   98  		goto after_open;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   99  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  100  	/* Open */
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  101  	utf16_path = cifs_convert_path_to_utf16(full_path, cifs_sb);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  102  	if (!utf16_path) {
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  103  		rc = -ENOMEM;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  104  		goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  105  	}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  106  
a7d5c294628088 Ronnie Sahlberg 2020-05-20  107  	vars->oparms.tcon = tcon;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  108  	vars->oparms.desired_access = desired_access;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  109  	vars->oparms.disposition = create_disposition;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  110  	vars->oparms.create_options = cifs_create_options(cifs_sb, create_options);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  111  	vars->oparms.fid = &fid;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  112  	vars->oparms.reconnect = false;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  113  	vars->oparms.mode = mode;
c8c412f976124d Steve French    2020-08-13  114  	vars->oparms.cifs_sb = cifs_sb;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  115  
a7d5c294628088 Ronnie Sahlberg 2020-05-20  116  	rqst[num_rqst].rq_iov = &vars->open_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  117  	rqst[num_rqst].rq_nvec = SMB2_CREATE_IOV_SIZE;
352d96f3acc6e0 Aurelien Aptel  2020-05-31  118  	rc = SMB2_open_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  119  			    &rqst[num_rqst], &oplock, &vars->oparms,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  120  			    utf16_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  121  	kfree(utf16_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  122  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  123  		goto finished;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  124  
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  125  	smb2_set_next_command(tcon, &rqst[num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  126   after_open:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  127  	num_rqst++;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  128  	rc = 0;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  129  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  130  	/* Operation */
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  131  	switch (command) {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  132  	case SMB2_OP_QUERY_INFO:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  133  		rqst[num_rqst].rq_iov = &vars->qi_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  134  		rqst[num_rqst].rq_nvec = 1;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  135  
496902dc173dea Ronnie Sahlberg 2019-09-09  136  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  137  			rc = SMB2_query_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  138  				&rqst[num_rqst],
496902dc173dea Ronnie Sahlberg 2019-09-09  139  				cfile->fid.persistent_fid,
496902dc173dea Ronnie Sahlberg 2019-09-09  140  				cfile->fid.volatile_fid,
496902dc173dea Ronnie Sahlberg 2019-09-09  141  				FILE_ALL_INFORMATION,
496902dc173dea Ronnie Sahlberg 2019-09-09  142  				SMB2_O_INFO_FILE, 0,
496902dc173dea Ronnie Sahlberg 2019-09-09  143  				sizeof(struct smb2_file_all_info) +
496902dc173dea Ronnie Sahlberg 2019-09-09  144  					  PATH_MAX * 2, 0, NULL);
496902dc173dea Ronnie Sahlberg 2019-09-09  145  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  146  			rc = SMB2_query_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  147  				&rqst[num_rqst],
496902dc173dea Ronnie Sahlberg 2019-09-09  148  				COMPOUND_FID,
496902dc173dea Ronnie Sahlberg 2019-09-09  149  				COMPOUND_FID,
496902dc173dea Ronnie Sahlberg 2019-09-09  150  				FILE_ALL_INFORMATION,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  151  				SMB2_O_INFO_FILE, 0,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  152  				sizeof(struct smb2_file_all_info) +
f5b05d622a3e99 Ronnie Sahlberg 2018-10-07  153  					  PATH_MAX * 2, 0, NULL);
496902dc173dea Ronnie Sahlberg 2019-09-09  154  			if (!rc) {
496902dc173dea Ronnie Sahlberg 2019-09-09  155  				smb2_set_next_command(tcon, &rqst[num_rqst]);
496902dc173dea Ronnie Sahlberg 2019-09-09  156  				smb2_set_related(&rqst[num_rqst]);
496902dc173dea Ronnie Sahlberg 2019-09-09  157  			}
496902dc173dea Ronnie Sahlberg 2019-09-09  158  		}
496902dc173dea Ronnie Sahlberg 2019-09-09  159  
6a5f6592a0b606 Steve French    2020-06-11  160  		if (rc)
6a5f6592a0b606 Steve French    2020-06-11  161  			goto finished;
6a5f6592a0b606 Steve French    2020-06-11  162  		num_rqst++;
6a5f6592a0b606 Steve French    2020-06-11  163  		trace_smb3_query_info_compound_enter(xid, ses->Suid, tcon->tid,
6a5f6592a0b606 Steve French    2020-06-11  164  						     full_path);
6a5f6592a0b606 Steve French    2020-06-11  165  		break;
6a5f6592a0b606 Steve French    2020-06-11  166  	case SMB2_OP_POSIX_QUERY_INFO:
6a5f6592a0b606 Steve French    2020-06-11  167  		rqst[num_rqst].rq_iov = &vars->qi_iov[0];
6a5f6592a0b606 Steve French    2020-06-11  168  		rqst[num_rqst].rq_nvec = 1;
6a5f6592a0b606 Steve French    2020-06-11  169  
6a5f6592a0b606 Steve French    2020-06-11  170  		if (cfile)
6a5f6592a0b606 Steve French    2020-06-11  171  			rc = SMB2_query_info_init(tcon, server,
6a5f6592a0b606 Steve French    2020-06-11  172  				&rqst[num_rqst],
6a5f6592a0b606 Steve French    2020-06-11  173  				cfile->fid.persistent_fid,
6a5f6592a0b606 Steve French    2020-06-11  174  				cfile->fid.volatile_fid,
6a5f6592a0b606 Steve French    2020-06-11  175  				SMB_FIND_FILE_POSIX_INFO,
6a5f6592a0b606 Steve French    2020-06-11  176  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606 Steve French    2020-06-11  177  				/* TBD: fix following to allow for longer SIDs */
6a5f6592a0b606 Steve French    2020-06-11  178  				sizeof(struct smb311_posix_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606 Steve French    2020-06-11  179  				(sizeof(struct cifs_sid) * 2), 0, NULL);
6a5f6592a0b606 Steve French    2020-06-11  180  		else {
6a5f6592a0b606 Steve French    2020-06-11  181  			rc = SMB2_query_info_init(tcon, server,
6a5f6592a0b606 Steve French    2020-06-11  182  				&rqst[num_rqst],
6a5f6592a0b606 Steve French    2020-06-11  183  				COMPOUND_FID,
6a5f6592a0b606 Steve French    2020-06-11  184  				COMPOUND_FID,
6a5f6592a0b606 Steve French    2020-06-11  185  				SMB_FIND_FILE_POSIX_INFO,
6a5f6592a0b606 Steve French    2020-06-11  186  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606 Steve French    2020-06-11  187  				sizeof(struct smb311_posix_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606 Steve French    2020-06-11  188  				(sizeof(struct cifs_sid) * 2), 0, NULL);
6a5f6592a0b606 Steve French    2020-06-11  189  			if (!rc) {
6a5f6592a0b606 Steve French    2020-06-11  190  				smb2_set_next_command(tcon, &rqst[num_rqst]);
6a5f6592a0b606 Steve French    2020-06-11  191  				smb2_set_related(&rqst[num_rqst]);
6a5f6592a0b606 Steve French    2020-06-11  192  			}
6a5f6592a0b606 Steve French    2020-06-11  193  		}
6a5f6592a0b606 Steve French    2020-06-11  194  
88a92c913cef09 Ronnie Sahlberg 2019-07-16  195  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  196  			goto finished;
496902dc173dea Ronnie Sahlberg 2019-09-09  197  		num_rqst++;
e4bd7c4a8d2a84 Steve French    2020-06-11  198  		trace_smb3_posix_query_info_compound_enter(xid, ses->Suid, tcon->tid, full_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  199  		break;
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  200  	case SMB2_OP_DELETE:
8191576a124976 Steve French    2019-03-13  201  		trace_smb3_delete_enter(xid, ses->Suid, tcon->tid, full_path);
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  202  		break;
f733e3936da462 Ronnie Sahlberg 2018-09-03  203  	case SMB2_OP_MKDIR:
f733e3936da462 Ronnie Sahlberg 2018-09-03  204  		/*
f733e3936da462 Ronnie Sahlberg 2018-09-03  205  		 * Directories are created through parameters in the
f733e3936da462 Ronnie Sahlberg 2018-09-03  206  		 * SMB2_open() call.
f733e3936da462 Ronnie Sahlberg 2018-09-03  207  		 */
8191576a124976 Steve French    2019-03-13  208  		trace_smb3_mkdir_enter(xid, ses->Suid, tcon->tid, full_path);
f733e3936da462 Ronnie Sahlberg 2018-09-03  209  		break;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  210  	case SMB2_OP_RMDIR:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  211  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  212  		rqst[num_rqst].rq_nvec = 1;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  213  
271b9c0c80076b Ronnie Sahlberg 2018-12-18  214  		size[0] = 1; /* sizeof __u8 See MS-FSCC section 2.4.11 */
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  215  		data[0] = &delete_pending[0];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  216  
352d96f3acc6e0 Aurelien Aptel  2020-05-31  217  		rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  218  					&rqst[num_rqst], COMPOUND_FID,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  219  					COMPOUND_FID, current->tgid,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  220  					FILE_DISPOSITION_INFORMATION,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  221  					SMB2_O_INFO_FILE, 0, data, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  222  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  223  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  224  		smb2_set_next_command(tcon, &rqst[num_rqst]);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  225  		smb2_set_related(&rqst[num_rqst++]);
8191576a124976 Steve French    2019-03-13  226  		trace_smb3_rmdir_enter(xid, ses->Suid, tcon->tid, full_path);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  227  		break;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  228  	case SMB2_OP_SET_EOF:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  229  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  230  		rqst[num_rqst].rq_nvec = 1;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  231  
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  232  		size[0] = 8; /* sizeof __le64 */
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  233  		data[0] = ptr;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  234  
352d96f3acc6e0 Aurelien Aptel  2020-05-31  235  		rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  236  					&rqst[num_rqst], COMPOUND_FID,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  237  					COMPOUND_FID, current->tgid,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  238  					FILE_END_OF_FILE_INFORMATION,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  239  					SMB2_O_INFO_FILE, 0, data, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  240  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  241  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  242  		smb2_set_next_command(tcon, &rqst[num_rqst]);
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  243  		smb2_set_related(&rqst[num_rqst++]);
8191576a124976 Steve French    2019-03-13  244  		trace_smb3_set_eof_enter(xid, ses->Suid, tcon->tid, full_path);
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  245  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  246  	case SMB2_OP_SET_INFO:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  247  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  248  		rqst[num_rqst].rq_nvec = 1;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  249  
bb435512cec806 Ronnie Sahlberg 2018-09-03  250  
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  251  		size[0] = sizeof(FILE_BASIC_INFO);
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  252  		data[0] = ptr;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  253  
dc9300a670aebb Ronnie Sahlberg 2019-08-30  254  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  255  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  256  				&rqst[num_rqst],
dc9300a670aebb Ronnie Sahlberg 2019-08-30  257  				cfile->fid.persistent_fid,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  258  				cfile->fid.volatile_fid, current->tgid,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  259  				FILE_BASIC_INFORMATION,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  260  				SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  261  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  262  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  263  				&rqst[num_rqst],
dc9300a670aebb Ronnie Sahlberg 2019-08-30  264  				COMPOUND_FID,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  265  				COMPOUND_FID, current->tgid,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  266  				FILE_BASIC_INFORMATION,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  267  				SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  268  			if (!rc) {
dc9300a670aebb Ronnie Sahlberg 2019-08-30  269  				smb2_set_next_command(tcon, &rqst[num_rqst]);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  270  				smb2_set_related(&rqst[num_rqst]);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  271  			}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  272  		}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  273  
88a92c913cef09 Ronnie Sahlberg 2019-07-16  274  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  275  			goto finished;
dc9300a670aebb Ronnie Sahlberg 2019-08-30  276  		num_rqst++;
8191576a124976 Steve French    2019-03-13  277  		trace_smb3_set_info_compound_enter(xid, ses->Suid, tcon->tid,
8191576a124976 Steve French    2019-03-13  278  						   full_path);
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  279  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  280  	case SMB2_OP_RENAME:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  281  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
bb435512cec806 Ronnie Sahlberg 2018-09-03  282  		rqst[num_rqst].rq_nvec = 2;
bb435512cec806 Ronnie Sahlberg 2018-09-03  283  
bb435512cec806 Ronnie Sahlberg 2018-09-03  284  		len = (2 * UniStrnlen((wchar_t *)ptr, PATH_MAX));
bb435512cec806 Ronnie Sahlberg 2018-09-03  285  
a7d5c294628088 Ronnie Sahlberg 2020-05-20  286  		vars->rename_info.ReplaceIfExists = 1;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  287  		vars->rename_info.RootDirectory = 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  288  		vars->rename_info.FileNameLength = cpu_to_le32(len);
bb435512cec806 Ronnie Sahlberg 2018-09-03  289  
bb435512cec806 Ronnie Sahlberg 2018-09-03  290  		size[0] = sizeof(struct smb2_file_rename_info);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  291  		data[0] = &vars->rename_info;
bb435512cec806 Ronnie Sahlberg 2018-09-03  292  
bb435512cec806 Ronnie Sahlberg 2018-09-03  293  		size[1] = len + 2 /* null */;
bb435512cec806 Ronnie Sahlberg 2018-09-03  294  		data[1] = (__le16 *)ptr;
bb435512cec806 Ronnie Sahlberg 2018-09-03  295  
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  296  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  297  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  298  						&rqst[num_rqst],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  299  						cfile->fid.persistent_fid,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  300  						cfile->fid.volatile_fid,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  301  					current->tgid, FILE_RENAME_INFORMATION,
bb435512cec806 Ronnie Sahlberg 2018-09-03  302  					SMB2_O_INFO_FILE, 0, data, size);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  303  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  304  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  305  					&rqst[num_rqst],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  306  					COMPOUND_FID, COMPOUND_FID,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  307  					current->tgid, FILE_RENAME_INFORMATION,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  308  					SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  309  			if (!rc) {
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  310  				smb2_set_next_command(tcon, &rqst[num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  311  				smb2_set_related(&rqst[num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  312  			}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  313  		}
88a92c913cef09 Ronnie Sahlberg 2019-07-16  314  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  315  			goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  316  		num_rqst++;
8191576a124976 Steve French    2019-03-13  317  		trace_smb3_rename_enter(xid, ses->Suid, tcon->tid, full_path);
bb435512cec806 Ronnie Sahlberg 2018-09-03  318  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  319  	case SMB2_OP_HARDLINK:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  320  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
bb435512cec806 Ronnie Sahlberg 2018-09-03  321  		rqst[num_rqst].rq_nvec = 2;
bb435512cec806 Ronnie Sahlberg 2018-09-03  322  
bb435512cec806 Ronnie Sahlberg 2018-09-03  323  		len = (2 * UniStrnlen((wchar_t *)ptr, PATH_MAX));
bb435512cec806 Ronnie Sahlberg 2018-09-03  324  
a7d5c294628088 Ronnie Sahlberg 2020-05-20  325  		vars->link_info.ReplaceIfExists = 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  326  		vars->link_info.RootDirectory = 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  327  		vars->link_info.FileNameLength = cpu_to_le32(len);
bb435512cec806 Ronnie Sahlberg 2018-09-03  328  
bb435512cec806 Ronnie Sahlberg 2018-09-03  329  		size[0] = sizeof(struct smb2_file_link_info);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  330  		data[0] = &vars->link_info;
bb435512cec806 Ronnie Sahlberg 2018-09-03  331  
bb435512cec806 Ronnie Sahlberg 2018-09-03  332  		size[1] = len + 2 /* null */;
bb435512cec806 Ronnie Sahlberg 2018-09-03  333  		data[1] = (__le16 *)ptr;
bb435512cec806 Ronnie Sahlberg 2018-09-03  334  
352d96f3acc6e0 Aurelien Aptel  2020-05-31  335  		rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  336  					&rqst[num_rqst], COMPOUND_FID,
bb435512cec806 Ronnie Sahlberg 2018-09-03  337  					COMPOUND_FID, current->tgid,
bb435512cec806 Ronnie Sahlberg 2018-09-03  338  					FILE_LINK_INFORMATION,
bb435512cec806 Ronnie Sahlberg 2018-09-03  339  					SMB2_O_INFO_FILE, 0, data, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  340  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  341  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  342  		smb2_set_next_command(tcon, &rqst[num_rqst]);
bb435512cec806 Ronnie Sahlberg 2018-09-03  343  		smb2_set_related(&rqst[num_rqst++]);
8191576a124976 Steve French    2019-03-13  344  		trace_smb3_hardlink_enter(xid, ses->Suid, tcon->tid, full_path);
bb435512cec806 Ronnie Sahlberg 2018-09-03  345  		break;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  346  	default:
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  347  		cifs_dbg(VFS, "Invalid command\n");
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  348  		rc = -EINVAL;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  349  	}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  350  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  351  		goto finished;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  352  
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  353  	/* We already have a handle so we can skip the close */
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  354  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  355  		goto after_close;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  356  	/* Close */
04ad69c342fc4d Paulo Alcantara 2021-03-08  357  	flags |= CIFS_CP_CREATE_CLOSE_OP;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  358  	rqst[num_rqst].rq_iov = &vars->close_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  359  	rqst[num_rqst].rq_nvec = 1;
352d96f3acc6e0 Aurelien Aptel  2020-05-31  360  	rc = SMB2_close_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  361  			     &rqst[num_rqst], COMPOUND_FID,
43f8a6a74ee244 Steve French    2019-12-02  362  			     COMPOUND_FID, false);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  363  	smb2_set_related(&rqst[num_rqst]);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  364  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  365  		goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  366   after_close:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  367  	num_rqst++;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  368  
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  369  	if (cfile) {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  370  		rc = compound_send_recv(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  371  					flags, num_rqst - 2,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  372  					&rqst[1], &resp_buftype[1],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  373  					&rsp_iov[1]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  374  	} else
352d96f3acc6e0 Aurelien Aptel  2020-05-31  375  		rc = compound_send_recv(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  376  					flags, num_rqst,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  377  					rqst, resp_buftype,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  378  					rsp_iov);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  379  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  380   finished:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  381  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  382  		cifsFileInfo_put(cfile);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  383  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  384  	SMB2_open_free(&rqst[0]);
7dcc82c2dfd5f1 Steve French    2019-09-11  385  	if (rc == -EREMCHG) {
a0a3036b81f1f6 Joe Perches     2020-04-14  386  		pr_warn_once("server share %s deleted\n", tcon->treeName);
7dcc82c2dfd5f1 Steve French    2019-09-11  387  		tcon->need_reconnect = true;
7dcc82c2dfd5f1 Steve French    2019-09-11  388  	}
7dcc82c2dfd5f1 Steve French    2019-09-11  389  
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  390  	switch (command) {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  391  	case SMB2_OP_QUERY_INFO:
e4469058d117d3 Paulo Alcantara 2022-10-03  392  		idata = ptr;
e4469058d117d3 Paulo Alcantara 2022-10-03  393  		if (rc == 0 && cfile && cfile->symlink_target) {
e4469058d117d3 Paulo Alcantara 2022-10-03  394  			idata->symlink_target = kstrdup(cfile->symlink_target, GFP_KERNEL);
e4469058d117d3 Paulo Alcantara 2022-10-03  395  			if (!idata->symlink_target)
e4469058d117d3 Paulo Alcantara 2022-10-03  396  				rc = -ENOMEM;
e4469058d117d3 Paulo Alcantara 2022-10-03  397  		}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  398  		if (rc == 0) {
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  399  			qi_rsp = (struct smb2_query_info_rsp *)
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  400  				rsp_iov[1].iov_base;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  401  			rc = smb2_validate_and_copy_iov(
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  402  				le16_to_cpu(qi_rsp->OutputBufferOffset),
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  403  				le32_to_cpu(qi_rsp->OutputBufferLength),
e4469058d117d3 Paulo Alcantara 2022-10-03  404  				&rsp_iov[1], sizeof(idata->fi), (char *)&idata->fi);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  405  		}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  406  		if (rqst[1].rq_iov)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  407  			SMB2_query_info_free(&rqst[1]);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  408  		if (rqst[2].rq_iov)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  409  			SMB2_close_free(&rqst[2]);
8191576a124976 Steve French    2019-03-13  410  		if (rc)
8191576a124976 Steve French    2019-03-13  411  			trace_smb3_query_info_compound_err(xid,  ses->Suid,
8191576a124976 Steve French    2019-03-13  412  						tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  413  		else
8191576a124976 Steve French    2019-03-13  414  			trace_smb3_query_info_compound_done(xid, ses->Suid,
8191576a124976 Steve French    2019-03-13  415  						tcon->tid);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  416  		break;
6a5f6592a0b606 Steve French    2020-06-11  417  	case SMB2_OP_POSIX_QUERY_INFO:
e4469058d117d3 Paulo Alcantara 2022-10-03  418  		if (rc == 0 && cfile && cfile->symlink_target) {
e4469058d117d3 Paulo Alcantara 2022-10-03 @419  			idata->symlink_target = kstrdup(cfile->symlink_target, GFP_KERNEL);

Missing "idata = ptr;" assignment.

e4469058d117d3 Paulo Alcantara 2022-10-03  420  			if (!idata->symlink_target)
e4469058d117d3 Paulo Alcantara 2022-10-03  421  				rc = -ENOMEM;
e4469058d117d3 Paulo Alcantara 2022-10-03  422  		}
6a5f6592a0b606 Steve French    2020-06-11  423  		if (rc == 0) {
6a5f6592a0b606 Steve French    2020-06-11  424  			qi_rsp = (struct smb2_query_info_rsp *)
6a5f6592a0b606 Steve French    2020-06-11  425  				rsp_iov[1].iov_base;
6a5f6592a0b606 Steve French    2020-06-11  426  			rc = smb2_validate_and_copy_iov(
6a5f6592a0b606 Steve French    2020-06-11  427  				le16_to_cpu(qi_rsp->OutputBufferOffset),
6a5f6592a0b606 Steve French    2020-06-11  428  				le32_to_cpu(qi_rsp->OutputBufferLength),
e4469058d117d3 Paulo Alcantara 2022-10-03  429  				&rsp_iov[1], sizeof(idata->posix_fi) /* add SIDs */,
e4469058d117d3 Paulo Alcantara 2022-10-03 @430  				(char *)&idata->posix_fi);
6a5f6592a0b606 Steve French    2020-06-11  431  		}
6a5f6592a0b606 Steve French    2020-06-11  432  		if (rqst[1].rq_iov)
6a5f6592a0b606 Steve French    2020-06-11  433  			SMB2_query_info_free(&rqst[1]);
6a5f6592a0b606 Steve French    2020-06-11  434  		if (rqst[2].rq_iov)
6a5f6592a0b606 Steve French    2020-06-11  435  			SMB2_close_free(&rqst[2]);
6a5f6592a0b606 Steve French    2020-06-11  436  		if (rc)
e4bd7c4a8d2a84 Steve French    2020-06-11  437  			trace_smb3_posix_query_info_compound_err(xid,  ses->Suid, tcon->tid, rc);
6a5f6592a0b606 Steve French    2020-06-11  438  		else
e4bd7c4a8d2a84 Steve French    2020-06-11  439  			trace_smb3_posix_query_info_compound_done(xid, ses->Suid, tcon->tid);
6a5f6592a0b606 Steve French    2020-06-11  440  		break;
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  441  	case SMB2_OP_DELETE:
8191576a124976 Steve French    2019-03-13  442  		if (rc)
8191576a124976 Steve French    2019-03-13  443  			trace_smb3_delete_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  444  		else
8191576a124976 Steve French    2019-03-13  445  			trace_smb3_delete_done(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  446  		if (rqst[1].rq_iov)
8191576a124976 Steve French    2019-03-13  447  			SMB2_close_free(&rqst[1]);
8191576a124976 Steve French    2019-03-13  448  		break;
f733e3936da462 Ronnie Sahlberg 2018-09-03  449  	case SMB2_OP_MKDIR:
8191576a124976 Steve French    2019-03-13  450  		if (rc)
8191576a124976 Steve French    2019-03-13  451  			trace_smb3_mkdir_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  452  		else
8191576a124976 Steve French    2019-03-13  453  			trace_smb3_mkdir_done(xid, ses->Suid, tcon->tid);
f733e3936da462 Ronnie Sahlberg 2018-09-03  454  		if (rqst[1].rq_iov)
f733e3936da462 Ronnie Sahlberg 2018-09-03  455  			SMB2_close_free(&rqst[1]);
f733e3936da462 Ronnie Sahlberg 2018-09-03  456  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  457  	case SMB2_OP_HARDLINK:
8191576a124976 Steve French    2019-03-13  458  		if (rc)
8191576a124976 Steve French    2019-03-13  459  			trace_smb3_hardlink_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  460  		else
8191576a124976 Steve French    2019-03-13  461  			trace_smb3_hardlink_done(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  462  		free_set_inf_compound(rqst);
8191576a124976 Steve French    2019-03-13  463  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  464  	case SMB2_OP_RENAME:
8191576a124976 Steve French    2019-03-13  465  		if (rc)
8191576a124976 Steve French    2019-03-13  466  			trace_smb3_rename_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  467  		else
8191576a124976 Steve French    2019-03-13  468  			trace_smb3_rename_done(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  469  		free_set_inf_compound(rqst);
8191576a124976 Steve French    2019-03-13  470  		break;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  471  	case SMB2_OP_RMDIR:
8191576a124976 Steve French    2019-03-13  472  		if (rc)
8191576a124976 Steve French    2019-03-13  473  			trace_smb3_rmdir_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  474  		else
8191576a124976 Steve French    2019-03-13  475  			trace_smb3_rmdir_done(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  476  		free_set_inf_compound(rqst);
8191576a124976 Steve French    2019-03-13  477  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  478  	case SMB2_OP_SET_EOF:
8191576a124976 Steve French    2019-03-13  479  		if (rc)
8191576a124976 Steve French    2019-03-13  480  			trace_smb3_set_eof_err(xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  481  		else
8191576a124976 Steve French    2019-03-13  482  			trace_smb3_set_eof_done(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  483  		free_set_inf_compound(rqst);
8191576a124976 Steve French    2019-03-13  484  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  485  	case SMB2_OP_SET_INFO:
8191576a124976 Steve French    2019-03-13  486  		if (rc)
8191576a124976 Steve French    2019-03-13  487  			trace_smb3_set_info_compound_err(xid,  ses->Suid,
8191576a124976 Steve French    2019-03-13  488  						tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  489  		else
8191576a124976 Steve French    2019-03-13  490  			trace_smb3_set_info_compound_done(xid, ses->Suid,
8191576a124976 Steve French    2019-03-13  491  						tcon->tid);
8191576a124976 Steve French    2019-03-13  492  		free_set_inf_compound(rqst);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  493  		break;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  494  	}
e4469058d117d3 Paulo Alcantara 2022-10-03  495  
e4469058d117d3 Paulo Alcantara 2022-10-03  496  	if (rc && err_iov && err_buftype) {
e4469058d117d3 Paulo Alcantara 2022-10-03  497  		memcpy(err_iov, rsp_iov, 3 * sizeof(*err_iov));
e4469058d117d3 Paulo Alcantara 2022-10-03  498  		memcpy(err_buftype, resp_buftype, 3 * sizeof(*err_buftype));
e4469058d117d3 Paulo Alcantara 2022-10-03  499  	} else {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  500  		free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  501  		free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  502  		free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
e4469058d117d3 Paulo Alcantara 2022-10-03  503  	}
a7d5c294628088 Ronnie Sahlberg 2020-05-20  504  	kfree(vars);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  505  	return rc;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  506  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

