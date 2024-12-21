Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E123216088F
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734811246; cv=none; b=Dh6ZXqBkFuY0qQqUdq5XE1SoVcAwHGZfUN00UsfGMD4UPS05TnYL7xlRew4EfHWHaluaOrIHNMlu4+9hh2Ctf4p3ruSdfeBQz5MHSLeT5NUhysxJ3pzR6MHcWBq7whtnkA1vuWiNT4gY7dc6TKSl7ksTW+2e0b3Pve8vmlwZxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734811246; c=relaxed/simple;
	bh=nYoNK6/vw35l14JqsTQYpZ1dniaF5BJDSCM5miR6eAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJXGuIcYmTNwVmOS7cYIMvYKiupXbtWPVfTwrwX8Vnq6w0SsRX3+bj7sYtSg5ICbU6pZoYT56uVtc21vBcJHBlmsal1q3bFEJ8hpL21YFh01ORxtP93LP7GLcVoMl3VgQ3gbeWqHvwQ/e8gQr9awMvtsHA3lUtq02UOWh2+weqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQakYUQ/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQakYUQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734811242; x=1766347242;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nYoNK6/vw35l14JqsTQYpZ1dniaF5BJDSCM5miR6eAE=;
  b=lQakYUQ/ogHufrqmbSt3EHGpiImPyD3bc4OU12Pb68KghFASCFJ5Hpm9
   Dr0XkeLUvhLyoD1e/OoMhBvBqbSBu/fd1NvmT366E8t1Vk9l1VpsqH7yH
   nCmKwdq6yAwNktuPIkxY6mXb4rTZO/GUJcdWfBhrQRHvrpXuXvtbhviT1
   9H5XcQ7vtiJdaP+h0uF9DnC8+VezZiYqlrEmApKF1In9R0jrVuGq5hHw/
   W3iSTqh3ftPtLV1OVqMHZLxbyxsn7xNr12olSFzfRAO2uV2AbX+SEwFkp
   H2GnBrWc+Bp3/VYp4bx4f6QQqCwvldv3noUgcykyowO3rDQjrGkRs0fgG
   w==;
X-CSE-ConnectionGUID: M/pPHdn0RoGtkNvVyUFxeg==
X-CSE-MsgGUID: eCWZYybwR66Kr4sFgOkEOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39270344"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39270344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 12:00:41 -0800
X-CSE-ConnectionGUID: EXWdc6CSQxib88DZKkY+xg==
X-CSE-MsgGUID: Xgg0OSuwR0mt/QoP25JO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102931948"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 12:00:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP5eP-0002Rl-0c;
	Sat, 21 Dec 2024 20:00:37 +0000
Date: Sun, 22 Dec 2024 04:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cifs:for-next-next 13/13] fs/smb/client/fs_context.c:1466
 smb3_fs_context_parse_param() warn: statement has no effect 22
Message-ID: <202412220354.ZyCvciEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-cifs@vger.kernel.org
CC: samba-technical@lists.samba.org
TO: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
head:   8f97b4a68ea216bad142a5391e30fa63c8efce30
commit: 8f97b4a68ea216bad142a5391e30fa63c8efce30 [13/13] smb3 client: minor cleanup of username parsing on mount
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220354.ZyCvciEy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220354.ZyCvciEy-lkp@intel.com/

smatch warnings:
fs/smb/client/fs_context.c:1466 smb3_fs_context_parse_param() warn: statement has no effect 22

vim +1466 fs/smb/client/fs_context.c

d6a78783407cdf9 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1114  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1115  static int smb3_fs_context_parse_param(struct fs_context *fc,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1116  				      struct fs_parameter *param)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1117  {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1118  	struct fs_parse_result result;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1119  	struct smb3_fs_context *ctx = smb3_fc2context(fc);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1120  	int i, opt;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1121  	bool is_smb3 = !strcmp(fc->fs_type->name, "smb3");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1122  	bool skip_parsing = false;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1123  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1124  	cifs_dbg(FYI, "CIFS: parsing cifs mount option '%s'\n", param->key);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1125  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1126  	/*
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1127  	 * fs_parse can not handle string options with an empty value so
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1128  	 * we will need special handling of them.
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1129  	 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1130  	if (param->type == fs_value_is_string && param->string[0] == 0) {
5c4b642141eb357 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1131  		if (!strcmp("pass", param->key) || !strcmp("password", param->key)) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1132  			skip_parsing = true;
5c4b642141eb357 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1133  			opt = Opt_pass;
31f6551ad75608d fs/cifs/fs_context.c       Steve French     2020-12-16  1134  		} else if (!strcmp("user", param->key) || !strcmp("username", param->key)) {
31f6551ad75608d fs/cifs/fs_context.c       Steve French     2020-12-16  1135  			skip_parsing = true;
31f6551ad75608d fs/cifs/fs_context.c       Steve French     2020-12-16  1136  			opt = Opt_user;
5c4b642141eb357 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1137  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1138  	}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1139  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1140  	if (!skip_parsing) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1141  		opt = fs_parse(fc, smb3_fs_parameters, param, &result);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1142  		if (opt < 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1143  			return ctx->sloppy ? 1 : opt;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1144  	}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1145  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1146  	switch (opt) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1147  	case Opt_compress:
d14bbfff259cadb fs/smb/client/fs_context.c Steve French     2024-07-26  1148  		if (!IS_ENABLED(CONFIG_CIFS_COMPRESSION)) {
d14bbfff259cadb fs/smb/client/fs_context.c Steve French     2024-07-26  1149  			cifs_errorf(fc, "CONFIG_CIFS_COMPRESSION kernel config option is unset\n");
d14bbfff259cadb fs/smb/client/fs_context.c Steve French     2024-07-26  1150  			goto cifs_parse_mount_err;
d14bbfff259cadb fs/smb/client/fs_context.c Steve French     2024-07-26  1151  		}
8fe7062b7d11fcd fs/smb/client/fs_context.c Enzo Matsumiya   2024-02-23  1152  		ctx->compress = true;
d14bbfff259cadb fs/smb/client/fs_context.c Steve French     2024-07-26  1153  		cifs_dbg(VFS, "SMB3 compression support is experimental\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1154  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1155  	case Opt_nodfs:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1156  		ctx->nodfs = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1157  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1158  	case Opt_hard:
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1159  		if (result.negated) {
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1160  			if (ctx->retry == 1)
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1161  				cifs_dbg(VFS, "conflicting hard vs. soft mount options\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1162  			ctx->retry = 0;
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1163  		} else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1164  			ctx->retry = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1165  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1166  	case Opt_soft:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1167  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1168  			ctx->retry = 1;
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1169  		else {
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1170  			if (ctx->retry == 1)
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1171  				cifs_dbg(VFS, "conflicting hard vs soft mount options\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1172  			ctx->retry = 0;
9d91f8108ebfed5 fs/cifs/fs_context.c       Steve French     2022-12-11  1173  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1174  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1175  	case Opt_mapposix:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1176  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1177  			ctx->remap = false;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1178  		else {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1179  			ctx->remap = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1180  			ctx->sfu_remap = false; /* disable SFU mapping */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1181  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1182  		break;
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1183  	case Opt_mapchars:
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1184  		if (result.negated)
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1185  			ctx->sfu_remap = false;
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1186  		else {
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1187  			ctx->sfu_remap = true;
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1188  			ctx->remap = false; /* disable SFM (mapposix) mapping */
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1189  		}
cb8b02fd6343228 fs/cifs/fs_context.c       Steve French     2023-05-24  1190  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1191  	case Opt_user_xattr:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1192  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1193  			ctx->no_xattr = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1194  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1195  			ctx->no_xattr = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1196  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1197  	case Opt_forceuid:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1198  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1199  			ctx->override_uid = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1200  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1201  			ctx->override_uid = 1;
77d8aa79ecfb209 fs/smb/client/fs_context.c Takayuki Nagata  2024-04-15  1202  		ctx->forceuid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1203  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1204  	case Opt_forcegid:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1205  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1206  			ctx->override_gid = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1207  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1208  			ctx->override_gid = 1;
77d8aa79ecfb209 fs/smb/client/fs_context.c Takayuki Nagata  2024-04-15  1209  		ctx->forcegid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1210  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1211  	case Opt_perm:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1212  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1213  			ctx->noperm = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1214  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1215  			ctx->noperm = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1216  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1217  	case Opt_dynperm:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1218  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1219  			ctx->dynperm = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1220  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1221  			ctx->dynperm = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1222  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1223  	case Opt_sfu:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1224  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1225  			ctx->sfu_emul = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1226  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1227  			ctx->sfu_emul = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1228  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1229  	case Opt_noblocksend:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1230  		ctx->noblocksnd = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1231  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1232  	case Opt_noautotune:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1233  		ctx->noautotune = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1234  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1235  	case Opt_nolease:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1236  		ctx->no_lease = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1237  		break;
52832252dded19e fs/cifs/fs_context.c       Steve French     2022-05-23  1238  	case Opt_nosparse:
52832252dded19e fs/cifs/fs_context.c       Steve French     2022-05-23  1239  		ctx->no_sparse = 1;
52832252dded19e fs/cifs/fs_context.c       Steve French     2022-05-23  1240  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1241  	case Opt_nodelete:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1242  		ctx->nodelete = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1243  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1244  	case Opt_multichannel:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1245  		if (result.negated) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1246  			ctx->multichannel = false;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1247  			ctx->max_channels = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1248  		} else {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1249  			ctx->multichannel = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1250  			/* if number of channels not specified, default to 2 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1251  			if (ctx->max_channels < 2)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1252  				ctx->max_channels = 2;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1253  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1254  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1255  	case Opt_uid:
3229e3a5a374504 fs/smb/client/fs_context.c Eric Sandeen     2024-06-27  1256  		ctx->linux_uid = result.uid;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1257  		ctx->uid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1258  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1259  	case Opt_cruid:
3229e3a5a374504 fs/smb/client/fs_context.c Eric Sandeen     2024-06-27  1260  		ctx->cred_uid = result.uid;
e0a3cbcd5cef00c fs/cifs/fs_context.c       Ronnie Sahlberg  2021-07-08  1261  		ctx->cruid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1262  		break;
b946dbcfa4df80e fs/cifs/fs_context.c       Ronnie Sahlberg  2021-07-28  1263  	case Opt_backupuid:
3229e3a5a374504 fs/smb/client/fs_context.c Eric Sandeen     2024-06-27  1264  		ctx->backupuid = result.uid;
b946dbcfa4df80e fs/cifs/fs_context.c       Ronnie Sahlberg  2021-07-28  1265  		ctx->backupuid_specified = true;
b946dbcfa4df80e fs/cifs/fs_context.c       Ronnie Sahlberg  2021-07-28  1266  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1267  	case Opt_backupgid:
3229e3a5a374504 fs/smb/client/fs_context.c Eric Sandeen     2024-06-27  1268  		ctx->backupgid = result.gid;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1269  		ctx->backupgid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1270  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1271  	case Opt_gid:
3229e3a5a374504 fs/smb/client/fs_context.c Eric Sandeen     2024-06-27  1272  		ctx->linux_gid = result.gid;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1273  		ctx->gid_specified = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1274  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1275  	case Opt_port:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1276  		ctx->port = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1277  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1278  	case Opt_file_mode:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1279  		ctx->file_mode = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1280  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1281  	case Opt_dirmode:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1282  		ctx->dir_mode = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1283  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1284  	case Opt_min_enc_offload:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1285  		ctx->min_offload = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1286  		break;
ce09f8d8a7130e6 fs/smb/client/fs_context.c Shyam Prasad N   2024-01-17  1287  	case Opt_retrans:
ce09f8d8a7130e6 fs/smb/client/fs_context.c Shyam Prasad N   2024-01-17  1288  		ctx->retrans = result.uint_32;
ce09f8d8a7130e6 fs/smb/client/fs_context.c Shyam Prasad N   2024-01-17  1289  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1290  	case Opt_blocksize:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1291  		/*
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1292  		 * inode blocksize realistically should never need to be
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1293  		 * less than 16K or greater than 16M and default is 1MB.
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1294  		 * Note that small inode block sizes (e.g. 64K) can lead
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1295  		 * to very poor performance of common tools like cp and scp
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1296  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1297  		if ((result.uint_32 < CIFS_MAX_MSGSIZE) ||
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1298  		   (result.uint_32 > (4 * SMB3_DEFAULT_IOSIZE))) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1299  			cifs_errorf(fc, "%s: Invalid blocksize\n",
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1300  				__func__);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1301  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1302  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1303  		ctx->bsize = result.uint_32;
522aa3b57532259 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1304  		ctx->got_bsize = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1305  		break;
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1306  	case Opt_rasize:
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1307  		/*
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1308  		 * readahead size realistically should never need to be
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1309  		 * less than 1M (CIFS_DEFAULT_IOSIZE) or greater than 32M
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1310  		 * (perhaps an exception should be considered in the
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1311  		 * for the case of a large number of channels
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1312  		 * when multichannel is negotiated) since that would lead
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1313  		 * to plenty of parallel I/O in flight to the server.
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1314  		 * Note that smaller read ahead sizes would
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1315  		 * hurt performance of common tools like cp and scp
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1316  		 * which often trigger sequential i/o with read ahead
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1317  		 */
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1318  		if ((result.uint_32 > (8 * SMB3_DEFAULT_IOSIZE)) ||
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1319  		    (result.uint_32 < CIFS_DEFAULT_IOSIZE)) {
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1320  			cifs_errorf(fc, "%s: Invalid rasize %d vs. %d\n",
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1321  				__func__, result.uint_32, SMB3_DEFAULT_IOSIZE);
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1322  			goto cifs_parse_mount_err;
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1323  		}
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1324  		ctx->rasize = result.uint_32;
b8d64f8ced62f9a fs/cifs/fs_context.c       Steve French     2021-04-24  1325  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1326  	case Opt_rsize:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1327  		ctx->rsize = result.uint_32;
522aa3b57532259 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1328  		ctx->got_rsize = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1329  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1330  	case Opt_wsize:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1331  		ctx->wsize = result.uint_32;
522aa3b57532259 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-14  1332  		ctx->got_wsize = true;
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1333  		if (ctx->wsize % PAGE_SIZE != 0) {
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1334  			ctx->wsize = round_down(ctx->wsize, PAGE_SIZE);
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1335  			if (ctx->wsize == 0) {
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1336  				ctx->wsize = PAGE_SIZE;
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1337  				cifs_dbg(VFS, "wsize too small, reset to minimum %ld\n", PAGE_SIZE);
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1338  			} else {
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1339  				cifs_dbg(VFS,
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1340  					 "wsize rounded down to %d to multiple of PAGE_SIZE %ld\n",
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1341  					 ctx->wsize, PAGE_SIZE);
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1342  			}
4860abb91f3d7fb fs/smb/client/fs_context.c Steve French     2024-02-06  1343  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1344  		break;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1345  	case Opt_acregmax:
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1346  		ctx->acregmax = HZ * result.uint_32;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1347  		if (ctx->acregmax > CIFS_MAX_ACTIMEO) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1348  			cifs_errorf(fc, "acregmax too large\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1349  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1350  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1351  		break;
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1352  	case Opt_acdirmax:
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1353  		ctx->acdirmax = HZ * result.uint_32;
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1354  		if (ctx->acdirmax > CIFS_MAX_ACTIMEO) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1355  			cifs_errorf(fc, "acdirmax too large\n");
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1356  			goto cifs_parse_mount_err;
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1357  		}
4c9f948142a550a fs/cifs/fs_context.c       Steve French     2021-02-23  1358  		break;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1359  	case Opt_actimeo:
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1360  		if (HZ * result.uint_32 > CIFS_MAX_ACTIMEO) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1361  			cifs_errorf(fc, "timeout too large\n");
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1362  			goto cifs_parse_mount_err;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1363  		}
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1364  		if ((ctx->acdirmax != CIFS_DEF_ACTIMEO) ||
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1365  		    (ctx->acregmax != CIFS_DEF_ACTIMEO)) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1366  			cifs_errorf(fc, "actimeo ignored since acregmax or acdirmax specified\n");
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1367  			break;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1368  		}
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1369  		ctx->acdirmax = ctx->acregmax = HZ * result.uint_32;
5780464614f6abe fs/cifs/fs_context.c       Steve French     2021-02-24  1370  		break;
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1371  	case Opt_closetimeo:
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1372  		ctx->closetimeo = HZ * result.uint_32;
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1373  		if (ctx->closetimeo > SMB3_MAX_DCLOSETIMEO) {
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1374  			cifs_errorf(fc, "closetimeo too large\n");
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1375  			goto cifs_parse_mount_err;
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1376  		}
5efdd9122eff772 fs/cifs/fs_context.c       Steve French     2022-08-11  1377  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1378  	case Opt_echo_interval:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1379  		ctx->echo_interval = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1380  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1381  	case Opt_snapshot:
9405b5f8b20c2bf fs/cifs/fs_context.c       Steve French     2022-02-12  1382  		ctx->snapshot_time = result.uint_64;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1383  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1384  	case Opt_max_credits:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1385  		if (result.uint_32 < 20 || result.uint_32 > 60000) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1386  			cifs_errorf(fc, "%s: Invalid max_credits value\n",
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1387  				 __func__);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1388  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1389  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1390  		ctx->max_credits = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1391  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1392  	case Opt_max_channels:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1393  		if (result.uint_32 < 1 || result.uint_32 > CIFS_MAX_CHANNELS) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1394  			cifs_errorf(fc, "%s: Invalid max_channels value, needs to be 1-%d\n",
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1395  				 __func__, CIFS_MAX_CHANNELS);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1396  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1397  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1398  		ctx->max_channels = result.uint_32;
c1f8a398b6d661b fs/cifs/fs_context.c       Steve French     2021-05-07  1399  		/* If more than one channel requested ... they want multichan */
c1f8a398b6d661b fs/cifs/fs_context.c       Steve French     2021-05-07  1400  		if (result.uint_32 > 1)
c1f8a398b6d661b fs/cifs/fs_context.c       Steve French     2021-05-07  1401  			ctx->multichannel = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1402  		break;
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1403  	case Opt_max_cached_dirs:
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1404  		if (result.uint_32 < 1) {
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1405  			cifs_errorf(fc, "%s: Invalid max_cached_dirs, needs to be 1 or more\n",
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1406  				    __func__);
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1407  			goto cifs_parse_mount_err;
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1408  		}
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1409  		ctx->max_cached_dirs = result.uint_32;
6a50d71d0ffff67 fs/smb/client/fs_context.c Steve French     2023-09-01  1410  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1411  	case Opt_handletimeout:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1412  		ctx->handle_timeout = result.uint_32;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1413  		if (ctx->handle_timeout > SMB3_MAX_HANDLE_TIMEOUT) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1414  			cifs_errorf(fc, "Invalid handle cache timeout, longer than 16 minutes\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1415  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1416  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1417  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1418  	case Opt_source:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1419  		kfree(ctx->UNC);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1420  		ctx->UNC = NULL;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1421  		switch (smb3_parse_devname(param->string, ctx)) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1422  		case 0:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1423  			break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1424  		case -ENOMEM:
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1425  			cifs_errorf(fc, "Unable to allocate memory for devname\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1426  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1427  		case -EINVAL:
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1428  			cifs_errorf(fc, "Malformed UNC in devname\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1429  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1430  		default:
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1431  			cifs_errorf(fc, "Unknown error parsing devname\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1432  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1433  		}
49024ec8795ed2b fs/smb/client/fs_context.c Paulo Alcantara  2023-06-27  1434  		ctx->source = smb3_fs_context_fullpath(ctx, '/');
49024ec8795ed2b fs/smb/client/fs_context.c Paulo Alcantara  2023-06-27  1435  		if (IS_ERR(ctx->source)) {
49024ec8795ed2b fs/smb/client/fs_context.c Paulo Alcantara  2023-06-27  1436  			ctx->source = NULL;
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1437  			cifs_errorf(fc, "OOM when copying UNC string\n");
af1a3d2ba9543e9 fs/cifs/fs_context.c       Ronnie Sahlberg  2021-02-11  1438  			goto cifs_parse_mount_err;
af1a3d2ba9543e9 fs/cifs/fs_context.c       Ronnie Sahlberg  2021-02-11  1439  		}
49024ec8795ed2b fs/smb/client/fs_context.c Paulo Alcantara  2023-06-27  1440  		fc->source = kstrdup(ctx->source, GFP_KERNEL);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1441  		if (fc->source == NULL) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1442  			cifs_errorf(fc, "OOM when copying UNC string\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1443  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1444  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1445  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1446  	case Opt_user:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1447  		kfree(ctx->username);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1448  		ctx->username = NULL;
270d73e6507f9c7 fs/smb/client/fs_context.c Scott Mayhew     2023-08-16  1449  		if (ctx->nullauth)
270d73e6507f9c7 fs/smb/client/fs_context.c Scott Mayhew     2023-08-16  1450  			break;
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1451  
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1452  		/* if first character is null, then anonymous auth */
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1453  		if (*(param->string) == 0) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1454  			/* null user, ie. anonymous authentication */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1455  			ctx->nullauth = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1456  			break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1457  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1458  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1459  		if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) >
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1460  		    CIFS_MAX_USERNAME_LEN) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1461  			pr_warn("username too long\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1462  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1463  		}
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1464  		ctx->username = param->string, GFP_KERNEL;
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23  1465  		/* streal string from caller, but set to NULL so caller doesn't free */
8f97b4a68ea216b fs/smb/client/fs_context.c Steve French     2024-10-23 @1466  		param->string == NULL;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1467  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1468  	case Opt_pass:
a4e430c8c8ba96b fs/cifs/fs_context.c       Enzo Matsumiya   2022-09-20  1469  		kfree_sensitive(ctx->password);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1470  		ctx->password = NULL;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1471  		if (strlen(param->string) == 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1472  			break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1473  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1474  		ctx->password = kstrdup(param->string, GFP_KERNEL);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1475  		if (ctx->password == NULL) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1476  			cifs_errorf(fc, "OOM when copying password string\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1477  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1478  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1479  		break;
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1480  	case Opt_pass2:
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1481  		kfree_sensitive(ctx->password2);
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1482  		ctx->password2 = NULL;
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1483  		if (strlen(param->string) == 0)
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1484  			break;
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1485  
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1486  		ctx->password2 = kstrdup(param->string, GFP_KERNEL);
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1487  		if (ctx->password2 == NULL) {
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1488  			cifs_errorf(fc, "OOM when copying password2 string\n");
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1489  			goto cifs_parse_mount_err;
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1490  		}
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1491  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1492  	case Opt_ip:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1493  		if (strlen(param->string) == 0) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1494  			ctx->got_ip = false;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1495  			break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1496  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1497  		if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1498  					  param->string,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1499  					  strlen(param->string))) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1500  			pr_err("bad ip= option (%s)\n", param->string);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1501  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1502  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1503  		ctx->got_ip = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1504  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1505  	case Opt_domain:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1506  		if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1507  				== CIFS_MAX_DOMAINNAME_LEN) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1508  			pr_warn("domain name too long\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1509  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1510  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1511  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1512  		kfree(ctx->domainname);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1513  		ctx->domainname = kstrdup(param->string, GFP_KERNEL);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1514  		if (ctx->domainname == NULL) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1515  			cifs_errorf(fc, "OOM when copying domainname string\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1516  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1517  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1518  		cifs_dbg(FYI, "Domain name set\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1519  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1520  	case Opt_srcaddr:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1521  		if (!cifs_convert_address(
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1522  				(struct sockaddr *)&ctx->srcaddr,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1523  				param->string, strlen(param->string))) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1524  			pr_warn("Could not parse srcaddr: %s\n",
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1525  				param->string);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1526  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1527  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1528  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1529  	case Opt_iocharset:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1530  		if (strnlen(param->string, 1024) >= 65) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1531  			pr_warn("iocharset name too long\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1532  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1533  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1534  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1535  		if (strncasecmp(param->string, "default", 7) != 0) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1536  			kfree(ctx->iocharset);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1537  			ctx->iocharset = kstrdup(param->string, GFP_KERNEL);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1538  			if (ctx->iocharset == NULL) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1539  				cifs_errorf(fc, "OOM when copying iocharset string\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1540  				goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1541  			}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1542  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1543  		/* if iocharset not set then load_nls_default
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1544  		 * is used by caller
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1545  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1546  		cifs_dbg(FYI, "iocharset set to %s\n", ctx->iocharset);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1547  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1548  	case Opt_netbiosname:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1549  		memset(ctx->source_rfc1001_name, 0x20,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1550  			RFC1001_NAME_LEN);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1551  		/*
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1552  		 * FIXME: are there cases in which a comma can
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1553  		 * be valid in workstation netbios name (and
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1554  		 * need special handling)?
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1555  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1556  		for (i = 0; i < RFC1001_NAME_LEN; i++) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1557  			/* don't ucase netbiosname for user */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1558  			if (param->string[i] == 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1559  				break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1560  			ctx->source_rfc1001_name[i] = param->string[i];
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1561  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1562  		/* The string has 16th byte zero still from
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1563  		 * set at top of the function
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1564  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1565  		if (i == RFC1001_NAME_LEN && param->string[i] != 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1566  			pr_warn("netbiosname longer than 15 truncated\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1567  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1568  	case Opt_servern:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1569  		/* last byte, type, is 0x20 for servr type */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1570  		memset(ctx->target_rfc1001_name, 0x20,
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1571  			RFC1001_NAME_LEN_WITH_NULL);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1572  		/*
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1573  		 * BB are there cases in which a comma can be valid in this
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1574  		 * workstation netbios name (and need special handling)?
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1575  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1576  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1577  		/* user or mount helper must uppercase the netbios name */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1578  		for (i = 0; i < 15; i++) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1579  			if (param->string[i] == 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1580  				break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1581  			ctx->target_rfc1001_name[i] = param->string[i];
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1582  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1583  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1584  		/* The string has 16th byte zero still from set at top of function */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1585  		if (i == RFC1001_NAME_LEN && param->string[i] != 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1586  			pr_warn("server netbiosname longer than 15 truncated\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1587  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1588  	case Opt_ver:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1589  		/* version of mount userspace tools, not dialect */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1590  		/* If interface changes in mount.cifs bump to new ver */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1591  		if (strncasecmp(param->string, "1", 1) == 0) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1592  			if (strlen(param->string) > 1) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1593  				pr_warn("Bad mount helper ver=%s. Did you want SMB1 (CIFS) dialect and mean to type vers=1.0 instead?\n",
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1594  					param->string);
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1595  				goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1596  			}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1597  			/* This is the default */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1598  			break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1599  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1600  		/* For all other value, error */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1601  		pr_warn("Invalid mount helper version specified\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1602  		goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1603  	case Opt_vers:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1604  		/* protocol version (dialect) */
d9a8692277496bf fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1605  		if (cifs_parse_smb_version(fc, param->string, ctx, is_smb3) != 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1606  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1607  		ctx->got_version = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1608  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1609  	case Opt_sec:
d9a8692277496bf fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1610  		if (cifs_parse_security_flavors(fc, param->string, ctx) != 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1611  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1612  		break;
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1613  	case Opt_upcalltarget:
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1614  		if (cifs_parse_upcall_target(fc, param->string, ctx) != 0)
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1615  			goto cifs_parse_mount_err;
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1616  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1617  	case Opt_cache:
d9a8692277496bf fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1618  		if (cifs_parse_cache_flavor(fc, param->string, ctx) != 0)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1619  			goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1620  		break;
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1621  	case Opt_witness:
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1622  #ifndef CONFIG_CIFS_SWN_UPCALL
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1623  		cifs_errorf(fc, "Witness support needs CONFIG_CIFS_SWN_UPCALL config option\n");
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1624  			goto cifs_parse_mount_err;
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1625  #endif
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1626  		ctx->witness = true;
dd538034f84fa4e fs/cifs/fs_context.c       Steve French     2020-12-14  1627  		pr_warn_once("Witness protocol support is experimental\n");
0ac4e2919aa408d fs/cifs/fs_context.c       Samuel Cabrero   2020-12-11  1628  		break;
ad1f536f8441677 fs/smb/client/fs_context.c Pali Rohár       2024-10-06  1629  	case Opt_unicode:
ad1f536f8441677 fs/smb/client/fs_context.c Pali Rohár       2024-10-06  1630  		ctx->unicode = !result.negated;
ad1f536f8441677 fs/smb/client/fs_context.c Pali Rohár       2024-10-06  1631  		cifs_dbg(FYI, "unicode set to %d\n", ctx->unicode);
ad1f536f8441677 fs/smb/client/fs_context.c Pali Rohár       2024-10-06  1632  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1633  	case Opt_rootfs:
af3ef3b10316347 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-18  1634  #ifndef CONFIG_CIFS_ROOT
af3ef3b10316347 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-18  1635  		cifs_dbg(VFS, "rootfs support requires CONFIG_CIFS_ROOT config option\n");
af3ef3b10316347 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-18  1636  		goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1637  #endif
af3ef3b10316347 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-18  1638  		ctx->rootfs = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1639  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1640  	case Opt_posixpaths:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1641  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1642  			ctx->posix_paths = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1643  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1644  			ctx->posix_paths = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1645  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1646  	case Opt_unix:
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1647  		if (result.negated) {
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1648  			if (ctx->linux_ext == 1)
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1649  				pr_warn_once("conflicting posix mount options specified\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1650  			ctx->linux_ext = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1651  			ctx->no_linux_ext = 1;
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1652  		} else {
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1653  			if (ctx->no_linux_ext == 1)
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1654  				pr_warn_once("conflicting posix mount options specified\n");
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1655  			ctx->linux_ext = 1;
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1656  			ctx->no_linux_ext = 0;
7321be2663da592 fs/cifs/fs_context.c       Steve French     2021-08-23  1657  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1658  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1659  	case Opt_nocase:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1660  		ctx->nocase = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1661  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1662  	case Opt_brl:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1663  		if (result.negated) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1664  			/*
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1665  			 * turn off mandatory locking in mode
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1666  			 * if remote locking is turned off since the
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1667  			 * local vfs will do advisory
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1668  			 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1669  			if (ctx->file_mode ==
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1670  				(S_IALLUGO & ~(S_ISUID | S_IXGRP)))
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1671  				ctx->file_mode = S_IALLUGO;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1672  			ctx->nobrl =  1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1673  		} else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1674  			ctx->nobrl =  0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1675  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1676  	case Opt_handlecache:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1677  		if (result.negated)
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1678  			ctx->nohandlecache = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1679  		else
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1680  			ctx->nohandlecache = 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1681  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1682  	case Opt_forcemandatorylock:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1683  		ctx->mand_lock = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1684  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1685  	case Opt_setuids:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1686  		ctx->setuids = result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1687  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1688  	case Opt_intr:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1689  		ctx->intr = !result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1690  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1691  	case Opt_setuidfromacl:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1692  		ctx->setuidfromacl = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1693  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1694  	case Opt_strictsync:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1695  		ctx->nostrictsync = result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1696  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1697  	case Opt_serverino:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1698  		ctx->server_ino = !result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1699  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1700  	case Opt_rwpidforward:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1701  		ctx->rwpidforward = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1702  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1703  	case Opt_modesid:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1704  		ctx->mode_ace = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1705  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1706  	case Opt_cifsacl:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1707  		ctx->cifs_acl = !result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1708  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1709  	case Opt_acl:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1710  		ctx->no_psx_acl = result.negated;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1711  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1712  	case Opt_locallease:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1713  		ctx->local_lease = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1714  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1715  	case Opt_sign:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1716  		ctx->sign = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1717  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1718  	case Opt_ignore_signature:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1719  		ctx->sign = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1720  		ctx->ignore_signature = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1721  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1722  	case Opt_seal:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1723  		/* we do not do the following in secFlags because seal
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1724  		 * is a per tree connection (mount) not a per socket
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1725  		 * or per-smb connection option in the protocol
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1726  		 * vol->secFlg |= CIFSSEC_MUST_SEAL;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1727  		 */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1728  		ctx->seal = 1;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1729  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1730  	case Opt_noac:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1731  		pr_warn("Mount option noac not supported. Instead set /proc/fs/cifs/LookupCacheEnabled to 0\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1732  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1733  	case Opt_fsc:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1734  #ifndef CONFIG_CIFS_FSCACHE
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1735  		cifs_errorf(fc, "FS-Cache support needs CONFIG_CIFS_FSCACHE kernel config option set\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1736  		goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1737  #endif
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1738  		ctx->fsc = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1739  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1740  	case Opt_mfsymlinks:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1741  		ctx->mfsymlinks = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1742  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1743  	case Opt_multiuser:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1744  		ctx->multiuser = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1745  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1746  	case Opt_sloppy:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1747  		ctx->sloppy = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1748  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1749  	case Opt_nosharesock:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1750  		ctx->nosharesock = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1751  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1752  	case Opt_persistent:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1753  		if (result.negated) {
27cf94853e6d2b5 fs/cifs/fs_context.c       Steve French     2020-12-16  1754  			ctx->nopersistent = true;
27cf94853e6d2b5 fs/cifs/fs_context.c       Steve French     2020-12-16  1755  			if (ctx->persistent) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1756  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1757  				goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1758  			}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1759  		} else {
27cf94853e6d2b5 fs/cifs/fs_context.c       Steve French     2020-12-16  1760  			ctx->persistent = true;
27cf94853e6d2b5 fs/cifs/fs_context.c       Steve French     2020-12-16  1761  			if ((ctx->nopersistent) || (ctx->resilient)) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1762  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1763  				goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1764  			}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1765  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1766  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1767  	case Opt_resilient:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1768  		if (result.negated) {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1769  			ctx->resilient = false; /* already the default */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1770  		} else {
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1771  			ctx->resilient = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1772  			if (ctx->persistent) {
24fedddc954ed16 fs/cifs/fs_context.c       Aurelien Aptel   2021-03-01  1773  				cifs_errorf(fc, "persistenthandles mount options conflict\n");
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1774  				goto cifs_parse_mount_err;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1775  			}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1776  		}
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1777  		break;
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1778  	case Opt_tcp_nodelay:
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1779  		/* tcp nodelay should not usually be needed since we CORK/UNCORK the socket */
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1780  		if (result.negated)
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1781  			ctx->sockopt_tcp_nodelay = false;
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1782  		else
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1783  			ctx->sockopt_tcp_nodelay = true;
7ae5e588b0a53a7 fs/cifs/fs_context.c       Steve French     2021-10-14  1784  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1785  	case Opt_domainauto:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1786  		ctx->domainauto = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1787  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1788  	case Opt_rdma:
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1789  		ctx->rdma = true;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1790  		break;
eb90e8ecb2b54ac fs/smb/client/fs_context.c Paulo Alcantara  2024-01-21  1791  	case Opt_reparse:
eb90e8ecb2b54ac fs/smb/client/fs_context.c Paulo Alcantara  2024-01-21  1792  		if (parse_reparse_flavor(fc, param->string, ctx))
eb90e8ecb2b54ac fs/smb/client/fs_context.c Paulo Alcantara  2024-01-21  1793  			goto cifs_parse_mount_err;
eb90e8ecb2b54ac fs/smb/client/fs_context.c Paulo Alcantara  2024-01-21  1794  		break;
319745d5c2de16e fs/smb/client/fs_context.c Pali Rohár       2024-09-16  1795  	case Opt_nativesocket:
319745d5c2de16e fs/smb/client/fs_context.c Pali Rohár       2024-09-16  1796  		ctx->nonativesocket = result.negated;
319745d5c2de16e fs/smb/client/fs_context.c Pali Rohár       2024-09-16  1797  		break;
34d878f90e64f51 fs/smb/client/fs_context.c Pali Rohár       2024-10-11  1798  	case Opt_symlink:
34d878f90e64f51 fs/smb/client/fs_context.c Pali Rohár       2024-10-11  1799  		if (parse_symlink_flavor(fc, param->string, ctx))
34d878f90e64f51 fs/smb/client/fs_context.c Pali Rohár       2024-10-11  1800  			goto cifs_parse_mount_err;
34d878f90e64f51 fs/smb/client/fs_context.c Pali Rohár       2024-10-11  1801  		break;
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1802  	case Opt_symlinkroot:
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1803  		if (param->string[0] != '/') {
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1804  			cifs_errorf(fc, "symlinkroot mount options must be absolute path\n");
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1805  			goto cifs_parse_mount_err;
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1806  		}
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1807  		kfree(ctx->symlinkroot);
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1808  		ctx->symlinkroot = kstrdup(param->string, GFP_KERNEL);
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1809  		if (!ctx->symlinkroot)
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1810  			goto cifs_parse_mount_err;
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1811  		break;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1812  	}
31f6551ad75608d fs/cifs/fs_context.c       Steve French     2020-12-16  1813  	/* case Opt_ignore: - is ignored as expected ... */
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1814  
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1815  	if (ctx->multiuser && ctx->upcall_target == UPTARGET_MOUNT) {
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1816  		cifs_errorf(fc, "multiuser mount option not supported with upcalltarget set as 'mount'\n");
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1817  		goto cifs_parse_mount_err;
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1818  	}
db363b0a1d9e6b9 fs/smb/client/fs_context.c Ritvik Budhiraja 2024-11-11  1819  
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1820  	/*
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1821  	 * By default resolve all native absolute symlinks relative to "/mnt/".
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1822  	 * Same default has drvfs driver running in WSL for resolving SMB shares.
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1823  	 */
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1824  	if (!ctx->symlinkroot)
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1825  		ctx->symlinkroot = kstrdup("/mnt/", GFP_KERNEL);
df168b3a385d481 fs/smb/client/fs_context.c Pali Rohár       2024-09-23  1826  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1827  	return 0;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1828  
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1829   cifs_parse_mount_err:
a4e430c8c8ba96b fs/cifs/fs_context.c       Enzo Matsumiya   2022-09-20  1830  	kfree_sensitive(ctx->password);
e6e43b8aa7cd3c3 fs/smb/client/fs_context.c Quang Le         2023-09-29  1831  	ctx->password = NULL;
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1832  	kfree_sensitive(ctx->password2);
35f834265e0dc78 fs/smb/client/fs_context.c Steve French     2024-04-04  1833  	ctx->password2 = NULL;
bd2f0b43c1c864f fs/cifs/fs_context.c       Steve French     2021-01-28  1834  	return -EINVAL;
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1835  }
24e0a1eff9e2b98 fs/cifs/fs_context.c       Ronnie Sahlberg  2020-12-10  1836  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
