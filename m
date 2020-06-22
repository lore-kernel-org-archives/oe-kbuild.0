Content-Type: multipart/mixed; boundary="===============5589294891617373199=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
Subject: Re: fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy. No more merges.
Date: Mon, 22 Jun 2020 09:15:32 -0700
Message-ID: <20200622161532.GD11242@magnolia>
In-Reply-To: <202006210453.AJzaq6rh%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5589294891617373199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2020 at 04:03:02AM +0800, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> CC: linux-kernel(a)vger.kernel.org
> TO: Dave Chinner <dchinner@redhat.com>
> CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> CC: Christoph Hellwig <hch@lst.de>
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
> commit: b0dff466c00975a3e3ec97e6b0266bfd3e4805d6 xfs: separate read-only =
variables in struct xfs_mount
> date:   3 weeks ago
> :::::: branch date: 24 hours ago
> :::::: commit date: 3 weeks ago
> config: i386-randconfig-m021-20200621 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy.  =
No more merges.
> =

> Old smatch warnings:
> fs/xfs/libxfs/xfs_bmap.c:5450 __xfs_bunmapi() error: we previously assume=
d 'tp' could be null (see line 5290)
> fs/xfs/libxfs/xfs_bmap.c:6123 __xfs_bmap_add() error: potential null dere=
ference 'bi'.  (kmem_alloc returns null)

Er... does this mean that smatch is smarter about kmem_alloc now?

Or merely that something/someone tweaked the hair threshold downwards?

<-- his personal hair threshold is much longer now that it's March 98th.

--D

> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Db0dff466c00975a3e3ec97e6b0266bfd3e4805d6
> git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git
> git remote update linus
> git checkout b0dff466c00975a3e3ec97e6b0266bfd3e4805d6
> vim +5563 fs/xfs/libxfs/xfs_bmap.c

<snip> a ton of git blame output
--===============5589294891617373199==--

