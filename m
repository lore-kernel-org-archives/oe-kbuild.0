Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70438652
	for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 04:29:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so2781968f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 21:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685334556; x=1687926556;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6AA882SiBYMTpoVIxqOHdC7h2CDG5NOjhY0xj2x/PU=;
        b=ClrrpEmDI1g1A81Zxiu3Tcv/ZF5EXZ7vFABNDNIt92SlIKYWW4KvYp1IKdDQES9etP
         P+IOL5xqemSuYAQanc85hpu8KvNDDh68UTMZ08YCuCMXnT8gPgLhnBSq40AfWSaIGWdm
         EeFyqG8ZagN2o3VRSBfOsOPDO5lMrK/foQhphmFBYkq7ouKZhrn9hc4Vr/yIQgeFf1nR
         lSvM8aV0IYk65sEUvqOxlbOHwmjG+Mhd4ee1+IP1JtDcU2mlqpI9V+aJX5zfWeyHJiwS
         5PGs3FwJwrpBcEgavQZ3YbqwXqyZyUCwLdNGMfdNSgiF503HbEeLdbN7jtyO+MgAoj0w
         +n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685334556; x=1687926556;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6AA882SiBYMTpoVIxqOHdC7h2CDG5NOjhY0xj2x/PU=;
        b=aYJtACRYaYvPN/rBPZWbLcslBd6IulrVZesH/VEm+CHjVq/UCynDsOs42xlSxMN3DS
         m4lEmpbe2PN2kvsanRybuOSzLl5fKBf9ateNEJMQVFq4RtTTaVH8UYJBdjVFQMJU/b4/
         CyTUPb10ADd74VFbuL+BIDUiSLGogXPXxXQjWw2OlwUs1oZ28FR4RWbr046MlozD9mUZ
         SJLwtv9B1S1D/0Ok20ye6mZ2YnBuxR7j3U29oeiJSb+naquPa/iULJ25GIknSRAVbqo+
         cXlmO43gMUhLy0quAnfZHV1XUXAINo+Gn8sUycWbzPctZIClW0ikokDdnzCfY/nnFdR5
         JBmA==
X-Gm-Message-State: AC+VfDwL+teqn/x+/gDUEOJR/T+0vpcd+dF+Ct3vR6gCfU1AWol39lov
	RtUizgxL4rGLkOztOSxhHFNCZ7IRtpbfsY5WKf4=
X-Google-Smtp-Source: ACHHUZ4vycuytRWK3z5kWCzhZlxYVXWFd/CMlVWz6cY5+6X1xZZ0drJiIAb+ZjI5k5Ei8wBOmlH/bA==
X-Received: by 2002:adf:df12:0:b0:2fe:851c:672f with SMTP id y18-20020adfdf12000000b002fe851c672fmr6723065wrl.8.1685334556365;
        Sun, 28 May 2023 21:29:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b003f4ecf1fcbcsm16616867wmf.22.2023.05.28.21.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 21:29:14 -0700 (PDT)
Date: Sat, 27 May 2023 12:55:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-origin-xino 21/21] fs/overlayfs/namei.c:1231
 ovl_lookup() error: uninitialized symbol 'xino'.
Message-ID: <33daf2b9-e452-43c5-a495-59630548bf8b@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/amir73il/linux ovl-origin-xino
head:   dc6fca4068e8044aae880d4d5fc8060cd27a23c2
commit: dc6fca4068e8044aae880d4d5fc8060cd27a23c2 [21/21] ovl: get persistent inode number from origin xattr
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230527/202305270836.IEnVP8NF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305270836.IEnVP8NF-lkp@intel.com/

New smatch warnings:
fs/overlayfs/namei.c:1231 ovl_lookup() error: uninitialized symbol 'xino'.

vim +/xino +1231 fs/overlayfs/namei.c

bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   945  struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   946  			  unsigned int flags)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   947  {
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   948  	struct ovl_entry *oe;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   949  	const struct cred *old_cred;
6b2d5fe46fa8f4 Miklos Szeredi      2016-12-16   950  	struct ovl_fs *ofs = dentry->d_sb->s_fs_info;
32a17d7733687a Amir Goldstein      2023-03-15   951  	struct ovl_entry *poe = OVL_E(dentry->d_parent);
32a17d7733687a Amir Goldstein      2023-03-15   952  	struct ovl_entry *roe = OVL_E(dentry->d_sb->s_root);
9d3dfea3d35a32 Vivek Goyal         2018-05-11   953  	struct ovl_path *stack = NULL, *origin_path = NULL;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   954  	struct dentry *upperdir, *upperdentry = NULL;
ad1d615cec1c97 Amir Goldstein      2018-01-11   955  	struct dentry *origin = NULL;
359f392ca53e91 Amir Goldstein      2017-06-21   956  	struct dentry *index = NULL;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   957  	unsigned int ctr = 0;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   958  	struct inode *inode = NULL;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   959  	bool upperopaque = false;
02b69b284cd781 Miklos Szeredi      2016-12-16   960  	char *upperredirect = NULL;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   961  	struct dentry *this;
dc6fca4068e804 Amir Goldstein      2023-05-25   962  	unsigned long xino;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   963  	unsigned int i;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   964  	int err;
6815f479ca90ee Vivek Goyal         2020-06-01   965  	bool uppermetacopy = false;
e28edc46b8e29d Miklos Szeredi      2016-12-16   966  	struct ovl_lookup_data d = {
146d62e5a5867f Amir Goldstein      2019-04-18   967  		.sb = dentry->d_sb,
e28edc46b8e29d Miklos Szeredi      2016-12-16   968  		.name = dentry->d_name,
e28edc46b8e29d Miklos Szeredi      2016-12-16   969  		.is_dir = false,
e28edc46b8e29d Miklos Szeredi      2016-12-16   970  		.opaque = false,
e28edc46b8e29d Miklos Szeredi      2016-12-16   971  		.stop = false,
a1ac2bc808c50e Amir Goldstein      2023-04-03   972  		.last = ofs->config.redirect_follow ? false : !ovl_numlower(poe),
02b69b284cd781 Miklos Szeredi      2016-12-16   973  		.redirect = NULL,
9d3dfea3d35a32 Vivek Goyal         2018-05-11   974  		.metacopy = false,
e28edc46b8e29d Miklos Szeredi      2016-12-16   975  	};
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   976  
6b2d5fe46fa8f4 Miklos Szeredi      2016-12-16   977  	if (dentry->d_name.len > ofs->namelen)
6b2d5fe46fa8f4 Miklos Szeredi      2016-12-16   978  		return ERR_PTR(-ENAMETOOLONG);
6b2d5fe46fa8f4 Miklos Szeredi      2016-12-16   979  
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   980  	old_cred = ovl_override_creds(dentry->d_sb);
09d8b586731bf5 Miklos Szeredi      2017-07-04   981  	upperdir = ovl_dentry_upper(dentry->d_parent);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   982  	if (upperdir) {
dad7017a840d8d Christian Brauner   2022-04-04   983  		d.mnt = ovl_upper_mnt(ofs);
1434a65ea625c5 Chengguang Xu       2020-05-26   984  		err = ovl_lookup_layer(upperdir, &d, &upperdentry, true);
e28edc46b8e29d Miklos Szeredi      2016-12-16   985  		if (err)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   986  			goto out;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   987  
bccece1ead3681 Miklos Szeredi      2020-03-17   988  		if (upperdentry && upperdentry->d_flags & DCACHE_OP_REAL) {
e28edc46b8e29d Miklos Szeredi      2016-12-16   989  			dput(upperdentry);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   990  			err = -EREMOTE;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   991  			goto out;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16   992  		}
a9d019573e8814 Amir Goldstein      2017-04-30   993  		if (upperdentry && !d.is_dir) {
f7d3daca7c79d9 Amir Goldstein      2017-06-21   994  			/*
f7d3daca7c79d9 Amir Goldstein      2017-06-21   995  			 * Lookup copy up origin by decoding origin file handle.
f7d3daca7c79d9 Amir Goldstein      2017-06-21   996  			 * We may get a disconnected dentry, which is fine,
f7d3daca7c79d9 Amir Goldstein      2017-06-21   997  			 * because we only need to hold the origin inode in
f7d3daca7c79d9 Amir Goldstein      2017-06-21   998  			 * cache and use its inode number.  We may even get a
f7d3daca7c79d9 Amir Goldstein      2017-06-21   999  			 * connected dentry, that is not under any of the lower
f7d3daca7c79d9 Amir Goldstein      2017-06-21  1000  			 * layers root.  That is also fine for using it's inode
f7d3daca7c79d9 Amir Goldstein      2017-06-21  1001  			 * number - it's the same as if we held a reference
f7d3daca7c79d9 Amir Goldstein      2017-06-21  1002  			 * to a dentry in lower layer that was moved under us.
f7d3daca7c79d9 Amir Goldstein      2017-06-21  1003  			 */
dc6fca4068e804 Amir Goldstein      2023-05-25  1004  			err = ovl_check_origin(ofs, upperdentry, &origin_path,
dc6fca4068e804 Amir Goldstein      2023-05-25  1005  					       &xino);
a9d019573e8814 Amir Goldstein      2017-04-30  1006  			if (err)
5455f92b54e516 Vivek Goyal         2017-11-01  1007  				goto out_put_upper;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1008  
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1009  			if (d.metacopy)
6815f479ca90ee Vivek Goyal         2020-06-01  1010  				uppermetacopy = true;
a9d019573e8814 Amir Goldstein      2017-04-30  1011  		}

"xino" not initialized on else path.

02b69b284cd781 Miklos Szeredi      2016-12-16  1012  
02b69b284cd781 Miklos Szeredi      2016-12-16  1013  		if (d.redirect) {
0ce5cdc9d79277 Dan Carpenter       2017-09-22  1014  			err = -ENOMEM;
02b69b284cd781 Miklos Szeredi      2016-12-16  1015  			upperredirect = kstrdup(d.redirect, GFP_KERNEL);
02b69b284cd781 Miklos Szeredi      2016-12-16  1016  			if (!upperredirect)
02b69b284cd781 Miklos Szeredi      2016-12-16  1017  				goto out_put_upper;
02b69b284cd781 Miklos Szeredi      2016-12-16  1018  			if (d.redirect[0] == '/')
c22205d0584bc6 Amir Goldstein      2017-04-26  1019  				poe = roe;
02b69b284cd781 Miklos Szeredi      2016-12-16  1020  		}
e28edc46b8e29d Miklos Szeredi      2016-12-16  1021  		upperopaque = d.opaque;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1022  	}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1023  
a1ac2bc808c50e Amir Goldstein      2023-04-03  1024  	if (!d.stop && ovl_numlower(poe)) {
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1025  		err = -ENOMEM;
e07253481cf7a7 Amir Goldstein      2023-04-03  1026  		stack = ovl_stack_alloc(ofs->numlayer - 1);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1027  		if (!stack)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1028  			goto out_put_upper;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1029  	}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1030  
a1ac2bc808c50e Amir Goldstein      2023-04-03  1031  	for (i = 0; !d.stop && i < ovl_numlower(poe); i++) {
a1ac2bc808c50e Amir Goldstein      2023-04-03  1032  		struct ovl_path lower = ovl_lowerstack(poe)[i];
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1033  
452061fd4521b2 Vivek Goyal         2018-03-09  1034  		if (!ofs->config.redirect_follow)
a1ac2bc808c50e Amir Goldstein      2023-04-03  1035  			d.last = i == ovl_numlower(poe) - 1;
87424be97b2a7d Amir Goldstein      2023-04-27  1036  		else if (d.is_dir || !ofs->numdatalayer)
a1ac2bc808c50e Amir Goldstein      2023-04-03  1037  			d.last = lower.layer->idx == ovl_numlower(roe);
452061fd4521b2 Vivek Goyal         2018-03-09  1038  
dad7017a840d8d Christian Brauner   2022-04-04  1039  		d.mnt = lower.layer->mnt;
1434a65ea625c5 Chengguang Xu       2020-05-26  1040  		err = ovl_lookup_layer(lower.dentry, &d, &this, false);
e28edc46b8e29d Miklos Szeredi      2016-12-16  1041  		if (err)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1042  			goto out_put;
6b2d5fe46fa8f4 Miklos Szeredi      2016-12-16  1043  
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1044  		if (!this)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1045  			continue;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1046  
6815f479ca90ee Vivek Goyal         2020-06-01  1047  		if ((uppermetacopy || d.metacopy) && !ofs->config.metacopy) {
eaab1d45cdb4bb Mickaël Salaün      2021-03-29  1048  			dput(this);
6815f479ca90ee Vivek Goyal         2020-06-01  1049  			err = -EPERM;
6815f479ca90ee Vivek Goyal         2020-06-01  1050  			pr_warn_ratelimited("refusing to follow metacopy origin for (%pd2)\n", dentry);
6815f479ca90ee Vivek Goyal         2020-06-01  1051  			goto out_put;
6815f479ca90ee Vivek Goyal         2020-06-01  1052  		}
6815f479ca90ee Vivek Goyal         2020-06-01  1053  
9678e630305724 Amir Goldstein      2018-01-03  1054  		/*
9678e630305724 Amir Goldstein      2018-01-03  1055  		 * If no origin fh is stored in upper of a merge dir, store fh
9678e630305724 Amir Goldstein      2018-01-03  1056  		 * of lower dir and set upper parent "impure".
9678e630305724 Amir Goldstein      2018-01-03  1057  		 */
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1058  		if (upperdentry && !ctr && !ofs->noxattr && d.is_dir) {
610afc0bd40882 Miklos Szeredi      2020-09-02  1059  			err = ovl_fix_origin(ofs, dentry, this, upperdentry);
9678e630305724 Amir Goldstein      2018-01-03  1060  			if (err) {
9678e630305724 Amir Goldstein      2018-01-03  1061  				dput(this);
9678e630305724 Amir Goldstein      2018-01-03  1062  				goto out_put;
9678e630305724 Amir Goldstein      2018-01-03  1063  			}
9678e630305724 Amir Goldstein      2018-01-03  1064  		}
9678e630305724 Amir Goldstein      2018-01-03  1065  
37b12916c0f802 Amir Goldstein      2018-01-10  1066  		/*
37b12916c0f802 Amir Goldstein      2018-01-10  1067  		 * When "verify_lower" feature is enabled, do not merge with a
ad1d615cec1c97 Amir Goldstein      2018-01-11  1068  		 * lower dir that does not match a stored origin xattr. In any
ad1d615cec1c97 Amir Goldstein      2018-01-11  1069  		 * case, only verified origin is used for index lookup.
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1070  		 *
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1071  		 * For non-dir dentry, if index=on, then ensure origin
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1072  		 * matches the dentry found using path based lookup,
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1073  		 * otherwise error out.
37b12916c0f802 Amir Goldstein      2018-01-10  1074  		 */
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1075  		if (upperdentry && !ctr &&
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1076  		    ((d.is_dir && ovl_verify_lower(dentry->d_sb)) ||
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1077  		     (!d.is_dir && ofs->config.index && origin_path))) {
610afc0bd40882 Miklos Szeredi      2020-09-02  1078  			err = ovl_verify_origin(ofs, upperdentry, this, false);
37b12916c0f802 Amir Goldstein      2018-01-10  1079  			if (err) {
37b12916c0f802 Amir Goldstein      2018-01-10  1080  				dput(this);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1081  				if (d.is_dir)
37b12916c0f802 Amir Goldstein      2018-01-10  1082  					break;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1083  				goto out_put;
37b12916c0f802 Amir Goldstein      2018-01-10  1084  			}
ad1d615cec1c97 Amir Goldstein      2018-01-11  1085  			origin = this;
37b12916c0f802 Amir Goldstein      2018-01-10  1086  		}
37b12916c0f802 Amir Goldstein      2018-01-10  1087  
21d8d66abffb0c Vivek Goyal         2020-06-02  1088  		if (d.metacopy && ctr) {
21d8d66abffb0c Vivek Goyal         2020-06-02  1089  			/*
21d8d66abffb0c Vivek Goyal         2020-06-02  1090  			 * Do not store intermediate metacopy dentries in
21d8d66abffb0c Vivek Goyal         2020-06-02  1091  			 * lower chain, except top most lower metacopy dentry.
21d8d66abffb0c Vivek Goyal         2020-06-02  1092  			 * Continue the loop so that if there is an absolute
21d8d66abffb0c Vivek Goyal         2020-06-02  1093  			 * redirect on this dentry, poe can be reset to roe.
21d8d66abffb0c Vivek Goyal         2020-06-02  1094  			 */
21d8d66abffb0c Vivek Goyal         2020-06-02  1095  			dput(this);
21d8d66abffb0c Vivek Goyal         2020-06-02  1096  			this = NULL;
21d8d66abffb0c Vivek Goyal         2020-06-02  1097  		} else {
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1098  			stack[ctr].dentry = this;
b93436320c1e90 Chandan Rajendra    2017-07-24  1099  			stack[ctr].layer = lower.layer;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1100  			ctr++;
21d8d66abffb0c Vivek Goyal         2020-06-02  1101  		}
02b69b284cd781 Miklos Szeredi      2016-12-16  1102  
438c84c2f0c794 Miklos Szeredi      2017-12-11  1103  		/*
438c84c2f0c794 Miklos Szeredi      2017-12-11  1104  		 * Following redirects can have security consequences: it's like
438c84c2f0c794 Miklos Szeredi      2017-12-11  1105  		 * a symlink into the lower layer without the permission checks.
438c84c2f0c794 Miklos Szeredi      2017-12-11  1106  		 * This is only a problem if the upper layer is untrusted (e.g
438c84c2f0c794 Miklos Szeredi      2017-12-11  1107  		 * comes from an USB drive).  This can allow a non-readable file
438c84c2f0c794 Miklos Szeredi      2017-12-11  1108  		 * or directory to become readable.
438c84c2f0c794 Miklos Szeredi      2017-12-11  1109  		 *
438c84c2f0c794 Miklos Szeredi      2017-12-11  1110  		 * Only following redirects when redirects are enabled disables
438c84c2f0c794 Miklos Szeredi      2017-12-11  1111  		 * this attack vector when not necessary.
438c84c2f0c794 Miklos Szeredi      2017-12-11  1112  		 */
438c84c2f0c794 Miklos Szeredi      2017-12-11  1113  		err = -EPERM;
438c84c2f0c794 Miklos Szeredi      2017-12-11  1114  		if (d.redirect && !ofs->config.redirect_follow) {
1bd0a3aea4357e lijiazi             2019-12-16  1115  			pr_warn_ratelimited("refusing to follow redirect for (%pd2)\n",
f81678173ce25a Amir Goldstein      2017-12-18  1116  					    dentry);
438c84c2f0c794 Miklos Szeredi      2017-12-11  1117  			goto out_put;
438c84c2f0c794 Miklos Szeredi      2017-12-11  1118  		}
438c84c2f0c794 Miklos Szeredi      2017-12-11  1119  
d1fe96c0e4de78 Vivek Goyal         2018-02-02  1120  		if (d.stop)
d1fe96c0e4de78 Vivek Goyal         2018-02-02  1121  			break;
d1fe96c0e4de78 Vivek Goyal         2018-02-02  1122  
c22205d0584bc6 Amir Goldstein      2017-04-26  1123  		if (d.redirect && d.redirect[0] == '/' && poe != roe) {
c22205d0584bc6 Amir Goldstein      2017-04-26  1124  			poe = roe;
02b69b284cd781 Miklos Szeredi      2016-12-16  1125  			/* Find the current layer on the root dentry */
d583ed7d138825 Amir Goldstein      2017-11-08  1126  			i = lower.layer->idx - 1;
02b69b284cd781 Miklos Szeredi      2016-12-16  1127  		}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1128  	}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1129  
098509a162694f Amir Goldstein      2023-04-27  1130  	/* Defer lookup of lowerdata in data-only layers to first access */
87424be97b2a7d Amir Goldstein      2023-04-27  1131  	if (d.metacopy && ctr && ofs->numdatalayer && d.absolute_redirect) {
87424be97b2a7d Amir Goldstein      2023-04-27  1132  		d.metacopy = false;
87424be97b2a7d Amir Goldstein      2023-04-27  1133  		ctr++;
87424be97b2a7d Amir Goldstein      2023-04-27  1134  	}
87424be97b2a7d Amir Goldstein      2023-04-27  1135  
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1136  	/*
6815f479ca90ee Vivek Goyal         2020-06-01  1137  	 * For regular non-metacopy upper dentries, there is no lower
6815f479ca90ee Vivek Goyal         2020-06-01  1138  	 * path based lookup, hence ctr will be zero. If a dentry is found
6815f479ca90ee Vivek Goyal         2020-06-01  1139  	 * using ORIGIN xattr on upper, install it in stack.
6815f479ca90ee Vivek Goyal         2020-06-01  1140  	 *
6815f479ca90ee Vivek Goyal         2020-06-01  1141  	 * For metacopy dentry, path based lookup will find lower dentries.
6815f479ca90ee Vivek Goyal         2020-06-01  1142  	 * Just make sure a corresponding data dentry has been found.
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1143  	 */
6815f479ca90ee Vivek Goyal         2020-06-01  1144  	if (d.metacopy || (uppermetacopy && !ctr)) {
0a8d0b64dd6acf Kevin Locke         2020-08-23  1145  		pr_warn_ratelimited("metacopy with no lower data found - abort lookup (%pd2)\n",
0a8d0b64dd6acf Kevin Locke         2020-08-23  1146  				    dentry);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1147  		err = -EIO;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1148  		goto out_put;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1149  	} else if (!d.is_dir && upperdentry && !ctr && origin_path) {
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1150  		if (WARN_ON(stack != NULL)) {
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1151  			err = -EIO;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1152  			goto out_put;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1153  		}
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1154  		stack = origin_path;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1155  		ctr = 1;
59fb20138a9b52 Vivek Goyal         2020-06-01  1156  		origin = origin_path->dentry;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1157  		origin_path = NULL;
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1158  	}
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1159  
ad1d615cec1c97 Amir Goldstein      2018-01-11  1160  	/*
59fb20138a9b52 Vivek Goyal         2020-06-01  1161  	 * Always lookup index if there is no-upperdentry.
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1162  	 *
59fb20138a9b52 Vivek Goyal         2020-06-01  1163  	 * For the case of upperdentry, we have set origin by now if it
59fb20138a9b52 Vivek Goyal         2020-06-01  1164  	 * needed to be set. There are basically three cases.
59fb20138a9b52 Vivek Goyal         2020-06-01  1165  	 *
59fb20138a9b52 Vivek Goyal         2020-06-01  1166  	 * For directories, lookup index by lower inode and verify it matches
59fb20138a9b52 Vivek Goyal         2020-06-01  1167  	 * upper inode. We only trust dir index if we verified that lower dir
59fb20138a9b52 Vivek Goyal         2020-06-01  1168  	 * matches origin, otherwise dir index entries may be inconsistent
59fb20138a9b52 Vivek Goyal         2020-06-01  1169  	 * and we ignore them.
59fb20138a9b52 Vivek Goyal         2020-06-01  1170  	 *
59fb20138a9b52 Vivek Goyal         2020-06-01  1171  	 * For regular upper, we already set origin if upper had ORIGIN
59fb20138a9b52 Vivek Goyal         2020-06-01  1172  	 * xattr. There is no verification though as there is no path
59fb20138a9b52 Vivek Goyal         2020-06-01  1173  	 * based dentry lookup in lower in this case.
59fb20138a9b52 Vivek Goyal         2020-06-01  1174  	 *
59fb20138a9b52 Vivek Goyal         2020-06-01  1175  	 * For metacopy upper, we set a verified origin already if index
59fb20138a9b52 Vivek Goyal         2020-06-01  1176  	 * is enabled and if upper had an ORIGIN xattr.
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1177  	 *
ad1d615cec1c97 Amir Goldstein      2018-01-11  1178  	 */
59fb20138a9b52 Vivek Goyal         2020-06-01  1179  	if (!upperdentry && ctr)
ad1d615cec1c97 Amir Goldstein      2018-01-11  1180  		origin = stack[0].dentry;
359f392ca53e91 Amir Goldstein      2017-06-21  1181  
ad1d615cec1c97 Amir Goldstein      2018-01-11  1182  	if (origin && ovl_indexdir(dentry->d_sb) &&
ad1d615cec1c97 Amir Goldstein      2018-01-11  1183  	    (!d.is_dir || ovl_index_all(dentry->d_sb))) {
061701540349c3 Amir Goldstein      2018-01-17  1184  		index = ovl_lookup_index(ofs, upperdentry, origin, true);
359f392ca53e91 Amir Goldstein      2017-06-21  1185  		if (IS_ERR(index)) {
359f392ca53e91 Amir Goldstein      2017-06-21  1186  			err = PTR_ERR(index);
359f392ca53e91 Amir Goldstein      2017-06-21  1187  			index = NULL;
359f392ca53e91 Amir Goldstein      2017-06-21  1188  			goto out_put;
359f392ca53e91 Amir Goldstein      2017-06-21  1189  		}
359f392ca53e91 Amir Goldstein      2017-06-21  1190  	}
359f392ca53e91 Amir Goldstein      2017-06-21  1191  
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1192  	oe = ovl_alloc_entry(ctr);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1193  	err = -ENOMEM;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1194  	if (!oe)
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1195  		goto out_put;
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1196  
e07253481cf7a7 Amir Goldstein      2023-04-03  1197  	ovl_stack_cpy(ovl_lowerstack(oe), stack, ctr);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1198  
c62520a83bceae Amir Goldstein      2018-01-14  1199  	if (upperopaque)
c62520a83bceae Amir Goldstein      2018-01-14  1200  		ovl_dentry_set_opaque(dentry);
c62520a83bceae Amir Goldstein      2018-01-14  1201  
55acc6618259c8 Miklos Szeredi      2017-07-04  1202  	if (upperdentry)
55acc6618259c8 Miklos Szeredi      2017-07-04  1203  		ovl_dentry_set_upper_alias(dentry);
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1204  	else if (index) {
dad7017a840d8d Christian Brauner   2022-04-04  1205  		struct path upperpath = {
dad7017a840d8d Christian Brauner   2022-04-04  1206  			.dentry = upperdentry = dget(index),
dad7017a840d8d Christian Brauner   2022-04-04  1207  			.mnt = ovl_upper_mnt(ofs),
dad7017a840d8d Christian Brauner   2022-04-04  1208  		};
dad7017a840d8d Christian Brauner   2022-04-04  1209  
cf4ef7801a8c88 Stanislav Goriainov 2022-08-31  1210  		/*
cf4ef7801a8c88 Stanislav Goriainov 2022-08-31  1211  		 * It's safe to assign upperredirect here: the previous
cf4ef7801a8c88 Stanislav Goriainov 2022-08-31  1212  		 * assignment of happens only if upperdentry is non-NULL, and
cf4ef7801a8c88 Stanislav Goriainov 2022-08-31  1213  		 * this one only if upperdentry is NULL.
cf4ef7801a8c88 Stanislav Goriainov 2022-08-31  1214  		 */
dad7017a840d8d Christian Brauner   2022-04-04  1215  		upperredirect = ovl_get_redirect_xattr(ofs, &upperpath, 0);
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1216  		if (IS_ERR(upperredirect)) {
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1217  			err = PTR_ERR(upperredirect);
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1218  			upperredirect = NULL;
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1219  			goto out_free_oe;
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1220  		}
dad7017a840d8d Christian Brauner   2022-04-04  1221  		err = ovl_check_metacopy_xattr(ofs, &upperpath);
4518dfcf761e3c Amir Goldstein      2020-07-15  1222  		if (err < 0)
4518dfcf761e3c Amir Goldstein      2020-07-15  1223  			goto out_free_oe;
4518dfcf761e3c Amir Goldstein      2020-07-15  1224  		uppermetacopy = err;
0a2d0d3f2f291e Vivek Goyal         2018-05-11  1225  	}
359f392ca53e91 Amir Goldstein      2017-06-21  1226  
e6d2ebddbc5205 Miklos Szeredi      2017-07-04  1227  	if (upperdentry || ctr) {
ac6a52eb65b532 Vivek Goyal         2018-05-08  1228  		struct ovl_inode_params oip = {
ac6a52eb65b532 Vivek Goyal         2018-05-08  1229  			.upperdentry = upperdentry,
70142d99656656 Amir Goldstein      2023-04-08  1230  			.oe = oe,
dc6fca4068e804 Amir Goldstein      2023-05-25 @1231  			.xino = xino,
                                                                        ^^^^^^^^^^^^
Warning.

ac6a52eb65b532 Vivek Goyal         2018-05-08  1232  			.index = index,
9cec54c83a8bab Vivek Goyal         2018-05-11  1233  			.redirect = upperredirect,
ac6a52eb65b532 Vivek Goyal         2018-05-08  1234  		};
ac6a52eb65b532 Vivek Goyal         2018-05-08  1235  
0612dea94ff5bf Amir Goldstein      2023-04-27  1236  		/* Store lowerdata redirect for lazy lookup */
0612dea94ff5bf Amir Goldstein      2023-04-27  1237  		if (ctr > 1 && !d.is_dir && !stack[ctr - 1].dentry) {
0612dea94ff5bf Amir Goldstein      2023-04-27  1238  			oip.lowerdata_redirect = d.redirect;
0612dea94ff5bf Amir Goldstein      2023-04-27  1239  			d.redirect = NULL;
0612dea94ff5bf Amir Goldstein      2023-04-27  1240  		}
ac6a52eb65b532 Vivek Goyal         2018-05-08  1241  		inode = ovl_get_inode(dentry->d_sb, &oip);
b9ac5c274b8c9d Miklos Szeredi      2017-07-04  1242  		err = PTR_ERR(inode);
b9ac5c274b8c9d Miklos Szeredi      2017-07-04  1243  		if (IS_ERR(inode))
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1244  			goto out_free_oe;
28166ab3c875b8 Vivek Goyal         2020-06-01  1245  		if (upperdentry && !uppermetacopy)
28166ab3c875b8 Vivek Goyal         2020-06-01  1246  			ovl_set_flag(OVL_UPPERDATA, inode);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1247  	}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1248  
70142d99656656 Amir Goldstein      2023-04-08  1249  	ovl_dentry_init_reval(dentry, upperdentry, OVL_I_E(inode));
f4288844561922 Miklos Szeredi      2020-03-17  1250  
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1251  	revert_creds(old_cred);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1252  	if (origin_path) {
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1253  		dput(origin_path->dentry);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1254  		kfree(origin_path);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1255  	}
359f392ca53e91 Amir Goldstein      2017-06-21  1256  	dput(index);
e07253481cf7a7 Amir Goldstein      2023-04-03  1257  	ovl_stack_free(stack, ctr);
02b69b284cd781 Miklos Szeredi      2016-12-16  1258  	kfree(d.redirect);
829c28be9bb9a0 Amir Goldstein      2017-09-29  1259  	return d_splice_alias(inode, dentry);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1260  
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1261  out_free_oe:
e07253481cf7a7 Amir Goldstein      2023-04-03  1262  	ovl_free_entry(oe);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1263  out_put:
359f392ca53e91 Amir Goldstein      2017-06-21  1264  	dput(index);
e07253481cf7a7 Amir Goldstein      2023-04-03  1265  	ovl_stack_free(stack, ctr);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1266  out_put_upper:
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1267  	if (origin_path) {
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1268  		dput(origin_path->dentry);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1269  		kfree(origin_path);
9d3dfea3d35a32 Vivek Goyal         2018-05-11  1270  	}
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1271  	dput(upperdentry);
02b69b284cd781 Miklos Szeredi      2016-12-16  1272  	kfree(upperredirect);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1273  out:
02b69b284cd781 Miklos Szeredi      2016-12-16  1274  	kfree(d.redirect);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1275  	revert_creds(old_cred);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1276  	return ERR_PTR(err);
bbb1e54dd53cf8 Miklos Szeredi      2016-12-16  1277  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

