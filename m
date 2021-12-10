Content-Type: multipart/mixed; boundary="===============3842922313262040949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tytso-ext4:dev 6/13] fs/ext4/super.c:2658:21-39: ERROR: reference preceded by free on line 2657
Date: Sat, 11 Dec 2021 00:20:44 +0800
Message-ID: <202112110042.aftjriSY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3842922313262040949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-ext4(a)vger.kernel.org
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   ba2e524d918ab72c0e5edc02354bd6cb43d005f8
commit: e6e268cb682290da29e3c8408493a4474307b8cc [6/13] ext4: move quota co=
nfiguration out of handle_mount_opt()
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: powerpc-randconfig-c024-20211210 (https://download.01.org/0day-ci/a=
rchive/20211211/202112110042.aftjriSY-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/ext4/super.c:2658:21-39: ERROR: reference preceded by free on line 26=
57

vim +2658 fs/ext4/super.c

4c94bff967d90e Lukas Czerner 2021-10-27  2642  =

e6e268cb682290 Lukas Czerner 2021-10-27  2643  static void ext4_apply_quota=
_options(struct fs_context *fc,
e6e268cb682290 Lukas Czerner 2021-10-27  2644  				     struct super_block =
*sb)
e6e268cb682290 Lukas Czerner 2021-10-27  2645  {
e6e268cb682290 Lukas Czerner 2021-10-27  2646  #ifdef CONFIG_QUOTA
e6e268cb682290 Lukas Czerner 2021-10-27  2647  	struct ext4_fs_context *ctx=
 =3D fc->fs_private;
e6e268cb682290 Lukas Czerner 2021-10-27  2648  	struct ext4_sb_info *sbi =
=3D EXT4_SB(sb);
e6e268cb682290 Lukas Czerner 2021-10-27  2649  	char *qname;
e6e268cb682290 Lukas Czerner 2021-10-27  2650  	int i;
e6e268cb682290 Lukas Czerner 2021-10-27  2651  =

e6e268cb682290 Lukas Czerner 2021-10-27  2652  	for (i =3D 0; i < EXT4_MAXQ=
UOTAS; i++) {
e6e268cb682290 Lukas Czerner 2021-10-27  2653  		if (!(ctx->qname_spec & (1=
 << i)))
e6e268cb682290 Lukas Czerner 2021-10-27  2654  			continue;
e6e268cb682290 Lukas Czerner 2021-10-27  2655  		qname =3D ctx->s_qf_names[=
i]; /* May be NULL */
e6e268cb682290 Lukas Czerner 2021-10-27  2656  		ctx->s_qf_names[i] =3D NUL=
L;
e6e268cb682290 Lukas Czerner 2021-10-27 @2657  		kfree(sbi->s_qf_names[i]);
e6e268cb682290 Lukas Czerner 2021-10-27 @2658  		rcu_assign_pointer(sbi->s_=
qf_names[i], qname);
e6e268cb682290 Lukas Czerner 2021-10-27  2659  		set_opt(sb, QUOTA);
e6e268cb682290 Lukas Czerner 2021-10-27  2660  	}
e6e268cb682290 Lukas Czerner 2021-10-27  2661  #endif
e6e268cb682290 Lukas Czerner 2021-10-27  2662  }
e6e268cb682290 Lukas Czerner 2021-10-27  2663  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3842922313262040949==--

