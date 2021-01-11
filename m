Content-Type: multipart/mixed; boundary="===============3123393305614340010=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/super.c:512:4: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Mon, 11 Jan 2021 11:31:46 +0800
Message-ID: <202101111138.k1J1oBDG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3123393305614340010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7c53f6b671f4aba70ff15e1b05148b10d58c2837
commit: 882dbe0cec9651bf6a6df500178149453726c1e1 btrfs: introduce mount opt=
ion rescue=3Dignoredatacsums
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


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

vim +512 fs/btrfs/super.c

d70bf7484f728704 Josef Bacik 2020-10-16  477  =

74ef00185eb86425 Qu Wenruo   2020-06-04  478  static int parse_rescue_optio=
ns(struct btrfs_fs_info *info, const char *options)
74ef00185eb86425 Qu Wenruo   2020-06-04  479  {
74ef00185eb86425 Qu Wenruo   2020-06-04  480  	char *opts;
74ef00185eb86425 Qu Wenruo   2020-06-04  481  	char *orig;
74ef00185eb86425 Qu Wenruo   2020-06-04  482  	char *p;
74ef00185eb86425 Qu Wenruo   2020-06-04  483  	substring_t args[MAX_OPT_ARG=
S];
74ef00185eb86425 Qu Wenruo   2020-06-04  484  	int ret =3D 0;
74ef00185eb86425 Qu Wenruo   2020-06-04  485  =

74ef00185eb86425 Qu Wenruo   2020-06-04  486  	opts =3D kstrdup(options, GF=
P_KERNEL);
74ef00185eb86425 Qu Wenruo   2020-06-04  487  	if (!opts)
74ef00185eb86425 Qu Wenruo   2020-06-04  488  		return -ENOMEM;
74ef00185eb86425 Qu Wenruo   2020-06-04  489  	orig =3D opts;
74ef00185eb86425 Qu Wenruo   2020-06-04  490  =

74ef00185eb86425 Qu Wenruo   2020-06-04  491  	while ((p =3D strsep(&opts, =
":")) !=3D NULL) {
74ef00185eb86425 Qu Wenruo   2020-06-04  492  		int token;
74ef00185eb86425 Qu Wenruo   2020-06-04  493  =

74ef00185eb86425 Qu Wenruo   2020-06-04  494  		if (!*p)
74ef00185eb86425 Qu Wenruo   2020-06-04  495  			continue;
74ef00185eb86425 Qu Wenruo   2020-06-04  496  		token =3D match_token(p, re=
scue_tokens, args);
74ef00185eb86425 Qu Wenruo   2020-06-04  497  		switch (token){
74ef00185eb86425 Qu Wenruo   2020-06-04  498  		case Opt_usebackuproot:
74ef00185eb86425 Qu Wenruo   2020-06-04  499  			btrfs_info(info,
74ef00185eb86425 Qu Wenruo   2020-06-04  500  				   "trying to use backup =
root at mount time");
74ef00185eb86425 Qu Wenruo   2020-06-04  501  			btrfs_set_opt(info->mount_=
opt, USEBACKUPROOT);
74ef00185eb86425 Qu Wenruo   2020-06-04  502  			break;
74ef00185eb86425 Qu Wenruo   2020-06-04  503  		case Opt_nologreplay:
74ef00185eb86425 Qu Wenruo   2020-06-04  504  			btrfs_set_and_info(info, N=
OLOGREPLAY,
74ef00185eb86425 Qu Wenruo   2020-06-04  505  					   "disabling log replay=
 at mount time");
74ef00185eb86425 Qu Wenruo   2020-06-04  506  			break;
42437a6386ffeaaf Josef Bacik 2020-10-16  507  		case Opt_ignorebadroots:
42437a6386ffeaaf Josef Bacik 2020-10-16  508  			btrfs_set_and_info(info, I=
GNOREBADROOTS,
42437a6386ffeaaf Josef Bacik 2020-10-16  509  					   "ignoring bad roots");
42437a6386ffeaaf Josef Bacik 2020-10-16  510  			break;
882dbe0cec9651bf Josef Bacik 2020-10-16  511  		case Opt_ignoredatacsums:
882dbe0cec9651bf Josef Bacik 2020-10-16 @512  			btrfs_set_and_info(info, I=
GNOREDATACSUMS,
882dbe0cec9651bf Josef Bacik 2020-10-16  513  					   "ignoring data csums"=
);
882dbe0cec9651bf Josef Bacik 2020-10-16  514  			break;
74ef00185eb86425 Qu Wenruo   2020-06-04  515  		case Opt_err:
74ef00185eb86425 Qu Wenruo   2020-06-04  516  			btrfs_info(info, "unrecogn=
ized rescue option '%s'", p);
74ef00185eb86425 Qu Wenruo   2020-06-04  517  			ret =3D -EINVAL;
74ef00185eb86425 Qu Wenruo   2020-06-04  518  			goto out;
74ef00185eb86425 Qu Wenruo   2020-06-04  519  		default:
74ef00185eb86425 Qu Wenruo   2020-06-04  520  			break;
74ef00185eb86425 Qu Wenruo   2020-06-04  521  		}
74ef00185eb86425 Qu Wenruo   2020-06-04  522  =

74ef00185eb86425 Qu Wenruo   2020-06-04  523  	}
74ef00185eb86425 Qu Wenruo   2020-06-04  524  out:
74ef00185eb86425 Qu Wenruo   2020-06-04  525  	kfree(orig);
74ef00185eb86425 Qu Wenruo   2020-06-04  526  	return ret;
74ef00185eb86425 Qu Wenruo   2020-06-04  527  }
74ef00185eb86425 Qu Wenruo   2020-06-04  528  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3123393305614340010==--

