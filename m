Content-Type: multipart/mixed; boundary="===============1722216141711175599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [amir73il:fsnotify-fixes 2/2] fs/notify/fsnotify.c:540 fsnotify() warn: variable dereferenced before check 'dir1' (see line 499)
Date: Sun, 08 May 2022 03:26:49 +0800
Message-ID: <202205080346.m0fb3UXK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1722216141711175599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fsnotify-fixes
head:   d25f3ce8da49ce1a3b0a0621f0bf7b1d6ba2dad6
commit: d25f3ce8da49ce1a3b0a0621f0bf7b1d6ba2dad6 [2/2] fsnotify: send FS_RE=
NAME to groups watching the moved inode
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: s390-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205080346.m0fb3UXK-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/notify/fsnotify.c:540 fsnotify() warn: variable dereferenced before chec=
k 'dir1' (see line 499)

vim +/dir1 +540 fs/notify/fsnotify.c

d9a6f30bb89309 Amir Goldstein          2018-04-20  454  =

90586523eb4b34 Eric Paris              2009-05-21  455  /*
40a100d3adc1ad Amir Goldstein          2020-07-22  456   * fsnotify - This =
is the main call to fsnotify.
40a100d3adc1ad Amir Goldstein          2020-07-22  457   *
40a100d3adc1ad Amir Goldstein          2020-07-22  458   * The VFS calls in=
to hook specific functions in linux/fsnotify.h.
40a100d3adc1ad Amir Goldstein          2020-07-22  459   * Those functions =
then in turn call here.  Here will call out to all of the
40a100d3adc1ad Amir Goldstein          2020-07-22  460   * registered fsnot=
ify_group.  Those groups can then use the notification event
40a100d3adc1ad Amir Goldstein          2020-07-22  461   * in whatever mean=
s they feel necessary.
40a100d3adc1ad Amir Goldstein          2020-07-22  462   *
40a100d3adc1ad Amir Goldstein          2020-07-22  463   * @mask:	event typ=
e and flags
40a100d3adc1ad Amir Goldstein          2020-07-22  464   * @data:	object th=
at event happened on
40a100d3adc1ad Amir Goldstein          2020-07-22  465   * @data_type:	type=
 of object for fanotify_data_XXX() accessors
40a100d3adc1ad Amir Goldstein          2020-07-22  466   * @dir:	optional d=
irectory associated with event -
40a100d3adc1ad Amir Goldstein          2020-07-22  467   *		if @file_name i=
s not NULL, this is the directory that
40a100d3adc1ad Amir Goldstein          2020-07-22  468   *		@file_name is r=
elative to
40a100d3adc1ad Amir Goldstein          2020-07-22  469   * @file_name:	opti=
onal file name associated with event
40a100d3adc1ad Amir Goldstein          2020-07-22  470   * @inode:	optional=
 inode associated with event -
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  471   *		If @dir and @in=
ode are both non-NULL, event may be
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  472   *		reported to bot=
h.
40a100d3adc1ad Amir Goldstein          2020-07-22  473   * @cookie:	inotify=
 rename cookie
90586523eb4b34 Eric Paris              2009-05-21  474   */
40a100d3adc1ad Amir Goldstein          2020-07-22  475  int fsnotify(__u32 =
mask, const void *data, int data_type, struct inode *dir,
40a100d3adc1ad Amir Goldstein          2020-07-22  476  	     const struct =
qstr *file_name, struct inode *inode, u32 cookie)
90586523eb4b34 Eric Paris              2009-05-21  477  {
b54cecf5e2293d Amir Goldstein          2020-06-07  478  	const struct path =
*path =3D fsnotify_data_path(data, data_type);
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  479  	struct super_block=
 *sb =3D fsnotify_data_sb(data, data_type);
3427ce71554123 Miklos Szeredi          2017-10-30  480  	struct fsnotify_it=
er_info iter_info =3D {};
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  481  	struct mount *mnt =
=3D NULL;
d25f3ce8da49ce Amir Goldstein          2022-05-07  482  	struct inode *dir1=
, *dir2;
e54183fa7047c1 Amir Goldstein          2021-11-29  483  	struct dentry *mov=
ed;
d25f3ce8da49ce Amir Goldstein          2022-05-07  484  	int dir1_type =3D =
0;
9385a84d7e1f65 Jan Kara                2016-11-10  485  	int ret =3D 0;
71d734103edfa2 Mel Gorman              2020-07-08  486  	__u32 test_mask, m=
arks_mask;
90586523eb4b34 Eric Paris              2009-05-21  487  =

71d734103edfa2 Mel Gorman              2020-07-08  488  	if (path)
aa93bdc5500cc9 Amir Goldstein          2020-03-19  489  		mnt =3D real_moun=
t(path->mnt);
3a9fb89f4cd04c Eric Paris              2009-12-17  490  =

40a100d3adc1ad Amir Goldstein          2020-07-22  491  	if (!inode) {
40a100d3adc1ad Amir Goldstein          2020-07-22  492  		/* Dirent event -=
 report on TYPE_INODE to dir */
40a100d3adc1ad Amir Goldstein          2020-07-22  493  		inode =3D dir;
d25f3ce8da49ce Amir Goldstein          2022-05-07  494  	} else if (mask & =
FS_RENAME) {
d25f3ce8da49ce Amir Goldstein          2022-05-07  495  		/* For FS_RENAME,=
 dir1 is old_dir and dir2 is new_dir */
e54183fa7047c1 Amir Goldstein          2021-11-29  496  		moved =3D fsnotif=
y_data_dentry(data, data_type);
d25f3ce8da49ce Amir Goldstein          2022-05-07  497  		dir1 =3D moved->d=
_parent->d_inode;
d25f3ce8da49ce Amir Goldstein          2022-05-07  498  		dir2 =3D dir;
d25f3ce8da49ce Amir Goldstein          2022-05-07 @499  		if (dir1->i_fsnot=
ify_marks || dir2->i_fsnotify_marks)
d25f3ce8da49ce Amir Goldstein          2022-05-07  500  			dir1_type =3D FS=
NOTIFY_ITER_TYPE_OLD_DIR;
d25f3ce8da49ce Amir Goldstein          2022-05-07  501  		/*
d25f3ce8da49ce Amir Goldstein          2022-05-07  502  		 * Send FS_RENAME=
 to groups watching the moved inode itself
d25f3ce8da49ce Amir Goldstein          2022-05-07  503  		 * only if the mo=
ved inode is a non-dir.
d25f3ce8da49ce Amir Goldstein          2022-05-07  504  		 * Sending FS_REN=
AME to a moved watched directory would be
d25f3ce8da49ce Amir Goldstein          2022-05-07  505  		 * confusing and =
FS_MOVE_SELF provided enough information to
d25f3ce8da49ce Amir Goldstein          2022-05-07  506  		 * track the move=
ments of a watched directory.
d25f3ce8da49ce Amir Goldstein          2022-05-07  507  		 */
d25f3ce8da49ce Amir Goldstein          2022-05-07  508  		if (mask & FS_ISD=
IR)
d25f3ce8da49ce Amir Goldstein          2022-05-07  509  			inode =3D NULL;
40a100d3adc1ad Amir Goldstein          2020-07-22  510  	} else if (mask & =
FS_EVENT_ON_CHILD) {
40a100d3adc1ad Amir Goldstein          2020-07-22  511  		/*
fecc4559780d52 Amir Goldstein          2020-12-02  512  		 * Event on child=
 - report on TYPE_PARENT to dir if it is
fecc4559780d52 Amir Goldstein          2020-12-02  513  		 * watching child=
ren and on TYPE_INODE to child.
40a100d3adc1ad Amir Goldstein          2020-07-22  514  		 */
d25f3ce8da49ce Amir Goldstein          2022-05-07  515  		dir1 =3D dir;
d25f3ce8da49ce Amir Goldstein          2022-05-07  516  		dir2 =3D NULL;
d25f3ce8da49ce Amir Goldstein          2022-05-07  517  		if (dir1->i_fsnot=
ify_marks)
d25f3ce8da49ce Amir Goldstein          2022-05-07  518  			dir1_type =3D FS=
NOTIFY_ITER_TYPE_PARENT;
40a100d3adc1ad Amir Goldstein          2020-07-22  519  	}
497b0c5a7c0688 Amir Goldstein          2020-07-16  520  =

7c49b8616460eb Dave Hansen             2015-09-04  521  	/*
7c49b8616460eb Dave Hansen             2015-09-04  522  	 * Optimization: s=
rcu_read_lock() has a memory barrier which can
7c49b8616460eb Dave Hansen             2015-09-04  523  	 * be expensive.  =
It protects walking the *_fsnotify_marks lists.
7c49b8616460eb Dave Hansen             2015-09-04  524  	 * However, if we =
do not walk the lists, we do not have to do
7c49b8616460eb Dave Hansen             2015-09-04  525  	 * SRCU because we=
 have no references to any objects and do not
7c49b8616460eb Dave Hansen             2015-09-04  526  	 * need SRCU to ke=
ep them "alive".
7c49b8616460eb Dave Hansen             2015-09-04  527  	 */
9b93f33105f5f9 Amir Goldstein          2020-07-16  528  	if (!sb->s_fsnotif=
y_marks &&
497b0c5a7c0688 Amir Goldstein          2020-07-16  529  	    (!mnt || !mnt-=
>mnt_fsnotify_marks) &&
9b93f33105f5f9 Amir Goldstein          2020-07-16  530  	    (!inode || !in=
ode->i_fsnotify_marks) &&
d25f3ce8da49ce Amir Goldstein          2022-05-07  531  	    !dir1_type)
7c49b8616460eb Dave Hansen             2015-09-04  532  		return 0;
71d734103edfa2 Mel Gorman              2020-07-08  533  =

9b93f33105f5f9 Amir Goldstein          2020-07-16  534  	marks_mask =3D sb-=
>s_fsnotify_mask;
71d734103edfa2 Mel Gorman              2020-07-08  535  	if (mnt)
71d734103edfa2 Mel Gorman              2020-07-08  536  		marks_mask |=3D m=
nt->mnt_fsnotify_mask;
9b93f33105f5f9 Amir Goldstein          2020-07-16  537  	if (inode)
9b93f33105f5f9 Amir Goldstein          2020-07-16  538  		marks_mask |=3D i=
node->i_fsnotify_mask;
d25f3ce8da49ce Amir Goldstein          2022-05-07  539  	if (dir1_type) {
d25f3ce8da49ce Amir Goldstein          2022-05-07 @540  		if (dir1)
d25f3ce8da49ce Amir Goldstein          2022-05-07  541  			marks_mask |=3D =
dir1->i_fsnotify_mask;
d25f3ce8da49ce Amir Goldstein          2022-05-07  542  		if (dir2)
d25f3ce8da49ce Amir Goldstein          2022-05-07  543  			marks_mask |=3D =
dir2->i_fsnotify_mask;
d25f3ce8da49ce Amir Goldstein          2022-05-07  544  	}
497b0c5a7c0688 Amir Goldstein          2020-07-16  545  =

71d734103edfa2 Mel Gorman              2020-07-08  546  =

613a807fe7c793 Eric Paris              2010-07-28  547  	/*
04e317ba72d079 Amir Goldstein          2022-02-23  548  	 * If this is a mo=
dify event we may need to clear some ignored masks.
04e317ba72d079 Amir Goldstein          2022-02-23  549  	 * In that case, t=
he object with ignored masks will have the FS_MODIFY
04e317ba72d079 Amir Goldstein          2022-02-23  550  	 * event in its ma=
sk.
04e317ba72d079 Amir Goldstein          2022-02-23  551  	 * Otherwise, retu=
rn if none of the marks care about this type of event.
613a807fe7c793 Eric Paris              2010-07-28  552  	 */
71d734103edfa2 Mel Gorman              2020-07-08  553  	test_mask =3D (mas=
k & ALL_FSNOTIFY_EVENTS);
04e317ba72d079 Amir Goldstein          2022-02-23  554  	if (!(test_mask & =
marks_mask))
613a807fe7c793 Eric Paris              2010-07-28  555  		return 0;
75c1be487a690d Eric Paris              2010-07-28  556  =

9385a84d7e1f65 Jan Kara                2016-11-10  557  	iter_info.srcu_idx=
 =3D srcu_read_lock(&fsnotify_mark_srcu);
75c1be487a690d Eric Paris              2010-07-28  558  =

1c9007d62bea6f Amir Goldstein          2021-11-29  559  	iter_info.marks[FS=
NOTIFY_ITER_TYPE_SB] =3D
45a9fb3725d886 Amir Goldstein          2019-01-10  560  		fsnotify_first_ma=
rk(&sb->s_fsnotify_marks);
9bdda4e9cf2dce Amir Goldstein          2018-09-01  561  	if (mnt) {
1c9007d62bea6f Amir Goldstein          2021-11-29  562  		iter_info.marks[F=
SNOTIFY_ITER_TYPE_VFSMOUNT] =3D
3427ce71554123 Miklos Szeredi          2017-10-30  563  			fsnotify_first_m=
ark(&mnt->mnt_fsnotify_marks);
7131485a93679f Eric Paris              2009-12-17  564  	}
9b93f33105f5f9 Amir Goldstein          2020-07-16  565  	if (inode) {
1c9007d62bea6f Amir Goldstein          2021-11-29  566  		iter_info.marks[F=
SNOTIFY_ITER_TYPE_INODE] =3D
9b93f33105f5f9 Amir Goldstein          2020-07-16  567  			fsnotify_first_m=
ark(&inode->i_fsnotify_marks);
9b93f33105f5f9 Amir Goldstein          2020-07-16  568  	}
d25f3ce8da49ce Amir Goldstein          2022-05-07  569  	if (dir1_type) {
d25f3ce8da49ce Amir Goldstein          2022-05-07  570  		if (dir1)
d25f3ce8da49ce Amir Goldstein          2022-05-07  571  			iter_info.marks[=
dir1_type] =3D
d25f3ce8da49ce Amir Goldstein          2022-05-07  572  				fsnotify_first_=
mark(&dir1->i_fsnotify_marks);
d25f3ce8da49ce Amir Goldstein          2022-05-07  573  		if (dir2)
d25f3ce8da49ce Amir Goldstein          2022-05-07  574  			iter_info.marks[=
FSNOTIFY_ITER_TYPE_NEW_DIR] =3D
d25f3ce8da49ce Amir Goldstein          2022-05-07  575  				fsnotify_first_=
mark(&dir2->i_fsnotify_marks);
497b0c5a7c0688 Amir Goldstein          2020-07-16  576  	}
75c1be487a690d Eric Paris              2010-07-28  577  =

8edc6e1688fc8f Jan Kara                2014-11-13  578  	/*
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  579  	 * We need to merg=
e inode/vfsmount/sb mark lists so that e.g. inode mark
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  580  	 * ignore masks ar=
e properly reflected for mount/sb mark notifications.
8edc6e1688fc8f Jan Kara                2014-11-13  581  	 * That's why this=
 traversal is so complicated...
8edc6e1688fc8f Jan Kara                2014-11-13  582  	 */
d9a6f30bb89309 Amir Goldstein          2018-04-20  583  	while (fsnotify_it=
er_select_report_types(&iter_info)) {
b54cecf5e2293d Amir Goldstein          2020-06-07  584  		ret =3D send_to_g=
roup(mask, data, data_type, dir, file_name,
b54cecf5e2293d Amir Goldstein          2020-06-07  585  				    cookie, &it=
er_info);
613a807fe7c793 Eric Paris              2010-07-28  586  =

ff8bcbd03da881 Eric Paris              2010-10-28  587  		if (ret && (mask =
& ALL_FSNOTIFY_PERM_EVENTS))
ff8bcbd03da881 Eric Paris              2010-10-28  588  			goto out;
ff8bcbd03da881 Eric Paris              2010-10-28  589  =

d9a6f30bb89309 Amir Goldstein          2018-04-20  590  		fsnotify_iter_nex=
t(&iter_info);
90586523eb4b34 Eric Paris              2009-05-21  591  	}
ff8bcbd03da881 Eric Paris              2010-10-28  592  	ret =3D 0;
ff8bcbd03da881 Eric Paris              2010-10-28  593  out:
9385a84d7e1f65 Jan Kara                2016-11-10  594  	srcu_read_unlock(&=
fsnotify_mark_srcu, iter_info.srcu_idx);
c4ec54b40d33f8 Eric Paris              2009-12-17  595  =

98b5c10d320adf Jean-Christophe Dubois  2010-03-23  596  	return ret;
90586523eb4b34 Eric Paris              2009-05-21  597  }
90586523eb4b34 Eric Paris              2009-05-21  598  EXPORT_SYMBOL_GPL(f=
snotify);
90586523eb4b34 Eric Paris              2009-05-21  599  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1722216141711175599==--

