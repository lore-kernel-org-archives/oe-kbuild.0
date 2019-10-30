Content-Type: multipart/mixed; boundary="===============4573827835343066434=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
Subject: Re: [djwong-xfs:mount-api-crash 91/104] fs/xfs/xfs_message.c:23:40: warning: address of array 'mp->m_super->s_id' will always evaluate to 'true'
Date: Wed, 30 Oct 2019 08:45:43 -0700
Message-ID: <20191030154543.GF15221@magnolia>
In-Reply-To: <20191030033925.GA14630@ubuntu-m2-xlarge-x86>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4573827835343066434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2019 at 08:39:25PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 29, 2019 at 02:45:40PM +0800, kbuild test robot wrote:
> > CC: kbuild-all(a)lists.01.org
> > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > TO: Ian Kent <raven@themaw.net>
> > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > CC: Christoph Hellwig <hch@lst.de>

FYI, It's customary to cc the patch author [and the xfs list]...

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linu=
x.git mount-api-crash
> > head:   e35c37b1b9987c8d87d91dbeca6c24aade2a3390
> > commit: a5a36409da3a608c815b38b0ff2eb5bcfc1adec6 [91/104] xfs: use supe=
r s_id instead of struct xfs_mount
> > config: x86_64-rhel-7.6 (attached as .config)
> > compiler: clang version 10.0.0 (git://gitmirror/llvm_project 7cd595df96=
d5929488063d8ff5cc3b5d800386da)
> > reproduce:
> >         git checkout a5a36409da3a608c815b38b0ff2eb5bcfc1adec6
> >         # save the attached .config to linux build tree
> >         make ARCH=3Dx86_64 =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> > >> fs/xfs/xfs_message.c:23:40: warning: address of array 'mp->m_super->=
s_id' will always evaluate to 'true' [-Wpointer-bool-conversion]
> >            if (mp && mp->m_super && mp->m_super->s_id) {
> >                                  ~~ ~~~~~~~~~~~~~^~~~

...so, Ian, I guess this isn't necessary ^^^^^^^^^^^^^^^^
because it's a char array, not a pointer. :)

Good catch!

--D

> >    1 warning generated.
> > =

> > vim +23 fs/xfs/xfs_message.c
> > =

> >     13	=

> >     14	/*
> >     15	 * XFS logging functions
> >     16	 */
> >     17	static void
> >     18	__xfs_printk(
> >     19		const char		*level,
> >     20		const struct xfs_mount	*mp,
> >     21		struct va_format	*vaf)
> >     22	{
> >   > 23		if (mp && mp->m_super && mp->m_super->s_id) {
> >     24			printk("%sXFS (%s): %pV\n", level, mp->m_super->s_id, vaf);
> >     25			return;
> >     26		}
> >     27		printk("%sXFS: %pV\n", level, vaf);
> >     28	}
> >     29	=

> > =

> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration
> > =

> =

> Hi Darrick,
> =

> The 0day team has been doing clang builds for us and we've been
> forwarding the valid warnings along to developers. This appeared after
> the commit listed above. That check should be unnecessary, perhaps you
> meant to check for something else? Thanks for looking into this.
> =

> Cheers,
> Nathan
--===============4573827835343066434==--

