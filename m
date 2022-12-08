Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF159629;
	Thu,  8 Dec 2022 06:27:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id o5so468650wrm.1;
        Wed, 07 Dec 2022 22:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fD0kqyhTsz3m+/Dxs4sv71yQMadNBoUIb86PADwbnU=;
        b=CNdfKVK+EQaIAZjkUPqtmo21O/ndk3Xr6WyufVxHFcWOFmrz/PW1/XYcBl+d2KE1gI
         40ePNJWbOjJn4Wx0sPIjqdPLOIPzfkR5mOXGxF/qyYX8zpmgWX5ZKOxUB1fk6JlnoUAR
         rmAJn5HRt/Yr+hlfd1oICP69QLSI5+gNfYIGWZCAODQpCHFiHQeHVS2wpoTA9dhAJLfj
         zIUrUxHUP6mW/0zJe6D4ZcvWTveCxfUEglbopoE/+GTrpcVjQw5AMzjly45wlSuK6pzX
         XppuD+CK8RoT3Rr/zMOjEGRyBu37iUGREa9qOcuG+IFRh924sN6/lbSNznqGG3SPdsL6
         eTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fD0kqyhTsz3m+/Dxs4sv71yQMadNBoUIb86PADwbnU=;
        b=vS02ZeVj3vN9R4i+a+0GJQw5bD5Sfj7BI/UqDTPE0CXr4ELVUOJLXzWsN8kB6QJrlq
         8xmlqAakEGuQy4dIixjeWOSlUxtk5451t7ZdsW7TGTWuEW3xg/7EKVsRq/2hC6+yxC19
         gGfuOVDnqnHtRAQQF+FuPsTR+XRUv6GBlJGSUPg4nqcy5r0HgrjHjuHjKUYPBwYe0nfv
         lXASRPghszO0LmGjX9m59PPds1tY+htJf6hTyuy3TspxBSBvRQ/NIyCWlbfFrI+DgEcD
         5jFTUXluhqwCy30n5KIJU3T1KMgB1jldBCSjmM9UA5yYsVqDq5agJrlYvkT05p92l8oA
         6j+w==
X-Gm-Message-State: ANoB5pnWs/k3T5Ba11mECD1YUiofZ7zQ263zuW6pLInacH3sG826feGP
	KOBOCtFk05uvwzm88hVhjlLs6OMa5XaAzg==
X-Google-Smtp-Source: AA0mqf7ebWREi+2UnDeqYRHbvBXB/blnhSgbCcZlOQBD1f3Dmff8owLupBk6UUpiGJxFbto+F3qhHg==
X-Received: by 2002:adf:e990:0:b0:242:6c62:84ee with SMTP id h16-20020adfe990000000b002426c6284eemr7877644wrm.598.1670480868753;
        Wed, 07 Dec 2022 22:27:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n4-20020a1ca404000000b003d1cf67460esm3727809wme.40.2022.12.07.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 22:27:48 -0800 (PST)
Date: Thu, 8 Dec 2022 09:27:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13368/13707] fs/gfs2/ops_fstype.c:1204
 gfs2_fill_super() warn: missing error code 'error'
Message-ID: <202212081008.haBgzdtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221208062745.vUDqwkDqwjIzuseLYKk01MvKW85FbolaN8TlFK8AqjQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   591cd61541b9b95401e17dca24be486e32104cb8
commit: b9219c49ea9ac3c5cd8c4f86a881af6fd6fd313a [13368/13707] gfs2: Move delete workqueue into super block
config: microblaze-randconfig-m041-20221207
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/gfs2/ops_fstype.c:1204 gfs2_fill_super() warn: missing error code 'error'

Old smatch warnings:
fs/gfs2/ops_fstype.c:406 init_locking() warn: missing error code 'error'
fs/gfs2/ops_fstype.c:660 init_statfs() warn: missing error code 'error'
fs/gfs2/ops_fstype.c:743 init_journal() warn: missing error code 'error'
fs/gfs2/ops_fstype.c:888 init_inodes() warn: missing error code 'error'
fs/gfs2/ops_fstype.c:947 init_per_node() warn: missing error code 'error'

vim +/error +1204 fs/gfs2/ops_fstype.c

1f52aa08d12f8d Andrew Price        2019-03-27  1141  static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
b3b94faa5fe596 David Teigland      2006-01-16  1142  {
1f52aa08d12f8d Andrew Price        2019-03-27  1143  	struct gfs2_args *args = fc->fs_private;
1f52aa08d12f8d Andrew Price        2019-03-27  1144  	int silent = fc->sb_flags & SB_SILENT;
b3b94faa5fe596 David Teigland      2006-01-16  1145  	struct gfs2_sbd *sdp;
b3b94faa5fe596 David Teigland      2006-01-16  1146  	struct gfs2_holder mount_gh;
96b1454f2e8ede Bob Peterson        2020-12-22  1147  	struct gfs2_holder freeze_gh;
b3b94faa5fe596 David Teigland      2006-01-16  1148  	int error;
b3b94faa5fe596 David Teigland      2006-01-16  1149  
b3b94faa5fe596 David Teigland      2006-01-16  1150  	sdp = init_sbd(sb);
b3b94faa5fe596 David Teigland      2006-01-16  1151  	if (!sdp) {
d77d1b58aaf445 Joe Perches         2014-03-06  1152  		pr_warn("can't alloc struct gfs2_sbd\n");
b3b94faa5fe596 David Teigland      2006-01-16  1153  		return -ENOMEM;
b3b94faa5fe596 David Teigland      2006-01-16  1154  	}
f55073ff1eaf99 Steven Whitehouse   2009-09-28  1155  	sdp->sd_args = *args;
b3b94faa5fe596 David Teigland      2006-01-16  1156  
fe64d517df0970 Steven Whitehouse   2009-05-19  1157  	if (sdp->sd_args.ar_spectator) {
1751e8a6cb935e Linus Torvalds      2017-11-27  1158                  sb->s_flags |= SB_RDONLY;
e8ca5cc571a603 David Teigland      2012-01-09  1159  		set_bit(SDF_RORECOVERY, &sdp->sd_flags);
fe64d517df0970 Steven Whitehouse   2009-05-19  1160  	}
6f04c1c7fe9566 Steven Whitehouse   2009-01-06  1161  	if (sdp->sd_args.ar_posix_acl)
1751e8a6cb935e Linus Torvalds      2017-11-27  1162  		sb->s_flags |= SB_POSIXACL;
f25934c5f88655 Christoph Hellwig   2009-10-30  1163  	if (sdp->sd_args.ar_nobarrier)
f25934c5f88655 Christoph Hellwig   2009-10-30  1164  		set_bit(SDF_NOBARRIERS, &sdp->sd_flags);
6f04c1c7fe9566 Steven Whitehouse   2009-01-06  1165  
1751e8a6cb935e Linus Torvalds      2017-11-27  1166  	sb->s_flags |= SB_NOSEC;
719ee344675c2e Steven Whitehouse   2008-09-18  1167  	sb->s_magic = GFS2_MAGIC;
719ee344675c2e Steven Whitehouse   2008-09-18  1168  	sb->s_op = &gfs2_super_ops;
41ced6dcf3dc6b Al Viro             2010-12-18  1169  	sb->s_d_op = &gfs2_dops;
719ee344675c2e Steven Whitehouse   2008-09-18  1170  	sb->s_export_op = &gfs2_export_ops;
cc632e7f934655 Steven Whitehouse   2009-09-15  1171  	sb->s_qcop = &gfs2_quotactl_ops;
de3b08d3ecf89d Jan Kara            2014-09-30  1172  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP;
cc632e7f934655 Steven Whitehouse   2009-09-15  1173  	sb_dqopt(sb)->flags |= DQUOT_QUOTA_SYS_FILE;
719ee344675c2e Steven Whitehouse   2008-09-18  1174  	sb->s_time_gran = 1;
719ee344675c2e Steven Whitehouse   2008-09-18  1175  	sb->s_maxbytes = MAX_LFS_FILESIZE;
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1176  
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1177  	/* Set up the buffer cache and fill in some fake block size values
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1178  	   to allow us to read-in the on-disk superblock. */
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1179  	sdp->sd_sb.sb_bsize = sb_min_blocksize(sb, GFS2_BASIC_BLOCK);
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1180  	sdp->sd_sb.sb_bsize_shift = sb->s_blocksize_bits;
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1181  	sdp->sd_fsb2bb_shift = sdp->sd_sb.sb_bsize_shift -
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1182                                 GFS2_BASIC_BLOCK_SHIFT;
47a9a527946842 Fabian Frederick    2016-08-02  1183  	sdp->sd_fsb2bb = BIT(sdp->sd_fsb2bb_shift);
b3b94faa5fe596 David Teigland      2006-01-16  1184  
5e687eac1bd31b Benjamin Marzinski  2010-05-04  1185  	sdp->sd_tune.gt_logd_secs = sdp->sd_args.ar_commit;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1186  	sdp->sd_tune.gt_quota_quantum = sdp->sd_args.ar_quota_quantum;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1187  	if (sdp->sd_args.ar_statfs_quantum) {
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1188  		sdp->sd_tune.gt_statfs_slow = 0;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1189  		sdp->sd_tune.gt_statfs_quantum = sdp->sd_args.ar_statfs_quantum;
32e471ef1057e8 Steven Whitehouse   2011-05-10  1190  	} else {
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1191  		sdp->sd_tune.gt_statfs_slow = 1;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1192  		sdp->sd_tune.gt_statfs_quantum = 30;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1193  	}
48c2b613616235 Steven Whitehouse   2009-05-13  1194  
b3b94faa5fe596 David Teigland      2006-01-16  1195  	error = init_names(sdp, silent);
c2a04b02c060c4 Jamie Iles          2020-10-12  1196  	if (error)
c2a04b02c060c4 Jamie Iles          2020-10-12  1197  		goto fail_free;
b3b94faa5fe596 David Teigland      2006-01-16  1198  
561b796987af8b Andreas Gruenbacher 2017-08-22  1199  	snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s", sdp->sd_table_name);
e0c2a9aa1e6845 David Teigland      2012-01-09  1200  
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1201  	sdp->sd_delete_wq = alloc_workqueue("gfs2-delete/%s",
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1202  			WQ_MEM_RECLAIM | WQ_FREEZABLE, 0, sdp->sd_fsname);
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1203  	if (!sdp->sd_delete_wq)
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06 @1204  		goto fail_free;

Needs an "error = -ENOMEM;"

b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1205  
b3b94faa5fe596 David Teigland      2006-01-16  1206  	error = gfs2_sys_fs_add(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1207  	if (error)
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1208  		goto fail_delete_wq;
0d515210b6969e Bob Peterson        2012-06-13  1209  
0d515210b6969e Bob Peterson        2012-06-13  1210  	gfs2_create_debugfs_file(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1211  
b3b94faa5fe596 David Teigland      2006-01-16  1212  	error = gfs2_lm_mount(sdp, silent);
b3b94faa5fe596 David Teigland      2006-01-16  1213  	if (error)
0d515210b6969e Bob Peterson        2012-06-13  1214  		goto fail_debug;
b3b94faa5fe596 David Teigland      2006-01-16  1215  
b3b94faa5fe596 David Teigland      2006-01-16  1216  	error = init_locking(sdp, &mount_gh, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1217  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1218  		goto fail_lm;
b3b94faa5fe596 David Teigland      2006-01-16  1219  
9b8df98fc8973a Steven Whitehouse   2008-08-08  1220  	error = init_sb(sdp, silent);
b3b94faa5fe596 David Teigland      2006-01-16  1221  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1222  		goto fail_locking;
b3b94faa5fe596 David Teigland      2006-01-16  1223  
47b7ec1daa511c Andrew Price        2021-02-05  1224  	/* Turn rgrplvb on by default if fs format is recent enough */
47b7ec1daa511c Andrew Price        2021-02-05  1225  	if (!sdp->sd_args.ar_got_rgrplvb && sdp->sd_sb.sb_fs_format > 1801)
47b7ec1daa511c Andrew Price        2021-02-05  1226  		sdp->sd_args.ar_rgrplvb = 1;
47b7ec1daa511c Andrew Price        2021-02-05  1227  
ba6e93645f039b Steven Whitehouse   2010-06-14  1228  	error = wait_on_journal(sdp);
ba6e93645f039b Steven Whitehouse   2010-06-14  1229  	if (error)
ba6e93645f039b Steven Whitehouse   2010-06-14  1230  		goto fail_sb;
ba6e93645f039b Steven Whitehouse   2010-06-14  1231  
feb47ca9314666 Steven Whitehouse   2010-09-29  1232  	/*
feb47ca9314666 Steven Whitehouse   2010-09-29  1233  	 * If user space has failed to join the cluster or some similar
feb47ca9314666 Steven Whitehouse   2010-09-29  1234  	 * failure has occurred, then the journal id will contain a
feb47ca9314666 Steven Whitehouse   2010-09-29  1235  	 * negative (error) number. This will then be returned to the
feb47ca9314666 Steven Whitehouse   2010-09-29  1236  	 * caller (of the mount syscall). We do this even for spectator
feb47ca9314666 Steven Whitehouse   2010-09-29  1237  	 * mounts (which just write a jid of 0 to indicate "ok" even though
feb47ca9314666 Steven Whitehouse   2010-09-29  1238  	 * the jid is unused in the spectator case)
feb47ca9314666 Steven Whitehouse   2010-09-29  1239  	 */
feb47ca9314666 Steven Whitehouse   2010-09-29  1240  	if (sdp->sd_lockstruct.ls_jid < 0) {
feb47ca9314666 Steven Whitehouse   2010-09-29  1241  		error = sdp->sd_lockstruct.ls_jid;
feb47ca9314666 Steven Whitehouse   2010-09-29  1242  		sdp->sd_lockstruct.ls_jid = 0;
feb47ca9314666 Steven Whitehouse   2010-09-29  1243  		goto fail_sb;
feb47ca9314666 Steven Whitehouse   2010-09-29  1244  	}
feb47ca9314666 Steven Whitehouse   2010-09-29  1245  
e0c2a9aa1e6845 David Teigland      2012-01-09  1246  	if (sdp->sd_args.ar_spectator)
561b796987af8b Andreas Gruenbacher 2017-08-22  1247  		snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s.s",
e0c2a9aa1e6845 David Teigland      2012-01-09  1248  			 sdp->sd_table_name);
e0c2a9aa1e6845 David Teigland      2012-01-09  1249  	else
561b796987af8b Andreas Gruenbacher 2017-08-22  1250  		snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s.%u",
e0c2a9aa1e6845 David Teigland      2012-01-09  1251  			 sdp->sd_table_name, sdp->sd_lockstruct.ls_jid);
e0c2a9aa1e6845 David Teigland      2012-01-09  1252  
b3b94faa5fe596 David Teigland      2006-01-16  1253  	error = init_inodes(sdp, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1254  	if (error)
f42faf4fa4eaf7 Steven Whitehouse   2006-01-30  1255  		goto fail_sb;
b3b94faa5fe596 David Teigland      2006-01-16  1256  
b3b94faa5fe596 David Teigland      2006-01-16  1257  	error = init_per_node(sdp, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1258  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1259  		goto fail_inodes;
b3b94faa5fe596 David Teigland      2006-01-16  1260  
b3b94faa5fe596 David Teigland      2006-01-16  1261  	error = gfs2_statfs_init(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1262  	if (error) {
b3b94faa5fe596 David Teigland      2006-01-16  1263  		fs_err(sdp, "can't initialize statfs subsystem: %d\n", error);
b3b94faa5fe596 David Teigland      2006-01-16  1264  		goto fail_per_node;
b3b94faa5fe596 David Teigland      2006-01-16  1265  	}
b3b94faa5fe596 David Teigland      2006-01-16  1266  
a28dc123fa66ba Bob Peterson        2021-05-14  1267  	if (!sb_rdonly(sb)) {
a28dc123fa66ba Bob Peterson        2021-05-14  1268  		error = init_threads(sdp);
a28dc123fa66ba Bob Peterson        2021-05-14  1269  		if (error) {
a28dc123fa66ba Bob Peterson        2021-05-14  1270  			gfs2_withdraw_delayed(sdp);
a28dc123fa66ba Bob Peterson        2021-05-14  1271  			goto fail_per_node;
a28dc123fa66ba Bob Peterson        2021-05-14  1272  		}
a28dc123fa66ba Bob Peterson        2021-05-14  1273  	}
a28dc123fa66ba Bob Peterson        2021-05-14  1274  
c77b52c0a13799 Bob Peterson        2020-12-22  1275  	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
96b1454f2e8ede Bob Peterson        2020-12-22  1276  	if (error)
b780cc615ba479 Bob Peterson        2020-06-25  1277  		goto fail_per_node;
96b1454f2e8ede Bob Peterson        2020-12-22  1278  
96b1454f2e8ede Bob Peterson        2020-12-22  1279  	if (!sb_rdonly(sb))
b3b94faa5fe596 David Teigland      2006-01-16  1280  		error = gfs2_make_fs_rw(sdp);
96b1454f2e8ede Bob Peterson        2020-12-22  1281  
96b1454f2e8ede Bob Peterson        2020-12-22  1282  	gfs2_freeze_unlock(&freeze_gh);
b3b94faa5fe596 David Teigland      2006-01-16  1283  	if (error) {
a28dc123fa66ba Bob Peterson        2021-05-14  1284  		if (sdp->sd_quotad_process)
a28dc123fa66ba Bob Peterson        2021-05-14  1285  			kthread_stop(sdp->sd_quotad_process);
a28dc123fa66ba Bob Peterson        2021-05-14  1286  		sdp->sd_quotad_process = NULL;
a28dc123fa66ba Bob Peterson        2021-05-14  1287  		if (sdp->sd_logd_process)
a28dc123fa66ba Bob Peterson        2021-05-14  1288  			kthread_stop(sdp->sd_logd_process);
a28dc123fa66ba Bob Peterson        2021-05-14  1289  		sdp->sd_logd_process = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1290  		fs_err(sdp, "can't make FS RW: %d\n", error);
8ad151c2ac9aa1 Steven Whitehouse   2013-12-12  1291  		goto fail_per_node;
b3b94faa5fe596 David Teigland      2006-01-16  1292  	}
b3b94faa5fe596 David Teigland      2006-01-16  1293  	gfs2_glock_dq_uninit(&mount_gh);
8633ecfaba4ce5 Steven Whitehouse   2009-07-31  1294  	gfs2_online_uevent(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1295  	return 0;
b3b94faa5fe596 David Teigland      2006-01-16  1296  
b3b94faa5fe596 David Teigland      2006-01-16  1297  fail_per_node:
b3b94faa5fe596 David Teigland      2006-01-16  1298  	init_per_node(sdp, UNDO);
b3b94faa5fe596 David Teigland      2006-01-16  1299  fail_inodes:
b3b94faa5fe596 David Teigland      2006-01-16  1300  	init_inodes(sdp, UNDO);
b3b94faa5fe596 David Teigland      2006-01-16  1301  fail_sb:
9b8df98fc8973a Steven Whitehouse   2008-08-08  1302  	if (sdp->sd_root_dir)
9b8df98fc8973a Steven Whitehouse   2008-08-08  1303  		dput(sdp->sd_root_dir);
9b8df98fc8973a Steven Whitehouse   2008-08-08  1304  	if (sdp->sd_master_dir)
9b8df98fc8973a Steven Whitehouse   2008-08-08  1305  		dput(sdp->sd_master_dir);
e7c8707ea2b910 Steven Whitehouse   2009-01-20  1306  	if (sb->s_root)
e7c8707ea2b910 Steven Whitehouse   2009-01-20  1307  		dput(sb->s_root);
9b8df98fc8973a Steven Whitehouse   2008-08-08  1308  	sb->s_root = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1309  fail_locking:
b3b94faa5fe596 David Teigland      2006-01-16  1310  	init_locking(sdp, &mount_gh, UNDO);
b3b94faa5fe596 David Teigland      2006-01-16  1311  fail_lm:
0e48e055a7dfc0 Bob Peterson        2014-06-02  1312  	complete_all(&sdp->sd_journal_ready);
fefc03bfedeff2 Steven Whitehouse   2008-12-19  1313  	gfs2_gl_hash_clear(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1314  	gfs2_lm_unmount(sdp);
0d515210b6969e Bob Peterson        2012-06-13  1315  fail_debug:
5f8820960cf4fb Robert Peterson     2007-04-18  1316  	gfs2_delete_debugfs_file(sdp);
0d515210b6969e Bob Peterson        2012-06-13  1317  	gfs2_sys_fs_del(sdp);
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1318  fail_delete_wq:
b9219c49ea9ac3 Andreas Gruenbacher 2022-12-06  1319  	destroy_workqueue(sdp->sd_delete_wq);
c2a04b02c060c4 Jamie Iles          2020-10-12  1320  fail_free:
c2a04b02c060c4 Jamie Iles          2020-10-12  1321  	free_sbd(sdp);
5c676f6d359b04 Steven Whitehouse   2006-02-27  1322  	sb->s_fs_info = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1323  	return error;
b3b94faa5fe596 David Teigland      2006-01-16  1324  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

