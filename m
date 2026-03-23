Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66181C5D59
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272506; cv=none; b=WMictHf+KSwFZheRxBv62k/5YUsuTrj4HAmOvdiZyb7vtsj462ldRMfQSzLQoxik4Tqp0ZC7sx5yDfuXJxyuu2Y6gCsVx4e/qGsPGRyFBh+HUVGOWilvuPSuloMNHNsBCMaodaRQ4O7S/t4a1bkjwTdHNeepw3b/CdP5PWEqcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272506; c=relaxed/simple;
	bh=YQ7s0EV/97nsUKrgQzBliOndsgjk73E6nBw/1782Xh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qmMy6MIrY81T5o8aZTsROjG8TS8hcCyHtipb3ohQd/J2HwNQ4dSOf/nFbteOmFCR9FbYPizcwjg+lv5WvaDZd+FNxQAnsEWt4ZcA+Ax+9YxQt3woaz6pX1OAjd5EPg9wK4S313dFB+ZNjKmIsPNryZ3Pxn5+8OP2YPWrxmdx6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0Eg1jFK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0Eg1jFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774272505; x=1805808505;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YQ7s0EV/97nsUKrgQzBliOndsgjk73E6nBw/1782Xh8=;
  b=f0Eg1jFKZwehGfHMxYf/weuq/BGo0TZCfWru3ydBUZpoHyCSap0D4X6o
   RZ8FTBqQ9p1PWv440sk2Lr/eFi8dU5kaigkSAleHdEt/kS8frOAM4WVEw
   5rHX7nANsZGcb0zuL9rYQCKLzKBN3YZrPLEjnJiy5YeHN7AEBGpjR76H9
   E91zGYk7IKFp7f62BT6B9Ap+3n7SMM4H+0jMB1KJlbNm1RGUGVUBmyL/Z
   HEG+O8YT5et2JMnwrJPGp0uJ42j8F3mJXW7H//S0ESOwhrXytKoCcJJRW
   yn61khmHCwp5WeTuv5/YeWpR8cmt+0RKUyhKyHDd5pUhqxPK6kWKGYtU1
   g==;
X-CSE-ConnectionGUID: UOXuigg/TwS/n3sezqDxJA==
X-CSE-MsgGUID: SJoOKPI4Q5uXabl5JtP3DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85892636"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85892636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:28:24 -0700
X-CSE-ConnectionGUID: wo35SwchRs6MWfxf7Dhdfg==
X-CSE-MsgGUID: kszDSy/LQBqACc5s4Nb9yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247791727"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 06:28:23 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4fKO-000000000eD-169N;
	Mon, 23 Mar 2026 13:28:20 +0000
Date: Mon, 23 Mar 2026 21:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/dir.c:1176 ceph_mkdir() warn: passing zero to
 'ERR_PTR'
Message-ID: <202603232113.WWeesLP4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mk=
dir to return struct dentry *
date:   1 year, 1 month ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 1 month ago
config: hexagon-randconfig-r072-20260323 (https://download.01.org/0day-ci/a=
rchive/20260323/202603232113.WWeesLP4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b1c=
f9b0835d214bcbd0d6e8882760c07cfccb298)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603232113.WWeesLP4-lkp@intel.com/

New smatch warnings:
fs/ceph/dir.c:1176 ceph_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/ceph/dir.c:908 ceph_handle_notrace_create() warn: passing zero to 'PTR_E=
RR'

vim +/ERR_PTR +1176 fs/ceph/dir.c

2817b000b02c5f Sage Weil         2009-10-06  1094 =20
88d5baf69082e5 NeilBrown         2025-02-27  1095  static struct dentry *ce=
ph_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  1096  				 struct dentry *dent=
ry, umode_t mode)
2817b000b02c5f Sage Weil         2009-10-06  1097  {
2678da88f4b449 Xiubo Li          2020-09-03  1098  	struct ceph_mds_client =
*mdsc =3D ceph_sb_to_mdsc(dir->i_sb);
38d46409c4639a Xiubo Li          2023-06-12  1099  	struct ceph_client *cl =
=3D mdsc->fsc->client;
2817b000b02c5f Sage Weil         2009-10-06  1100  	struct ceph_mds_request=
 *req;
5c31e92dffb94c Yan, Zheng        2019-05-26  1101  	struct ceph_acl_sec_ctx=
 as_ctx =3D {};
4868e537fa867f Xiubo Li          2022-05-10  1102  	int err;
2817b000b02c5f Sage Weil         2009-10-06  1103  	int op;
2817b000b02c5f Sage Weil         2009-10-06  1104 =20
4868e537fa867f Xiubo Li          2022-05-10  1105  	err =3D ceph_wait_on_co=
nflict_unlink(dentry);
4868e537fa867f Xiubo Li          2022-05-10  1106  	if (err)
88d5baf69082e5 NeilBrown         2025-02-27  1107  		return ERR_PTR(err);
4868e537fa867f Xiubo Li          2022-05-10  1108 =20
2817b000b02c5f Sage Weil         2009-10-06  1109  	if (ceph_snap(dir) =3D=
=3D CEPH_SNAPDIR) {
2817b000b02c5f Sage Weil         2009-10-06  1110  		/* mkdir .snap/foo is =
a MKSNAP */
2817b000b02c5f Sage Weil         2009-10-06  1111  		op =3D CEPH_MDS_OP_MKS=
NAP;
38d46409c4639a Xiubo Li          2023-06-12  1112  		doutc(cl, "mksnap %llx=
.%llx/'%pd' dentry %p\n",
38d46409c4639a Xiubo Li          2023-06-12  1113  		      ceph_vinop(dir),=
 dentry, dentry);
2817b000b02c5f Sage Weil         2009-10-06  1114  	} else if (ceph_snap(di=
r) =3D=3D CEPH_NOSNAP) {
38d46409c4639a Xiubo Li          2023-06-12  1115  		doutc(cl, "mkdir %llx.=
%llx/'%pd' dentry %p mode 0%ho\n",
38d46409c4639a Xiubo Li          2023-06-12  1116  		      ceph_vinop(dir),=
 dentry, dentry, mode);
2817b000b02c5f Sage Weil         2009-10-06  1117  		op =3D CEPH_MDS_OP_MKD=
IR;
2817b000b02c5f Sage Weil         2009-10-06  1118  	} else {
4868e537fa867f Xiubo Li          2022-05-10  1119  		err =3D -EROFS;
2817b000b02c5f Sage Weil         2009-10-06  1120  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1121  	}
b1ee94aa593abd Yan, Zheng        2014-09-16  1122 =20
2596366907f872 Yan, Zheng        2018-01-12  1123  	if (op =3D=3D CEPH_MDS_=
OP_MKDIR &&
2596366907f872 Yan, Zheng        2018-01-12  1124  	    ceph_quota_is_max_f=
iles_exceeded(dir)) {
b7a2921765cf79 Luis Henriques    2018-01-05  1125  		err =3D -EDQUOT;
b7a2921765cf79 Luis Henriques    2018-01-05  1126  		goto out;
b7a2921765cf79 Luis Henriques    2018-01-05  1127  	}
abd4fc775857cd Lu=C3=ADs Henriques    2022-08-25  1128  	if ((op =3D=3D CEP=
H_MDS_OP_MKSNAP) && IS_ENCRYPTED(dir) &&
abd4fc775857cd Lu=C3=ADs Henriques    2022-08-25  1129  	    !fscrypt_has_e=
ncryption_key(dir)) {
abd4fc775857cd Lu=C3=ADs Henriques    2022-08-25  1130  		err =3D -ENOKEY;
abd4fc775857cd Lu=C3=ADs Henriques    2022-08-25  1131  		goto out;
abd4fc775857cd Lu=C3=ADs Henriques    2022-08-25  1132  	}
b7a2921765cf79 Luis Henriques    2018-01-05  1133 =20
b1ee94aa593abd Yan, Zheng        2014-09-16  1134 =20
2817b000b02c5f Sage Weil         2009-10-06  1135  	req =3D ceph_mdsc_creat=
e_request(mdsc, op, USE_AUTH_MDS);
2817b000b02c5f Sage Weil         2009-10-06  1136  	if (IS_ERR(req)) {
2817b000b02c5f Sage Weil         2009-10-06  1137  		err =3D PTR_ERR(req);
2817b000b02c5f Sage Weil         2009-10-06  1138  		goto out;
2817b000b02c5f Sage Weil         2009-10-06  1139  	}
2817b000b02c5f Sage Weil         2009-10-06  1140 =20
ec9595c080c6f0 Jeff Layton       2020-08-26  1141  	mode |=3D S_IFDIR;
ec9595c080c6f0 Jeff Layton       2020-08-26  1142  	req->r_new_inode =3D ce=
ph_new_inode(dir, dentry, &mode, &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1143  	if (IS_ERR(req->r_new_i=
node)) {
ec9595c080c6f0 Jeff Layton       2020-08-26  1144  		err =3D PTR_ERR(req->r=
_new_inode);
ec9595c080c6f0 Jeff Layton       2020-08-26  1145  		req->r_new_inode =3D N=
ULL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1146  		goto out_req;
ec9595c080c6f0 Jeff Layton       2020-08-26  1147  	}
ec9595c080c6f0 Jeff Layton       2020-08-26  1148 =20
2817b000b02c5f Sage Weil         2009-10-06  1149  	req->r_dentry =3D dget(=
dentry);
2817b000b02c5f Sage Weil         2009-10-06  1150  	req->r_num_caps =3D 2;
3dd69aabcef3d8 Jeff Layton       2017-01-31  1151  	req->r_parent =3D dir;
4c18347238ab5a Jeff Layton       2021-06-18  1152  	ihold(dir);
3dd69aabcef3d8 Jeff Layton       2017-01-31  1153  	set_bit(CEPH_MDS_R_PARE=
NT_LOCKED, &req->r_req_flags);
09838f1bfd40f4 Christian Brauner 2023-08-07  1154  	if (op =3D=3D CEPH_MDS_=
OP_MKDIR)
09838f1bfd40f4 Christian Brauner 2023-08-07  1155  		req->r_mnt_idmap =3D m=
nt_idmap_get(idmap);
2817b000b02c5f Sage Weil         2009-10-06  1156  	req->r_args.mkdir.mode =
=3D cpu_to_le32(mode);
d9d00f71ab5a2b Xiubo Li          2023-06-05  1157  	req->r_dentry_drop =3D =
CEPH_CAP_FILE_SHARED | CEPH_CAP_AUTH_EXCL |
d9d00f71ab5a2b Xiubo Li          2023-06-05  1158  			     CEPH_CAP_XATTR_E=
XCL;
2817b000b02c5f Sage Weil         2009-10-06  1159  	req->r_dentry_unless =
=3D CEPH_CAP_FILE_EXCL;
ec9595c080c6f0 Jeff Layton       2020-08-26  1160 =20
ec9595c080c6f0 Jeff Layton       2020-08-26  1161  	ceph_as_ctx_to_req(req,=
 &as_ctx);
ec9595c080c6f0 Jeff Layton       2020-08-26  1162 =20
2817b000b02c5f Sage Weil         2009-10-06  1163  	err =3D ceph_mdsc_do_re=
quest(mdsc, dir, req);
275dd19ea4e84c Yan, Zheng        2014-12-10  1164  	if (!err &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1165  	    !req->r_reply_info.=
head->is_target &&
275dd19ea4e84c Yan, Zheng        2014-12-10  1166  	    !req->r_reply_info.=
head->is_dentry)
2817b000b02c5f Sage Weil         2009-10-06  1167  		err =3D ceph_handle_no=
trace_create(dir, dentry);
ec9595c080c6f0 Jeff Layton       2020-08-26  1168  out_req:
2817b000b02c5f Sage Weil         2009-10-06  1169  	ceph_mdsc_put_request(r=
eq);
2817b000b02c5f Sage Weil         2009-10-06  1170  out:
b20a95a0dd47c5 Yan, Zheng        2014-02-11  1171  	if (!err)
5c31e92dffb94c Yan, Zheng        2019-05-26  1172  		ceph_init_inode_acls(d=
_inode(dentry), &as_ctx);
b20a95a0dd47c5 Yan, Zheng        2014-02-11  1173  	else
2817b000b02c5f Sage Weil         2009-10-06  1174  		d_drop(dentry);
5c31e92dffb94c Yan, Zheng        2019-05-26  1175  	ceph_release_acl_sec_ct=
x(&as_ctx);
88d5baf69082e5 NeilBrown         2025-02-27 @1176  	return ERR_PTR(err);
2817b000b02c5f Sage Weil         2009-10-06  1177  }
2817b000b02c5f Sage Weil         2009-10-06  1178 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
