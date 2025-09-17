Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA72FFFA2
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096433; cv=none; b=Uos3hB5aImcsl6r2hmiQ2IkaIkkMjQAvQ6DvQewbJpfJD53d9euvqkQWJjmawdnqYRqpc4JqD3PpdDk0FbZQQwEVoS1B5KslVSeVPh+NVJTBEwqa9ev9KnpIa1YCry+EPvUlCDXZi8Z3lGJkx//5YII4eVG3UbNbVXLmPAugKHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096433; c=relaxed/simple;
	bh=NHOmPa3pdYwHEr1K8GFSH34m6QaoW+nvvd1Odol+xsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QrEqFCeR01ONvbqQXkizbmLAwgURpDps79wll1cRbnKSCgM1XzjtadRVvGOgPtZh5S2rAVgPyLbVbytu7AMGCQeNxVohKk+GCdxHcT7BXijc+dDRLPjQVl7bqw0uKUUPKoNbLGfWGnUGsxr4phJ1PX1Q9LfEI3umUpqkMYX/Edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMkx7J6E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMkx7J6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758096431; x=1789632431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHOmPa3pdYwHEr1K8GFSH34m6QaoW+nvvd1Odol+xsw=;
  b=UMkx7J6EkUd1T09BgSc8w3cmrAoE2sexDSns9bG34R95Qna5WRu6nIwk
   8TZWn2ttO0evlRxq84M5IS0Ze3uUg3f8NAQd5Axh5F0n6dO5DiMjB1BLh
   vFU0pOjJ3a/0xfLKuxSYWJ97VER0ahnzf+6EL1ad1AfBXrZpsPyhkXIyc
   JOD/vR0HW3/54Skps68tUZ0IhRDYfb2YSs5xVY74aR3qkPF4CPyzUct0B
   tPYy5gWb6Opdkj2bXLQIQJD5ZhOnw8EbH2seO6TFQFc0yZQ/CinqJKQy7
   OKzYnomPIvedO1fkNmnegDmhxwi+QhkSsy1TV4trLKIiVdNGDIJmZbtAL
   A==;
X-CSE-ConnectionGUID: OyB4JQCeQM+/Y9+XBBuYTg==
X-CSE-MsgGUID: YniDEc71TqKhhn4AxBXKEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70645940"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="70645940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 01:07:10 -0700
X-CSE-ConnectionGUID: UzBpZgRUT9a1yPAS3HZ64w==
X-CSE-MsgGUID: GpGb6MxSTNePgtq39fiYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="174978247"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Sep 2025 01:07:08 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uynBx-0001FL-2Y;
	Wed, 17 Sep 2025 08:07:05 +0000
Date: Wed, 17 Sep 2025 16:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1-lts 1/1] fs/smb/client/smb2inode.c:520
 smb2_compound_op() error: uninitialized symbol 'rsp_iov'.
Message-ID: <202509171639.2AtRG7fT-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   8c8937bc84545d6e04812fafa04bcf969f3a5cab
commit: 3fc11ff13fbc2749871d6ac2141685cf54699997 [1/1] fs/smb: Fix inconsistent refcnt update
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171639.2AtRG7fT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509171639.2AtRG7fT-lkp@intel.com/

New smatch warnings:
fs/smb/client/smb2inode.c:520 smb2_compound_op() error: uninitialized symbol 'rsp_iov'.

Old smatch warnings:
fs/smb/client/smb2inode.c:523 smb2_compound_op() error: uninitialized symbol 'rsp_iov'.

vim +/rsp_iov +520 fs/smb/client/smb2inode.c

a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   50  
b6f2a0f89d7ed80 fs/cifs/smb2inode.c       Shyam Prasad N  2021-07-30   51  /*
b6f2a0f89d7ed80 fs/cifs/smb2inode.c       Shyam Prasad N  2021-07-30   52   * note: If cfile is passed, the reference to it is dropped here.
b6f2a0f89d7ed80 fs/cifs/smb2inode.c       Shyam Prasad N  2021-07-30   53   * So make sure that you do not reuse cfile after return from this func.
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   54   *
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   55   * If passing @err_iov and @err_buftype, ensure to make them both large enough (>= 3) to hold all
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   56   * error responses.  Caller is also responsible for freeing them up.
b6f2a0f89d7ed80 fs/cifs/smb2inode.c       Shyam Prasad N  2021-07-30   57   */
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   58  static int smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   59  			    struct cifs_sb_info *cifs_sb, const char *full_path,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   60  			    __u32 desired_access, __u32 create_disposition, __u32 create_options,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   61  			    umode_t mode, void *ptr, int command, struct cifsFileInfo *cfile,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   62  			    struct kvec *err_iov, int *err_buftype)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   63  {
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   64  	struct cop_vars *vars = NULL;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   65  	struct kvec *rsp_iov;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   66  	struct smb_rqst *rqst;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   67  	int rc;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   68  	__le16 *utf16_path = NULL;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   69  	__u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   70  	struct cifs_fid fid;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   71  	struct cifs_ses *ses = tcon->ses;
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31   72  	struct TCP_Server_Info *server;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   73  	int num_rqst = 0;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   74  	int resp_buftype[3];
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   75  	struct smb2_query_info_rsp *qi_rsp = NULL;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   76  	struct cifs_open_info_data *idata;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   77  	int flags = 0;
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   78  	__u8 delete_pending[8] = {1, 0, 0, 0, 0, 0, 0, 0};
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   79  	unsigned int size[2];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   80  	void *data[2];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   81  	int len;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   82  
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   83  	vars = kzalloc(sizeof(*vars), GFP_ATOMIC);
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   84  	if (vars == NULL) {
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   85  		rc = -ENOMEM;
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   86  		goto out;
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   87  	}
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   88  	rqst = &vars->rqst[0];
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   89  	rsp_iov = &vars->rsp_iov[0];
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   90  
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31   91  	server = cifs_pick_channel(ses);
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31   92  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   93  	if (smb3_encryption_required(tcon))
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   94  		flags |= CIFS_TRANSFORM_REQ;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   95  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   96  	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   97  
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30   98  	/* We already have a handle so we can skip the open */
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30   99  	if (cfile)
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  100  		goto after_open;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  101  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  102  	/* Open */
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  103  	utf16_path = cifs_convert_path_to_utf16(full_path, cifs_sb);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  104  	if (!utf16_path) {
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  105  		rc = -ENOMEM;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  106  		goto finished;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  107  	}
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  108  
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  109  	vars->oparms = (struct cifs_open_parms) {
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  110  		.tcon = tcon,
a163106b6d16a12 fs/cifs/smb2inode.c       Shyam Prasad N  2023-03-17  111  		.path = full_path,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  112  		.desired_access = desired_access,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  113  		.disposition = create_disposition,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  114  		.create_options = cifs_create_options(cifs_sb, create_options),
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  115  		.fid = &fid,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  116  		.mode = mode,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  117  		.cifs_sb = cifs_sb,
8db5028479f85df fs/cifs/smb2inode.c       Volker Lendecke 2023-01-11  118  	};
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  119  
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  120  	rqst[num_rqst].rq_iov = &vars->open_iov[0];
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  121  	rqst[num_rqst].rq_nvec = SMB2_CREATE_IOV_SIZE;
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  122  	rc = SMB2_open_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  123  			    &rqst[num_rqst], &oplock, &vars->oparms,
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  124  			    utf16_path);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  125  	kfree(utf16_path);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  126  	if (rc)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  127  		goto finished;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  128  
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  129  	smb2_set_next_command(tcon, &rqst[num_rqst]);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  130   after_open:
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  131  	num_rqst++;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  132  	rc = 0;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  133  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  134  	/* Operation */
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  135  	switch (command) {
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  136  	case SMB2_OP_QUERY_INFO:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  137  		rqst[num_rqst].rq_iov = &vars->qi_iov[0];
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  138  		rqst[num_rqst].rq_nvec = 1;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  139  
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  140  		if (cfile)
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  141  			rc = SMB2_query_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  142  				&rqst[num_rqst],
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  143  				cfile->fid.persistent_fid,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  144  				cfile->fid.volatile_fid,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  145  				FILE_ALL_INFORMATION,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  146  				SMB2_O_INFO_FILE, 0,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  147  				sizeof(struct smb2_file_all_info) +
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  148  					  PATH_MAX * 2, 0, NULL);
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  149  		else {
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  150  			rc = SMB2_query_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  151  				&rqst[num_rqst],
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  152  				COMPOUND_FID,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  153  				COMPOUND_FID,
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  154  				FILE_ALL_INFORMATION,
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  155  				SMB2_O_INFO_FILE, 0,
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  156  				sizeof(struct smb2_file_all_info) +
f5b05d622a3e99e fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-10-07  157  					  PATH_MAX * 2, 0, NULL);
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  158  			if (!rc) {
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  159  				smb2_set_next_command(tcon, &rqst[num_rqst]);
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  160  				smb2_set_related(&rqst[num_rqst]);
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  161  			}
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  162  		}
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  163  
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  164  		if (rc)
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  165  			goto finished;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  166  		num_rqst++;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  167  		trace_smb3_query_info_compound_enter(xid, ses->Suid, tcon->tid,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  168  						     full_path);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  169  		break;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  170  	case SMB2_OP_POSIX_QUERY_INFO:
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  171  		rqst[num_rqst].rq_iov = &vars->qi_iov[0];
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  172  		rqst[num_rqst].rq_nvec = 1;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  173  
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  174  		if (cfile)
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  175  			rc = SMB2_query_info_init(tcon, server,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  176  				&rqst[num_rqst],
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  177  				cfile->fid.persistent_fid,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  178  				cfile->fid.volatile_fid,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  179  				SMB_FIND_FILE_POSIX_INFO,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  180  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  181  				/* TBD: fix following to allow for longer SIDs */
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  182  				sizeof(struct smb311_posix_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  183  				(sizeof(struct cifs_sid) * 2), 0, NULL);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  184  		else {
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  185  			rc = SMB2_query_info_init(tcon, server,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  186  				&rqst[num_rqst],
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  187  				COMPOUND_FID,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  188  				COMPOUND_FID,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  189  				SMB_FIND_FILE_POSIX_INFO,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  190  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  191  				sizeof(struct smb311_posix_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  192  				(sizeof(struct cifs_sid) * 2), 0, NULL);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  193  			if (!rc) {
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  194  				smb2_set_next_command(tcon, &rqst[num_rqst]);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  195  				smb2_set_related(&rqst[num_rqst]);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  196  			}
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  197  		}
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  198  
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  199  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  200  			goto finished;
496902dc173dead fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-09-09  201  		num_rqst++;
e4bd7c4a8d2a847 fs/cifs/smb2inode.c       Steve French    2020-06-11  202  		trace_smb3_posix_query_info_compound_enter(xid, ses->Suid, tcon->tid, full_path);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  203  		break;
47dd9597df41f0f fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  204  	case SMB2_OP_DELETE:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  205  		trace_smb3_delete_enter(xid, ses->Suid, tcon->tid, full_path);
47dd9597df41f0f fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  206  		break;
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  207  	case SMB2_OP_MKDIR:
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  208  		/*
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  209  		 * Directories are created through parameters in the
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  210  		 * SMB2_open() call.
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  211  		 */
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  212  		trace_smb3_mkdir_enter(xid, ses->Suid, tcon->tid, full_path);
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  213  		break;
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  214  	case SMB2_OP_RMDIR:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  215  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  216  		rqst[num_rqst].rq_nvec = 1;
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  217  
271b9c0c80076bb fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-12-18  218  		size[0] = 1; /* sizeof __u8 See MS-FSCC section 2.4.11 */
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  219  		data[0] = &delete_pending[0];
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  220  
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  221  		rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  222  					&rqst[num_rqst], COMPOUND_FID,
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  223  					COMPOUND_FID, current->tgid,
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  224  					FILE_DISPOSITION_INFORMATION,
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  225  					SMB2_O_INFO_FILE, 0, data, size);
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  226  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  227  			goto finished;
e77fe73c7e38c36 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-12-31  228  		smb2_set_next_command(tcon, &rqst[num_rqst]);
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  229  		smb2_set_related(&rqst[num_rqst++]);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  230  		trace_smb3_rmdir_enter(xid, ses->Suid, tcon->tid, full_path);
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  231  		break;
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  232  	case SMB2_OP_SET_EOF:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  233  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  234  		rqst[num_rqst].rq_nvec = 1;
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  235  
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  236  		size[0] = 8; /* sizeof __le64 */
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  237  		data[0] = ptr;
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  238  
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  239  		if (cfile) {
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  240  			rc = SMB2_set_info_init(tcon, server,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  241  						&rqst[num_rqst],
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  242  						cfile->fid.persistent_fid,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  243  						cfile->fid.volatile_fid,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  244  						current->tgid,
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  245  						FILE_END_OF_FILE_INFORMATION,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  246  						SMB2_O_INFO_FILE, 0,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  247  						data, size);
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  248  		} else {
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  249  			rc = SMB2_set_info_init(tcon, server,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  250  						&rqst[num_rqst],
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  251  						COMPOUND_FID,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  252  						COMPOUND_FID,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  253  						current->tgid,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  254  						FILE_END_OF_FILE_INFORMATION,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  255  						SMB2_O_INFO_FILE, 0,
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  256  						data, size);
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  257  			if (!rc) {
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  258  				smb2_set_next_command(tcon, &rqst[num_rqst]);
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  259  				smb2_set_related(&rqst[num_rqst]);
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  260  			}
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  261  		}
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  262  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  263  			goto finished;
72f90f9cf032de1 fs/cifs/smb2inode.c       Volker Lendecke 2023-03-13  264  		num_rqst++;
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  265  		trace_smb3_set_eof_enter(xid, ses->Suid, tcon->tid, full_path);
f7bfe04bf0dbc42 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  266  		break;
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  267  	case SMB2_OP_SET_INFO:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  268  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  269  		rqst[num_rqst].rq_nvec = 1;
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  270  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  271  
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  272  		size[0] = sizeof(FILE_BASIC_INFO);
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  273  		data[0] = ptr;
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  274  
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  275  		if (cfile)
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  276  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  277  				&rqst[num_rqst],
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  278  				cfile->fid.persistent_fid,
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  279  				cfile->fid.volatile_fid, current->tgid,
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  280  				FILE_BASIC_INFORMATION,
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  281  				SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  282  		else {
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  283  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  284  				&rqst[num_rqst],
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  285  				COMPOUND_FID,
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  286  				COMPOUND_FID, current->tgid,
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  287  				FILE_BASIC_INFORMATION,
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  288  				SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  289  			if (!rc) {
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  290  				smb2_set_next_command(tcon, &rqst[num_rqst]);
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  291  				smb2_set_related(&rqst[num_rqst]);
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  292  			}
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  293  		}
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  294  
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  295  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  296  			goto finished;
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  297  		num_rqst++;
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  298  		trace_smb3_set_info_compound_enter(xid, ses->Suid, tcon->tid,
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  299  						   full_path);
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  300  		break;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  301  	case SMB2_OP_RENAME:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  302  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  303  		rqst[num_rqst].rq_nvec = 2;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  304  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  305  		len = (2 * UniStrnlen((wchar_t *)ptr, PATH_MAX));
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  306  
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  307  		vars->rename_info.ReplaceIfExists = 1;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  308  		vars->rename_info.RootDirectory = 0;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  309  		vars->rename_info.FileNameLength = cpu_to_le32(len);
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  310  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  311  		size[0] = sizeof(struct smb2_file_rename_info);
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  312  		data[0] = &vars->rename_info;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  313  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  314  		size[1] = len + 2 /* null */;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  315  		data[1] = (__le16 *)ptr;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  316  
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  317  		if (cfile)
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  318  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  319  						&rqst[num_rqst],
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  320  						cfile->fid.persistent_fid,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  321  						cfile->fid.volatile_fid,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  322  					current->tgid, FILE_RENAME_INFORMATION,
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  323  					SMB2_O_INFO_FILE, 0, data, size);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  324  		else {
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  325  			rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  326  					&rqst[num_rqst],
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  327  					COMPOUND_FID, COMPOUND_FID,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  328  					current->tgid, FILE_RENAME_INFORMATION,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  329  					SMB2_O_INFO_FILE, 0, data, size);
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  330  			if (!rc) {
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  331  				smb2_set_next_command(tcon, &rqst[num_rqst]);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  332  				smb2_set_related(&rqst[num_rqst]);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  333  			}
dc9300a670aebb2 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  334  		}
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  335  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  336  			goto finished;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  337  		num_rqst++;
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  338  		trace_smb3_rename_enter(xid, ses->Suid, tcon->tid, full_path);
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  339  		break;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  340  	case SMB2_OP_HARDLINK:
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  341  		rqst[num_rqst].rq_iov = &vars->si_iov[0];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  342  		rqst[num_rqst].rq_nvec = 2;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  343  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  344  		len = (2 * UniStrnlen((wchar_t *)ptr, PATH_MAX));
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  345  
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  346  		vars->link_info.ReplaceIfExists = 0;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  347  		vars->link_info.RootDirectory = 0;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  348  		vars->link_info.FileNameLength = cpu_to_le32(len);
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  349  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  350  		size[0] = sizeof(struct smb2_file_link_info);
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  351  		data[0] = &vars->link_info;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  352  
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  353  		size[1] = len + 2 /* null */;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  354  		data[1] = (__le16 *)ptr;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  355  
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  356  		rc = SMB2_set_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  357  					&rqst[num_rqst], COMPOUND_FID,
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  358  					COMPOUND_FID, current->tgid,
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  359  					FILE_LINK_INFORMATION,
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  360  					SMB2_O_INFO_FILE, 0, data, size);
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  361  		if (rc)
88a92c913cef09e fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-07-16  362  			goto finished;
e77fe73c7e38c36 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-12-31  363  		smb2_set_next_command(tcon, &rqst[num_rqst]);
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  364  		smb2_set_related(&rqst[num_rqst++]);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  365  		trace_smb3_hardlink_enter(xid, ses->Suid, tcon->tid, full_path);
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  366  		break;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  367  	default:
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  368  		cifs_dbg(VFS, "Invalid command\n");
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  369  		rc = -EINVAL;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  370  	}
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  371  	if (rc)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  372  		goto finished;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  373  
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  374  	/* We already have a handle so we can skip the close */
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  375  	if (cfile)
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  376  		goto after_close;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  377  	/* Close */
04ad69c342fc4de fs/cifs/smb2inode.c       Paulo Alcantara 2021-03-08  378  	flags |= CIFS_CP_CREATE_CLOSE_OP;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  379  	rqst[num_rqst].rq_iov = &vars->close_iov[0];
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  380  	rqst[num_rqst].rq_nvec = 1;
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  381  	rc = SMB2_close_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  382  			     &rqst[num_rqst], COMPOUND_FID,
43f8a6a74ee2442 fs/cifs/smb2inode.c       Steve French    2019-12-02  383  			     COMPOUND_FID, false);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  384  	smb2_set_related(&rqst[num_rqst]);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  385  	if (rc)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  386  		goto finished;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  387   after_close:
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  388  	num_rqst++;
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  389  
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  390  	if (cfile) {
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  391  		rc = compound_send_recv(xid, ses, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  392  					flags, num_rqst - 2,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  393  					&rqst[1], &resp_buftype[1],
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  394  					&rsp_iov[1]);
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  395  	} else
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  396  		rc = compound_send_recv(xid, ses, server,
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31  397  					flags, num_rqst,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  398  					rqst, resp_buftype,
8de9e86c67baa71 fs/cifs/smb2inode.c       Ronnie Sahlberg 2019-08-30  399  					rsp_iov);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  400  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  401   finished:
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  402  	SMB2_open_free(&rqst[0]);
7dcc82c2dfd5f12 fs/cifs/smb2inode.c       Steve French    2019-09-11  403  	if (rc == -EREMCHG) {
68e14569d7e5a17 fs/cifs/smb2inode.c       Steve French    2022-09-21  404  		pr_warn_once("server share %s deleted\n", tcon->tree_name);
7dcc82c2dfd5f12 fs/cifs/smb2inode.c       Steve French    2019-09-11  405  		tcon->need_reconnect = true;
7dcc82c2dfd5f12 fs/cifs/smb2inode.c       Steve French    2019-09-11  406  	}
7dcc82c2dfd5f12 fs/cifs/smb2inode.c       Steve French    2019-09-11  407  
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  408  	switch (command) {
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  409  	case SMB2_OP_QUERY_INFO:
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  410  		idata = ptr;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  411  		if (rc == 0 && cfile && cfile->symlink_target) {
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  412  			idata->symlink_target = kstrdup(cfile->symlink_target, GFP_KERNEL);
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  413  			if (!idata->symlink_target)
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  414  				rc = -ENOMEM;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  415  		}
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  416  		if (rc == 0) {
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  417  			qi_rsp = (struct smb2_query_info_rsp *)
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  418  				rsp_iov[1].iov_base;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  419  			rc = smb2_validate_and_copy_iov(
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  420  				le16_to_cpu(qi_rsp->OutputBufferOffset),
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  421  				le32_to_cpu(qi_rsp->OutputBufferLength),
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  422  				&rsp_iov[1], sizeof(idata->fi), (char *)&idata->fi);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  423  		}
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  424  		if (rqst[1].rq_iov)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  425  			SMB2_query_info_free(&rqst[1]);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  426  		if (rqst[2].rq_iov)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  427  			SMB2_close_free(&rqst[2]);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  428  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  429  			trace_smb3_query_info_compound_err(xid,  ses->Suid,
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  430  						tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  431  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  432  			trace_smb3_query_info_compound_done(xid, ses->Suid,
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  433  						tcon->tid);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  434  		break;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  435  	case SMB2_OP_POSIX_QUERY_INFO:
69ccafdd35cdffd fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-04  436  		idata = ptr;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  437  		if (rc == 0 && cfile && cfile->symlink_target) {
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  438  			idata->symlink_target = kstrdup(cfile->symlink_target, GFP_KERNEL);
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  439  			if (!idata->symlink_target)
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  440  				rc = -ENOMEM;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  441  		}
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  442  		if (rc == 0) {
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  443  			qi_rsp = (struct smb2_query_info_rsp *)
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  444  				rsp_iov[1].iov_base;
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  445  			rc = smb2_validate_and_copy_iov(
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  446  				le16_to_cpu(qi_rsp->OutputBufferOffset),
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  447  				le32_to_cpu(qi_rsp->OutputBufferLength),
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  448  				&rsp_iov[1], sizeof(idata->posix_fi) /* add SIDs */,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  449  				(char *)&idata->posix_fi);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  450  		}
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  451  		if (rqst[1].rq_iov)
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  452  			SMB2_query_info_free(&rqst[1]);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  453  		if (rqst[2].rq_iov)
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  454  			SMB2_close_free(&rqst[2]);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  455  		if (rc)
e4bd7c4a8d2a847 fs/cifs/smb2inode.c       Steve French    2020-06-11  456  			trace_smb3_posix_query_info_compound_err(xid,  ses->Suid, tcon->tid, rc);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  457  		else
e4bd7c4a8d2a847 fs/cifs/smb2inode.c       Steve French    2020-06-11  458  			trace_smb3_posix_query_info_compound_done(xid, ses->Suid, tcon->tid);
6a5f6592a0b606e fs/cifs/smb2inode.c       Steve French    2020-06-11  459  		break;
47dd9597df41f0f fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  460  	case SMB2_OP_DELETE:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  461  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  462  			trace_smb3_delete_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  463  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  464  			trace_smb3_delete_done(xid, ses->Suid, tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  465  		if (rqst[1].rq_iov)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  466  			SMB2_close_free(&rqst[1]);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  467  		break;
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  468  	case SMB2_OP_MKDIR:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  469  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  470  			trace_smb3_mkdir_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  471  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  472  			trace_smb3_mkdir_done(xid, ses->Suid, tcon->tid);
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  473  		if (rqst[1].rq_iov)
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  474  			SMB2_close_free(&rqst[1]);
f733e3936da4622 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  475  		break;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  476  	case SMB2_OP_HARDLINK:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  477  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  478  			trace_smb3_hardlink_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  479  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  480  			trace_smb3_hardlink_done(xid, ses->Suid, tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  481  		free_set_inf_compound(rqst);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  482  		break;
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  483  	case SMB2_OP_RENAME:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  484  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  485  			trace_smb3_rename_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  486  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  487  			trace_smb3_rename_done(xid, ses->Suid, tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  488  		free_set_inf_compound(rqst);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  489  		break;
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  490  	case SMB2_OP_RMDIR:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  491  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  492  			trace_smb3_rmdir_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  493  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  494  			trace_smb3_rmdir_done(xid, ses->Suid, tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  495  		free_set_inf_compound(rqst);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  496  		break;
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  497  	case SMB2_OP_SET_EOF:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  498  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  499  			trace_smb3_set_eof_err(xid,  ses->Suid, tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  500  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  501  			trace_smb3_set_eof_done(xid, ses->Suid, tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  502  		free_set_inf_compound(rqst);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  503  		break;
dcbf91035709e9b fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  504  	case SMB2_OP_SET_INFO:
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  505  		if (rc)
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  506  			trace_smb3_set_info_compound_err(xid,  ses->Suid,
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  507  						tcon->tid, rc);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  508  		else
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  509  			trace_smb3_set_info_compound_done(xid, ses->Suid,
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  510  						tcon->tid);
8191576a1249763 fs/cifs/smb2inode.c       Steve French    2019-03-13  511  		free_set_inf_compound(rqst);
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  512  		break;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  513  	}
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  514  
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28  515  out:
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  516  	if (cfile)
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  517  		cifsFileInfo_put(cfile);
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  518  
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  519  	if (rc && err_iov && err_buftype) {
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03 @520  		memcpy(err_iov, rsp_iov, 3 * sizeof(*err_iov));
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  521  		memcpy(err_buftype, resp_buftype, 3 * sizeof(*err_buftype));
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  522  	} else {
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  523  		free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  524  		free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  525  		free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  526  	}
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  527  	kfree(vars);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  528  	return rc;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  529  }
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  530  

:::::: The code at line 520 was first introduced by commit
:::::: 76894f3e2f71177747b8b4763fb180e800279585 cifs: improve symlink handling for smb2+

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
