Content-Type: multipart/mixed; boundary="===============8755257788523394853=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 2/2] serial: 8250: Add proper clock handling for OxSemi PCIe devices
Date: Thu, 17 Feb 2022 16:23:52 +0300
Message-ID: <20220217132352.GC2467@kadam>
In-Reply-To: <alpine.DEB.2.21.2202171009440.34636@angie.orcam.me.uk>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8755257788523394853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 12:05:58PM +0000, Maciej W. Rozycki wrote:
> On Thu, 17 Feb 2022, Dan Carpenter wrote:
> =

> > url:    https://github.com/0day-ci/linux/commits/Maciej-W-Rozycki/seria=
l-8250-Fixes-for-Oxford-Semiconductor-950-UARTs/20220212-164255 =

> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git =
 tty-testing
> > config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive=
/20220213/202202130027.ZKBCgtm5-lkp(a)intel.com/config )
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/tty/serial/8250/8250_pci.c:1171 pci_oxsemi_tornado_get_divisor(=
) error: uninitialized symbol 'tcr'.
> > drivers/tty/serial/8250/8250_pci.c:1172 pci_oxsemi_tornado_get_divisor(=
) error: uninitialized symbol 'quot'.
> > drivers/tty/serial/8250/8250_pci.c:1180 pci_oxsemi_tornado_get_divisor(=
) error: uninitialized symbol 'cpr'.
> =

>  These variables do get assigned to in the first iteration of the loop, =

> because the deviation calculated (`srem') is normalised to the range of =

> [0,spre/2] and that divided by the original divisor (`spre') always works =

> out at within [0,0.5], so `squot' will be within [0,32768].  I guess the =

> static analyser is too dumb to figure it out, so I'll see how to paper it =

> over unless someone has a better proposal.

These emails are a one time email so it's okay to ignore them if you
want.

regards,
dan carpenter

--===============8755257788523394853==--

