Content-Type: multipart/mixed; boundary="===============7931001647359364273=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 03/10] lib/mpi: Introduce ec implementation to MPI library
Date: Mon, 21 Sep 2020 07:20:37 +0800
Message-ID: <202009210715.yTOtpJSE%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7931001647359364273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200920162103.83197-4-tianjia.zhang@linux.alibaba.com>
References: <20200920162103.83197-4-tianjia.zhang@linux.alibaba.com>
TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
TO: Eric Biggers <ebiggers@google.com>
TO: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@st.com>
TO: James Morris <jmorris@namei.org>
TO: "Serge E. Hallyn" <serge@hallyn.com>

Hi Tianjia,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cryptodev/master]
[also build test WARNING on crypto/master linus/master v5.9-rc5 next-202009=
18]
[cannot apply to security/next-testing sparc-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tianjia-Zhang/crpyto-intro=
duce-OSCCA-certificate-and-SM2-asymmetric-algorithm/20200921-002243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> lib/mpi/ec.c:357:0: warning: failed to evaluate #if condition, division/=
modulo by zero [preprocessorErrorDirective]
   #if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
   ^
>> lib/mpi/mpih-div.c:87:4: warning: Variable 'dummy' is reassigned a value=
 before the old one has been used. [redundantAssignment]
      UDIV_QRNND_PREINV(dummy, r, r,
      ^
   lib/mpi/mpih-div.c:67:15: note: Variable 'dummy' is reassigned a value b=
efore the old one has been used.
       udiv_qrnnd(divisor_limb_inverted, dummy,
                 ^
   lib/mpi/mpih-div.c:87:4: note: Variable 'dummy' is reassigned a value be=
fore the old one has been used.
      UDIV_QRNND_PREINV(dummy, r, r,
      ^
   lib/mpi/mpih-div.c:202:12: warning: Either the switch case 'case 0' is r=
edundant or there is division by zero at line 202. [zerodivcond]
     return 1 / dsize;
              ^
   lib/mpi/mpih-div.c:195:2: note: case 0: dsize is 0 here.
    case 0:
    ^
   lib/mpi/mpih-div.c:202:12: note: Division by zero
     return 1 / dsize;
              ^

# https://github.com/0day-ci/linux/commit/e5e1635e83d36c3a4cd2334e7233ce9a9=
6fc2019
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Tianjia-Zhang/crpyto-introduce-OSCCA-certi=
ficate-and-SM2-asymmetric-algorithm/20200921-002243
git checkout e5e1635e83d36c3a4cd2334e7233ce9a96fc2019
vim +357 lib/mpi/ec.c

e5e1635e83d36c Tianjia Zhang 2020-09-21  345  =

e5e1635e83d36c Tianjia Zhang 2020-09-21  346  static void ec_mulm_448(MPI w=
, MPI u, MPI v, struct mpi_ec_ctx *ctx)
e5e1635e83d36c Tianjia Zhang 2020-09-21  347  {
e5e1635e83d36c Tianjia Zhang 2020-09-21  348  	mpi_ptr_t wp, up, vp;
e5e1635e83d36c Tianjia Zhang 2020-09-21  349  	mpi_size_t wsize =3D LIMB_SI=
ZE_448;
e5e1635e83d36c Tianjia Zhang 2020-09-21  350  	mpi_limb_t n[LIMB_SIZE_448*2=
];
e5e1635e83d36c Tianjia Zhang 2020-09-21  351  	mpi_limb_t a2[LIMB_SIZE_HALF=
_448];
e5e1635e83d36c Tianjia Zhang 2020-09-21  352  	mpi_limb_t a3[LIMB_SIZE_HALF=
_448];
e5e1635e83d36c Tianjia Zhang 2020-09-21  353  	mpi_limb_t b0[LIMB_SIZE_HALF=
_448];
e5e1635e83d36c Tianjia Zhang 2020-09-21  354  	mpi_limb_t b1[LIMB_SIZE_HALF=
_448];
e5e1635e83d36c Tianjia Zhang 2020-09-21  355  	mpi_limb_t cy;
e5e1635e83d36c Tianjia Zhang 2020-09-21  356  	int i;
e5e1635e83d36c Tianjia Zhang 2020-09-21 @357  #if (LIMB_SIZE_HALF_448 > LIM=
B_SIZE_448/2)
e5e1635e83d36c Tianjia Zhang 2020-09-21  358  	mpi_limb_t b1_rest, a3_rest;
e5e1635e83d36c Tianjia Zhang 2020-09-21  359  #endif
e5e1635e83d36c Tianjia Zhang 2020-09-21  360  =

e5e1635e83d36c Tianjia Zhang 2020-09-21  361  	if (w->nlimbs !=3D wsize || =
u->nlimbs !=3D wsize || v->nlimbs !=3D wsize)
e5e1635e83d36c Tianjia Zhang 2020-09-21  362  		log_bug("mulm_448: differen=
t sizes\n");
e5e1635e83d36c Tianjia Zhang 2020-09-21  363  =

e5e1635e83d36c Tianjia Zhang 2020-09-21  364  	up =3D u->d;
e5e1635e83d36c Tianjia Zhang 2020-09-21  365  	vp =3D v->d;
e5e1635e83d36c Tianjia Zhang 2020-09-21  366  	wp =3D w->d;
e5e1635e83d36c Tianjia Zhang 2020-09-21  367  =

e5e1635e83d36c Tianjia Zhang 2020-09-21  368  	mpihelp_mul_n(n, up, vp, wsi=
ze);
e5e1635e83d36c Tianjia Zhang 2020-09-21  369  =

e5e1635e83d36c Tianjia Zhang 2020-09-21  370  	for (i =3D 0; i < (wsize + 1=
) / 2; i++) {
e5e1635e83d36c Tianjia Zhang 2020-09-21  371  		b0[i] =3D n[i];
e5e1635e83d36c Tianjia Zhang 2020-09-21  372  		b1[i] =3D n[i+wsize/2];
e5e1635e83d36c Tianjia Zhang 2020-09-21  373  		a2[i] =3D n[i+wsize];
e5e1635e83d36c Tianjia Zhang 2020-09-21  374  		a3[i] =3D n[i+wsize+wsize/2=
];
e5e1635e83d36c Tianjia Zhang 2020-09-21  375  	}
e5e1635e83d36c Tianjia Zhang 2020-09-21  376  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7931001647359364273==--

