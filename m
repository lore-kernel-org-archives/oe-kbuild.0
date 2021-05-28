Content-Type: multipart/mixed; boundary="===============8683487510730810773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:dev/hashes-part1 65/67] fs/btrfs/super.c:622:29: sparse: sparse: shift too big (32) for type unsigned long
Date: Sat, 29 May 2021 01:25:27 +0800
Message-ID: <202105290124.z0tMs3PL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8683487510730810773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Sterba <dsterba@suse.com>

Hi David,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/kdave/btrfs-devel.git dev/hashes-part1
head:   e0ba86186388117fd883ccc55b1193f407085aa2
commit: 43c29e15698c807edea1137a19446bde8ca41164 [65/67] btrfs: build fixes
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: i386-randconfig-s001-20210528 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/kdave/btrfs-devel/commit/43c29e15698c807edea11=
37a19446bde8ca41164
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel dev/hashes-part1
        git checkout 43c29e15698c807edea1137a19446bde8ca41164
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D=
1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/btrfs/super.c: note: in included file (through include/trace/trace_ev=
ents.h, include/trace/define_trace.h, include/trace/events/btrfs.h):
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast from restricte=
d gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: incorrect type in a=
rgument 3 (different base types) @@     expected unsigned long flags @@    =
 got restricted gfp_t [usertype] mask @@
   include/trace/events/btrfs.h:1337:1: sparse:     expected unsigned long =
flags
   include/trace/events/btrfs.h:1337:1: sparse:     got restricted gfp_t [u=
sertype] mask
   fs/btrfs/super.c: note: in included file (through include/trace/trace_ev=
ents.h, include/trace/define_trace.h, include/trace/events/btrfs.h):
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast to restricted =
gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: cast to restricted =
gfp_t
   include/trace/events/btrfs.h:1337:1: sparse: sparse: restricted gfp_t de=
grades to integer
   include/trace/events/btrfs.h:1337:1: sparse: sparse: restricted gfp_t de=
grades to integer
>> fs/btrfs/super.c:622:29: sparse: sparse: shift too big (32) for type uns=
igned long
   fs/btrfs/super.c:1141:17: sparse: sparse: shift too big (32) for type un=
signed long
   fs/btrfs/super.c:1588:13: sparse: sparse: shift too big (32) for type un=
signed long
--
>> fs/btrfs/disk-io.c:2411:14: sparse: sparse: shift too big (32) for type =
unsigned long
--
>> fs/btrfs/ioctl.c:272:21: sparse: sparse: shift too big (32) for type uns=
igned long
   fs/btrfs/ioctl.c:388:6: sparse: sparse: context imbalance in 'btrfs_excl=
op_start_try_lock' - wrong count at exit
   fs/btrfs/ioctl.c:399:6: sparse: sparse: context imbalance in 'btrfs_excl=
op_start_unlock' - unexpected unlock

vim +622 fs/btrfs/super.c

74ef00185eb8642 Qu Wenruo             2020-06-04   562  =

edf24abe51493cc Christoph Hellwig     2008-06-10   563  /*
edf24abe51493cc Christoph Hellwig     2008-06-10   564   * Regular mount op=
tions parser.  Everything that is needed only when
edf24abe51493cc Christoph Hellwig     2008-06-10   565   * reading in a new=
 superblock is parsed here.
49b25e0540904be Jeff Mahoney          2012-03-01   566   * XXX JDM: This ne=
eds to be cleaned up for remount.
edf24abe51493cc Christoph Hellwig     2008-06-10   567   */
2ff7e61e0d30ff1 Jeff Mahoney          2016-06-22   568  int btrfs_parse_opt=
ions(struct btrfs_fs_info *info, char *options,
96da09192cda57a Qu Wenruo             2016-01-19   569  			unsigned long ne=
w_flags)
95e0528919cb0c7 Chris Mason           2007-08-29   570  {
95e0528919cb0c7 Chris Mason           2007-08-29   571  	substring_t args[M=
AX_OPT_ARGS];
e215772cd2abcf3 Misono, Tomohiro      2017-12-14   572  	char *p, *num;
4543df7ecc8ae49 Chris Mason           2008-06-11   573  	int intarg;
a7a3f7cadd9bdee Sage Weil             2009-11-07   574  	int ret =3D 0;
261507a02ccba9a Li Zefan              2010-12-17   575  	char *compress_typ=
e;
261507a02ccba9a Li Zefan              2010-12-17   576  	bool compress_forc=
e =3D false;
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   577  	enum btrfs_compres=
sion_type saved_compress_type;
27942c9971cc405 David Sterba          2020-07-23   578  	int saved_compress=
_level;
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   579  	bool saved_compres=
s_force;
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   580  	int no_compress =
=3D 0;
b6cda9bcb4df754 Chris Mason           2007-12-14   581  =

0b246afa62b0cf5 Jeff Mahoney          2016-06-22   582  	if (btrfs_fs_compa=
t_ro(info, FREE_SPACE_TREE))
70f6d82ec73c3ae Omar Sandoval         2015-09-29   583  		btrfs_set_opt(inf=
o->mount_opt, FREE_SPACE_TREE);
948462294577a38 Boris Burkov          2020-11-18   584  	else if (btrfs_fre=
e_space_cache_v1_active(info)) {
5d1ab66c56fed15 Naohiro Aota          2020-11-10   585  		if (btrfs_is_zone=
d(info)) {
5d1ab66c56fed15 Naohiro Aota          2020-11-10   586  			btrfs_info(info,
5d1ab66c56fed15 Naohiro Aota          2020-11-10   587  			"zoned: clearing=
 existing space cache");
5d1ab66c56fed15 Naohiro Aota          2020-11-10   588  			btrfs_set_super_=
cache_generation(info->super_copy, 0);
5d1ab66c56fed15 Naohiro Aota          2020-11-10   589  		} else {
73bc187680f94be Josef Bacik           2011-10-03   590  			btrfs_set_opt(in=
fo->mount_opt, SPACE_CACHE);
5d1ab66c56fed15 Naohiro Aota          2020-11-10   591  		}
5d1ab66c56fed15 Naohiro Aota          2020-11-10   592  	}
73bc187680f94be Josef Bacik           2011-10-03   593  =

96da09192cda57a Qu Wenruo             2016-01-19   594  	/*
96da09192cda57a Qu Wenruo             2016-01-19   595  	 * Even the option=
s are empty, we still need to do extra check
96da09192cda57a Qu Wenruo             2016-01-19   596  	 * against new fla=
gs
96da09192cda57a Qu Wenruo             2016-01-19   597  	 */
95e0528919cb0c7 Chris Mason           2007-08-29   598  	if (!options)
96da09192cda57a Qu Wenruo             2016-01-19   599  		goto check;
95e0528919cb0c7 Chris Mason           2007-08-29   600  =

95e0528919cb0c7 Chris Mason           2007-08-29   601  	while ((p =3D strs=
ep(&options, ",")) !=3D NULL) {
95e0528919cb0c7 Chris Mason           2007-08-29   602  		int token;
95e0528919cb0c7 Chris Mason           2007-08-29   603  		if (!*p)
95e0528919cb0c7 Chris Mason           2007-08-29   604  			continue;
95e0528919cb0c7 Chris Mason           2007-08-29   605  =

95e0528919cb0c7 Chris Mason           2007-08-29   606  		token =3D match_t=
oken(p, tokens, args);
95e0528919cb0c7 Chris Mason           2007-08-29   607  		switch (token) {
dfe25020689bb2d Chris Mason           2008-05-13   608  		case Opt_degraded:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   609  			btrfs_info(info,=
 "allowing degraded mounts");
dfe25020689bb2d Chris Mason           2008-05-13   610  			btrfs_set_opt(in=
fo->mount_opt, DEGRADED);
dfe25020689bb2d Chris Mason           2008-05-13   611  			break;
95e0528919cb0c7 Chris Mason           2007-08-29   612  		case Opt_subvol:
37becec95ac31b2 Omar Sandoval         2018-05-21   613  		case Opt_subvol_e=
mpty:
73f73415caddbc0 Josef Bacik           2009-12-04   614  		case Opt_subvolid:
43e570b08a6c6b1 Christoph Hellwig     2008-06-10   615  		case Opt_device:
edf24abe51493cc Christoph Hellwig     2008-06-10   616  			/*
fa59f27c8c35bbe Anand Jain            2018-07-16   617  			 * These are par=
sed by btrfs_parse_subvol_options or
fa59f27c8c35bbe Anand Jain            2018-07-16   618  			 * btrfs_parse_d=
evice_options and can be ignored here.
edf24abe51493cc Christoph Hellwig     2008-06-10   619  			 */
95e0528919cb0c7 Chris Mason           2007-08-29   620  			break;
b6cda9bcb4df754 Chris Mason           2007-12-14   621  		case Opt_nodatasu=
m:
de37679d72d66b9 Johannes Thumshirn    2020-05-14  @622  			if (btrfs_test_o=
pt(info, AUTH_KEY)) {
de37679d72d66b9 Johannes Thumshirn    2020-05-14   623  				btrfs_info(info,
de37679d72d66b9 Johannes Thumshirn    2020-05-14   624  					   "nodatasum =
not supported on an authnticated file-system");
de37679d72d66b9 Johannes Thumshirn    2020-05-14   625  				break;
de37679d72d66b9 Johannes Thumshirn    2020-05-14   626  			}
3cdde2240d4533f Jeff Mahoney          2016-06-09   627  			btrfs_set_and_in=
fo(info, NODATASUM,
078025347c8ed43 Qu Wenruo             2014-01-13   628  					   "setting no=
datasum");
be20aa9dbadc8c0 Chris Mason           2007-12-17   629  			break;
d399167d88ea535 Qu Wenruo             2014-01-06   630  		case Opt_datasum:
3cdde2240d4533f Jeff Mahoney          2016-06-09   631  			if (btrfs_test_o=
pt(info, NODATASUM)) {
3cdde2240d4533f Jeff Mahoney          2016-06-09   632  				if (btrfs_test_=
opt(info, NODATACOW))
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   633  					btrfs_info(inf=
o,
5d163e0e68ce743 Jeff Mahoney          2016-09-20   634  						   "setting d=
atasum, datacow enabled");
d399167d88ea535 Qu Wenruo             2014-01-06   635  				else
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   636  					btrfs_info(inf=
o, "setting datasum");
078025347c8ed43 Qu Wenruo             2014-01-13   637  			}
d399167d88ea535 Qu Wenruo             2014-01-06   638  			btrfs_clear_opt(=
info->mount_opt, NODATACOW);
d399167d88ea535 Qu Wenruo             2014-01-06   639  			btrfs_clear_opt(=
info->mount_opt, NODATASUM);
d399167d88ea535 Qu Wenruo             2014-01-06   640  			break;
be20aa9dbadc8c0 Chris Mason           2007-12-17   641  		case Opt_nodataco=
w:
de37679d72d66b9 Johannes Thumshirn    2020-05-14   642  			if (btrfs_test_o=
pt(info, AUTH_KEY)) {
de37679d72d66b9 Johannes Thumshirn    2020-05-14   643  				btrfs_info(info,
de37679d72d66b9 Johannes Thumshirn    2020-05-14   644  					   "nodatacow =
not supported on an authnticated file-system");
de37679d72d66b9 Johannes Thumshirn    2020-05-14   645  				break;
de37679d72d66b9 Johannes Thumshirn    2020-05-14   646  			}
3cdde2240d4533f Jeff Mahoney          2016-06-09   647  			if (!btrfs_test_=
opt(info, NODATACOW)) {
3cdde2240d4533f Jeff Mahoney          2016-06-09   648  				if (!btrfs_test=
_opt(info, COMPRESS) ||
3cdde2240d4533f Jeff Mahoney          2016-06-09   649  				    !btrfs_test=
_opt(info, FORCE_COMPRESS)) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   650  					btrfs_info(inf=
o,
efe120a067c8674 Frank Holton          2013-12-20   651  						   "setting n=
odatacow, compression disabled");
bedb2cca7252d08 Andrei Popa           2012-09-20   652  				} else {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   653  					btrfs_info(inf=
o, "setting nodatacow");
bedb2cca7252d08 Andrei Popa           2012-09-20   654  				}
078025347c8ed43 Qu Wenruo             2014-01-13   655  			}
bedb2cca7252d08 Andrei Popa           2012-09-20   656  			btrfs_clear_opt(=
info->mount_opt, COMPRESS);
bedb2cca7252d08 Andrei Popa           2012-09-20   657  			btrfs_clear_opt(=
info->mount_opt, FORCE_COMPRESS);
be20aa9dbadc8c0 Chris Mason           2007-12-17   658  			btrfs_set_opt(in=
fo->mount_opt, NODATACOW);
b6cda9bcb4df754 Chris Mason           2007-12-14   659  			btrfs_set_opt(in=
fo->mount_opt, NODATASUM);
b6cda9bcb4df754 Chris Mason           2007-12-14   660  			break;
a258af7a3e395a1 Qu Wenruo             2014-01-06   661  		case Opt_datacow:
3cdde2240d4533f Jeff Mahoney          2016-06-09   662  			btrfs_clear_and_=
info(info, NODATACOW,
078025347c8ed43 Qu Wenruo             2014-01-13   663  					     "setting =
datacow");
a258af7a3e395a1 Qu Wenruo             2014-01-06   664  			break;
261507a02ccba9a Li Zefan              2010-12-17   665  		case Opt_compress=
_force:
261507a02ccba9a Li Zefan              2010-12-17   666  		case Opt_compress=
_force_type:
261507a02ccba9a Li Zefan              2010-12-17   667  			compress_force =
=3D true;
c730ae0c6bb3125 Marcos Paulo de Souza 2020-06-16   668  			fallthrough;
c8b978188c9a0fd Chris Mason           2008-10-29   669  		case Opt_compress:
261507a02ccba9a Li Zefan              2010-12-17   670  		case Opt_compress=
_type:
3cdde2240d4533f Jeff Mahoney          2016-06-09   671  			saved_compress_t=
ype =3D btrfs_test_opt(info,
3cdde2240d4533f Jeff Mahoney          2016-06-09   672  							     COMPRES=
S) ?
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   673  				info->compress_=
type : BTRFS_COMPRESS_NONE;
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   674  			saved_compress_f=
orce =3D
3cdde2240d4533f Jeff Mahoney          2016-06-09   675  				btrfs_test_opt(=
info, FORCE_COMPRESS);
27942c9971cc405 David Sterba          2020-07-23   676  			saved_compress_l=
evel =3D info->compress_level;
261507a02ccba9a Li Zefan              2010-12-17   677  			if (token =3D=3D=
 Opt_compress ||
261507a02ccba9a Li Zefan              2010-12-17   678  			    token =3D=3D=
 Opt_compress_force ||
a7164fa4e055daf David Sterba          2017-07-17   679  			    strncmp(args=
[0].from, "zlib", 4) =3D=3D 0) {
261507a02ccba9a Li Zefan              2010-12-17   680  				compress_type =
=3D "zlib";
eae8d82529dd982 Qu Wenruo             2017-11-06   681  =

261507a02ccba9a Li Zefan              2010-12-17   682  				info->compress_=
type =3D BTRFS_COMPRESS_ZLIB;
eae8d82529dd982 Qu Wenruo             2017-11-06   683  				info->compress_=
level =3D BTRFS_ZLIB_DEFAULT_LEVEL;
eae8d82529dd982 Qu Wenruo             2017-11-06   684  				/*
eae8d82529dd982 Qu Wenruo             2017-11-06   685  				 * args[0] cont=
ains uninitialized data since
eae8d82529dd982 Qu Wenruo             2017-11-06   686  				 * for these to=
kens we don't expect any
eae8d82529dd982 Qu Wenruo             2017-11-06   687  				 * parameter.
eae8d82529dd982 Qu Wenruo             2017-11-06   688  				 */
eae8d82529dd982 Qu Wenruo             2017-11-06   689  				if (token !=3D =
Opt_compress &&
eae8d82529dd982 Qu Wenruo             2017-11-06   690  				    token !=3D =
Opt_compress_force)
f51d2b59120ff36 David Sterba          2017-09-15   691  					info->compress=
_level =3D
d0ab62ce2ded362 Dennis Zhou           2019-02-04   692  					  btrfs_compre=
ss_str2level(
d0ab62ce2ded362 Dennis Zhou           2019-02-04   693  							BTRFS_COMPRE=
SS_ZLIB,
d0ab62ce2ded362 Dennis Zhou           2019-02-04   694  							args[0].from=
 + 4);
063849eafda03ed Arnd Hannemann        2012-04-16   695  				btrfs_set_opt(i=
nfo->mount_opt, COMPRESS);
bedb2cca7252d08 Andrei Popa           2012-09-20   696  				btrfs_clear_opt=
(info->mount_opt, NODATACOW);
bedb2cca7252d08 Andrei Popa           2012-09-20   697  				btrfs_clear_opt=
(info->mount_opt, NODATASUM);
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   698  				no_compress =3D=
 0;
a7164fa4e055daf David Sterba          2017-07-17   699  			} else if (strnc=
mp(args[0].from, "lzo", 3) =3D=3D 0) {
a6fa6fae40ec336 Li Zefan              2010-10-25   700  				compress_type =
=3D "lzo";
a6fa6fae40ec336 Li Zefan              2010-10-25   701  				info->compress_=
type =3D BTRFS_COMPRESS_LZO;
282dd7d77184446 Marcos Paulo de Souza 2020-08-03   702  				info->compress_=
level =3D 0;
063849eafda03ed Arnd Hannemann        2012-04-16   703  				btrfs_set_opt(i=
nfo->mount_opt, COMPRESS);
bedb2cca7252d08 Andrei Popa           2012-09-20   704  				btrfs_clear_opt=
(info->mount_opt, NODATACOW);
bedb2cca7252d08 Andrei Popa           2012-09-20   705  				btrfs_clear_opt=
(info->mount_opt, NODATASUM);
2b0ce2c2909368d Mitch Harder          2012-07-24   706  				btrfs_set_fs_in=
compat(info, COMPRESS_LZO);
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   707  				no_compress =3D=
 0;
3f93aef535c8ea0 Dennis Zhou           2019-02-04   708  			} else if (strnc=
mp(args[0].from, "zstd", 4) =3D=3D 0) {
5c1aab1dd5445ed Nick Terrell          2017-08-09   709  				compress_type =
=3D "zstd";
5c1aab1dd5445ed Nick Terrell          2017-08-09   710  				info->compress_=
type =3D BTRFS_COMPRESS_ZSTD;
3f93aef535c8ea0 Dennis Zhou           2019-02-04   711  				info->compress_=
level =3D
3f93aef535c8ea0 Dennis Zhou           2019-02-04   712  					btrfs_compress=
_str2level(
3f93aef535c8ea0 Dennis Zhou           2019-02-04   713  							 BTRFS_COMPR=
ESS_ZSTD,
3f93aef535c8ea0 Dennis Zhou           2019-02-04   714  							 args[0].fro=
m + 4);
5c1aab1dd5445ed Nick Terrell          2017-08-09   715  				btrfs_set_opt(i=
nfo->mount_opt, COMPRESS);
5c1aab1dd5445ed Nick Terrell          2017-08-09   716  				btrfs_clear_opt=
(info->mount_opt, NODATACOW);
5c1aab1dd5445ed Nick Terrell          2017-08-09   717  				btrfs_clear_opt=
(info->mount_opt, NODATASUM);
5c1aab1dd5445ed Nick Terrell          2017-08-09   718  				btrfs_set_fs_in=
compat(info, COMPRESS_ZSTD);
5c1aab1dd5445ed Nick Terrell          2017-08-09   719  				no_compress =3D=
 0;
063849eafda03ed Arnd Hannemann        2012-04-16   720  			} else if (strnc=
mp(args[0].from, "no", 2) =3D=3D 0) {
063849eafda03ed Arnd Hannemann        2012-04-16   721  				compress_type =
=3D "no";
27942c9971cc405 David Sterba          2020-07-23   722  				info->compress_=
level =3D 0;
27942c9971cc405 David Sterba          2020-07-23   723  				info->compress_=
type =3D 0;
063849eafda03ed Arnd Hannemann        2012-04-16   724  				btrfs_clear_opt=
(info->mount_opt, COMPRESS);
063849eafda03ed Arnd Hannemann        2012-04-16   725  				btrfs_clear_opt=
(info->mount_opt, FORCE_COMPRESS);
063849eafda03ed Arnd Hannemann        2012-04-16   726  				compress_force =
=3D false;
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   727  				no_compress++;
261507a02ccba9a Li Zefan              2010-12-17   728  			} else {
261507a02ccba9a Li Zefan              2010-12-17   729  				ret =3D -EINVAL;
261507a02ccba9a Li Zefan              2010-12-17   730  				goto out;
261507a02ccba9a Li Zefan              2010-12-17   731  			}
261507a02ccba9a Li Zefan              2010-12-17   732  =

261507a02ccba9a Li Zefan              2010-12-17   733  			if (compress_for=
ce) {
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   734  				btrfs_set_opt(i=
nfo->mount_opt, FORCE_COMPRESS);
143f36361855847 David Sterba          2014-07-29   735  			} else {
4027e0f4c4b2df2 Wang Shilong          2014-06-30   736  				/*
4027e0f4c4b2df2 Wang Shilong          2014-06-30   737  				 * If we remoun=
t from compress-force=3Dxxx to
4027e0f4c4b2df2 Wang Shilong          2014-06-30   738  				 * compress=3Dx=
xx, we need clear FORCE_COMPRESS
4027e0f4c4b2df2 Wang Shilong          2014-06-30   739  				 * flag, otherw=
ise, there is no way for users
4027e0f4c4b2df2 Wang Shilong          2014-06-30   740  				 * to disable f=
orcible compression separately.
4027e0f4c4b2df2 Wang Shilong          2014-06-30   741  				 */
4027e0f4c4b2df2 Wang Shilong          2014-06-30   742  				btrfs_clear_opt=
(info->mount_opt, FORCE_COMPRESS);
a7e252af5a819eb Miao Xie              2013-11-22   743  			}
27942c9971cc405 David Sterba          2020-07-23   744  			if (no_compress =
=3D=3D 1) {
27942c9971cc405 David Sterba          2020-07-23   745  				btrfs_info(info=
, "use no compression");
27942c9971cc405 David Sterba          2020-07-23   746  			} else if ((info=
->compress_type !=3D saved_compress_type) ||
27942c9971cc405 David Sterba          2020-07-23   747  				   (compress_fo=
rce !=3D saved_compress_force) ||
27942c9971cc405 David Sterba          2020-07-23   748  				   (info->compr=
ess_level !=3D saved_compress_level)) {
f51d2b59120ff36 David Sterba          2017-09-15   749  				btrfs_info(info=
, "%s %s compression, level %d",
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   750  					   (compress_f=
orce) ? "force" : "use",
f51d2b59120ff36 David Sterba          2017-09-15   751  					   compress_ty=
pe, info->compress_level);
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   752  			}
b7c47bbb2d18563 Tsutomu Itoh          2016-01-06   753  			compress_force =
=3D false;
a555f810af6d63e Chris Mason           2010-01-28   754  			break;
e18e4809b10e6c9 Chris Mason           2008-01-18   755  		case Opt_ssd:
3cdde2240d4533f Jeff Mahoney          2016-06-09   756  			btrfs_set_and_in=
fo(info, SSD,
583b723151794e2 Hans van Kranenburg   2017-07-28   757  					   "enabling s=
sd optimizations");
951e7966398b0fd Adam Borowski         2017-03-31   758  			btrfs_clear_opt(=
info->mount_opt, NOSSD);
e18e4809b10e6c9 Chris Mason           2008-01-18   759  			break;
451d7585a8bb1b9 Chris Mason           2009-06-09   760  		case Opt_ssd_spre=
ad:
583b723151794e2 Hans van Kranenburg   2017-07-28   761  			btrfs_set_and_in=
fo(info, SSD,
583b723151794e2 Hans van Kranenburg   2017-07-28   762  					   "enabling s=
sd optimizations");
3cdde2240d4533f Jeff Mahoney          2016-06-09   763  			btrfs_set_and_in=
fo(info, SSD_SPREAD,
583b723151794e2 Hans van Kranenburg   2017-07-28   764  					   "using spre=
ad ssd allocation scheme");
951e7966398b0fd Adam Borowski         2017-03-31   765  			btrfs_clear_opt(=
info->mount_opt, NOSSD);
451d7585a8bb1b9 Chris Mason           2009-06-09   766  			break;
3b30c22f64a6bb2 Chris Mason           2009-06-09   767  		case Opt_nossd:
583b723151794e2 Hans van Kranenburg   2017-07-28   768  			btrfs_set_opt(in=
fo->mount_opt, NOSSD);
583b723151794e2 Hans van Kranenburg   2017-07-28   769  			btrfs_clear_and_=
info(info, SSD,
583b723151794e2 Hans van Kranenburg   2017-07-28   770  					     "not usin=
g ssd optimizations");
c730ae0c6bb3125 Marcos Paulo de Souza 2020-06-16   771  			fallthrough;
62b8e077317971b Howard McLauchlan     2018-03-08   772  		case Opt_nossd_sp=
read:
583b723151794e2 Hans van Kranenburg   2017-07-28   773  			btrfs_clear_and_=
info(info, SSD_SPREAD,
583b723151794e2 Hans van Kranenburg   2017-07-28   774  					     "not usin=
g spread ssd allocation scheme");
3b30c22f64a6bb2 Chris Mason           2009-06-09   775  			break;
842bef5891aaf13 Qu Wenruo             2014-01-06   776  		case Opt_barrier:
3cdde2240d4533f Jeff Mahoney          2016-06-09   777  			btrfs_clear_and_=
info(info, NOBARRIER,
078025347c8ed43 Qu Wenruo             2014-01-13   778  					     "turning =
on barriers");
842bef5891aaf13 Qu Wenruo             2014-01-06   779  			break;
21ad10cf3e9c1ef Chris Mason           2008-01-09   780  		case Opt_nobarrie=
r:
3cdde2240d4533f Jeff Mahoney          2016-06-09   781  			btrfs_set_and_in=
fo(info, NOBARRIER,
078025347c8ed43 Qu Wenruo             2014-01-13   782  					   "turning of=
f barriers");
21ad10cf3e9c1ef Chris Mason           2008-01-09   783  			break;
4543df7ecc8ae49 Chris Mason           2008-06-11   784  		case Opt_thread_p=
ool:
2c334e87f31783c Wang Shilong          2013-07-24   785  			ret =3D match_in=
t(&args[0], &intarg);
2c334e87f31783c Wang Shilong          2013-07-24   786  			if (ret) {
2c334e87f31783c Wang Shilong          2013-07-24   787  				goto out;
f7b885befd05fa4 Anand Jain            2018-02-13   788  			} else if (intar=
g =3D=3D 0) {
2c334e87f31783c Wang Shilong          2013-07-24   789  				ret =3D -EINVAL;
2c334e87f31783c Wang Shilong          2013-07-24   790  				goto out;
2c334e87f31783c Wang Shilong          2013-07-24   791  			}
f7b885befd05fa4 Anand Jain            2018-02-13   792  			info->thread_poo=
l_size =3D intarg;
4543df7ecc8ae49 Chris Mason           2008-06-11   793  			break;
6f568d35a045dbb Chris Mason           2008-01-29   794  		case Opt_max_inli=
ne:
edf24abe51493cc Christoph Hellwig     2008-06-10   795  			num =3D match_st=
rdup(&args[0]);
6f568d35a045dbb Chris Mason           2008-01-29   796  			if (num) {
91748467a5c5884 Akinobu Mita          2010-02-28   797  				info->max_inlin=
e =3D memparse(num, NULL);
6f568d35a045dbb Chris Mason           2008-01-29   798  				kfree(num);
6f568d35a045dbb Chris Mason           2008-01-29   799  =

15ada040d7cd68d Chris Mason           2008-06-11   800  				if (info->max_i=
nline) {
feb5f96589302b3 Mitch Harder          2014-02-13   801  					info->max_inli=
ne =3D min_t(u64,
15ada040d7cd68d Chris Mason           2008-06-11   802  						info->max_inl=
ine,
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   803  						info->sectors=
ize);
15ada040d7cd68d Chris Mason           2008-06-11   804  				}
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   805  				btrfs_info(info=
, "max_inline at %llu",
c1c9ff7c94e83fa Geert Uytterhoeven    2013-08-20   806  					   info->max_i=
nline);
2c334e87f31783c Wang Shilong          2013-07-24   807  			} else {
2c334e87f31783c Wang Shilong          2013-07-24   808  				ret =3D -ENOMEM;
2c334e87f31783c Wang Shilong          2013-07-24   809  				goto out;
6f568d35a045dbb Chris Mason           2008-01-29   810  			}
6f568d35a045dbb Chris Mason           2008-01-29   811  			break;
bd0330ad2174d1a Qu Wenruo             2014-01-06   812  		case Opt_acl:
45ff35d6b9f301c Guangliang Zhao       2014-05-12   813  #ifdef CONFIG_BTRFS=
_FS_POSIX_ACL
1751e8a6cb935e5 Linus Torvalds        2017-11-27   814  			info->sb->s_flag=
s |=3D SB_POSIXACL;
bd0330ad2174d1a Qu Wenruo             2014-01-06   815  			break;
45ff35d6b9f301c Guangliang Zhao       2014-05-12   816  #else
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   817  			btrfs_err(info, =
"support for ACL not compiled in!");
45ff35d6b9f301c Guangliang Zhao       2014-05-12   818  			ret =3D -EINVAL;
45ff35d6b9f301c Guangliang Zhao       2014-05-12   819  			goto out;
45ff35d6b9f301c Guangliang Zhao       2014-05-12   820  #endif
33268eaf0b3db5e Josef Bacik           2008-07-24   821  		case Opt_noacl:
1751e8a6cb935e5 Linus Torvalds        2017-11-27   822  			info->sb->s_flag=
s &=3D ~SB_POSIXACL;
33268eaf0b3db5e Josef Bacik           2008-07-24   823  			break;
3a5e14048a0a812 Sage Weil             2009-04-02   824  		case Opt_notreelo=
g:
3cdde2240d4533f Jeff Mahoney          2016-06-09   825  			btrfs_set_and_in=
fo(info, NOTREELOG,
078025347c8ed43 Qu Wenruo             2014-01-13   826  					   "disabling =
tree log");
a88998f291fc707 Qu Wenruo             2014-01-06   827  			break;
a88998f291fc707 Qu Wenruo             2014-01-06   828  		case Opt_treelog:
3cdde2240d4533f Jeff Mahoney          2016-06-09   829  			btrfs_clear_and_=
info(info, NOTREELOG,
078025347c8ed43 Qu Wenruo             2014-01-13   830  					     "enabling=
 tree log");
3a5e14048a0a812 Sage Weil             2009-04-02   831  			break;
fed8f166ebf3afb Qu Wenruo             2016-01-19   832  		case Opt_norecove=
ry:
96da09192cda57a Qu Wenruo             2016-01-19   833  		case Opt_nologrep=
lay:
74ef00185eb8642 Qu Wenruo             2020-06-04   834  			btrfs_warn(info,
74ef00185eb8642 Qu Wenruo             2020-06-04   835  		"'nologreplay' is=
 deprecated, use 'rescue=3Dnologreplay' instead");
3cdde2240d4533f Jeff Mahoney          2016-06-09   836  			btrfs_set_and_in=
fo(info, NOLOGREPLAY,
96da09192cda57a Qu Wenruo             2016-01-19   837  					   "disabling =
log replay at mount time");
96da09192cda57a Qu Wenruo             2016-01-19   838  			break;
dccae9999508964 Sage Weil             2009-04-02   839  		case Opt_flushonc=
ommit:
3cdde2240d4533f Jeff Mahoney          2016-06-09   840  			btrfs_set_and_in=
fo(info, FLUSHONCOMMIT,
078025347c8ed43 Qu Wenruo             2014-01-13   841  					   "turning on=
 flush-on-commit");
dccae9999508964 Sage Weil             2009-04-02   842  			break;
2c9ee85671f66cd Qu Wenruo             2014-01-06   843  		case Opt_noflusho=
ncommit:
3cdde2240d4533f Jeff Mahoney          2016-06-09   844  			btrfs_clear_and_=
info(info, FLUSHONCOMMIT,
078025347c8ed43 Qu Wenruo             2014-01-13   845  					     "turning =
off flush-on-commit");
2c9ee85671f66cd Qu Wenruo             2014-01-06   846  			break;
97e728d4353f38c Josef Bacik           2009-04-21   847  		case Opt_ratio:
2c334e87f31783c Wang Shilong          2013-07-24   848  			ret =3D match_in=
t(&args[0], &intarg);
764cb8b43d4d804 Anand Jain            2018-02-13   849  			if (ret)
2c334e87f31783c Wang Shilong          2013-07-24   850  				goto out;
97e728d4353f38c Josef Bacik           2009-04-21   851  			info->metadata_r=
atio =3D intarg;
764cb8b43d4d804 Anand Jain            2018-02-13   852  			btrfs_info(info,=
 "metadata ratio %u",
97e728d4353f38c Josef Bacik           2009-04-21   853  				   info->metada=
ta_ratio);
97e728d4353f38c Josef Bacik           2009-04-21   854  			break;
e244a0aeb6a599c Christoph Hellwig     2009-10-14   855  		case Opt_discard:
b0643e59cfa609c Dennis Zhou           2019-12-13   856  		case Opt_discard_=
mode:
b0643e59cfa609c Dennis Zhou           2019-12-13   857  			if (token =3D=3D=
 Opt_discard ||
b0643e59cfa609c Dennis Zhou           2019-12-13   858  			    strcmp(args[=
0].from, "sync") =3D=3D 0) {
b0643e59cfa609c Dennis Zhou           2019-12-13   859  				btrfs_clear_opt=
(info->mount_opt, DISCARD_ASYNC);
46b27f5059e6ce7 Dennis Zhou           2019-12-13   860  				btrfs_set_and_i=
nfo(info, DISCARD_SYNC,
46b27f5059e6ce7 Dennis Zhou           2019-12-13   861  						   "turning o=
n sync discard");
b0643e59cfa609c Dennis Zhou           2019-12-13   862  			} else if (strcm=
p(args[0].from, "async") =3D=3D 0) {
b0643e59cfa609c Dennis Zhou           2019-12-13   863  				btrfs_clear_opt=
(info->mount_opt, DISCARD_SYNC);
b0643e59cfa609c Dennis Zhou           2019-12-13   864  				btrfs_set_and_i=
nfo(info, DISCARD_ASYNC,
b0643e59cfa609c Dennis Zhou           2019-12-13   865  						   "turning o=
n async discard");
b0643e59cfa609c Dennis Zhou           2019-12-13   866  			} else {
b0643e59cfa609c Dennis Zhou           2019-12-13   867  				ret =3D -EINVAL;
b0643e59cfa609c Dennis Zhou           2019-12-13   868  				goto out;
b0643e59cfa609c Dennis Zhou           2019-12-13   869  			}
e244a0aeb6a599c Christoph Hellwig     2009-10-14   870  			break;
e07a2ade4426a2c Qu Wenruo             2014-01-06   871  		case Opt_nodiscar=
d:
46b27f5059e6ce7 Dennis Zhou           2019-12-13   872  			btrfs_clear_and_=
info(info, DISCARD_SYNC,
078025347c8ed43 Qu Wenruo             2014-01-13   873  					     "turning =
off discard");
b0643e59cfa609c Dennis Zhou           2019-12-13   874  			btrfs_clear_and_=
info(info, DISCARD_ASYNC,
b0643e59cfa609c Dennis Zhou           2019-12-13   875  					     "turning =
off async discard");
e07a2ade4426a2c Qu Wenruo             2014-01-06   876  			break;
0af3d00bad38d3b Josef Bacik           2010-06-21   877  		case Opt_space_ca=
che:
70f6d82ec73c3ae Omar Sandoval         2015-09-29   878  		case Opt_space_ca=
che_version:
70f6d82ec73c3ae Omar Sandoval         2015-09-29   879  			if (token =3D=3D=
 Opt_space_cache ||
70f6d82ec73c3ae Omar Sandoval         2015-09-29   880  			    strcmp(args[=
0].from, "v1") =3D=3D 0) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   881  				btrfs_clear_opt=
(info->mount_opt,
70f6d82ec73c3ae Omar Sandoval         2015-09-29   882  						FREE_SPACE_TR=
EE);
3cdde2240d4533f Jeff Mahoney          2016-06-09   883  				btrfs_set_and_i=
nfo(info, SPACE_CACHE,
078025347c8ed43 Qu Wenruo             2014-01-13   884  					   "enabling d=
isk space caching");
70f6d82ec73c3ae Omar Sandoval         2015-09-29   885  			} else if (strcm=
p(args[0].from, "v2") =3D=3D 0) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   886  				btrfs_clear_opt=
(info->mount_opt,
70f6d82ec73c3ae Omar Sandoval         2015-09-29   887  						SPACE_CACHE);
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   888  				btrfs_set_and_i=
nfo(info, FREE_SPACE_TREE,
70f6d82ec73c3ae Omar Sandoval         2015-09-29   889  						   "enabling =
free space tree");
70f6d82ec73c3ae Omar Sandoval         2015-09-29   890  			} else {
70f6d82ec73c3ae Omar Sandoval         2015-09-29   891  				ret =3D -EINVAL;
70f6d82ec73c3ae Omar Sandoval         2015-09-29   892  				goto out;
70f6d82ec73c3ae Omar Sandoval         2015-09-29   893  			}
0de90876c6cb774 Josef Bacik           2010-11-19   894  			break;
f420ee1e923b931 Stefan Behrens        2013-08-15   895  		case Opt_rescan_u=
uid_tree:
f420ee1e923b931 Stefan Behrens        2013-08-15   896  			btrfs_set_opt(in=
fo->mount_opt, RESCAN_UUID_TREE);
f420ee1e923b931 Stefan Behrens        2013-08-15   897  			break;
73bc187680f94be Josef Bacik           2011-10-03   898  		case Opt_no_space=
_cache:
3cdde2240d4533f Jeff Mahoney          2016-06-09   899  			if (btrfs_test_o=
pt(info, SPACE_CACHE)) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   900  				btrfs_clear_and=
_info(info, SPACE_CACHE,
078025347c8ed43 Qu Wenruo             2014-01-13   901  					     "disablin=
g disk space caching");
70f6d82ec73c3ae Omar Sandoval         2015-09-29   902  			}
3cdde2240d4533f Jeff Mahoney          2016-06-09   903  			if (btrfs_test_o=
pt(info, FREE_SPACE_TREE)) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   904  				btrfs_clear_and=
_info(info, FREE_SPACE_TREE,
70f6d82ec73c3ae Omar Sandoval         2015-09-29   905  					     "disablin=
g free space tree");
70f6d82ec73c3ae Omar Sandoval         2015-09-29   906  			}
73bc187680f94be Josef Bacik           2011-10-03   907  			break;
4b9465cb9e38591 Chris Mason           2011-06-03   908  		case Opt_inode_ca=
che:
3818aea27542323 Qu Wenruo             2014-01-13   909  		case Opt_noinode_=
cache:
5297199a8bca12b Nikolay Borisov       2020-11-26   910  			btrfs_warn(info,
5297199a8bca12b Nikolay Borisov       2020-11-26   911  	"the 'inode_cache'=
 option is deprecated and has no effect since 5.11");
4b9465cb9e38591 Chris Mason           2011-06-03   912  			break;
88c2ba3b069f1e0 Josef Bacik           2010-09-21   913  		case Opt_clear_ca=
che:
3cdde2240d4533f Jeff Mahoney          2016-06-09   914  			btrfs_set_and_in=
fo(info, CLEAR_CACHE,
078025347c8ed43 Qu Wenruo             2014-01-13   915  					   "force clea=
ring of disk cache");
0af3d00bad38d3b Josef Bacik           2010-06-21   916  			break;
4260f7c7516f4c2 Sage Weil             2010-10-29   917  		case Opt_user_sub=
vol_rm_allowed:
4260f7c7516f4c2 Sage Weil             2010-10-29   918  			btrfs_set_opt(in=
fo->mount_opt, USER_SUBVOL_RM_ALLOWED);
4260f7c7516f4c2 Sage Weil             2010-10-29   919  			break;
91435650c233b93 Chris Mason           2011-02-16   920  		case Opt_enospc_d=
ebug:
91435650c233b93 Chris Mason           2011-02-16   921  			btrfs_set_opt(in=
fo->mount_opt, ENOSPC_DEBUG);
91435650c233b93 Chris Mason           2011-02-16   922  			break;
530362934332e4e Qu Wenruo             2014-01-06   923  		case Opt_noenospc=
_debug:
530362934332e4e Qu Wenruo             2014-01-06   924  			btrfs_clear_opt(=
info->mount_opt, ENOSPC_DEBUG);
530362934332e4e Qu Wenruo             2014-01-06   925  			break;
4cb5300bc839b8a Chris Mason           2011-05-24   926  		case Opt_defrag:
3cdde2240d4533f Jeff Mahoney          2016-06-09   927  			btrfs_set_and_in=
fo(info, AUTO_DEFRAG,
078025347c8ed43 Qu Wenruo             2014-01-13   928  					   "enabling a=
uto defrag");
4cb5300bc839b8a Chris Mason           2011-05-24   929  			break;
fc0ca9af180b91a Qu Wenruo             2014-01-06   930  		case Opt_nodefrag:
3cdde2240d4533f Jeff Mahoney          2016-06-09   931  			btrfs_clear_and_=
info(info, AUTO_DEFRAG,
078025347c8ed43 Qu Wenruo             2014-01-13   932  					     "disablin=
g auto defrag");
fc0ca9af180b91a Qu Wenruo             2014-01-06   933  			break;
af31f5e5b84b5bf Chris Mason           2011-11-03   934  		case Opt_recovery:
8dcddfa048de637 Qu Wenruo             2016-01-19   935  		case Opt_usebacku=
proot:
74ef00185eb8642 Qu Wenruo             2020-06-04   936  			btrfs_warn(info,
74ef00185eb8642 Qu Wenruo             2020-06-04   937  			"'%s' is depreca=
ted, use 'rescue=3Dusebackuproot' instead",
74ef00185eb8642 Qu Wenruo             2020-06-04   938  				   token =3D=3D=
 Opt_recovery ? "recovery" :
74ef00185eb8642 Qu Wenruo             2020-06-04   939  				   "usebackupro=
ot");
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   940  			btrfs_info(info,
8dcddfa048de637 Qu Wenruo             2016-01-19   941  				   "trying to u=
se backup root at mount time");
8dcddfa048de637 Qu Wenruo             2016-01-19   942  			btrfs_set_opt(in=
fo->mount_opt, USEBACKUPROOT);
af31f5e5b84b5bf Chris Mason           2011-11-03   943  			break;
9555c6c180600b4 Ilya Dryomov          2012-01-16   944  		case Opt_skip_bal=
ance:
9555c6c180600b4 Ilya Dryomov          2012-01-16   945  			btrfs_set_opt(in=
fo->mount_opt, SKIP_BALANCE);
9555c6c180600b4 Ilya Dryomov          2012-01-16   946  			break;
21adbd5cbb5344a Stefan Behrens        2011-11-09   947  #ifdef CONFIG_BTRFS=
_FS_CHECK_INTEGRITY
21adbd5cbb5344a Stefan Behrens        2011-11-09   948  		case Opt_check_in=
tegrity_including_extent_data:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   949  			btrfs_info(info,
efe120a067c8674 Frank Holton          2013-12-20   950  				   "enabling ch=
eck integrity including extent data");
21adbd5cbb5344a Stefan Behrens        2011-11-09   951  			btrfs_set_opt(in=
fo->mount_opt,
21adbd5cbb5344a Stefan Behrens        2011-11-09   952  				      CHECK_INT=
EGRITY_INCLUDING_EXTENT_DATA);
21adbd5cbb5344a Stefan Behrens        2011-11-09   953  			btrfs_set_opt(in=
fo->mount_opt, CHECK_INTEGRITY);
21adbd5cbb5344a Stefan Behrens        2011-11-09   954  			break;
21adbd5cbb5344a Stefan Behrens        2011-11-09   955  		case Opt_check_in=
tegrity:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   956  			btrfs_info(info,=
 "enabling check integrity");
21adbd5cbb5344a Stefan Behrens        2011-11-09   957  			btrfs_set_opt(in=
fo->mount_opt, CHECK_INTEGRITY);
21adbd5cbb5344a Stefan Behrens        2011-11-09   958  			break;
21adbd5cbb5344a Stefan Behrens        2011-11-09   959  		case Opt_check_in=
tegrity_print_mask:
2c334e87f31783c Wang Shilong          2013-07-24   960  			ret =3D match_in=
t(&args[0], &intarg);
02453bdeb02482c Anand Jain            2018-02-13   961  			if (ret)
2c334e87f31783c Wang Shilong          2013-07-24   962  				goto out;
21adbd5cbb5344a Stefan Behrens        2011-11-09   963  			info->check_inte=
grity_print_mask =3D intarg;
02453bdeb02482c Anand Jain            2018-02-13   964  			btrfs_info(info,=
 "check_integrity_print_mask 0x%x",
21adbd5cbb5344a Stefan Behrens        2011-11-09   965  				   info->check_=
integrity_print_mask);
21adbd5cbb5344a Stefan Behrens        2011-11-09   966  			break;
21adbd5cbb5344a Stefan Behrens        2011-11-09   967  #else
21adbd5cbb5344a Stefan Behrens        2011-11-09   968  		case Opt_check_in=
tegrity_including_extent_data:
21adbd5cbb5344a Stefan Behrens        2011-11-09   969  		case Opt_check_in=
tegrity:
21adbd5cbb5344a Stefan Behrens        2011-11-09   970  		case Opt_check_in=
tegrity_print_mask:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   971  			btrfs_err(info,
efe120a067c8674 Frank Holton          2013-12-20   972  				  "support for =
check_integrity* not compiled in!");
21adbd5cbb5344a Stefan Behrens        2011-11-09   973  			ret =3D -EINVAL;
21adbd5cbb5344a Stefan Behrens        2011-11-09   974  			goto out;
21adbd5cbb5344a Stefan Behrens        2011-11-09   975  #endif
8c3429300181be4 Jeff Mahoney          2011-10-03   976  		case Opt_fatal_er=
rors:
8c3429300181be4 Jeff Mahoney          2011-10-03   977  			if (strcmp(args[=
0].from, "panic") =3D=3D 0)
8c3429300181be4 Jeff Mahoney          2011-10-03   978  				btrfs_set_opt(i=
nfo->mount_opt,
8c3429300181be4 Jeff Mahoney          2011-10-03   979  					      PANIC_ON=
_FATAL_ERROR);
8c3429300181be4 Jeff Mahoney          2011-10-03   980  			else if (strcmp(=
args[0].from, "bug") =3D=3D 0)
8c3429300181be4 Jeff Mahoney          2011-10-03   981  				btrfs_clear_opt=
(info->mount_opt,
8c3429300181be4 Jeff Mahoney          2011-10-03   982  					      PANIC_ON=
_FATAL_ERROR);
8c3429300181be4 Jeff Mahoney          2011-10-03   983  			else {
8c3429300181be4 Jeff Mahoney          2011-10-03   984  				ret =3D -EINVAL;
8c3429300181be4 Jeff Mahoney          2011-10-03   985  				goto out;
8c3429300181be4 Jeff Mahoney          2011-10-03   986  			}
8c3429300181be4 Jeff Mahoney          2011-10-03   987  			break;
8b87dc17fbc7443 David Sterba          2013-08-01   988  		case Opt_commit_i=
nterval:
8b87dc17fbc7443 David Sterba          2013-08-01   989  			intarg =3D 0;
8b87dc17fbc7443 David Sterba          2013-08-01   990  			ret =3D match_in=
t(&args[0], &intarg);
d3740608646f72f Anand Jain            2018-02-13   991  			if (ret)
8b87dc17fbc7443 David Sterba          2013-08-01   992  				goto out;
d3740608646f72f Anand Jain            2018-02-13   993  			if (intarg =3D=
=3D 0) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22   994  				btrfs_info(info,
d3740608646f72f Anand Jain            2018-02-13   995  					   "using defa=
ult commit interval %us",
8b87dc17fbc7443 David Sterba          2013-08-01   996  					   BTRFS_DEFAU=
LT_COMMIT_INTERVAL);
d3740608646f72f Anand Jain            2018-02-13   997  				intarg =3D BTRF=
S_DEFAULT_COMMIT_INTERVAL;
d3740608646f72f Anand Jain            2018-02-13   998  			} else if (intar=
g > 300) {
d3740608646f72f Anand Jain            2018-02-13   999  				btrfs_warn(info=
, "excessive commit interval %d",
d3740608646f72f Anand Jain            2018-02-13  1000  					   intarg);
8b87dc17fbc7443 David Sterba          2013-08-01  1001  			}
d3740608646f72f Anand Jain            2018-02-13  1002  			info->commit_int=
erval =3D intarg;
8b87dc17fbc7443 David Sterba          2013-08-01  1003  			break;
74ef00185eb8642 Qu Wenruo             2020-06-04  1004  		case Opt_rescue:
74ef00185eb8642 Qu Wenruo             2020-06-04  1005  			ret =3D parse_re=
scue_options(info, args[0].from);
74ef00185eb8642 Qu Wenruo             2020-06-04  1006  			if (ret < 0)
74ef00185eb8642 Qu Wenruo             2020-06-04  1007  				goto out;
74ef00185eb8642 Qu Wenruo             2020-06-04  1008  			break;
d0bd456074dca08 Josef Bacik           2015-09-23  1009  #ifdef CONFIG_BTRFS=
_DEBUG
d0bd456074dca08 Josef Bacik           2015-09-23  1010  		case Opt_fragment=
_all:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1011  			btrfs_info(info,=
 "fragmenting all space");
d0bd456074dca08 Josef Bacik           2015-09-23  1012  			btrfs_set_opt(in=
fo->mount_opt, FRAGMENT_DATA);
d0bd456074dca08 Josef Bacik           2015-09-23  1013  			btrfs_set_opt(in=
fo->mount_opt, FRAGMENT_METADATA);
d0bd456074dca08 Josef Bacik           2015-09-23  1014  			break;
d0bd456074dca08 Josef Bacik           2015-09-23  1015  		case Opt_fragment=
_metadata:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1016  			btrfs_info(info,=
 "fragmenting metadata");
d0bd456074dca08 Josef Bacik           2015-09-23  1017  			btrfs_set_opt(in=
fo->mount_opt,
d0bd456074dca08 Josef Bacik           2015-09-23  1018  				      FRAGMENT_=
METADATA);
d0bd456074dca08 Josef Bacik           2015-09-23  1019  			break;
d0bd456074dca08 Josef Bacik           2015-09-23  1020  		case Opt_fragment=
_data:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1021  			btrfs_info(info,=
 "fragmenting data");
d0bd456074dca08 Josef Bacik           2015-09-23  1022  			btrfs_set_opt(in=
fo->mount_opt, FRAGMENT_DATA);
d0bd456074dca08 Josef Bacik           2015-09-23  1023  			break;
fb592373cddeb4e Josef Bacik           2017-09-29  1024  #endif
fb592373cddeb4e Josef Bacik           2017-09-29  1025  #ifdef CONFIG_BTRFS=
_FS_REF_VERIFY
fb592373cddeb4e Josef Bacik           2017-09-29  1026  		case Opt_ref_veri=
fy:
fb592373cddeb4e Josef Bacik           2017-09-29  1027  			btrfs_info(info,=
 "doing ref verification");
fb592373cddeb4e Josef Bacik           2017-09-29  1028  			btrfs_set_opt(in=
fo->mount_opt, REF_VERIFY);
fb592373cddeb4e Josef Bacik           2017-09-29  1029  			break;
d0bd456074dca08 Josef Bacik           2015-09-23  1030  #endif
a7a3f7cadd9bdee Sage Weil             2009-11-07  1031  		case Opt_err:
7e8f19e50e3ccf0 David Sterba          2019-11-27  1032  			btrfs_err(info, =
"unrecognized mount option '%s'", p);
a7a3f7cadd9bdee Sage Weil             2009-11-07  1033  			ret =3D -EINVAL;
a7a3f7cadd9bdee Sage Weil             2009-11-07  1034  			goto out;
95e0528919cb0c7 Chris Mason           2007-08-29  1035  		default:
be20aa9dbadc8c0 Chris Mason           2007-12-17  1036  			break;
95e0528919cb0c7 Chris Mason           2007-08-29  1037  		}
95e0528919cb0c7 Chris Mason           2007-08-29  1038  	}
96da09192cda57a Qu Wenruo             2016-01-19  1039  check:
d70bf7484f72870 Josef Bacik           2020-10-16  1040  	/* We're read-only=
, don't have to check. */
d70bf7484f72870 Josef Bacik           2020-10-16  1041  	if (new_flags & SB=
_RDONLY)
d70bf7484f72870 Josef Bacik           2020-10-16  1042  		goto out;
d70bf7484f72870 Josef Bacik           2020-10-16  1043  =

42437a6386ffeaa Josef Bacik           2020-10-16  1044  	if (check_ro_optio=
n(info, BTRFS_MOUNT_NOLOGREPLAY, "nologreplay") ||
882dbe0cec9651b Josef Bacik           2020-10-16  1045  	    check_ro_optio=
n(info, BTRFS_MOUNT_IGNOREBADROOTS, "ignorebadroots") ||
882dbe0cec9651b Josef Bacik           2020-10-16  1046  	    check_ro_optio=
n(info, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums"))
96da09192cda57a Qu Wenruo             2016-01-19  1047  		ret =3D -EINVAL;
a7a3f7cadd9bdee Sage Weil             2009-11-07  1048  out:
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1049  	if (btrfs_fs_compa=
t_ro(info, FREE_SPACE_TREE) &&
3cdde2240d4533f Jeff Mahoney          2016-06-09  1050  	    !btrfs_test_op=
t(info, FREE_SPACE_TREE) &&
3cdde2240d4533f Jeff Mahoney          2016-06-09  1051  	    !btrfs_test_op=
t(info, CLEAR_CACHE)) {
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1052  		btrfs_err(info, "=
cannot disable free space tree");
70f6d82ec73c3ae Omar Sandoval         2015-09-29  1053  		ret =3D -EINVAL;
70f6d82ec73c3ae Omar Sandoval         2015-09-29  1054  =

70f6d82ec73c3ae Omar Sandoval         2015-09-29  1055  	}
5d1ab66c56fed15 Naohiro Aota          2020-11-10  1056  	if (!ret)
5d1ab66c56fed15 Naohiro Aota          2020-11-10  1057  		ret =3D btrfs_che=
ck_mountopts_zoned(info);
3cdde2240d4533f Jeff Mahoney          2016-06-09  1058  	if (!ret && btrfs_=
test_opt(info, SPACE_CACHE))
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1059  		btrfs_info(info, =
"disk space caching is enabled");
3cdde2240d4533f Jeff Mahoney          2016-06-09  1060  	if (!ret && btrfs_=
test_opt(info, FREE_SPACE_TREE))
0b246afa62b0cf5 Jeff Mahoney          2016-06-22  1061  		btrfs_info(info, =
"using free space tree");
a7a3f7cadd9bdee Sage Weil             2009-11-07  1062  	return ret;
edf24abe51493cc Christoph Hellwig     2008-06-10  1063  }
edf24abe51493cc Christoph Hellwig     2008-06-10  1064  =


:::::: The code at line 622 was first introduced by commit
:::::: de37679d72d66b90447da1c06cebdae13c21097a btrfs: add authentication s=
upport

:::::: TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8683487510730810773==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8683487510730810773==--

