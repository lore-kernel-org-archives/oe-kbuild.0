Content-Type: multipart/mixed; boundary="===============2904542693046983727=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/super.c:5656 ext4_fill_super() error: we previously assumed 'sbi' could be null (see line 5648)
Date: Tue, 18 Jan 2022 22:47:18 +0800
Message-ID: <202201182249.eXYOFfs9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2904542693046983727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe81ba137ebcc7f236780996a0b375732c07e85c
commit: cebe85d570cf84804e848332d6721bc9e5300e07 ext4: switch to the new mo=
unt api
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m031-20220117 (https://download.01.org/0day-ci/arch=
ive/20220118/202201182249.eXYOFfs9-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/super.c:5656 ext4_fill_super() error: we previously assumed 'sbi' c=
ould be null (see line 5648)

Old smatch warnings:
fs/ext4/super.c:2231 ext4_init_fs_context() warn: struct type mismatch 'xfs=
_fs_context vs ext4_fs_context'
fs/ext4/super.c:2959 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:2967 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:2970 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:4165 ext4_register_li_request() error: we previously assume=
d 'ext4_li_info' could be null (see line 4147)
fs/ext4/super.c:4867 __ext4_fill_super() warn: bitwise AND condition is fal=
se here

vim +/sbi +5656 fs/ext4/super.c

ac27a0ec112a08 Dave Kleikamp 2006-10-11  5639  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5640  static int ext4_fill_super(s=
truct super_block *sb, struct fs_context *fc)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5641  {
cebe85d570cf84 Lukas Czerner 2021-10-27  5642  	struct ext4_fs_context *ctx=
 =3D fc->fs_private;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5643  	struct ext4_sb_info *sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5644  	const char *descr;
cebe85d570cf84 Lukas Czerner 2021-10-27  5645  	int ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5646  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5647  	sbi =3D ext4_alloc_sbi(sb);
cebe85d570cf84 Lukas Czerner 2021-10-27 @5648  	if (!sbi)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5649  		ret =3D -ENOMEM;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5650  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5651  	fc->s_fs_info =3D sbi;
cebe85d570cf84 Lukas Czerner 2021-10-27  5652  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5653  	/* Cleanup superblock name =
*/
cebe85d570cf84 Lukas Czerner 2021-10-27  5654  	strreplace(sb->s_id, '/', '=
!');
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5655  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27 @5656  	sbi->s_sb_block =3D 1;	/* D=
efault super block location */
cebe85d570cf84 Lukas Czerner 2021-10-27  5657  	if (ctx->spec & EXT4_SPEC_s=
_sb_block)
cebe85d570cf84 Lukas Czerner 2021-10-27  5658  		sbi->s_sb_block =3D ctx->s=
_sb_block;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5659  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5660  	ret =3D __ext4_fill_super(f=
c, sb, fc->sb_flags & SB_SILENT);
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5661  	if (ret < 0)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5662  		goto free_sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5663  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5664  	if (sbi->s_journal) {
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5665  		if (test_opt(sb, DATA_FLAG=
S) =3D=3D EXT4_MOUNT_JOURNAL_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5666  			descr =3D " journalled da=
ta mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5667  		else if (test_opt(sb, DATA=
_FLAGS) =3D=3D EXT4_MOUNT_ORDERED_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5668  			descr =3D " ordered data =
mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5669  		else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5670  			descr =3D " writeback dat=
a mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5671  	} else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5672  		descr =3D "out journal";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5673  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5674  	if (___ratelimit(&ext4_moun=
t_msg_ratelimit, "EXT4-fs mount"))
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5675  		ext4_msg(sb, KERN_INFO, "m=
ounted filesystem with%s. "
cebe85d570cf84 Lukas Czerner 2021-10-27  5676  			 "Quota mode: %s.", descr=
, ext4_quota_mode(sb));
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5677  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5678  	return 0;
cebe85d570cf84 Lukas Czerner 2021-10-27  5679  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5680  free_sbi:
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5681  	ext4_free_sbi(sbi);
cebe85d570cf84 Lukas Czerner 2021-10-27  5682  	fc->s_fs_info =3D NULL;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5683  	return ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5684  }
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5685  =


:::::: The code at line 5656 was first introduced by commit
:::::: 7edfd85b1ffd36593011dec96ab395912a340418 ext4: Completely separate o=
ptions parsing and sb setup

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2904542693046983727==--

