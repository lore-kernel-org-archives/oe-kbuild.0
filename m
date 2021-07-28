Content-Type: multipart/mixed; boundary="===============4041862052775477232=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/11] nfsd: Allow filehandle lookup to cross internal mount points.
Date: Thu, 29 Jul 2021 06:12:37 +0800
Message-ID: <202107290602.l4RAc3We-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4041862052775477232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <162742546556.32498.16708762469227881912.stgit@noble.brown>
References: <162742546556.32498.16708762469227881912.stgit@noble.brown>
TO: NeilBrown <neilb@suse.de>
TO: Christoph Hellwig <hch@infradead.org>
TO: Josef Bacik <josef@toxicpanda.com>
TO: "J. Bruce Fields" <bfields@fieldses.org>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Chris Mason <chris.mason@fusionio.com>
TO: David Sterba <dsterba@suse.com>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-nfs(a)vger.kernel.org
CC: linux-btrfs(a)vger.kernel.org

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on nfsd/nfsd-next]
[also build test WARNING on kdave/for-next hch-configfs/for-next linus/mast=
er v5.14-rc3 next-20210727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/expose-btrfs-sub=
vols-in-mount-table-correctly/20210728-064502
base:   git://linux-nfs.org/~bfields/linux.git nfsd-next
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: mips-randconfig-m031-20210728 (attached as .config)
compiler: mips-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nfsd/nfs4xdr.c:3032 nfsd4_encode_fattr() error: uninitialized symbol 'su=
b_fsid'.
fs/nfsd/nfs4xdr.c:3281 nfsd4_encode_fattr() error: uninitialized symbol 'mo=
unted_on_ino'.

Old smatch warnings:
fs/nfsd/nfs4xdr.c:3319 nfsd4_encode_fattr() error: uninitialized symbol 'co=
ntextlen'.
fs/nfsd/nfs4xdr.c:4803 nfsd4_encode_read_plus_hole() warn: inconsistent ind=
enting

vim +/sub_fsid +3032 fs/nfsd/nfs4xdr.c

18032ca062e621e David Quigley       2013-05-02  2922  =

75976de6556f593 Kinglong Mee        2015-07-30  2923  	status =3D nfsd4_enc=
ode_bitmap(xdr, bmval0, bmval1, bmval2);
75976de6556f593 Kinglong Mee        2015-07-30  2924  	if (status)
75976de6556f593 Kinglong Mee        2015-07-30  2925  		goto out;
082d4bd72a4527c J. Bruce Fields     2013-08-29  2926  =

082d4bd72a4527c J. Bruce Fields     2013-08-29  2927  	attrlen_offset =3D x=
dr->buf->len;
ddd1ea56367202f J. Bruce Fields     2013-08-27  2928  	p =3D xdr_reserve_sp=
ace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2929  	if (!p)
ddd1ea56367202f J. Bruce Fields     2013-08-27  2930  		goto out_resource;
082d4bd72a4527c J. Bruce Fields     2013-08-29  2931  	p++;                =
/* to be backfilled later */
^1da177e4c3f415 Linus Torvalds      2005-04-16  2932  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  2933  	if (bmval0 & FATTR4_=
WORD0_SUPPORTED_ATTRS) {
dcd208697707b12 J. Bruce Fields     2017-01-11  2934  		u32 supp[3];
dcd208697707b12 J. Bruce Fields     2017-01-11  2935  =

dcd208697707b12 J. Bruce Fields     2017-01-11  2936  		memcpy(supp, nfsd_s=
uppattrs[minorversion], sizeof(supp));
7e7057064782734 Andy Adamson        2009-04-03  2937  =

0c9d65e76a19ad7 Andreas Gruenbacher 2015-04-24  2938  		if (!IS_POSIXACL(de=
ntry->d_inode))
916d2d844afd09d J. Bruce Fields     2016-10-18  2939  			supp[0] &=3D ~FATT=
R4_WORD0_ACL;
18032ca062e621e David Quigley       2013-05-02  2940  		if (!contextsupport)
916d2d844afd09d J. Bruce Fields     2016-10-18  2941  			supp[2] &=3D ~FATT=
R4_WORD2_SECURITY_LABEL;
916d2d844afd09d J. Bruce Fields     2016-10-18  2942  		if (!supp[2]) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2943  			p =3D xdr_reserve_=
space(xdr, 12);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2944  			if (!p)
2b44f1ba4091477 Benny Halevy        2010-09-30  2945  				goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2946  			*p++ =3D cpu_to_be=
32(2);
916d2d844afd09d J. Bruce Fields     2016-10-18  2947  			*p++ =3D cpu_to_be=
32(supp[0]);
916d2d844afd09d J. Bruce Fields     2016-10-18  2948  			*p++ =3D cpu_to_be=
32(supp[1]);
7e7057064782734 Andy Adamson        2009-04-03  2949  		} else {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2950  			p =3D xdr_reserve_=
space(xdr, 16);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2951  			if (!p)
2b44f1ba4091477 Benny Halevy        2010-09-30  2952  				goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2953  			*p++ =3D cpu_to_be=
32(3);
916d2d844afd09d J. Bruce Fields     2016-10-18  2954  			*p++ =3D cpu_to_be=
32(supp[0]);
916d2d844afd09d J. Bruce Fields     2016-10-18  2955  			*p++ =3D cpu_to_be=
32(supp[1]);
916d2d844afd09d J. Bruce Fields     2016-10-18  2956  			*p++ =3D cpu_to_be=
32(supp[2]);
7e7057064782734 Andy Adamson        2009-04-03  2957  		}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2958  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2959  	if (bmval0 & FATTR4_=
WORD0_TYPE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2960  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2961  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  2962  			goto out_resource;
3d2544b1e4909b6 J. Bruce Fields     2011-08-15  2963  		dummy =3D nfs4_file=
_type(stat.mode);
6b6d8137f1d3fc7 J. Bruce Fields     2013-01-16  2964  		if (dummy =3D=3D NF=
4BAD) {
6b6d8137f1d3fc7 J. Bruce Fields     2013-01-16  2965  			status =3D nfserr_=
serverfault;
6b6d8137f1d3fc7 J. Bruce Fields     2013-01-16  2966  			goto out;
6b6d8137f1d3fc7 J. Bruce Fields     2013-01-16  2967  		}
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2968  		*p++ =3D cpu_to_be3=
2(dummy);
^1da177e4c3f415 Linus Torvalds      2005-04-16  2969  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2970  	if (bmval0 & FATTR4_=
WORD0_FH_EXPIRE_TYPE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2971  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2972  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  2973  			goto out_resource;
496400014f22c4d NeilBrown           2005-06-23  2974  		if (exp->ex_flags &=
 NFSEXP_NOSUBTREECHECK)
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2975  			*p++ =3D cpu_to_be=
32(NFS4_FH_PERSISTENT);
496400014f22c4d NeilBrown           2005-06-23  2976  		else
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2977  			*p++ =3D cpu_to_be=
32(NFS4_FH_PERSISTENT|
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2978  						NFS4_FH_VOL_REN=
AME);
^1da177e4c3f415 Linus Torvalds      2005-04-16  2979  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2980  	if (bmval0 & FATTR4_=
WORD0_CHANGE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2981  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2982  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  2983  			goto out_resource;
b880092109323d1 NeilBrown           2017-01-30  2984  		p =3D encode_change=
(p, &stat, d_inode(dentry), exp);
^1da177e4c3f415 Linus Torvalds      2005-04-16  2985  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2986  	if (bmval0 & FATTR4_=
WORD0_SIZE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2987  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2988  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  2989  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  2990  		p =3D xdr_encode_hy=
per(p, stat.size);
^1da177e4c3f415 Linus Torvalds      2005-04-16  2991  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2992  	if (bmval0 & FATTR4_=
WORD0_LINK_SUPPORT) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2993  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  2994  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  2995  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  2996  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  2997  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  2998  	if (bmval0 & FATTR4_=
WORD0_SYMLINK_SUPPORT) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  2999  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3000  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3001  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3002  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3003  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3004  	if (bmval0 & FATTR4_=
WORD0_NAMED_ATTR) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3005  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3006  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3007  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3008  		*p++ =3D cpu_to_be3=
2(0);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3009  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3010  	if (bmval0 & FATTR4_=
WORD0_FSID) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3011  		p =3D xdr_reserve_s=
pace(xdr, 16);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3012  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3013  			goto out_resource;
42ca09938157105 J.Bruce Fields      2006-10-04  3014  		if (exp->ex_fslocs.=
migrated) {
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3015  			p =3D xdr_encode_h=
yper(p, NFS4_REFERRAL_FSID_MAJOR);
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3016  			p =3D xdr_encode_h=
yper(p, NFS4_REFERRAL_FSID_MINOR);
af6a4e280e3ff45 NeilBrown           2007-02-14  3017  		} else switch(fsid_=
source(fhp)) {
af6a4e280e3ff45 NeilBrown           2007-02-14  3018  		case FSIDSOURCE_FSI=
D:
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3019  			p =3D xdr_encode_h=
yper(p, (u64)exp->ex_fsid);
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3020  			p =3D xdr_encode_h=
yper(p, (u64)0);
af6a4e280e3ff45 NeilBrown           2007-02-14  3021  			break;
af6a4e280e3ff45 NeilBrown           2007-02-14  3022  		case FSIDSOURCE_DEV:
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3023  			*p++ =3D cpu_to_be=
32(0);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3024  			*p++ =3D cpu_to_be=
32(MAJOR(stat.dev));
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3025  			*p++ =3D cpu_to_be=
32(0);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3026  			*p++ =3D cpu_to_be=
32(MINOR(stat.dev));
af6a4e280e3ff45 NeilBrown           2007-02-14  3027  			break;
af6a4e280e3ff45 NeilBrown           2007-02-14  3028  		case FSIDSOURCE_UUI=
D:
94eb36892d72714 Kinglong Mee        2014-05-23  3029  			p =3D xdr_encode_o=
paque_fixed(p, exp->ex_uuid,
94eb36892d72714 Kinglong Mee        2014-05-23  3030  								EX_UUID_LEN);
5caed3f714c903d NeilBrown           2021-07-28  3031  			if (mnt !=3D exp->=
ex_path.mnt)
5caed3f714c903d NeilBrown           2021-07-28 @3032  				*(u64*)(p-2) ^=3D=
 sub_fsid;
af6a4e280e3ff45 NeilBrown           2007-02-14  3033  			break;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3034  		}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3035  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3036  	if (bmval0 & FATTR4_=
WORD0_UNIQUE_HANDLES) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3037  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3038  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3039  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3040  		*p++ =3D cpu_to_be3=
2(0);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3041  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3042  	if (bmval0 & FATTR4_=
WORD0_LEASE_TIME) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3043  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3044  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3045  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3046  		*p++ =3D cpu_to_be3=
2(nn->nfsd4_lease);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3047  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3048  	if (bmval0 & FATTR4_=
WORD0_RDATTR_ERROR) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3049  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3050  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3051  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3052  		*p++ =3D cpu_to_be3=
2(rdattr_err);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3053  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3054  	if (bmval0 & FATTR4_=
WORD0_ACL) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  3055  		struct nfs4_ace *ac=
e;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3056  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  3057  		if (acl =3D=3D NULL=
) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3058  			p =3D xdr_reserve_=
space(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3059  			if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3060  				goto out_resource;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3061  =

c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3062  			*p++ =3D cpu_to_be=
32(0);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3063  			goto out_acl;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3064  		}
ddd1ea56367202f J. Bruce Fields     2013-08-27  3065  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3066  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3067  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3068  		*p++ =3D cpu_to_be3=
2(acl->naces);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3069  =

28e05dd8457c7a7 J. Bruce Fields     2007-02-16  3070  		for (ace =3D acl->a=
ces; ace < acl->aces + acl->naces; ace++) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3071  			p =3D xdr_reserve_=
space(xdr, 4*3);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3072  			if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3073  				goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3074  			*p++ =3D cpu_to_be=
32(ace->type);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3075  			*p++ =3D cpu_to_be=
32(ace->flag);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3076  			*p++ =3D cpu_to_be=
32(ace->access_mask &
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3077  							NFS4_ACE_MASK_=
ALL);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3078  			status =3D nfsd4_e=
ncode_aclname(xdr, rqstp, ace);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3079  			if (status)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3080  				goto out;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3081  		}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3082  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3083  out_acl:
^1da177e4c3f415 Linus Torvalds      2005-04-16  3084  	if (bmval0 & FATTR4_=
WORD0_ACLSUPPORT) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3085  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3086  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3087  			goto out_resource;
0c9d65e76a19ad7 Andreas Gruenbacher 2015-04-24  3088  		*p++ =3D cpu_to_be3=
2(IS_POSIXACL(dentry->d_inode) ?
^1da177e4c3f415 Linus Torvalds      2005-04-16  3089  			ACL4_SUPPORT_ALLOW=
_ACL|ACL4_SUPPORT_DENY_ACL : 0);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3090  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3091  	if (bmval0 & FATTR4_=
WORD0_CANSETTIME) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3092  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3093  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3094  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3095  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3096  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3097  	if (bmval0 & FATTR4_=
WORD0_CASE_INSENSITIVE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3098  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3099  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3100  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3101  		*p++ =3D cpu_to_be3=
2(0);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3102  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3103  	if (bmval0 & FATTR4_=
WORD0_CASE_PRESERVING) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3104  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3105  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3106  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3107  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3108  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3109  	if (bmval0 & FATTR4_=
WORD0_CHOWN_RESTRICTED) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3110  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3111  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3112  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3113  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3114  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3115  	if (bmval0 & FATTR4_=
WORD0_FILEHANDLE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3116  		p =3D xdr_reserve_s=
pace(xdr, fhp->fh_handle.fh_size + 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3117  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3118  			goto out_resource;
0c0c267ba96f606 J. Bruce Fields     2014-03-22  3119  		p =3D xdr_encode_op=
aque(p, &fhp->fh_handle.fh_base,
0c0c267ba96f606 J. Bruce Fields     2014-03-22  3120  					fhp->fh_handle.f=
h_size);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3121  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3122  	if (bmval0 & FATTR4_=
WORD0_FILEID) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3123  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3124  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3125  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3126  		p =3D xdr_encode_hy=
per(p, stat.ino);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3127  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3128  	if (bmval0 & FATTR4_=
WORD0_FILES_AVAIL) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3129  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3130  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3131  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3132  		p =3D xdr_encode_hy=
per(p, (u64) statfs.f_ffree);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3133  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3134  	if (bmval0 & FATTR4_=
WORD0_FILES_FREE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3135  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3136  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3137  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3138  		p =3D xdr_encode_hy=
per(p, (u64) statfs.f_ffree);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3139  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3140  	if (bmval0 & FATTR4_=
WORD0_FILES_TOTAL) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3141  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3142  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3143  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3144  		p =3D xdr_encode_hy=
per(p, (u64) statfs.f_files);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3145  	}
81c3f4130202a1d J.Bruce Fields      2006-10-04  3146  	if (bmval0 & FATTR4_=
WORD0_FS_LOCATIONS) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3147  		status =3D nfsd4_en=
code_fs_locations(xdr, rqstp, exp);
81c3f4130202a1d J.Bruce Fields      2006-10-04  3148  		if (status)
81c3f4130202a1d J.Bruce Fields      2006-10-04  3149  			goto out;
81c3f4130202a1d J.Bruce Fields      2006-10-04  3150  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3151  	if (bmval0 & FATTR4_=
WORD0_HOMOGENEOUS) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3152  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3153  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3154  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3155  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3156  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3157  	if (bmval0 & FATTR4_=
WORD0_MAXFILESIZE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3158  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3159  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3160  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3161  		p =3D xdr_encode_hy=
per(p, exp->ex_path.mnt->mnt_sb->s_maxbytes);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3162  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3163  	if (bmval0 & FATTR4_=
WORD0_MAXLINK) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3164  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3165  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3166  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3167  		*p++ =3D cpu_to_be3=
2(255);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3168  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3169  	if (bmval0 & FATTR4_=
WORD0_MAXNAME) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3170  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3171  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3172  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3173  		*p++ =3D cpu_to_be3=
2(statfs.f_namelen);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3174  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3175  	if (bmval0 & FATTR4_=
WORD0_MAXREAD) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3176  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3177  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3178  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3179  		p =3D xdr_encode_hy=
per(p, (u64) svc_max_payload(rqstp));
^1da177e4c3f415 Linus Torvalds      2005-04-16  3180  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3181  	if (bmval0 & FATTR4_=
WORD0_MAXWRITE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3182  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3183  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3184  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3185  		p =3D xdr_encode_hy=
per(p, (u64) svc_max_payload(rqstp));
^1da177e4c3f415 Linus Torvalds      2005-04-16  3186  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3187  	if (bmval1 & FATTR4_=
WORD1_MODE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3188  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3189  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3190  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3191  		*p++ =3D cpu_to_be3=
2(stat.mode & S_IALLUGO);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3192  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3193  	if (bmval1 & FATTR4_=
WORD1_NO_TRUNC) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3194  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3195  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3196  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3197  		*p++ =3D cpu_to_be3=
2(1);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3198  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3199  	if (bmval1 & FATTR4_=
WORD1_NUMLINKS) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3200  		p =3D xdr_reserve_s=
pace(xdr, 4);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3201  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3202  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3203  		*p++ =3D cpu_to_be3=
2(stat.nlink);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3204  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3205  	if (bmval1 & FATTR4_=
WORD1_OWNER) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3206  		status =3D nfsd4_en=
code_user(xdr, rqstp, stat.uid);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3207  		if (status)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3208  			goto out;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3209  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3210  	if (bmval1 & FATTR4_=
WORD1_OWNER_GROUP) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3211  		status =3D nfsd4_en=
code_group(xdr, rqstp, stat.gid);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3212  		if (status)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3213  			goto out;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3214  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3215  	if (bmval1 & FATTR4_=
WORD1_RAWDEV) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3216  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3217  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3218  			goto out_resource;
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3219  		*p++ =3D cpu_to_be3=
2((u32) MAJOR(stat.rdev));
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3220  		*p++ =3D cpu_to_be3=
2((u32) MINOR(stat.rdev));
^1da177e4c3f415 Linus Torvalds      2005-04-16  3221  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3222  	if (bmval1 & FATTR4_=
WORD1_SPACE_AVAIL) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3223  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3224  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3225  			goto out_resource;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3226  		dummy64 =3D (u64)st=
atfs.f_bavail * (u64)statfs.f_bsize;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3227  		p =3D xdr_encode_hy=
per(p, dummy64);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3228  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3229  	if (bmval1 & FATTR4_=
WORD1_SPACE_FREE) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3230  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3231  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3232  			goto out_resource;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3233  		dummy64 =3D (u64)st=
atfs.f_bfree * (u64)statfs.f_bsize;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3234  		p =3D xdr_encode_hy=
per(p, dummy64);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3235  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3236  	if (bmval1 & FATTR4_=
WORD1_SPACE_TOTAL) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3237  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3238  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3239  			goto out_resource;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3240  		dummy64 =3D (u64)st=
atfs.f_blocks * (u64)statfs.f_bsize;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3241  		p =3D xdr_encode_hy=
per(p, dummy64);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3242  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3243  	if (bmval1 & FATTR4_=
WORD1_SPACE_USED) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3244  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3245  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3246  			goto out_resource;
^1da177e4c3f415 Linus Torvalds      2005-04-16  3247  		dummy64 =3D (u64)st=
at.blocks << 9;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3248  		p =3D xdr_encode_hy=
per(p, dummy64);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3249  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3250  	if (bmval1 & FATTR4_=
WORD1_TIME_ACCESS) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3251  		p =3D xdr_reserve_s=
pace(xdr, 12);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3252  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3253  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3254  		p =3D xdr_encode_hy=
per(p, (s64)stat.atime.tv_sec);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3255  		*p++ =3D cpu_to_be3=
2(stat.atime.tv_nsec);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3256  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3257  	if (bmval1 & FATTR4_=
WORD1_TIME_DELTA) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3258  		p =3D xdr_reserve_s=
pace(xdr, 12);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3259  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3260  			goto out_resource;
16945141c3567bb J. Bruce Fields     2018-04-25  3261  		p =3D encode_time_d=
elta(p, d_inode(dentry));
^1da177e4c3f415 Linus Torvalds      2005-04-16  3262  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3263  	if (bmval1 & FATTR4_=
WORD1_TIME_METADATA) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3264  		p =3D xdr_reserve_s=
pace(xdr, 12);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3265  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3266  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3267  		p =3D xdr_encode_hy=
per(p, (s64)stat.ctime.tv_sec);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3268  		*p++ =3D cpu_to_be3=
2(stat.ctime.tv_nsec);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3269  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3270  	if (bmval1 & FATTR4_=
WORD1_TIME_MODIFY) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3271  		p =3D xdr_reserve_s=
pace(xdr, 12);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3272  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3273  			goto out_resource;
b64c7f3bdfbb468 J. Bruce Fields     2014-03-22  3274  		p =3D xdr_encode_hy=
per(p, (s64)stat.mtime.tv_sec);
c373b0a4289ebf1 J. Bruce Fields     2014-03-22  3275  		*p++ =3D cpu_to_be3=
2(stat.mtime.tv_nsec);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3276  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  3277  	if (bmval1 & FATTR4_=
WORD1_MOUNTED_ON_FILEID) {
ddd1ea56367202f J. Bruce Fields     2013-08-27  3278  		p =3D xdr_reserve_s=
pace(xdr, 8);
ddd1ea56367202f J. Bruce Fields     2013-08-27  3279  		if (!p)
^1da177e4c3f415 Linus Torvalds      2005-04-16  3280  			goto out_resource;
5caed3f714c903d NeilBrown           2021-07-28  3281  		p =3D xdr_encode_hy=
per(p, mounted_on_ino);
^1da177e4c3f415 Linus Torvalds      2005-04-16  3282  	}
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3283  #ifdef CONFIG_NFSD_PN=
FS
6896f15aabde505 Kinglong Mee        2015-07-30  3284  	if (bmval1 & FATTR4_=
WORD1_FS_LAYOUT_TYPES) {
8a4c3926889e7bf Jeff Layton         2016-07-10  3285  		status =3D nfsd4_en=
code_layout_types(xdr, exp->ex_layout_types);
6896f15aabde505 Kinglong Mee        2015-07-30  3286  		if (status)
6896f15aabde505 Kinglong Mee        2015-07-30  3287  			goto out;
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3288  	}
6896f15aabde505 Kinglong Mee        2015-07-30  3289  =

6896f15aabde505 Kinglong Mee        2015-07-30  3290  	if (bmval2 & FATTR4_=
WORD2_LAYOUT_TYPES) {
8a4c3926889e7bf Jeff Layton         2016-07-10  3291  		status =3D nfsd4_en=
code_layout_types(xdr, exp->ex_layout_types);
6896f15aabde505 Kinglong Mee        2015-07-30  3292  		if (status)
6896f15aabde505 Kinglong Mee        2015-07-30  3293  			goto out;
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3294  	}
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3295  =

9cf514ccfacb301 Christoph Hellwig   2014-05-05  3296  	if (bmval2 & FATTR4_=
WORD2_LAYOUT_BLKSIZE) {
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3297  		p =3D xdr_reserve_s=
pace(xdr, 4);
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3298  		if (!p)
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3299  			goto out_resource;
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3300  		*p++ =3D cpu_to_be3=
2(stat.blksize);
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3301  	}
9cf514ccfacb301 Christoph Hellwig   2014-05-05  3302  #endif /* CONFIG_NFSD=
_PNFS */
8c18f2052e756e7 Benny Halevy        2009-04-03  3303  	if (bmval2 & FATTR4_=
WORD2_SUPPATTR_EXCLCREAT) {
b26b78cb7260075 Trond Myklebust     2017-05-09  3304  		u32 supp[3];
b26b78cb7260075 Trond Myklebust     2017-05-09  3305  =

b26b78cb7260075 Trond Myklebust     2017-05-09  3306  		memcpy(supp, nfsd_s=
uppattrs[minorversion], sizeof(supp));
b26b78cb7260075 Trond Myklebust     2017-05-09  3307  		supp[0] &=3D NFSD_S=
UPPATTR_EXCLCREAT_WORD0;
b26b78cb7260075 Trond Myklebust     2017-05-09  3308  		supp[1] &=3D NFSD_S=
UPPATTR_EXCLCREAT_WORD1;
b26b78cb7260075 Trond Myklebust     2017-05-09  3309  		supp[2] &=3D NFSD_S=
UPPATTR_EXCLCREAT_WORD2;
b26b78cb7260075 Trond Myklebust     2017-05-09  3310  =

b26b78cb7260075 Trond Myklebust     2017-05-09  3311  		status =3D nfsd4_en=
code_bitmap(xdr, supp[0], supp[1], supp[2]);
75976de6556f593 Kinglong Mee        2015-07-30  3312  		if (status)
75976de6556f593 Kinglong Mee        2015-07-30  3313  			goto out;
8c18f2052e756e7 Benny Halevy        2009-04-03  3314  	}
7e7057064782734 Andy Adamson        2009-04-03  3315  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4041862052775477232==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
mojAD5i9T3/eZQIA
--===============4041862052775477232==--

