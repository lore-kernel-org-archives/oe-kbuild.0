Content-Type: multipart/mixed; boundary="===============9091706630392200633=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/super.c:2893 ext4_check_opt_consistency() warn: bitwise AND condition is false here
Date: Tue, 18 Jan 2022 19:14:16 +0800
Message-ID: <202201181800.EJjLoMd2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9091706630392200633==
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
head:   e3a8b6a1e70c37702054ae3c7c07ed828435d8ee
commit: 6e47a3cc68fc525428297a00524833361ebbb0e9 ext4: get rid of super blo=
ck and sbi from handle_mount_ops()
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m031-20220117 (https://download.01.org/0day-ci/arch=
ive/20220118/202201181800.EJjLoMd2-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/super.c:2893 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here

Old smatch warnings:
fs/ext4/super.c:2901 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:2904 ext4_check_opt_consistency() warn: bitwise AND conditi=
on is false here
fs/ext4/super.c:4099 ext4_register_li_request() error: we previously assume=
d 'ext4_li_info' could be null (see line 4081)
fs/ext4/super.c:4788 ext4_fill_super() warn: bitwise AND condition is false=
 here

vim +2893 fs/ext4/super.c

6e47a3cc68fc52 Lukas Czerner 2021-10-27  2870  =

6e47a3cc68fc52 Lukas Czerner 2021-10-27  2871  	if ((ctx->spec & EXT4_SPEC_=
DATAJ) && is_remount) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2872  		if (!sbi->s_journal) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2873  			ext4_msg(NULL, KERN_WARNI=
NG,
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2874  				 "Remounting file system=
 with no journal "
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2875  				 "so ignoring journalled=
 data option");
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2876  			ctx_clear_mount_opt(ctx, =
EXT4_MOUNT_DATA_FLAGS);
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2877  		} else if (ctx->mask_s_mou=
nt_opt & EXT4_MOUNT_DATA_FLAGS) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2878  			ext4_msg(NULL, KERN_ERR, =
"Cannot change data mode "
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2879  				 "on remount");
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2880  			return -EINVAL;
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2881  		}
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2882  	}
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2883  =

6e47a3cc68fc52 Lukas Czerner 2021-10-27  2884  	if (is_remount) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2885  		if (ctx_test_mount_opt(ctx=
, EXT4_MOUNT_DAX_ALWAYS) &&
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2886  		    (test_opt(sb, DATA_FLA=
GS) =3D=3D EXT4_MOUNT_JOURNAL_DATA)) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2887  			ext4_msg(NULL, KERN_ERR, =
"can't mount with "
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2888  				 "both data=3Djournal an=
d dax");
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2889  			return -EINVAL;
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2890  		}
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2891  =

6e47a3cc68fc52 Lukas Czerner 2021-10-27  2892  		if (ctx_test_mount_opt(ctx=
, EXT4_MOUNT_DAX_ALWAYS) &&
6e47a3cc68fc52 Lukas Czerner 2021-10-27 @2893  		    (!(sbi->s_mount_opt & =
EXT4_MOUNT_DAX_ALWAYS) ||
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2894  		     (sbi->s_mount_opt2 & =
EXT4_MOUNT2_DAX_NEVER))) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2895  fail_dax_change_remount:
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2896  			ext4_msg(NULL, KERN_ERR, =
"can't change "
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2897  				 "dax mount option while=
 remounting");
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2898  			return -EINVAL;
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2899  		} else if (ctx_test_mount_=
opt2(ctx, EXT4_MOUNT2_DAX_NEVER) &&
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2900  			 (!(sbi->s_mount_opt2 & E=
XT4_MOUNT2_DAX_NEVER) ||
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2901  			  (sbi->s_mount_opt & EXT=
4_MOUNT_DAX_ALWAYS))) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2902  			goto fail_dax_change_remo=
unt;
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2903  		} else if (ctx_test_mount_=
opt2(ctx, EXT4_MOUNT2_DAX_INODE) &&
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2904  			   ((sbi->s_mount_opt & E=
XT4_MOUNT_DAX_ALWAYS) ||
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2905  			    (sbi->s_mount_opt2 & =
EXT4_MOUNT2_DAX_NEVER) ||
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2906  			    !(sbi->s_mount_opt2 &=
 EXT4_MOUNT2_DAX_INODE))) {
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2907  			goto fail_dax_change_remo=
unt;
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2908  		}
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2909  	}
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2910  =

b6bd243500b602 Lukas Czerner 2021-10-27  2911  	return ext4_check_quota_con=
sistency(fc, sb);
b6bd243500b602 Lukas Czerner 2021-10-27  2912  }
b6bd243500b602 Lukas Czerner 2021-10-27  2913  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9091706630392200633==--

