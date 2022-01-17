Content-Type: multipart/mixed; boundary="===============1443607821272336784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 99/334] fs/xfs/scrub/fscounters.c:198 xchk_fscounters_freeze() warn: inconsistent returns '&sb->s_umount'.
Date: Mon, 17 Jan 2022 09:48:51 +0800
Message-ID: <202201170928.GcIhOWMI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1443607821272336784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   8427da8e62fbcf9a04e5b2663fe60b97d6911417
commit: 8dd594d12f08acc6c6fa388b2cae3e270bf8effc [99/334] xfs: stabilize fs=
 summary counters for online fsck
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m031-20220116 (https://download.01.org/0day-ci/arch=
ive/20220117/202201170928.GcIhOWMI-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/scrub/fscounters.c:198 xchk_fscounters_freeze() warn: inconsistent r=
eturns '&sb->s_umount'.

vim +198 fs/xfs/scrub/fscounters.c

8dd594d12f08acc Darrick J. Wong 2022-01-06  117  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  118  /*
8dd594d12f08acc Darrick J. Wong 2022-01-06  119   * We couldn't stabilize t=
he filesystem long enough to sample all the variables
8dd594d12f08acc Darrick J. Wong 2022-01-06  120   * that comprise the summa=
ry counters and compare them to the percpu counters.
8dd594d12f08acc Darrick J. Wong 2022-01-06  121   * We need to disable all =
writer threads, which means taking the first two
8dd594d12f08acc Darrick J. Wong 2022-01-06  122   * freeze levels to put us=
erspace to sleep, and the third freeze level to
8dd594d12f08acc Darrick J. Wong 2022-01-06  123   * prevent background thre=
ads from starting new transactions.
8dd594d12f08acc Darrick J. Wong 2022-01-06  124   */
8dd594d12f08acc Darrick J. Wong 2022-01-06  125  STATIC int
8dd594d12f08acc Darrick J. Wong 2022-01-06  126  xchk_fscounters_freeze(
8dd594d12f08acc Darrick J. Wong 2022-01-06  127  	struct xfs_scrub	*sc)
8dd594d12f08acc Darrick J. Wong 2022-01-06  128  {
8dd594d12f08acc Darrick J. Wong 2022-01-06  129  	struct xchk_fscounters	*f=
sc =3D sc->buf;
8dd594d12f08acc Darrick J. Wong 2022-01-06  130  	struct xfs_mount	*mp =3D =
sc->mp;
8dd594d12f08acc Darrick J. Wong 2022-01-06  131  	struct super_block	*sb =
=3D mp->m_super;
8dd594d12f08acc Darrick J. Wong 2022-01-06  132  	int			level;
8dd594d12f08acc Darrick J. Wong 2022-01-06  133  	int			error =3D 0;
8dd594d12f08acc Darrick J. Wong 2022-01-06  134  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  135  	if (sc->flags & XCHK_HAVE=
_FREEZE_PROT) {
8dd594d12f08acc Darrick J. Wong 2022-01-06  136  		sc->flags &=3D ~XCHK_HAV=
E_FREEZE_PROT;
8dd594d12f08acc Darrick J. Wong 2022-01-06  137  		mnt_drop_write_file(sc->=
file);
8dd594d12f08acc Darrick J. Wong 2022-01-06  138  	}
8dd594d12f08acc Darrick J. Wong 2022-01-06  139  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  140  	/* Wait until we're ready=
 to freeze or give up. */
8dd594d12f08acc Darrick J. Wong 2022-01-06  141  	down_write(&sb->s_umount);
8dd594d12f08acc Darrick J. Wong 2022-01-06  142  	while (sb->s_writers.froz=
en !=3D SB_UNFROZEN) {
8dd594d12f08acc Darrick J. Wong 2022-01-06  143  		up_write(&sb->s_umount);
8dd594d12f08acc Darrick J. Wong 2022-01-06  144  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  145  		if (xchk_should_terminat=
e(sc, &error))
8dd594d12f08acc Darrick J. Wong 2022-01-06  146  			return error;
8dd594d12f08acc Darrick J. Wong 2022-01-06  147  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  148  		delay(HZ / 10);
8dd594d12f08acc Darrick J. Wong 2022-01-06  149  		down_write(&sb->s_umount=
);
8dd594d12f08acc Darrick J. Wong 2022-01-06  150  	}
8dd594d12f08acc Darrick J. Wong 2022-01-06  151  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  152  	if (sb_rdonly(sb)) {
8dd594d12f08acc Darrick J. Wong 2022-01-06  153  		sb->s_writers.frozen =3D=
 SB_FREEZE_EXCLUSIVE;
8dd594d12f08acc Darrick J. Wong 2022-01-06  154  		goto done;
8dd594d12f08acc Darrick J. Wong 2022-01-06  155  	}
8dd594d12f08acc Darrick J. Wong 2022-01-06  156  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  157  	sb->s_writers.frozen =3D =
SB_FREEZE_WRITE;
8dd594d12f08acc Darrick J. Wong 2022-01-06  158  	/* Release s_umount to pr=
eserve sb_start_write -> s_umount ordering */
8dd594d12f08acc Darrick J. Wong 2022-01-06  159  	up_write(&sb->s_umount);
8dd594d12f08acc Darrick J. Wong 2022-01-06  160  	percpu_down_write(sb->s_w=
riters.rw_sem + SB_FREEZE_WRITE - 1);
8dd594d12f08acc Darrick J. Wong 2022-01-06  161  	down_write(&sb->s_umount);
8dd594d12f08acc Darrick J. Wong 2022-01-06  162  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  163  	/* Now we go and block pa=
ge faults... */
8dd594d12f08acc Darrick J. Wong 2022-01-06  164  	sb->s_writers.frozen =3D =
SB_FREEZE_PAGEFAULT;
8dd594d12f08acc Darrick J. Wong 2022-01-06  165  	percpu_down_write(sb->s_w=
riters.rw_sem + SB_FREEZE_PAGEFAULT - 1);
8dd594d12f08acc Darrick J. Wong 2022-01-06  166  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  167  	/*
8dd594d12f08acc Darrick J. Wong 2022-01-06  168  	 * All writers are done s=
o after syncing there won't be dirty data.
8dd594d12f08acc Darrick J. Wong 2022-01-06  169  	 * Let xfs_fs_sync_fs flu=
sh dirty data so the VFS won't start writeback
8dd594d12f08acc Darrick J. Wong 2022-01-06  170  	 * and to disable the bac=
kground gc workers.
8dd594d12f08acc Darrick J. Wong 2022-01-06  171  	 */
8dd594d12f08acc Darrick J. Wong 2022-01-06  172  	error =3D sync_filesystem=
(sb);
8dd594d12f08acc Darrick J. Wong 2022-01-06  173  	if (error) {
8dd594d12f08acc Darrick J. Wong 2022-01-06  174  		sb->s_writers.frozen =3D=
 SB_UNFROZEN;
8dd594d12f08acc Darrick J. Wong 2022-01-06  175  		for (level =3D SB_FREEZE=
_PAGEFAULT; level >=3D 0; level--)
8dd594d12f08acc Darrick J. Wong 2022-01-06  176  			percpu_up_write(sb->s_w=
riters.rw_sem + level);
8dd594d12f08acc Darrick J. Wong 2022-01-06  177  		wake_up(&sb->s_writers.w=
ait_unfrozen);
8dd594d12f08acc Darrick J. Wong 2022-01-06  178  		return error;
8dd594d12f08acc Darrick J. Wong 2022-01-06  179  	}
8dd594d12f08acc Darrick J. Wong 2022-01-06  180  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  181  	/* Now wait for internal =
filesystem counter */
8dd594d12f08acc Darrick J. Wong 2022-01-06  182  	sb->s_writers.frozen =3D =
SB_FREEZE_FS;
8dd594d12f08acc Darrick J. Wong 2022-01-06  183  	percpu_down_write(sb->s_w=
riters.rw_sem + SB_FREEZE_FS - 1);
8dd594d12f08acc Darrick J. Wong 2022-01-06  184  =

8dd594d12f08acc Darrick J. Wong 2022-01-06  185  	/*
8dd594d12f08acc Darrick J. Wong 2022-01-06  186  	 * We do not need to quie=
sce the log to check the summary counters, so
8dd594d12f08acc Darrick J. Wong 2022-01-06  187  	 * skip the call to xfs_f=
s_freeze here.  To prevent anyone else from
8dd594d12f08acc Darrick J. Wong 2022-01-06  188  	 * unfreezing us, set the=
 VFS freeze level to one higher than
8dd594d12f08acc Darrick J. Wong 2022-01-06  189  	 * FREEZE_COMPLETE.
8dd594d12f08acc Darrick J. Wong 2022-01-06  190  	 */
8dd594d12f08acc Darrick J. Wong 2022-01-06  191  	sb->s_writers.frozen =3D =
SB_FREEZE_EXCLUSIVE;
8dd594d12f08acc Darrick J. Wong 2022-01-06  192  	for (level =3D SB_FREEZE_=
LEVELS - 1; level >=3D 0; level--)
8dd594d12f08acc Darrick J. Wong 2022-01-06  193  		percpu_rwsem_release(sb-=
>s_writers.rw_sem + level, 0,
8dd594d12f08acc Darrick J. Wong 2022-01-06  194  				_THIS_IP_);
8dd594d12f08acc Darrick J. Wong 2022-01-06  195  done:
8dd594d12f08acc Darrick J. Wong 2022-01-06  196  	fsc->frozen =3D true;
8dd594d12f08acc Darrick J. Wong 2022-01-06  197  	up_write(&sb->s_umount);
8dd594d12f08acc Darrick J. Wong 2022-01-06 @198  	return 0;
8dd594d12f08acc Darrick J. Wong 2022-01-06  199  }
8dd594d12f08acc Darrick J. Wong 2022-01-06  200  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1443607821272336784==--

