Content-Type: multipart/mixed; boundary="===============7599690627453469827=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] Staging: comedi: drivers: jr3_pci: fixed two warnings
Date: Mon, 13 Apr 2020 02:35:10 +0800
Message-ID: <202004130211.63Onr1cw%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7599690627453469827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200412142508.327-1-carlosteniswarrior@gmail.com>
References: <20200412142508.327-1-carlosteniswarrior@gmail.com>
TO: carlosteniswarrior(a)gmail.com
CC: gregkh(a)linuxfoundation.org, devel(a)driverdev.osuosl.org, linux-kerne=
l(a)vger.kernel.org, Carlos Guerrero Alvarez <carlosteniswarrior@gmail.co=
m>, devel(a)driverdev.osuosl.org, linux-kernel(a)vger.kernel.org, Carlos Gu=
errero Alvarez <carlosteniswarrior@gmail.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v5.6 next-20200412]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/carlosteniswarrior-gmail-c=
om/Staging-comedi-drivers-jr3_pci-fixed-two-warnings/20200412-234205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
f4f7714f055fa662cf2f27dd0809a8781538e780
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-188-g79f7ac98-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/comedi/drivers/jr3_pci.c:94:29: sparse: sparse: expected=
 ; at end of declaration
   drivers/staging/comedi/drivers/jr3_pci.c:94:29: sparse: sparse: Expected=
 } at end of struct-union-enum-specifier
   drivers/staging/comedi/drivers/jr3_pci.c:94:29: sparse: sparse: got l
   drivers/staging/comedi/drivers/jr3_pci.c:95:24: sparse: sparse: Expected=
 , in __builtin_offset
   drivers/staging/comedi/drivers/jr3_pci.c:95:24: sparse: sparse: got come=
di_lrange
   drivers/staging/comedi/drivers/jr3_pci.c:96:1: sparse: sparse: Expected =
; at the end of type declaration
   drivers/staging/comedi/drivers/jr3_pci.c:96:1: sparse: sparse: got }
   drivers/staging/comedi/drivers/jr3_pci.c:527:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:528:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:529:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:530:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:531:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:532:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:533:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:534:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:535:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:536:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:537:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:539:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:540:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:541:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:542:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:543:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:544:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:545:29: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:636:32: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:637:32: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:638:32: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:641:78: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:645:24: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:646:24: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:647:24: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:649:55: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range
   drivers/staging/comedi/drivers/jr3_pci.c:650:55: sparse: sparse: no memb=
er 'l' in union jr3_pci_single_range

# https://github.com/0day-ci/linux/commit/acd289bdc5999c5b41a1a041511e4a3a3=
194f5ee
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout acd289bdc5999c5b41a1a041511e4a3a3194f5ee
vim +94 drivers/staging/comedi/drivers/jr3_pci.c

217fbbbc74f136 Bill Pemberton               2009-03-16  92  =

4af8c8195188b5 Ian Abbott                   2017-02-17  93  union jr3_pci_s=
ingle_range {
acd289bdc5999c carlosteniswarrior(a)gmail.com 2020-04-12 @94  	const comedi=
_lrange l;
acd289bdc5999c carlosteniswarrior(a)gmail.com 2020-04-12  95  	char _reserv=
ed[offsetof(const comedi_lrange, range[1])];
4af8c8195188b5 Ian Abbott                   2017-02-17  96  };
4af8c8195188b5 Ian Abbott                   2017-02-17  97  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7599690627453469827==--

