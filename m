Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9232DA75F
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512418; cv=none; b=CiV+zoSkXfwwW/tXl4+YUL3zsi2kA3cAj++bac7g7YRDBdWc5HM9qVHbsy9jKsPK3kbmQqGD9PkcEKy7pMf/h31Yl/Dwp2WN0xxiDO3BaUbCKOQqdC4KkIGiz6rBKzAhTGbhbYmsOcEAxTyUwPNFw9ugv5WwEJGt2/jby9TSmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512418; c=relaxed/simple;
	bh=zh5P4xd+Uiyx4qvs2jttBE8pldH7Ce4MrXlsyRB53V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Hs/7C2pMWxnv0NlQdjQsHzHL9lTRgU/ytxfu8owraBn8LQ5AYveiLevYSZVhh17PP9UZKMTiIiqeBud80CofEDhKiaWNVUiri2qMbGp8P7Xf6JDXxve4kWzu1HtaHucGwwLFVoMDzuVFE9/n6tK8Yptrz7i4xSFGyy3aDA+meas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpDi6Yxj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpDi6Yxj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1438741f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Oct 2025 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759512414; x=1760117214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUw0eHecy2lXmBu5aO6x5k/wtfv0EoJF8eKTBU7gf3o=;
        b=dpDi6YxjZ9iDjdV0NLa+Px4BA2hYxqwTP2YIR/ygbSWMdF64gS6Wjx9bcF2Hy5ht7S
         6J0p0zCCNQgF/+C6Zws1r6I+cwWTU4Xb048U3qVQ+/gK4gPquINbJWd+rxRkcVfbE/73
         UjhySN1vQ6mkHPQKJG3h3q+QA7ybRRRMNgR3Q+cc+ymVCZnfAiPa8Ety42eSa7NtiMnK
         2FFXO/hCi/mrcIv36W2b3LzAwUOVdP/fdFAQ2pQEUyqPk2/dl+A6aRYG2JOtMX+mdG5H
         2sUuiUEmn/3KQ08O6yTF9qhBAIAtkpsD2cuZuZehBcrIWclvLKHqIitAESkb2HpVCOmC
         AKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512414; x=1760117214;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUw0eHecy2lXmBu5aO6x5k/wtfv0EoJF8eKTBU7gf3o=;
        b=WgdxevVosmwggqdtbBnfBgJgl9Asgjmq88Oaty1hL5Gy3Z4nKcDB7fchcNfishFl68
         Ccd65dvAwyVvfcv4GNhMQ54aM0bBrNxi8dk09Dws95wydLAdySAG7Fau5gMzOROYlAgT
         YlvHxhYwd07UjVOerem92WJ2XCkJi5+E522IN6Q2y2alz+ORW0/E+H1zJs1IVq7HmoBp
         9/FWUbq4ULxTLGw6OEDRpl5L5zNXwOhK7BurZEqIypj5OqV/2YQg6wdfKqd4FStRh/xJ
         sS5VFaK2/at/u4dduYgZsHlZMBGFGuGwky5aNya1Wly60J0XA/dNcy9eePRG6eocztNj
         K/ow==
X-Gm-Message-State: AOJu0YwKNO0VyHORa4+IeHV2EkwEI3SoV4VDAjhn7eGN0yevYWPvCJx6
	CQzs3+D20YkXk2IQeaijkGvLvgLONLpHAfx2EL049nvswI3EzoZpjTan7E3EZcYdh8Yb+9Nw1H1
	OvOuU
X-Gm-Gg: ASbGncsjqfV7y+SVMw30hkbD7v9SATaZuh6siEm0MXs7HluUkrFbCrE7ctYQZcnaqez
	0MCa54rFu6hEvb4V7BM5SEfCAM0AGBEH4kCzJlOJaUsv4JdkcSreFpAISABdow+3PDlJytCuIvc
	DQrZwbOzoTdgb6stI0k8CX9K8yqBInNZ5Whd/rAsxXwfsjMzXZUG/YHZryRg/NAvH6XT5Ge1ZCk
	aJ4Lgsfs6JnwbGh9iFvn+2DkAU1N5dZuniW8wU+X2naalMNGPW//Jd0ZXcRmapmQ69wkKU5ijjR
	Zz/dw2GLfrS0lYlGoIFisXLsiPu5+4khLLZT3PMmP7qMGfGfrOzQ2pQkjiXGo3J/69639tssqQh
	LSafNUgVaVtr8N9Iksiw30S9VmFgdDTr00onaIJ4hUAST95+yTEHLGybudKSGMYR/XsU=
X-Google-Smtp-Source: AGHT+IGOzivoWuR0fCMvvip8F1iRjXiKzQ4UZ0etIaaqMe50pe2gTdevQHs7YrJWicCC7ZtkcE+XKA==
X-Received: by 2002:a5d:584e:0:b0:424:2158:c1a7 with SMTP id ffacd0b85a97d-4256719ea49mr2525822f8f.34.1759512413799;
        Fri, 03 Oct 2025 10:26:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01a0sm8748954f8f.48.2025.10.03.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:26:53 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:26:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Enzo Matsumiya <ematsumiya@suse.de>,
	linux-cifs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, smfrench@gmail.com,
	pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com,
	tom@talpey.com, bharathsm@microsoft.com, henrique.carvalho@suse.com
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
In-Reply-To: <20250929132805.220558-14-ematsumiya@suse.de>
Message-ID: <20251003172649.L32xwkDFO-QcE5khye7pfJzkVVGxqY8zzMXW54hjCZI@z>

Hi Enzo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-remove-cfids_invalidation_worker/20250929-213155
base:   v6.17
patch link:    https://lore.kernel.org/r/20250929132805.220558-14-ematsumiya%40suse.de
patch subject: [PATCH 13/20] smb: client: actually use cached dirs on readdir
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032035.eEAqpgDl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510032035.eEAqpgDl-lkp@intel.com/

smatch warnings:
fs/smb/client/readdir.c:1119 cifs_readdir() error: uninitialized symbol 'tcon'.

vim +/tcon +1119 fs/smb/client/readdir.c

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

tcon is not initialized yet.  private_data is NULL.

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
                                                                                            ^^^^^^^^^^^^
Uninitialized?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

