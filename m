Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156D158535
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 04:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907318; cv=none; b=Pn4YWjnsBB9wPj50g7SM0cD/HiOViOQGYXJjEhGH/xNeZ9Aq5R6wZU0+hiznpnPf2KoIUDUg7yGP/0+cSVDK91QwGdqae/l5HzikTzJNI8mb6Z1If/TjnfWu8QzQGVyD6j6Qb4sfbizyOrP/g6ghvWCIS/hhRhTyz4kTcZsG+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907318; c=relaxed/simple;
	bh=/wzx0tOadZ+FqZub3otkcqgpA0u7D3PdcJsYvga8El8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCXZdHYDcEe5b50vSz4fiGlW6d37K305ZFgZyn9u+jL+AUVkVrMkCTsn39kq2Gw1bYTQq7nK1myoPcP/p1TJv0u3yDopEgitY6E25TOluDloib3RUmkaQaC8gLUzldW8GVklgcNZsTRdd9LVMrJOBtwIXs1TSwe+0/F6DRE9auk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwlefx9w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwlefx9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764907317; x=1796443317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wzx0tOadZ+FqZub3otkcqgpA0u7D3PdcJsYvga8El8=;
  b=bwlefx9wP4PlHBm8cpdXNCKXt1NlkEh5Jd3zLuXL+rrey0R7xXXBsrx1
   98RhFv3qffg3bFuKf+FBF0mK6Q2l6j9H2Jp13D4sLSOSh4W1dg5laz0fj
   gtyUhaW3EfGrtWWKwYgoUjxc+et9NWVmpmHLSUwGoidxOdXYL/phfnKVm
   BkG02O4wRZ4q7rzn+s4mdpto6Xh5USRqn3drZ92uHXzJvkXHfarCgVS+K
   /UDsAyuJ4f+pu6DN5Yf8DJboDgF2joQVKY0X88YgaoXdkL36kZJ74G9p5
   7DVwzgnK896qFz8gBUTlhbjcg/kNRiwLfQls10Xr8+19GEwou4XlUr5qm
   g==;
X-CSE-ConnectionGUID: t9bhxukEQlyiTk6hTiWVhg==
X-CSE-MsgGUID: PF9ApIzCQMSgXnAL204Gxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77558369"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="77558369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 20:01:56 -0800
X-CSE-ConnectionGUID: k1VD8SlwTTWfw6yuotifcw==
X-CSE-MsgGUID: PBexWj1xT1O/2G1yULqYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="199663555"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2025 20:01:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRN0y-00000000EZL-2MJQ;
	Fri, 05 Dec 2025 04:01:52 +0000
Date: Fri, 5 Dec 2025 12:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 12665/13363] fs/smb/client/fs_context.c:1171:3-9:
 preceding lock on line 1131
Message-ID: <202512051126.BYD2C9uj-lkp@intel.com>
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
TO: Rajasi Mandal <rajasimandal@microsoft.com>
CC: Steve French <stfrench@microsoft.com>
CC: Shyam Prasad N <sprasad@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc04acf4aeca588496124a6cf54bfce3db327039
commit: 3ade50c3fc735d47eeae6f35357fff82026db4d7 [12665/13363] cifs: client: allow changing multichannel mount options on remount
:::::: branch date: 21 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-051-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051126.BYD2C9uj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512051126.BYD2C9uj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/fs_context.c:1171:3-9: preceding lock on line 1131

vim +1171 fs/smb/client/fs_context.c

3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1074  
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1075  static int smb3_reconfigure(struct fs_context *fc)
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1076  {
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1077  	struct smb3_fs_context *ctx = smb3_fc2context(fc);
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1078  	struct dentry *root = fc->root;
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1079  	struct cifs_sb_info *cifs_sb = CIFS_SB(root->d_sb);
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1080  	struct cifs_ses *ses = cifs_sb_master_tcon(cifs_sb)->ses;
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1081  	unsigned int rsize = ctx->rsize, wsize = ctx->wsize;
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1082  	char *new_password = NULL, *new_password2 = NULL;
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1083  	bool need_recon = false;
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1084  	int rc;
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1085  
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1086  	if (ses->expired_pwd)
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1087  		need_recon = true;
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1088  
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1089  	rc = smb3_verify_reconfigure_ctx(fc, ctx, cifs_sb->ctx, need_recon);
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1090  	if (rc)
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1091  		return rc;
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1092  
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1093  	/*
49bd49f983b502 fs/cifs/fs_context.c       Shyam Prasad N    2021-11-05  1094  	 * We can not change UNC/username/password/domainname/
49bd49f983b502 fs/cifs/fs_context.c       Shyam Prasad N    2021-11-05  1095  	 * workstation_name/nodename/iocharset
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1096  	 * during reconnect so ignore what we have in the new context and
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1097  	 * just use what we already have in cifs_sb->ctx.
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1098  	 */
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1099  	STEAL_STRING(cifs_sb, ctx, UNC);
af1a3d2ba9543e fs/cifs/fs_context.c       Ronnie Sahlberg   2021-02-11  1100  	STEAL_STRING(cifs_sb, ctx, source);
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1101  	STEAL_STRING(cifs_sb, ctx, username);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1102  
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1103  	if (need_recon == false)
a4e430c8c8ba96 fs/cifs/fs_context.c       Enzo Matsumiya    2022-09-20  1104  		STEAL_STRING_SENSITIVE(cifs_sb, ctx, password);
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1105  	else  {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1106  		if (ctx->password) {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1107  			new_password = kstrdup(ctx->password, GFP_KERNEL);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1108  			if (!new_password)
9a5dd61151399a fs/smb/client/fs_context.c Henrique Carvalho 2024-10-22  1109  				return -ENOMEM;
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1110  		} else
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1111  			STEAL_STRING_SENSITIVE(cifs_sb, ctx, password);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1112  	}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1113  
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1114  	/*
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1115  	 * if a new password2 has been specified, then reset it's value
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1116  	 * inside the ses struct
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1117  	 */
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1118  	if (ctx->password2) {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1119  		new_password2 = kstrdup(ctx->password2, GFP_KERNEL);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1120  		if (!new_password2) {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1121  			kfree_sensitive(new_password);
9a5dd61151399a fs/smb/client/fs_context.c Henrique Carvalho 2024-10-22  1122  			return -ENOMEM;
9a5dd61151399a fs/smb/client/fs_context.c Henrique Carvalho 2024-10-22  1123  		}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1124  	} else
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1125  		STEAL_STRING_SENSITIVE(cifs_sb, ctx, password2);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1126  
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1127  	/*
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1128  	 * we may update the passwords in the ses struct below. Make sure we do
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1129  	 * not race with smb2_reconnect
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1130  	 */
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30 @1131  	mutex_lock(&ses->session_mutex);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1132  
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1133  	/*
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1134  	 * smb2_reconnect may swap password and password2 in case session setup
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1135  	 * failed. First get ctx passwords in sync with ses passwords. It should
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1136  	 * be okay to do this even if this function were to return an error at a
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1137  	 * later stage
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1138  	 */
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1139  	rc = smb3_sync_session_ctx_passwords(cifs_sb, ses);
cda88d2fef7aa7 fs/smb/client/fs_context.c Dan Carpenter     2024-11-15  1140  	if (rc) {
cda88d2fef7aa7 fs/smb/client/fs_context.c Dan Carpenter     2024-11-15  1141  		mutex_unlock(&ses->session_mutex);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1142  		return rc;
cda88d2fef7aa7 fs/smb/client/fs_context.c Dan Carpenter     2024-11-15  1143  	}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1144  
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1145  	/*
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1146  	 * now that allocations for passwords are done, commit them
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1147  	 */
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1148  	if (new_password) {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1149  		kfree_sensitive(ses->password);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1150  		ses->password = new_password;
c1eb537bf4560b fs/smb/client/fs_context.c Steve French      2024-02-13  1151  	}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1152  	if (new_password2) {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1153  		kfree_sensitive(ses->password2);
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1154  		ses->password2 = new_password2;
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1155  	}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1156  
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1157  	/*
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1158  	 * If multichannel or max_channels has changed, update the session's channels accordingly.
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1159  	 * This may add or remove channels to match the new configuration.
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1160  	 */
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1161  	if ((ctx->multichannel != cifs_sb->ctx->multichannel) ||
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1162  	    (ctx->max_channels != cifs_sb->ctx->max_channels)) {
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1163  
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1164  		/* Synchronize ses->chan_max with the new mount context */
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1165  		smb3_sync_ses_chan_max(ses, ctx->max_channels);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1166  		/* Now update the session's channels to match the new configuration */
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1167  		/* Prevent concurrent scaling operations */
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1168  		spin_lock(&ses->ses_lock);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1169  		if (ses->flags & CIFS_SES_FLAG_SCALE_CHANNELS) {
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1170  			spin_unlock(&ses->ses_lock);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01 @1171  			return -EINVAL;
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1172  		}
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1173  		ses->flags |= CIFS_SES_FLAG_SCALE_CHANNELS;
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1174  		spin_unlock(&ses->ses_lock);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1175  
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1176  		mutex_unlock(&ses->session_mutex);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1177  
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1178  		rc = smb3_update_ses_channels(ses, ses->server,
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1179  					       false /* from_reconnect */,
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1180  					       true /* from_reconfigure */);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1181  
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1182  		/* Clear scaling flag after operation */
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1183  		spin_lock(&ses->ses_lock);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1184  		ses->flags &= ~CIFS_SES_FLAG_SCALE_CHANNELS;
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1185  		spin_unlock(&ses->ses_lock);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1186  	} else {
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1187  		mutex_unlock(&ses->session_mutex);
3ade50c3fc735d fs/smb/client/fs_context.c Rajasi Mandal     2025-12-01  1188  	}
0f0e357902957f fs/smb/client/fs_context.c Shyam Prasad N    2024-10-30  1189  
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1190  	STEAL_STRING(cifs_sb, ctx, domainname);
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1191  	STEAL_STRING(cifs_sb, ctx, nodename);
9ccecae8d1d713 fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1192  	STEAL_STRING(cifs_sb, ctx, iocharset);
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1193  
2d0604934f507b fs/cifs/fs_context.c       Steve French      2020-12-16  1194  	/* if rsize or wsize not passed in on remount, use previous values */
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1195  	ctx->rsize = rsize ? CIFS_ALIGN_RSIZE(fc, rsize) : cifs_sb->ctx->rsize;
c59f7c9661b9d3 fs/smb/client/fs_context.c Paulo Alcantara   2025-04-30  1196  	ctx->wsize = wsize ? CIFS_ALIGN_WSIZE(fc, wsize) : cifs_sb->ctx->wsize;
2d0604934f507b fs/cifs/fs_context.c       Steve French      2020-12-16  1197  
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1198  	smb3_cleanup_fs_context_contents(cifs_sb->ctx);
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1199  	rc = smb3_fs_context_dup(cifs_sb->ctx, ctx);
1cb6c3d62ca9cf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1200  	smb3_update_mnt_flags(cifs_sb);
b62366181a5e94 fs/cifs/fs_context.c       Paulo Alcantara   2021-07-16  1201  #ifdef CONFIG_CIFS_DFS_UPCALL
b62366181a5e94 fs/cifs/fs_context.c       Paulo Alcantara   2021-07-16  1202  	if (!rc)
b62366181a5e94 fs/cifs/fs_context.c       Paulo Alcantara   2021-07-16  1203  		rc = dfs_cache_remount_fs(cifs_sb);
b62366181a5e94 fs/cifs/fs_context.c       Paulo Alcantara   2021-07-16  1204  #endif
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1205  
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1206  	return rc;
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1207  }
d6a78783407cdf fs/cifs/fs_context.c       Ronnie Sahlberg   2020-12-14  1208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
