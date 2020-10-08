Content-Type: multipart/mixed; boundary="===============8384463138735127457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cryptodev:master 163/205] lib/mpi/ec.c:357:0: warning: failed to evaluate #if condition, division/modulo by zero
Date: Thu, 08 Oct 2020 20:11:42 +0800
Message-ID: <202010082040.0c76CMuj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8384463138735127457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-crypto(a)vger.kernel.org
TO: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
head:   3093e7c16e12d729c325adb3c53dde7308cefbd8
commit: d58bb7e55a8a65894cc02f27c3e2bf9403e7c40f [163/205] lib/mpi: Introdu=
ce ec implementation to MPI library
:::::: branch date: 7 hours ago
:::::: commit date: 13 days ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +357 lib/mpi/ec.c

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  345  =

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  346  static void ec_mulm_448(MPI w=
, MPI u, MPI v, struct mpi_ec_ctx *ctx)
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  347  {
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  348  	mpi_ptr_t wp, up, vp;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  349  	mpi_size_t wsize =3D LIMB_SI=
ZE_448;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  350  	mpi_limb_t n[LIMB_SIZE_448*2=
];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  351  	mpi_limb_t a2[LIMB_SIZE_HALF=
_448];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  352  	mpi_limb_t a3[LIMB_SIZE_HALF=
_448];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  353  	mpi_limb_t b0[LIMB_SIZE_HALF=
_448];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  354  	mpi_limb_t b1[LIMB_SIZE_HALF=
_448];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  355  	mpi_limb_t cy;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  356  	int i;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21 @357  #if (LIMB_SIZE_HALF_448 > LIM=
B_SIZE_448/2)
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  358  	mpi_limb_t b1_rest, a3_rest;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  359  #endif
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  360  =

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  361  	if (w->nlimbs !=3D wsize || =
u->nlimbs !=3D wsize || v->nlimbs !=3D wsize)
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  362  		log_bug("mulm_448: differen=
t sizes\n");
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  363  =

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  364  	up =3D u->d;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  365  	vp =3D v->d;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  366  	wp =3D w->d;
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  367  =

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  368  	mpihelp_mul_n(n, up, vp, wsi=
ze);
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  369  =

d58bb7e55a8a65 Tianjia Zhang 2020-09-21  370  	for (i =3D 0; i < (wsize + 1=
) / 2; i++) {
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  371  		b0[i] =3D n[i];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  372  		b1[i] =3D n[i+wsize/2];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  373  		a2[i] =3D n[i+wsize];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  374  		a3[i] =3D n[i+wsize+wsize/2=
];
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  375  	}
d58bb7e55a8a65 Tianjia Zhang 2020-09-21  376  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8384463138735127457==--

