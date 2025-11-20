Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19773372AAA
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622999; cv=none; b=W05pmNwVVjXiIAuQ0atD/InVz0LXWS61uk7YD8BB629aBE0G7zD3xWSfoAmgY/bR8QOGVEA+cAnyHhOUBiWi2CyNhffDadHcM2R0QCMXu7VFMmHKj+ZOavvJjUAgo2COskBIhB6ixOFCGbGCiz8RO4eY42hByDnkEO05B7N8+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622999; c=relaxed/simple;
	bh=CwOJX/o4hu6qzE7DMLDcfcRO9MgW+N+EcSmtRGdiw74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0HG5sXDf0T/1jg1zoKsBhIEN32gEOn5H2TV6RgkK5Ja+KuwaaT7tm1J4v1rn4XFrjwmg5tTxXHfOnh1ya3nJlkyJFxQ3S5HUHj4rgGoh7h3naztXIWnjejv81fszVwpzYXcfUudmEXDTpNeevuLomnqt9YgFIDRea60sQ3KBjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eaKvnHw/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eaKvnHw/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso5833085e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 23:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763622993; x=1764227793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adkXKf9xbfWY7SgFHiOQTlhkvfx6zW9DEVHidjQiags=;
        b=eaKvnHw/RQKzR66Vv9K/zIgF393SGHCOvitn1eJWeY3tsg1te8BU7q5T1qBJeSH3Y2
         ZAk7xcpBV2GsH1L4+Oc3lmEjgV4PjiKTIYFhDSLrf8nk3xz4j/avOlSrKNwaZV6xHKyO
         RVsKeztdTyYFvV0HjLSzIx0YiS/VpYT0Ic8CIiGxvyBBYGqC5wuOVnu7OI0NRjiUYz6V
         NcTp/ZlcbqcyE4fcTcPyXvIYCMQJrslPFFc1RbFa0jJoodUVZfRy42MsOxNGouemLsCz
         4CQ+7TN6mTwnvWYaoJxnbQqycKJT4ykOUxgZ/OjpzAQfcnHcMgFuHDeSbL8UCY0uo9zS
         LI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622993; x=1764227793;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=adkXKf9xbfWY7SgFHiOQTlhkvfx6zW9DEVHidjQiags=;
        b=R4+3xStxrkkb3sDcZLSAJutMCzUu/nSa7v+HkktMnQgXBI1GqrVmuxslYZk9nReDiV
         ryLx8y/fOQR/yOSq5GWkjsibd12muAFM7rVnoiaiET64CNJzN4QgPomg5w3aP7f0cID6
         4CIlptTCIQfFTwDk5gwJ/4ReVnCtNT8ujnIRp/McU+45OcQ8ATmcF13xy4m2Jvb2OkMY
         5mjoZGQ5j6POqBadgYuFCBrfULu9XRBZvlSQUB9m7TBh7tY58Q3FhVeszM1+GcubEXsB
         iHapTzcOaHxa6gkdB7Fnut83+yYKCuF1cluog2pExNM0DTO0hAJyFgWwaW/uD1aO50Hd
         I2Nw==
X-Gm-Message-State: AOJu0YzUx1j3+yBgEoscAzvSq5u8AdYbAQyIAk/gF9XNHj/mI8aotDxI
	aVxe3Zbe7zo7uTyipew3j+3xWveJNMfIBKTholHy6UCNJqOpEd1Ckw+A4eB1PdjfqJAgoz6PFf2
	lRwy1
X-Gm-Gg: ASbGncvMHD1Ns4daivrGqmWoKlU2C0nr/k25GVfgqU7vJ4kOHB+hax+MdcKrdaCYSRe
	BhFbQCqVa5IIhTLMSIAxveQuUgExGxKs++LwWCymTV/mvq9Nb+2hpzOK5znGuRw+UDp9AiqeV2S
	HACv3qr9ObemJhKs3xNbc6Jo90JgAUqU/QmzP1qjgkVVlQeWKE0YlDGFR1TvA1S1Y0KhO0ym3eF
	qngqGRUqDnuzkzFdqNfcp8Tamunnu4tEwgMjHQU61JShEUa5EWvD0DacvhRA9X7S205OdxkUsMH
	1PXnyj01dm19L+oBI1cNYXKF59Gt58VxiKJsokTlisEkZL0rWfHJxX29nnpztKYilBCJuImg50l
	8BrJuxLlEEToBo1EtkyHq/1lFc6uCFNs2QAacUYvTOgW/S3cSbXeDFWujCTjxSsvST4Ff6YzdOe
	rff0++tBCkw734n6T7tX79rYvvxKk=
X-Google-Smtp-Source: AGHT+IFEn6WEy0+82NR89hJpTLOZqi2AOz/IlxGO1SuW8KLDk5ChjpsiBw7aNInuEWrcr7frt5rVXQ==
X-Received: by 2002:a05:600c:1d09:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-477b8a84a40mr21794735e9.16.1763622987884;
        Wed, 19 Nov 2025 23:16:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b83142b8sm31785805e9.9.2025.11.19.23.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 23:16:27 -0800 (PST)
Date: Thu, 20 Nov 2025 10:16:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 9911/10183] fs/smb/client/fs_context.c:1839
 smb3_fs_context_parse_param() warn: variable dereferenced before check 'fc'
 (see line 1123)
Message-ID: <202511200403.G1aJi4TR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20251120071622.0X9wPW4Jfe05u5qKkAwQsrdYlPG737eSbSiDcI3ScQg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: d3f88ec60fede9bc993071f5f3ea5fb90514efdd [9911/10183] cifs: fix memory leak in smb3_fs_context_parse_param error path
config: i386-randconfig-141-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200403.G1aJi4TR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511200403.G1aJi4TR-lkp@intel.com/

smatch warnings:
fs/smb/client/fs_context.c:1839 smb3_fs_context_parse_param() warn: variable dereferenced before check 'fc' (see line 1123)

vim +/fc +1839 fs/smb/client/fs_context.c

24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1119  static int smb3_fs_context_parse_param(struct fs_context *fc,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1120  				      struct fs_parameter *param)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1121  {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1122  	struct fs_parse_result result;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1123  	struct smb3_fs_context *ctx = smb3_fc2context(fc);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1124  	int i, opt;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1125  	bool is_smb3 = !strcmp(fc->fs_type->name, "smb3");
                                                                                                       ^^^^
fc can't be NULL.

24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1126  	bool skip_parsing = false;
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1127  	char *hostname;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1128  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1129  	cifs_dbg(FYI, "CIFS: parsing cifs mount option '%s'\n", param->key);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1130  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1131  	/*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1132  	 * fs_parse can not handle string options with an empty value so
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1133  	 * we will need special handling of them.
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1134  	 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1135  	if (param->type == fs_value_is_string && param->string[0] == 0) {
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1136  		if (!strcmp("pass", param->key) || !strcmp("password", param->key)) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1137  			skip_parsing = true;
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1138  			opt = Opt_pass;
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16  1139  		} else if (!strcmp("user", param->key) || !strcmp("username", param->key)) {
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16  1140  			skip_parsing = true;
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16  1141  			opt = Opt_user;
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12  1142  		} else if (!strcmp("pass2", param->key) || !strcmp("password2", param->key)) {
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12  1143  			skip_parsing = true;
fc99045effa81f fs/smb/client/fs_context.c Paulo Alcantara   2025-03-12  1144  			opt = Opt_pass2;
5c4b642141eb35 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1145  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1146  	}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1147  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1148  	if (!skip_parsing) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1149  		opt = fs_parse(fc, smb3_fs_parameters, param, &result);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1150  		if (opt < 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1151  			return ctx->sloppy ? 1 : opt;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1152  	}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1153  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1154  	switch (opt) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1155  	case Opt_compress:
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26  1156  		if (!IS_ENABLED(CONFIG_CIFS_COMPRESSION)) {
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26  1157  			cifs_errorf(fc, "CONFIG_CIFS_COMPRESSION kernel config option is unset\n");
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26  1158  			goto cifs_parse_mount_err;
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26  1159  		}
8fe7062b7d11fc fs/smb/client/fs_context.c Enzo Matsumiya    2024-02-23  1160  		ctx->compress = true;
d14bbfff259cad fs/smb/client/fs_context.c Steve French      2024-07-26  1161  		cifs_dbg(VFS, "SMB3 compression support is experimental\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1162  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1163  	case Opt_nodfs:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1164  		ctx->nodfs = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1165  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1166  	case Opt_hard:
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1167  		if (result.negated) {
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1168  			if (ctx->retry == 1)
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1169  				cifs_dbg(VFS, "conflicting hard vs. soft mount options\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1170  			ctx->retry = 0;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1171  		} else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1172  			ctx->retry = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1173  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1174  	case Opt_soft:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1175  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1176  			ctx->retry = 1;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1177  		else {
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1178  			if (ctx->retry == 1)
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1179  				cifs_dbg(VFS, "conflicting hard vs soft mount options\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1180  			ctx->retry = 0;
9d91f8108ebfed fs/cifs/fs_context.c       Steve French      2022-12-11  1181  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1182  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1183  	case Opt_mapposix:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1184  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1185  			ctx->remap = false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1186  		else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1187  			ctx->remap = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1188  			ctx->sfu_remap = false; /* disable SFU mapping */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1189  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1190  		break;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1191  	case Opt_mapchars:
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1192  		if (result.negated)
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1193  			ctx->sfu_remap = false;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1194  		else {
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1195  			ctx->sfu_remap = true;
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1196  			ctx->remap = false; /* disable SFM (mapposix) mapping */
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1197  		}
cb8b02fd634322 fs/cifs/fs_context.c       Steve French      2023-05-24  1198  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1199  	case Opt_user_xattr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1200  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1201  			ctx->no_xattr = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1202  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1203  			ctx->no_xattr = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1204  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1205  	case Opt_forceuid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1206  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1207  			ctx->override_uid = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1208  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1209  			ctx->override_uid = 1;
77d8aa79ecfb20 fs/smb/client/fs_context.c Takayuki Nagata   2024-04-15  1210  		ctx->forceuid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1211  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1212  	case Opt_forcegid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1213  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1214  			ctx->override_gid = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1215  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1216  			ctx->override_gid = 1;
77d8aa79ecfb20 fs/smb/client/fs_context.c Takayuki Nagata   2024-04-15  1217  		ctx->forcegid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1218  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1219  	case Opt_perm:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1220  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1221  			ctx->noperm = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1222  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1223  			ctx->noperm = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1224  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1225  	case Opt_dynperm:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1226  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1227  			ctx->dynperm = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1228  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1229  			ctx->dynperm = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1230  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1231  	case Opt_sfu:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1232  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1233  			ctx->sfu_emul = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1234  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1235  			ctx->sfu_emul = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1236  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1237  	case Opt_noblocksend:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1238  		ctx->noblocksnd = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1239  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1240  	case Opt_noautotune:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1241  		ctx->noautotune = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1242  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1243  	case Opt_nolease:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1244  		ctx->no_lease = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1245  		break;
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23  1246  	case Opt_nosparse:
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23  1247  		ctx->no_sparse = 1;
52832252dded19 fs/cifs/fs_context.c       Steve French      2022-05-23  1248  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1249  	case Opt_nodelete:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1250  		ctx->nodelete = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1251  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1252  	case Opt_multichannel:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1253  		if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1254  			ctx->multichannel = false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1255  			ctx->max_channels = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1256  		} else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1257  			ctx->multichannel = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1258  			/* if number of channels not specified, default to 2 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1259  			if (ctx->max_channels < 2)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1260  				ctx->max_channels = 2;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1261  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1262  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1263  	case Opt_uid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27  1264  		ctx->linux_uid = result.uid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1265  		ctx->uid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1266  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1267  	case Opt_cruid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27  1268  		ctx->cred_uid = result.uid;
e0a3cbcd5cef00 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-08  1269  		ctx->cruid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1270  		break;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28  1271  	case Opt_backupuid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27  1272  		ctx->backupuid = result.uid;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28  1273  		ctx->backupuid_specified = true;
b946dbcfa4df80 fs/cifs/fs_context.c       Ronnie Sahlberg   2021-07-28  1274  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1275  	case Opt_backupgid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27  1276  		ctx->backupgid = result.gid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1277  		ctx->backupgid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1278  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1279  	case Opt_gid:
3229e3a5a37450 fs/smb/client/fs_context.c Eric Sandeen      2024-06-27  1280  		ctx->linux_gid = result.gid;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1281  		ctx->gid_specified = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1282  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1283  	case Opt_port:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1284  		ctx->port = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1285  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1286  	case Opt_file_mode:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1287  		ctx->file_mode = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1288  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1289  	case Opt_dirmode:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1290  		ctx->dir_mode = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1291  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1292  	case Opt_min_enc_offload:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1293  		ctx->min_offload = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1294  		break;
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17  1295  	case Opt_retrans:
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17  1296  		ctx->retrans = result.uint_32;
ce09f8d8a7130e fs/smb/client/fs_context.c Shyam Prasad N    2024-01-17  1297  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1298  	case Opt_blocksize:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1299  		/*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1300  		 * inode blocksize realistically should never need to be
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1301  		 * less than 16K or greater than 16M and default is 1MB.
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1302  		 * Note that small inode block sizes (e.g. 64K) can lead
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1303  		 * to very poor performance of common tools like cp and scp
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1304  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1305  		if ((result.uint_32 < CIFS_MAX_MSGSIZE) ||
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1306  		   (result.uint_32 > (4 * SMB3_DEFAULT_IOSIZE))) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1307  			cifs_errorf(fc, "%s: Invalid blocksize\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1308  				__func__);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1309  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1310  		}
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1311  		ctx->bsize = CIFS_ALIGN_BSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1312  		ctx->got_bsize = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1313  		break;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1314  	case Opt_rasize:
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1315  		/*
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1316  		 * readahead size realistically should never need to be
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1317  		 * less than 1M (CIFS_DEFAULT_IOSIZE) or greater than 32M
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1318  		 * (perhaps an exception should be considered in the
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1319  		 * for the case of a large number of channels
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1320  		 * when multichannel is negotiated) since that would lead
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1321  		 * to plenty of parallel I/O in flight to the server.
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1322  		 * Note that smaller read ahead sizes would
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1323  		 * hurt performance of common tools like cp and scp
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1324  		 * which often trigger sequential i/o with read ahead
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1325  		 */
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1326  		if ((result.uint_32 > (8 * SMB3_DEFAULT_IOSIZE)) ||
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1327  		    (result.uint_32 < CIFS_DEFAULT_IOSIZE)) {
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1328  			cifs_errorf(fc, "%s: Invalid rasize %d vs. %d\n",
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1329  				__func__, result.uint_32, SMB3_DEFAULT_IOSIZE);
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1330  			goto cifs_parse_mount_err;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1331  		}
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1332  		ctx->rasize = result.uint_32;
b8d64f8ced62f9 fs/cifs/fs_context.c       Steve French      2021-04-24  1333  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1334  	case Opt_rsize:
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1335  		ctx->rsize = CIFS_ALIGN_RSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1336  		ctx->got_rsize = true;
287906b20035a0 fs/smb/client/fs_context.c Wang Zhaolong     2025-03-31  1337  		ctx->vol_rsize = ctx->rsize;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1338  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1339  	case Opt_wsize:
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1340  		ctx->wsize = CIFS_ALIGN_WSIZE(fc, result.uint_32);
522aa3b5753225 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1341  		ctx->got_wsize = true;
287906b20035a0 fs/smb/client/fs_context.c Wang Zhaolong     2025-03-31  1342  		ctx->vol_wsize = ctx->wsize;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1343  		break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1344  	case Opt_acregmax:
7489161b185239 fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1345  		if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1346  			cifs_errorf(fc, "acregmax too large\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1347  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1348  		}
7489161b185239 fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1349  		ctx->acregmax = HZ * result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1350  		break;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23  1351  	case Opt_acdirmax:
5b29891f91dfb8 fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1352  		if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1353  			cifs_errorf(fc, "acdirmax too large\n");
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23  1354  			goto cifs_parse_mount_err;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23  1355  		}
5b29891f91dfb8 fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1356  		ctx->acdirmax = HZ * result.uint_32;
4c9f948142a550 fs/cifs/fs_context.c       Steve French      2021-02-23  1357  		break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1358  	case Opt_actimeo:
64f690ee22c99e fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1359  		if (result.uint_32 > CIFS_MAX_ACTIMEO / HZ) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1360  			cifs_errorf(fc, "timeout too large\n");
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1361  			goto cifs_parse_mount_err;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1362  		}
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1363  		if ((ctx->acdirmax != CIFS_DEF_ACTIMEO) ||
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1364  		    (ctx->acregmax != CIFS_DEF_ACTIMEO)) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1365  			cifs_errorf(fc, "actimeo ignored since acregmax or acdirmax specified\n");
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1366  			break;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1367  		}
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1368  		ctx->acdirmax = ctx->acregmax = HZ * result.uint_32;
5780464614f6ab fs/cifs/fs_context.c       Steve French      2021-02-24  1369  		break;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11  1370  	case Opt_closetimeo:
d5a30fddfe2f2e fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1371  		if (result.uint_32 > SMB3_MAX_DCLOSETIMEO / HZ) {
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11  1372  			cifs_errorf(fc, "closetimeo too large\n");
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11  1373  			goto cifs_parse_mount_err;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11  1374  		}
d5a30fddfe2f2e fs/smb/client/fs_context.c Murad Masimov     2025-03-11  1375  		ctx->closetimeo = HZ * result.uint_32;
5efdd9122eff77 fs/cifs/fs_context.c       Steve French      2022-08-11  1376  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1377  	case Opt_echo_interval:
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31  1378  		if (result.uint_32 < SMB_ECHO_INTERVAL_MIN ||
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31  1379  		    result.uint_32 > SMB_ECHO_INTERVAL_MAX) {
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31  1380  			cifs_errorf(fc, "echo interval is out of bounds\n");
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31  1381  			goto cifs_parse_mount_err;
2510859475d7f4 fs/smb/client/fs_context.c Roman Smirnov     2025-03-31  1382  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1383  		ctx->echo_interval = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1384  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1385  	case Opt_snapshot:
9405b5f8b20c2b fs/cifs/fs_context.c       Steve French      2022-02-12  1386  		ctx->snapshot_time = result.uint_64;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1387  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1388  	case Opt_max_credits:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1389  		if (result.uint_32 < 20 || result.uint_32 > 60000) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1390  			cifs_errorf(fc, "%s: Invalid max_credits value\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1391  				 __func__);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1392  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1393  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1394  		ctx->max_credits = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1395  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1396  	case Opt_max_channels:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1397  		if (result.uint_32 < 1 || result.uint_32 > CIFS_MAX_CHANNELS) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1398  			cifs_errorf(fc, "%s: Invalid max_channels value, needs to be 1-%d\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1399  				 __func__, CIFS_MAX_CHANNELS);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1400  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1401  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1402  		ctx->max_channels = result.uint_32;
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07  1403  		/* If more than one channel requested ... they want multichan */
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07  1404  		if (result.uint_32 > 1)
c1f8a398b6d661 fs/cifs/fs_context.c       Steve French      2021-05-07  1405  			ctx->multichannel = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1406  		break;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1407  	case Opt_max_cached_dirs:
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1408  		if (result.uint_32 < 1) {
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1409  			cifs_errorf(fc, "%s: Invalid max_cached_dirs, needs to be 1 or more\n",
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1410  				    __func__);
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1411  			goto cifs_parse_mount_err;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1412  		}
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1413  		ctx->max_cached_dirs = result.uint_32;
6a50d71d0ffff6 fs/smb/client/fs_context.c Steve French      2023-09-01  1414  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1415  	case Opt_handletimeout:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1416  		ctx->handle_timeout = result.uint_32;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1417  		if (ctx->handle_timeout > SMB3_MAX_HANDLE_TIMEOUT) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1418  			cifs_errorf(fc, "Invalid handle cache timeout, longer than 16 minutes\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1419  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1420  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1421  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1422  	case Opt_source:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1423  		kfree(ctx->UNC);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1424  		ctx->UNC = NULL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1425  		switch (smb3_parse_devname(param->string, ctx)) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1426  		case 0:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1427  			break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1428  		case -ENOMEM:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1429  			cifs_errorf(fc, "Unable to allocate memory for devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1430  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1431  		case -EINVAL:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1432  			cifs_errorf(fc, "Malformed UNC in devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1433  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1434  		default:
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1435  			cifs_errorf(fc, "Unknown error parsing devname\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1436  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1437  		}
e8c73eb7db0a49 fs/smb/client/fs_context.c Edward Adam Davis 2025-11-07  1438  		kfree(ctx->source);
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27  1439  		ctx->source = smb3_fs_context_fullpath(ctx, '/');
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27  1440  		if (IS_ERR(ctx->source)) {
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27  1441  			ctx->source = NULL;
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1442  			cifs_errorf(fc, "OOM when copying UNC string\n");
af1a3d2ba9543e fs/cifs/fs_context.c       Ronnie Sahlberg   2021-02-11  1443  			goto cifs_parse_mount_err;
af1a3d2ba9543e fs/cifs/fs_context.c       Ronnie Sahlberg   2021-02-11  1444  		}
e8c73eb7db0a49 fs/smb/client/fs_context.c Edward Adam Davis 2025-11-07  1445  		kfree(fc->source);
49024ec8795ed2 fs/smb/client/fs_context.c Paulo Alcantara   2023-06-27  1446  		fc->source = kstrdup(ctx->source, GFP_KERNEL);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1447  		if (fc->source == NULL) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1448  			cifs_errorf(fc, "OOM when copying UNC string\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1449  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1450  		}
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1451  		hostname = extract_hostname(ctx->UNC);
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1452  		if (IS_ERR(hostname)) {
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1453  			cifs_errorf(fc, "Cannot extract hostname from UNC string\n");
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1454  			goto cifs_parse_mount_err;
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1455  		}
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1456  		/* last byte, type, is 0x20 for servr type */
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1457  		memset(ctx->target_rfc1001_name, 0x20, RFC1001_NAME_LEN_WITH_NULL);
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1458  		for (i = 0; i < RFC1001_NAME_LEN && hostname[i] != 0; i++)
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1459  			ctx->target_rfc1001_name[i] = toupper(hostname[i]);
be786e509c1af9 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1460  		kfree(hostname);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1461  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1462  	case Opt_user:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1463  		kfree(ctx->username);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1464  		ctx->username = NULL;
270d73e6507f9c fs/smb/client/fs_context.c Scott Mayhew      2023-08-16  1465  		if (ctx->nullauth)
270d73e6507f9c fs/smb/client/fs_context.c Scott Mayhew      2023-08-16  1466  			break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1467  		if (strlen(param->string) == 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1468  			/* null user, ie. anonymous authentication */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1469  			ctx->nullauth = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1470  			break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1471  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1472  
ed6612165b74f0 fs/smb/client/fs_context.c Yiqi Sun          2025-11-11  1473  		if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) ==
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1474  		    CIFS_MAX_USERNAME_LEN) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1475  			pr_warn("username too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1476  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1477  		}
e5acab35feffb6 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26  1478  		ctx->username = no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1479  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1480  	case Opt_pass:
a4e430c8c8ba96 fs/cifs/fs_context.c       Enzo Matsumiya    2022-09-20  1481  		kfree_sensitive(ctx->password);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1482  		ctx->password = NULL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1483  		if (strlen(param->string) == 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1484  			break;
524fa5bcc38449 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26  1485  		ctx->password = no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1486  		break;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1487  	case Opt_pass2:
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1488  		kfree_sensitive(ctx->password2);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1489  		ctx->password2 = NULL;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1490  		if (strlen(param->string) == 0)
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1491  			break;
1b6075ebd34da9 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26  1492  		ctx->password2 = no_free_ptr(param->string);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1493  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1494  	case Opt_ip:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1495  		if (strlen(param->string) == 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1496  			ctx->got_ip = false;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1497  			break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1498  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1499  		if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1500  					  param->string,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1501  					  strlen(param->string))) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1502  			pr_err("bad ip= option (%s)\n", param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1503  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1504  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1505  		ctx->got_ip = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1506  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1507  	case Opt_domain:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1508  		if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1509  				== CIFS_MAX_DOMAINNAME_LEN) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1510  			pr_warn("domain name too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1511  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1512  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1513  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1514  		kfree(ctx->domainname);
60c9511253d508 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26  1515  		ctx->domainname = no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1516  		cifs_dbg(FYI, "Domain name set\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1517  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1518  	case Opt_srcaddr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1519  		if (!cifs_convert_address(
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1520  				(struct sockaddr *)&ctx->srcaddr,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1521  				param->string, strlen(param->string))) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1522  			pr_warn("Could not parse srcaddr: %s\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1523  				param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1524  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1525  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1526  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1527  	case Opt_iocharset:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1528  		if (strnlen(param->string, 1024) >= 65) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1529  			pr_warn("iocharset name too long\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1530  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1531  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1532  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1533  		if (strncasecmp(param->string, "default", 7) != 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1534  			kfree(ctx->iocharset);
28f09823de9292 fs/smb/client/fs_context.c Paulo Alcantara   2025-07-26  1535  			ctx->iocharset = no_free_ptr(param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1536  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1537  		/* if iocharset not set then load_nls_default
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1538  		 * is used by caller
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1539  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1540  		cifs_dbg(FYI, "iocharset set to %s\n", ctx->iocharset);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1541  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1542  	case Opt_netbiosname:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1543  		memset(ctx->source_rfc1001_name, 0x20,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1544  			RFC1001_NAME_LEN);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1545  		/*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1546  		 * FIXME: are there cases in which a comma can
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1547  		 * be valid in workstation netbios name (and
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1548  		 * need special handling)?
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1549  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1550  		for (i = 0; i < RFC1001_NAME_LEN; i++) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1551  			/* don't ucase netbiosname for user */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1552  			if (param->string[i] == 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1553  				break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1554  			ctx->source_rfc1001_name[i] = param->string[i];
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1555  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1556  		/* The string has 16th byte zero still from
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1557  		 * set at top of the function
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1558  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1559  		if (i == RFC1001_NAME_LEN && param->string[i] != 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1560  			pr_warn("netbiosname longer than 15 truncated\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1561  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1562  	case Opt_servern:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1563  		/* last byte, type, is 0x20 for servr type */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1564  		memset(ctx->target_rfc1001_name, 0x20,
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1565  			RFC1001_NAME_LEN_WITH_NULL);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1566  		/*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1567  		 * BB are there cases in which a comma can be valid in this
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1568  		 * workstation netbios name (and need special handling)?
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1569  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1570  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1571  		/* user or mount helper must uppercase the netbios name */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1572  		for (i = 0; i < 15; i++) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1573  			if (param->string[i] == 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1574  				break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1575  			ctx->target_rfc1001_name[i] = param->string[i];
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1576  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1577  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1578  		/* The string has 16th byte zero still from set at top of function */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1579  		if (i == RFC1001_NAME_LEN && param->string[i] != 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1580  			pr_warn("server netbiosname longer than 15 truncated\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1581  		break;
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1582  	case Opt_nbsessinit:
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1583  		ctx->rfc1001_sessinit = !result.negated;
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1584  		cifs_dbg(FYI, "rfc1001_sessinit set to %d\n", ctx->rfc1001_sessinit);
7d14dd683b1b00 fs/smb/client/fs_context.c Pali Rohár        2024-10-27  1585  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1586  	case Opt_ver:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1587  		/* version of mount userspace tools, not dialect */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1588  		/* If interface changes in mount.cifs bump to new ver */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1589  		if (strncasecmp(param->string, "1", 1) == 0) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1590  			if (strlen(param->string) > 1) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1591  				pr_warn("Bad mount helper ver=%s. Did you want SMB1 (CIFS) dialect and mean to type vers=1.0 instead?\n",
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1592  					param->string);
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1593  				goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1594  			}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1595  			/* This is the default */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1596  			break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1597  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1598  		/* For all other value, error */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1599  		pr_warn("Invalid mount helper version specified\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1600  		goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1601  	case Opt_vers:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1602  		/* protocol version (dialect) */
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1603  		if (cifs_parse_smb_version(fc, param->string, ctx, is_smb3) != 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1604  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1605  		ctx->got_version = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1606  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1607  	case Opt_sec:
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1608  		if (cifs_parse_security_flavors(fc, param->string, ctx) != 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1609  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1610  		break;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1611  	case Opt_upcalltarget:
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1612  		if (cifs_parse_upcall_target(fc, param->string, ctx) != 0)
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1613  			goto cifs_parse_mount_err;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1614  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1615  	case Opt_cache:
d9a8692277496b fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1616  		if (cifs_parse_cache_flavor(fc, param->string, ctx) != 0)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1617  			goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1618  		break;
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1619  	case Opt_witness:
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1620  #ifndef CONFIG_CIFS_SWN_UPCALL
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1621  		cifs_errorf(fc, "Witness support needs CONFIG_CIFS_SWN_UPCALL config option\n");
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1622  			goto cifs_parse_mount_err;
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1623  #endif
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1624  		ctx->witness = true;
dd538034f84fa4 fs/cifs/fs_context.c       Steve French      2020-12-14  1625  		pr_warn_once("Witness protocol support is experimental\n");
0ac4e2919aa408 fs/cifs/fs_context.c       Samuel Cabrero    2020-12-11  1626  		break;
e14b64247438e5 fs/smb/client/fs_context.c Pali Rohár        2024-10-06  1627  	case Opt_unicode:
e14b64247438e5 fs/smb/client/fs_context.c Pali Rohár        2024-10-06  1628  		ctx->unicode = !result.negated;
e14b64247438e5 fs/smb/client/fs_context.c Pali Rohár        2024-10-06  1629  		cifs_dbg(FYI, "unicode set to %d\n", ctx->unicode);
e14b64247438e5 fs/smb/client/fs_context.c Pali Rohár        2024-10-06  1630  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1631  	case Opt_rootfs:
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18  1632  #ifndef CONFIG_CIFS_ROOT
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18  1633  		cifs_dbg(VFS, "rootfs support requires CONFIG_CIFS_ROOT config option\n");
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18  1634  		goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1635  #endif
af3ef3b1031634 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-18  1636  		ctx->rootfs = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1637  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1638  	case Opt_posixpaths:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1639  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1640  			ctx->posix_paths = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1641  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1642  			ctx->posix_paths = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1643  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1644  	case Opt_unix:
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1645  		if (result.negated) {
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1646  			if (ctx->linux_ext == 1)
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1647  				pr_warn_once("conflicting posix mount options specified\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1648  			ctx->linux_ext = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1649  			ctx->no_linux_ext = 1;
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1650  		} else {
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1651  			if (ctx->no_linux_ext == 1)
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1652  				pr_warn_once("conflicting posix mount options specified\n");
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1653  			ctx->linux_ext = 1;
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1654  			ctx->no_linux_ext = 0;
6b445309eec2bc fs/smb/client/fs_context.c Paulo Alcantara   2025-07-31  1655  			ctx->nonativesocket = 1; /* POSIX mounts use NFS style reparse points */
7321be2663da59 fs/cifs/fs_context.c       Steve French      2021-08-23  1656  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1657  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1658  	case Opt_nocase:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1659  		ctx->nocase = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1660  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1661  	case Opt_brl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1662  		if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1663  			/*
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1664  			 * turn off mandatory locking in mode
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1665  			 * if remote locking is turned off since the
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1666  			 * local vfs will do advisory
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1667  			 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1668  			if (ctx->file_mode ==
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1669  				(S_IALLUGO & ~(S_ISUID | S_IXGRP)))
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1670  				ctx->file_mode = S_IALLUGO;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1671  			ctx->nobrl =  1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1672  		} else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1673  			ctx->nobrl =  0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1674  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1675  	case Opt_handlecache:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1676  		if (result.negated)
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1677  			ctx->nohandlecache = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1678  		else
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1679  			ctx->nohandlecache = 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1680  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1681  	case Opt_forcemandatorylock:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1682  		ctx->mand_lock = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1683  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1684  	case Opt_setuids:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1685  		ctx->setuids = result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1686  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1687  	case Opt_intr:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1688  		ctx->intr = !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1689  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1690  	case Opt_setuidfromacl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1691  		ctx->setuidfromacl = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1692  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1693  	case Opt_strictsync:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1694  		ctx->nostrictsync = result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1695  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1696  	case Opt_serverino:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1697  		ctx->server_ino = !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1698  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1699  	case Opt_rwpidforward:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1700  		ctx->rwpidforward = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1701  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1702  	case Opt_modesid:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1703  		ctx->mode_ace = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1704  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1705  	case Opt_cifsacl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1706  		ctx->cifs_acl = !result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1707  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1708  	case Opt_acl:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1709  		ctx->no_psx_acl = result.negated;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1710  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1711  	case Opt_locallease:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1712  		ctx->local_lease = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1713  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1714  	case Opt_sign:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1715  		ctx->sign = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1716  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1717  	case Opt_ignore_signature:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1718  		ctx->sign = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1719  		ctx->ignore_signature = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1720  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1721  	case Opt_seal:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1722  		/* we do not do the following in secFlags because seal
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1723  		 * is a per tree connection (mount) not a per socket
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1724  		 * or per-smb connection option in the protocol
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1725  		 * vol->secFlg |= CIFSSEC_MUST_SEAL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1726  		 */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1727  		ctx->seal = 1;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1728  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1729  	case Opt_noac:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1730  		pr_warn("Mount option noac not supported. Instead set /proc/fs/cifs/LookupCacheEnabled to 0\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1731  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1732  	case Opt_fsc:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1733  #ifndef CONFIG_CIFS_FSCACHE
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1734  		cifs_errorf(fc, "FS-Cache support needs CONFIG_CIFS_FSCACHE kernel config option set\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1735  		goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1736  #endif
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1737  		ctx->fsc = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1738  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1739  	case Opt_mfsymlinks:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1740  		ctx->mfsymlinks = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1741  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1742  	case Opt_multiuser:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1743  		ctx->multiuser = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1744  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1745  	case Opt_sloppy:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1746  		ctx->sloppy = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1747  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1748  	case Opt_nosharesock:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1749  		ctx->nosharesock = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1750  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1751  	case Opt_persistent:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1752  		if (result.negated) {
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16  1753  			ctx->nopersistent = true;
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16  1754  			if (ctx->persistent) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1755  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1756  				goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1757  			}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1758  		} else {
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16  1759  			ctx->persistent = true;
27cf94853e6d2b fs/cifs/fs_context.c       Steve French      2020-12-16  1760  			if ((ctx->nopersistent) || (ctx->resilient)) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1761  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1762  				goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1763  			}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1764  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1765  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1766  	case Opt_resilient:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1767  		if (result.negated) {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1768  			ctx->resilient = false; /* already the default */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1769  		} else {
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1770  			ctx->resilient = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1771  			if (ctx->persistent) {
24fedddc954ed1 fs/cifs/fs_context.c       Aurelien Aptel    2021-03-01  1772  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1773  				goto cifs_parse_mount_err;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1774  			}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1775  		}
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1776  		break;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1777  	case Opt_tcp_nodelay:
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1778  		/* tcp nodelay should not usually be needed since we CORK/UNCORK the socket */
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1779  		if (result.negated)
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1780  			ctx->sockopt_tcp_nodelay = false;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1781  		else
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1782  			ctx->sockopt_tcp_nodelay = true;
7ae5e588b0a53a fs/cifs/fs_context.c       Steve French      2021-10-14  1783  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1784  	case Opt_domainauto:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1785  		ctx->domainauto = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1786  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1787  	case Opt_rdma:
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1788  		ctx->rdma = true;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1789  		break;
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21  1790  	case Opt_reparse:
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21  1791  		if (parse_reparse_flavor(fc, param->string, ctx))
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21  1792  			goto cifs_parse_mount_err;
eb90e8ecb2b54a fs/smb/client/fs_context.c Paulo Alcantara   2024-01-21  1793  		break;
45a99d5d117300 fs/smb/client/fs_context.c Pali Rohár        2024-09-16  1794  	case Opt_nativesocket:
45a99d5d117300 fs/smb/client/fs_context.c Pali Rohár        2024-09-16  1795  		ctx->nonativesocket = result.negated;
45a99d5d117300 fs/smb/client/fs_context.c Pali Rohár        2024-09-16  1796  		break;
660618dde2b4c3 fs/smb/client/fs_context.c Pali Rohár        2024-10-11  1797  	case Opt_symlink:
660618dde2b4c3 fs/smb/client/fs_context.c Pali Rohár        2024-10-11  1798  		if (parse_symlink_flavor(fc, param->string, ctx))
660618dde2b4c3 fs/smb/client/fs_context.c Pali Rohár        2024-10-11  1799  			goto cifs_parse_mount_err;
660618dde2b4c3 fs/smb/client/fs_context.c Pali Rohár        2024-10-11  1800  		break;
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1801  	case Opt_symlinkroot:
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1802  		if (param->string[0] != '/') {
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1803  			cifs_errorf(fc, "symlinkroot mount options must be absolute path\n");
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1804  			goto cifs_parse_mount_err;
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1805  		}
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1806  		if (strnlen(param->string, PATH_MAX) == PATH_MAX) {
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1807  			cifs_errorf(fc, "symlinkroot path too long (max path length: %u)\n",
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1808  				    PATH_MAX - 1);
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1809  			goto cifs_parse_mount_err;
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1810  		}
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1811  		kfree(ctx->symlinkroot);
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1812  		ctx->symlinkroot = param->string;
3363da82e02f1b fs/smb/client/fs_context.c Paulo Alcantara   2025-07-03  1813  		param->string = NULL;
12b466eb52d926 fs/smb/client/fs_context.c Pali Rohár        2024-09-23  1814  		break;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1815  	}
31f6551ad75608 fs/cifs/fs_context.c       Steve French      2020-12-16  1816  	/* case Opt_ignore: - is ignored as expected ... */
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1817  
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1818  	if (ctx->multiuser && ctx->upcall_target == UPTARGET_MOUNT) {
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1819  		cifs_errorf(fc, "multiuser mount option not supported with upcalltarget set as 'mount'\n");
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1820  		goto cifs_parse_mount_err;
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1821  	}
db363b0a1d9e6b fs/smb/client/fs_context.c Ritvik Budhiraja  2024-11-11  1822  
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1823  	/*
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1824  	 * Multichannel is not meaningful if max_channels is 1.
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1825  	 * Force multichannel to false to ensure consistent configuration.
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1826  	 */
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1827  	if (ctx->multichannel && ctx->max_channels == 1)
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1828  		ctx->multichannel = false;
37e263e68c5e27 fs/smb/client/fs_context.c Rajasi Mandal     2025-09-22  1829  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1830  	return 0;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1831  
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1832   cifs_parse_mount_err:
a4e430c8c8ba96 fs/cifs/fs_context.c       Enzo Matsumiya    2022-09-20  1833  	kfree_sensitive(ctx->password);
e6e43b8aa7cd3c fs/smb/client/fs_context.c Quang Le          2023-09-29  1834  	ctx->password = NULL;
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1835  	kfree_sensitive(ctx->password2);
35f834265e0dc7 fs/smb/client/fs_context.c Steve French      2024-04-04  1836  	ctx->password2 = NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18  1837  	kfree(ctx->source);
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18  1838  	ctx->source = NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18 @1839  	if (fc) {
                                                                                ^^^^^^^^^
So, no need for this NULL check.

d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18  1840  		kfree(fc->source);
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18  1841  		fc->source = NULL;
d3f88ec60fede9 fs/smb/client/fs_context.c Shaurya Rane      2025-11-18  1842  	}
bd2f0b43c1c864 fs/cifs/fs_context.c       Steve French      2021-01-28  1843  	return -EINVAL;
24e0a1eff9e2b9 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-10  1844  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

