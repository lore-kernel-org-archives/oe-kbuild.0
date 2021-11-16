Content-Type: multipart/mixed; boundary="===============5644095280156818853=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/dsa/qca8k.c:944 qca8k_parse_port_config() error: testing array offset 'cpu_port_index' after use.
Date: Tue, 16 Nov 2021 16:37:20 +0300
Message-ID: <20211116133720.GI27562@kadam>
In-Reply-To: <CA+_ehUwbUYc6GBGx1VFfqknWrFTk=Xm7NmMUhbyxMSBE4KdnjQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5644095280156818853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 02:30:59PM +0100, Ansuel Smith wrote:
> > On Mon, Nov 15, 2021 at 07:08:30PM +0100, Ansuel Smith wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git   master
> > > > head:   debe436e77c72fcee804fb867f275e6d31aa999c
> > > > commit: 5654ec78dd7e64b1e04777b24007344329e6a63b net: dsa: qca8k: r=
ework rgmii delay logic and scan for cpu port 6
> > > > config: i386-randconfig-m021-20211025 (attached as .config)
> > > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > >
> > >
> > > This should already be fixed by 06dd34a628ae5b6a839b757e746de165d6789=
ca8
> > > Can you confirm this?
> > >
> >
> > No, it doesn't fix the problem.  The check is either useless and should
> > be removed or there is an out of bounds bug.  Checking for an out of
> > bounds *after* you've already written to the memory is *never* useful.
> >
> > regards,
> > dan carpenter
> >
> =

> Again sorry if I insist and I'm 99% missing something.
> There was an out of bounds bug.
> It was fixed by 06dd34a628ae5b6a839b757e746de165d6789ca8 by
> starting the counter to -1.
> The extra check is useless, yes.

Then just delete it.  We don't want code which is illogical even if it
has no effect on run time.

regards,
dan carpenter

--===============5644095280156818853==--

