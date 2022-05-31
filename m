Content-Type: multipart/mixed; boundary="===============9059945263927801450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] cifs: fix potential double free during failed mount
Date: Wed, 01 Jun 2022 00:15:08 +0800
Message-ID: <202206010002.h5WsjBSv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9059945263927801450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220531030117.403302-1-lsahlber@redhat.com>
References: <20220531030117.403302-1-lsahlber@redhat.com>
TO: Ronnie Sahlberg <lsahlber@redhat.com>

Hi Ronnie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on v5.18 next-20220531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronnie-Sahlberg/cifs=
-fix-potential-double-free-during-failed-mount/20220531-110333
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20601/202206010002.h5WsjBSv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/cifsfs.c:943 cifs_smb3_do_mount() warn: possible memory leak of 'ci=
fs_sb'

vim +/cifs_sb +943 fs/cifs/cifsfs.c

ee01a14d9ddcf3 Al Viro         2011-06-17  835  =

24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  836  struct dentry *
c7c137b931b689 Steve French    2018-06-06  837  cifs_smb3_do_mount(struct f=
ile_system_type *fs_type,
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  838  	      int flags, struct sm=
b3_fs_context *old_ctx)
^1da177e4c3f41 Linus Torvalds  2005-04-16  839  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  840  	int rc;
cd7b7bbd4355bf Ronnie Sahlberg 2022-05-31  841  	struct super_block *sb =3D=
 NULL;
d17abdf7566566 Ronnie Sahlberg 2020-11-10  842  	struct cifs_sb_info *cifs_=
sb =3D NULL;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  843  	struct cifs_mnt_data mnt_d=
ata;
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  844  	struct dentry *root;
^1da177e4c3f41 Linus Torvalds  2005-04-16  845  =

8c1beb9801293b Steve French    2018-10-07  846  	/*
8c1beb9801293b Steve French    2018-10-07  847  	 * Prints in Kernel / CIFS=
 log the attempted mount operation
8c1beb9801293b Steve French    2018-10-07  848  	 *	If CIFS_DEBUG && cifs_F=
YI
8c1beb9801293b Steve French    2018-10-07  849  	 */
f80eaedd6c5978 Rodrigo Freire  2018-10-07  850  	if (cifsFYI)
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  851  		cifs_dbg(FYI, "Devname: %=
s flags: %d\n", old_ctx->UNC, flags);
f80eaedd6c5978 Rodrigo Freire  2018-10-07  852  	else
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  853  		cifs_info("Attempting to =
mount %s\n", old_ctx->UNC);
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  854  =

d17abdf7566566 Ronnie Sahlberg 2020-11-10  855  	cifs_sb =3D kzalloc(sizeof=
(struct cifs_sb_info), GFP_KERNEL);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  856  	if (cifs_sb =3D=3D NULL) {
d17abdf7566566 Ronnie Sahlberg 2020-11-10  857  		root =3D ERR_PTR(-ENOMEM);
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  858  		goto out;
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  859  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  860  =

d17abdf7566566 Ronnie Sahlberg 2020-11-10  861  	cifs_sb->ctx =3D kzalloc(s=
izeof(struct smb3_fs_context), GFP_KERNEL);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  862  	if (!cifs_sb->ctx) {
d17abdf7566566 Ronnie Sahlberg 2020-11-10  863  		root =3D ERR_PTR(-ENOMEM);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  864  		goto out;
d17abdf7566566 Ronnie Sahlberg 2020-11-10  865  	}
d17abdf7566566 Ronnie Sahlberg 2020-11-10  866  	rc =3D smb3_fs_context_dup=
(cifs_sb->ctx, old_ctx);
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  867  	if (rc) {
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  868  		root =3D ERR_PTR(rc);
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  869  		goto out;
24e0a1eff9e2b9 Ronnie Sahlberg 2020-12-10  870  	}
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  871  =

5c1acf3fe05ce4 Paulo Alcantara 2021-05-03  872  	rc =3D cifs_setup_volume_i=
nfo(cifs_sb->ctx, NULL, NULL);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  873  	if (rc) {
d17abdf7566566 Ronnie Sahlberg 2020-11-10  874  		root =3D ERR_PTR(rc);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  875  		goto out;
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  876  	}
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  877  =

51acd208bd57c8 Ronnie Sahlberg 2020-12-14  878  	rc =3D cifs_setup_cifs_sb(=
cifs_sb);
4214ebf4654798 Sachin Prabhu   2016-07-29  879  	if (rc) {
4214ebf4654798 Sachin Prabhu   2016-07-29  880  		root =3D ERR_PTR(rc);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  881  		goto out;
a6b5058fafdf50 Aurelien Aptel  2016-05-25  882  	}
a6b5058fafdf50 Aurelien Aptel  2016-05-25  883  =

d17abdf7566566 Ronnie Sahlberg 2020-11-10  884  	rc =3D cifs_mount(cifs_sb,=
 cifs_sb->ctx);
97d1152acec064 Al Viro         2011-06-17  885  	if (rc) {
1751e8a6cb935e Linus Torvalds  2017-11-27  886  		if (!(flags & SB_SILENT))
f96637be081141 Joe Perches     2013-05-04  887  			cifs_dbg(VFS, "cifs_moun=
t failed w/return code =3D %d\n",
f96637be081141 Joe Perches     2013-05-04  888  				 rc);
97d1152acec064 Al Viro         2011-06-17  889  		root =3D ERR_PTR(rc);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  890  		goto out;
97d1152acec064 Al Viro         2011-06-17  891  	}
97d1152acec064 Al Viro         2011-06-17  892  =

d17abdf7566566 Ronnie Sahlberg 2020-11-10  893  	mnt_data.ctx =3D cifs_sb->=
ctx;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  894  	mnt_data.cifs_sb =3D cifs_=
sb;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  895  	mnt_data.flags =3D flags;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  896  =

9249e17fe094d8 David Howells   2012-06-25  897  	/* BB should we make this =
contingent on mount parm? */
1751e8a6cb935e Linus Torvalds  2017-11-27  898  	flags |=3D SB_NODIRATIME |=
 SB_NOATIME;
9249e17fe094d8 David Howells   2012-06-25  899  =

9249e17fe094d8 David Howells   2012-06-25  900  	sb =3D sget(fs_type, cifs_=
match_super, cifs_set_super, flags, &mnt_data);
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  901  	if (IS_ERR(sb)) {
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  902  		root =3D ERR_CAST(sb);
97d1152acec064 Al Viro         2011-06-17  903  		cifs_umount(cifs_sb);
6cf5abbfa8c8a2 Ronnie Sahlberg 2020-12-16  904  		cifs_sb =3D NULL;
d757d71bfc3066 Al Viro         2011-06-17  905  		goto out;
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  906  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  907  =

ee01a14d9ddcf3 Al Viro         2011-06-17  908  	if (sb->s_root) {
f96637be081141 Joe Perches     2013-05-04  909  		cifs_dbg(FYI, "Use existi=
ng superblock\n");
97d1152acec064 Al Viro         2011-06-17  910  		cifs_umount(cifs_sb);
6cf5abbfa8c8a2 Ronnie Sahlberg 2020-12-16  911  		cifs_sb =3D NULL;
5c4f1ad7c6aa3b Al Viro         2011-06-17  912  	} else {
97d1152acec064 Al Viro         2011-06-17  913  		rc =3D cifs_read_super(sb=
);
^1da177e4c3f41 Linus Torvalds  2005-04-16  914  		if (rc) {
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  915  			root =3D ERR_PTR(rc);
641a58d66d0863 Pavel Shilovsky 2011-05-26  916  			goto out_super;
^1da177e4c3f41 Linus Torvalds  2005-04-16  917  		}
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  918  =

1751e8a6cb935e Linus Torvalds  2017-11-27  919  		sb->s_flags |=3D SB_ACTIV=
E;
5c4f1ad7c6aa3b Al Viro         2011-06-17  920  	}
724d9f1cfba0cb Pavel Shilovsky 2011-05-05  921  =

6cf5abbfa8c8a2 Ronnie Sahlberg 2020-12-16  922  	root =3D cifs_get_root(cif=
s_sb ? cifs_sb->ctx : old_ctx, sb);
9403c9c598e91d Al Viro         2011-06-17  923  	if (IS_ERR(root))
f87d39d951329c Steve French    2011-05-27  924  		goto out_super;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  925  =

269f67e1ffead6 Ronnie Sahlberg 2021-03-09  926  	if (cifs_sb)
269f67e1ffead6 Ronnie Sahlberg 2021-03-09  927  		cifs_sb->root =3D dget(ro=
ot);
269f67e1ffead6 Ronnie Sahlberg 2021-03-09  928  =

f96637be081141 Joe Perches     2013-05-04  929  	cifs_dbg(FYI, "dentry root=
 is: %p\n", root);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  930  	return root;
25c7f41e9234f6 Pavel Shilovsky 2011-05-26  931  =

641a58d66d0863 Pavel Shilovsky 2011-05-26  932  out_super:
641a58d66d0863 Pavel Shilovsky 2011-05-26  933  	deactivate_locked_super(sb=
);
3d6cc9898efdfb Ronnie Sahlberg 2022-02-11  934  	return root;
641a58d66d0863 Pavel Shilovsky 2011-05-26  935  out:
d17abdf7566566 Ronnie Sahlberg 2020-11-10  936  	if (cifs_sb) {
cd7b7bbd4355bf Ronnie Sahlberg 2022-05-31  937  		if (!sb || IS_ERR(sb)) { =
 /* otherwise kill_sb will handle */
4214ebf4654798 Sachin Prabhu   2016-07-29  938  			kfree(cifs_sb->prepath);
c741cba2cd1d14 Ronnie Sahlberg 2020-12-14  939  			smb3_cleanup_fs_context(=
cifs_sb->ctx);
5c4f1ad7c6aa3b Al Viro         2011-06-17  940  			kfree(cifs_sb);
d17abdf7566566 Ronnie Sahlberg 2020-11-10  941  		}
cd7b7bbd4355bf Ronnie Sahlberg 2022-05-31  942  	}
d17abdf7566566 Ronnie Sahlberg 2020-11-10 @943  	return root;
^1da177e4c3f41 Linus Torvalds  2005-04-16  944  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  945  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9059945263927801450==--

