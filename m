Content-Type: multipart/mixed; boundary="===============1019865608193573392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/platforms/pseries/lpar.c:1106:54: warning: Parameter 'slot' can be declared with const [constParameter]
Date: Thu, 07 Apr 2022 13:09:22 +0800
Message-ID: <202204071335.O5KePXaT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1019865608193573392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Hans,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: ae62fbe299629d3b2fa61d4cf5146258c4d99fdf proc: make the proc_create=
[_data]() stubs static inlines
date:   3 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 3 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ae62fbe299629d3b2fa61d4cf5146258c4d99fdf
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/platforms/pseries/lpar.c:1106:54: warning: Parameter 'slot'=
 can be declared with const [constParameter]
   static void hugepage_block_invalidate(unsigned long *slot, unsigned long=
 *vpn,
                                                        ^

vim +/slot +1106 arch/powerpc/platforms/pseries/lpar.c

1a5272866f87d7 Aneesh Kumar K.V 2013-06-20  1105  =

ba2dd8a26baa7e Laurent Dufour   2018-08-20 @1106  static void hugepage_bloc=
k_invalidate(unsigned long *slot, unsigned long *vpn,
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1107  				      int count, int =
psize, int ssize)
1a5272866f87d7 Aneesh Kumar K.V 2013-06-20  1108  {
05af40e8859550 Laurent Dufour   2016-10-06  1109  	unsigned long param[PLPA=
R_HCALL9_BUFSIZE];
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1110  	unsigned long shift, cur=
rent_vpgb, vpgb;
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1111  	int i, pix =3D 0;
1a5272866f87d7 Aneesh Kumar K.V 2013-06-20  1112  =

ba2dd8a26baa7e Laurent Dufour   2018-08-20  1113  	shift =3D mmu_psize_defs=
[psize].shift;
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1114  =

ba2dd8a26baa7e Laurent Dufour   2018-08-20  1115  	for (i =3D 0; i < count;=
 i++) {
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1116  		/*
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1117  		 * Shifting 3 bits more=
 on the right to get a
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1118  		 * 8 pages aligned virt=
ual addresse.
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1119  		 */
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1120  		vpgb =3D (vpn[i] >> (sh=
ift - VPN_SHIFT + 3));
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1121  		if (!pix || vpgb !=3D c=
urrent_vpgb) {
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1122  			/*
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1123  			 * Need to start a new=
 8 pages block, flush
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1124  			 * the current one if =
needed.
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1125  			 */
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1126  			if (pix)
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1127  				(void)call_block_remo=
ve(pix, param, true);
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1128  			current_vpgb =3D vpgb;
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1129  			param[0] =3D hpte_enco=
de_avpn(vpn[i], psize, ssize);
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1130  			pix =3D 1;
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1131  		}
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1132  =

ba2dd8a26baa7e Laurent Dufour   2018-08-20  1133  		param[pix++] =3D HBR_RE=
QUEST | HBLKR_AVPN | slot[i];
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1134  		if (pix =3D=3D PLPAR_HC=
ALL9_BUFSIZE) {
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1135  			pix =3D call_block_rem=
ove(pix, param, false);
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1136  			/*
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1137  			 * pix =3D 0 means tha=
t all the entries were
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1138  			 * removed, we can sta=
rt a new block.
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1139  			 * Otherwise, this mea=
ns that there are entries
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1140  			 * to retry, and pix p=
oints to latest one, so
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1141  			 * we should increment=
 it and try to continue
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1142  			 * the same block.
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1143  			 */
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1144  			if (pix)
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1145  				pix++;
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1146  		}
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1147  	}
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1148  	if (pix)
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1149  		(void)call_block_remove=
(pix, param, true);
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1150  }
ba2dd8a26baa7e Laurent Dufour   2018-08-20  1151  =


:::::: The code at line 1106 was first introduced by commit
:::::: ba2dd8a26baa7e140555746d396e32952709c42d powerpc/pseries/mm: call H_=
BLOCK_REMOVE

:::::: TO: Laurent Dufour <ldufour@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1019865608193573392==--

