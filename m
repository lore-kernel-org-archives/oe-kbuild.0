Content-Type: multipart/mixed; boundary="===============8364201771379231384=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:cleanups/for-5.11 189/212] fs/btrfs/super.c:512:4: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Wed, 28 Oct 2020 05:21:52 +0800
Message-ID: <202010280550.yxiGLlef-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8364201771379231384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git cleanups/for-5.11
head:   9dddeb88c165fa04226527f3a29e16a937b257be
commit: 3e531707a942139e400eeee50bdc95e2e5f8c649 [189/212] btrfs: introduce=
 mount option rescue=3Dignoredatacsums
:::::: branch date: 5 hours ago
:::::: commit date: 7 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   fs/btrfs/disk-io.c:193:29: warning: Uninitialized variable: ks [uninitva=
r]
    BUG_ON(level >=3D ARRAY_SIZE(ks->keys));
                               ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/btrfs/super.c:512:4: warning: Shifting signed 32-bit value by 31 bits=
 is undefined behaviour [shiftTooManyBitsSigned]
      btrfs_set_and_info(info, IGNOREDATACSUMS,
      ^
   fs/btrfs/super.c:1002:28: warning: Shifting signed 32-bit value by 31 bi=
ts is undefined behaviour [shiftTooManyBitsSigned]
        check_ro_option(info, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums=
"))
                              ^
   fs/btrfs/super.c:1460:6: warning: Shifting signed 32-bit value by 31 bit=
s is undefined behaviour [shiftTooManyBitsSigned]
    if (btrfs_test_opt(info, IGNOREDATACSUMS))
        ^
>> fs/btrfs/disk-io.c:2333:7: warning: Shifting signed 32-bit value by 31 b=
its is undefined behaviour [shiftTooManyBitsSigned]
    if (!btrfs_test_opt(fs_info, IGNOREDATACSUMS)) {
         ^

vim +512 fs/btrfs/super.c

8b8d9e040154f6e Josef Bacik 2020-10-16  477  =

74ef00185eb8642 Qu Wenruo   2020-06-04  478  static int parse_rescue_option=
s(struct btrfs_fs_info *info, const char *options)
74ef00185eb8642 Qu Wenruo   2020-06-04  479  {
74ef00185eb8642 Qu Wenruo   2020-06-04  480  	char *opts;
74ef00185eb8642 Qu Wenruo   2020-06-04  481  	char *orig;
74ef00185eb8642 Qu Wenruo   2020-06-04  482  	char *p;
74ef00185eb8642 Qu Wenruo   2020-06-04  483  	substring_t args[MAX_OPT_ARGS=
];
74ef00185eb8642 Qu Wenruo   2020-06-04  484  	int ret =3D 0;
74ef00185eb8642 Qu Wenruo   2020-06-04  485  =

74ef00185eb8642 Qu Wenruo   2020-06-04  486  	opts =3D kstrdup(options, GFP=
_KERNEL);
74ef00185eb8642 Qu Wenruo   2020-06-04  487  	if (!opts)
74ef00185eb8642 Qu Wenruo   2020-06-04  488  		return -ENOMEM;
74ef00185eb8642 Qu Wenruo   2020-06-04  489  	orig =3D opts;
74ef00185eb8642 Qu Wenruo   2020-06-04  490  =

74ef00185eb8642 Qu Wenruo   2020-06-04  491  	while ((p =3D strsep(&opts, "=
:")) !=3D NULL) {
74ef00185eb8642 Qu Wenruo   2020-06-04  492  		int token;
74ef00185eb8642 Qu Wenruo   2020-06-04  493  =

74ef00185eb8642 Qu Wenruo   2020-06-04  494  		if (!*p)
74ef00185eb8642 Qu Wenruo   2020-06-04  495  			continue;
74ef00185eb8642 Qu Wenruo   2020-06-04  496  		token =3D match_token(p, res=
cue_tokens, args);
74ef00185eb8642 Qu Wenruo   2020-06-04  497  		switch (token){
74ef00185eb8642 Qu Wenruo   2020-06-04  498  		case Opt_usebackuproot:
74ef00185eb8642 Qu Wenruo   2020-06-04  499  			btrfs_info(info,
74ef00185eb8642 Qu Wenruo   2020-06-04  500  				   "trying to use backup r=
oot at mount time");
74ef00185eb8642 Qu Wenruo   2020-06-04  501  			btrfs_set_opt(info->mount_o=
pt, USEBACKUPROOT);
74ef00185eb8642 Qu Wenruo   2020-06-04  502  			break;
74ef00185eb8642 Qu Wenruo   2020-06-04  503  		case Opt_nologreplay:
74ef00185eb8642 Qu Wenruo   2020-06-04  504  			btrfs_set_and_info(info, NO=
LOGREPLAY,
74ef00185eb8642 Qu Wenruo   2020-06-04  505  					   "disabling log replay =
at mount time");
74ef00185eb8642 Qu Wenruo   2020-06-04  506  			break;
c5f2c3cd2d5eb4d Josef Bacik 2020-10-16  507  		case Opt_ignorebadroots:
c5f2c3cd2d5eb4d Josef Bacik 2020-10-16  508  			btrfs_set_and_info(info, IG=
NOREBADROOTS,
c5f2c3cd2d5eb4d Josef Bacik 2020-10-16  509  					   "ignoring bad roots");
c5f2c3cd2d5eb4d Josef Bacik 2020-10-16  510  			break;
3e531707a942139 Josef Bacik 2020-10-16  511  		case Opt_ignoredatacsums:
3e531707a942139 Josef Bacik 2020-10-16 @512  			btrfs_set_and_info(info, IG=
NOREDATACSUMS,
3e531707a942139 Josef Bacik 2020-10-16  513  					   "ignoring data csums");
3e531707a942139 Josef Bacik 2020-10-16  514  			break;
74ef00185eb8642 Qu Wenruo   2020-06-04  515  		case Opt_err:
74ef00185eb8642 Qu Wenruo   2020-06-04  516  			btrfs_info(info, "unrecogni=
zed rescue option '%s'", p);
74ef00185eb8642 Qu Wenruo   2020-06-04  517  			ret =3D -EINVAL;
74ef00185eb8642 Qu Wenruo   2020-06-04  518  			goto out;
74ef00185eb8642 Qu Wenruo   2020-06-04  519  		default:
74ef00185eb8642 Qu Wenruo   2020-06-04  520  			break;
74ef00185eb8642 Qu Wenruo   2020-06-04  521  		}
74ef00185eb8642 Qu Wenruo   2020-06-04  522  =

74ef00185eb8642 Qu Wenruo   2020-06-04  523  	}
74ef00185eb8642 Qu Wenruo   2020-06-04  524  out:
74ef00185eb8642 Qu Wenruo   2020-06-04  525  	kfree(orig);
74ef00185eb8642 Qu Wenruo   2020-06-04  526  	return ret;
74ef00185eb8642 Qu Wenruo   2020-06-04  527  }
74ef00185eb8642 Qu Wenruo   2020-06-04  528  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8364201771379231384==--

