Content-Type: multipart/mixed; boundary="===============1260413813454774049=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
Subject: Re: [djwong-xfs:scrub-fixes 81/182] fs/xfs/libxfs/xfs_dquot_buf.c:309 xfs_dquot_from_disk_timestamp() error: we previously assumed 'timer' could be null (see line 308)
Date: Tue, 25 Aug 2020 09:49:28 -0700
Message-ID: <20200825164928.GQ6107@magnolia>
In-Reply-To: <20200824115722.GK1793@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1260413813454774049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 02:57:22PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git scrub-fixes
> head:   98e0929884c70f44a3210450f02741409f54cb38
> commit: bb1aaa516cc181c9a8eee4f8da10ad77839f837b [81/182] xfs: enable big=
time for quota timers
> config: i386-randconfig-m021-20200820 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> fs/xfs/libxfs/xfs_dquot_buf.c:309 xfs_dquot_from_disk_timestamp() error: =
we previously assumed 'timer' could be null (see line 308)

Oh, yeah, that was a thinko on my part that will be fixed the next time
I push things.  Thanks for the warning. :)

--D

> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/co=
mmit/?id=3Dbb1aaa516cc181c9a8eee4f8da10ad77839f837b
> git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git=
/djwong/xfs-linux.git
> git fetch --no-tags djwong-xfs scrub-fixes
> git checkout bb1aaa516cc181c9a8eee4f8da10ad77839f837b
> vim +/timer +309 fs/xfs/libxfs/xfs_dquot_buf.c
> =

> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  300  void
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  301  xfs_dquot_from_disk_time=
stamp(
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  302  	struct xfs_disk_dquot	*=
ddq,
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  303  	time64_t		*timer,
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  304  	__be32			dtimer)
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  305  {
> bb1aaa516cc181c Darrick J. Wong 2020-06-25  306  	uint64_t		t;
> bb1aaa516cc181c Darrick J. Wong 2020-06-25  307  =

> bb1aaa516cc181c Darrick J. Wong 2020-06-25 @308  	if (!timer || !(ddq->d_=
type & XFS_DQTYPE_BIGTIME)) {
>                                                              ^^^^^
> If "timer" is NULL
> =

> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17 @309  		*timer =3D be32_to_cpu=
(dtimer);
>                                                                 ^^^^^^
> then we are toasted.
> =

> bb1aaa516cc181c Darrick J. Wong 2020-06-25  310  		return;
> bb1aaa516cc181c Darrick J. Wong 2020-06-25  311  	}
> bb1aaa516cc181c Darrick J. Wong 2020-06-25  312  =

> bb1aaa516cc181c Darrick J. Wong 2020-06-25  313  	t =3D be32_to_cpu(dtime=
r);
> bb1aaa516cc181c Darrick J. Wong 2020-06-25  314  	*timer =3D t << XFS_DQ_=
BIGTIME_SHIFT;
> d6096aaaacaf8a6 Darrick J. Wong 2020-08-17  315  }
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1260413813454774049==--

