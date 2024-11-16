Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF0BD529
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 20:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731790734; cv=none; b=crJoAmku480NvwiUyHFHXwxTFIUk6D9go39k9a2hr+QmFzwrly8D4UbHMp7AsK15gHytCGsD0fCj0x4MFMQS/V4TebYu7Ltub+ci9yI15ZHsw4Gg35feSswqw1avxvgu83IvjefLZ6YJHDtvYBM4pEx37thufHLEF8q6oFcgMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731790734; c=relaxed/simple;
	bh=OoUn59Yyq71LWlDS8QAMZ4a3UnhIKhE64dslf5jFzII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5WSVwCW/4fAjsITmEejd8Blzo816uNA3OQGMqrRmXXcMjcFnXINYAWp+Ge2DLpSkjhf1d0Q4RS32wy/iJXS7AVPVBkg8y40JYksfQeGzjftoqddkZVMxfBCkTm4RZnbA+jE65y6fb4gY35lODRlp+YmE6XWC3NAJvjlXoLevFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSiCXKhN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSiCXKhN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3822429c615so914139f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 12:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731790730; x=1732395530; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkYa5h8ct5tlmDc7YnWonG8R40yuDzvC1myY6rKVExA=;
        b=hSiCXKhNwe5YvbLnupz0oNl07bAjenwWg6bgK4AiPp8wDLDEdwowGl3YLD3C/1BIcl
         uviqGIHhAXJSD1KsvPmdQUczy4W07uJLECzFhbk4bDpsyVDzvDLdUcUrx5fgcLBJMcfX
         +XqMDBMSWUN/FBEBXhZnrFV4RipKvhKMtMX+CKdOUekKbGs3G34mmgndO9guXXmkY/2S
         Tqs6tTOLz4K0vfbLt0dcgQhjg6sy/UWGGGLELR7jZRuSq3ckhFUiURVlEn1+3wxFh5Zn
         kQ8Ce11710IeR6W+qwUtx/ZsAh31KDUkWxiY4PKsCfLd6pPSH5DbEh3hWxMQUj77/CES
         ZAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731790730; x=1732395530;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkYa5h8ct5tlmDc7YnWonG8R40yuDzvC1myY6rKVExA=;
        b=XNMfehErMV+Ww14S6r05EwKY7zwZTglvd+pFulHEPmcbYGGVMDnjOm1LvYfmyDrpRl
         Enyb9oWrqoOHsq31NZ72lvy1y0vmdQrb/D7ui8i+dgZ6v+YBz6UW02WVSeEE017g+dn7
         EovfbQ7a5v+13AyPqn+iruU0aQw5zvf7m+IhGzhggQ4YY6P3Q2tD7j/0mZY3cz/yK2UR
         a7vqO9ZZBQAL4iLmwRDrmXxMC5ijjrFv3Le7nVrKkadYicpVpzullZvKRaSZ0OhwpiMM
         KNxIi3us9z5CllcCmHARxiPhmLC0CUjuM22C8NH+ReNFRkJPlEtO1/6o209juXA5qYJx
         PCLg==
X-Gm-Message-State: AOJu0YzmWX37PsYIt9ye0aBEY/l4LYqLUB3yzKAMNenhMGEM2wOnIZry
	F9Y60hDAG7Gy3si1FLra9YK+bfXQJLGebONSPTgT12EPLfgz7bI6vTW0tNoPzbjMzHDcQLyuzRi
	d
X-Google-Smtp-Source: AGHT+IGnTLPw5Y+QBqiz6WJ7pa/Jn/ooIyo4e6bqv5aPxmiBb/R3i103Nxd6zpVgC48PFTdjFCsSpA==
X-Received: by 2002:a05:6000:4714:b0:37d:61aa:67de with SMTP id ffacd0b85a97d-38225ab74dbmr6534111f8f.42.1731790730212;
        Sat, 16 Nov 2024 12:58:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbe7f8sm8009127f8f.59.2024.11.16.12.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 12:58:49 -0800 (PST)
Date: Sat, 16 Nov 2024 23:58:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 24/28] drivers/cxl/core/mbox.c:968
 cxl_mbox_get_supported_features_filtered() error: uninitialized symbol 'u'.
Message-ID: <1b8531cc-64fc-4afb-96c3-0c4befc7c2ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: 6cf5361c36766f6ea8fc0ff6bc80407cd343168e [24/28] fwctl/cxl: Add support to filter exclusive features
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170439.4lrT79gy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411170439.4lrT79gy-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/mbox.c:968 cxl_mbox_get_supported_features_filtered() error: uninitialized symbol 'u'.

Old smatch warnings:
drivers/cxl/core/mbox.c:1129 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 1114)

vim +/u +968 drivers/cxl/core/mbox.c

6cf5361c36766f Dave Jiang 2024-11-14  905  static void cxl_mbox_get_supported_features_filtered(struct cxl_mailbox *cxl_mbox,
6cf5361c36766f Dave Jiang 2024-11-14  906  						     struct cxl_mbox_cmd *mbox_cmd)
6cf5361c36766f Dave Jiang 2024-11-14  907  {
6cf5361c36766f Dave Jiang 2024-11-14  908  	struct cxl_mbox_get_sup_feats_in *feat_in = mbox_cmd->payload_in;
6cf5361c36766f Dave Jiang 2024-11-14  909  	struct cxl_mbox_get_sup_feats_out *feat_out = mbox_cmd->payload_out;
6cf5361c36766f Dave Jiang 2024-11-14  910  	const int feat_out_size = sizeof(*feat_out);
6cf5361c36766f Dave Jiang 2024-11-14  911  	struct cxl_feat_entry *pos;
6cf5361c36766f Dave Jiang 2024-11-14  912  	const int feat_ent_size = sizeof(*pos);
6cf5361c36766f Dave Jiang 2024-11-14  913  	int out_count, ents, u;
6cf5361c36766f Dave Jiang 2024-11-14  914  	u32 count;
6cf5361c36766f Dave Jiang 2024-11-14  915  	u16 start;
6cf5361c36766f Dave Jiang 2024-11-14  916  
6cf5361c36766f Dave Jiang 2024-11-14  917  	count = le32_to_cpu(feat_in->count);
6cf5361c36766f Dave Jiang 2024-11-14  918  	start = le16_to_cpu(feat_in->start_idx);
6cf5361c36766f Dave Jiang 2024-11-14  919  	ents = count / sizeof(struct cxl_feat_entry);
6cf5361c36766f Dave Jiang 2024-11-14  920  	ents -= start;
6cf5361c36766f Dave Jiang 2024-11-14  921  	if (ents < 0) {
6cf5361c36766f Dave Jiang 2024-11-14  922  		mbox_cmd->size_out = 0;
6cf5361c36766f Dave Jiang 2024-11-14  923  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
6cf5361c36766f Dave Jiang 2024-11-14  924  		return;
6cf5361c36766f Dave Jiang 2024-11-14  925  	}
6cf5361c36766f Dave Jiang 2024-11-14  926  
6cf5361c36766f Dave Jiang 2024-11-14  927  	if (mbox_cmd->size_out < feat_out_size) {
6cf5361c36766f Dave Jiang 2024-11-14  928  		mbox_cmd->size_out = 0;
6cf5361c36766f Dave Jiang 2024-11-14  929  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
6cf5361c36766f Dave Jiang 2024-11-14  930  		return;
6cf5361c36766f Dave Jiang 2024-11-14  931  	}
6cf5361c36766f Dave Jiang 2024-11-14  932  
6cf5361c36766f Dave Jiang 2024-11-14  933  	feat_out->supported_feats =
6cf5361c36766f Dave Jiang 2024-11-14  934  		cpu_to_le16(cxl_mbox->num_user_feats);
6cf5361c36766f Dave Jiang 2024-11-14  935  	if (ents == 0) {
6cf5361c36766f Dave Jiang 2024-11-14  936  		feat_out->num_entries = cpu_to_le16(0);
6cf5361c36766f Dave Jiang 2024-11-14  937  		mbox_cmd->size_out = feat_out_size;
6cf5361c36766f Dave Jiang 2024-11-14  938  		mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
6cf5361c36766f Dave Jiang 2024-11-14  939  		return;
6cf5361c36766f Dave Jiang 2024-11-14  940  	}
6cf5361c36766f Dave Jiang 2024-11-14  941  
6cf5361c36766f Dave Jiang 2024-11-14  942  	pos = &feat_out->ents[0];
6cf5361c36766f Dave Jiang 2024-11-14  943  	out_count = feat_out_size;
6cf5361c36766f Dave Jiang 2024-11-14  944  	for (int i = 0, u = 0; i < cxl_mbox->num_features; i++) {
                                                                ^^^^^
u is accidentally re-declared here.  ;)

6cf5361c36766f Dave Jiang 2024-11-14  945  		struct cxl_feature *feat = &cxl_mbox->entries[i];
6cf5361c36766f Dave Jiang 2024-11-14  946  
6cf5361c36766f Dave Jiang 2024-11-14  947  		if (feat->exclusive)
6cf5361c36766f Dave Jiang 2024-11-14  948  			continue;
6cf5361c36766f Dave Jiang 2024-11-14  949  
6cf5361c36766f Dave Jiang 2024-11-14  950  		if (u < start) {
6cf5361c36766f Dave Jiang 2024-11-14  951  			u++;
6cf5361c36766f Dave Jiang 2024-11-14  952  			continue;
6cf5361c36766f Dave Jiang 2024-11-14  953  		}
6cf5361c36766f Dave Jiang 2024-11-14  954  
6cf5361c36766f Dave Jiang 2024-11-14  955  		memcpy(pos, &feat->entry, feat_ent_size);
6cf5361c36766f Dave Jiang 2024-11-14  956  		out_count += feat_ent_size;
6cf5361c36766f Dave Jiang 2024-11-14  957  		pos++;
6cf5361c36766f Dave Jiang 2024-11-14  958  		u++;
6cf5361c36766f Dave Jiang 2024-11-14  959  
6cf5361c36766f Dave Jiang 2024-11-14  960  		if (u == count)
6cf5361c36766f Dave Jiang 2024-11-14  961  			break;
6cf5361c36766f Dave Jiang 2024-11-14  962  
6cf5361c36766f Dave Jiang 2024-11-14  963  		/* Make sure it does not go over total output buffer size */
6cf5361c36766f Dave Jiang 2024-11-14  964  		if (out_count + feat_ent_size >= mbox_cmd->size_out)
6cf5361c36766f Dave Jiang 2024-11-14  965  			break;
6cf5361c36766f Dave Jiang 2024-11-14  966  	}
6cf5361c36766f Dave Jiang 2024-11-14  967  
6cf5361c36766f Dave Jiang 2024-11-14 @968  	feat_out->num_entries = cpu_to_le16(u);
6cf5361c36766f Dave Jiang 2024-11-14  969  	mbox_cmd->size_out = out_count;
6cf5361c36766f Dave Jiang 2024-11-14  970  	mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
6cf5361c36766f Dave Jiang 2024-11-14  971  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

