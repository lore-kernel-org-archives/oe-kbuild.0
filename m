Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EC2D24B9
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759495511; cv=none; b=ci/jJe44KrgHXk/qEYiGc1pi6o/qAyaiTGyy8QhK+MnekPwBPRrgU1Q8VAqaE+VbL1JzrNN0FE8q8HOMx6lHfHLAkv509nkFURG8DaRfdiTc1CN/fbKlu5TywISjtQsrmBfAT2JDkHxL6NOCHp4jRihCIZGOLzzBm3XyfzeH98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759495511; c=relaxed/simple;
	bh=TbTxULow9vw30S8uJk0bj1FDLbSmrUM3Is1/P0Lep8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFZOLZc5sIzgAvLjMI2GiZeevQSQS41O7DWveCUNI4e+rxNn1/0K7Uon8Ms0BwSLranjCR/GfhqvZBX+IDEBU1XlSGfM72YR8h2Um8w7HYqnPC2Wm4rrY96QNapMZv/s2qE8VXkt+x2h4JmUoP+VLEH/4YFZM/GRrg5xU1vzO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkVI0C8l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkVI0C8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759495510; x=1791031510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TbTxULow9vw30S8uJk0bj1FDLbSmrUM3Is1/P0Lep8Q=;
  b=YkVI0C8lmOTE8L2t3U3ziGMur/TIJfKGJAYrgjtXz8TPi/9lZWIu1qWq
   d1ut/k3s9zo3/v79gLDcu6VijwowwRYcTtUGPKYNlq/KnOQIyP57zQ3WC
   zbfikccHZHpMWJCdjMUIffmDhDggAH5xAAdLsiGUnhNK7SLi3p20Wd+vJ
   s7uuNhjVRfZDQgdAV01UjoWR9LY7TKuijOJuu51r4qL5bFy1h2JBTOL0x
   3K0BGeWUSRxgiK84ocmvl8Wy0fapBXI9dzO/6vLbhilRdtmEQ3kV0JktS
   xxg3XmRSul8ooflRYY22FppAe9vNW8L+Xkx39iqDfq1sNn6TQVFwlveTt
   g==;
X-CSE-ConnectionGUID: GZNmXWg1TO+DnOAryxBDyQ==
X-CSE-MsgGUID: xS9DwfeuRfSyScYQ0v4Zmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61739168"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61739168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:45:09 -0700
X-CSE-ConnectionGUID: FmnfIdTwQ12luGxKh0uMmA==
X-CSE-MsgGUID: q9Oa584jScWWKOM+OX+ELw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="216396305"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2025 05:45:07 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4f9l-0004Xf-0y;
	Fri, 03 Oct 2025 12:45:05 +0000
Date: Fri, 3 Oct 2025 20:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 13/20] smb: client: actually use cached dirs on readdir
Message-ID: <202510032035.eEAqpgDl-lkp@intel.com>
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
In-Reply-To: <20250929132805.220558-14-ematsumiya@suse.de>
References: <20250929132805.220558-14-ematsumiya@suse.de>
TO: Enzo Matsumiya <ematsumiya@suse.de>
TO: linux-cifs@vger.kernel.org
CC: smfrench@gmail.com
CC: pc@manguebit.com
CC: ronniesahlberg@gmail.com
CC: sprasad@microsoft.com
CC: tom@talpey.com
CC: bharathsm@microsoft.com
CC: henrique.carvalho@suse.com

Hi Enzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17]
[also build test WARNING on linus/master]
[cannot apply to cifs/for-next next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-remove-cfids_invalidation_worker/20250929-213155
base:   v6.17
patch link:    https://lore.kernel.org/r/20250929132805.220558-14-ematsumiya%40suse.de
patch subject: [PATCH 13/20] smb: client: actually use cached dirs on readdir
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032035.eEAqpgDl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510032035.eEAqpgDl-lkp@intel.com/

smatch warnings:
fs/smb/client/readdir.c:1119 cifs_readdir() error: uninitialized symbol 'tcon'.

vim +/tcon +1119 fs/smb/client/readdir.c

^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1040  
be4ccdcc2575ae fs/cifs/readdir.c       Al Viro          2013-05-22  1041  int cifs_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1042  {
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1043  	int rc = 0;
6d5786a34d98bf fs/cifs/readdir.c       Pavel Shilovsky  2012-06-20  1044  	unsigned int xid;
6d5786a34d98bf fs/cifs/readdir.c       Pavel Shilovsky  2012-06-20  1045  	int i;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1046  	struct tcon_link *tlink = NULL;
92fc65a74a2be1 fs/cifs/readdir.c       Pavel Shilovsky  2012-09-18  1047  	struct cifs_tcon *tcon;
ec217637e7f16d fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29  1048  	struct cifsFileInfo *cifsFile = NULL;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1049  	char *current_entry;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1050  	int num_to_fill = 0;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1051  	char *tmp_buf = NULL;
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1052  	char *end_of_smb;
18295796a30cad fs/cifs/readdir.c       Jeff Layton      2009-04-30  1053  	unsigned int max_len;
f6a9bc336b600e fs/cifs/readdir.c       Al Viro          2021-03-05  1054  	const char *full_path;
f6a9bc336b600e fs/cifs/readdir.c       Al Viro          2021-03-05  1055  	void *page = alloc_dentry_path();
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1056  	struct cached_fid *cfid = NULL;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1057  	struct cifs_sb_info *cifs_sb = CIFS_FILE_SB(file);
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1058  
6d5786a34d98bf fs/cifs/readdir.c       Pavel Shilovsky  2012-06-20  1059  	xid = get_xid();
^1da177e4c3f41 fs/cifs/readdir.c       Linus Torvalds   2005-04-16  1060  
f6a9bc336b600e fs/cifs/readdir.c       Al Viro          2021-03-05  1061  	full_path = build_path_from_dentry(file_dentry(file), page);
f6a9bc336b600e fs/cifs/readdir.c       Al Viro          2021-03-05  1062  	if (IS_ERR(full_path)) {
f6a9bc336b600e fs/cifs/readdir.c       Al Viro          2021-03-05  1063  		rc = PTR_ERR(full_path);
d1542cf6165e52 fs/cifs/readdir.c       Ronnie Sahlberg  2020-10-05  1064  		goto rddir2_exit;
d1542cf6165e52 fs/cifs/readdir.c       Ronnie Sahlberg  2020-10-05  1065  	}
d1542cf6165e52 fs/cifs/readdir.c       Ronnie Sahlberg  2020-10-05  1066  
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1067  	if (file->private_data == NULL) {
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1068  		tlink = cifs_sb_tlink(cifs_sb);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1069  		if (IS_ERR(tlink))
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1070  			goto cache_not_found;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1071  		tcon = tlink_tcon(tlink);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1072  	} else {
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1073  		cifsFile = file->private_data;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1074  		tcon = tlink_tcon(cifsFile->tlink);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1075  	}
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1076  
7d24f0ff5dad1f fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29  1077  	rc = open_cached_dir(xid, tcon, full_path, cifs_sb, &cfid);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1078  	cifs_put_tlink(tlink);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1079  	if (rc)
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1080  		goto cache_not_found;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1081  
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1082  	mutex_lock(&cfid->dirents.de_mutex);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1083  	/*
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1084  	 * If this was reading from the start of the directory
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1085  	 * we need to initialize scanning and storing the
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1086  	 * directory content.
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1087  	 */
72dd7961a4bb4f fs/smb/client/readdir.c Bharath SM       2025-06-11  1088  	if (ctx->pos == 0 && cfid->dirents.file == NULL) {
72dd7961a4bb4f fs/smb/client/readdir.c Bharath SM       2025-06-11  1089  		cfid->dirents.file = file;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1090  		cfid->dirents.pos = 2;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1091  	}
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1092  	/*
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1093  	 * If we already have the entire directory cached then
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1094  	 * we can just serve the cache.
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1095  	 */
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1096  	if (cfid->dirents.is_valid) {
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1097  		if (!dir_emit_dots(file, ctx)) {
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1098  			mutex_unlock(&cfid->dirents.de_mutex);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1099  			goto rddir2_exit;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1100  		}
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1101  		emit_cached_dirents(&cfid->dirents, ctx);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1102  		mutex_unlock(&cfid->dirents.de_mutex);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1103  		goto rddir2_exit;
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1104  	}
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1105  	mutex_unlock(&cfid->dirents.de_mutex);
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1106  
ec217637e7f16d fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29  1107  	/* keep our cfid ref, but check if still valid after network calls */
d87c48ce4d8951 fs/cifs/readdir.c       Ronnie Sahlberg  2022-05-10  1108  cache_not_found:
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1109  	/*
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1110  	 * Ensure FindFirst doesn't fail before doing filldir() for '.' and
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1111  	 * '..'. Otherwise we won't be able to notify VFS in case of failure.
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1112  	 */
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1113  	if (file->private_data == NULL) {
ec217637e7f16d fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29  1114  		rc = initiate_cifs_search(xid, file, full_path, cfid);
f96637be081141 fs/cifs/readdir.c       Joe Perches      2013-05-04  1115  		cifs_dbg(FYI, "initiate cifs search rc %d\n", rc);
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1116  		if (rc)
6221ddd0f5e2dd fs/cifs/readdir.c       Suresh Jayaraman 2010-10-01  1117  			goto rddir2_exit;
ec217637e7f16d fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29  1118  
ec217637e7f16d fs/smb/client/readdir.c Enzo Matsumiya   2025-09-29 @1119  		if (tcon->status != TID_GOOD || (cfid && !cfid_is_valid(cfid))) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
