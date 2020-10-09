Content-Type: multipart/mixed; boundary="===============2629093131738045588=="
MIME-Version: 1.0
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: sound/pci/au88x0/au88x0_core.c:2029 vortex_adb_checkinout() warn: signedness bug returning '(-22)'
Date: Fri, 09 Oct 2020 18:19:24 +0200
Message-ID: <20201009161924.wc4omcb22ppaqcx2@ltop.local>
In-Reply-To: <20201009120043.GL1042@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2629093131738045588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 03:00:43PM +0300, kernel test robot wrote:
> Hi Luc,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c85fb28b6f999db9928b841f63f1beeb3074eeca
> commit: 80591e61a0f7e88deaada69844e4a31280c4a38f kbuild: tell sparse abou=
t the $ARCH
> config: powerpc64-randconfig-m031-20201008 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> sound/pci/au88x0/au88x0_core.c:2029 vortex_adb_checkinout() warn: signedn=
ess bug returning '(-22)'
> sound/pci/rme9652/hdsp.c:4085 snd_hdsp_channel_info() warn: impossible co=
ndition '(hdsp->channel_map[channel] < 0) =3D> (0-255 < 0)'
> =

> Old smatch warnings:
> sound/pci/au88x0/au88x0_core.c:2046 vortex_adb_checkinout() warn: signedn=
ess bug returning '(-12)'
> sound/pci/rme9652/hdsp.c:3338 snd_hdsp_proc_read() warn: argument 5 to %l=
x specifier is cast from pointer
> sound/pci/rme9652/hdsp.c:5305 snd_hdsp_create() warn: 'hdsp->iobase' not =
released on lines: 5237.
> sound/pci/rme9652/hdsp.c:5305 snd_hdsp_create() warn: 'pci' not released =
on lines: 5237.
> =

> vim +2029 sound/pci/au88x0/au88x0_core.c
> =

> ^1da177e4c3f415 Linus Torvalds  2005-04-16  2001  static char
>                                                          ^^^^
> Is char unsigned on PowerPC?  I thought that was only on s390.

All PowerPC machines or cross compiler I have access to give me:
	$ gcc -E -dD -o - - < /dev/null | grep __CHAR_UNSIGNED__
	#define __CHAR_UNSIGNED__ 1

and the PPC ABI requires it so.
 =

-- Luc
--===============2629093131738045588==--

