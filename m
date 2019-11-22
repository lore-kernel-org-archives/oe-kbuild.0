Content-Type: multipart/mixed; boundary="===============4927148136386709626=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 25/27] NFS: Add fs_context support.
Date: Fri, 22 Nov 2019 11:22:25 +0300
Message-ID: <20191122082225.GG617@kadam>
In-Reply-To: <20191120152750.6880-26-smayhew@redhat.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4927148136386709626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Scott,

url:    https://github.com/0day-ci/linux/commits/Scott-Mayhew/nfs-Mount-API=
-conversion/20191121-164447
base:    af42d3466bdc8f39806b26f593604fdc54140bcb

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/nfs/nfs4namespace.c:147 nfs4_validate_fspath() error: uninitialized symb=
ol 'len'.
fs/nfs/nfs4namespace.c:149 nfs4_validate_fspath() error: 'fs_path' derefere=
ncing possible ERR_PTR()

# https://github.com/0day-ci/linux/commit/deebb47534c8b45696a02a0d8aff35b23=
2b24e15
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout deebb47534c8b45696a02a0d8aff35b232b24e15
vim +/len +147 fs/nfs/nfs4namespace.c

b514f872f86d4b Al Viro       2011-03-16  129  static int nfs4_validate_fspa=
th(struct dentry *dentry,
54ceac45159860 David Howells 2006-08-22  130  				const struct nfs4_fs_loca=
tions *locations,
deebb47534c8b4 David Howells 2019-11-20  131  				struct nfs_fs_context *ct=
x)
54ceac45159860 David Howells 2006-08-22  132  {
54ceac45159860 David Howells 2006-08-22  133  	const char *path, *fs_path;
deebb47534c8b4 David Howells 2019-11-20  134  	char *buf;
deebb47534c8b4 David Howells 2019-11-20  135  	unsigned short len;
deebb47534c8b4 David Howells 2019-11-20  136  	int n;
54ceac45159860 David Howells 2006-08-22  137  =

deebb47534c8b4 David Howells 2019-11-20  138  	buf =3D kmalloc(4096, GFP_KE=
RNEL);
deebb47534c8b4 David Howells 2019-11-20  139  	path =3D nfs4_path(dentry, b=
uf, 4096);
deebb47534c8b4 David Howells 2019-11-20  140  	if (IS_ERR(path)) {
deebb47534c8b4 David Howells 2019-11-20  141  		kfree(buf);
54ceac45159860 David Howells 2006-08-22  142  		return PTR_ERR(path);
deebb47534c8b4 David Howells 2019-11-20  143  	}
54ceac45159860 David Howells 2006-08-22  144  =

deebb47534c8b4 David Howells 2019-11-20  145  	fs_path =3D nfs4_pathname_st=
ring(&locations->fs_path, &len);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
Both warnings are because Smatch thinks nfs4_pathname_string() can
return an error pointer without initializing "len".

54ceac45159860 David Howells 2006-08-22  146  =

deebb47534c8b4 David Howells 2019-11-20 @147  	n =3D strncmp(path, fs_path,=
 len);
deebb47534c8b4 David Howells 2019-11-20  148  	kfree(buf);
deebb47534c8b4 David Howells 2019-11-20 @149  	kfree(fs_path);
deebb47534c8b4 David Howells 2019-11-20  150  	if (n !=3D 0) {
54ceac45159860 David Howells 2006-08-22  151  		dprintk("%s: path %s does n=
ot begin with fsroot %s\n",
deebb47534c8b4 David Howells 2019-11-20  152  			__func__, path, ctx->nfs_s=
erver.export_path);
54ceac45159860 David Howells 2006-08-22  153  		return -ENOENT;
54ceac45159860 David Howells 2006-08-22  154  	}
54ceac45159860 David Howells 2006-08-22  155  =

54ceac45159860 David Howells 2006-08-22  156  	return 0;
54ceac45159860 David Howells 2006-08-22  157  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4927148136386709626==--

