Content-Type: multipart/mixed; boundary="===============8509522012249877759=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Date: Fri, 10 Dec 2021 02:40:39 +0800
Message-ID: <202112100257.YCgv17TU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8509522012249877759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211207210823.1975632-6-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-6-j.neuschaefer@gmx.net>
TO: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>
TO: linux-gpio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: openbmc(a)lists.ozlabs.org
CC: Tomer Maimon <tmaimon77@gmail.com>
CC: Joel Stanley <joel@jms.id.au>
CC: linux-kernel(a)vger.kernel.org
CC: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>

Hi "Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on robh/for-next linus/master v5.16-rc4 next-20211=
208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nuvoto=
n-WPCM450-pinctrl-and-GPIO-driver/20211208-051101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-s031-20211209 (https://download.01.org/0day-ci/archi=
ve/20211210/202112100257.YCgv17TU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/c08fb0aafb60234854aa86433=
da809fe5112f55e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM45=
0-pinctrl-and-GPIO-driver/20211208-051101
        git checkout c08fb0aafb60234854aa86433da809fe5112f55e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/net/bonding/ drivers/net/dsa/ drivers/pinctrl/=
nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:592:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:593:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:594:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:595:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:596:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:597:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:598:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:599:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:600:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:601:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:602:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:603:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:604:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:605:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:606:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:607:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:608:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:609:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:610:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:611:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:612:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:613:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:614:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:615:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:616:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:617:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:618:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:619:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:620:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:621:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:622:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:623:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:625:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:627:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:628:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:629:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:630:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:631:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:632:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:633:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:634:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:635:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:636:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:637:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:638:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:639:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:640:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:641:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:642:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:643:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:644:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:645:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:646:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:647:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:648:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:649:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:650:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:651:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:652:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:653:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:654:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:655:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:656:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:658:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:659:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:660:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:661:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:662:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:663:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:664:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:665:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:666:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:667:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:668:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:669:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:670:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:671:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:672:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:673:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:674:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:675:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:676:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:677:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:678:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:679:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:680:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:681:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:682:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:683:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:684:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:685:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:686:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:687:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:688:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:689:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:691:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:692:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:693:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:694:9: sparse: sparse: too man=
y warnings

vim +592 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  589  =

c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  590  static const stru=
ct wpcm450_pincfg pincfg[] =3D {
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  591  	/*		PIN	  FUNCTI=
ON 1		   FUNCTION 2 */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07 @592  	WPCM450_PINCFG(0=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  593  	WPCM450_PINCFG(1=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  594  	WPCM450_PINCFG(2=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  595  	WPCM450_PINCFG(3=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  596  	WPCM450_PINCFG(4=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  597  	WPCM450_PINCFG(5=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  598  	WPCM450_PINCFG(6=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  599  	WPCM450_PINCFG(7=
,	 none, NONE, 0,		  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  600  	WPCM450_PINCFG(8=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  601  	WPCM450_PINCFG(9=
,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  602  	WPCM450_PINCFG(1=
0,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  603  	WPCM450_PINCFG(1=
1,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  604  	WPCM450_PINCFG(1=
2,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  605  	WPCM450_PINCFG(1=
3,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  606  	WPCM450_PINCFG(1=
4,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  607  	WPCM450_PINCFG(1=
5,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  608  	WPCM450_PINCFG(1=
6,	 none, NONE, 0,		  pwm6, MFSEL2, 22),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  609  	WPCM450_PINCFG(1=
7,	 none, NONE, 0,		  pwm7, MFSEL2, 23),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  610  	WPCM450_PINCFG(1=
8,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  611  	WPCM450_PINCFG(1=
9,	 uinc, MFSEL1, 23,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  612  	WPCM450_PINCFG(2=
0,	  hg0, MFSEL2, 24,	  pwm4, MFSEL2, 20),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  613  	WPCM450_PINCFG(2=
1,	  hg1, MFSEL2, 25,	  pwm5, MFSEL2, 21),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  614  	WPCM450_PINCFG(2=
2,	  hg2, MFSEL2, 26,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  615  	WPCM450_PINCFG(2=
3,	  hg3, MFSEL2, 27,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  616  	WPCM450_PINCFG(2=
4,	  hg4, MFSEL2, 28,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  617  	WPCM450_PINCFG(2=
5,	  hg5, MFSEL2, 29,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  618  	WPCM450_PINCFG(2=
6,	 smb5, MFSEL1, 2,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  619  	WPCM450_PINCFG(2=
7,	 smb5, MFSEL1, 2,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  620  	WPCM450_PINCFG(2=
8,	 smb4, MFSEL1, 1,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  621  	WPCM450_PINCFG(2=
9,	 smb4, MFSEL1, 1,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  622  	WPCM450_PINCFG(3=
0,	 smb3, MFSEL1, 0,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  623  	WPCM450_PINCFG(3=
1,	 smb3, MFSEL1, 0,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  624  =

c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  625  	WPCM450_PINCFG(3=
2,	 scs1, MFSEL1, 3,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  626  	WPCM450_PINCFG(3=
3,	 scs2, MFSEL1, 4,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  627  	WPCM450_PINCFG(3=
4,	 scs3, MFSEL1, 5,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  628  	WPCM450_PINCFG(3=
5,	 xcs1, MFSEL1, 29,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  629  	WPCM450_PINCFG(3=
6,	 xcs2, MFSEL1, 28,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  630  	WPCM450_PINCFG(3=
7,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  631  	WPCM450_PINCFG(3=
8,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  632  	WPCM450_PINCFG(3=
9,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  633  	WPCM450_PINCFG(4=
0,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  634  	WPCM450_PINCFG(4=
1,	  bsp, MFSEL1, 9,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  635  	WPCM450_PINCFG(4=
2,	  bsp, MFSEL1, 9,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  636  	WPCM450_PINCFG(4=
3,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  637  	WPCM450_PINCFG(4=
4,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  638  	WPCM450_PINCFG(4=
5,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  639  	WPCM450_PINCFG(4=
6,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  640  	WPCM450_PINCFG(4=
7,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  641  	WPCM450_PINCFG(4=
8,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  642  	WPCM450_PINCFG(4=
9,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  643  	WPCM450_PINCFG(5=
0,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  644  	WPCM450_PINCFG(5=
1,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  645  	WPCM450_PINCFG(5=
2,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  646  	WPCM450_PINCFG(5=
3,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  647  	WPCM450_PINCFG(5=
4,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  648  	WPCM450_PINCFG(5=
5,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  649  	WPCM450_PINCFG(5=
6,	r1err, MFSEL1, 12,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  650  	WPCM450_PINCFG(5=
7,	 r1md, MFSEL1, 13,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  651  	WPCM450_PINCFG(5=
8,	 r1md, MFSEL1, 13,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  652  	WPCM450_PINCFG(5=
9,	  hg6, MFSEL2, 30,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  653  	WPCM450_PINCFG(6=
0,	  hg7, MFSEL2, 31,	  sdio, MFSEL1, 30),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  654  	WPCM450_PINCFG(6=
1,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  655  	WPCM450_PINCFG(6=
2,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  656  	WPCM450_PINCFG(6=
3,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  657  =

c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  658  	WPCM450_PINCFG(6=
4,	  fi0, MFSEL2, 0,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  659  	WPCM450_PINCFG(6=
5,	  fi1, MFSEL2, 1,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  660  	WPCM450_PINCFG(6=
6,	  fi2, MFSEL2, 2,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  661  	WPCM450_PINCFG(6=
7,	  fi3, MFSEL2, 3,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  662  	WPCM450_PINCFG(6=
8,	  fi4, MFSEL2, 4,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  663  	WPCM450_PINCFG(6=
9,	  fi5, MFSEL2, 5,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  664  	WPCM450_PINCFG(7=
0,	  fi6, MFSEL2, 6,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  665  	WPCM450_PINCFG(7=
1,	  fi7, MFSEL2, 7,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  666  	WPCM450_PINCFG(7=
2,	  fi8, MFSEL2, 8,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  667  	WPCM450_PINCFG(7=
3,	  fi9, MFSEL2, 9,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  668  	WPCM450_PINCFG(7=
4,	 fi10, MFSEL2, 10,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  669  	WPCM450_PINCFG(7=
5,	 fi11, MFSEL2, 11,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  670  	WPCM450_PINCFG(7=
6,	 fi12, MFSEL2, 12,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  671  	WPCM450_PINCFG(7=
7,	 fi13, MFSEL2, 13,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  672  	WPCM450_PINCFG(7=
8,	 fi14, MFSEL2, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  673  	WPCM450_PINCFG(7=
9,	 fi15, MFSEL2, 15,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  674  	WPCM450_PINCFG(8=
0,	 pwm0, MFSEL2, 16,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  675  	WPCM450_PINCFG(8=
1,	 pwm1, MFSEL2, 17,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  676  	WPCM450_PINCFG(8=
2,	 pwm2, MFSEL2, 18,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  677  	WPCM450_PINCFG(8=
3,	 pwm3, MFSEL2, 19,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  678  	WPCM450_PINCFG(8=
4,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  679  	WPCM450_PINCFG(8=
5,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  680  	WPCM450_PINCFG(8=
6,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  681  	WPCM450_PINCFG(8=
7,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  682  	WPCM450_PINCFG(8=
8,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  683  	WPCM450_PINCFG(8=
9,	rmii2, MFSEL1, 14,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  684  	WPCM450_PINCFG(9=
0,	r2err, MFSEL1, 15,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  685  	WPCM450_PINCFG(9=
1,	 r2md, MFSEL1, 16,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  686  	WPCM450_PINCFG(9=
2,	 r2md, MFSEL1, 16,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  687  	WPCM450_PINCFG(9=
3,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  688  	WPCM450_PINCFG(9=
4,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  689  	WPCM450_PINCFG(9=
5,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  690  =

c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  691  	WPCM450_PINCFG(9=
6,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  692  	WPCM450_PINCFG(9=
7,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  693  	WPCM450_PINCFG(9=
8,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  694  	WPCM450_PINCFG(9=
9,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  695  	WPCM450_PINCFG(1=
00,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  696  	WPCM450_PINCFG(1=
01,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  697  	WPCM450_PINCFG(1=
02,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  698  	WPCM450_PINCFG(1=
03,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  699  	WPCM450_PINCFG(1=
04,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  700  	WPCM450_PINCFG(1=
05,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  701  	WPCM450_PINCFG(1=
06,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  702  	WPCM450_PINCFG(1=
07,	 none, NONE, 0,		  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  703  	WPCM450_PINCFG(1=
08,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  704  	WPCM450_PINCFG(1=
09,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  705  	WPCM450_PINCFG(1=
10,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  706  	WPCM450_PINCFG(1=
11,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  707  	WPCM450_PINCFG(1=
12,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  708  	WPCM450_PINCFG(1=
13,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  709  	WPCM450_PINCFG(1=
14,	 smb0, MFSEL1, 6,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  710  	WPCM450_PINCFG(1=
15,	 smb0, MFSEL1, 6,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  711  	WPCM450_PINCFG(1=
16,	 smb1, MFSEL1, 7,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  712  	WPCM450_PINCFG(1=
17,	 smb1, MFSEL1, 7,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  713  	WPCM450_PINCFG(1=
18,	 smb2, MFSEL1, 8,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  714  	WPCM450_PINCFG(1=
19,	 smb2, MFSEL1, 8,	  none, NONE, 0),
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  715  	WPCM450_PINCFG(1=
20,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  716  	WPCM450_PINCFG(1=
21,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  717  	WPCM450_PINCFG(1=
22,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  718  	WPCM450_PINCFG(1=
23,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  719  	WPCM450_PINCFG(1=
24,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  720  	WPCM450_PINCFG(1=
25,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  721  	WPCM450_PINCFG(1=
26,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  722  	WPCM450_PINCFG(1=
27,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  723  };
c08fb0aafb60234 Jonathan Neusch=C3=A4fer 2021-12-07  724  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8509522012249877759==--

