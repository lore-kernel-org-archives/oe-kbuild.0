Content-Type: multipart/mixed; boundary="===============8953972154919715129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-pinctrl:devel 44/71] drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9: sparse: sparse: obsolete array initializer, use C99 syntax
Date: Wed, 16 Mar 2022 02:11:40 +0800
Message-ID: <202203160206.6tGMEpaC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8953972154919715129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-gpio(a)vger.kernel.org
TO: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
head:   89388f8730699c259f8090ec435fb43569efe4ac
commit: a1d1e0e3d80a870cc37a6c064994b89e963d2b58 [44/71] pinctrl: nuvoton: =
Add driver for WPCM450
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/2022031=
6/202203160206.6tGMEpaC-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinc=
trl.git/commit/?id=3Da1d1e0e3d80a870cc37a6c064994b89e963d2b58
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout a1d1e0e3d80a870cc37a6c064994b89e963d2b58
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/pinctrl/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9: sparse: sparse: obsolet=
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
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:657:9: sparse: sparse: obsolet=
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
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:690:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:692:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:693:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:694:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:695:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:696:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:697:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:698:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:699:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:700:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:701:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:702:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:703:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:704:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:705:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:706:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:707:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:708:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:709:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:710:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:711:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:712:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:713:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:714:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:715:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:716:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:717:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:718:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:719:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:720:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:721:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:722:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:723:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:725:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:726:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:727:9: sparse: sparse: obsolet=
e array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:728:9: sparse: sparse: too man=
y warnings

vim +626 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  623  =

a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  624  static const struc=
t wpcm450_pincfg pincfg[] =3D {
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  625  	/*		PIN	  FUNCTIO=
N 1		   FUNCTION 2 */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29 @626  	WPCM450_PINCFG(0,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  627  	WPCM450_PINCFG(1,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  628  	WPCM450_PINCFG(2,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  629  	WPCM450_PINCFG(3,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  630  	WPCM450_PINCFG(4,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  631  	WPCM450_PINCFG(5,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  632  	WPCM450_PINCFG(6,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  633  	WPCM450_PINCFG(7,=
	 none, NONE, 0,		  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  634  	WPCM450_PINCFG(8,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  635  	WPCM450_PINCFG(9,=
	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  636  	WPCM450_PINCFG(10=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  637  	WPCM450_PINCFG(11=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  638  	WPCM450_PINCFG(12=
,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  639  	WPCM450_PINCFG(13=
,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  640  	WPCM450_PINCFG(14=
,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  641  	WPCM450_PINCFG(15=
,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  642  	WPCM450_PINCFG(16=
,	 none, NONE, 0,		  pwm6, MFSEL2, 22),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  643  	WPCM450_PINCFG(17=
,	 none, NONE, 0,		  pwm7, MFSEL2, 23),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  644  	WPCM450_PINCFG(18=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  645  	WPCM450_PINCFG(19=
,	 uinc, MFSEL1, 23,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  646  	WPCM450_PINCFG(20=
,	  hg0, MFSEL2, 24,	  pwm4, MFSEL2, 20),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  647  	WPCM450_PINCFG(21=
,	  hg1, MFSEL2, 25,	  pwm5, MFSEL2, 21),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  648  	WPCM450_PINCFG(22=
,	  hg2, MFSEL2, 26,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  649  	WPCM450_PINCFG(23=
,	  hg3, MFSEL2, 27,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  650  	WPCM450_PINCFG(24=
,	  hg4, MFSEL2, 28,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  651  	WPCM450_PINCFG(25=
,	  hg5, MFSEL2, 29,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  652  	WPCM450_PINCFG(26=
,	 smb5, MFSEL1, 2,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  653  	WPCM450_PINCFG(27=
,	 smb5, MFSEL1, 2,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  654  	WPCM450_PINCFG(28=
,	 smb4, MFSEL1, 1,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  655  	WPCM450_PINCFG(29=
,	 smb4, MFSEL1, 1,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  656  	WPCM450_PINCFG(30=
,	 smb3, MFSEL1, 0,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  657  	WPCM450_PINCFG(31=
,	 smb3, MFSEL1, 0,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  658  =

a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  659  	WPCM450_PINCFG(32=
,	 scs1, MFSEL1, 3,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  660  	WPCM450_PINCFG(33=
,	 scs2, MFSEL1, 4,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  661  	WPCM450_PINCFG(34=
,	 scs3, MFSEL1, 5,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  662  	WPCM450_PINCFG(35=
,	 xcs1, MFSEL1, 29,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  663  	WPCM450_PINCFG(36=
,	 xcs2, MFSEL1, 28,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  664  	WPCM450_PINCFG(37=
,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  665  	WPCM450_PINCFG(38=
,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  666  	WPCM450_PINCFG(39=
,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  667  	WPCM450_PINCFG(40=
,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  668  	WPCM450_PINCFG(41=
,	  bsp, MFSEL1, 9,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  669  	WPCM450_PINCFG(42=
,	  bsp, MFSEL1, 9,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  670  	WPCM450_PINCFG(43=
,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  671  	WPCM450_PINCFG(44=
,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  672  	WPCM450_PINCFG(45=
,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  673  	WPCM450_PINCFG(46=
,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  674  	WPCM450_PINCFG(47=
,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  675  	WPCM450_PINCFG(48=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  676  	WPCM450_PINCFG(49=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  677  	WPCM450_PINCFG(50=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  678  	WPCM450_PINCFG(51=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  679  	WPCM450_PINCFG(52=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  680  	WPCM450_PINCFG(53=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  681  	WPCM450_PINCFG(54=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  682  	WPCM450_PINCFG(55=
,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  683  	WPCM450_PINCFG(56=
,	r1err, MFSEL1, 12,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  684  	WPCM450_PINCFG(57=
,	 r1md, MFSEL1, 13,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  685  	WPCM450_PINCFG(58=
,	 r1md, MFSEL1, 13,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  686  	WPCM450_PINCFG(59=
,	  hg6, MFSEL2, 30,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  687  	WPCM450_PINCFG(60=
,	  hg7, MFSEL2, 31,	  sdio, MFSEL1, 30),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  688  	WPCM450_PINCFG(61=
,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  689  	WPCM450_PINCFG(62=
,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  690  	WPCM450_PINCFG(63=
,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  691  =

a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  692  	WPCM450_PINCFG(64=
,	  fi0, MFSEL2, 0,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  693  	WPCM450_PINCFG(65=
,	  fi1, MFSEL2, 1,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  694  	WPCM450_PINCFG(66=
,	  fi2, MFSEL2, 2,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  695  	WPCM450_PINCFG(67=
,	  fi3, MFSEL2, 3,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  696  	WPCM450_PINCFG(68=
,	  fi4, MFSEL2, 4,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  697  	WPCM450_PINCFG(69=
,	  fi5, MFSEL2, 5,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  698  	WPCM450_PINCFG(70=
,	  fi6, MFSEL2, 6,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  699  	WPCM450_PINCFG(71=
,	  fi7, MFSEL2, 7,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  700  	WPCM450_PINCFG(72=
,	  fi8, MFSEL2, 8,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  701  	WPCM450_PINCFG(73=
,	  fi9, MFSEL2, 9,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  702  	WPCM450_PINCFG(74=
,	 fi10, MFSEL2, 10,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  703  	WPCM450_PINCFG(75=
,	 fi11, MFSEL2, 11,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  704  	WPCM450_PINCFG(76=
,	 fi12, MFSEL2, 12,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  705  	WPCM450_PINCFG(77=
,	 fi13, MFSEL2, 13,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  706  	WPCM450_PINCFG(78=
,	 fi14, MFSEL2, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  707  	WPCM450_PINCFG(79=
,	 fi15, MFSEL2, 15,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  708  	WPCM450_PINCFG(80=
,	 pwm0, MFSEL2, 16,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  709  	WPCM450_PINCFG(81=
,	 pwm1, MFSEL2, 17,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  710  	WPCM450_PINCFG(82=
,	 pwm2, MFSEL2, 18,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  711  	WPCM450_PINCFG(83=
,	 pwm3, MFSEL2, 19,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  712  	WPCM450_PINCFG(84=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  713  	WPCM450_PINCFG(85=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  714  	WPCM450_PINCFG(86=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  715  	WPCM450_PINCFG(87=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  716  	WPCM450_PINCFG(88=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  717  	WPCM450_PINCFG(89=
,	rmii2, MFSEL1, 14,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  718  	WPCM450_PINCFG(90=
,	r2err, MFSEL1, 15,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  719  	WPCM450_PINCFG(91=
,	 r2md, MFSEL1, 16,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  720  	WPCM450_PINCFG(92=
,	 r2md, MFSEL1, 16,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  721  	WPCM450_PINCFG(93=
,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  722  	WPCM450_PINCFG(94=
,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  723  	WPCM450_PINCFG(95=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  724  =

a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  725  	WPCM450_PINCFG(96=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  726  	WPCM450_PINCFG(97=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  727  	WPCM450_PINCFG(98=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  728  	WPCM450_PINCFG(99=
,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  729  	WPCM450_PINCFG(10=
0,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  730  	WPCM450_PINCFG(10=
1,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  731  	WPCM450_PINCFG(10=
2,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  732  	WPCM450_PINCFG(10=
3,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  733  	WPCM450_PINCFG(10=
4,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  734  	WPCM450_PINCFG(10=
5,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  735  	WPCM450_PINCFG(10=
6,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  736  	WPCM450_PINCFG(10=
7,	 none, NONE, 0,		  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  737  	WPCM450_PINCFG(10=
8,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  738  	WPCM450_PINCFG(10=
9,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  739  	WPCM450_PINCFG(11=
0,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  740  	WPCM450_PINCFG(11=
1,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  741  	WPCM450_PINCFG(11=
2,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  742  	WPCM450_PINCFG(11=
3,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  743  	WPCM450_PINCFG(11=
4,	 smb0, MFSEL1, 6,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  744  	WPCM450_PINCFG(11=
5,	 smb0, MFSEL1, 6,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  745  	WPCM450_PINCFG(11=
6,	 smb1, MFSEL1, 7,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  746  	WPCM450_PINCFG(11=
7,	 smb1, MFSEL1, 7,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  747  	WPCM450_PINCFG(11=
8,	 smb2, MFSEL1, 8,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  748  	WPCM450_PINCFG(11=
9,	 smb2, MFSEL1, 8,	  none, NONE, 0),
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  749  	WPCM450_PINCFG(12=
0,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  750  	WPCM450_PINCFG(12=
1,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  751  	WPCM450_PINCFG(12=
2,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  752  	WPCM450_PINCFG(12=
3,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  753  	WPCM450_PINCFG(12=
4,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  754  	WPCM450_PINCFG(12=
5,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  755  	WPCM450_PINCFG(12=
6,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  756  	WPCM450_PINCFG(12=
7,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  757  };
a1d1e0e3d80a87 Jonathan Neusch=C3=A4fer 2022-01-29  758  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8953972154919715129==--

