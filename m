Content-Type: multipart/mixed; boundary="===============5207239506633674020=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:dev/auth-hash 158/162] fs/btrfs/super.c:608:29: sparse: sparse: shift too big (32) for type int
Date: Thu, 18 Feb 2021 07:57:21 +0800
Message-ID: <202102180704.TAiUBs4i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5207239506633674020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git dev/auth-hash
head:   212f7564065bdfda0a55ab1ef52a4868572359de
commit: 13be51617b056261da9212d109c77311a895bb6f [158/162] btrfs: add authe=
ntication support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: alpha-randconfig-s031-20210217 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-215-g0fb77bb6-dirty
        # https://github.com/kdave/btrfs-devel/commit/13be51617b056261da921=
2d109c77311a895bb6f
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel dev/auth-hash
        git checkout 13be51617b056261da9212d109c77311a895bb6f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dalpha =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> fs/btrfs/super.c:608:29: sparse: sparse: shift too big (32) for type int
   fs/btrfs/super.c:1127:17: sparse: sparse: shift too big (32) for type int
   fs/btrfs/super.c:1574:13: sparse: sparse: shift too big (32) for type int
--
>> fs/btrfs/disk-io.c:2321:14: sparse: sparse: shift too big (32) for type =
int
--
>> fs/btrfs/ioctl.c:271:21: sparse: sparse: shift too big (32) for type int

vim +608 fs/btrfs/super.c

74ef00185eb864 Qu Wenruo             2020-06-04   547  =

edf24abe51493c Christoph Hellwig     2008-06-10   548  /*
edf24abe51493c Christoph Hellwig     2008-06-10   549   * Regular mount opt=
ions parser.  Everything that is needed only when
edf24abe51493c Christoph Hellwig     2008-06-10   550   * reading in a new =
superblock is parsed here.
49b25e0540904b Jeff Mahoney          2012-03-01   551   * XXX JDM: This nee=
ds to be cleaned up for remount.
edf24abe51493c Christoph Hellwig     2008-06-10   552   */
2ff7e61e0d30ff Jeff Mahoney          2016-06-22   553  int btrfs_parse_opti=
ons(struct btrfs_fs_info *info, char *options,
96da09192cda57 Qu Wenruo             2016-01-19   554  			unsigned long new=
_flags)
95e0528919cb0c Chris Mason           2007-08-29   555  {
95e0528919cb0c Chris Mason           2007-08-29   556  	substring_t args[MA=
X_OPT_ARGS];
e215772cd2abcf Misono, Tomohiro      2017-12-14   557  	char *p, *num;
4543df7ecc8ae4 Chris Mason           2008-06-11   558  	int intarg;
a7a3f7cadd9bde Sage Weil             2009-11-07   559  	int ret =3D 0;
261507a02ccba9 Li Zefan              2010-12-17   560  	char *compress_type;
261507a02ccba9 Li Zefan              2010-12-17   561  	bool compress_force=
 =3D false;
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   562  	enum btrfs_compress=
ion_type saved_compress_type;
27942c9971cc40 David Sterba          2020-07-23   563  	int saved_compress_=
level;
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   564  	bool saved_compress=
_force;
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   565  	int no_compress =3D=
 0;
b6cda9bcb4df75 Chris Mason           2007-12-14   566  =

0b246afa62b0cf Jeff Mahoney          2016-06-22   567  	if (btrfs_fs_compat=
_ro(info, FREE_SPACE_TREE))
70f6d82ec73c3a Omar Sandoval         2015-09-29   568  		btrfs_set_opt(info=
->mount_opt, FREE_SPACE_TREE);
948462294577a3 Boris Burkov          2020-11-18   569  	else if (btrfs_free=
_space_cache_v1_active(info)) {
5d1ab66c56fed1 Naohiro Aota          2020-11-10   570  		if (btrfs_is_zoned=
(info)) {
5d1ab66c56fed1 Naohiro Aota          2020-11-10   571  			btrfs_info(info,
5d1ab66c56fed1 Naohiro Aota          2020-11-10   572  			"zoned: clearing =
existing space cache");
5d1ab66c56fed1 Naohiro Aota          2020-11-10   573  			btrfs_set_super_c=
ache_generation(info->super_copy, 0);
5d1ab66c56fed1 Naohiro Aota          2020-11-10   574  		} else {
73bc187680f94b Josef Bacik           2011-10-03   575  			btrfs_set_opt(inf=
o->mount_opt, SPACE_CACHE);
5d1ab66c56fed1 Naohiro Aota          2020-11-10   576  		}
5d1ab66c56fed1 Naohiro Aota          2020-11-10   577  	}
73bc187680f94b Josef Bacik           2011-10-03   578  =

96da09192cda57 Qu Wenruo             2016-01-19   579  	/*
96da09192cda57 Qu Wenruo             2016-01-19   580  	 * Even the options=
 are empty, we still need to do extra check
96da09192cda57 Qu Wenruo             2016-01-19   581  	 * against new flags
96da09192cda57 Qu Wenruo             2016-01-19   582  	 */
95e0528919cb0c Chris Mason           2007-08-29   583  	if (!options)
96da09192cda57 Qu Wenruo             2016-01-19   584  		goto check;
95e0528919cb0c Chris Mason           2007-08-29   585  =

95e0528919cb0c Chris Mason           2007-08-29   586  	while ((p =3D strse=
p(&options, ",")) !=3D NULL) {
95e0528919cb0c Chris Mason           2007-08-29   587  		int token;
95e0528919cb0c Chris Mason           2007-08-29   588  		if (!*p)
95e0528919cb0c Chris Mason           2007-08-29   589  			continue;
95e0528919cb0c Chris Mason           2007-08-29   590  =

95e0528919cb0c Chris Mason           2007-08-29   591  		token =3D match_to=
ken(p, tokens, args);
95e0528919cb0c Chris Mason           2007-08-29   592  		switch (token) {
dfe25020689bb2 Chris Mason           2008-05-13   593  		case Opt_degraded:
0b246afa62b0cf Jeff Mahoney          2016-06-22   594  			btrfs_info(info, =
"allowing degraded mounts");
dfe25020689bb2 Chris Mason           2008-05-13   595  			btrfs_set_opt(inf=
o->mount_opt, DEGRADED);
dfe25020689bb2 Chris Mason           2008-05-13   596  			break;
95e0528919cb0c Chris Mason           2007-08-29   597  		case Opt_subvol:
37becec95ac31b Omar Sandoval         2018-05-21   598  		case Opt_subvol_em=
pty:
73f73415caddbc Josef Bacik           2009-12-04   599  		case Opt_subvolid:
43e570b08a6c6b Christoph Hellwig     2008-06-10   600  		case Opt_device:
edf24abe51493c Christoph Hellwig     2008-06-10   601  			/*
39df2a4b231747 Johannes Thumshirn    2020-05-14   602  			 * These are pars=
ed by btrfs_parse_subvol_options
39df2a4b231747 Johannes Thumshirn    2020-05-14   603  			 * and btrfs_pars=
e_early_options
39df2a4b231747 Johannes Thumshirn    2020-05-14   604  			 * and can be hap=
pily ignored here.
edf24abe51493c Christoph Hellwig     2008-06-10   605  			 */
95e0528919cb0c Chris Mason           2007-08-29   606  			break;
b6cda9bcb4df75 Chris Mason           2007-12-14   607  		case Opt_nodatasum:
13be51617b0562 Johannes Thumshirn    2020-05-14  @608  			if (btrfs_test_op=
t(info, AUTH_KEY)) {
13be51617b0562 Johannes Thumshirn    2020-05-14   609  				btrfs_info(info,
13be51617b0562 Johannes Thumshirn    2020-05-14   610  					   "nodatasum n=
ot supported on an authnticated file-system");
13be51617b0562 Johannes Thumshirn    2020-05-14   611  				break;
13be51617b0562 Johannes Thumshirn    2020-05-14   612  			}
3cdde2240d4533 Jeff Mahoney          2016-06-09   613  			btrfs_set_and_inf=
o(info, NODATASUM,
078025347c8ed4 Qu Wenruo             2014-01-13   614  					   "setting nod=
atasum");
be20aa9dbadc8c Chris Mason           2007-12-17   615  			break;
d399167d88ea53 Qu Wenruo             2014-01-06   616  		case Opt_datasum:
3cdde2240d4533 Jeff Mahoney          2016-06-09   617  			if (btrfs_test_op=
t(info, NODATASUM)) {
3cdde2240d4533 Jeff Mahoney          2016-06-09   618  				if (btrfs_test_o=
pt(info, NODATACOW))
0b246afa62b0cf Jeff Mahoney          2016-06-22   619  					btrfs_info(info,
5d163e0e68ce74 Jeff Mahoney          2016-09-20   620  						   "setting da=
tasum, datacow enabled");
d399167d88ea53 Qu Wenruo             2014-01-06   621  				else
0b246afa62b0cf Jeff Mahoney          2016-06-22   622  					btrfs_info(info=
, "setting datasum");
078025347c8ed4 Qu Wenruo             2014-01-13   623  			}
d399167d88ea53 Qu Wenruo             2014-01-06   624  			btrfs_clear_opt(i=
nfo->mount_opt, NODATACOW);
d399167d88ea53 Qu Wenruo             2014-01-06   625  			btrfs_clear_opt(i=
nfo->mount_opt, NODATASUM);
d399167d88ea53 Qu Wenruo             2014-01-06   626  			break;
be20aa9dbadc8c Chris Mason           2007-12-17   627  		case Opt_nodatacow:
13be51617b0562 Johannes Thumshirn    2020-05-14   628  			if (btrfs_test_op=
t(info, AUTH_KEY)) {
13be51617b0562 Johannes Thumshirn    2020-05-14   629  				btrfs_info(info,
13be51617b0562 Johannes Thumshirn    2020-05-14   630  					   "nodatacow n=
ot supported on an authnticated file-system");
13be51617b0562 Johannes Thumshirn    2020-05-14   631  				break;
13be51617b0562 Johannes Thumshirn    2020-05-14   632  			}
3cdde2240d4533 Jeff Mahoney          2016-06-09   633  			if (!btrfs_test_o=
pt(info, NODATACOW)) {
3cdde2240d4533 Jeff Mahoney          2016-06-09   634  				if (!btrfs_test_=
opt(info, COMPRESS) ||
3cdde2240d4533 Jeff Mahoney          2016-06-09   635  				    !btrfs_test_=
opt(info, FORCE_COMPRESS)) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   636  					btrfs_info(info,
efe120a067c867 Frank Holton          2013-12-20   637  						   "setting no=
datacow, compression disabled");
bedb2cca7252d0 Andrei Popa           2012-09-20   638  				} else {
0b246afa62b0cf Jeff Mahoney          2016-06-22   639  					btrfs_info(info=
, "setting nodatacow");
bedb2cca7252d0 Andrei Popa           2012-09-20   640  				}
078025347c8ed4 Qu Wenruo             2014-01-13   641  			}
bedb2cca7252d0 Andrei Popa           2012-09-20   642  			btrfs_clear_opt(i=
nfo->mount_opt, COMPRESS);
bedb2cca7252d0 Andrei Popa           2012-09-20   643  			btrfs_clear_opt(i=
nfo->mount_opt, FORCE_COMPRESS);
be20aa9dbadc8c Chris Mason           2007-12-17   644  			btrfs_set_opt(inf=
o->mount_opt, NODATACOW);
b6cda9bcb4df75 Chris Mason           2007-12-14   645  			btrfs_set_opt(inf=
o->mount_opt, NODATASUM);
b6cda9bcb4df75 Chris Mason           2007-12-14   646  			break;
a258af7a3e395a Qu Wenruo             2014-01-06   647  		case Opt_datacow:
3cdde2240d4533 Jeff Mahoney          2016-06-09   648  			btrfs_clear_and_i=
nfo(info, NODATACOW,
078025347c8ed4 Qu Wenruo             2014-01-13   649  					     "setting d=
atacow");
a258af7a3e395a Qu Wenruo             2014-01-06   650  			break;
261507a02ccba9 Li Zefan              2010-12-17   651  		case Opt_compress_=
force:
261507a02ccba9 Li Zefan              2010-12-17   652  		case Opt_compress_=
force_type:
261507a02ccba9 Li Zefan              2010-12-17   653  			compress_force =
=3D true;
c730ae0c6bb312 Marcos Paulo de Souza 2020-06-16   654  			fallthrough;
c8b978188c9a0f Chris Mason           2008-10-29   655  		case Opt_compress:
261507a02ccba9 Li Zefan              2010-12-17   656  		case Opt_compress_=
type:
3cdde2240d4533 Jeff Mahoney          2016-06-09   657  			saved_compress_ty=
pe =3D btrfs_test_opt(info,
3cdde2240d4533 Jeff Mahoney          2016-06-09   658  							     COMPRESS=
) ?
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   659  				info->compress_t=
ype : BTRFS_COMPRESS_NONE;
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   660  			saved_compress_fo=
rce =3D
3cdde2240d4533 Jeff Mahoney          2016-06-09   661  				btrfs_test_opt(i=
nfo, FORCE_COMPRESS);
27942c9971cc40 David Sterba          2020-07-23   662  			saved_compress_le=
vel =3D info->compress_level;
261507a02ccba9 Li Zefan              2010-12-17   663  			if (token =3D=3D =
Opt_compress ||
261507a02ccba9 Li Zefan              2010-12-17   664  			    token =3D=3D =
Opt_compress_force ||
a7164fa4e055da David Sterba          2017-07-17   665  			    strncmp(args[=
0].from, "zlib", 4) =3D=3D 0) {
261507a02ccba9 Li Zefan              2010-12-17   666  				compress_type =
=3D "zlib";
eae8d82529dd98 Qu Wenruo             2017-11-06   667  =

261507a02ccba9 Li Zefan              2010-12-17   668  				info->compress_t=
ype =3D BTRFS_COMPRESS_ZLIB;
eae8d82529dd98 Qu Wenruo             2017-11-06   669  				info->compress_l=
evel =3D BTRFS_ZLIB_DEFAULT_LEVEL;
eae8d82529dd98 Qu Wenruo             2017-11-06   670  				/*
eae8d82529dd98 Qu Wenruo             2017-11-06   671  				 * args[0] conta=
ins uninitialized data since
eae8d82529dd98 Qu Wenruo             2017-11-06   672  				 * for these tok=
ens we don't expect any
eae8d82529dd98 Qu Wenruo             2017-11-06   673  				 * parameter.
eae8d82529dd98 Qu Wenruo             2017-11-06   674  				 */
eae8d82529dd98 Qu Wenruo             2017-11-06   675  				if (token !=3D O=
pt_compress &&
eae8d82529dd98 Qu Wenruo             2017-11-06   676  				    token !=3D O=
pt_compress_force)
f51d2b59120ff3 David Sterba          2017-09-15   677  					info->compress_=
level =3D
d0ab62ce2ded36 Dennis Zhou           2019-02-04   678  					  btrfs_compres=
s_str2level(
d0ab62ce2ded36 Dennis Zhou           2019-02-04   679  							BTRFS_COMPRES=
S_ZLIB,
d0ab62ce2ded36 Dennis Zhou           2019-02-04   680  							args[0].from =
+ 4);
063849eafda03e Arnd Hannemann        2012-04-16   681  				btrfs_set_opt(in=
fo->mount_opt, COMPRESS);
bedb2cca7252d0 Andrei Popa           2012-09-20   682  				btrfs_clear_opt(=
info->mount_opt, NODATACOW);
bedb2cca7252d0 Andrei Popa           2012-09-20   683  				btrfs_clear_opt(=
info->mount_opt, NODATASUM);
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   684  				no_compress =3D =
0;
a7164fa4e055da David Sterba          2017-07-17   685  			} else if (strncm=
p(args[0].from, "lzo", 3) =3D=3D 0) {
a6fa6fae40ec33 Li Zefan              2010-10-25   686  				compress_type =
=3D "lzo";
a6fa6fae40ec33 Li Zefan              2010-10-25   687  				info->compress_t=
ype =3D BTRFS_COMPRESS_LZO;
282dd7d7718444 Marcos Paulo de Souza 2020-08-03   688  				info->compress_l=
evel =3D 0;
063849eafda03e Arnd Hannemann        2012-04-16   689  				btrfs_set_opt(in=
fo->mount_opt, COMPRESS);
bedb2cca7252d0 Andrei Popa           2012-09-20   690  				btrfs_clear_opt(=
info->mount_opt, NODATACOW);
bedb2cca7252d0 Andrei Popa           2012-09-20   691  				btrfs_clear_opt(=
info->mount_opt, NODATASUM);
2b0ce2c2909368 Mitch Harder          2012-07-24   692  				btrfs_set_fs_inc=
ompat(info, COMPRESS_LZO);
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   693  				no_compress =3D =
0;
3f93aef535c8ea Dennis Zhou           2019-02-04   694  			} else if (strncm=
p(args[0].from, "zstd", 4) =3D=3D 0) {
5c1aab1dd5445e Nick Terrell          2017-08-09   695  				compress_type =
=3D "zstd";
5c1aab1dd5445e Nick Terrell          2017-08-09   696  				info->compress_t=
ype =3D BTRFS_COMPRESS_ZSTD;
3f93aef535c8ea Dennis Zhou           2019-02-04   697  				info->compress_l=
evel =3D
3f93aef535c8ea Dennis Zhou           2019-02-04   698  					btrfs_compress_=
str2level(
3f93aef535c8ea Dennis Zhou           2019-02-04   699  							 BTRFS_COMPRE=
SS_ZSTD,
3f93aef535c8ea Dennis Zhou           2019-02-04   700  							 args[0].from=
 + 4);
5c1aab1dd5445e Nick Terrell          2017-08-09   701  				btrfs_set_opt(in=
fo->mount_opt, COMPRESS);
5c1aab1dd5445e Nick Terrell          2017-08-09   702  				btrfs_clear_opt(=
info->mount_opt, NODATACOW);
5c1aab1dd5445e Nick Terrell          2017-08-09   703  				btrfs_clear_opt(=
info->mount_opt, NODATASUM);
5c1aab1dd5445e Nick Terrell          2017-08-09   704  				btrfs_set_fs_inc=
ompat(info, COMPRESS_ZSTD);
5c1aab1dd5445e Nick Terrell          2017-08-09   705  				no_compress =3D =
0;
063849eafda03e Arnd Hannemann        2012-04-16   706  			} else if (strncm=
p(args[0].from, "no", 2) =3D=3D 0) {
063849eafda03e Arnd Hannemann        2012-04-16   707  				compress_type =
=3D "no";
27942c9971cc40 David Sterba          2020-07-23   708  				info->compress_l=
evel =3D 0;
27942c9971cc40 David Sterba          2020-07-23   709  				info->compress_t=
ype =3D 0;
063849eafda03e Arnd Hannemann        2012-04-16   710  				btrfs_clear_opt(=
info->mount_opt, COMPRESS);
063849eafda03e Arnd Hannemann        2012-04-16   711  				btrfs_clear_opt(=
info->mount_opt, FORCE_COMPRESS);
063849eafda03e Arnd Hannemann        2012-04-16   712  				compress_force =
=3D false;
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   713  				no_compress++;
261507a02ccba9 Li Zefan              2010-12-17   714  			} else {
261507a02ccba9 Li Zefan              2010-12-17   715  				ret =3D -EINVAL;
261507a02ccba9 Li Zefan              2010-12-17   716  				goto out;
261507a02ccba9 Li Zefan              2010-12-17   717  			}
261507a02ccba9 Li Zefan              2010-12-17   718  =

261507a02ccba9 Li Zefan              2010-12-17   719  			if (compress_forc=
e) {
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   720  				btrfs_set_opt(in=
fo->mount_opt, FORCE_COMPRESS);
143f3636185584 David Sterba          2014-07-29   721  			} else {
4027e0f4c4b2df Wang Shilong          2014-06-30   722  				/*
4027e0f4c4b2df Wang Shilong          2014-06-30   723  				 * If we remount=
 from compress-force=3Dxxx to
4027e0f4c4b2df Wang Shilong          2014-06-30   724  				 * compress=3Dxx=
x, we need clear FORCE_COMPRESS
4027e0f4c4b2df Wang Shilong          2014-06-30   725  				 * flag, otherwi=
se, there is no way for users
4027e0f4c4b2df Wang Shilong          2014-06-30   726  				 * to disable fo=
rcible compression separately.
4027e0f4c4b2df Wang Shilong          2014-06-30   727  				 */
4027e0f4c4b2df Wang Shilong          2014-06-30   728  				btrfs_clear_opt(=
info->mount_opt, FORCE_COMPRESS);
a7e252af5a819e Miao Xie              2013-11-22   729  			}
27942c9971cc40 David Sterba          2020-07-23   730  			if (no_compress =
=3D=3D 1) {
27942c9971cc40 David Sterba          2020-07-23   731  				btrfs_info(info,=
 "use no compression");
27942c9971cc40 David Sterba          2020-07-23   732  			} else if ((info-=
>compress_type !=3D saved_compress_type) ||
27942c9971cc40 David Sterba          2020-07-23   733  				   (compress_for=
ce !=3D saved_compress_force) ||
27942c9971cc40 David Sterba          2020-07-23   734  				   (info->compre=
ss_level !=3D saved_compress_level)) {
f51d2b59120ff3 David Sterba          2017-09-15   735  				btrfs_info(info,=
 "%s %s compression, level %d",
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   736  					   (compress_fo=
rce) ? "force" : "use",
f51d2b59120ff3 David Sterba          2017-09-15   737  					   compress_typ=
e, info->compress_level);
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   738  			}
b7c47bbb2d1856 Tsutomu Itoh          2016-01-06   739  			compress_force =
=3D false;
a555f810af6d63 Chris Mason           2010-01-28   740  			break;
e18e4809b10e6c Chris Mason           2008-01-18   741  		case Opt_ssd:
3cdde2240d4533 Jeff Mahoney          2016-06-09   742  			btrfs_set_and_inf=
o(info, SSD,
583b723151794e Hans van Kranenburg   2017-07-28   743  					   "enabling ss=
d optimizations");
951e7966398b0f Adam Borowski         2017-03-31   744  			btrfs_clear_opt(i=
nfo->mount_opt, NOSSD);
e18e4809b10e6c Chris Mason           2008-01-18   745  			break;
451d7585a8bb1b Chris Mason           2009-06-09   746  		case Opt_ssd_sprea=
d:
583b723151794e Hans van Kranenburg   2017-07-28   747  			btrfs_set_and_inf=
o(info, SSD,
583b723151794e Hans van Kranenburg   2017-07-28   748  					   "enabling ss=
d optimizations");
3cdde2240d4533 Jeff Mahoney          2016-06-09   749  			btrfs_set_and_inf=
o(info, SSD_SPREAD,
583b723151794e Hans van Kranenburg   2017-07-28   750  					   "using sprea=
d ssd allocation scheme");
951e7966398b0f Adam Borowski         2017-03-31   751  			btrfs_clear_opt(i=
nfo->mount_opt, NOSSD);
451d7585a8bb1b Chris Mason           2009-06-09   752  			break;
3b30c22f64a6bb Chris Mason           2009-06-09   753  		case Opt_nossd:
583b723151794e Hans van Kranenburg   2017-07-28   754  			btrfs_set_opt(inf=
o->mount_opt, NOSSD);
583b723151794e Hans van Kranenburg   2017-07-28   755  			btrfs_clear_and_i=
nfo(info, SSD,
583b723151794e Hans van Kranenburg   2017-07-28   756  					     "not using=
 ssd optimizations");
c730ae0c6bb312 Marcos Paulo de Souza 2020-06-16   757  			fallthrough;
62b8e077317971 Howard McLauchlan     2018-03-08   758  		case Opt_nossd_spr=
ead:
583b723151794e Hans van Kranenburg   2017-07-28   759  			btrfs_clear_and_i=
nfo(info, SSD_SPREAD,
583b723151794e Hans van Kranenburg   2017-07-28   760  					     "not using=
 spread ssd allocation scheme");
3b30c22f64a6bb Chris Mason           2009-06-09   761  			break;
842bef5891aaf1 Qu Wenruo             2014-01-06   762  		case Opt_barrier:
3cdde2240d4533 Jeff Mahoney          2016-06-09   763  			btrfs_clear_and_i=
nfo(info, NOBARRIER,
078025347c8ed4 Qu Wenruo             2014-01-13   764  					     "turning o=
n barriers");
842bef5891aaf1 Qu Wenruo             2014-01-06   765  			break;
21ad10cf3e9c1e Chris Mason           2008-01-09   766  		case Opt_nobarrier:
3cdde2240d4533 Jeff Mahoney          2016-06-09   767  			btrfs_set_and_inf=
o(info, NOBARRIER,
078025347c8ed4 Qu Wenruo             2014-01-13   768  					   "turning off=
 barriers");
21ad10cf3e9c1e Chris Mason           2008-01-09   769  			break;
4543df7ecc8ae4 Chris Mason           2008-06-11   770  		case Opt_thread_po=
ol:
2c334e87f31783 Wang Shilong          2013-07-24   771  			ret =3D match_int=
(&args[0], &intarg);
2c334e87f31783 Wang Shilong          2013-07-24   772  			if (ret) {
2c334e87f31783 Wang Shilong          2013-07-24   773  				goto out;
f7b885befd05fa Anand Jain            2018-02-13   774  			} else if (intarg=
 =3D=3D 0) {
2c334e87f31783 Wang Shilong          2013-07-24   775  				ret =3D -EINVAL;
2c334e87f31783 Wang Shilong          2013-07-24   776  				goto out;
2c334e87f31783 Wang Shilong          2013-07-24   777  			}
f7b885befd05fa Anand Jain            2018-02-13   778  			info->thread_pool=
_size =3D intarg;
4543df7ecc8ae4 Chris Mason           2008-06-11   779  			break;
6f568d35a045db Chris Mason           2008-01-29   780  		case Opt_max_inlin=
e:
edf24abe51493c Christoph Hellwig     2008-06-10   781  			num =3D match_str=
dup(&args[0]);
6f568d35a045db Chris Mason           2008-01-29   782  			if (num) {
91748467a5c588 Akinobu Mita          2010-02-28   783  				info->max_inline=
 =3D memparse(num, NULL);
6f568d35a045db Chris Mason           2008-01-29   784  				kfree(num);
6f568d35a045db Chris Mason           2008-01-29   785  =

15ada040d7cd68 Chris Mason           2008-06-11   786  				if (info->max_in=
line) {
feb5f96589302b Mitch Harder          2014-02-13   787  					info->max_inlin=
e =3D min_t(u64,
15ada040d7cd68 Chris Mason           2008-06-11   788  						info->max_inli=
ne,
0b246afa62b0cf Jeff Mahoney          2016-06-22   789  						info->sectorsi=
ze);
15ada040d7cd68 Chris Mason           2008-06-11   790  				}
0b246afa62b0cf Jeff Mahoney          2016-06-22   791  				btrfs_info(info,=
 "max_inline at %llu",
c1c9ff7c94e83f Geert Uytterhoeven    2013-08-20   792  					   info->max_in=
line);
2c334e87f31783 Wang Shilong          2013-07-24   793  			} else {
2c334e87f31783 Wang Shilong          2013-07-24   794  				ret =3D -ENOMEM;
2c334e87f31783 Wang Shilong          2013-07-24   795  				goto out;
6f568d35a045db Chris Mason           2008-01-29   796  			}
6f568d35a045db Chris Mason           2008-01-29   797  			break;
bd0330ad2174d1 Qu Wenruo             2014-01-06   798  		case Opt_acl:
45ff35d6b9f301 Guangliang Zhao       2014-05-12   799  #ifdef CONFIG_BTRFS_=
FS_POSIX_ACL
1751e8a6cb935e Linus Torvalds        2017-11-27   800  			info->sb->s_flags=
 |=3D SB_POSIXACL;
bd0330ad2174d1 Qu Wenruo             2014-01-06   801  			break;
45ff35d6b9f301 Guangliang Zhao       2014-05-12   802  #else
0b246afa62b0cf Jeff Mahoney          2016-06-22   803  			btrfs_err(info, "=
support for ACL not compiled in!");
45ff35d6b9f301 Guangliang Zhao       2014-05-12   804  			ret =3D -EINVAL;
45ff35d6b9f301 Guangliang Zhao       2014-05-12   805  			goto out;
45ff35d6b9f301 Guangliang Zhao       2014-05-12   806  #endif
33268eaf0b3db5 Josef Bacik           2008-07-24   807  		case Opt_noacl:
1751e8a6cb935e Linus Torvalds        2017-11-27   808  			info->sb->s_flags=
 &=3D ~SB_POSIXACL;
33268eaf0b3db5 Josef Bacik           2008-07-24   809  			break;
3a5e14048a0a81 Sage Weil             2009-04-02   810  		case Opt_notreelog:
3cdde2240d4533 Jeff Mahoney          2016-06-09   811  			btrfs_set_and_inf=
o(info, NOTREELOG,
078025347c8ed4 Qu Wenruo             2014-01-13   812  					   "disabling t=
ree log");
a88998f291fc70 Qu Wenruo             2014-01-06   813  			break;
a88998f291fc70 Qu Wenruo             2014-01-06   814  		case Opt_treelog:
3cdde2240d4533 Jeff Mahoney          2016-06-09   815  			btrfs_clear_and_i=
nfo(info, NOTREELOG,
078025347c8ed4 Qu Wenruo             2014-01-13   816  					     "enabling =
tree log");
3a5e14048a0a81 Sage Weil             2009-04-02   817  			break;
fed8f166ebf3af Qu Wenruo             2016-01-19   818  		case Opt_norecover=
y:
96da09192cda57 Qu Wenruo             2016-01-19   819  		case Opt_nologrepl=
ay:
74ef00185eb864 Qu Wenruo             2020-06-04   820  			btrfs_warn(info,
74ef00185eb864 Qu Wenruo             2020-06-04   821  		"'nologreplay' is =
deprecated, use 'rescue=3Dnologreplay' instead");
3cdde2240d4533 Jeff Mahoney          2016-06-09   822  			btrfs_set_and_inf=
o(info, NOLOGREPLAY,
96da09192cda57 Qu Wenruo             2016-01-19   823  					   "disabling l=
og replay at mount time");
96da09192cda57 Qu Wenruo             2016-01-19   824  			break;
dccae999950896 Sage Weil             2009-04-02   825  		case Opt_flushonco=
mmit:
3cdde2240d4533 Jeff Mahoney          2016-06-09   826  			btrfs_set_and_inf=
o(info, FLUSHONCOMMIT,
078025347c8ed4 Qu Wenruo             2014-01-13   827  					   "turning on =
flush-on-commit");
dccae999950896 Sage Weil             2009-04-02   828  			break;
2c9ee85671f66c Qu Wenruo             2014-01-06   829  		case Opt_noflushon=
commit:
3cdde2240d4533 Jeff Mahoney          2016-06-09   830  			btrfs_clear_and_i=
nfo(info, FLUSHONCOMMIT,
078025347c8ed4 Qu Wenruo             2014-01-13   831  					     "turning o=
ff flush-on-commit");
2c9ee85671f66c Qu Wenruo             2014-01-06   832  			break;
97e728d4353f38 Josef Bacik           2009-04-21   833  		case Opt_ratio:
2c334e87f31783 Wang Shilong          2013-07-24   834  			ret =3D match_int=
(&args[0], &intarg);
764cb8b43d4d80 Anand Jain            2018-02-13   835  			if (ret)
2c334e87f31783 Wang Shilong          2013-07-24   836  				goto out;
97e728d4353f38 Josef Bacik           2009-04-21   837  			info->metadata_ra=
tio =3D intarg;
764cb8b43d4d80 Anand Jain            2018-02-13   838  			btrfs_info(info, =
"metadata ratio %u",
97e728d4353f38 Josef Bacik           2009-04-21   839  				   info->metadat=
a_ratio);
97e728d4353f38 Josef Bacik           2009-04-21   840  			break;
e244a0aeb6a599 Christoph Hellwig     2009-10-14   841  		case Opt_discard:
b0643e59cfa609 Dennis Zhou           2019-12-13   842  		case Opt_discard_m=
ode:
b0643e59cfa609 Dennis Zhou           2019-12-13   843  			if (token =3D=3D =
Opt_discard ||
b0643e59cfa609 Dennis Zhou           2019-12-13   844  			    strcmp(args[0=
].from, "sync") =3D=3D 0) {
b0643e59cfa609 Dennis Zhou           2019-12-13   845  				btrfs_clear_opt(=
info->mount_opt, DISCARD_ASYNC);
46b27f5059e6ce Dennis Zhou           2019-12-13   846  				btrfs_set_and_in=
fo(info, DISCARD_SYNC,
46b27f5059e6ce Dennis Zhou           2019-12-13   847  						   "turning on=
 sync discard");
b0643e59cfa609 Dennis Zhou           2019-12-13   848  			} else if (strcmp=
(args[0].from, "async") =3D=3D 0) {
b0643e59cfa609 Dennis Zhou           2019-12-13   849  				btrfs_clear_opt(=
info->mount_opt, DISCARD_SYNC);
b0643e59cfa609 Dennis Zhou           2019-12-13   850  				btrfs_set_and_in=
fo(info, DISCARD_ASYNC,
b0643e59cfa609 Dennis Zhou           2019-12-13   851  						   "turning on=
 async discard");
b0643e59cfa609 Dennis Zhou           2019-12-13   852  			} else {
b0643e59cfa609 Dennis Zhou           2019-12-13   853  				ret =3D -EINVAL;
b0643e59cfa609 Dennis Zhou           2019-12-13   854  				goto out;
b0643e59cfa609 Dennis Zhou           2019-12-13   855  			}
e244a0aeb6a599 Christoph Hellwig     2009-10-14   856  			break;
e07a2ade4426a2 Qu Wenruo             2014-01-06   857  		case Opt_nodiscard:
46b27f5059e6ce Dennis Zhou           2019-12-13   858  			btrfs_clear_and_i=
nfo(info, DISCARD_SYNC,
078025347c8ed4 Qu Wenruo             2014-01-13   859  					     "turning o=
ff discard");
b0643e59cfa609 Dennis Zhou           2019-12-13   860  			btrfs_clear_and_i=
nfo(info, DISCARD_ASYNC,
b0643e59cfa609 Dennis Zhou           2019-12-13   861  					     "turning o=
ff async discard");
e07a2ade4426a2 Qu Wenruo             2014-01-06   862  			break;
0af3d00bad38d3 Josef Bacik           2010-06-21   863  		case Opt_space_cac=
he:
70f6d82ec73c3a Omar Sandoval         2015-09-29   864  		case Opt_space_cac=
he_version:
70f6d82ec73c3a Omar Sandoval         2015-09-29   865  			if (token =3D=3D =
Opt_space_cache ||
70f6d82ec73c3a Omar Sandoval         2015-09-29   866  			    strcmp(args[0=
].from, "v1") =3D=3D 0) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   867  				btrfs_clear_opt(=
info->mount_opt,
70f6d82ec73c3a Omar Sandoval         2015-09-29   868  						FREE_SPACE_TRE=
E);
3cdde2240d4533 Jeff Mahoney          2016-06-09   869  				btrfs_set_and_in=
fo(info, SPACE_CACHE,
078025347c8ed4 Qu Wenruo             2014-01-13   870  					   "enabling di=
sk space caching");
70f6d82ec73c3a Omar Sandoval         2015-09-29   871  			} else if (strcmp=
(args[0].from, "v2") =3D=3D 0) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   872  				btrfs_clear_opt(=
info->mount_opt,
70f6d82ec73c3a Omar Sandoval         2015-09-29   873  						SPACE_CACHE);
0b246afa62b0cf Jeff Mahoney          2016-06-22   874  				btrfs_set_and_in=
fo(info, FREE_SPACE_TREE,
70f6d82ec73c3a Omar Sandoval         2015-09-29   875  						   "enabling f=
ree space tree");
70f6d82ec73c3a Omar Sandoval         2015-09-29   876  			} else {
70f6d82ec73c3a Omar Sandoval         2015-09-29   877  				ret =3D -EINVAL;
70f6d82ec73c3a Omar Sandoval         2015-09-29   878  				goto out;
70f6d82ec73c3a Omar Sandoval         2015-09-29   879  			}
0de90876c6cb77 Josef Bacik           2010-11-19   880  			break;
f420ee1e923b93 Stefan Behrens        2013-08-15   881  		case Opt_rescan_uu=
id_tree:
f420ee1e923b93 Stefan Behrens        2013-08-15   882  			btrfs_set_opt(inf=
o->mount_opt, RESCAN_UUID_TREE);
f420ee1e923b93 Stefan Behrens        2013-08-15   883  			break;
73bc187680f94b Josef Bacik           2011-10-03   884  		case Opt_no_space_=
cache:
3cdde2240d4533 Jeff Mahoney          2016-06-09   885  			if (btrfs_test_op=
t(info, SPACE_CACHE)) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   886  				btrfs_clear_and_=
info(info, SPACE_CACHE,
078025347c8ed4 Qu Wenruo             2014-01-13   887  					     "disabling=
 disk space caching");
70f6d82ec73c3a Omar Sandoval         2015-09-29   888  			}
3cdde2240d4533 Jeff Mahoney          2016-06-09   889  			if (btrfs_test_op=
t(info, FREE_SPACE_TREE)) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   890  				btrfs_clear_and_=
info(info, FREE_SPACE_TREE,
70f6d82ec73c3a Omar Sandoval         2015-09-29   891  					     "disabling=
 free space tree");
70f6d82ec73c3a Omar Sandoval         2015-09-29   892  			}
73bc187680f94b Josef Bacik           2011-10-03   893  			break;
4b9465cb9e3859 Chris Mason           2011-06-03   894  		case Opt_inode_cac=
he:
3818aea2754232 Qu Wenruo             2014-01-13   895  		case Opt_noinode_c=
ache:
5297199a8bca12 Nikolay Borisov       2020-11-26   896  			btrfs_warn(info,
5297199a8bca12 Nikolay Borisov       2020-11-26   897  	"the 'inode_cache' =
option is deprecated and has no effect since 5.11");
4b9465cb9e3859 Chris Mason           2011-06-03   898  			break;
88c2ba3b069f1e Josef Bacik           2010-09-21   899  		case Opt_clear_cac=
he:
3cdde2240d4533 Jeff Mahoney          2016-06-09   900  			btrfs_set_and_inf=
o(info, CLEAR_CACHE,
078025347c8ed4 Qu Wenruo             2014-01-13   901  					   "force clear=
ing of disk cache");
0af3d00bad38d3 Josef Bacik           2010-06-21   902  			break;
4260f7c7516f4c Sage Weil             2010-10-29   903  		case Opt_user_subv=
ol_rm_allowed:
4260f7c7516f4c Sage Weil             2010-10-29   904  			btrfs_set_opt(inf=
o->mount_opt, USER_SUBVOL_RM_ALLOWED);
4260f7c7516f4c Sage Weil             2010-10-29   905  			break;
91435650c233b9 Chris Mason           2011-02-16   906  		case Opt_enospc_de=
bug:
91435650c233b9 Chris Mason           2011-02-16   907  			btrfs_set_opt(inf=
o->mount_opt, ENOSPC_DEBUG);
91435650c233b9 Chris Mason           2011-02-16   908  			break;
530362934332e4 Qu Wenruo             2014-01-06   909  		case Opt_noenospc_=
debug:
530362934332e4 Qu Wenruo             2014-01-06   910  			btrfs_clear_opt(i=
nfo->mount_opt, ENOSPC_DEBUG);
530362934332e4 Qu Wenruo             2014-01-06   911  			break;
4cb5300bc839b8 Chris Mason           2011-05-24   912  		case Opt_defrag:
3cdde2240d4533 Jeff Mahoney          2016-06-09   913  			btrfs_set_and_inf=
o(info, AUTO_DEFRAG,
078025347c8ed4 Qu Wenruo             2014-01-13   914  					   "enabling au=
to defrag");
4cb5300bc839b8 Chris Mason           2011-05-24   915  			break;
fc0ca9af180b91 Qu Wenruo             2014-01-06   916  		case Opt_nodefrag:
3cdde2240d4533 Jeff Mahoney          2016-06-09   917  			btrfs_clear_and_i=
nfo(info, AUTO_DEFRAG,
078025347c8ed4 Qu Wenruo             2014-01-13   918  					     "disabling=
 auto defrag");
fc0ca9af180b91 Qu Wenruo             2014-01-06   919  			break;
af31f5e5b84b5b Chris Mason           2011-11-03   920  		case Opt_recovery:
8dcddfa048de63 Qu Wenruo             2016-01-19   921  		case Opt_usebackup=
root:
74ef00185eb864 Qu Wenruo             2020-06-04   922  			btrfs_warn(info,
74ef00185eb864 Qu Wenruo             2020-06-04   923  			"'%s' is deprecat=
ed, use 'rescue=3Dusebackuproot' instead",
74ef00185eb864 Qu Wenruo             2020-06-04   924  				   token =3D=3D =
Opt_recovery ? "recovery" :
74ef00185eb864 Qu Wenruo             2020-06-04   925  				   "usebackuproo=
t");
0b246afa62b0cf Jeff Mahoney          2016-06-22   926  			btrfs_info(info,
8dcddfa048de63 Qu Wenruo             2016-01-19   927  				   "trying to us=
e backup root at mount time");
8dcddfa048de63 Qu Wenruo             2016-01-19   928  			btrfs_set_opt(inf=
o->mount_opt, USEBACKUPROOT);
af31f5e5b84b5b Chris Mason           2011-11-03   929  			break;
9555c6c180600b Ilya Dryomov          2012-01-16   930  		case Opt_skip_bala=
nce:
9555c6c180600b Ilya Dryomov          2012-01-16   931  			btrfs_set_opt(inf=
o->mount_opt, SKIP_BALANCE);
9555c6c180600b Ilya Dryomov          2012-01-16   932  			break;
21adbd5cbb5344 Stefan Behrens        2011-11-09   933  #ifdef CONFIG_BTRFS_=
FS_CHECK_INTEGRITY
21adbd5cbb5344 Stefan Behrens        2011-11-09   934  		case Opt_check_int=
egrity_including_extent_data:
0b246afa62b0cf Jeff Mahoney          2016-06-22   935  			btrfs_info(info,
efe120a067c867 Frank Holton          2013-12-20   936  				   "enabling che=
ck integrity including extent data");
21adbd5cbb5344 Stefan Behrens        2011-11-09   937  			btrfs_set_opt(inf=
o->mount_opt,
21adbd5cbb5344 Stefan Behrens        2011-11-09   938  				      CHECK_INTE=
GRITY_INCLUDING_EXTENT_DATA);
21adbd5cbb5344 Stefan Behrens        2011-11-09   939  			btrfs_set_opt(inf=
o->mount_opt, CHECK_INTEGRITY);
21adbd5cbb5344 Stefan Behrens        2011-11-09   940  			break;
21adbd5cbb5344 Stefan Behrens        2011-11-09   941  		case Opt_check_int=
egrity:
0b246afa62b0cf Jeff Mahoney          2016-06-22   942  			btrfs_info(info, =
"enabling check integrity");
21adbd5cbb5344 Stefan Behrens        2011-11-09   943  			btrfs_set_opt(inf=
o->mount_opt, CHECK_INTEGRITY);
21adbd5cbb5344 Stefan Behrens        2011-11-09   944  			break;
21adbd5cbb5344 Stefan Behrens        2011-11-09   945  		case Opt_check_int=
egrity_print_mask:
2c334e87f31783 Wang Shilong          2013-07-24   946  			ret =3D match_int=
(&args[0], &intarg);
02453bdeb02482 Anand Jain            2018-02-13   947  			if (ret)
2c334e87f31783 Wang Shilong          2013-07-24   948  				goto out;
21adbd5cbb5344 Stefan Behrens        2011-11-09   949  			info->check_integ=
rity_print_mask =3D intarg;
02453bdeb02482 Anand Jain            2018-02-13   950  			btrfs_info(info, =
"check_integrity_print_mask 0x%x",
21adbd5cbb5344 Stefan Behrens        2011-11-09   951  				   info->check_i=
ntegrity_print_mask);
21adbd5cbb5344 Stefan Behrens        2011-11-09   952  			break;
21adbd5cbb5344 Stefan Behrens        2011-11-09   953  #else
21adbd5cbb5344 Stefan Behrens        2011-11-09   954  		case Opt_check_int=
egrity_including_extent_data:
21adbd5cbb5344 Stefan Behrens        2011-11-09   955  		case Opt_check_int=
egrity:
21adbd5cbb5344 Stefan Behrens        2011-11-09   956  		case Opt_check_int=
egrity_print_mask:
0b246afa62b0cf Jeff Mahoney          2016-06-22   957  			btrfs_err(info,
efe120a067c867 Frank Holton          2013-12-20   958  				  "support for c=
heck_integrity* not compiled in!");
21adbd5cbb5344 Stefan Behrens        2011-11-09   959  			ret =3D -EINVAL;
21adbd5cbb5344 Stefan Behrens        2011-11-09   960  			goto out;
21adbd5cbb5344 Stefan Behrens        2011-11-09   961  #endif
8c3429300181be Jeff Mahoney          2011-10-03   962  		case Opt_fatal_err=
ors:
8c3429300181be Jeff Mahoney          2011-10-03   963  			if (strcmp(args[0=
].from, "panic") =3D=3D 0)
8c3429300181be Jeff Mahoney          2011-10-03   964  				btrfs_set_opt(in=
fo->mount_opt,
8c3429300181be Jeff Mahoney          2011-10-03   965  					      PANIC_ON_=
FATAL_ERROR);
8c3429300181be Jeff Mahoney          2011-10-03   966  			else if (strcmp(a=
rgs[0].from, "bug") =3D=3D 0)
8c3429300181be Jeff Mahoney          2011-10-03   967  				btrfs_clear_opt(=
info->mount_opt,
8c3429300181be Jeff Mahoney          2011-10-03   968  					      PANIC_ON_=
FATAL_ERROR);
8c3429300181be Jeff Mahoney          2011-10-03   969  			else {
8c3429300181be Jeff Mahoney          2011-10-03   970  				ret =3D -EINVAL;
8c3429300181be Jeff Mahoney          2011-10-03   971  				goto out;
8c3429300181be Jeff Mahoney          2011-10-03   972  			}
8c3429300181be Jeff Mahoney          2011-10-03   973  			break;
8b87dc17fbc744 David Sterba          2013-08-01   974  		case Opt_commit_in=
terval:
8b87dc17fbc744 David Sterba          2013-08-01   975  			intarg =3D 0;
8b87dc17fbc744 David Sterba          2013-08-01   976  			ret =3D match_int=
(&args[0], &intarg);
d3740608646f72 Anand Jain            2018-02-13   977  			if (ret)
8b87dc17fbc744 David Sterba          2013-08-01   978  				goto out;
d3740608646f72 Anand Jain            2018-02-13   979  			if (intarg =3D=3D=
 0) {
0b246afa62b0cf Jeff Mahoney          2016-06-22   980  				btrfs_info(info,
d3740608646f72 Anand Jain            2018-02-13   981  					   "using defau=
lt commit interval %us",
8b87dc17fbc744 David Sterba          2013-08-01   982  					   BTRFS_DEFAUL=
T_COMMIT_INTERVAL);
d3740608646f72 Anand Jain            2018-02-13   983  				intarg =3D BTRFS=
_DEFAULT_COMMIT_INTERVAL;
d3740608646f72 Anand Jain            2018-02-13   984  			} else if (intarg=
 > 300) {
d3740608646f72 Anand Jain            2018-02-13   985  				btrfs_warn(info,=
 "excessive commit interval %d",
d3740608646f72 Anand Jain            2018-02-13   986  					   intarg);
8b87dc17fbc744 David Sterba          2013-08-01   987  			}
d3740608646f72 Anand Jain            2018-02-13   988  			info->commit_inte=
rval =3D intarg;
8b87dc17fbc744 David Sterba          2013-08-01   989  			break;
74ef00185eb864 Qu Wenruo             2020-06-04   990  		case Opt_rescue:
74ef00185eb864 Qu Wenruo             2020-06-04   991  			ret =3D parse_res=
cue_options(info, args[0].from);
74ef00185eb864 Qu Wenruo             2020-06-04   992  			if (ret < 0)
74ef00185eb864 Qu Wenruo             2020-06-04   993  				goto out;
74ef00185eb864 Qu Wenruo             2020-06-04   994  			break;
d0bd456074dca0 Josef Bacik           2015-09-23   995  #ifdef CONFIG_BTRFS_=
DEBUG
d0bd456074dca0 Josef Bacik           2015-09-23   996  		case Opt_fragment_=
all:
0b246afa62b0cf Jeff Mahoney          2016-06-22   997  			btrfs_info(info, =
"fragmenting all space");
d0bd456074dca0 Josef Bacik           2015-09-23   998  			btrfs_set_opt(inf=
o->mount_opt, FRAGMENT_DATA);
d0bd456074dca0 Josef Bacik           2015-09-23   999  			btrfs_set_opt(inf=
o->mount_opt, FRAGMENT_METADATA);
d0bd456074dca0 Josef Bacik           2015-09-23  1000  			break;
d0bd456074dca0 Josef Bacik           2015-09-23  1001  		case Opt_fragment_=
metadata:
0b246afa62b0cf Jeff Mahoney          2016-06-22  1002  			btrfs_info(info, =
"fragmenting metadata");
d0bd456074dca0 Josef Bacik           2015-09-23  1003  			btrfs_set_opt(inf=
o->mount_opt,
d0bd456074dca0 Josef Bacik           2015-09-23  1004  				      FRAGMENT_M=
ETADATA);
d0bd456074dca0 Josef Bacik           2015-09-23  1005  			break;
d0bd456074dca0 Josef Bacik           2015-09-23  1006  		case Opt_fragment_=
data:
0b246afa62b0cf Jeff Mahoney          2016-06-22  1007  			btrfs_info(info, =
"fragmenting data");
d0bd456074dca0 Josef Bacik           2015-09-23  1008  			btrfs_set_opt(inf=
o->mount_opt, FRAGMENT_DATA);
d0bd456074dca0 Josef Bacik           2015-09-23  1009  			break;
fb592373cddeb4 Josef Bacik           2017-09-29  1010  #endif
fb592373cddeb4 Josef Bacik           2017-09-29  1011  #ifdef CONFIG_BTRFS_=
FS_REF_VERIFY
fb592373cddeb4 Josef Bacik           2017-09-29  1012  		case Opt_ref_verif=
y:
fb592373cddeb4 Josef Bacik           2017-09-29  1013  			btrfs_info(info, =
"doing ref verification");
fb592373cddeb4 Josef Bacik           2017-09-29  1014  			btrfs_set_opt(inf=
o->mount_opt, REF_VERIFY);
fb592373cddeb4 Josef Bacik           2017-09-29  1015  			break;
d0bd456074dca0 Josef Bacik           2015-09-23  1016  #endif
a7a3f7cadd9bde Sage Weil             2009-11-07  1017  		case Opt_err:
7e8f19e50e3ccf David Sterba          2019-11-27  1018  			btrfs_err(info, "=
unrecognized mount option '%s'", p);
a7a3f7cadd9bde Sage Weil             2009-11-07  1019  			ret =3D -EINVAL;
a7a3f7cadd9bde Sage Weil             2009-11-07  1020  			goto out;
95e0528919cb0c Chris Mason           2007-08-29  1021  		default:
be20aa9dbadc8c Chris Mason           2007-12-17  1022  			break;
95e0528919cb0c Chris Mason           2007-08-29  1023  		}
95e0528919cb0c Chris Mason           2007-08-29  1024  	}
96da09192cda57 Qu Wenruo             2016-01-19  1025  check:
d70bf7484f7287 Josef Bacik           2020-10-16  1026  	/* We're read-only,=
 don't have to check. */
d70bf7484f7287 Josef Bacik           2020-10-16  1027  	if (new_flags & SB_=
RDONLY)
d70bf7484f7287 Josef Bacik           2020-10-16  1028  		goto out;
d70bf7484f7287 Josef Bacik           2020-10-16  1029  =

42437a6386ffea Josef Bacik           2020-10-16  1030  	if (check_ro_option=
(info, BTRFS_MOUNT_NOLOGREPLAY, "nologreplay") ||
882dbe0cec9651 Josef Bacik           2020-10-16  1031  	    check_ro_option=
(info, BTRFS_MOUNT_IGNOREBADROOTS, "ignorebadroots") ||
882dbe0cec9651 Josef Bacik           2020-10-16  1032  	    check_ro_option=
(info, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums"))
96da09192cda57 Qu Wenruo             2016-01-19  1033  		ret =3D -EINVAL;
a7a3f7cadd9bde Sage Weil             2009-11-07  1034  out:
0b246afa62b0cf Jeff Mahoney          2016-06-22  1035  	if (btrfs_fs_compat=
_ro(info, FREE_SPACE_TREE) &&
3cdde2240d4533 Jeff Mahoney          2016-06-09  1036  	    !btrfs_test_opt=
(info, FREE_SPACE_TREE) &&
3cdde2240d4533 Jeff Mahoney          2016-06-09  1037  	    !btrfs_test_opt=
(info, CLEAR_CACHE)) {
0b246afa62b0cf Jeff Mahoney          2016-06-22  1038  		btrfs_err(info, "c=
annot disable free space tree");
70f6d82ec73c3a Omar Sandoval         2015-09-29  1039  		ret =3D -EINVAL;
70f6d82ec73c3a Omar Sandoval         2015-09-29  1040  =

70f6d82ec73c3a Omar Sandoval         2015-09-29  1041  	}
5d1ab66c56fed1 Naohiro Aota          2020-11-10  1042  	if (!ret)
5d1ab66c56fed1 Naohiro Aota          2020-11-10  1043  		ret =3D btrfs_chec=
k_mountopts_zoned(info);
3cdde2240d4533 Jeff Mahoney          2016-06-09  1044  	if (!ret && btrfs_t=
est_opt(info, SPACE_CACHE))
0b246afa62b0cf Jeff Mahoney          2016-06-22  1045  		btrfs_info(info, "=
disk space caching is enabled");
3cdde2240d4533 Jeff Mahoney          2016-06-09  1046  	if (!ret && btrfs_t=
est_opt(info, FREE_SPACE_TREE))
0b246afa62b0cf Jeff Mahoney          2016-06-22  1047  		btrfs_info(info, "=
using free space tree");
a7a3f7cadd9bde Sage Weil             2009-11-07  1048  	return ret;
edf24abe51493c Christoph Hellwig     2008-06-10  1049  }
edf24abe51493c Christoph Hellwig     2008-06-10  1050  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5207239506633674020==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wfB/DYfNWErMAQA=
--===============5207239506633674020==--

