Content-Type: multipart/mixed; boundary="===============4243274211568663672=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [ebiggers:wip-test-dummy-encryption 3/4] fs/f2fs/super.c:822:4: error: 'ret' undeclared; did you mean 'net'?
Date: Tue, 12 May 2020 18:07:31 +0800
Message-ID: <202005121825.yXfLFdb2%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4243274211568663672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
wip-test-dummy-encryption
head:   3401801b9e29c95126ac1b3fb324d25f540048a8
commit: 0f065e5bfd243dfbc49e296285a07153e30c997d [3/4] fscrypt: support tes=
t_dummy_encryption=3Dv2
config: h8300-randconfig-r024-20200512 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 0f065e5bfd243dfbc49e296285a07153e30c997d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dh8300 =

:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

fs/f2fs/super.c: In function 'parse_options':
>> fs/f2fs/super.c:822:4: error: 'ret' undeclared (first use in this functi=
on); did you mean 'net'?
822 |    ret =3D f2fs_set_test_dummy_encryption(sb, p, &args[0],
|    ^~~
|    net
fs/f2fs/super.c:822:4: note: each undeclared identifier is reported only on=
ce for each function it appears in

# https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/commit=
/?id=3D0f065e5bfd243dfbc49e296285a07153e30c997d
git remote add ebiggers https://git.kernel.org/pub/scm/linux/kernel/git/ebi=
ggers/linux.git
git remote update ebiggers
git checkout 0f065e5bfd243dfbc49e296285a07153e30c997d
vim +822 fs/f2fs/super.c

696c018c7718f5 Namjae Jeon      2013-06-16  450  =

696c018c7718f5 Namjae Jeon      2013-06-16  451  	if (!options)
696c018c7718f5 Namjae Jeon      2013-06-16  452  		return 0;
696c018c7718f5 Namjae Jeon      2013-06-16  453  =

696c018c7718f5 Namjae Jeon      2013-06-16  454  	while ((p =3D strsep(&opt=
ions, ",")) !=3D NULL) {
696c018c7718f5 Namjae Jeon      2013-06-16  455  		int token;
696c018c7718f5 Namjae Jeon      2013-06-16  456  		if (!*p)
696c018c7718f5 Namjae Jeon      2013-06-16  457  			continue;
696c018c7718f5 Namjae Jeon      2013-06-16  458  		/*
696c018c7718f5 Namjae Jeon      2013-06-16  459  		 * Initialize args struc=
t so we know whether arg was
696c018c7718f5 Namjae Jeon      2013-06-16  460  		 * found; some options t=
ake optional arguments.
696c018c7718f5 Namjae Jeon      2013-06-16  461  		 */
696c018c7718f5 Namjae Jeon      2013-06-16  462  		args[0].to =3D args[0].f=
rom =3D NULL;
696c018c7718f5 Namjae Jeon      2013-06-16  463  		token =3D match_token(p,=
 f2fs_tokens, args);
696c018c7718f5 Namjae Jeon      2013-06-16  464  =

696c018c7718f5 Namjae Jeon      2013-06-16  465  		switch (token) {
696c018c7718f5 Namjae Jeon      2013-06-16  466  		case Opt_gc_background:
696c018c7718f5 Namjae Jeon      2013-06-16  467  			name =3D match_strdup(&=
args[0]);
696c018c7718f5 Namjae Jeon      2013-06-16  468  =

696c018c7718f5 Namjae Jeon      2013-06-16  469  			if (!name)
696c018c7718f5 Namjae Jeon      2013-06-16  470  				return -ENOMEM;
6aefd93b01379b Jaegeuk Kim      2015-10-05  471  			if (strlen(name) =3D=3D=
 2 && !strncmp(name, "on", 2)) {
bbbc34fd666254 Chao Yu          2020-02-14  472  				F2FS_OPTION(sbi).bggc_=
mode =3D BGGC_MODE_ON;
6aefd93b01379b Jaegeuk Kim      2015-10-05  473  			} else if (strlen(name)=
 =3D=3D 3 && !strncmp(name, "off", 3)) {
bbbc34fd666254 Chao Yu          2020-02-14  474  				F2FS_OPTION(sbi).bggc_=
mode =3D BGGC_MODE_OFF;
6aefd93b01379b Jaegeuk Kim      2015-10-05  475  			} else if (strlen(name)=
 =3D=3D 4 && !strncmp(name, "sync", 4)) {
bbbc34fd666254 Chao Yu          2020-02-14  476  				F2FS_OPTION(sbi).bggc_=
mode =3D BGGC_MODE_SYNC;
6aefd93b01379b Jaegeuk Kim      2015-10-05  477  			} else {
5222595d093ebe Jaegeuk Kim      2018-12-13  478  				kvfree(name);
696c018c7718f5 Namjae Jeon      2013-06-16  479  				return -EINVAL;
696c018c7718f5 Namjae Jeon      2013-06-16  480  			}
5222595d093ebe Jaegeuk Kim      2018-12-13  481  			kvfree(name);
696c018c7718f5 Namjae Jeon      2013-06-16  482  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  483  		case Opt_disable_roll_fo=
rward:
696c018c7718f5 Namjae Jeon      2013-06-16  484  			set_opt(sbi, DISABLE_RO=
LL_FORWARD);
696c018c7718f5 Namjae Jeon      2013-06-16  485  			break;
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23  486  		case Opt_norecovery:
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23  487  			/* this option mounts f=
2fs with ro */
a9117eca1de6b7 Chao Yu          2020-02-14  488  			set_opt(sbi, NORECOVERY=
);
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23  489  			if (!f2fs_readonly(sb))
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23  490  				return -EINVAL;
2d834bf9ac8e40 Jaegeuk Kim      2015-01-23  491  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  492  		case Opt_discard:
696c018c7718f5 Namjae Jeon      2013-06-16  493  			set_opt(sbi, DISCARD);
696c018c7718f5 Namjae Jeon      2013-06-16  494  			break;
64058be9c8e357 Chao Yu          2016-07-03  495  		case Opt_nodiscard:
7beb01f74415c5 Chao Yu          2018-10-24  496  			if (f2fs_sb_has_blkzone=
d(sbi)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  497  				f2fs_warn(sbi, "discar=
d is required for zoned block devices");
96ba2decb4241a Damien Le Moal   2016-10-28  498  				return -EINVAL;
96ba2decb4241a Damien Le Moal   2016-10-28  499  			}
64058be9c8e357 Chao Yu          2016-07-03  500  			clear_opt(sbi, DISCARD);
487df616dec332 Damien Le Moal   2016-10-28  501  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  502  		case Opt_noheap:
696c018c7718f5 Namjae Jeon      2013-06-16  503  			set_opt(sbi, NOHEAP);
696c018c7718f5 Namjae Jeon      2013-06-16  504  			break;
7a20b8a61eff81 Jaegeuk Kim      2017-03-24  505  		case Opt_heap:
7a20b8a61eff81 Jaegeuk Kim      2017-03-24  506  			clear_opt(sbi, NOHEAP);
7a20b8a61eff81 Jaegeuk Kim      2017-03-24  507  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  508  #ifdef CONFIG_F2FS_FS_XATTR
4058c5117d6d8a Kelly Anderson   2013-10-07  509  		case Opt_user_xattr:
4058c5117d6d8a Kelly Anderson   2013-10-07  510  			set_opt(sbi, XATTR_USER=
);
4058c5117d6d8a Kelly Anderson   2013-10-07  511  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  512  		case Opt_nouser_xattr:
696c018c7718f5 Namjae Jeon      2013-06-16  513  			clear_opt(sbi, XATTR_US=
ER);
696c018c7718f5 Namjae Jeon      2013-06-16  514  			break;
444c580f7e9ad2 Jaegeuk Kim      2013-08-08  515  		case Opt_inline_xattr:
444c580f7e9ad2 Jaegeuk Kim      2013-08-08  516  			set_opt(sbi, INLINE_XAT=
TR);
444c580f7e9ad2 Jaegeuk Kim      2013-08-08  517  			break;
23cf7212a1cae2 Chao Yu          2017-02-15  518  		case Opt_noinline_xattr:
23cf7212a1cae2 Chao Yu          2017-02-15  519  			clear_opt(sbi, INLINE_X=
ATTR);
23cf7212a1cae2 Chao Yu          2017-02-15  520  			break;
6afc662e68b5f9 Chao Yu          2017-09-06  521  		case Opt_inline_xattr_si=
ze:
6afc662e68b5f9 Chao Yu          2017-09-06  522  			if (args->from && match=
_int(args, &arg))
6afc662e68b5f9 Chao Yu          2017-09-06  523  				return -EINVAL;
6afc662e68b5f9 Chao Yu          2017-09-06  524  			set_opt(sbi, INLINE_XAT=
TR_SIZE);
63189b785960c3 Chao Yu          2018-03-08  525  			F2FS_OPTION(sbi).inline=
_xattr_size =3D arg;
6afc662e68b5f9 Chao Yu          2017-09-06  526  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  527  #else
4058c5117d6d8a Kelly Anderson   2013-10-07  528  		case Opt_user_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18  529  			f2fs_info(sbi, "user_xa=
ttr options not supported");
4058c5117d6d8a Kelly Anderson   2013-10-07  530  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  531  		case Opt_nouser_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18  532  			f2fs_info(sbi, "nouser_=
xattr options not supported");
696c018c7718f5 Namjae Jeon      2013-06-16  533  			break;
444c580f7e9ad2 Jaegeuk Kim      2013-08-08  534  		case Opt_inline_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18  535  			f2fs_info(sbi, "inline_=
xattr options not supported");
444c580f7e9ad2 Jaegeuk Kim      2013-08-08  536  			break;
23cf7212a1cae2 Chao Yu          2017-02-15  537  		case Opt_noinline_xattr:
dcbb4c10e6d969 Joe Perches      2019-06-18  538  			f2fs_info(sbi, "noinlin=
e_xattr options not supported");
23cf7212a1cae2 Chao Yu          2017-02-15  539  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  540  #endif
696c018c7718f5 Namjae Jeon      2013-06-16  541  #ifdef CONFIG_F2FS_FS_POSI=
X_ACL
4058c5117d6d8a Kelly Anderson   2013-10-07  542  		case Opt_acl:
4058c5117d6d8a Kelly Anderson   2013-10-07  543  			set_opt(sbi, POSIX_ACL);
4058c5117d6d8a Kelly Anderson   2013-10-07  544  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  545  		case Opt_noacl:
696c018c7718f5 Namjae Jeon      2013-06-16  546  			clear_opt(sbi, POSIX_AC=
L);
696c018c7718f5 Namjae Jeon      2013-06-16  547  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  548  #else
4058c5117d6d8a Kelly Anderson   2013-10-07  549  		case Opt_acl:
dcbb4c10e6d969 Joe Perches      2019-06-18  550  			f2fs_info(sbi, "acl opt=
ions not supported");
4058c5117d6d8a Kelly Anderson   2013-10-07  551  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  552  		case Opt_noacl:
dcbb4c10e6d969 Joe Perches      2019-06-18  553  			f2fs_info(sbi, "noacl o=
ptions not supported");
696c018c7718f5 Namjae Jeon      2013-06-16  554  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  555  #endif
696c018c7718f5 Namjae Jeon      2013-06-16  556  		case Opt_active_logs:
696c018c7718f5 Namjae Jeon      2013-06-16  557  			if (args->from && match=
_int(args, &arg))
696c018c7718f5 Namjae Jeon      2013-06-16  558  				return -EINVAL;
696c018c7718f5 Namjae Jeon      2013-06-16  559  			if (arg !=3D 2 && arg !=
=3D 4 && arg !=3D NR_CURSEG_TYPE)
696c018c7718f5 Namjae Jeon      2013-06-16  560  				return -EINVAL;
63189b785960c3 Chao Yu          2018-03-08  561  			F2FS_OPTION(sbi).active=
_logs =3D arg;
696c018c7718f5 Namjae Jeon      2013-06-16  562  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  563  		case Opt_disable_ext_ide=
ntify:
696c018c7718f5 Namjae Jeon      2013-06-16  564  			set_opt(sbi, DISABLE_EX=
T_IDENTIFY);
696c018c7718f5 Namjae Jeon      2013-06-16  565  			break;
8274de77b7072d Huajun Li        2013-11-10  566  		case Opt_inline_data:
8274de77b7072d Huajun Li        2013-11-10  567  			set_opt(sbi, INLINE_DAT=
A);
8274de77b7072d Huajun Li        2013-11-10  568  			break;
5efd3c6f1be9cf Chao Yu          2014-09-24  569  		case Opt_inline_dentry:
5efd3c6f1be9cf Chao Yu          2014-09-24  570  			set_opt(sbi, INLINE_DEN=
TRY);
5efd3c6f1be9cf Chao Yu          2014-09-24  571  			break;
97c1794a5dc160 Chao Yu          2016-05-09  572  		case Opt_noinline_dentry:
97c1794a5dc160 Chao Yu          2016-05-09  573  			clear_opt(sbi, INLINE_D=
ENTRY);
97c1794a5dc160 Chao Yu          2016-05-09  574  			break;
6b4afdd794783f Jaegeuk Kim      2014-04-02  575  		case Opt_flush_merge:
6b4afdd794783f Jaegeuk Kim      2014-04-02  576  			set_opt(sbi, FLUSH_MERG=
E);
6b4afdd794783f Jaegeuk Kim      2014-04-02  577  			break;
69e9e4274450c7 Jaegeuk Kim      2016-05-20  578  		case Opt_noflush_merge:
69e9e4274450c7 Jaegeuk Kim      2016-05-20  579  			clear_opt(sbi, FLUSH_ME=
RGE);
69e9e4274450c7 Jaegeuk Kim      2016-05-20  580  			break;
0f7b2abd188089 Jaegeuk Kim      2014-07-23  581  		case Opt_nobarrier:
0f7b2abd188089 Jaegeuk Kim      2014-07-23  582  			set_opt(sbi, NOBARRIER);
0f7b2abd188089 Jaegeuk Kim      2014-07-23  583  			break;
d5053a34a9cc79 Jaegeuk Kim      2014-10-30  584  		case Opt_fastboot:
d5053a34a9cc79 Jaegeuk Kim      2014-10-30  585  			set_opt(sbi, FASTBOOT);
d5053a34a9cc79 Jaegeuk Kim      2014-10-30  586  			break;
8967215954a509 Chao Yu          2015-02-05  587  		case Opt_extent_cache:
8967215954a509 Chao Yu          2015-02-05  588  			set_opt(sbi, EXTENT_CAC=
HE);
8967215954a509 Chao Yu          2015-02-05  589  			break;
7daaea256de42d Jaegeuk Kim      2015-06-25  590  		case Opt_noextent_cache:
7daaea256de42d Jaegeuk Kim      2015-06-25  591  			clear_opt(sbi, EXTENT_C=
ACHE);
7daaea256de42d Jaegeuk Kim      2015-06-25  592  			break;
75342797988a0f Wanpeng Li       2015-03-24  593  		case Opt_noinline_data:
75342797988a0f Wanpeng Li       2015-03-24  594  			clear_opt(sbi, INLINE_D=
ATA);
75342797988a0f Wanpeng Li       2015-03-24  595  			break;
343f40f0a70eb7 Chao Yu          2015-12-16  596  		case Opt_data_flush:
343f40f0a70eb7 Chao Yu          2015-12-16  597  			set_opt(sbi, DATA_FLUSH=
);
343f40f0a70eb7 Chao Yu          2015-12-16  598  			break;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  599  		case Opt_reserve_root:
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  600  			if (args->from && match=
_int(args, &arg))
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  601  				return -EINVAL;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  602  			if (test_opt(sbi, RESER=
VE_ROOT)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  603  				f2fs_info(sbi, "Preser=
ve previous reserve_root=3D%u",
63189b785960c3 Chao Yu          2018-03-08  604  					  F2FS_OPTION(sbi).ro=
ot_reserved_blocks);
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  605  			} else {
63189b785960c3 Chao Yu          2018-03-08  606  				F2FS_OPTION(sbi).root_=
reserved_blocks =3D arg;
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  607  				set_opt(sbi, RESERVE_R=
OOT);
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  608  			}
7e65be49ed94f8 Jaegeuk Kim      2017-12-27  609  			break;
7c2e59632b846a Jaegeuk Kim      2018-01-04  610  		case Opt_resuid:
7c2e59632b846a Jaegeuk Kim      2018-01-04  611  			if (args->from && match=
_int(args, &arg))
7c2e59632b846a Jaegeuk Kim      2018-01-04  612  				return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04  613  			uid =3D make_kuid(curre=
nt_user_ns(), arg);
7c2e59632b846a Jaegeuk Kim      2018-01-04  614  			if (!uid_valid(uid)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  615  				f2fs_err(sbi, "Invalid=
 uid value %d", arg);
7c2e59632b846a Jaegeuk Kim      2018-01-04  616  				return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04  617  			}
63189b785960c3 Chao Yu          2018-03-08  618  			F2FS_OPTION(sbi).s_resu=
id =3D uid;
7c2e59632b846a Jaegeuk Kim      2018-01-04  619  			break;
7c2e59632b846a Jaegeuk Kim      2018-01-04  620  		case Opt_resgid:
7c2e59632b846a Jaegeuk Kim      2018-01-04  621  			if (args->from && match=
_int(args, &arg))
7c2e59632b846a Jaegeuk Kim      2018-01-04  622  				return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04  623  			gid =3D make_kgid(curre=
nt_user_ns(), arg);
7c2e59632b846a Jaegeuk Kim      2018-01-04  624  			if (!gid_valid(gid)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  625  				f2fs_err(sbi, "Invalid=
 gid value %d", arg);
7c2e59632b846a Jaegeuk Kim      2018-01-04  626  				return -EINVAL;
7c2e59632b846a Jaegeuk Kim      2018-01-04  627  			}
63189b785960c3 Chao Yu          2018-03-08  628  			F2FS_OPTION(sbi).s_resg=
id =3D gid;
7c2e59632b846a Jaegeuk Kim      2018-01-04  629  			break;
36abef4e796d38 Jaegeuk Kim      2016-06-03  630  		case Opt_mode:
36abef4e796d38 Jaegeuk Kim      2016-06-03  631  			name =3D match_strdup(&=
args[0]);
36abef4e796d38 Jaegeuk Kim      2016-06-03  632  =

36abef4e796d38 Jaegeuk Kim      2016-06-03  633  			if (!name)
36abef4e796d38 Jaegeuk Kim      2016-06-03  634  				return -ENOMEM;
36abef4e796d38 Jaegeuk Kim      2016-06-03  635  			if (strlen(name) =3D=3D=
 8 &&
36abef4e796d38 Jaegeuk Kim      2016-06-03  636  					!strncmp(name, "adapt=
ive", 8)) {
7beb01f74415c5 Chao Yu          2018-10-24  637  				if (f2fs_sb_has_blkzon=
ed(sbi)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  638  					f2fs_warn(sbi, "adapt=
ive mode is not allowed with zoned block device feature");
5222595d093ebe Jaegeuk Kim      2018-12-13  639  					kvfree(name);
3adc57e97792e4 Damien Le Moal   2016-10-28  640  					return -EINVAL;
3adc57e97792e4 Damien Le Moal   2016-10-28  641  				}
b0332a0f957ca8 Chao Yu          2020-02-14  642  				F2FS_OPTION(sbi).fs_mo=
de =3D FS_MODE_ADAPTIVE;
36abef4e796d38 Jaegeuk Kim      2016-06-03  643  			} else if (strlen(name)=
 =3D=3D 3 &&
36abef4e796d38 Jaegeuk Kim      2016-06-03  644  					!strncmp(name, "lfs",=
 3)) {
b0332a0f957ca8 Chao Yu          2020-02-14  645  				F2FS_OPTION(sbi).fs_mo=
de =3D FS_MODE_LFS;
36abef4e796d38 Jaegeuk Kim      2016-06-03  646  			} else {
5222595d093ebe Jaegeuk Kim      2018-12-13  647  				kvfree(name);
36abef4e796d38 Jaegeuk Kim      2016-06-03  648  				return -EINVAL;
36abef4e796d38 Jaegeuk Kim      2016-06-03  649  			}
5222595d093ebe Jaegeuk Kim      2018-12-13  650  			kvfree(name);
36abef4e796d38 Jaegeuk Kim      2016-06-03  651  			break;
ec91538dccd443 Jaegeuk Kim      2016-12-21  652  		case Opt_io_size_bits:
ec91538dccd443 Jaegeuk Kim      2016-12-21  653  			if (args->from && match=
_int(args, &arg))
ec91538dccd443 Jaegeuk Kim      2016-12-21  654  				return -EINVAL;
6d52e135c8a8b2 Chao Yu          2019-02-15  655  			if (arg <=3D 0 || arg >=
 __ilog2_u32(BIO_MAX_PAGES)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  656  				f2fs_warn(sbi, "Not su=
pport %d, larger than %d",
ec91538dccd443 Jaegeuk Kim      2016-12-21  657  					  1 << arg, BIO_MAX_P=
AGES);
ec91538dccd443 Jaegeuk Kim      2016-12-21  658  				return -EINVAL;
ec91538dccd443 Jaegeuk Kim      2016-12-21  659  			}
63189b785960c3 Chao Yu          2018-03-08  660  			F2FS_OPTION(sbi).write_=
io_size_bits =3D arg;
ec91538dccd443 Jaegeuk Kim      2016-12-21  661  			break;
4cb037ec3f754f Chengguang Xu    2018-09-12  662  #ifdef CONFIG_F2FS_FAULT_I=
NJECTION
73faec4d99358b Jaegeuk Kim      2016-04-29  663  		case Opt_fault_injection:
73faec4d99358b Jaegeuk Kim      2016-04-29  664  			if (args->from && match=
_int(args, &arg))
73faec4d99358b Jaegeuk Kim      2016-04-29  665  				return -EINVAL;
d494500a704342 Chao Yu          2018-08-08  666  			f2fs_build_fault_attr(s=
bi, arg, F2FS_ALL_FAULT_TYPE);
d494500a704342 Chao Yu          2018-08-08  667  			set_opt(sbi, FAULT_INJE=
CTION);
d494500a704342 Chao Yu          2018-08-08  668  			break;
4cb037ec3f754f Chengguang Xu    2018-09-12  669  =

d494500a704342 Chao Yu          2018-08-08  670  		case Opt_fault_type:
d494500a704342 Chao Yu          2018-08-08  671  			if (args->from && match=
_int(args, &arg))
d494500a704342 Chao Yu          2018-08-08  672  				return -EINVAL;
d494500a704342 Chao Yu          2018-08-08  673  			f2fs_build_fault_attr(s=
bi, 0, arg);
0cc0dec2b6f9bf Kaixu Xia        2017-01-27  674  			set_opt(sbi, FAULT_INJE=
CTION);
4cb037ec3f754f Chengguang Xu    2018-09-12  675  			break;
73faec4d99358b Jaegeuk Kim      2016-04-29  676  #else
4cb037ec3f754f Chengguang Xu    2018-09-12  677  		case Opt_fault_injection:
dcbb4c10e6d969 Joe Perches      2019-06-18  678  			f2fs_info(sbi, "fault_i=
njection options not supported");
73faec4d99358b Jaegeuk Kim      2016-04-29  679  			break;
4cb037ec3f754f Chengguang Xu    2018-09-12  680  =

4cb037ec3f754f Chengguang Xu    2018-09-12  681  		case Opt_fault_type:
dcbb4c10e6d969 Joe Perches      2019-06-18  682  			f2fs_info(sbi, "fault_t=
ype options not supported");
4cb037ec3f754f Chengguang Xu    2018-09-12  683  			break;
4cb037ec3f754f Chengguang Xu    2018-09-12  684  #endif
6d94c74ab85fe7 Jaegeuk Kim      2016-05-20  685  		case Opt_lazytime:
1751e8a6cb935e Linus Torvalds   2017-11-27  686  			sb->s_flags |=3D SB_LAZ=
YTIME;
6d94c74ab85fe7 Jaegeuk Kim      2016-05-20  687  			break;
6d94c74ab85fe7 Jaegeuk Kim      2016-05-20  688  		case Opt_nolazytime:
1751e8a6cb935e Linus Torvalds   2017-11-27  689  			sb->s_flags &=3D ~SB_LA=
ZYTIME;
6d94c74ab85fe7 Jaegeuk Kim      2016-05-20  690  			break;
0abd675e97e60d Chao Yu          2017-07-09  691  #ifdef CONFIG_QUOTA
4b2414d04e9912 Chao Yu          2017-08-08  692  		case Opt_quota:
0abd675e97e60d Chao Yu          2017-07-09  693  		case Opt_usrquota:
0abd675e97e60d Chao Yu          2017-07-09  694  			set_opt(sbi, USRQUOTA);
0abd675e97e60d Chao Yu          2017-07-09  695  			break;
0abd675e97e60d Chao Yu          2017-07-09  696  		case Opt_grpquota:
0abd675e97e60d Chao Yu          2017-07-09  697  			set_opt(sbi, GRPQUOTA);
0abd675e97e60d Chao Yu          2017-07-09  698  			break;
5c57132eaf5265 Chao Yu          2017-07-26  699  		case Opt_prjquota:
5c57132eaf5265 Chao Yu          2017-07-26  700  			set_opt(sbi, PRJQUOTA);
5c57132eaf5265 Chao Yu          2017-07-26  701  			break;
4b2414d04e9912 Chao Yu          2017-08-08  702  		case Opt_usrjquota:
4b2414d04e9912 Chao Yu          2017-08-08  703  			ret =3D f2fs_set_qf_nam=
e(sb, USRQUOTA, &args[0]);
4b2414d04e9912 Chao Yu          2017-08-08  704  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  705  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  706  			break;
4b2414d04e9912 Chao Yu          2017-08-08  707  		case Opt_grpjquota:
4b2414d04e9912 Chao Yu          2017-08-08  708  			ret =3D f2fs_set_qf_nam=
e(sb, GRPQUOTA, &args[0]);
4b2414d04e9912 Chao Yu          2017-08-08  709  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  710  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  711  			break;
4b2414d04e9912 Chao Yu          2017-08-08  712  		case Opt_prjjquota:
4b2414d04e9912 Chao Yu          2017-08-08  713  			ret =3D f2fs_set_qf_nam=
e(sb, PRJQUOTA, &args[0]);
4b2414d04e9912 Chao Yu          2017-08-08  714  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  715  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  716  			break;
4b2414d04e9912 Chao Yu          2017-08-08  717  		case Opt_offusrjquota:
4b2414d04e9912 Chao Yu          2017-08-08  718  			ret =3D f2fs_clear_qf_n=
ame(sb, USRQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08  719  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  720  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  721  			break;
4b2414d04e9912 Chao Yu          2017-08-08  722  		case Opt_offgrpjquota:
4b2414d04e9912 Chao Yu          2017-08-08  723  			ret =3D f2fs_clear_qf_n=
ame(sb, GRPQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08  724  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  725  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  726  			break;
4b2414d04e9912 Chao Yu          2017-08-08  727  		case Opt_offprjjquota:
4b2414d04e9912 Chao Yu          2017-08-08  728  			ret =3D f2fs_clear_qf_n=
ame(sb, PRJQUOTA);
4b2414d04e9912 Chao Yu          2017-08-08  729  			if (ret)
4b2414d04e9912 Chao Yu          2017-08-08  730  				return ret;
4b2414d04e9912 Chao Yu          2017-08-08  731  			break;
4b2414d04e9912 Chao Yu          2017-08-08  732  		case Opt_jqfmt_vfsold:
63189b785960c3 Chao Yu          2018-03-08  733  			F2FS_OPTION(sbi).s_jquo=
ta_fmt =3D QFMT_VFS_OLD;
4b2414d04e9912 Chao Yu          2017-08-08  734  			break;
4b2414d04e9912 Chao Yu          2017-08-08  735  		case Opt_jqfmt_vfsv0:
63189b785960c3 Chao Yu          2018-03-08  736  			F2FS_OPTION(sbi).s_jquo=
ta_fmt =3D QFMT_VFS_V0;
4b2414d04e9912 Chao Yu          2017-08-08  737  			break;
4b2414d04e9912 Chao Yu          2017-08-08  738  		case Opt_jqfmt_vfsv1:
63189b785960c3 Chao Yu          2018-03-08  739  			F2FS_OPTION(sbi).s_jquo=
ta_fmt =3D QFMT_VFS_V1;
4b2414d04e9912 Chao Yu          2017-08-08  740  			break;
4b2414d04e9912 Chao Yu          2017-08-08  741  		case Opt_noquota:
4b2414d04e9912 Chao Yu          2017-08-08  742  			clear_opt(sbi, QUOTA);
4b2414d04e9912 Chao Yu          2017-08-08  743  			clear_opt(sbi, USRQUOTA=
);
4b2414d04e9912 Chao Yu          2017-08-08  744  			clear_opt(sbi, GRPQUOTA=
);
4b2414d04e9912 Chao Yu          2017-08-08  745  			clear_opt(sbi, PRJQUOTA=
);
4b2414d04e9912 Chao Yu          2017-08-08  746  			break;
0abd675e97e60d Chao Yu          2017-07-09  747  #else
4b2414d04e9912 Chao Yu          2017-08-08  748  		case Opt_quota:
0abd675e97e60d Chao Yu          2017-07-09  749  		case Opt_usrquota:
0abd675e97e60d Chao Yu          2017-07-09  750  		case Opt_grpquota:
5c57132eaf5265 Chao Yu          2017-07-26  751  		case Opt_prjquota:
4b2414d04e9912 Chao Yu          2017-08-08  752  		case Opt_usrjquota:
4b2414d04e9912 Chao Yu          2017-08-08  753  		case Opt_grpjquota:
4b2414d04e9912 Chao Yu          2017-08-08  754  		case Opt_prjjquota:
4b2414d04e9912 Chao Yu          2017-08-08  755  		case Opt_offusrjquota:
4b2414d04e9912 Chao Yu          2017-08-08  756  		case Opt_offgrpjquota:
4b2414d04e9912 Chao Yu          2017-08-08  757  		case Opt_offprjjquota:
4b2414d04e9912 Chao Yu          2017-08-08  758  		case Opt_jqfmt_vfsold:
4b2414d04e9912 Chao Yu          2017-08-08  759  		case Opt_jqfmt_vfsv0:
4b2414d04e9912 Chao Yu          2017-08-08  760  		case Opt_jqfmt_vfsv1:
4b2414d04e9912 Chao Yu          2017-08-08  761  		case Opt_noquota:
dcbb4c10e6d969 Joe Perches      2019-06-18  762  			f2fs_info(sbi, "quota o=
perations not supported");
0abd675e97e60d Chao Yu          2017-07-09  763  			break;
0abd675e97e60d Chao Yu          2017-07-09  764  #endif
0cdd31953967b2 Hyunchul Lee     2018-01-31  765  		case Opt_whint:
0cdd31953967b2 Hyunchul Lee     2018-01-31  766  			name =3D match_strdup(&=
args[0]);
0cdd31953967b2 Hyunchul Lee     2018-01-31  767  			if (!name)
0cdd31953967b2 Hyunchul Lee     2018-01-31  768  				return -ENOMEM;
0cdd31953967b2 Hyunchul Lee     2018-01-31  769  			if (strlen(name) =3D=3D=
 10 &&
0cdd31953967b2 Hyunchul Lee     2018-01-31  770  					!strncmp(name, "user-=
based", 10)) {
63189b785960c3 Chao Yu          2018-03-08  771  				F2FS_OPTION(sbi).whint=
_mode =3D WHINT_MODE_USER;
0cdd31953967b2 Hyunchul Lee     2018-01-31  772  			} else if (strlen(name)=
 =3D=3D 3 &&
0cdd31953967b2 Hyunchul Lee     2018-01-31  773  					!strncmp(name, "off",=
 3)) {
63189b785960c3 Chao Yu          2018-03-08  774  				F2FS_OPTION(sbi).whint=
_mode =3D WHINT_MODE_OFF;
f2e703f9a3caa9 Hyunchul Lee     2018-01-31  775  			} else if (strlen(name)=
 =3D=3D 8 &&
f2e703f9a3caa9 Hyunchul Lee     2018-01-31  776  					!strncmp(name, "fs-ba=
sed", 8)) {
63189b785960c3 Chao Yu          2018-03-08  777  				F2FS_OPTION(sbi).whint=
_mode =3D WHINT_MODE_FS;
0cdd31953967b2 Hyunchul Lee     2018-01-31  778  			} else {
5222595d093ebe Jaegeuk Kim      2018-12-13  779  				kvfree(name);
0cdd31953967b2 Hyunchul Lee     2018-01-31  780  				return -EINVAL;
0cdd31953967b2 Hyunchul Lee     2018-01-31  781  			}
5222595d093ebe Jaegeuk Kim      2018-12-13  782  			kvfree(name);
0cdd31953967b2 Hyunchul Lee     2018-01-31  783  			break;
079396270b0f1e Jaegeuk Kim      2018-02-18  784  		case Opt_alloc:
079396270b0f1e Jaegeuk Kim      2018-02-18  785  			name =3D match_strdup(&=
args[0]);
079396270b0f1e Jaegeuk Kim      2018-02-18  786  			if (!name)
079396270b0f1e Jaegeuk Kim      2018-02-18  787  				return -ENOMEM;
079396270b0f1e Jaegeuk Kim      2018-02-18  788  =

079396270b0f1e Jaegeuk Kim      2018-02-18  789  			if (strlen(name) =3D=3D=
 7 &&
079396270b0f1e Jaegeuk Kim      2018-02-18  790  					!strncmp(name, "defau=
lt", 7)) {
63189b785960c3 Chao Yu          2018-03-08  791  				F2FS_OPTION(sbi).alloc=
_mode =3D ALLOC_MODE_DEFAULT;
079396270b0f1e Jaegeuk Kim      2018-02-18  792  			} else if (strlen(name)=
 =3D=3D 5 &&
079396270b0f1e Jaegeuk Kim      2018-02-18  793  					!strncmp(name, "reuse=
", 5)) {
63189b785960c3 Chao Yu          2018-03-08  794  				F2FS_OPTION(sbi).alloc=
_mode =3D ALLOC_MODE_REUSE;
079396270b0f1e Jaegeuk Kim      2018-02-18  795  			} else {
5222595d093ebe Jaegeuk Kim      2018-12-13  796  				kvfree(name);
079396270b0f1e Jaegeuk Kim      2018-02-18  797  				return -EINVAL;
079396270b0f1e Jaegeuk Kim      2018-02-18  798  			}
5222595d093ebe Jaegeuk Kim      2018-12-13  799  			kvfree(name);
079396270b0f1e Jaegeuk Kim      2018-02-18  800  			break;
93cf93f17c8ef7 Junling Zheng    2018-03-07  801  		case Opt_fsync:
93cf93f17c8ef7 Junling Zheng    2018-03-07  802  			name =3D match_strdup(&=
args[0]);
93cf93f17c8ef7 Junling Zheng    2018-03-07  803  			if (!name)
93cf93f17c8ef7 Junling Zheng    2018-03-07  804  				return -ENOMEM;
93cf93f17c8ef7 Junling Zheng    2018-03-07  805  			if (strlen(name) =3D=3D=
 5 &&
93cf93f17c8ef7 Junling Zheng    2018-03-07  806  					!strncmp(name, "posix=
", 5)) {
63189b785960c3 Chao Yu          2018-03-08  807  				F2FS_OPTION(sbi).fsync=
_mode =3D FSYNC_MODE_POSIX;
93cf93f17c8ef7 Junling Zheng    2018-03-07  808  			} else if (strlen(name)=
 =3D=3D 6 &&
93cf93f17c8ef7 Junling Zheng    2018-03-07  809  					!strncmp(name, "stric=
t", 6)) {
63189b785960c3 Chao Yu          2018-03-08  810  				F2FS_OPTION(sbi).fsync=
_mode =3D FSYNC_MODE_STRICT;
d6290814b018aa Jaegeuk Kim      2018-05-25  811  			} else if (strlen(name)=
 =3D=3D 9 &&
d6290814b018aa Jaegeuk Kim      2018-05-25  812  					!strncmp(name, "nobar=
rier", 9)) {
d6290814b018aa Jaegeuk Kim      2018-05-25  813  				F2FS_OPTION(sbi).fsync=
_mode =3D
d6290814b018aa Jaegeuk Kim      2018-05-25  814  							FSYNC_MODE_NOBARRIE=
R;
93cf93f17c8ef7 Junling Zheng    2018-03-07  815  			} else {
5222595d093ebe Jaegeuk Kim      2018-12-13  816  				kvfree(name);
93cf93f17c8ef7 Junling Zheng    2018-03-07  817  				return -EINVAL;
93cf93f17c8ef7 Junling Zheng    2018-03-07  818  			}
5222595d093ebe Jaegeuk Kim      2018-12-13  819  			kvfree(name);
93cf93f17c8ef7 Junling Zheng    2018-03-07  820  			break;
ff62af200b94e0 Sheng Yong       2018-03-15  821  		case Opt_test_dummy_encr=
yption:
0f065e5bfd243d Eric Biggers     2020-05-11 @822  			ret =3D f2fs_set_test_d=
ummy_encryption(sb, p, &args[0],
0f065e5bfd243d Eric Biggers     2020-05-11  823  							     is_remount);
0f065e5bfd243d Eric Biggers     2020-05-11  824  			if (ret)
0f065e5bfd243d Eric Biggers     2020-05-11  825  				return ret;
ff62af200b94e0 Sheng Yong       2018-03-15  826  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  827  		case Opt_checkpoint_disa=
ble_cap_perc:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  828  			if (args->from && match=
_int(args, &arg))
4d3aed70902f29 Daniel Rosenberg 2019-05-29  829  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  830  			if (arg < 0 || arg > 10=
0)
4d3aed70902f29 Daniel Rosenberg 2019-05-29  831  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  832  			if (arg =3D=3D 100)
4d3aed70902f29 Daniel Rosenberg 2019-05-29  833  				F2FS_OPTION(sbi).unusa=
ble_cap =3D
4d3aed70902f29 Daniel Rosenberg 2019-05-29  834  					sbi->user_block_count;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  835  			else
4d3aed70902f29 Daniel Rosenberg 2019-05-29  836  				F2FS_OPTION(sbi).unusa=
ble_cap =3D
4d3aed70902f29 Daniel Rosenberg 2019-05-29  837  					(sbi->user_block_coun=
t / 100) *	arg;
4354994f097d06 Daniel Rosenberg 2018-08-20  838  			set_opt(sbi, DISABLE_CH=
ECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  839  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  840  		case Opt_checkpoint_disa=
ble_cap:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  841  			if (args->from && match=
_int(args, &arg))
4354994f097d06 Daniel Rosenberg 2018-08-20  842  				return -EINVAL;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  843  			F2FS_OPTION(sbi).unusab=
le_cap =3D arg;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  844  			set_opt(sbi, DISABLE_CH=
ECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  845  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  846  		case Opt_checkpoint_disa=
ble:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  847  			set_opt(sbi, DISABLE_CH=
ECKPOINT);
4d3aed70902f29 Daniel Rosenberg 2019-05-29  848  			break;
4d3aed70902f29 Daniel Rosenberg 2019-05-29  849  		case Opt_checkpoint_enab=
le:
4d3aed70902f29 Daniel Rosenberg 2019-05-29  850  			clear_opt(sbi, DISABLE_=
CHECKPOINT);
4354994f097d06 Daniel Rosenberg 2018-08-20  851  			break;
4c8ff7095bef64 Chao Yu          2019-11-01  852  		case Opt_compress_algori=
thm:
4c8ff7095bef64 Chao Yu          2019-11-01  853  			if (!f2fs_sb_has_compre=
ssion(sbi)) {
4c8ff7095bef64 Chao Yu          2019-11-01  854  				f2fs_err(sbi, "Compres=
sion feature if off");
4c8ff7095bef64 Chao Yu          2019-11-01  855  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  856  			}
4c8ff7095bef64 Chao Yu          2019-11-01  857  			name =3D match_strdup(&=
args[0]);
4c8ff7095bef64 Chao Yu          2019-11-01  858  			if (!name)
4c8ff7095bef64 Chao Yu          2019-11-01  859  				return -ENOMEM;
4c8ff7095bef64 Chao Yu          2019-11-01  860  			if (strlen(name) =3D=3D=
 3 && !strcmp(name, "lzo")) {
4c8ff7095bef64 Chao Yu          2019-11-01  861  				F2FS_OPTION(sbi).compr=
ess_algorithm =3D
4c8ff7095bef64 Chao Yu          2019-11-01  862  								COMPRESS_LZO;
4c8ff7095bef64 Chao Yu          2019-11-01  863  			} else if (strlen(name)=
 =3D=3D 3 &&
4c8ff7095bef64 Chao Yu          2019-11-01  864  					!strcmp(name, "lz4"))=
 {
4c8ff7095bef64 Chao Yu          2019-11-01  865  				F2FS_OPTION(sbi).compr=
ess_algorithm =3D
4c8ff7095bef64 Chao Yu          2019-11-01  866  								COMPRESS_LZ4;
50cfa66f0de02e Chao Yu          2020-03-03  867  			} else if (strlen(name)=
 =3D=3D 4 &&
50cfa66f0de02e Chao Yu          2020-03-03  868  					!strcmp(name, "zstd")=
) {
50cfa66f0de02e Chao Yu          2020-03-03  869  				F2FS_OPTION(sbi).compr=
ess_algorithm =3D
50cfa66f0de02e Chao Yu          2020-03-03  870  								COMPRESS_ZSTD;
4c8ff7095bef64 Chao Yu          2019-11-01  871  			} else {
4c8ff7095bef64 Chao Yu          2019-11-01  872  				kfree(name);
4c8ff7095bef64 Chao Yu          2019-11-01  873  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  874  			}
4c8ff7095bef64 Chao Yu          2019-11-01  875  			kfree(name);
4c8ff7095bef64 Chao Yu          2019-11-01  876  			break;
4c8ff7095bef64 Chao Yu          2019-11-01  877  		case Opt_compress_log_si=
ze:
4c8ff7095bef64 Chao Yu          2019-11-01  878  			if (!f2fs_sb_has_compre=
ssion(sbi)) {
4c8ff7095bef64 Chao Yu          2019-11-01  879  				f2fs_err(sbi, "Compres=
sion feature is off");
4c8ff7095bef64 Chao Yu          2019-11-01  880  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  881  			}
4c8ff7095bef64 Chao Yu          2019-11-01  882  			if (args->from && match=
_int(args, &arg))
4c8ff7095bef64 Chao Yu          2019-11-01  883  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  884  			if (arg < MIN_COMPRESS_=
LOG_SIZE ||
4c8ff7095bef64 Chao Yu          2019-11-01  885  				arg > MAX_COMPRESS_LOG=
_SIZE) {
4c8ff7095bef64 Chao Yu          2019-11-01  886  				f2fs_err(sbi,
4c8ff7095bef64 Chao Yu          2019-11-01  887  					"Compress cluster log=
 size is out of range");
4c8ff7095bef64 Chao Yu          2019-11-01  888  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  889  			}
4c8ff7095bef64 Chao Yu          2019-11-01  890  			F2FS_OPTION(sbi).compre=
ss_log_size =3D arg;
4c8ff7095bef64 Chao Yu          2019-11-01  891  			break;
4c8ff7095bef64 Chao Yu          2019-11-01  892  		case Opt_compress_extens=
ion:
4c8ff7095bef64 Chao Yu          2019-11-01  893  			if (!f2fs_sb_has_compre=
ssion(sbi)) {
4c8ff7095bef64 Chao Yu          2019-11-01  894  				f2fs_err(sbi, "Compres=
sion feature is off");
4c8ff7095bef64 Chao Yu          2019-11-01  895  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  896  			}
4c8ff7095bef64 Chao Yu          2019-11-01  897  			name =3D match_strdup(&=
args[0]);
4c8ff7095bef64 Chao Yu          2019-11-01  898  			if (!name)
4c8ff7095bef64 Chao Yu          2019-11-01  899  				return -ENOMEM;
4c8ff7095bef64 Chao Yu          2019-11-01  900  =

4c8ff7095bef64 Chao Yu          2019-11-01  901  			ext =3D F2FS_OPTION(sbi=
).extensions;
4c8ff7095bef64 Chao Yu          2019-11-01  902  			ext_cnt =3D F2FS_OPTION=
(sbi).compress_ext_cnt;
4c8ff7095bef64 Chao Yu          2019-11-01  903  =

4c8ff7095bef64 Chao Yu          2019-11-01  904  			if (strlen(name) >=3D F=
2FS_EXTENSION_LEN ||
4c8ff7095bef64 Chao Yu          2019-11-01  905  				ext_cnt >=3D COMPRESS_=
EXT_NUM) {
4c8ff7095bef64 Chao Yu          2019-11-01  906  				f2fs_err(sbi,
4c8ff7095bef64 Chao Yu          2019-11-01  907  					"invalid extension le=
ngth/number");
4c8ff7095bef64 Chao Yu          2019-11-01  908  				kfree(name);
4c8ff7095bef64 Chao Yu          2019-11-01  909  				return -EINVAL;
4c8ff7095bef64 Chao Yu          2019-11-01  910  			}
4c8ff7095bef64 Chao Yu          2019-11-01  911  =

4c8ff7095bef64 Chao Yu          2019-11-01  912  			strcpy(ext[ext_cnt], na=
me);
4c8ff7095bef64 Chao Yu          2019-11-01  913  			F2FS_OPTION(sbi).compre=
ss_ext_cnt++;
4c8ff7095bef64 Chao Yu          2019-11-01  914  			kfree(name);
4c8ff7095bef64 Chao Yu          2019-11-01  915  			break;
696c018c7718f5 Namjae Jeon      2013-06-16  916  		default:
dcbb4c10e6d969 Joe Perches      2019-06-18  917  			f2fs_err(sbi, "Unrecogn=
ized mount option \"%s\" or missing value",
696c018c7718f5 Namjae Jeon      2013-06-16  918  				 p);
696c018c7718f5 Namjae Jeon      2013-06-16  919  			return -EINVAL;
696c018c7718f5 Namjae Jeon      2013-06-16  920  		}
696c018c7718f5 Namjae Jeon      2013-06-16  921  	}
4b2414d04e9912 Chao Yu          2017-08-08  922  #ifdef CONFIG_QUOTA
4b2414d04e9912 Chao Yu          2017-08-08  923  	if (f2fs_check_quota_opti=
ons(sbi))
4b2414d04e9912 Chao Yu          2017-08-08  924  		return -EINVAL;
00960c2cd8f169 Sheng Yong       2018-07-24  925  #else
7beb01f74415c5 Chao Yu          2018-10-24  926  	if (f2fs_sb_has_quota_ino=
(sbi) && !f2fs_readonly(sbi->sb)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  927  		f2fs_info(sbi, "Filesyst=
em with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
00960c2cd8f169 Sheng Yong       2018-07-24  928  		return -EINVAL;
00960c2cd8f169 Sheng Yong       2018-07-24  929  	}
7beb01f74415c5 Chao Yu          2018-10-24  930  	if (f2fs_sb_has_project_q=
uota(sbi) && !f2fs_readonly(sbi->sb)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  931  		f2fs_err(sbi, "Filesyste=
m with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
4ddc1b28aac57a Chao Yu          2018-07-26  932  		return -EINVAL;
4ddc1b28aac57a Chao Yu          2018-07-26  933  	}
4b2414d04e9912 Chao Yu          2017-08-08  934  #endif
5aba54302a46fd Daniel Rosenberg 2019-07-23  935  #ifndef CONFIG_UNICODE
5aba54302a46fd Daniel Rosenberg 2019-07-23  936  	if (f2fs_sb_has_casefold(=
sbi)) {
5aba54302a46fd Daniel Rosenberg 2019-07-23  937  		f2fs_err(sbi,
5aba54302a46fd Daniel Rosenberg 2019-07-23  938  			"Filesystem with casefo=
ld feature cannot be mounted without CONFIG_UNICODE");
5aba54302a46fd Daniel Rosenberg 2019-07-23  939  		return -EINVAL;
5aba54302a46fd Daniel Rosenberg 2019-07-23  940  	}
5aba54302a46fd Daniel Rosenberg 2019-07-23  941  #endif
ec91538dccd443 Jaegeuk Kim      2016-12-21  942  =

b0332a0f957ca8 Chao Yu          2020-02-14  943  	if (F2FS_IO_SIZE_BITS(sbi=
) && !f2fs_lfs_mode(sbi)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  944  		f2fs_err(sbi, "Should se=
t mode=3Dlfs with %uKB-sized IO",
ec91538dccd443 Jaegeuk Kim      2016-12-21  945  			 F2FS_IO_SIZE_KB(sbi));
ec91538dccd443 Jaegeuk Kim      2016-12-21  946  		return -EINVAL;
ec91538dccd443 Jaegeuk Kim      2016-12-21  947  	}
6afc662e68b5f9 Chao Yu          2017-09-06  948  =

6afc662e68b5f9 Chao Yu          2017-09-06  949  	if (test_opt(sbi, INLINE_=
XATTR_SIZE)) {
70db5b04cbe19e Jaegeuk Kim      2019-03-12  950  		int min_size, max_size;
70db5b04cbe19e Jaegeuk Kim      2019-03-12  951  =

7beb01f74415c5 Chao Yu          2018-10-24  952  		if (!f2fs_sb_has_extra_a=
ttr(sbi) ||
7beb01f74415c5 Chao Yu          2018-10-24  953  			!f2fs_sb_has_flexible_i=
nline_xattr(sbi)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  954  			f2fs_err(sbi, "extra_at=
tr or flexible_inline_xattr feature is off");
4d817ae099883b Chao Yu          2018-01-27  955  			return -EINVAL;
4d817ae099883b Chao Yu          2018-01-27  956  		}
6afc662e68b5f9 Chao Yu          2017-09-06  957  		if (!test_opt(sbi, INLIN=
E_XATTR)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  958  			f2fs_err(sbi, "inline_x=
attr_size option should be set with inline_xattr option");
6afc662e68b5f9 Chao Yu          2017-09-06  959  			return -EINVAL;
6afc662e68b5f9 Chao Yu          2017-09-06  960  		}
70db5b04cbe19e Jaegeuk Kim      2019-03-12  961  =

70db5b04cbe19e Jaegeuk Kim      2019-03-12  962  		min_size =3D sizeof(stru=
ct f2fs_xattr_header) / sizeof(__le32);
dd6c89b5f2b93c Chao Yu          2019-03-04  963  		max_size =3D MAX_INLINE_=
XATTR_SIZE;
70db5b04cbe19e Jaegeuk Kim      2019-03-12  964  =

70db5b04cbe19e Jaegeuk Kim      2019-03-12  965  		if (F2FS_OPTION(sbi).inl=
ine_xattr_size < min_size ||
70db5b04cbe19e Jaegeuk Kim      2019-03-12  966  				F2FS_OPTION(sbi).inlin=
e_xattr_size > max_size) {
dcbb4c10e6d969 Joe Perches      2019-06-18  967  			f2fs_err(sbi, "inline x=
attr size is out of range: %d ~ %d",
70db5b04cbe19e Jaegeuk Kim      2019-03-12  968  				 min_size, max_size);
6afc662e68b5f9 Chao Yu          2017-09-06  969  			return -EINVAL;
6afc662e68b5f9 Chao Yu          2017-09-06  970  		}
6afc662e68b5f9 Chao Yu          2017-09-06  971  	}
0cdd31953967b2 Hyunchul Lee     2018-01-31  972  =

b0332a0f957ca8 Chao Yu          2020-02-14  973  	if (test_opt(sbi, DISABLE=
_CHECKPOINT) && f2fs_lfs_mode(sbi)) {
dcbb4c10e6d969 Joe Perches      2019-06-18  974  		f2fs_err(sbi, "LFS not c=
ompatible with checkpoint=3Ddisable\n");
4354994f097d06 Daniel Rosenberg 2018-08-20  975  		return -EINVAL;
4354994f097d06 Daniel Rosenberg 2018-08-20  976  	}
4354994f097d06 Daniel Rosenberg 2018-08-20  977  =

0cdd31953967b2 Hyunchul Lee     2018-01-31  978  	/* Not pass down write hi=
nts if the number of active logs is lesser
0cdd31953967b2 Hyunchul Lee     2018-01-31  979  	 * than NR_CURSEG_TYPE.
0cdd31953967b2 Hyunchul Lee     2018-01-31  980  	 */
63189b785960c3 Chao Yu          2018-03-08  981  	if (F2FS_OPTION(sbi).acti=
ve_logs !=3D NR_CURSEG_TYPE)
63189b785960c3 Chao Yu          2018-03-08  982  		F2FS_OPTION(sbi).whint_m=
ode =3D WHINT_MODE_OFF;
696c018c7718f5 Namjae Jeon      2013-06-16  983  	return 0;
696c018c7718f5 Namjae Jeon      2013-06-16  984  }
696c018c7718f5 Namjae Jeon      2013-06-16  985  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4243274211568663672==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4243274211568663672==--

