Content-Type: multipart/mixed; boundary="===============4885379767152541826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] btrfs: prevent remounting to v1 space cache for subpage mount
Date: Tue, 17 May 2022 22:38:29 +0800
Message-ID: <202205172208.qdyoDwJs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4885379767152541826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1e09cf20ca9309f2b9daf57136c3e2c1b22f94f6.1652682383.git.wqu(a=
)suse.com>
References: <1e09cf20ca9309f2b9daf57136c3e2c1b22f94f6.1652682383.git.wqu@=
suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs(a)vger.kernel.org

Hi Qu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.18-rc7 next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-prev=
ent-remounting-to-v1-space-cache-for-subpage-mount/20220516-142802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021-20220516 (https://download.01.org/0day-ci/arch=
ive/20220517/202205172208.qdyoDwJs-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/super.c:1994 btrfs_remount() warn: missing error code 'ret'

vim +/ret +1994 fs/btrfs/super.c

dc81cdc58ad2f4 Miao Xie           2013-02-20  1958  =

c146afad2c7fea Yan Zheng          2008-11-12  1959  static int btrfs_remoun=
t(struct super_block *sb, int *flags, char *data)
c146afad2c7fea Yan Zheng          2008-11-12  1960  {
815745cf3e4668 Al Viro            2011-11-17  1961  	struct btrfs_fs_info *=
fs_info =3D btrfs_sb(sb);
49b25e0540904b Jeff Mahoney       2012-03-01  1962  	unsigned old_flags =3D=
 sb->s_flags;
49b25e0540904b Jeff Mahoney       2012-03-01  1963  	unsigned long old_opts=
 =3D fs_info->mount_opt;
49b25e0540904b Jeff Mahoney       2012-03-01  1964  	unsigned long old_comp=
ress_type =3D fs_info->compress_type;
49b25e0540904b Jeff Mahoney       2012-03-01  1965  	u64 old_max_inline =3D=
 fs_info->max_inline;
f7b885befd05fa Anand Jain         2018-02-13  1966  	u32 old_thread_pool_si=
ze =3D fs_info->thread_pool_size;
d612ac59efc3b5 Anand Jain         2018-02-26  1967  	u32 old_metadata_ratio=
 =3D fs_info->metadata_ratio;
c146afad2c7fea Yan Zheng          2008-11-12  1968  	int ret;
c146afad2c7fea Yan Zheng          2008-11-12  1969  =

02b9984d640873 Theodore Ts'o      2014-03-13  1970  	sync_filesystem(sb);
88c4703f00a9e8 Johannes Thumshirn 2020-07-23  1971  	set_bit(BTRFS_FS_STATE=
_REMOUNTING, &fs_info->fs_state);
dc81cdc58ad2f4 Miao Xie           2013-02-20  1972  =

f667aef6af626d Qu Wenruo          2014-09-23  1973  	if (data) {
204cc0ccf1d49c Al Viro            2018-12-13  1974  		void *new_sec_opts =
=3D NULL;
f667aef6af626d Qu Wenruo          2014-09-23  1975  =

a65001e8a4d465 Al Viro            2018-12-10  1976  		ret =3D security_sb_e=
at_lsm_opts(data, &new_sec_opts);
a65001e8a4d465 Al Viro            2018-12-10  1977  		if (!ret)
204cc0ccf1d49c Al Viro            2018-12-13  1978  			ret =3D security_sb_=
remount(sb, new_sec_opts);
f667aef6af626d Qu Wenruo          2014-09-23  1979  		security_free_mnt_opt=
s(&new_sec_opts);
a65001e8a4d465 Al Viro            2018-12-10  1980  		if (ret)
f667aef6af626d Qu Wenruo          2014-09-23  1981  			goto restore;
f667aef6af626d Qu Wenruo          2014-09-23  1982  	}
f667aef6af626d Qu Wenruo          2014-09-23  1983  =

2ff7e61e0d30ff Jeff Mahoney       2016-06-22  1984  	ret =3D btrfs_parse_op=
tions(fs_info, data, *flags);
891f41cb27cf50 Chengguang Xu      2018-05-09  1985  	if (ret)
49b25e0540904b Jeff Mahoney       2012-03-01  1986  		goto restore;
b288052e177926 Chris Mason        2009-02-12  1987  =

fd847878aa1f3c Qu Wenruo          2022-05-16  1988  	/* V1 cache is not sup=
ported for subpage mount. */
fd847878aa1f3c Qu Wenruo          2022-05-16  1989  	if (fs_info->sectorsiz=
e < PAGE_SIZE &&
fd847878aa1f3c Qu Wenruo          2022-05-16  1990  	    btrfs_test_opt(fs_=
info, SPACE_CACHE)) {
fd847878aa1f3c Qu Wenruo          2022-05-16  1991  		btrfs_warn(fs_info,
fd847878aa1f3c Qu Wenruo          2022-05-16  1992  	"v1 space cache is not=
 supported for page size %lu with sectorsize %u",
fd847878aa1f3c Qu Wenruo          2022-05-16  1993  			   PAGE_SIZE, fs_inf=
o->sectorsize);
fd847878aa1f3c Qu Wenruo          2022-05-16 @1994  		goto restore;
fd847878aa1f3c Qu Wenruo          2022-05-16  1995  	}
f42a34b2f10c41 Miao Xie           2013-04-11  1996  	btrfs_remount_begin(fs=
_info, old_opts, *flags);
0d2450abfa359f Sergei Trofimovich 2012-04-24  1997  	btrfs_resize_thread_po=
ol(fs_info,
0d2450abfa359f Sergei Trofimovich 2012-04-24  1998  		fs_info->thread_pool_=
size, old_thread_pool_size);
0d2450abfa359f Sergei Trofimovich 2012-04-24  1999  =

c55a4319c4f2c3 Boris Burkov       2021-02-23  2000  	if ((bool)btrfs_test_o=
pt(fs_info, FREE_SPACE_TREE) !=3D
c55a4319c4f2c3 Boris Burkov       2021-02-23  2001  	    (bool)btrfs_fs_com=
pat_ro(fs_info, FREE_SPACE_TREE) &&
2838d255cb9b85 Boris Burkov       2020-11-18  2002  	    (!sb_rdonly(sb) ||=
 (*flags & SB_RDONLY))) {
2838d255cb9b85 Boris Burkov       2020-11-18  2003  		btrfs_warn(fs_info,
2838d255cb9b85 Boris Burkov       2020-11-18  2004  		"remount supports cha=
nging free space tree only from ro to rw");
2838d255cb9b85 Boris Burkov       2020-11-18  2005  		/* Make sure free spa=
ce cache options match the state on disk */
2838d255cb9b85 Boris Burkov       2020-11-18  2006  		if (btrfs_fs_compat_r=
o(fs_info, FREE_SPACE_TREE)) {
2838d255cb9b85 Boris Burkov       2020-11-18  2007  			btrfs_set_opt(fs_inf=
o->mount_opt, FREE_SPACE_TREE);
2838d255cb9b85 Boris Burkov       2020-11-18  2008  			btrfs_clear_opt(fs_i=
nfo->mount_opt, SPACE_CACHE);
2838d255cb9b85 Boris Burkov       2020-11-18  2009  		}
2838d255cb9b85 Boris Burkov       2020-11-18  2010  		if (btrfs_free_space_=
cache_v1_active(fs_info)) {
2838d255cb9b85 Boris Burkov       2020-11-18  2011  			btrfs_clear_opt(fs_i=
nfo->mount_opt, FREE_SPACE_TREE);
2838d255cb9b85 Boris Burkov       2020-11-18  2012  			btrfs_set_opt(fs_inf=
o->mount_opt, SPACE_CACHE);
2838d255cb9b85 Boris Burkov       2020-11-18  2013  		}
2838d255cb9b85 Boris Burkov       2020-11-18  2014  	}
2838d255cb9b85 Boris Burkov       2020-11-18  2015  =

1751e8a6cb935e Linus Torvalds     2017-11-27  2016  	if ((bool)(*flags & SB=
_RDONLY) =3D=3D sb_rdonly(sb))
dc81cdc58ad2f4 Miao Xie           2013-02-20  2017  		goto out;
c146afad2c7fea Yan Zheng          2008-11-12  2018  =

1751e8a6cb935e Linus Torvalds     2017-11-27  2019  	if (*flags & SB_RDONLY=
) {
8dabb7420f014a Stefan Behrens     2012-11-06  2020  		/*
8dabb7420f014a Stefan Behrens     2012-11-06  2021  		 * this also happens =
on 'umount -rf' or on shutdown, when
8dabb7420f014a Stefan Behrens     2012-11-06  2022  		 * the filesystem is =
busy.
8dabb7420f014a Stefan Behrens     2012-11-06  2023  		 */
21c7e75654b77b Miao Xie           2014-05-13  2024  		cancel_work_sync(&fs_=
info->async_reclaim_work);
5705674081cee7 Josef Bacik        2020-07-21  2025  		cancel_work_sync(&fs_=
info->async_data_reclaim_work);
361c093d7f99c3 Stefan Behrens     2013-10-11  2026  =

b0643e59cfa609 Dennis Zhou        2019-12-13  2027  		btrfs_discard_cleanup=
(fs_info);
b0643e59cfa609 Dennis Zhou        2019-12-13  2028  =

361c093d7f99c3 Stefan Behrens     2013-10-11  2029  		/* wait for the uuid_=
scan task to finish */
361c093d7f99c3 Stefan Behrens     2013-10-11  2030  		down(&fs_info->uuid_t=
ree_rescan_sem);
361c093d7f99c3 Stefan Behrens     2013-10-11  2031  		/* avoid complains fr=
om lockdep et al. */
361c093d7f99c3 Stefan Behrens     2013-10-11  2032  		up(&fs_info->uuid_tre=
e_rescan_sem);
361c093d7f99c3 Stefan Behrens     2013-10-11  2033  =

a0a1db70df5f48 Filipe Manana      2020-12-14  2034  		btrfs_set_sb_rdonly(s=
b);
c146afad2c7fea Yan Zheng          2008-11-12  2035  =

e44163e177960e Jeff Mahoney       2015-06-15  2036  		/*
1751e8a6cb935e Linus Torvalds     2017-11-27  2037  		 * Setting SB_RDONLY =
will put the cleaner thread to
e44163e177960e Jeff Mahoney       2015-06-15  2038  		 * sleep at the next =
loop if it's already active.
e44163e177960e Jeff Mahoney       2015-06-15  2039  		 * If it's already as=
leep, we'll leave unused block
e44163e177960e Jeff Mahoney       2015-06-15  2040  		 * groups on disk unt=
il we're mounted read-write again
e44163e177960e Jeff Mahoney       2015-06-15  2041  		 * unless we clean th=
em up here.
e44163e177960e Jeff Mahoney       2015-06-15  2042  		 */
e44163e177960e Jeff Mahoney       2015-06-15  2043  		btrfs_delete_unused_b=
gs(fs_info);
e44163e177960e Jeff Mahoney       2015-06-15  2044  =

a0a1db70df5f48 Filipe Manana      2020-12-14  2045  		/*
a0a1db70df5f48 Filipe Manana      2020-12-14  2046  		 * The cleaner task c=
ould be already running before we set the
a0a1db70df5f48 Filipe Manana      2020-12-14  2047  		 * flag BTRFS_FS_STAT=
E_RO (and SB_RDONLY in the superblock).
a0a1db70df5f48 Filipe Manana      2020-12-14  2048  		 * We must make sure =
that after we finish the remount, i.e. after
a0a1db70df5f48 Filipe Manana      2020-12-14  2049  		 * we call btrfs_comm=
it_super(), the cleaner can no longer start
a0a1db70df5f48 Filipe Manana      2020-12-14  2050  		 * a transaction - ei=
ther because it was dropping a dead root,
a0a1db70df5f48 Filipe Manana      2020-12-14  2051  		 * running delayed ip=
uts or deleting an unused block group (the
a0a1db70df5f48 Filipe Manana      2020-12-14  2052  		 * cleaner picked a b=
lock group from the list of unused block
a0a1db70df5f48 Filipe Manana      2020-12-14  2053  		 * groups before we w=
ere able to in the previous call to
a0a1db70df5f48 Filipe Manana      2020-12-14  2054  		 * btrfs_delete_unuse=
d_bgs()).
a0a1db70df5f48 Filipe Manana      2020-12-14  2055  		 */
a0a1db70df5f48 Filipe Manana      2020-12-14  2056  		wait_on_bit(&fs_info-=
>flags, BTRFS_FS_CLEANER_RUNNING,
a0a1db70df5f48 Filipe Manana      2020-12-14  2057  			    TASK_UNINTERRUPT=
IBLE);
a0a1db70df5f48 Filipe Manana      2020-12-14  2058  =

a8cc263eb58ca1 Filipe Manana      2020-12-14  2059  		/*
a8cc263eb58ca1 Filipe Manana      2020-12-14  2060  		 * We've set the supe=
rblock to RO mode, so we might have made
a8cc263eb58ca1 Filipe Manana      2020-12-14  2061  		 * the cleaner task s=
leep without running all pending delayed
a8cc263eb58ca1 Filipe Manana      2020-12-14  2062  		 * iputs. Go through =
all the delayed iputs here, so that if an
a8cc263eb58ca1 Filipe Manana      2020-12-14  2063  		 * unmount happens wi=
thout remounting RW we don't end up at
a8cc263eb58ca1 Filipe Manana      2020-12-14  2064  		 * finishing close_ct=
ree() with a non-empty list of delayed
a8cc263eb58ca1 Filipe Manana      2020-12-14  2065  		 * iputs.
a8cc263eb58ca1 Filipe Manana      2020-12-14  2066  		 */
a8cc263eb58ca1 Filipe Manana      2020-12-14  2067  		btrfs_run_delayed_ipu=
ts(fs_info);
a8cc263eb58ca1 Filipe Manana      2020-12-14  2068  =

8dabb7420f014a Stefan Behrens     2012-11-06  2069  		btrfs_dev_replace_sus=
pend_for_unmount(fs_info);
8dabb7420f014a Stefan Behrens     2012-11-06  2070  		btrfs_scrub_cancel(fs=
_info);
061594ef171a5b Miao Xie           2013-05-15  2071  		btrfs_pause_balance(f=
s_info);
8dabb7420f014a Stefan Behrens     2012-11-06  2072  =

cb13eea3b49055 Filipe Manana      2020-12-14  2073  		/*
cb13eea3b49055 Filipe Manana      2020-12-14  2074  		 * Pause the qgroup r=
escan worker if it is running. We don't want
cb13eea3b49055 Filipe Manana      2020-12-14  2075  		 * it to be still run=
ning after we are in RO mode, as after that,
cb13eea3b49055 Filipe Manana      2020-12-14  2076  		 * by the time we unm=
ount, it might have left a transaction open,
cb13eea3b49055 Filipe Manana      2020-12-14  2077  		 * so we would leak t=
he transaction and/or crash.
cb13eea3b49055 Filipe Manana      2020-12-14  2078  		 */
cb13eea3b49055 Filipe Manana      2020-12-14  2079  		btrfs_qgroup_wait_for=
_completion(fs_info, false);
cb13eea3b49055 Filipe Manana      2020-12-14  2080  =

6bccf3ab1e1f09 Jeff Mahoney       2016-06-21  2081  		ret =3D btrfs_commit_=
super(fs_info);
49b25e0540904b Jeff Mahoney       2012-03-01  2082  		if (ret)
49b25e0540904b Jeff Mahoney       2012-03-01  2083  			goto restore;
c146afad2c7fea Yan Zheng          2008-11-12  2084  	} else {
849615394515cc Josef Bacik        2021-10-05  2085  		if (BTRFS_FS_ERROR(fs=
_info)) {
6ef3de9c9252b1 David Sterba       2013-09-13  2086  			btrfs_err(fs_info,
efe120a067c867 Frank Holton       2013-12-20  2087  				"Remounting read-wr=
ite after error is not allowed");
6ef3de9c9252b1 David Sterba       2013-09-13  2088  			ret =3D -EINVAL;
6ef3de9c9252b1 David Sterba       2013-09-13  2089  			goto restore;
6ef3de9c9252b1 David Sterba       2013-09-13  2090  		}
8a3db1849e9e25 Sergei Trofimovich 2012-04-16  2091  		if (fs_info->fs_devic=
es->rw_devices =3D=3D 0) {
49b25e0540904b Jeff Mahoney       2012-03-01  2092  			ret =3D -EACCES;
49b25e0540904b Jeff Mahoney       2012-03-01  2093  			goto restore;
8a3db1849e9e25 Sergei Trofimovich 2012-04-16  2094  		}
2b82032c34ec40 Yan Zheng          2008-11-17  2095  =

6528b99d3d2079 Anand Jain         2017-12-18  2096  		if (!btrfs_check_rw_d=
egradable(fs_info, NULL)) {
efe120a067c867 Frank Holton       2013-12-20  2097  			btrfs_warn(fs_info,
52042d8e82ff50 Andrea Gelmini     2018-11-28  2098  		"too many missing dev=
ices, writable remount is not allowed");
292fd7fc39aa06 Stefan Behrens     2012-10-30  2099  			ret =3D -EACCES;
292fd7fc39aa06 Stefan Behrens     2012-10-30  2100  			goto restore;
292fd7fc39aa06 Stefan Behrens     2012-10-30  2101  		}
292fd7fc39aa06 Stefan Behrens     2012-10-30  2102  =

8a3db1849e9e25 Sergei Trofimovich 2012-04-16  2103  		if (btrfs_super_log_r=
oot(fs_info->super_copy) !=3D 0) {
10a3a3edc5b89a David Sterba       2020-02-05  2104  			btrfs_warn(fs_info,
10a3a3edc5b89a David Sterba       2020-02-05  2105  		"mount required to re=
play tree-log, cannot remount read-write");
49b25e0540904b Jeff Mahoney       2012-03-01  2106  			ret =3D -EINVAL;
49b25e0540904b Jeff Mahoney       2012-03-01  2107  			goto restore;
8a3db1849e9e25 Sergei Trofimovich 2012-04-16  2108  		}
c146afad2c7fea Yan Zheng          2008-11-12  2109  =

44c0ca211a4da9 Boris Burkov       2020-11-18  2110  		/*
44c0ca211a4da9 Boris Burkov       2020-11-18  2111  		 * NOTE: when remount=
ing with a change that does writes, don't
44c0ca211a4da9 Boris Burkov       2020-11-18  2112  		 * put it anywhere ab=
ove this point, as we are not sure to be
44c0ca211a4da9 Boris Burkov       2020-11-18  2113  		 * safe to write unti=
l we pass the above checks.
44c0ca211a4da9 Boris Burkov       2020-11-18  2114  		 */
44c0ca211a4da9 Boris Burkov       2020-11-18  2115  		ret =3D btrfs_start_p=
re_rw_mount(fs_info);
2b6ba629b5aac5 Ilya Dryomov       2012-06-22  2116  		if (ret)
2b6ba629b5aac5 Ilya Dryomov       2012-06-22  2117  			goto restore;
2b6ba629b5aac5 Ilya Dryomov       2012-06-22  2118  =

a0a1db70df5f48 Filipe Manana      2020-12-14  2119  		btrfs_clear_sb_rdonly=
(sb);
90c711ab380d63 Zygo Blaxell       2016-06-12  2120  =

afcdd129e05a92 Josef Bacik        2016-09-02  2121  		set_bit(BTRFS_FS_OPEN=
, &fs_info->flags);
c146afad2c7fea Yan Zheng          2008-11-12  2122  	}
dc81cdc58ad2f4 Miao Xie           2013-02-20  2123  out:
faa008899a4db2 Josef Bacik        2020-07-30  2124  	/*
faa008899a4db2 Josef Bacik        2020-07-30  2125  	 * We need to set SB_I=
_VERSION here otherwise it'll get cleared by VFS,
faa008899a4db2 Josef Bacik        2020-07-30  2126  	 * since the absence o=
f the flag means it can be toggled off by remount.
faa008899a4db2 Josef Bacik        2020-07-30  2127  	 */
faa008899a4db2 Josef Bacik        2020-07-30  2128  	*flags |=3D SB_I_VERSI=
ON;
faa008899a4db2 Josef Bacik        2020-07-30  2129  =

2c6a92b0097464 Justin Maggard     2014-02-20  2130  	wake_up_process(fs_inf=
o->transaction_kthread);
dc81cdc58ad2f4 Miao Xie           2013-02-20  2131  	btrfs_remount_cleanup(=
fs_info, old_opts);
8cd2908846d11a Boris Burkov       2020-11-18  2132  	btrfs_clear_oneshot_op=
tions(fs_info);
88c4703f00a9e8 Johannes Thumshirn 2020-07-23  2133  	clear_bit(BTRFS_FS_STA=
TE_REMOUNTING, &fs_info->fs_state);
88c4703f00a9e8 Johannes Thumshirn 2020-07-23  2134  =

c146afad2c7fea Yan Zheng          2008-11-12  2135  	return 0;
49b25e0540904b Jeff Mahoney       2012-03-01  2136  =

49b25e0540904b Jeff Mahoney       2012-03-01  2137  restore:
1751e8a6cb935e Linus Torvalds     2017-11-27  2138  	/* We've hit an error =
- don't reset SB_RDONLY */
bc98a42c1f7d0f David Howells      2017-07-17  2139  	if (sb_rdonly(sb))
1751e8a6cb935e Linus Torvalds     2017-11-27  2140  		old_flags |=3D SB_RDO=
NLY;
a0a1db70df5f48 Filipe Manana      2020-12-14  2141  	if (!(old_flags & SB_R=
DONLY))
a0a1db70df5f48 Filipe Manana      2020-12-14  2142  		clear_bit(BTRFS_FS_ST=
ATE_RO, &fs_info->fs_state);
49b25e0540904b Jeff Mahoney       2012-03-01  2143  	sb->s_flags =3D old_fl=
ags;
49b25e0540904b Jeff Mahoney       2012-03-01  2144  	fs_info->mount_opt =3D=
 old_opts;
49b25e0540904b Jeff Mahoney       2012-03-01  2145  	fs_info->compress_type=
 =3D old_compress_type;
49b25e0540904b Jeff Mahoney       2012-03-01  2146  	fs_info->max_inline =
=3D old_max_inline;
0d2450abfa359f Sergei Trofimovich 2012-04-24  2147  	btrfs_resize_thread_po=
ol(fs_info,
0d2450abfa359f Sergei Trofimovich 2012-04-24  2148  		old_thread_pool_size,=
 fs_info->thread_pool_size);
49b25e0540904b Jeff Mahoney       2012-03-01  2149  	fs_info->metadata_rati=
o =3D old_metadata_ratio;
dc81cdc58ad2f4 Miao Xie           2013-02-20  2150  	btrfs_remount_cleanup(=
fs_info, old_opts);
88c4703f00a9e8 Johannes Thumshirn 2020-07-23  2151  	clear_bit(BTRFS_FS_STA=
TE_REMOUNTING, &fs_info->fs_state);
88c4703f00a9e8 Johannes Thumshirn 2020-07-23  2152  =

49b25e0540904b Jeff Mahoney       2012-03-01  2153  	return ret;
c146afad2c7fea Yan Zheng          2008-11-12  2154  }
c146afad2c7fea Yan Zheng          2008-11-12  2155  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4885379767152541826==--

