Content-Type: multipart/mixed; boundary="===============2812130096051746839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] ext4: Use buckets for cr 1 block scan instead of rbtree
Date: Wed, 07 Sep 2022 12:51:58 +0800
Message-ID: <202209071206.u1iHKVzB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2812130096051746839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906152920.25584-5-jack@suse.cz>
References: <20220906152920.25584-5-jack@suse.cz>
TO: Jan Kara <jack@suse.cz>
TO: Ted Tso <tytso@mit.edu>
CC: linux-ext4(a)vger.kernel.org
CC: Thorsten Leemhuis <regressions@leemhuis.info>
CC: Ojaswin Mujoo <ojaswin@linux.ibm.com>
CC: Stefan Wahren <stefan.wahren@i2se.com>
CC: Andreas Dilger <adilger.kernel@dilger.ca>
CC: Jan Kara <jack@suse.cz>

Hi Jan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/ext4-Fix-pe=
rformance-regression-with-mballoc/20220907-000945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
53e99dcff61e1523ec1c3628b2d564ba15d32eb7
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: m68k-randconfig-m041-20220906 (https://download.01.org/0day-ci/arch=
ive/20220907/202209071206.u1iHKVzB-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/mballoc.c:945 ext4_mb_choose_next_group_cr1() error: uninitialized =
symbol 'grp'.

Old smatch warnings:
arch/m68k/include/asm/bitops.h:266 arch___test_and_clear_bit() warn: signed=
ness bug returning '(-128)'
fs/ext4/mballoc.c:3960 ext4_mb_mark_bb() error: uninitialized symbol 'err'.

vim +/grp +945 fs/ext4/mballoc.c

196e402adf2e4c Harshad Shirwadkar 2021-04-01  904  =

196e402adf2e4c Harshad Shirwadkar 2021-04-01  905  /*
196e402adf2e4c Harshad Shirwadkar 2021-04-01  906   * Choose next group by =
traversing average fragment size tree. Updates *new_cr
31b571b608cf66 Jan Kara           2022-09-06  907   * if cr level needs an =
update. =

196e402adf2e4c Harshad Shirwadkar 2021-04-01  908   */
196e402adf2e4c Harshad Shirwadkar 2021-04-01  909  static void ext4_mb_choo=
se_next_group_cr1(struct ext4_allocation_context *ac,
196e402adf2e4c Harshad Shirwadkar 2021-04-01  910  		int *new_cr, ext4_grou=
p_t *group, ext4_group_t ngroups)
196e402adf2e4c Harshad Shirwadkar 2021-04-01  911  {
196e402adf2e4c Harshad Shirwadkar 2021-04-01  912  	struct ext4_sb_info *sb=
i =3D EXT4_SB(ac->ac_sb);
31b571b608cf66 Jan Kara           2022-09-06  913  	struct ext4_group_info =
*grp, *iter;
31b571b608cf66 Jan Kara           2022-09-06  914  	int i;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  915  =

196e402adf2e4c Harshad Shirwadkar 2021-04-01  916  	if (unlikely(ac->ac_fla=
gs & EXT4_MB_CR1_OPTIMIZED)) {
196e402adf2e4c Harshad Shirwadkar 2021-04-01  917  		if (sbi->s_mb_stats)
196e402adf2e4c Harshad Shirwadkar 2021-04-01  918  			atomic_inc(&sbi->s_ba=
l_cr1_bad_suggestions);
31b571b608cf66 Jan Kara           2022-09-06  919  	}
31b571b608cf66 Jan Kara           2022-09-06  920  =

31b571b608cf66 Jan Kara           2022-09-06  921  	for (i =3D mb_avg_fragm=
ent_size_order(ac->ac_sb, ac->ac_g_ex.fe_len);
31b571b608cf66 Jan Kara           2022-09-06  922  	     i < MB_NUM_ORDERS(=
ac->ac_sb); i++) {
31b571b608cf66 Jan Kara           2022-09-06  923  		if (list_empty(&sbi->s=
_mb_avg_fragment_size[i]))
31b571b608cf66 Jan Kara           2022-09-06  924  			continue;
31b571b608cf66 Jan Kara           2022-09-06  925  		read_lock(&sbi->s_mb_a=
vg_fragment_size_locks[i]);
31b571b608cf66 Jan Kara           2022-09-06  926  		if (list_empty(&sbi->s=
_mb_avg_fragment_size[i])) {
31b571b608cf66 Jan Kara           2022-09-06  927  			read_unlock(&sbi->s_m=
b_largest_free_orders_locks[i]);
31b571b608cf66 Jan Kara           2022-09-06  928  			continue;
31b571b608cf66 Jan Kara           2022-09-06  929  		}
31b571b608cf66 Jan Kara           2022-09-06  930  		grp =3D NULL;
31b571b608cf66 Jan Kara           2022-09-06  931  		list_for_each_entry(it=
er, &sbi->s_mb_avg_fragment_size[i],
31b571b608cf66 Jan Kara           2022-09-06  932  				    bb_avg_fragment_=
size_node) {
196e402adf2e4c Harshad Shirwadkar 2021-04-01  933  			if (sbi->s_mb_stats)
196e402adf2e4c Harshad Shirwadkar 2021-04-01  934  				atomic64_inc(&sbi->s=
_bal_cX_groups_considered[1]);
31b571b608cf66 Jan Kara           2022-09-06  935  			if (likely(ext4_mb_go=
od_group(ac, iter->bb_group, 1))) {
31b571b608cf66 Jan Kara           2022-09-06  936  				grp =3D iter;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  937  				break;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  938  			}
196e402adf2e4c Harshad Shirwadkar 2021-04-01  939  		}
31b571b608cf66 Jan Kara           2022-09-06  940  		read_unlock(&sbi->s_mb=
_avg_fragment_size_locks[i]);
31b571b608cf66 Jan Kara           2022-09-06  941  		if (grp)
31b571b608cf66 Jan Kara           2022-09-06  942  			break;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  943  	}
196e402adf2e4c Harshad Shirwadkar 2021-04-01  944  =

31b571b608cf66 Jan Kara           2022-09-06 @945  	if (grp) {
196e402adf2e4c Harshad Shirwadkar 2021-04-01  946  		*group =3D grp->bb_gro=
up;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  947  		ac->ac_flags |=3D EXT4=
_MB_CR1_OPTIMIZED;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  948  	} else {
196e402adf2e4c Harshad Shirwadkar 2021-04-01  949  		*new_cr =3D 2;
196e402adf2e4c Harshad Shirwadkar 2021-04-01  950  	}
196e402adf2e4c Harshad Shirwadkar 2021-04-01  951  }
196e402adf2e4c Harshad Shirwadkar 2021-04-01  952  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2812130096051746839==--

