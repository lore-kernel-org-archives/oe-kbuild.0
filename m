Content-Type: multipart/mixed; boundary="===============5730807796692922124=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy. No more merges.
Date: Tue, 23 Jun 2020 11:05:27 +0300
Message-ID: <20200623080527.GY4282@kadam>
In-Reply-To: <20200622161532.GD11242@magnolia>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5730807796692922124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 09:15:32AM -0700, Darrick J. Wong wrote:
> On Sun, Jun 21, 2020 at 04:03:02AM +0800, kernel test robot wrote:
> > CC: kbuild-all(a)lists.01.org
> > CC: linux-kernel(a)vger.kernel.org
> > TO: Dave Chinner <dchinner@redhat.com>
> > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > CC: Christoph Hellwig <hch@lst.de>
> > =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
> > commit: b0dff466c00975a3e3ec97e6b0266bfd3e4805d6 xfs: separate read-onl=
y variables in struct xfs_mount
> > date:   3 weeks ago
> > :::::: branch date: 24 hours ago
> > :::::: commit date: 3 weeks ago
> > config: i386-randconfig-m021-20200621 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy.=
  No more merges.
> > =

> > Old smatch warnings:
> > fs/xfs/libxfs/xfs_bmap.c:5450 __xfs_bunmapi() error: we previously assu=
med 'tp' could be null (see line 5290)
> > fs/xfs/libxfs/xfs_bmap.c:6123 __xfs_bmap_add() error: potential null de=
reference 'bi'.  (kmem_alloc returns null)
> =

> Er... does this mean that smatch is smarter about kmem_alloc now?
> =

> Or merely that something/someone tweaked the hair threshold downwards?
> =

> <-- his personal hair threshold is much longer now that it's March 98th.

You must have signed up to the kbuild list.  I normally look over the
warnings and ignore the false positives like this one...

The "Function too hairy.  No more merges." message is internal stuff.
I should turn that off by default.

I don't normally pay a lot of attention to the old warnings but it looks
like the "tp" warning is valid.  On my system, I don't get the warning
because the "too hairy" warning triggers to early.

The __xfs_bmap_add() warning is a false positive because we don't
pass KM_MAYFAIL.  Smatch doesn't track set bits.  It will do eventually.
It's not complicated code to write but it's just a matter of doing the
work.

regards,
dan carpenter

--===============5730807796692922124==--

