Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1417F8
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Apr 2023 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682061432; x=1713597432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7XgrsKajb1vbzX+3zLH8DlPk8zl4eDZJoKU9VVin1s=;
  b=QbXS+eYHhrE1kVmqFmJPPqq/ThZ68pSaUrc6gGXItO2xvnCeVawubg8V
   4KO5fJjFIOq2Pe0GDeWULqqoqnHUxqRj4h7KI2PBFOColT4178h9FNj3T
   zmQIfLDDiRA2lBIutXAXvUDbICR9zeLJRAMWjVvwpXU5WVv6FGqEtJOpV
   zs+0/KoLuV1YIIAOjMeCMgRLjvWw6UScCjvCMvvdyMaQSQPfdIGVJBntX
   gqP4nKiAtmpdBLGkcZj+eDr+Zbcoma0Rid2WX+ujtsUYzMmhRC/lqZXc2
   lS/hTMIvyPKjUJ14xanfOGUVpnSPgsCbuc1FR8quypeyGKLmXdP231teN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411201517"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="411201517"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 00:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816321884"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="816321884"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 00:17:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppl10-000gPm-0Z;
	Fri, 21 Apr 2023 07:17:06 +0000
Date: Fri, 21 Apr 2023 15:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
Message-ID: <202304211447.EkD6EpWB-lkp@intel.com>
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
In-Reply-To: <20230420202004.239116-6-smayhew@redhat.com>
References: <20230420202004.239116-6-smayhew@redhat.com>
TO: Scott Mayhew <smayhew@redhat.com>

Hi Scott,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230420202004.239116-6-smayhew%40redhat.com
patch subject: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230421/202304211447.EkD6EpWB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304211447.EkD6EpWB-lkp@intel.com/

New smatch warnings:
net/sunrpc/auth_gss/auth_gss.c:1189 gss_create_new() error: we previously assumed 'gss_auth' could be null (see line 1089)
net/sunrpc/auth_gss/auth_gss.c:1189 gss_create_new() error: dereferencing freed memory 'gss_auth'

Old smatch warnings:
net/sunrpc/auth_gss/auth_gss.c:2183 gss_wrap_req_priv() warn: missing error code 'status'

vim +/gss_auth +1189 net/sunrpc/auth_gss/auth_gss.c

ccdc28f81c91f7 Stanislav Kinsbursky 2012-01-11  1071  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1072  /*
^1da177e4c3f41 Linus Torvalds       2005-04-16  1073   * NOTE: we have the opportunity to use different
^1da177e4c3f41 Linus Torvalds       2005-04-16  1074   * parameters based on the input flavor (which must be a pseudoflavor)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1075   */
eb6dc19d8e72ce Trond Myklebust      2013-08-28  1076  static struct gss_auth *
82b98ca566ca2a Sargun Dhillon       2018-07-05  1077  gss_create_new(const struct rpc_auth_create_args *args, struct rpc_clnt *clnt)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1078  {
c2190661039b38 Trond Myklebust      2013-08-26  1079  	rpc_authflavor_t flavor = args->pseudoflavor;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1080  	struct gss_auth *gss_auth;
1917228435eebd Trond Myklebust      2013-08-26  1081  	struct gss_pipe *gss_pipe;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1082  	struct rpc_auth * auth;
6a19275ada9137 J. Bruce Fields      2005-06-22  1083  	int err = -ENOMEM; /* XXX? */
6a654188690846 Scott Mayhew         2023-04-20  1084  	struct cred *cred;
6a654188690846 Scott Mayhew         2023-04-20  1085  	struct key *keyring;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1086  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1087  	if (!try_module_get(THIS_MODULE))
6a19275ada9137 J. Bruce Fields      2005-06-22  1088  		return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds       2005-04-16 @1089  	if (!(gss_auth = kmalloc(sizeof(*gss_auth), GFP_KERNEL)))
^1da177e4c3f41 Linus Torvalds       2005-04-16  1090  		goto out_dec;
eb6dc19d8e72ce Trond Myklebust      2013-08-28  1091  	INIT_HLIST_NODE(&gss_auth->hash);
bd4a3eb15bb422 Trond Myklebust      2013-08-23  1092  	gss_auth->target_name = NULL;
c2190661039b38 Trond Myklebust      2013-08-26  1093  	if (args->target_name) {
c2190661039b38 Trond Myklebust      2013-08-26  1094  		gss_auth->target_name = kstrdup(args->target_name, GFP_KERNEL);
bd4a3eb15bb422 Trond Myklebust      2013-08-23  1095  		if (gss_auth->target_name == NULL)
bd4a3eb15bb422 Trond Myklebust      2013-08-23  1096  			goto err_free;
bd4a3eb15bb422 Trond Myklebust      2013-08-23  1097  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1098  	gss_auth->client = clnt;
9b1831e56c7f33 Eric Dumazet         2022-01-27  1099  	gss_auth->net = get_net_track(rpc_net_ns(clnt), &gss_auth->ns_tracker,
9b1831e56c7f33 Eric Dumazet         2022-01-27  1100  				      GFP_KERNEL);
6a19275ada9137 J. Bruce Fields      2005-06-22  1101  	err = -EINVAL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1102  	gss_auth->mech = gss_mech_get_by_pseudoflavor(flavor);
0c77668ddb4e7b Chuck Lever          2019-02-11  1103  	if (!gss_auth->mech)
e726340ac9cf6b Trond Myklebust      2013-08-23  1104  		goto err_put_net;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1105  	gss_auth->service = gss_pseudoflavor_to_service(gss_auth->mech, flavor);
438b6fdebf2a2e J. Bruce Fields      2005-06-22  1106  	if (gss_auth->service == 0)
438b6fdebf2a2e J. Bruce Fields      2005-06-22  1107  		goto err_put_mech;
a699d65ec4ff82 Trond Myklebust      2014-02-10  1108  	if (!gssd_running(gss_auth->net))
a699d65ec4ff82 Trond Myklebust      2014-02-10  1109  		goto err_put_mech;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1110  	auth = &gss_auth->rpc_auth;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1111  	auth->au_cslack = GSS_CRED_SLACK >> 2;
6e460c230d2dfb Chuck Lever          2023-01-15  1112  	BUILD_BUG_ON(GSS_KRB5_MAX_SLACK_NEEDED > RPC_MAX_AUTH_SIZE);
df513a77117127 Olga Kornievskaia    2020-03-26  1113  	auth->au_rslack = GSS_KRB5_MAX_SLACK_NEEDED >> 2;
a00275baa68e1e Chuck Lever          2019-02-11  1114  	auth->au_verfsize = GSS_VERF_SLACK >> 2;
35e77d21baa04b Chuck Lever          2019-02-11  1115  	auth->au_ralign = GSS_VERF_SLACK >> 2;
53bc19f17f2173 Chuck Lever          2020-05-12  1116  	__set_bit(RPCAUTH_AUTH_UPDATE_SLACK, &auth->au_flags);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1117  	auth->au_ops = &authgss_ops;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1118  	auth->au_flavor = flavor;
65b80179f9b817 Chuck Lever          2016-06-29  1119  	if (gss_pseudoflavor_to_datatouch(gss_auth->mech, flavor))
53bc19f17f2173 Chuck Lever          2020-05-12  1120  		__set_bit(RPCAUTH_AUTH_DATATOUCH, &auth->au_flags);
331bc71cb1751d Trond Myklebust      2018-10-14  1121  	refcount_set(&auth->au_count, 1);
0285ed1f12298e Trond Myklebust      2007-06-27  1122  	kref_init(&gss_auth->kref);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1123  
1917228435eebd Trond Myklebust      2013-08-26  1124  	err = rpcauth_init_credcache(auth);
1917228435eebd Trond Myklebust      2013-08-26  1125  	if (err)
1917228435eebd Trond Myklebust      2013-08-26  1126  		goto err_put_mech;
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1127  	/*
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1128  	 * Note: if we created the old pipe first, then someone who
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1129  	 * examined the directory at the right moment might conclude
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1130  	 * that we supported only the old pipe.  So we instead create
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1131  	 * the new pipe first.
34769fc488b463 \"J. Bruce Fields\   2008-12-23  1132  	 */
414a6295984094 Trond Myklebust      2013-08-27  1133  	gss_pipe = gss_pipe_get(clnt, "gssd", &gss_upcall_ops_v1);
1917228435eebd Trond Myklebust      2013-08-26  1134  	if (IS_ERR(gss_pipe)) {
1917228435eebd Trond Myklebust      2013-08-26  1135  		err = PTR_ERR(gss_pipe);
1917228435eebd Trond Myklebust      2013-08-26  1136  		goto err_destroy_credcache;
6a19275ada9137 J. Bruce Fields      2005-06-22  1137  	}
1917228435eebd Trond Myklebust      2013-08-26  1138  	gss_auth->gss_pipe[1] = gss_pipe;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1139  
414a6295984094 Trond Myklebust      2013-08-27  1140  	gss_pipe = gss_pipe_get(clnt, gss_auth->mech->gm_name,
1917228435eebd Trond Myklebust      2013-08-26  1141  			&gss_upcall_ops_v0);
1917228435eebd Trond Myklebust      2013-08-26  1142  	if (IS_ERR(gss_pipe)) {
1917228435eebd Trond Myklebust      2013-08-26  1143  		err = PTR_ERR(gss_pipe);
c239d83b9921b8 Stanislav Kinsbursky 2011-12-26  1144  		goto err_destroy_pipe_1;
c239d83b9921b8 Stanislav Kinsbursky 2011-12-26  1145  	}
1917228435eebd Trond Myklebust      2013-08-26  1146  	gss_auth->gss_pipe[0] = gss_pipe;
07a2bf1da4765d Trond Myklebust      2007-06-09  1147  
6a654188690846 Scott Mayhew         2023-04-20  1148  	if (use_keyring) {
6a654188690846 Scott Mayhew         2023-04-20  1149  		cred = prepare_kernel_cred(&init_task);
6a654188690846 Scott Mayhew         2023-04-20  1150  		if (!cred) {
6a654188690846 Scott Mayhew         2023-04-20  1151  			err = -ENOMEM;
6a654188690846 Scott Mayhew         2023-04-20  1152  			goto err_destroy_pipe_0;
6a654188690846 Scott Mayhew         2023-04-20  1153  		}
6a654188690846 Scott Mayhew         2023-04-20  1154  		keyring = keyring_alloc("gss_keyring",
6a654188690846 Scott Mayhew         2023-04-20  1155  					GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, cred,
6a654188690846 Scott Mayhew         2023-04-20  1156  					(KEY_POS_ALL & ~KEY_POS_SETATTR) |
6a654188690846 Scott Mayhew         2023-04-20  1157  					KEY_USR_VIEW | KEY_USR_READ,
6a654188690846 Scott Mayhew         2023-04-20  1158  					KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
6a654188690846 Scott Mayhew         2023-04-20  1159  		if (IS_ERR(keyring)) {
6a654188690846 Scott Mayhew         2023-04-20  1160  			err = PTR_ERR(keyring);
6a654188690846 Scott Mayhew         2023-04-20  1161  			goto err_destroy_cred;
6a654188690846 Scott Mayhew         2023-04-20  1162  		}
6a654188690846 Scott Mayhew         2023-04-20  1163  		set_bit(KEY_FLAG_ROOT_CAN_CLEAR, &keyring->flags);
6a654188690846 Scott Mayhew         2023-04-20  1164  		cred->thread_keyring = keyring;
6a654188690846 Scott Mayhew         2023-04-20  1165  		cred->jit_keyring = KEY_REQKEY_DEFL_THREAD_KEYRING;
6a654188690846 Scott Mayhew         2023-04-20  1166  		gss_auth->keyring_cred = cred;
6a654188690846 Scott Mayhew         2023-04-20  1167  	}
6a654188690846 Scott Mayhew         2023-04-20  1168  
6a654188690846 Scott Mayhew         2023-04-20  1169  	trace_rpcgss_createauth(flavor, err, gss_auth->keyring_cred ?
6a654188690846 Scott Mayhew         2023-04-20  1170  				gss_auth->keyring_cred->thread_keyring : NULL);
eb6dc19d8e72ce Trond Myklebust      2013-08-28  1171  	return gss_auth;
6a654188690846 Scott Mayhew         2023-04-20  1172  err_destroy_cred:
6a654188690846 Scott Mayhew         2023-04-20  1173  	put_cred(cred);
6a654188690846 Scott Mayhew         2023-04-20  1174  err_destroy_pipe_0:
6a654188690846 Scott Mayhew         2023-04-20  1175  	gss_pipe_free(gss_auth->gss_pipe[0]);
c239d83b9921b8 Stanislav Kinsbursky 2011-12-26  1176  err_destroy_pipe_1:
414a6295984094 Trond Myklebust      2013-08-27  1177  	gss_pipe_free(gss_auth->gss_pipe[1]);
1917228435eebd Trond Myklebust      2013-08-26  1178  err_destroy_credcache:
1917228435eebd Trond Myklebust      2013-08-26  1179  	rpcauth_destroy_credcache(auth);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1180  err_put_mech:
^1da177e4c3f41 Linus Torvalds       2005-04-16  1181  	gss_mech_put(gss_auth->mech);
e726340ac9cf6b Trond Myklebust      2013-08-23  1182  err_put_net:
9b1831e56c7f33 Eric Dumazet         2022-01-27  1183  	put_net_track(gss_auth->net, &gss_auth->ns_tracker);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1184  err_free:
bd4a3eb15bb422 Trond Myklebust      2013-08-23  1185  	kfree(gss_auth->target_name);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1186  	kfree(gss_auth);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1187  out_dec:
^1da177e4c3f41 Linus Torvalds       2005-04-16  1188  	module_put(THIS_MODULE);
6a654188690846 Scott Mayhew         2023-04-20 @1189  	trace_rpcgss_createauth(flavor, err, gss_auth->keyring_cred ?
6a654188690846 Scott Mayhew         2023-04-20  1190  				gss_auth->keyring_cred->thread_keyring : NULL);
6a19275ada9137 J. Bruce Fields      2005-06-22  1191  	return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1192  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  1193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
