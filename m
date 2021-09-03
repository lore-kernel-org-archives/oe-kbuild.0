Content-Type: multipart/mixed; boundary="===============4293581099203094452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 12/13] bpf/tests: Add more BPF_END byte order conversion tests
Date: Fri, 03 Sep 2021 23:12:14 +0800
Message-ID: <202109032313.fwDVujZp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4293581099203094452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210902185229.1840281-13-johan.almbladh@anyfinetworks.com>
References: <20210902185229.1840281-13-johan.almbladh@anyfinetworks.com>
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andrii(a)kernel.org
TO: iii(a)linux.ibm.com
CC: kafai(a)fb.com
CC: songliubraving(a)fb.com
CC: yhs(a)fb.com
CC: john.fastabend(a)gmail.com
CC: kpsingh(a)kernel.org
CC: netdev(a)vger.kernel.org

Hi Johan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Johan-Almbladh/bpf-tests-E=
xtend-JIT-test-suite-coverage/20210903-025430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-s001-20210903 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-rc1-dirty
        # https://github.com/0day-ci/linux/commit/b768dbbf26de9655b45775f5e=
760726336ed9bcf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Johan-Almbladh/bpf-tests-Extend-JI=
T-test-suite-coverage/20210903-025430
        git checkout b768dbbf26de9655b45775f5e760726336ed9bcf
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   lib/test_bpf.c:6722:25: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __be16 [usertype] @@
   lib/test_bpf.c:6722:25: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6722:25: sparse:     got restricted __be16 [usertype]
   lib/test_bpf.c:6736:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __be32 [usertype] @@
   lib/test_bpf.c:6736:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6736:24: sparse:     got restricted __be32 [usertype]
   lib/test_bpf.c:6747:25: sparse: sparse: cast from restricted __be64
>> lib/test_bpf.c:6759:31: sparse: sparse: restricted __be64 degrades to in=
teger
   lib/test_bpf.c:6771:25: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __be16 [usertype] @@
   lib/test_bpf.c:6771:25: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6771:25: sparse:     got restricted __be16 [usertype]
   lib/test_bpf.c:6785:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __be32 [usertype] @@
   lib/test_bpf.c:6785:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6785:24: sparse:     got restricted __be32 [usertype]
   lib/test_bpf.c:6796:25: sparse: sparse: cast from restricted __be64
   lib/test_bpf.c:6808:31: sparse: sparse: restricted __be64 degrades to in=
teger
   lib/test_bpf.c:6820:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le16 [usertype] @@
   lib/test_bpf.c:6820:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6820:24: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:6834:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le32 [usertype] @@
   lib/test_bpf.c:6834:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6834:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:6845:25: sparse: sparse: cast from restricted __le64
>> lib/test_bpf.c:6857:31: sparse: sparse: restricted __le64 degrades to in=
teger
   lib/test_bpf.c:6869:25: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le16 [usertype] @@
   lib/test_bpf.c:6869:25: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6869:25: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:6883:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le32 [usertype] @@
   lib/test_bpf.c:6883:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:6883:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:6894:25: sparse: sparse: cast from restricted __le64
   lib/test_bpf.c:6906:31: sparse: sparse: restricted __le64 degrades to in=
teger
   lib/test_bpf.c:3525:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3526:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3531:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3532:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3537:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3538:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3543:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3544:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3549:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3550:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3555:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3556:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3561:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3566:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3571:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba9876543210 becomes 76543210)
   lib/test_bpf.c:3572:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:3945:25: sparse: sparse: cast truncates bits from constan=
t value (567800001234 becomes 1234)
   lib/test_bpf.c:3956:25: sparse: sparse: cast truncates bits from constan=
t value (1ffffffff becomes ffffffff)
   lib/test_bpf.c:4033:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4111:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4127:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4252:25: sparse: sparse: cast truncates bits from constan=
t value (100000000 becomes 0)
   lib/test_bpf.c:4430:25: sparse: sparse: cast truncates bits from constan=
t value (100000000 becomes 0)
   lib/test_bpf.c:4740:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:4741:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:4752:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:4753:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:4875:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:4886:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5273:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5311:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5327:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5328:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5359:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5375:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5376:25: sparse: sparse: cast truncates bits from constan=
t value (123456780a0c0e0 becomes 80a0c0e0)
   lib/test_bpf.c:5485:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5523:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5524:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5539:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5571:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5572:25: sparse: sparse: cast truncates bits from constan=
t value (12345678fafcfef becomes 8fafcfef)
   lib/test_bpf.c:5587:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5697:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5735:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5736:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5751:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5752:25: sparse: sparse: cast truncates bits from constan=
t value (ffff00000000ffff becomes ffff)
   lib/test_bpf.c:5783:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5784:25: sparse: sparse: cast truncates bits from constan=
t value (123456786a4c2e0 becomes 86a4c2e0)
   lib/test_bpf.c:5799:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5800:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba98795b3d1f becomes 795b3d1f)
   lib/test_bpf.c:5876:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5888:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5901:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5913:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5926:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5938:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5951:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5963:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6043:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6054:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6066:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6077:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6089:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6100:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6112:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6184:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6196:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6209:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6221:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6234:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6246:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6259:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6271:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6351:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6362:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6374:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6385:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6397:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6408:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6420:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6444:25: sparse: sparse: cast truncates bits from constan=
t value (ff00ff0000000000 becomes 0)
   lib/test_bpf.c:6456:25: sparse: sparse: too many warnings

vim +6759 lib/test_bpf.c

e1016e1586ff9b Johan Almbladh     2021-09-02   1988  =

6b8730939624e5 Johan Almbladh     2021-09-02   1989  =

64a8946b447e41 Alexei Starovoitov 2014-05-08   1990  static struct bpf_test=
 tests[] =3D {
64a8946b447e41 Alexei Starovoitov 2014-05-08   1991  	{
64a8946b447e41 Alexei Starovoitov 2014-05-08   1992  		"TAX",
ece80490e2c1ce Andrew Morton      2014-05-22   1993  		.u.insns =3D {
64a8946b447e41 Alexei Starovoitov 2014-05-08   1994  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
64a8946b447e41 Alexei Starovoitov 2014-05-08   1995  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   1996  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
64a8946b447e41 Alexei Starovoitov 2014-05-08   1997  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   1998  			BPF_STMT(BPF_ALU | =
BPF_NEG, 0), /* A =3D=3D -3 */
64a8946b447e41 Alexei Starovoitov 2014-05-08   1999  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   2000  			BPF_STMT(BPF_LD | B=
PF_LEN, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   2001  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   2002  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0), /* X =3D=3D len - 3 */
64a8946b447e41 Alexei Starovoitov 2014-05-08   2003  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 1),
64a8946b447e41 Alexei Starovoitov 2014-05-08   2004  			BPF_STMT(BPF_RET | =
BPF_A, 0)
64a8946b447e41 Alexei Starovoitov 2014-05-08   2005  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2006  		CLASSIC,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2007  		{ 10, 20, 30, 40, 50=
 },
64a8946b447e41 Alexei Starovoitov 2014-05-08   2008  		{ { 2, 10 }, { 3, 20=
 }, { 4, 30 } },
64a8946b447e41 Alexei Starovoitov 2014-05-08   2009  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2010  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2011  		"TXA",
ece80490e2c1ce Andrew Morton      2014-05-22   2012  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2013  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2014  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2015  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2016  			BPF_STMT(BPF_RET | =
BPF_A, 0) /* A =3D=3D len * 2 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2017  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2018  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2019  		{ 10, 20, 30, 40, 50=
 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2020  		{ { 1, 2 }, { 3, 6 }=
, { 4, 8 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2021  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2022  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2023  		"ADD_SUB_MUL_K",
ece80490e2c1ce Andrew Morton      2014-05-22   2024  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2025  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2026  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2027  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2028  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2029  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 0xffffffff),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2030  			BPF_STMT(BPF_ALU | =
BPF_MUL | BPF_K, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2031  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2032  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2033  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2034  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2035  		{ { 0, 0xfffffffd } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2036  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2037  	{
6867b17b26d80c Denis Kirjanov     2014-12-01   2038  		"DIV_MOD_KX",
ece80490e2c1ce Andrew Morton      2014-05-22   2039  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2040  			BPF_STMT(BPF_LD | B=
PF_IMM, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2041  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2042  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2043  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2044  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2045  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2046  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2047  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 0x70000000),
6867b17b26d80c Denis Kirjanov     2014-12-01   2048  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
6867b17b26d80c Denis Kirjanov     2014-12-01   2049  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
6867b17b26d80c Denis Kirjanov     2014-12-01   2050  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_X, 0),
6867b17b26d80c Denis Kirjanov     2014-12-01   2051  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
6867b17b26d80c Denis Kirjanov     2014-12-01   2052  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
6867b17b26d80c Denis Kirjanov     2014-12-01   2053  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_K, 0x70000000),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2054  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2055  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2056  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2057  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2058  		{ },
6867b17b26d80c Denis Kirjanov     2014-12-01   2059  		{ { 0, 0x20000000 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2060  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2061  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2062  		"AND_OR_LSH_K",
ece80490e2c1ce Andrew Morton      2014-05-22   2063  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2064  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xff),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2065  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2066  			BPF_STMT(BPF_ALU | =
BPF_LSH | BPF_K, 27),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2067  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2068  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xf),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2069  			BPF_STMT(BPF_ALU | =
BPF_OR | BPF_K, 0xf0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2070  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2071  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2072  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2073  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2074  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2075  		{ { 0, 0x800000ff },=
 { 1, 0x800000ff } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2076  	},
e9d9450497f77e Chema Gonzalez     2014-05-30   2077  	{
e9d9450497f77e Chema Gonzalez     2014-05-30   2078  		"LD_IMM_0",
e9d9450497f77e Chema Gonzalez     2014-05-30   2079  		.u.insns =3D {
e9d9450497f77e Chema Gonzalez     2014-05-30   2080  			BPF_STMT(BPF_LD | B=
PF_IMM, 0), /* ld #0 */
e9d9450497f77e Chema Gonzalez     2014-05-30   2081  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0, 1, 0),
e9d9450497f77e Chema Gonzalez     2014-05-30   2082  			BPF_STMT(BPF_RET | =
BPF_K, 0),
e9d9450497f77e Chema Gonzalez     2014-05-30   2083  			BPF_STMT(BPF_RET | =
BPF_K, 1),
e9d9450497f77e Chema Gonzalez     2014-05-30   2084  		},
e9d9450497f77e Chema Gonzalez     2014-05-30   2085  		CLASSIC,
e9d9450497f77e Chema Gonzalez     2014-05-30   2086  		{ },
e9d9450497f77e Chema Gonzalez     2014-05-30   2087  		{ { 1, 1 } },
e9d9450497f77e Chema Gonzalez     2014-05-30   2088  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2089  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2090  		"LD_IND",
ece80490e2c1ce Andrew Morton      2014-05-22   2091  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2092  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2093  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, MAX_K),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2094  			BPF_STMT(BPF_RET | =
BPF_K, 1)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2095  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2096  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2097  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2098  		{ { 1, 0 }, { 10, 0 =
}, { 60, 0 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2099  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2100  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2101  		"LD_ABS",
ece80490e2c1ce Andrew Morton      2014-05-22   2102  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2103  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS, 1000),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2104  			BPF_STMT(BPF_RET | =
BPF_K, 1)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2105  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2106  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2107  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2108  		{ { 1, 0 }, { 10, 0 =
}, { 60, 0 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2109  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2110  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2111  		"LD_ABS_LL",
ece80490e2c1ce Andrew Morton      2014-05-22   2112  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2113  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_LL_OFF),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2114  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2115  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_LL_OFF + 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2116  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2117  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2118  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2119  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2120  		{ 1, 2, 3 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2121  		{ { 1, 0 }, { 2, 3 }=
 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2122  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2123  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2124  		"LD_IND_LL",
ece80490e2c1ce Andrew Morton      2014-05-22   2125  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2126  			BPF_STMT(BPF_LD | B=
PF_IMM, SKF_LL_OFF - 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2127  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2128  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2129  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2130  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2131  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2132  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2133  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2134  		{ 1, 2, 3, 0xff },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2135  		{ { 1, 1 }, { 3, 3 }=
, { 4, 0xff } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2136  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2137  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2138  		"LD_ABS_NET",
ece80490e2c1ce Andrew Morton      2014-05-22   2139  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2140  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_NET_OFF),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2141  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2142  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_NET_OFF + 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2143  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2144  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2145  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2146  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2147  		{ 0, 0, 0, 0, 0, 0, =
0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2148  		{ { 15, 0 }, { 16, 3=
 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2149  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2150  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2151  		"LD_IND_NET",
ece80490e2c1ce Andrew Morton      2014-05-22   2152  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2153  			BPF_STMT(BPF_LD | B=
PF_IMM, SKF_NET_OFF - 15),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2154  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2155  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2156  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2157  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2158  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2159  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2160  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2161  		{ 0, 0, 0, 0, 0, 0, =
0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2162  		{ { 14, 0 }, { 15, 1=
 }, { 17, 3 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2163  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2164  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2165  		"LD_PKTTYPE",
ece80490e2c1ce Andrew Morton      2014-05-22   2166  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2167  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2168  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2169  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2170  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2171  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2172  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2173  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2174  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2175  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2176  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2177  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2178  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2179  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2180  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2181  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2182  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2183  		{ { 1, 3 }, { 10, 3 =
} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2184  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2185  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2186  		"LD_MARK",
ece80490e2c1ce Andrew Morton      2014-05-22   2187  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2188  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2189  				 SKF_AD_OFF + SKF_=
AD_MARK),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2190  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2191  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2192  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2193  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2194  		{ { 1, SKB_MARK}, { =
10, SKB_MARK} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2195  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2196  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2197  		"LD_RXHASH",
ece80490e2c1ce Andrew Morton      2014-05-22   2198  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2199  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2200  				 SKF_AD_OFF + SKF_=
AD_RXHASH),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2201  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2202  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2203  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2204  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2205  		{ { 1, SKB_HASH}, { =
10, SKB_HASH} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2206  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2207  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2208  		"LD_QUEUE",
ece80490e2c1ce Andrew Morton      2014-05-22   2209  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2210  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2211  				 SKF_AD_OFF + SKF_=
AD_QUEUE),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2212  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2213  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2214  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2215  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2216  		{ { 1, SKB_QUEUE_MAP=
 }, { 10, SKB_QUEUE_MAP } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2217  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2218  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2219  		"LD_PROTOCOL",
ece80490e2c1ce Andrew Morton      2014-05-22   2220  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2221  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2222  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 20, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2223  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2224  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2225  				 SKF_AD_OFF + SKF_=
AD_PROTOCOL),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2226  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2227  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2228  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 30, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2229  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2230  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2231  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2232  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2233  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2234  		{ 10, 20, 30 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2235  		{ { 10, ETH_P_IP }, =
{ 100, ETH_P_IP } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2236  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2237  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2238  		"LD_VLAN_TAG",
ece80490e2c1ce Andrew Morton      2014-05-22   2239  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2240  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2241  				 SKF_AD_OFF + SKF_=
AD_VLAN_TAG),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2242  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2243  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2244  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2245  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2246  		{
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   2247  			{ 1, SKB_=
VLAN_TCI },
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   2248  			{ 10, SKB=
_VLAN_TCI }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2249  		},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2250  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2251  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2252  		"LD_VLAN_TAG_PRESENT=
",
ece80490e2c1ce Andrew Morton      2014-05-22   2253  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2254  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2255  				 SKF_AD_OFF + SKF_=
AD_VLAN_TAG_PRESENT),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2256  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2257  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2258  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2259  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2260  		{
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   2261  			{ 1, SKB_=
VLAN_PRESENT },
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   2262  			{ 10, SKB=
_VLAN_PRESENT }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2263  		},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2264  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2265  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2266  		"LD_IFINDEX",
ece80490e2c1ce Andrew Morton      2014-05-22   2267  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2268  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2269  				 SKF_AD_OFF + SKF_=
AD_IFINDEX),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2270  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2271  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2272  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2273  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2274  		{ { 1, SKB_DEV_IFIND=
EX }, { 10, SKB_DEV_IFINDEX } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2275  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2276  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2277  		"LD_HATYPE",
ece80490e2c1ce Andrew Morton      2014-05-22   2278  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2279  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2280  				 SKF_AD_OFF + SKF_=
AD_HATYPE),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2281  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2282  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2283  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2284  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2285  		{ { 1, SKB_DEV_TYPE =
}, { 10, SKB_DEV_TYPE } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2286  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2287  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2288  		"LD_CPU",
ece80490e2c1ce Andrew Morton      2014-05-22   2289  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2290  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2291  				 SKF_AD_OFF + SKF_=
AD_CPU),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2292  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2293  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2294  				 SKF_AD_OFF + SKF_=
AD_CPU),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2295  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2296  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2297  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2298  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2299  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2300  		{ { 1, 0 }, { 10, 0 =
} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2301  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2302  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2303  		"LD_NLATTR",
ece80490e2c1ce Andrew Morton      2014-05-22   2304  		.u.insns =3D {
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2305  			BPF_STMT(BPF_LDX | =
BPF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2306  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2307  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2308  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2309  				 SKF_AD_OFF + SKF_=
AD_NLATTR),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2310  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2311  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2312  		CLASSIC,
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2313  #ifdef __BIG_ENDIAN
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2314  		{ 0xff, 0xff, 0, 4, =
0, 2, 0, 4, 0, 3 },
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2315  #else
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2316  		{ 0xff, 0xff, 4, 0, =
2, 0, 4, 0, 3, 0 },
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2317  #endif
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2318  		{ { 4, 0 }, { 20, 6 =
} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2319  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2320  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2321  		"LD_NLATTR_NEST",
ece80490e2c1ce Andrew Morton      2014-05-22   2322  		.u.insns =3D {
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2323  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2324  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2325  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2326  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2327  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2328  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2329  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2330  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2331  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2332  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2333  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2334  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2335  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2336  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2337  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2338  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2339  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2340  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2341  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2342  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2343  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2344  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2345  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2346  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2347  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2348  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2349  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2350  		CLASSIC,
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2351  #ifdef __BIG_ENDIAN
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2352  		{ 0xff, 0xff, 0, 12,=
 0, 1, 0, 4, 0, 2, 0, 4, 0, 3 },
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2353  #else
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2354  		{ 0xff, 0xff, 12, 0,=
 1, 0, 4, 0, 2, 0, 4, 0, 3, 0 },
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2355  #endif
df6d0f983a59c3 Alexei Starovoitov 2014-06-06   2356  		{ { 4, 0 }, { 20, 10=
 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2357  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2358  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2359  		"LD_PAYLOAD_OFF",
ece80490e2c1ce Andrew Morton      2014-05-22   2360  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2361  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2362  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2363  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2364  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2365  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2366  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2367  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2368  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2369  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2370  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2371  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2372  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2373  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2374  		/* 00:00:00:00:00:00=
 > 00:00:00:00:00:00, ethtype IPv4 (0x0800),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2375  		 * length 98: 127.0.=
0.1 > 127.0.0.1: ICMP echo request,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2376  		 * id 9737, seq 1, l=
ength 64
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2377  		 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2378  		{ 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2379  		  0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2380  		  0x08, 0x00,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2381  		  0x45, 0x00, 0x00, =
0x54, 0xac, 0x8b, 0x40, 0x00, 0x40,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2382  		  0x01, 0x90, 0x1b, =
0x7f, 0x00, 0x00, 0x01 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2383  		{ { 30, 0 }, { 100, =
42 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2384  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2385  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2386  		"LD_ANC_XOR",
ece80490e2c1ce Andrew Morton      2014-05-22   2387  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2388  			BPF_STMT(BPF_LD | B=
PF_IMM, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2389  			BPF_STMT(BPF_LDX | =
BPF_IMM, 300),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2390  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2391  				 SKF_AD_OFF + SKF_=
AD_ALU_XOR_X),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2392  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2393  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2394  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2395  		{ },
098454362a0602 Nathan Chancellor  2019-08-18   2396  		{ { 4, 0xA ^ 300 }, =
{ 20, 0xA ^ 300 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2397  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2398  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2399  		"SPILL_FILL",
ece80490e2c1ce Andrew Morton      2014-05-22   2400  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2401  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2402  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2403  			BPF_STMT(BPF_ALU | =
BPF_RSH, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2404  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2405  			BPF_STMT(BPF_ST, 1)=
, /* M1 =3D 1 ^ len */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2406  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_K, 0x80000000),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2407  			BPF_STMT(BPF_ST, 2)=
, /* M2 =3D 1 ^ len ^ 0x80000000 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2408  			BPF_STMT(BPF_STX, 1=
5), /* M3 =3D len */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2409  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2410  			BPF_STMT(BPF_LD | B=
PF_MEM, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2411  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2412  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2413  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2414  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2415  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2416  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2417  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2418  		{ { 1, 0x80000001 },=
 { 2, 0x80000002 }, { 60, 0x80000000 ^ 60 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2419  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2420  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2421  		"JEQ",
ece80490e2c1ce Andrew Morton      2014-05-22   2422  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2423  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2424  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2425  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_X, 0, 0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2426  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2427  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2428  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2429  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2430  		{ 3, 3, 3, 3, 3 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2431  		{ { 1, 0 }, { 3, 1 }=
, { 4, MAX_K } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2432  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2433  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2434  		"JGT",
ece80490e2c1ce Andrew Morton      2014-05-22   2435  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2436  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2437  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2438  			BPF_JUMP(BPF_JMP | =
BPF_JGT | BPF_X, 0, 0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2439  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2440  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2441  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2442  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2443  		{ 4, 4, 4, 3, 3 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2444  		{ { 2, 0 }, { 3, 1 }=
, { 4, MAX_K } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2445  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   2446  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   2447  		"JGE (jt 0), test 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   2448  		.u.insns =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   2449  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2450  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2451  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2452  			BPF_STMT(BPF_RET | =
BPF_K, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2453  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
92b31a9af73b3a Daniel Borkmann    2017-08-10   2454  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   2455  		CLASSIC,
92b31a9af73b3a Daniel Borkmann    2017-08-10   2456  		{ 4, 4, 4, 3, 3 },
92b31a9af73b3a Daniel Borkmann    2017-08-10   2457  		{ { 2, 0 }, { 3, 1 }=
, { 4, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   2458  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   2459  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   2460  		"JGE (jt 0), test 2",
92b31a9af73b3a Daniel Borkmann    2017-08-10   2461  		.u.insns =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   2462  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2463  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2464  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2465  			BPF_STMT(BPF_RET | =
BPF_K, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   2466  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
92b31a9af73b3a Daniel Borkmann    2017-08-10   2467  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   2468  		CLASSIC,
92b31a9af73b3a Daniel Borkmann    2017-08-10   2469  		{ 4, 4, 5, 3, 3 },
92b31a9af73b3a Daniel Borkmann    2017-08-10   2470  		{ { 4, 1 }, { 5, 1 }=
, { 6, MAX_K } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   2471  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2472  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2473  		"JGE",
ece80490e2c1ce Andrew Morton      2014-05-22   2474  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2475  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2476  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, MAX_K),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2477  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 1, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2478  			BPF_STMT(BPF_RET | =
BPF_K, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2479  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 2, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2480  			BPF_STMT(BPF_RET | =
BPF_K, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2481  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 3, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2482  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2483  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 4, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2484  			BPF_STMT(BPF_RET | =
BPF_K, 40),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2485  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2486  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2487  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2488  		{ 1, 2, 3, 4, 5 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2489  		{ { 1, 20 }, { 3, 40=
 }, { 5, MAX_K } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2490  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2491  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2492  		"JSET",
ece80490e2c1ce Andrew Morton      2014-05-22   2493  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2494  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2495  			BPF_JUMP(BPF_JMP | =
BPF_JA, 1, 1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2496  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2497  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2498  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2499  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2500  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_K, 4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2501  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2502  			BPF_STMT(BPF_LD | B=
PF_W | BPF_IND, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2503  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 1, 0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2504  			BPF_STMT(BPF_RET | =
BPF_K, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2505  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x80000000, 0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2506  			BPF_STMT(BPF_RET | =
BPF_K, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2507  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2508  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2509  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2510  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2511  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2512  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2513  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2514  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2515  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2516  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2517  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2518  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2519  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2520  		{ 0, 0xAA, 0x55, 1 },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2521  		{ { 4, 10 }, { 5, 20=
 }, { 6, MAX_K } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2522  	},
64a8946b447e41 Alexei Starovoitov 2014-05-08   2523  	{
64a8946b447e41 Alexei Starovoitov 2014-05-08   2524  		"tcpdump port 22",
ece80490e2c1ce Andrew Morton      2014-05-22   2525  		.u.insns =3D {
ce25b68b74593b Daniel Borkmann    2014-05-26   2526  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 12),
ce25b68b74593b Daniel Borkmann    2014-05-26   2527  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x86dd, 0, 8), /* IPv6 */
ce25b68b74593b Daniel Borkmann    2014-05-26   2528  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 20),
ce25b68b74593b Daniel Borkmann    2014-05-26   2529  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2530  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2531  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x11, 0, 17),
ce25b68b74593b Daniel Borkmann    2014-05-26   2532  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 54),
ce25b68b74593b Daniel Borkmann    2014-05-26   2533  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 14, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2534  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 56),
ce25b68b74593b Daniel Borkmann    2014-05-26   2535  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 12, 13),
ce25b68b74593b Daniel Borkmann    2014-05-26   2536  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x0800, 0, 12), /* IPv4 */
ce25b68b74593b Daniel Borkmann    2014-05-26   2537  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 23),
ce25b68b74593b Daniel Borkmann    2014-05-26   2538  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2539  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2540  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x11, 0, 8),
ce25b68b74593b Daniel Borkmann    2014-05-26   2541  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 20),
ce25b68b74593b Daniel Borkmann    2014-05-26   2542  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x1fff, 6, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2543  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2544  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2545  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2546  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 16),
ce25b68b74593b Daniel Borkmann    2014-05-26   2547  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 0, 1),
ce25b68b74593b Daniel Borkmann    2014-05-26   2548  			BPF_STMT(BPF_RET | =
BPF_K, 0xffff),
ce25b68b74593b Daniel Borkmann    2014-05-26   2549  			BPF_STMT(BPF_RET | =
BPF_K, 0),
64a8946b447e41 Alexei Starovoitov 2014-05-08   2550  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2551  		CLASSIC,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2552  		/* 3c:07:54:43:e5:76=
 > 10:bf:48:d6:43:d6, ethertype IPv4(0x0800)
64a8946b447e41 Alexei Starovoitov 2014-05-08   2553  		 * length 114: 10.1.=
1.149.49700 > 10.1.2.10.22: Flags [P.],
64a8946b447e41 Alexei Starovoitov 2014-05-08   2554  		 * seq 1305692979:13=
05693027, ack 3650467037, win 65535,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2555  		 * options [nop,nop,=
TS val 2502645400 ecr 3971138], length 48
64a8946b447e41 Alexei Starovoitov 2014-05-08   2556  		 */
64a8946b447e41 Alexei Starovoitov 2014-05-08   2557  		{ 0x10, 0xbf, 0x48, =
0xd6, 0x43, 0xd6,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2558  		  0x3c, 0x07, 0x54, =
0x43, 0xe5, 0x76,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2559  		  0x08, 0x00,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2560  		  0x45, 0x10, 0x00, =
0x64, 0x75, 0xb5,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2561  		  0x40, 0x00, 0x40, =
0x06, 0xad, 0x2e, /* IP header */
64a8946b447e41 Alexei Starovoitov 2014-05-08   2562  		  0x0a, 0x01, 0x01, =
0x95, /* ip src */
64a8946b447e41 Alexei Starovoitov 2014-05-08   2563  		  0x0a, 0x01, 0x02, =
0x0a, /* ip dst */
64a8946b447e41 Alexei Starovoitov 2014-05-08   2564  		  0xc2, 0x24,
64a8946b447e41 Alexei Starovoitov 2014-05-08   2565  		  0x00, 0x16 /* dst =
port */ },
64a8946b447e41 Alexei Starovoitov 2014-05-08   2566  		{ { 10, 0 }, { 30, 0=
 }, { 100, 65535 } },
64a8946b447e41 Alexei Starovoitov 2014-05-08   2567  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2568  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2569  		"tcpdump complex",
ece80490e2c1ce Andrew Morton      2014-05-22   2570  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2571  			/* tcpdump -nei eth=
0 'tcp port 22 and (((ip[2:2] -
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2572  			 * ((ip[0]&0xf)<<2)=
) - ((tcp[12]&0xf0)>>2)) !=3D 0) and
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2573  			 * (len > 115 or le=
n < 30000000000)' -d
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2574  			 */
ce25b68b74593b Daniel Borkmann    2014-05-26   2575  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 12),
ce25b68b74593b Daniel Borkmann    2014-05-26   2576  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x86dd, 30, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2577  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x800, 0, 29),
ce25b68b74593b Daniel Borkmann    2014-05-26   2578  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 23),
ce25b68b74593b Daniel Borkmann    2014-05-26   2579  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 0, 27),
ce25b68b74593b Daniel Borkmann    2014-05-26   2580  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 20),
ce25b68b74593b Daniel Borkmann    2014-05-26   2581  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x1fff, 25, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2582  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2583  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2584  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2585  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 16),
ce25b68b74593b Daniel Borkmann    2014-05-26   2586  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 0, 20),
ce25b68b74593b Daniel Borkmann    2014-05-26   2587  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 16),
ce25b68b74593b Daniel Borkmann    2014-05-26   2588  			BPF_STMT(BPF_ST, 1),
ce25b68b74593b Daniel Borkmann    2014-05-26   2589  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2590  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf),
ce25b68b74593b Daniel Borkmann    2014-05-26   2591  			BPF_STMT(BPF_ALU | =
BPF_LSH | BPF_K, 2),
ce25b68b74593b Daniel Borkmann    2014-05-26   2592  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0x5), /* libpcap emits K on TAX */
ce25b68b74593b Daniel Borkmann    2014-05-26   2593  			BPF_STMT(BPF_LD | B=
PF_MEM, 1),
ce25b68b74593b Daniel Borkmann    2014-05-26   2594  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2595  			BPF_STMT(BPF_ST, 5),
ce25b68b74593b Daniel Borkmann    2014-05-26   2596  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593b Daniel Borkmann    2014-05-26   2597  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 26),
ce25b68b74593b Daniel Borkmann    2014-05-26   2598  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2599  			BPF_STMT(BPF_ALU | =
BPF_RSH | BPF_K, 2),
ce25b68b74593b Daniel Borkmann    2014-05-26   2600  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0x9), /* libpcap emits K on TAX */
ce25b68b74593b Daniel Borkmann    2014-05-26   2601  			BPF_STMT(BPF_LD | B=
PF_MEM, 5),
ce25b68b74593b Daniel Borkmann    2014-05-26   2602  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_X, 0, 4, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2603  			BPF_STMT(BPF_LD | B=
PF_LEN, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2604  			BPF_JUMP(BPF_JMP | =
BPF_JGT | BPF_K, 0x73, 1, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2605  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 0xfc23ac00, 1, 0),
ce25b68b74593b Daniel Borkmann    2014-05-26   2606  			BPF_STMT(BPF_RET | =
BPF_K, 0xffff),
ce25b68b74593b Daniel Borkmann    2014-05-26   2607  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2608  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2609  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2610  		{ 0x10, 0xbf, 0x48, =
0xd6, 0x43, 0xd6,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2611  		  0x3c, 0x07, 0x54, =
0x43, 0xe5, 0x76,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2612  		  0x08, 0x00,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2613  		  0x45, 0x10, 0x00, =
0x64, 0x75, 0xb5,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2614  		  0x40, 0x00, 0x40, =
0x06, 0xad, 0x2e, /* IP header */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2615  		  0x0a, 0x01, 0x01, =
0x95, /* ip src */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2616  		  0x0a, 0x01, 0x02, =
0x0a, /* ip dst */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2617  		  0xc2, 0x24,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2618  		  0x00, 0x16 /* dst =
port */ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2619  		{ { 10, 0 }, { 30, 0=
 }, { 100, 65535 } },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2620  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2621  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2622  		"RET_A",
ece80490e2c1ce Andrew Morton      2014-05-22   2623  		.u.insns =3D {
53b0fe36ab7c6e Zhen Lei           2021-07-07   2624  			/* check that unini=
tialized X and A contain zeros */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2625  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2626  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2627  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2628  		CLASSIC,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2629  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2630  		{ {1, 0}, {2, 0} },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2631  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2632  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2633  		"INT: ADD trivial",
ece80490e2c1ce Andrew Morton      2014-05-22   2634  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2635  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2636  			BPF_ALU64_IMM(BPF_A=
DD, R1, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2637  			BPF_ALU64_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2638  			BPF_ALU64_REG(BPF_S=
UB, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2639  			BPF_ALU64_IMM(BPF_A=
DD, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2640  			BPF_ALU64_IMM(BPF_M=
UL, R1, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2641  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2642  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2643  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2644  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2645  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2646  		{ { 0, 0xfffffffd } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2647  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2648  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2649  		"INT: MUL_X",
ece80490e2c1ce Andrew Morton      2014-05-22   2650  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2651  			BPF_ALU64_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2652  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2653  			BPF_ALU64_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2654  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2655  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xfffffffd, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2656  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2657  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2658  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2659  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2660  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2661  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2662  		{ { 0, 1 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2663  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2664  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2665  		"INT: MUL_X2",
ece80490e2c1ce Andrew Morton      2014-05-22   2666  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2667  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2668  			BPF_ALU32_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2669  			BPF_ALU32_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2670  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2671  			BPF_ALU64_IMM(BPF_R=
SH, R1, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2672  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0x2ffffff, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2673  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2674  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2675  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2676  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2677  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2678  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2679  		{ { 0, 1 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2680  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2681  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2682  		"INT: MUL32_X",
ece80490e2c1ce Andrew Morton      2014-05-22   2683  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2684  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2685  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2686  			BPF_ALU32_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2687  			BPF_ALU32_REG(BPF_M=
UL, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2688  			BPF_ALU64_IMM(BPF_R=
SH, R1, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2689  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xffffff, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2690  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2691  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2692  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2693  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2694  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2695  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2696  		{ { 0, 1 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2697  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2698  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2699  		/* Have to test all =
register combinations, since
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2700  		 * JITing of differe=
nt registers will produce
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2701  		 * different asm cod=
e.
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2702  		 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2703  		"INT: ADD 64-bit",
ece80490e2c1ce Andrew Morton      2014-05-22   2704  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2705  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2706  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2707  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2708  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2709  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2710  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2711  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2712  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2713  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2714  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2715  			BPF_ALU64_IMM(BPF_A=
DD, R0, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2716  			BPF_ALU64_IMM(BPF_A=
DD, R1, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2717  			BPF_ALU64_IMM(BPF_A=
DD, R2, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2718  			BPF_ALU64_IMM(BPF_A=
DD, R3, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2719  			BPF_ALU64_IMM(BPF_A=
DD, R4, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2720  			BPF_ALU64_IMM(BPF_A=
DD, R5, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2721  			BPF_ALU64_IMM(BPF_A=
DD, R6, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2722  			BPF_ALU64_IMM(BPF_A=
DD, R7, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2723  			BPF_ALU64_IMM(BPF_A=
DD, R8, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2724  			BPF_ALU64_IMM(BPF_A=
DD, R9, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2725  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2726  			BPF_ALU64_IMM(BPF_S=
UB, R1, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2727  			BPF_ALU64_IMM(BPF_S=
UB, R2, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2728  			BPF_ALU64_IMM(BPF_S=
UB, R3, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2729  			BPF_ALU64_IMM(BPF_S=
UB, R4, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2730  			BPF_ALU64_IMM(BPF_S=
UB, R5, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2731  			BPF_ALU64_IMM(BPF_S=
UB, R6, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2732  			BPF_ALU64_IMM(BPF_S=
UB, R7, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2733  			BPF_ALU64_IMM(BPF_S=
UB, R8, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2734  			BPF_ALU64_IMM(BPF_S=
UB, R9, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2735  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2736  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2737  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2738  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2739  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2740  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2741  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2742  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2743  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2744  			BPF_ALU64_REG(BPF_A=
DD, R0, R9), /* R0 =3D=3D 155 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2745  			BPF_JMP_IMM(BPF_JEQ=
, R0, 155, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2746  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2747  			BPF_ALU64_REG(BPF_A=
DD, R1, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2748  			BPF_ALU64_REG(BPF_A=
DD, R1, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2749  			BPF_ALU64_REG(BPF_A=
DD, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2750  			BPF_ALU64_REG(BPF_A=
DD, R1, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2751  			BPF_ALU64_REG(BPF_A=
DD, R1, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2752  			BPF_ALU64_REG(BPF_A=
DD, R1, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2753  			BPF_ALU64_REG(BPF_A=
DD, R1, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2754  			BPF_ALU64_REG(BPF_A=
DD, R1, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2755  			BPF_ALU64_REG(BPF_A=
DD, R1, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2756  			BPF_ALU64_REG(BPF_A=
DD, R1, R9), /* R1 =3D=3D 456 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2757  			BPF_JMP_IMM(BPF_JEQ=
, R1, 456, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2758  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2759  			BPF_ALU64_REG(BPF_A=
DD, R2, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2760  			BPF_ALU64_REG(BPF_A=
DD, R2, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2761  			BPF_ALU64_REG(BPF_A=
DD, R2, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2762  			BPF_ALU64_REG(BPF_A=
DD, R2, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2763  			BPF_ALU64_REG(BPF_A=
DD, R2, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2764  			BPF_ALU64_REG(BPF_A=
DD, R2, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2765  			BPF_ALU64_REG(BPF_A=
DD, R2, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2766  			BPF_ALU64_REG(BPF_A=
DD, R2, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2767  			BPF_ALU64_REG(BPF_A=
DD, R2, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2768  			BPF_ALU64_REG(BPF_A=
DD, R2, R9), /* R2 =3D=3D 1358 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2769  			BPF_JMP_IMM(BPF_JEQ=
, R2, 1358, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2770  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2771  			BPF_ALU64_REG(BPF_A=
DD, R3, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2772  			BPF_ALU64_REG(BPF_A=
DD, R3, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2773  			BPF_ALU64_REG(BPF_A=
DD, R3, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2774  			BPF_ALU64_REG(BPF_A=
DD, R3, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2775  			BPF_ALU64_REG(BPF_A=
DD, R3, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2776  			BPF_ALU64_REG(BPF_A=
DD, R3, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2777  			BPF_ALU64_REG(BPF_A=
DD, R3, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2778  			BPF_ALU64_REG(BPF_A=
DD, R3, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2779  			BPF_ALU64_REG(BPF_A=
DD, R3, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2780  			BPF_ALU64_REG(BPF_A=
DD, R3, R9), /* R3 =3D=3D 4063 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2781  			BPF_JMP_IMM(BPF_JEQ=
, R3, 4063, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2782  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2783  			BPF_ALU64_REG(BPF_A=
DD, R4, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2784  			BPF_ALU64_REG(BPF_A=
DD, R4, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2785  			BPF_ALU64_REG(BPF_A=
DD, R4, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2786  			BPF_ALU64_REG(BPF_A=
DD, R4, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2787  			BPF_ALU64_REG(BPF_A=
DD, R4, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2788  			BPF_ALU64_REG(BPF_A=
DD, R4, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2789  			BPF_ALU64_REG(BPF_A=
DD, R4, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2790  			BPF_ALU64_REG(BPF_A=
DD, R4, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2791  			BPF_ALU64_REG(BPF_A=
DD, R4, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2792  			BPF_ALU64_REG(BPF_A=
DD, R4, R9), /* R4 =3D=3D 12177 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2793  			BPF_JMP_IMM(BPF_JEQ=
, R4, 12177, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2794  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2795  			BPF_ALU64_REG(BPF_A=
DD, R5, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2796  			BPF_ALU64_REG(BPF_A=
DD, R5, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2797  			BPF_ALU64_REG(BPF_A=
DD, R5, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2798  			BPF_ALU64_REG(BPF_A=
DD, R5, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2799  			BPF_ALU64_REG(BPF_A=
DD, R5, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2800  			BPF_ALU64_REG(BPF_A=
DD, R5, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2801  			BPF_ALU64_REG(BPF_A=
DD, R5, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2802  			BPF_ALU64_REG(BPF_A=
DD, R5, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2803  			BPF_ALU64_REG(BPF_A=
DD, R5, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2804  			BPF_ALU64_REG(BPF_A=
DD, R5, R9), /* R5 =3D=3D 36518 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2805  			BPF_JMP_IMM(BPF_JEQ=
, R5, 36518, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2806  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2807  			BPF_ALU64_REG(BPF_A=
DD, R6, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2808  			BPF_ALU64_REG(BPF_A=
DD, R6, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2809  			BPF_ALU64_REG(BPF_A=
DD, R6, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2810  			BPF_ALU64_REG(BPF_A=
DD, R6, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2811  			BPF_ALU64_REG(BPF_A=
DD, R6, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2812  			BPF_ALU64_REG(BPF_A=
DD, R6, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2813  			BPF_ALU64_REG(BPF_A=
DD, R6, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2814  			BPF_ALU64_REG(BPF_A=
DD, R6, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2815  			BPF_ALU64_REG(BPF_A=
DD, R6, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2816  			BPF_ALU64_REG(BPF_A=
DD, R6, R9), /* R6 =3D=3D 109540 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2817  			BPF_JMP_IMM(BPF_JEQ=
, R6, 109540, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2818  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2819  			BPF_ALU64_REG(BPF_A=
DD, R7, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2820  			BPF_ALU64_REG(BPF_A=
DD, R7, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2821  			BPF_ALU64_REG(BPF_A=
DD, R7, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2822  			BPF_ALU64_REG(BPF_A=
DD, R7, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2823  			BPF_ALU64_REG(BPF_A=
DD, R7, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2824  			BPF_ALU64_REG(BPF_A=
DD, R7, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2825  			BPF_ALU64_REG(BPF_A=
DD, R7, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2826  			BPF_ALU64_REG(BPF_A=
DD, R7, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2827  			BPF_ALU64_REG(BPF_A=
DD, R7, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2828  			BPF_ALU64_REG(BPF_A=
DD, R7, R9), /* R7 =3D=3D 328605 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2829  			BPF_JMP_IMM(BPF_JEQ=
, R7, 328605, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2830  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2831  			BPF_ALU64_REG(BPF_A=
DD, R8, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2832  			BPF_ALU64_REG(BPF_A=
DD, R8, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2833  			BPF_ALU64_REG(BPF_A=
DD, R8, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2834  			BPF_ALU64_REG(BPF_A=
DD, R8, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2835  			BPF_ALU64_REG(BPF_A=
DD, R8, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2836  			BPF_ALU64_REG(BPF_A=
DD, R8, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2837  			BPF_ALU64_REG(BPF_A=
DD, R8, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2838  			BPF_ALU64_REG(BPF_A=
DD, R8, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2839  			BPF_ALU64_REG(BPF_A=
DD, R8, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2840  			BPF_ALU64_REG(BPF_A=
DD, R8, R9), /* R8 =3D=3D 985799 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2841  			BPF_JMP_IMM(BPF_JEQ=
, R8, 985799, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2842  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2843  			BPF_ALU64_REG(BPF_A=
DD, R9, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2844  			BPF_ALU64_REG(BPF_A=
DD, R9, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2845  			BPF_ALU64_REG(BPF_A=
DD, R9, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2846  			BPF_ALU64_REG(BPF_A=
DD, R9, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2847  			BPF_ALU64_REG(BPF_A=
DD, R9, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2848  			BPF_ALU64_REG(BPF_A=
DD, R9, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2849  			BPF_ALU64_REG(BPF_A=
DD, R9, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2850  			BPF_ALU64_REG(BPF_A=
DD, R9, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2851  			BPF_ALU64_REG(BPF_A=
DD, R9, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2852  			BPF_ALU64_REG(BPF_A=
DD, R9, R9), /* R9 =3D=3D 2957380 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2853  			BPF_ALU64_REG(BPF_M=
OV, R0, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2854  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2855  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   2856  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2857  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2858  		{ { 0, 2957380 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2859  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2860  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2861  		"INT: ADD 32-bit",
ece80490e2c1ce Andrew Morton      2014-05-22   2862  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2863  			BPF_ALU32_IMM(BPF_M=
OV, R0, 20),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2864  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2865  			BPF_ALU32_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2866  			BPF_ALU32_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2867  			BPF_ALU32_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2868  			BPF_ALU32_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2869  			BPF_ALU32_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2870  			BPF_ALU32_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2871  			BPF_ALU32_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2872  			BPF_ALU32_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2873  			BPF_ALU64_IMM(BPF_A=
DD, R1, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2874  			BPF_ALU64_IMM(BPF_A=
DD, R2, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2875  			BPF_ALU64_IMM(BPF_A=
DD, R3, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2876  			BPF_ALU64_IMM(BPF_A=
DD, R4, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2877  			BPF_ALU64_IMM(BPF_A=
DD, R5, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2878  			BPF_ALU64_IMM(BPF_A=
DD, R6, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2879  			BPF_ALU64_IMM(BPF_A=
DD, R7, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2880  			BPF_ALU64_IMM(BPF_A=
DD, R8, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2881  			BPF_ALU64_IMM(BPF_A=
DD, R9, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2882  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2883  			BPF_ALU32_REG(BPF_A=
DD, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2884  			BPF_ALU32_REG(BPF_A=
DD, R0, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2885  			BPF_ALU32_REG(BPF_A=
DD, R0, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2886  			BPF_ALU32_REG(BPF_A=
DD, R0, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2887  			BPF_ALU32_REG(BPF_A=
DD, R0, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2888  			BPF_ALU32_REG(BPF_A=
DD, R0, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2889  			BPF_ALU32_REG(BPF_A=
DD, R0, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2890  			BPF_ALU32_REG(BPF_A=
DD, R0, R9), /* R0 =3D=3D 155 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2891  			BPF_JMP_IMM(BPF_JEQ=
, R0, 155, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2892  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2893  			BPF_ALU32_REG(BPF_A=
DD, R1, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2894  			BPF_ALU32_REG(BPF_A=
DD, R1, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2895  			BPF_ALU32_REG(BPF_A=
DD, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2896  			BPF_ALU32_REG(BPF_A=
DD, R1, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2897  			BPF_ALU32_REG(BPF_A=
DD, R1, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2898  			BPF_ALU32_REG(BPF_A=
DD, R1, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2899  			BPF_ALU32_REG(BPF_A=
DD, R1, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2900  			BPF_ALU32_REG(BPF_A=
DD, R1, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2901  			BPF_ALU32_REG(BPF_A=
DD, R1, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2902  			BPF_ALU32_REG(BPF_A=
DD, R1, R9), /* R1 =3D=3D 456 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2903  			BPF_JMP_IMM(BPF_JEQ=
, R1, 456, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2904  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2905  			BPF_ALU32_REG(BPF_A=
DD, R2, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2906  			BPF_ALU32_REG(BPF_A=
DD, R2, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2907  			BPF_ALU32_REG(BPF_A=
DD, R2, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2908  			BPF_ALU32_REG(BPF_A=
DD, R2, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2909  			BPF_ALU32_REG(BPF_A=
DD, R2, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2910  			BPF_ALU32_REG(BPF_A=
DD, R2, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2911  			BPF_ALU32_REG(BPF_A=
DD, R2, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2912  			BPF_ALU32_REG(BPF_A=
DD, R2, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2913  			BPF_ALU32_REG(BPF_A=
DD, R2, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2914  			BPF_ALU32_REG(BPF_A=
DD, R2, R9), /* R2 =3D=3D 1358 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2915  			BPF_JMP_IMM(BPF_JEQ=
, R2, 1358, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2916  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2917  			BPF_ALU32_REG(BPF_A=
DD, R3, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2918  			BPF_ALU32_REG(BPF_A=
DD, R3, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2919  			BPF_ALU32_REG(BPF_A=
DD, R3, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2920  			BPF_ALU32_REG(BPF_A=
DD, R3, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2921  			BPF_ALU32_REG(BPF_A=
DD, R3, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2922  			BPF_ALU32_REG(BPF_A=
DD, R3, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2923  			BPF_ALU32_REG(BPF_A=
DD, R3, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2924  			BPF_ALU32_REG(BPF_A=
DD, R3, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2925  			BPF_ALU32_REG(BPF_A=
DD, R3, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2926  			BPF_ALU32_REG(BPF_A=
DD, R3, R9), /* R3 =3D=3D 4063 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2927  			BPF_JMP_IMM(BPF_JEQ=
, R3, 4063, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2928  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2929  			BPF_ALU32_REG(BPF_A=
DD, R4, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2930  			BPF_ALU32_REG(BPF_A=
DD, R4, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2931  			BPF_ALU32_REG(BPF_A=
DD, R4, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2932  			BPF_ALU32_REG(BPF_A=
DD, R4, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2933  			BPF_ALU32_REG(BPF_A=
DD, R4, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2934  			BPF_ALU32_REG(BPF_A=
DD, R4, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2935  			BPF_ALU32_REG(BPF_A=
DD, R4, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2936  			BPF_ALU32_REG(BPF_A=
DD, R4, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2937  			BPF_ALU32_REG(BPF_A=
DD, R4, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2938  			BPF_ALU32_REG(BPF_A=
DD, R4, R9), /* R4 =3D=3D 12177 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2939  			BPF_JMP_IMM(BPF_JEQ=
, R4, 12177, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2940  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2941  			BPF_ALU32_REG(BPF_A=
DD, R5, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2942  			BPF_ALU32_REG(BPF_A=
DD, R5, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2943  			BPF_ALU32_REG(BPF_A=
DD, R5, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2944  			BPF_ALU32_REG(BPF_A=
DD, R5, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2945  			BPF_ALU32_REG(BPF_A=
DD, R5, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2946  			BPF_ALU32_REG(BPF_A=
DD, R5, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2947  			BPF_ALU32_REG(BPF_A=
DD, R5, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2948  			BPF_ALU32_REG(BPF_A=
DD, R5, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2949  			BPF_ALU32_REG(BPF_A=
DD, R5, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2950  			BPF_ALU32_REG(BPF_A=
DD, R5, R9), /* R5 =3D=3D 36518 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2951  			BPF_JMP_IMM(BPF_JEQ=
, R5, 36518, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2952  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2953  			BPF_ALU32_REG(BPF_A=
DD, R6, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2954  			BPF_ALU32_REG(BPF_A=
DD, R6, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2955  			BPF_ALU32_REG(BPF_A=
DD, R6, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2956  			BPF_ALU32_REG(BPF_A=
DD, R6, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2957  			BPF_ALU32_REG(BPF_A=
DD, R6, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2958  			BPF_ALU32_REG(BPF_A=
DD, R6, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2959  			BPF_ALU32_REG(BPF_A=
DD, R6, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2960  			BPF_ALU32_REG(BPF_A=
DD, R6, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2961  			BPF_ALU32_REG(BPF_A=
DD, R6, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2962  			BPF_ALU32_REG(BPF_A=
DD, R6, R9), /* R6 =3D=3D 109540 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2963  			BPF_JMP_IMM(BPF_JEQ=
, R6, 109540, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2964  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2965  			BPF_ALU32_REG(BPF_A=
DD, R7, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2966  			BPF_ALU32_REG(BPF_A=
DD, R7, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2967  			BPF_ALU32_REG(BPF_A=
DD, R7, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2968  			BPF_ALU32_REG(BPF_A=
DD, R7, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2969  			BPF_ALU32_REG(BPF_A=
DD, R7, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2970  			BPF_ALU32_REG(BPF_A=
DD, R7, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2971  			BPF_ALU32_REG(BPF_A=
DD, R7, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2972  			BPF_ALU32_REG(BPF_A=
DD, R7, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2973  			BPF_ALU32_REG(BPF_A=
DD, R7, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2974  			BPF_ALU32_REG(BPF_A=
DD, R7, R9), /* R7 =3D=3D 328605 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2975  			BPF_JMP_IMM(BPF_JEQ=
, R7, 328605, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2976  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2977  			BPF_ALU32_REG(BPF_A=
DD, R8, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2978  			BPF_ALU32_REG(BPF_A=
DD, R8, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2979  			BPF_ALU32_REG(BPF_A=
DD, R8, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2980  			BPF_ALU32_REG(BPF_A=
DD, R8, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2981  			BPF_ALU32_REG(BPF_A=
DD, R8, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2982  			BPF_ALU32_REG(BPF_A=
DD, R8, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2983  			BPF_ALU32_REG(BPF_A=
DD, R8, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2984  			BPF_ALU32_REG(BPF_A=
DD, R8, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2985  			BPF_ALU32_REG(BPF_A=
DD, R8, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2986  			BPF_ALU32_REG(BPF_A=
DD, R8, R9), /* R8 =3D=3D 985799 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2987  			BPF_JMP_IMM(BPF_JEQ=
, R8, 985799, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2988  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2989  			BPF_ALU32_REG(BPF_A=
DD, R9, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2990  			BPF_ALU32_REG(BPF_A=
DD, R9, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2991  			BPF_ALU32_REG(BPF_A=
DD, R9, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2992  			BPF_ALU32_REG(BPF_A=
DD, R9, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2993  			BPF_ALU32_REG(BPF_A=
DD, R9, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2994  			BPF_ALU32_REG(BPF_A=
DD, R9, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2995  			BPF_ALU32_REG(BPF_A=
DD, R9, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2996  			BPF_ALU32_REG(BPF_A=
DD, R9, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2997  			BPF_ALU32_REG(BPF_A=
DD, R9, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2998  			BPF_ALU32_REG(BPF_A=
DD, R9, R9), /* R9 =3D=3D 2957380 */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   2999  			BPF_ALU32_REG(BPF_M=
OV, R0, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3000  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3001  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3002  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3003  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3004  		{ { 0, 2957380 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3005  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3006  	{	/* Mainly checking =
JIT here. */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3007  		"INT: SUB",
ece80490e2c1ce Andrew Morton      2014-05-22   3008  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3009  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3010  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3011  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3012  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3013  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3014  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3015  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3016  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3017  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3018  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3019  			BPF_ALU64_REG(BPF_S=
UB, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3020  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3021  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3022  			BPF_ALU64_REG(BPF_S=
UB, R0, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3023  			BPF_ALU64_REG(BPF_S=
UB, R0, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3024  			BPF_ALU64_REG(BPF_S=
UB, R0, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3025  			BPF_ALU64_REG(BPF_S=
UB, R0, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3026  			BPF_ALU64_REG(BPF_S=
UB, R0, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3027  			BPF_ALU64_REG(BPF_S=
UB, R0, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3028  			BPF_ALU64_REG(BPF_S=
UB, R0, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3029  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3030  			BPF_JMP_IMM(BPF_JEQ=
, R0, -55, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3031  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3032  			BPF_ALU64_REG(BPF_S=
UB, R1, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3033  			BPF_ALU64_REG(BPF_S=
UB, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3034  			BPF_ALU64_REG(BPF_S=
UB, R1, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3035  			BPF_ALU64_REG(BPF_S=
UB, R1, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3036  			BPF_ALU64_REG(BPF_S=
UB, R1, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3037  			BPF_ALU64_REG(BPF_S=
UB, R1, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3038  			BPF_ALU64_REG(BPF_S=
UB, R1, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3039  			BPF_ALU64_REG(BPF_S=
UB, R1, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3040  			BPF_ALU64_REG(BPF_S=
UB, R1, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3041  			BPF_ALU64_IMM(BPF_S=
UB, R1, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3042  			BPF_ALU64_REG(BPF_S=
UB, R2, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3043  			BPF_ALU64_REG(BPF_S=
UB, R2, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3044  			BPF_ALU64_REG(BPF_S=
UB, R2, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3045  			BPF_ALU64_REG(BPF_S=
UB, R2, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3046  			BPF_ALU64_REG(BPF_S=
UB, R2, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3047  			BPF_ALU64_REG(BPF_S=
UB, R2, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3048  			BPF_ALU64_REG(BPF_S=
UB, R2, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3049  			BPF_ALU64_REG(BPF_S=
UB, R2, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3050  			BPF_ALU64_REG(BPF_S=
UB, R2, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3051  			BPF_ALU64_IMM(BPF_S=
UB, R2, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3052  			BPF_ALU64_REG(BPF_S=
UB, R3, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3053  			BPF_ALU64_REG(BPF_S=
UB, R3, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3054  			BPF_ALU64_REG(BPF_S=
UB, R3, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3055  			BPF_ALU64_REG(BPF_S=
UB, R3, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3056  			BPF_ALU64_REG(BPF_S=
UB, R3, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3057  			BPF_ALU64_REG(BPF_S=
UB, R3, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3058  			BPF_ALU64_REG(BPF_S=
UB, R3, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3059  			BPF_ALU64_REG(BPF_S=
UB, R3, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3060  			BPF_ALU64_REG(BPF_S=
UB, R3, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3061  			BPF_ALU64_IMM(BPF_S=
UB, R3, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3062  			BPF_ALU64_REG(BPF_S=
UB, R4, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3063  			BPF_ALU64_REG(BPF_S=
UB, R4, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3064  			BPF_ALU64_REG(BPF_S=
UB, R4, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3065  			BPF_ALU64_REG(BPF_S=
UB, R4, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3066  			BPF_ALU64_REG(BPF_S=
UB, R4, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3067  			BPF_ALU64_REG(BPF_S=
UB, R4, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3068  			BPF_ALU64_REG(BPF_S=
UB, R4, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3069  			BPF_ALU64_REG(BPF_S=
UB, R4, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3070  			BPF_ALU64_REG(BPF_S=
UB, R4, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3071  			BPF_ALU64_IMM(BPF_S=
UB, R4, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3072  			BPF_ALU64_REG(BPF_S=
UB, R5, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3073  			BPF_ALU64_REG(BPF_S=
UB, R5, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3074  			BPF_ALU64_REG(BPF_S=
UB, R5, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3075  			BPF_ALU64_REG(BPF_S=
UB, R5, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3076  			BPF_ALU64_REG(BPF_S=
UB, R5, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3077  			BPF_ALU64_REG(BPF_S=
UB, R5, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3078  			BPF_ALU64_REG(BPF_S=
UB, R5, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3079  			BPF_ALU64_REG(BPF_S=
UB, R5, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3080  			BPF_ALU64_REG(BPF_S=
UB, R5, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3081  			BPF_ALU64_IMM(BPF_S=
UB, R5, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3082  			BPF_ALU64_REG(BPF_S=
UB, R6, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3083  			BPF_ALU64_REG(BPF_S=
UB, R6, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3084  			BPF_ALU64_REG(BPF_S=
UB, R6, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3085  			BPF_ALU64_REG(BPF_S=
UB, R6, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3086  			BPF_ALU64_REG(BPF_S=
UB, R6, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3087  			BPF_ALU64_REG(BPF_S=
UB, R6, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3088  			BPF_ALU64_REG(BPF_S=
UB, R6, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3089  			BPF_ALU64_REG(BPF_S=
UB, R6, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3090  			BPF_ALU64_REG(BPF_S=
UB, R6, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3091  			BPF_ALU64_IMM(BPF_S=
UB, R6, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3092  			BPF_ALU64_REG(BPF_S=
UB, R7, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3093  			BPF_ALU64_REG(BPF_S=
UB, R7, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3094  			BPF_ALU64_REG(BPF_S=
UB, R7, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3095  			BPF_ALU64_REG(BPF_S=
UB, R7, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3096  			BPF_ALU64_REG(BPF_S=
UB, R7, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3097  			BPF_ALU64_REG(BPF_S=
UB, R7, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3098  			BPF_ALU64_REG(BPF_S=
UB, R7, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3099  			BPF_ALU64_REG(BPF_S=
UB, R7, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3100  			BPF_ALU64_REG(BPF_S=
UB, R7, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3101  			BPF_ALU64_IMM(BPF_S=
UB, R7, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3102  			BPF_ALU64_REG(BPF_S=
UB, R8, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3103  			BPF_ALU64_REG(BPF_S=
UB, R8, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3104  			BPF_ALU64_REG(BPF_S=
UB, R8, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3105  			BPF_ALU64_REG(BPF_S=
UB, R8, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3106  			BPF_ALU64_REG(BPF_S=
UB, R8, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3107  			BPF_ALU64_REG(BPF_S=
UB, R8, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3108  			BPF_ALU64_REG(BPF_S=
UB, R8, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3109  			BPF_ALU64_REG(BPF_S=
UB, R8, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3110  			BPF_ALU64_REG(BPF_S=
UB, R8, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3111  			BPF_ALU64_IMM(BPF_S=
UB, R8, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3112  			BPF_ALU64_REG(BPF_S=
UB, R9, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3113  			BPF_ALU64_REG(BPF_S=
UB, R9, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3114  			BPF_ALU64_REG(BPF_S=
UB, R9, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3115  			BPF_ALU64_REG(BPF_S=
UB, R9, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3116  			BPF_ALU64_REG(BPF_S=
UB, R9, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3117  			BPF_ALU64_REG(BPF_S=
UB, R9, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3118  			BPF_ALU64_REG(BPF_S=
UB, R9, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3119  			BPF_ALU64_REG(BPF_S=
UB, R9, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3120  			BPF_ALU64_REG(BPF_S=
UB, R9, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3121  			BPF_ALU64_IMM(BPF_S=
UB, R9, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3122  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3123  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3124  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3125  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3126  			BPF_ALU64_REG(BPF_S=
UB, R0, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3127  			BPF_ALU64_REG(BPF_S=
UB, R0, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3128  			BPF_ALU64_REG(BPF_S=
UB, R0, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3129  			BPF_ALU64_REG(BPF_S=
UB, R0, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3130  			BPF_ALU64_REG(BPF_S=
UB, R0, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3131  			BPF_ALU64_REG(BPF_S=
UB, R0, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3132  			BPF_ALU64_REG(BPF_S=
UB, R0, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3133  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3134  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3135  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3136  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3137  		{ { 0, 11 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3138  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3139  	{	/* Mainly checking =
JIT here. */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3140  		"INT: XOR",
ece80490e2c1ce Andrew Morton      2014-05-22   3141  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3142  			BPF_ALU64_REG(BPF_S=
UB, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3143  			BPF_ALU64_REG(BPF_X=
OR, R1, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3144  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3145  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3146  			BPF_ALU64_IMM(BPF_M=
OV, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3147  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3148  			BPF_ALU64_REG(BPF_S=
UB, R1, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3149  			BPF_ALU64_REG(BPF_X=
OR, R2, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3150  			BPF_JMP_REG(BPF_JEQ=
, R1, R2, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3151  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3152  			BPF_ALU64_REG(BPF_S=
UB, R2, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3153  			BPF_ALU64_REG(BPF_X=
OR, R3, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3154  			BPF_ALU64_IMM(BPF_M=
OV, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3155  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3156  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3157  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3158  			BPF_ALU64_REG(BPF_S=
UB, R3, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3159  			BPF_ALU64_REG(BPF_X=
OR, R4, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3160  			BPF_ALU64_IMM(BPF_M=
OV, R2, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3161  			BPF_ALU64_IMM(BPF_M=
OV, R5, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3162  			BPF_JMP_REG(BPF_JEQ=
, R3, R4, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3163  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3164  			BPF_ALU64_REG(BPF_S=
UB, R4, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3165  			BPF_ALU64_REG(BPF_X=
OR, R5, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3166  			BPF_ALU64_IMM(BPF_M=
OV, R3, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3167  			BPF_ALU64_IMM(BPF_M=
OV, R7, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3168  			BPF_JMP_REG(BPF_JEQ=
, R5, R4, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3169  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3170  			BPF_ALU64_IMM(BPF_M=
OV, R5, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3171  			BPF_ALU64_REG(BPF_S=
UB, R5, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3172  			BPF_ALU64_REG(BPF_X=
OR, R6, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3173  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3174  			BPF_ALU64_IMM(BPF_M=
OV, R8, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3175  			BPF_JMP_REG(BPF_JEQ=
, R5, R6, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3176  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3177  			BPF_ALU64_REG(BPF_S=
UB, R6, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3178  			BPF_ALU64_REG(BPF_X=
OR, R7, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3179  			BPF_JMP_REG(BPF_JEQ=
, R7, R6, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3180  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3181  			BPF_ALU64_REG(BPF_S=
UB, R7, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3182  			BPF_ALU64_REG(BPF_X=
OR, R8, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3183  			BPF_JMP_REG(BPF_JEQ=
, R7, R8, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3184  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3185  			BPF_ALU64_REG(BPF_S=
UB, R8, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3186  			BPF_ALU64_REG(BPF_X=
OR, R9, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3187  			BPF_JMP_REG(BPF_JEQ=
, R9, R8, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3188  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3189  			BPF_ALU64_REG(BPF_S=
UB, R9, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3190  			BPF_ALU64_REG(BPF_X=
OR, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3191  			BPF_JMP_REG(BPF_JEQ=
, R9, R0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3192  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3193  			BPF_ALU64_REG(BPF_S=
UB, R1, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3194  			BPF_ALU64_REG(BPF_X=
OR, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3195  			BPF_JMP_REG(BPF_JEQ=
, R9, R0, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3196  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3197  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3198  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3199  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3200  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3201  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3202  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3203  		{ { 0, 1 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3204  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3205  	{	/* Mainly checking =
JIT here. */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3206  		"INT: MUL",
ece80490e2c1ce Andrew Morton      2014-05-22   3207  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3208  			BPF_ALU64_IMM(BPF_M=
OV, R0, 11),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3209  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3210  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3211  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3212  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3213  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3214  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3215  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3216  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3217  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3218  			BPF_ALU64_REG(BPF_M=
UL, R0, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3219  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3220  			BPF_ALU64_REG(BPF_M=
UL, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3221  			BPF_ALU64_REG(BPF_M=
UL, R0, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3222  			BPF_ALU64_REG(BPF_M=
UL, R0, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3223  			BPF_ALU64_REG(BPF_M=
UL, R0, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3224  			BPF_ALU64_REG(BPF_M=
UL, R0, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3225  			BPF_ALU64_REG(BPF_M=
UL, R0, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3226  			BPF_ALU64_REG(BPF_M=
UL, R0, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3227  			BPF_ALU64_REG(BPF_M=
UL, R0, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3228  			BPF_ALU64_IMM(BPF_M=
UL, R0, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3229  			BPF_JMP_IMM(BPF_JEQ=
, R0, 439084800, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3230  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3231  			BPF_ALU64_REG(BPF_M=
UL, R1, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3232  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3233  			BPF_ALU64_REG(BPF_M=
UL, R1, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3234  			BPF_ALU64_REG(BPF_M=
UL, R1, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3235  			BPF_ALU64_REG(BPF_M=
UL, R1, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3236  			BPF_ALU64_REG(BPF_M=
UL, R1, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3237  			BPF_ALU64_REG(BPF_M=
UL, R1, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3238  			BPF_ALU64_REG(BPF_M=
UL, R1, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3239  			BPF_ALU64_REG(BPF_M=
UL, R1, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3240  			BPF_ALU64_IMM(BPF_M=
UL, R1, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3241  			BPF_ALU64_REG(BPF_M=
OV, R2, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3242  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3243  			BPF_JMP_IMM(BPF_JEQ=
, R2, 0x5a924, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3244  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3245  			BPF_ALU64_IMM(BPF_L=
SH, R1, 32),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3246  			BPF_ALU64_IMM(BPF_A=
RSH, R1, 32),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3247  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xebb90000, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3248  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3249  			BPF_ALU64_REG(BPF_M=
UL, R2, R0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3250  			BPF_ALU64_REG(BPF_M=
UL, R2, R1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3251  			BPF_ALU64_REG(BPF_M=
UL, R2, R3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3252  			BPF_ALU64_REG(BPF_M=
UL, R2, R4),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3253  			BPF_ALU64_REG(BPF_M=
UL, R2, R5),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3254  			BPF_ALU64_REG(BPF_M=
UL, R2, R6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3255  			BPF_ALU64_REG(BPF_M=
UL, R2, R7),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3256  			BPF_ALU64_REG(BPF_M=
UL, R2, R8),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3257  			BPF_ALU64_REG(BPF_M=
UL, R2, R9),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3258  			BPF_ALU64_IMM(BPF_M=
UL, R2, 10),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3259  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3260  			BPF_ALU64_REG(BPF_M=
OV, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3261  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3262  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3263  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3264  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3265  		{ { 0, 0x35d97ef2 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3266  	},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3267  	{	/* Mainly checking =
JIT here. */
9dd2af834dea13 Daniel Borkmann    2015-12-17   3268  		"MOV REG64",
9dd2af834dea13 Daniel Borkmann    2015-12-17   3269  		.u.insns_int =3D {
9dd2af834dea13 Daniel Borkmann    2015-12-17   3270  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3271  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3272  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3273  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3274  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3275  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3276  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3277  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3278  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3279  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3280  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3281  			BPF_ALU64_IMM(BPF_M=
OV, R1, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3282  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3283  			BPF_ALU64_IMM(BPF_M=
OV, R3, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3284  			BPF_ALU64_IMM(BPF_M=
OV, R4, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3285  			BPF_ALU64_IMM(BPF_M=
OV, R5, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3286  			BPF_ALU64_IMM(BPF_M=
OV, R6, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3287  			BPF_ALU64_IMM(BPF_M=
OV, R7, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3288  			BPF_ALU64_IMM(BPF_M=
OV, R8, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3289  			BPF_ALU64_IMM(BPF_M=
OV, R9, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3290  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3291  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3292  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3293  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3294  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3295  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3296  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3297  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3298  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3299  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3300  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3301  			BPF_EXIT_INSN(),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3302  		},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3303  		INTERNAL,
9dd2af834dea13 Daniel Borkmann    2015-12-17   3304  		{ },
9dd2af834dea13 Daniel Borkmann    2015-12-17   3305  		{ { 0, 0xfefe } }
9dd2af834dea13 Daniel Borkmann    2015-12-17   3306  	},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3307  	{	/* Mainly checking =
JIT here. */
9dd2af834dea13 Daniel Borkmann    2015-12-17   3308  		"MOV REG32",
9dd2af834dea13 Daniel Borkmann    2015-12-17   3309  		.u.insns_int =3D {
9dd2af834dea13 Daniel Borkmann    2015-12-17   3310  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3311  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3312  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3313  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3314  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3315  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3316  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3317  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3318  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3319  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3320  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3321  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3322  			BPF_ALU32_IMM(BPF_M=
OV, R2, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3323  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3324  			BPF_ALU32_IMM(BPF_M=
OV, R4, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3325  			BPF_ALU32_IMM(BPF_M=
OV, R5, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3326  			BPF_ALU32_IMM(BPF_M=
OV, R6, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3327  			BPF_ALU32_IMM(BPF_M=
OV, R7, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3328  			BPF_ALU32_IMM(BPF_M=
OV, R8, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3329  			BPF_ALU32_IMM(BPF_M=
OV, R9, 0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3330  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3331  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3332  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3333  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3334  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3335  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3336  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3337  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3338  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3339  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3340  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3341  			BPF_EXIT_INSN(),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3342  		},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3343  		INTERNAL,
9dd2af834dea13 Daniel Borkmann    2015-12-17   3344  		{ },
9dd2af834dea13 Daniel Borkmann    2015-12-17   3345  		{ { 0, 0xfefe } }
9dd2af834dea13 Daniel Borkmann    2015-12-17   3346  	},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3347  	{	/* Mainly checking =
JIT here. */
9dd2af834dea13 Daniel Borkmann    2015-12-17   3348  		"LD IMM64",
9dd2af834dea13 Daniel Borkmann    2015-12-17   3349  		.u.insns_int =3D {
9dd2af834dea13 Daniel Borkmann    2015-12-17   3350  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3351  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3352  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3353  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3354  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3355  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3356  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3357  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3358  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3359  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3360  			BPF_LD_IMM64(R0, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3361  			BPF_LD_IMM64(R1, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3362  			BPF_LD_IMM64(R2, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3363  			BPF_LD_IMM64(R3, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3364  			BPF_LD_IMM64(R4, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3365  			BPF_LD_IMM64(R5, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3366  			BPF_LD_IMM64(R6, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3367  			BPF_LD_IMM64(R7, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3368  			BPF_LD_IMM64(R8, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3369  			BPF_LD_IMM64(R9, 0x=
0LL),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3370  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3371  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3372  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3373  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3374  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3375  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3376  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3377  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3378  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3379  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3380  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3381  			BPF_EXIT_INSN(),
9dd2af834dea13 Daniel Borkmann    2015-12-17   3382  		},
9dd2af834dea13 Daniel Borkmann    2015-12-17   3383  		INTERNAL,
9dd2af834dea13 Daniel Borkmann    2015-12-17   3384  		{ },
9dd2af834dea13 Daniel Borkmann    2015-12-17   3385  		{ { 0, 0xfefe } }
9dd2af834dea13 Daniel Borkmann    2015-12-17   3386  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3387  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3388  		"INT: ALU MIX",
ece80490e2c1ce Andrew Morton      2014-05-22   3389  		.u.insns_int =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3390  			BPF_ALU64_IMM(BPF_M=
OV, R0, 11),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3391  			BPF_ALU64_IMM(BPF_A=
DD, R0, -1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3392  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3393  			BPF_ALU64_IMM(BPF_X=
OR, R2, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3394  			BPF_ALU64_REG(BPF_D=
IV, R0, R2),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3395  			BPF_JMP_IMM(BPF_JEQ=
, R0, 10, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3396  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3397  			BPF_ALU64_IMM(BPF_M=
OD, R0, 3),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3398  			BPF_JMP_IMM(BPF_JEQ=
, R0, 1, 1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3399  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3400  			BPF_ALU64_IMM(BPF_M=
OV, R0, -1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3401  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3402  		},
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3403  		INTERNAL,
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3404  		{ },
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3405  		{ { 0, -1 } }
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3406  	},
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3407  	{
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3408  		"INT: shifts by regi=
ster",
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3409  		.u.insns_int =3D {
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3410  			BPF_MOV64_IMM(R0, -=
1234),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3411  			BPF_MOV64_IMM(R1, 1=
),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3412  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3413  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0x7ffffd97, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3414  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3415  			BPF_MOV64_IMM(R2, 1=
),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3416  			BPF_ALU64_REG(BPF_L=
SH, R0, R2),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3417  			BPF_MOV32_IMM(R4, -=
1234),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3418  			BPF_JMP_REG(BPF_JEQ=
, R0, R4, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3419  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3420  			BPF_ALU64_IMM(BPF_A=
ND, R4, 63),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3421  			BPF_ALU64_REG(BPF_L=
SH, R0, R4), /* R0 <=3D 46 */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3422  			BPF_MOV64_IMM(R3, 4=
7),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3423  			BPF_ALU64_REG(BPF_A=
RSH, R0, R3),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3424  			BPF_JMP_IMM(BPF_JEQ=
, R0, -617, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3425  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3426  			BPF_MOV64_IMM(R2, 1=
),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3427  			BPF_ALU64_REG(BPF_L=
SH, R4, R2), /* R4 =3D 46 << 1 */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3428  			BPF_JMP_IMM(BPF_JEQ=
, R4, 92, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3429  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3430  			BPF_MOV64_IMM(R4, 4=
),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3431  			BPF_ALU64_REG(BPF_L=
SH, R4, R4), /* R4 =3D 4 << 4 */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3432  			BPF_JMP_IMM(BPF_JEQ=
, R4, 64, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3433  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3434  			BPF_MOV64_IMM(R4, 5=
),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3435  			BPF_ALU32_REG(BPF_L=
SH, R4, R4), /* R4 =3D 5 << 5 */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3436  			BPF_JMP_IMM(BPF_JEQ=
, R4, 160, 1),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3437  			BPF_EXIT_INSN(),
72b603ee8cfc6b Alexei Starovoitov 2014-08-25   3438  			BPF_MOV64_IMM(R0, -=
1),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3439  			BPF_EXIT_INSN(),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3440  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3441  		INTERNAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3442  		{ },
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3443  		{ { 0, -1 } }
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3444  	},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3445  	{
84024a4e86d9b2 Johan Almbladh     2021-08-09   3446  		/*
84024a4e86d9b2 Johan Almbladh     2021-08-09   3447  		 * Register (non-)cl=
obbering test, in the case where a 32-bit
84024a4e86d9b2 Johan Almbladh     2021-08-09   3448  		 * JIT implements co=
mplex ALU64 operations via function calls.
84024a4e86d9b2 Johan Almbladh     2021-08-09   3449  		 * If so, the functi=
on call must be invisible in the eBPF
84024a4e86d9b2 Johan Almbladh     2021-08-09   3450  		 * registers. The JI=
T must then save and restore relevant
84024a4e86d9b2 Johan Almbladh     2021-08-09   3451  		 * registers during =
the call. The following tests check that
84024a4e86d9b2 Johan Almbladh     2021-08-09   3452  		 * the eBPF register=
s retain their values after such a call.
84024a4e86d9b2 Johan Almbladh     2021-08-09   3453  		 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3454  		"INT: Register clobb=
ering, R1 updated",
84024a4e86d9b2 Johan Almbladh     2021-08-09   3455  		.u.insns_int =3D {
84024a4e86d9b2 Johan Almbladh     2021-08-09   3456  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3457  			BPF_ALU32_IMM(BPF_M=
OV, R1, 123456789),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3458  			BPF_ALU32_IMM(BPF_M=
OV, R2, 2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3459  			BPF_ALU32_IMM(BPF_M=
OV, R3, 3),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3460  			BPF_ALU32_IMM(BPF_M=
OV, R4, 4),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3461  			BPF_ALU32_IMM(BPF_M=
OV, R5, 5),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3462  			BPF_ALU32_IMM(BPF_M=
OV, R6, 6),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3463  			BPF_ALU32_IMM(BPF_M=
OV, R7, 7),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3464  			BPF_ALU32_IMM(BPF_M=
OV, R8, 8),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3465  			BPF_ALU32_IMM(BPF_M=
OV, R9, 9),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3466  			BPF_ALU64_IMM(BPF_D=
IV, R1, 123456789),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3467  			BPF_JMP_IMM(BPF_JNE=
, R0, 0, 10),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3468  			BPF_JMP_IMM(BPF_JNE=
, R1, 1, 9),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3469  			BPF_JMP_IMM(BPF_JNE=
, R2, 2, 8),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3470  			BPF_JMP_IMM(BPF_JNE=
, R3, 3, 7),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3471  			BPF_JMP_IMM(BPF_JNE=
, R4, 4, 6),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3472  			BPF_JMP_IMM(BPF_JNE=
, R5, 5, 5),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3473  			BPF_JMP_IMM(BPF_JNE=
, R6, 6, 4),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3474  			BPF_JMP_IMM(BPF_JNE=
, R7, 7, 3),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3475  			BPF_JMP_IMM(BPF_JNE=
, R8, 8, 2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3476  			BPF_JMP_IMM(BPF_JNE=
, R9, 9, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3477  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3478  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3479  		},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3480  		INTERNAL,
84024a4e86d9b2 Johan Almbladh     2021-08-09   3481  		{ },
84024a4e86d9b2 Johan Almbladh     2021-08-09   3482  		{ { 0, 1 } }
84024a4e86d9b2 Johan Almbladh     2021-08-09   3483  	},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3484  	{
84024a4e86d9b2 Johan Almbladh     2021-08-09   3485  		"INT: Register clobb=
ering, R2 updated",
84024a4e86d9b2 Johan Almbladh     2021-08-09   3486  		.u.insns_int =3D {
84024a4e86d9b2 Johan Almbladh     2021-08-09   3487  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3488  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3489  			BPF_ALU32_IMM(BPF_M=
OV, R2, 2 * 123456789),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3490  			BPF_ALU32_IMM(BPF_M=
OV, R3, 3),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3491  			BPF_ALU32_IMM(BPF_M=
OV, R4, 4),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3492  			BPF_ALU32_IMM(BPF_M=
OV, R5, 5),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3493  			BPF_ALU32_IMM(BPF_M=
OV, R6, 6),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3494  			BPF_ALU32_IMM(BPF_M=
OV, R7, 7),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3495  			BPF_ALU32_IMM(BPF_M=
OV, R8, 8),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3496  			BPF_ALU32_IMM(BPF_M=
OV, R9, 9),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3497  			BPF_ALU64_IMM(BPF_D=
IV, R2, 123456789),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3498  			BPF_JMP_IMM(BPF_JNE=
, R0, 0, 10),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3499  			BPF_JMP_IMM(BPF_JNE=
, R1, 1, 9),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3500  			BPF_JMP_IMM(BPF_JNE=
, R2, 2, 8),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3501  			BPF_JMP_IMM(BPF_JNE=
, R3, 3, 7),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3502  			BPF_JMP_IMM(BPF_JNE=
, R4, 4, 6),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3503  			BPF_JMP_IMM(BPF_JNE=
, R5, 5, 5),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3504  			BPF_JMP_IMM(BPF_JNE=
, R6, 6, 4),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3505  			BPF_JMP_IMM(BPF_JNE=
, R7, 7, 3),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3506  			BPF_JMP_IMM(BPF_JNE=
, R8, 8, 2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3507  			BPF_JMP_IMM(BPF_JNE=
, R9, 9, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3508  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3509  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3510  		},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3511  		INTERNAL,
84024a4e86d9b2 Johan Almbladh     2021-08-09   3512  		{ },
84024a4e86d9b2 Johan Almbladh     2021-08-09   3513  		{ { 0, 1 } }
84024a4e86d9b2 Johan Almbladh     2021-08-09   3514  	},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3515  	{
84024a4e86d9b2 Johan Almbladh     2021-08-09   3516  		/*
84024a4e86d9b2 Johan Almbladh     2021-08-09   3517  		 * Test 32-bit JITs =
that implement complex ALU64 operations as
84024a4e86d9b2 Johan Almbladh     2021-08-09   3518  		 * function calls R0=
 =3D f(R1, R2), and must re-arrange operands.
84024a4e86d9b2 Johan Almbladh     2021-08-09   3519  		 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3520  #define NUMER 0xfedcba=
9876543210ULL
84024a4e86d9b2 Johan Almbladh     2021-08-09   3521  #define DENOM 0x012345=
6789abcdefULL
84024a4e86d9b2 Johan Almbladh     2021-08-09   3522  		"ALU64_DIV X: Operan=
d register permutations",
84024a4e86d9b2 Johan Almbladh     2021-08-09   3523  		.u.insns_int =3D {
84024a4e86d9b2 Johan Almbladh     2021-08-09   3524  			/* R0 / R2 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3525  			BPF_LD_IMM64(R0, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3526  			BPF_LD_IMM64(R2, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3527  			BPF_ALU64_REG(BPF_D=
IV, R0, R2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3528  			BPF_JMP_IMM(BPF_JEQ=
, R0, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3529  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3530  			/* R1 / R0 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3531  			BPF_LD_IMM64(R1, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3532  			BPF_LD_IMM64(R0, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3533  			BPF_ALU64_REG(BPF_D=
IV, R1, R0),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3534  			BPF_JMP_IMM(BPF_JEQ=
, R1, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3535  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3536  			/* R0 / R1 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3537  			BPF_LD_IMM64(R0, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3538  			BPF_LD_IMM64(R1, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3539  			BPF_ALU64_REG(BPF_D=
IV, R0, R1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3540  			BPF_JMP_IMM(BPF_JEQ=
, R0, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3541  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3542  			/* R2 / R0 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3543  			BPF_LD_IMM64(R2, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3544  			BPF_LD_IMM64(R0, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3545  			BPF_ALU64_REG(BPF_D=
IV, R2, R0),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3546  			BPF_JMP_IMM(BPF_JEQ=
, R2, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3547  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3548  			/* R2 / R1 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3549  			BPF_LD_IMM64(R2, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3550  			BPF_LD_IMM64(R1, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3551  			BPF_ALU64_REG(BPF_D=
IV, R2, R1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3552  			BPF_JMP_IMM(BPF_JEQ=
, R2, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3553  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3554  			/* R1 / R2 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3555  			BPF_LD_IMM64(R1, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3556  			BPF_LD_IMM64(R2, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3557  			BPF_ALU64_REG(BPF_D=
IV, R1, R2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3558  			BPF_JMP_IMM(BPF_JEQ=
, R1, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3559  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3560  			/* R1 / R1 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3561  			BPF_LD_IMM64(R1, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3562  			BPF_ALU64_REG(BPF_D=
IV, R1, R1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3563  			BPF_JMP_IMM(BPF_JEQ=
, R1, 1, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3564  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3565  			/* R2 / R2 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3566  			BPF_LD_IMM64(R2, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3567  			BPF_ALU64_REG(BPF_D=
IV, R2, R2),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3568  			BPF_JMP_IMM(BPF_JEQ=
, R2, 1, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3569  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3570  			/* R3 / R4 */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3571  			BPF_LD_IMM64(R3, NU=
MER),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3572  			BPF_LD_IMM64(R4, DE=
NOM),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3573  			BPF_ALU64_REG(BPF_D=
IV, R3, R4),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3574  			BPF_JMP_IMM(BPF_JEQ=
, R3, NUMER / DENOM, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3575  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3576  			/* Successful retur=
n */
84024a4e86d9b2 Johan Almbladh     2021-08-09   3577  			BPF_LD_IMM64(R0, 1),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3578  			BPF_EXIT_INSN(),
84024a4e86d9b2 Johan Almbladh     2021-08-09   3579  		},
84024a4e86d9b2 Johan Almbladh     2021-08-09   3580  		INTERNAL,
84024a4e86d9b2 Johan Almbladh     2021-08-09   3581  		{ },
84024a4e86d9b2 Johan Almbladh     2021-08-09   3582  		{ { 0, 1 } },
84024a4e86d9b2 Johan Almbladh     2021-08-09   3583  #undef NUMER
84024a4e86d9b2 Johan Almbladh     2021-08-09   3584  #undef DENOM
84024a4e86d9b2 Johan Almbladh     2021-08-09   3585  	},
53e33f9928cd61 Johan Almbladh     2021-08-09   3586  #ifdef CONFIG_32BIT
53e33f9928cd61 Johan Almbladh     2021-08-09   3587  	{
53e33f9928cd61 Johan Almbladh     2021-08-09   3588  		"INT: 32-bit context=
 pointer word order and zero-extension",
53e33f9928cd61 Johan Almbladh     2021-08-09   3589  		.u.insns_int =3D {
53e33f9928cd61 Johan Almbladh     2021-08-09   3590  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
53e33f9928cd61 Johan Almbladh     2021-08-09   3591  			BPF_JMP32_IMM(BPF_J=
EQ, R1, 0, 3),
53e33f9928cd61 Johan Almbladh     2021-08-09   3592  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
53e33f9928cd61 Johan Almbladh     2021-08-09   3593  			BPF_JMP32_IMM(BPF_J=
NE, R1, 0, 1),
53e33f9928cd61 Johan Almbladh     2021-08-09   3594  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
53e33f9928cd61 Johan Almbladh     2021-08-09   3595  			BPF_EXIT_INSN(),
53e33f9928cd61 Johan Almbladh     2021-08-09   3596  		},
53e33f9928cd61 Johan Almbladh     2021-08-09   3597  		INTERNAL,
53e33f9928cd61 Johan Almbladh     2021-08-09   3598  		{ },
53e33f9928cd61 Johan Almbladh     2021-08-09   3599  		{ { 0, 1 } }
53e33f9928cd61 Johan Almbladh     2021-08-09   3600  	},
53e33f9928cd61 Johan Almbladh     2021-08-09   3601  #endif
64a8946b447e41 Alexei Starovoitov 2014-05-08   3602  	{
64a8946b447e41 Alexei Starovoitov 2014-05-08   3603  		"check: missing ret",
ece80490e2c1ce Andrew Morton      2014-05-22   3604  		.u.insns =3D {
64a8946b447e41 Alexei Starovoitov 2014-05-08   3605  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
64a8946b447e41 Alexei Starovoitov 2014-05-08   3606  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3607  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
64a8946b447e41 Alexei Starovoitov 2014-05-08   3608  		{ },
09584b40674241 Yonghong Song      2018-02-02   3609  		{ },
09584b40674241 Yonghong Song      2018-02-02   3610  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3611  		.expected_errcode =
=3D -EINVAL,
64a8946b447e41 Alexei Starovoitov 2014-05-08   3612  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3613  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3614  		"check: div_k_0",
ece80490e2c1ce Andrew Morton      2014-05-22   3615  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3616  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3617  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3618  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3619  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3620  		{ },
09584b40674241 Yonghong Song      2018-02-02   3621  		{ },
09584b40674241 Yonghong Song      2018-02-02   3622  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3623  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3624  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3625  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3626  		"check: unknown insn=
",
ece80490e2c1ce Andrew Morton      2014-05-22   3627  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3628  			/* seccomp insn, re=
jected in socket filter */
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3629  			BPF_STMT(BPF_LDX | =
BPF_W | BPF_ABS, 0),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3630  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3631  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3632  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3633  		{ },
09584b40674241 Yonghong Song      2018-02-02   3634  		{ },
09584b40674241 Yonghong Song      2018-02-02   3635  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3636  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3637  	},
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3638  	{
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3639  		"check: out of range=
 spill/fill",
ece80490e2c1ce Andrew Morton      2014-05-22   3640  		.u.insns =3D {
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3641  			BPF_STMT(BPF_STX, 1=
6),
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3642  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3643  		},
10f18e0ba1ea7e Daniel Borkmann    2014-05-23   3644  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3645  		{ },
09584b40674241 Yonghong Song      2018-02-02   3646  		{ },
09584b40674241 Yonghong Song      2018-02-02   3647  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3648  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a8 Alexei Starovoitov 2014-05-08   3649  	},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3650  	{
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3651  		"JUMPS + HOLES",
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3652  		.u.insns =3D {
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3653  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3654  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 15),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3655  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3656  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3657  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3658  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3659  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3660  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3661  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3662  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3663  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3664  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3665  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3666  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3667  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3668  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90c2894d, 3, 4),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3669  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3670  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90c2894d, 1, 2),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3671  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3672  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 14, 15),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3673  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 14),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3674  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3675  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3676  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3677  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3678  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3679  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3680  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3681  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3682  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3683  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3684  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3685  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3686  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3687  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x2ac28349, 2, 3),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3688  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x2ac28349, 1, 2),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3689  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3690  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 14, 15),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3691  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 14),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3692  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3693  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3694  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3695  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3696  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3697  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3698  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3699  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3700  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3701  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3702  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3703  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3704  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3705  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90d2ff41, 2, 3),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3706  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90d2ff41, 1, 2),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3707  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3708  			BPF_STMT(BPF_RET | =
BPF_A, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3709  			BPF_STMT(BPF_RET | =
BPF_A, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3710  		},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3711  		CLASSIC,
ce25b68b74593b Daniel Borkmann    2014-05-26   3712  		{ 0x00, 0x1b, 0x21, =
0x3c, 0x9d, 0xf8,
ce25b68b74593b Daniel Borkmann    2014-05-26   3713  		  0x90, 0xe2, 0xba, =
0x0a, 0x56, 0xb4,
ce25b68b74593b Daniel Borkmann    2014-05-26   3714  		  0x08, 0x00,
ce25b68b74593b Daniel Borkmann    2014-05-26   3715  		  0x45, 0x00, 0x00, =
0x28, 0x00, 0x00,
ce25b68b74593b Daniel Borkmann    2014-05-26   3716  		  0x20, 0x00, 0x40, =
0x11, 0x00, 0x00, /* IP header */
ce25b68b74593b Daniel Borkmann    2014-05-26   3717  		  0xc0, 0xa8, 0x33, =
0x01,
ce25b68b74593b Daniel Borkmann    2014-05-26   3718  		  0xc0, 0xa8, 0x33, =
0x02,
ce25b68b74593b Daniel Borkmann    2014-05-26   3719  		  0xbb, 0xb6,
ce25b68b74593b Daniel Borkmann    2014-05-26   3720  		  0xa9, 0xfa,
ce25b68b74593b Daniel Borkmann    2014-05-26   3721  		  0x00, 0x14, 0x00, =
0x00,
ce25b68b74593b Daniel Borkmann    2014-05-26   3722  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3723  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3724  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3725  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3726  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3727  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3728  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593b Daniel Borkmann    2014-05-26   3729  		  0xcc, 0xcc, 0xcc, =
0xcc },
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3730  		{ { 88, 0x001b } }
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3731  	},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3732  	{
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3733  		"check: RET X",
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3734  		.u.insns =3D {
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3735  			BPF_STMT(BPF_RET | =
BPF_X, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3736  		},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3737  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3738  		{ },
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3739  		{ },
09584b40674241 Yonghong Song      2018-02-02   3740  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3741  		.expected_errcode =
=3D -EINVAL,
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3742  	},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3743  	{
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3744  		"check: LDX + RET X",
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3745  		.u.insns =3D {
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3746  			BPF_STMT(BPF_LDX | =
BPF_IMM, 42),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3747  			BPF_STMT(BPF_RET | =
BPF_X, 0),
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3748  		},
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3749  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3750  		{ },
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3751  		{ },
09584b40674241 Yonghong Song      2018-02-02   3752  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3753  		.expected_errcode =
=3D -EINVAL,
2e8a83c52ffa41 Daniel Borkmann    2014-05-23   3754  	},
108cc22a93e184 Daniel Borkmann    2014-05-26   3755  	{	/* Mainly checking =
JIT here. */
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3756  		"M[]: alt STX + LDX",
108cc22a93e184 Daniel Borkmann    2014-05-26   3757  		.u.insns =3D {
108cc22a93e184 Daniel Borkmann    2014-05-26   3758  			BPF_STMT(BPF_LDX | =
BPF_IMM, 100),
108cc22a93e184 Daniel Borkmann    2014-05-26   3759  			BPF_STMT(BPF_STX, 0=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3760  			BPF_STMT(BPF_LDX | =
BPF_MEM, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3761  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3762  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3763  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3764  			BPF_STMT(BPF_STX, 1=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3765  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3766  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3767  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3768  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3769  			BPF_STMT(BPF_STX, 2=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3770  			BPF_STMT(BPF_LDX | =
BPF_MEM, 2),
108cc22a93e184 Daniel Borkmann    2014-05-26   3771  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3772  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3773  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3774  			BPF_STMT(BPF_STX, 3=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3775  			BPF_STMT(BPF_LDX | =
BPF_MEM, 3),
108cc22a93e184 Daniel Borkmann    2014-05-26   3776  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3777  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3778  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3779  			BPF_STMT(BPF_STX, 4=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3780  			BPF_STMT(BPF_LDX | =
BPF_MEM, 4),
108cc22a93e184 Daniel Borkmann    2014-05-26   3781  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3782  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3783  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3784  			BPF_STMT(BPF_STX, 5=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3785  			BPF_STMT(BPF_LDX | =
BPF_MEM, 5),
108cc22a93e184 Daniel Borkmann    2014-05-26   3786  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3787  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3788  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3789  			BPF_STMT(BPF_STX, 6=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3790  			BPF_STMT(BPF_LDX | =
BPF_MEM, 6),
108cc22a93e184 Daniel Borkmann    2014-05-26   3791  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3792  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3793  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3794  			BPF_STMT(BPF_STX, 7=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3795  			BPF_STMT(BPF_LDX | =
BPF_MEM, 7),
108cc22a93e184 Daniel Borkmann    2014-05-26   3796  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3797  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3798  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3799  			BPF_STMT(BPF_STX, 8=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3800  			BPF_STMT(BPF_LDX | =
BPF_MEM, 8),
108cc22a93e184 Daniel Borkmann    2014-05-26   3801  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3802  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3803  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3804  			BPF_STMT(BPF_STX, 9=
),
108cc22a93e184 Daniel Borkmann    2014-05-26   3805  			BPF_STMT(BPF_LDX | =
BPF_MEM, 9),
108cc22a93e184 Daniel Borkmann    2014-05-26   3806  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3807  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3808  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3809  			BPF_STMT(BPF_STX, 1=
0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3810  			BPF_STMT(BPF_LDX | =
BPF_MEM, 10),
108cc22a93e184 Daniel Borkmann    2014-05-26   3811  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3812  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3813  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3814  			BPF_STMT(BPF_STX, 1=
1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3815  			BPF_STMT(BPF_LDX | =
BPF_MEM, 11),
108cc22a93e184 Daniel Borkmann    2014-05-26   3816  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3817  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3818  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3819  			BPF_STMT(BPF_STX, 1=
2),
108cc22a93e184 Daniel Borkmann    2014-05-26   3820  			BPF_STMT(BPF_LDX | =
BPF_MEM, 12),
108cc22a93e184 Daniel Borkmann    2014-05-26   3821  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3822  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3823  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3824  			BPF_STMT(BPF_STX, 1=
3),
108cc22a93e184 Daniel Borkmann    2014-05-26   3825  			BPF_STMT(BPF_LDX | =
BPF_MEM, 13),
108cc22a93e184 Daniel Borkmann    2014-05-26   3826  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3827  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3828  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3829  			BPF_STMT(BPF_STX, 1=
4),
108cc22a93e184 Daniel Borkmann    2014-05-26   3830  			BPF_STMT(BPF_LDX | =
BPF_MEM, 14),
108cc22a93e184 Daniel Borkmann    2014-05-26   3831  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3832  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3833  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3834  			BPF_STMT(BPF_STX, 1=
5),
108cc22a93e184 Daniel Borkmann    2014-05-26   3835  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
108cc22a93e184 Daniel Borkmann    2014-05-26   3836  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3837  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e184 Daniel Borkmann    2014-05-26   3838  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3839  			BPF_STMT(BPF_RET | =
BPF_A, 0),
108cc22a93e184 Daniel Borkmann    2014-05-26   3840  		},
108cc22a93e184 Daniel Borkmann    2014-05-26   3841  		CLASSIC | FLAG_NO_DA=
TA,
108cc22a93e184 Daniel Borkmann    2014-05-26   3842  		{ },
108cc22a93e184 Daniel Borkmann    2014-05-26   3843  		{ { 0, 116 } },
108cc22a93e184 Daniel Borkmann    2014-05-26   3844  	},
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3845  	{	/* Mainly checking =
JIT here. */
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3846  		"M[]: full STX + ful=
l LDX",
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3847  		.u.insns =3D {
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3848  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbadfeedb),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3849  			BPF_STMT(BPF_STX, 0=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3850  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xecabedae),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3851  			BPF_STMT(BPF_STX, 1=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3852  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xafccfeaf),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3853  			BPF_STMT(BPF_STX, 2=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3854  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbffdcedc),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3855  			BPF_STMT(BPF_STX, 3=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3856  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfbbbdccb),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3857  			BPF_STMT(BPF_STX, 4=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3858  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfbabcbda),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3859  			BPF_STMT(BPF_STX, 5=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3860  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaedecbdb),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3861  			BPF_STMT(BPF_STX, 6=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3862  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xadebbade),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3863  			BPF_STMT(BPF_STX, 7=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3864  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfcfcfaec),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3865  			BPF_STMT(BPF_STX, 8=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3866  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbcdddbdc),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3867  			BPF_STMT(BPF_STX, 9=
),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3868  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfeefdfac),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3869  			BPF_STMT(BPF_STX, 1=
0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3870  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xcddcdeea),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3871  			BPF_STMT(BPF_STX, 1=
1),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3872  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaccfaebb),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3873  			BPF_STMT(BPF_STX, 1=
2),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3874  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbdcccdcf),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3875  			BPF_STMT(BPF_STX, 1=
3),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3876  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaaedecde),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3877  			BPF_STMT(BPF_STX, 1=
4),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3878  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfaeacdad),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3879  			BPF_STMT(BPF_STX, 1=
5),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3880  			BPF_STMT(BPF_LDX | =
BPF_MEM, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3881  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3882  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3883  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3884  			BPF_STMT(BPF_LDX | =
BPF_MEM, 2),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3885  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3886  			BPF_STMT(BPF_LDX | =
BPF_MEM, 3),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3887  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3888  			BPF_STMT(BPF_LDX | =
BPF_MEM, 4),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3889  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3890  			BPF_STMT(BPF_LDX | =
BPF_MEM, 5),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3891  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3892  			BPF_STMT(BPF_LDX | =
BPF_MEM, 6),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3893  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3894  			BPF_STMT(BPF_LDX | =
BPF_MEM, 7),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3895  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3896  			BPF_STMT(BPF_LDX | =
BPF_MEM, 8),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3897  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3898  			BPF_STMT(BPF_LDX | =
BPF_MEM, 9),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3899  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3900  			BPF_STMT(BPF_LDX | =
BPF_MEM, 10),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3901  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3902  			BPF_STMT(BPF_LDX | =
BPF_MEM, 11),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3903  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3904  			BPF_STMT(BPF_LDX | =
BPF_MEM, 12),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3905  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3906  			BPF_STMT(BPF_LDX | =
BPF_MEM, 13),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3907  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3908  			BPF_STMT(BPF_LDX | =
BPF_MEM, 14),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3909  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3910  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3911  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3912  			BPF_STMT(BPF_RET | =
BPF_A, 0),
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3913  		},
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3914  		CLASSIC | FLAG_NO_DA=
TA,
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3915  		{ },
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3916  		{ { 0, 0x2a5a5e5 } },
9fe13baad6b1e8 Daniel Borkmann    2014-05-29   3917  	},
d50bc157509625 Daniel Borkmann    2014-05-29   3918  	{
d50bc157509625 Daniel Borkmann    2014-05-29   3919  		"check: SKF_AD_MAX",
d50bc157509625 Daniel Borkmann    2014-05-29   3920  		.u.insns =3D {
d50bc157509625 Daniel Borkmann    2014-05-29   3921  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
d50bc157509625 Daniel Borkmann    2014-05-29   3922  				 SKF_AD_OFF + SKF_=
AD_MAX),
d50bc157509625 Daniel Borkmann    2014-05-29   3923  			BPF_STMT(BPF_RET | =
BPF_A, 0),
d50bc157509625 Daniel Borkmann    2014-05-29   3924  		},
d50bc157509625 Daniel Borkmann    2014-05-29   3925  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
d50bc157509625 Daniel Borkmann    2014-05-29   3926  		{ },
d50bc157509625 Daniel Borkmann    2014-05-29   3927  		{ },
09584b40674241 Yonghong Song      2018-02-02   3928  		.fill_helper =3D NUL=
L,
09584b40674241 Yonghong Song      2018-02-02   3929  		.expected_errcode =
=3D -EINVAL,
d50bc157509625 Daniel Borkmann    2014-05-29   3930  	},
d50bc157509625 Daniel Borkmann    2014-05-29   3931  	{	/* Passes checker b=
ut fails during runtime. */
d50bc157509625 Daniel Borkmann    2014-05-29   3932  		"LD [SKF_AD_OFF-1]",
d50bc157509625 Daniel Borkmann    2014-05-29   3933  		.u.insns =3D {
d50bc157509625 Daniel Borkmann    2014-05-29   3934  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
d50bc157509625 Daniel Borkmann    2014-05-29   3935  				 SKF_AD_OFF - 1),
d50bc157509625 Daniel Borkmann    2014-05-29   3936  			BPF_STMT(BPF_RET | =
BPF_K, 1),
d50bc157509625 Daniel Borkmann    2014-05-29   3937  		},
d50bc157509625 Daniel Borkmann    2014-05-29   3938  		CLASSIC,
d50bc157509625 Daniel Borkmann    2014-05-29   3939  		{ },
d50bc157509625 Daniel Borkmann    2014-05-29   3940  		{ { 1, 0 } },
d50bc157509625 Daniel Borkmann    2014-05-29   3941  	},
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3942  	{
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3943  		"load 64-bit immedia=
te",
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3944  		.u.insns_int =3D {
25ee7327d04bc3 Alexei Starovoitov 2014-09-19   3945  			BPF_LD_IMM64(R1, 0x=
567800001234LL),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3946  			BPF_MOV64_REG(R2, R=
1),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3947  			BPF_MOV64_REG(R3, R=
2),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3948  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3949  			BPF_ALU64_IMM(BPF_L=
SH, R3, 32),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3950  			BPF_ALU64_IMM(BPF_R=
SH, R3, 32),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3951  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3952  			BPF_JMP_IMM(BPF_JEQ=
, R2, 0x5678, 1),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3953  			BPF_EXIT_INSN(),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3954  			BPF_JMP_IMM(BPF_JEQ=
, R3, 0x1234, 1),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3955  			BPF_EXIT_INSN(),
986ccfdbd90a29 Xi Wang            2015-05-09   3956  			BPF_LD_IMM64(R0, 0x=
1ffffffffLL),
986ccfdbd90a29 Xi Wang            2015-05-09   3957  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32), /* R0 =3D 1 */
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3958  			BPF_EXIT_INSN(),
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3959  		},
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3960  		INTERNAL,
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3961  		{ },
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3962  		{ { 0, 1 } }
02ab695bb37ee9 Alexei Starovoitov 2014-09-04   3963  	},
cffc642d93f932 Michael Holzheu    2015-05-11   3964  	/* BPF_ALU | BPF_MOV =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   3965  	{
cffc642d93f932 Michael Holzheu    2015-05-11   3966  		"ALU_MOV_X: dst =3D =
2",
cffc642d93f932 Michael Holzheu    2015-05-11   3967  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   3968  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   3969  			BPF_ALU32_REG(BPF_M=
OV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   3970  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   3971  		},
cffc642d93f932 Michael Holzheu    2015-05-11   3972  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   3973  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   3974  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   3975  	},
cffc642d93f932 Michael Holzheu    2015-05-11   3976  	{
cffc642d93f932 Michael Holzheu    2015-05-11   3977  		"ALU_MOV_X: dst =3D =
4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   3978  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   3979  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   3980  			BPF_ALU32_REG(BPF_M=
OV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   3981  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   3982  		},
cffc642d93f932 Michael Holzheu    2015-05-11   3983  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   3984  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   3985  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   3986  	},
cffc642d93f932 Michael Holzheu    2015-05-11   3987  	{
cffc642d93f932 Michael Holzheu    2015-05-11   3988  		"ALU64_MOV_X: dst =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   3989  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   3990  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   3991  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   3992  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   3993  		},
cffc642d93f932 Michael Holzheu    2015-05-11   3994  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   3995  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   3996  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   3997  	},
cffc642d93f932 Michael Holzheu    2015-05-11   3998  	{
cffc642d93f932 Michael Holzheu    2015-05-11   3999  		"ALU64_MOV_X: dst =
=3D 4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   4000  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4001  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   4002  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4003  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4004  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4005  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4006  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   4007  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4008  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4009  	/* BPF_ALU | BPF_MOV =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   4010  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4011  		"ALU_MOV_K: dst =3D =
2",
cffc642d93f932 Michael Holzheu    2015-05-11   4012  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4013  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4014  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4015  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4016  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4017  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4018  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4019  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4020  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4021  		"ALU_MOV_K: dst =3D =
4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   4022  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4023  			BPF_ALU32_IMM(BPF_M=
OV, R0, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   4024  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4025  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4026  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4027  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   4028  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4029  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4030  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4031  		"ALU_MOV_K: 0x0000ff=
ffffff0000 =3D 0x00000000ffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   4032  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4033  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   4034  			BPF_LD_IMM64(R3, 0x=
00000000ffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   4035  			BPF_ALU32_IMM(BPF_M=
OV, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4036  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4037  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4038  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4039  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4040  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4041  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4042  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4043  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4044  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4045  	},
565731acfcf28f Johan Almbladh     2021-08-09   4046  	{
565731acfcf28f Johan Almbladh     2021-08-09   4047  		"ALU_MOV_K: small ne=
gative",
565731acfcf28f Johan Almbladh     2021-08-09   4048  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4049  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
565731acfcf28f Johan Almbladh     2021-08-09   4050  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4051  		},
565731acfcf28f Johan Almbladh     2021-08-09   4052  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4053  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4054  		{ { 0, -123 } }
565731acfcf28f Johan Almbladh     2021-08-09   4055  	},
565731acfcf28f Johan Almbladh     2021-08-09   4056  	{
565731acfcf28f Johan Almbladh     2021-08-09   4057  		"ALU_MOV_K: small ne=
gative zero extension",
565731acfcf28f Johan Almbladh     2021-08-09   4058  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4059  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
565731acfcf28f Johan Almbladh     2021-08-09   4060  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28f Johan Almbladh     2021-08-09   4061  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4062  		},
565731acfcf28f Johan Almbladh     2021-08-09   4063  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4064  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4065  		{ { 0, 0 } }
565731acfcf28f Johan Almbladh     2021-08-09   4066  	},
565731acfcf28f Johan Almbladh     2021-08-09   4067  	{
565731acfcf28f Johan Almbladh     2021-08-09   4068  		"ALU_MOV_K: large ne=
gative",
565731acfcf28f Johan Almbladh     2021-08-09   4069  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4070  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28f Johan Almbladh     2021-08-09   4071  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4072  		},
565731acfcf28f Johan Almbladh     2021-08-09   4073  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4074  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4075  		{ { 0, -123456789 } }
565731acfcf28f Johan Almbladh     2021-08-09   4076  	},
565731acfcf28f Johan Almbladh     2021-08-09   4077  	{
565731acfcf28f Johan Almbladh     2021-08-09   4078  		"ALU_MOV_K: large ne=
gative zero extension",
565731acfcf28f Johan Almbladh     2021-08-09   4079  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4080  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28f Johan Almbladh     2021-08-09   4081  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28f Johan Almbladh     2021-08-09   4082  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4083  		},
565731acfcf28f Johan Almbladh     2021-08-09   4084  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4085  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4086  		{ { 0, 0 } }
565731acfcf28f Johan Almbladh     2021-08-09   4087  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4088  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4089  		"ALU64_MOV_K: dst =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   4090  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4091  			BPF_ALU64_IMM(BPF_M=
OV, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4092  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4093  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4094  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4095  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4096  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4097  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4098  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4099  		"ALU64_MOV_K: dst =
=3D 2147483647",
cffc642d93f932 Michael Holzheu    2015-05-11   4100  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4101  			BPF_ALU64_IMM(BPF_M=
OV, R0, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4102  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4103  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4104  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4105  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4106  		{ { 0, 2147483647 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4107  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4108  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4109  		"ALU64_OR_K: dst =3D=
 0x0",
cffc642d93f932 Michael Holzheu    2015-05-11   4110  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4111  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   4112  			BPF_LD_IMM64(R3, 0x=
0),
cffc642d93f932 Michael Holzheu    2015-05-11   4113  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0x0),
cffc642d93f932 Michael Holzheu    2015-05-11   4114  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4115  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4116  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4117  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4118  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4119  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4120  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4121  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4122  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4123  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4124  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4125  		"ALU64_MOV_K: dst =
=3D -1",
cffc642d93f932 Michael Holzheu    2015-05-11   4126  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4127  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   4128  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   4129  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4130  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4131  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4132  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4133  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4134  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4135  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4136  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4137  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4138  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4139  	},
565731acfcf28f Johan Almbladh     2021-08-09   4140  	{
565731acfcf28f Johan Almbladh     2021-08-09   4141  		"ALU64_MOV_K: small =
negative",
565731acfcf28f Johan Almbladh     2021-08-09   4142  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4143  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123),
565731acfcf28f Johan Almbladh     2021-08-09   4144  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4145  		},
565731acfcf28f Johan Almbladh     2021-08-09   4146  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4147  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4148  		{ { 0, -123 } }
565731acfcf28f Johan Almbladh     2021-08-09   4149  	},
565731acfcf28f Johan Almbladh     2021-08-09   4150  	{
565731acfcf28f Johan Almbladh     2021-08-09   4151  		"ALU64_MOV_K: small =
negative sign extension",
565731acfcf28f Johan Almbladh     2021-08-09   4152  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4153  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123),
565731acfcf28f Johan Almbladh     2021-08-09   4154  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28f Johan Almbladh     2021-08-09   4155  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4156  		},
565731acfcf28f Johan Almbladh     2021-08-09   4157  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4158  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4159  		{ { 0, 0xffffffff } }
565731acfcf28f Johan Almbladh     2021-08-09   4160  	},
565731acfcf28f Johan Almbladh     2021-08-09   4161  	{
565731acfcf28f Johan Almbladh     2021-08-09   4162  		"ALU64_MOV_K: large =
negative",
565731acfcf28f Johan Almbladh     2021-08-09   4163  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4164  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28f Johan Almbladh     2021-08-09   4165  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4166  		},
565731acfcf28f Johan Almbladh     2021-08-09   4167  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4168  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4169  		{ { 0, -123456789 } }
565731acfcf28f Johan Almbladh     2021-08-09   4170  	},
565731acfcf28f Johan Almbladh     2021-08-09   4171  	{
565731acfcf28f Johan Almbladh     2021-08-09   4172  		"ALU64_MOV_K: large =
negative sign extension",
565731acfcf28f Johan Almbladh     2021-08-09   4173  		.u.insns_int =3D {
565731acfcf28f Johan Almbladh     2021-08-09   4174  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28f Johan Almbladh     2021-08-09   4175  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28f Johan Almbladh     2021-08-09   4176  			BPF_EXIT_INSN(),
565731acfcf28f Johan Almbladh     2021-08-09   4177  		},
565731acfcf28f Johan Almbladh     2021-08-09   4178  		INTERNAL,
565731acfcf28f Johan Almbladh     2021-08-09   4179  		{ },
565731acfcf28f Johan Almbladh     2021-08-09   4180  		{ { 0, 0xffffffff } }
565731acfcf28f Johan Almbladh     2021-08-09   4181  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4182  	/* BPF_ALU | BPF_ADD =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   4183  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4184  		"ALU_ADD_X: 1 + 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4185  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4186  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4187  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4188  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4189  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4190  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4191  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4192  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4193  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4194  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4195  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4196  		"ALU_ADD_X: 1 + 4294=
967294 =3D 4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   4197  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4198  			BPF_LD_IMM64(R0, 1),
56cbaa45dde235 Michael Holzheu    2015-05-13   4199  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4200  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4201  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4202  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4203  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4204  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   4205  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4206  	},
b64b50eac47046 Naveen N. Rao      2016-04-05   4207  	{
b64b50eac47046 Naveen N. Rao      2016-04-05   4208  		"ALU_ADD_X: 2 + 4294=
967294 =3D 0",
b64b50eac47046 Naveen N. Rao      2016-04-05   4209  		.u.insns_int =3D {
b64b50eac47046 Naveen N. Rao      2016-04-05   4210  			BPF_LD_IMM64(R0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4211  			BPF_LD_IMM64(R1, 42=
94967294U),
b64b50eac47046 Naveen N. Rao      2016-04-05   4212  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
b64b50eac47046 Naveen N. Rao      2016-04-05   4213  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4214  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046 Naveen N. Rao      2016-04-05   4215  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4216  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046 Naveen N. Rao      2016-04-05   4217  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4218  		},
b64b50eac47046 Naveen N. Rao      2016-04-05   4219  		INTERNAL,
b64b50eac47046 Naveen N. Rao      2016-04-05   4220  		{ },
b64b50eac47046 Naveen N. Rao      2016-04-05   4221  		{ { 0, 1 } },
b64b50eac47046 Naveen N. Rao      2016-04-05   4222  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4223  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4224  		"ALU64_ADD_X: 1 + 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4225  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4226  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4227  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4228  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4229  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4230  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4231  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4232  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4233  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4234  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4235  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4236  		"ALU64_ADD_X: 1 + 42=
94967294 =3D 4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   4237  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4238  			BPF_LD_IMM64(R0, 1),
56cbaa45dde235 Michael Holzheu    2015-05-13   4239  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4240  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4241  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4242  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4243  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4244  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   4245  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4246  	},
b64b50eac47046 Naveen N. Rao      2016-04-05   4247  	{
b64b50eac47046 Naveen N. Rao      2016-04-05   4248  		"ALU64_ADD_X: 2 + 42=
94967294 =3D 4294967296",
b64b50eac47046 Naveen N. Rao      2016-04-05   4249  		.u.insns_int =3D {
b64b50eac47046 Naveen N. Rao      2016-04-05   4250  			BPF_LD_IMM64(R0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4251  			BPF_LD_IMM64(R1, 42=
94967294U),
b64b50eac47046 Naveen N. Rao      2016-04-05   4252  			BPF_LD_IMM64(R2, 42=
94967296ULL),
b64b50eac47046 Naveen N. Rao      2016-04-05   4253  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
b64b50eac47046 Naveen N. Rao      2016-04-05   4254  			BPF_JMP_REG(BPF_JEQ=
, R0, R2, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4255  			BPF_MOV32_IMM(R0, 0=
),
b64b50eac47046 Naveen N. Rao      2016-04-05   4256  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4257  			BPF_MOV32_IMM(R0, 1=
),
b64b50eac47046 Naveen N. Rao      2016-04-05   4258  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4259  		},
b64b50eac47046 Naveen N. Rao      2016-04-05   4260  		INTERNAL,
b64b50eac47046 Naveen N. Rao      2016-04-05   4261  		{ },
b64b50eac47046 Naveen N. Rao      2016-04-05   4262  		{ { 0, 1 } },
b64b50eac47046 Naveen N. Rao      2016-04-05   4263  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4264  	/* BPF_ALU | BPF_ADD =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   4265  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4266  		"ALU_ADD_K: 1 + 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4267  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4268  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4269  			BPF_ALU32_IMM(BPF_A=
DD, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4270  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4271  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4272  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4273  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4274  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4275  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4276  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4277  		"ALU_ADD_K: 3 + 0 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4278  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4279  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4280  			BPF_ALU32_IMM(BPF_A=
DD, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   4281  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4282  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4283  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4284  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4285  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4286  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4287  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4288  		"ALU_ADD_K: 1 + 4294=
967294 =3D 4294967295",
cffc642d93f932 Michael Holzheu    2015-05-11   4289  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4290  			BPF_LD_IMM64(R0, 1),
56cbaa45dde235 Michael Holzheu    2015-05-13   4291  			BPF_ALU32_IMM(BPF_A=
DD, R0, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4292  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4293  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4294  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4295  		{ },
56cbaa45dde235 Michael Holzheu    2015-05-13   4296  		{ { 0, 4294967295U }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4297  	},
b64b50eac47046 Naveen N. Rao      2016-04-05   4298  	{
b64b50eac47046 Naveen N. Rao      2016-04-05   4299  		"ALU_ADD_K: 42949672=
94 + 2 =3D 0",
b64b50eac47046 Naveen N. Rao      2016-04-05   4300  		.u.insns_int =3D {
b64b50eac47046 Naveen N. Rao      2016-04-05   4301  			BPF_LD_IMM64(R0, 42=
94967294U),
b64b50eac47046 Naveen N. Rao      2016-04-05   4302  			BPF_ALU32_IMM(BPF_A=
DD, R0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4303  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4304  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046 Naveen N. Rao      2016-04-05   4305  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4306  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046 Naveen N. Rao      2016-04-05   4307  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4308  		},
b64b50eac47046 Naveen N. Rao      2016-04-05   4309  		INTERNAL,
b64b50eac47046 Naveen N. Rao      2016-04-05   4310  		{ },
b64b50eac47046 Naveen N. Rao      2016-04-05   4311  		{ { 0, 1 } },
b64b50eac47046 Naveen N. Rao      2016-04-05   4312  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4313  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4314  		"ALU_ADD_K: 0 + (-1)=
 =3D 0x00000000ffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   4315  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4316  			BPF_LD_IMM64(R2, 0x=
0),
cffc642d93f932 Michael Holzheu    2015-05-11   4317  			BPF_LD_IMM64(R3, 0x=
00000000ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4318  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4319  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4320  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4321  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4322  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4323  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4324  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4325  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4326  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4327  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4328  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4329  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4330  		"ALU_ADD_K: 0 + 0xff=
ff =3D 0xffff",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4331  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4332  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4333  			BPF_LD_IMM64(R3, 0x=
ffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4334  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0xffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4335  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4336  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4337  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4338  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4339  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4340  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4341  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4342  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4343  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4344  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4345  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4346  		"ALU_ADD_K: 0 + 0x7f=
ffffff =3D 0x7fffffff",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4347  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4348  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4349  			BPF_LD_IMM64(R3, 0x=
7fffffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4350  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x7fffffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4351  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4352  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4353  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4354  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4355  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4356  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4357  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4358  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4359  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4360  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4361  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4362  		"ALU_ADD_K: 0 + 0x80=
000000 =3D 0x80000000",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4363  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4364  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4365  			BPF_LD_IMM64(R3, 0x=
80000000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4366  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x80000000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4367  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4368  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4369  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4370  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4371  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4372  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4373  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4374  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4375  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4376  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4377  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4378  		"ALU_ADD_K: 0 + 0x80=
008000 =3D 0x80008000",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4379  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4380  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4381  			BPF_LD_IMM64(R3, 0x=
80008000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4382  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x80008000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4383  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4384  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4385  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4386  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4387  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4388  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4389  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4390  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4391  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4392  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4393  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4394  		"ALU64_ADD_K: 1 + 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4395  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4396  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4397  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4398  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4399  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4400  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4401  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4402  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4403  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4404  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4405  		"ALU64_ADD_K: 3 + 0 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4406  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4407  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4408  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   4409  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4410  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4411  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4412  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4413  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4414  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4415  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4416  		"ALU64_ADD_K: 1 + 21=
47483646 =3D 2147483647",
cffc642d93f932 Michael Holzheu    2015-05-11   4417  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4418  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4419  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2147483646),
cffc642d93f932 Michael Holzheu    2015-05-11   4420  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4421  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4422  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4423  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4424  		{ { 0, 2147483647 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4425  	},
b64b50eac47046 Naveen N. Rao      2016-04-05   4426  	{
b64b50eac47046 Naveen N. Rao      2016-04-05   4427  		"ALU64_ADD_K: 429496=
7294 + 2 =3D 4294967296",
b64b50eac47046 Naveen N. Rao      2016-04-05   4428  		.u.insns_int =3D {
b64b50eac47046 Naveen N. Rao      2016-04-05   4429  			BPF_LD_IMM64(R0, 42=
94967294U),
b64b50eac47046 Naveen N. Rao      2016-04-05   4430  			BPF_LD_IMM64(R1, 42=
94967296ULL),
b64b50eac47046 Naveen N. Rao      2016-04-05   4431  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4432  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
b64b50eac47046 Naveen N. Rao      2016-04-05   4433  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046 Naveen N. Rao      2016-04-05   4434  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4435  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046 Naveen N. Rao      2016-04-05   4436  			BPF_EXIT_INSN(),
b64b50eac47046 Naveen N. Rao      2016-04-05   4437  		},
b64b50eac47046 Naveen N. Rao      2016-04-05   4438  		INTERNAL,
b64b50eac47046 Naveen N. Rao      2016-04-05   4439  		{ },
b64b50eac47046 Naveen N. Rao      2016-04-05   4440  		{ { 0, 1 } },
b64b50eac47046 Naveen N. Rao      2016-04-05   4441  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4442  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4443  		"ALU64_ADD_K: 214748=
3646 + -2147483647 =3D -1",
cffc642d93f932 Michael Holzheu    2015-05-11   4444  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4445  			BPF_LD_IMM64(R0, 21=
47483646),
cffc642d93f932 Michael Holzheu    2015-05-11   4446  			BPF_ALU64_IMM(BPF_A=
DD, R0, -2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4447  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4448  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4449  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4450  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4451  		{ { 0, -1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4452  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4453  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4454  		"ALU64_ADD_K: 1 + 0 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4455  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4456  			BPF_LD_IMM64(R2, 0x=
1),
cffc642d93f932 Michael Holzheu    2015-05-11   4457  			BPF_LD_IMM64(R3, 0x=
1),
cffc642d93f932 Michael Holzheu    2015-05-11   4458  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x0),
cffc642d93f932 Michael Holzheu    2015-05-11   4459  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4460  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4461  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4462  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4463  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4464  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4465  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4466  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4467  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4468  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4469  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4470  		"ALU64_ADD_K: 0 + (-=
1) =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   4471  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4472  			BPF_LD_IMM64(R2, 0x=
0),
56cbaa45dde235 Michael Holzheu    2015-05-13   4473  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   4474  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4475  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4476  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4477  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4478  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4479  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4480  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4481  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4482  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4483  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4484  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4485  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4486  		"ALU64_ADD_K: 0 + 0x=
ffff =3D 0xffff",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4487  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4488  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4489  			BPF_LD_IMM64(R3, 0x=
ffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4490  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0xffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4491  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4492  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4493  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4494  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4495  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4496  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4497  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4498  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4499  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4500  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4501  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4502  		"ALU64_ADD_K: 0 + 0x=
7fffffff =3D 0x7fffffff",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4503  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4504  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4505  			BPF_LD_IMM64(R3, 0x=
7fffffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4506  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x7fffffff),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4507  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4508  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4509  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4510  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4511  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4512  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4513  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4514  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4515  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4516  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4517  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4518  		"ALU64_ADD_K: 0 + 0x=
80000000 =3D 0xffffffff80000000",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4519  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4520  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4521  			BPF_LD_IMM64(R3, 0x=
ffffffff80000000LL),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4522  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x80000000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4523  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4524  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4525  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4526  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4527  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4528  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4529  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4530  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4531  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4532  	},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4533  	{
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4534  		"ALU_ADD_K: 0 + 0x80=
008000 =3D 0xffffffff80008000",
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4535  		.u.insns_int =3D {
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4536  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4537  			BPF_LD_IMM64(R3, 0x=
ffffffff80008000LL),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4538  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x80008000),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4539  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4540  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4541  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4542  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4543  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4544  		},
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4545  		INTERNAL,
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4546  		{ },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4547  		{ { 0, 0x1 } },
9c94f6c8e0d3d4 Naveen N. Rao      2016-04-05   4548  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4549  	/* BPF_ALU | BPF_SUB =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   4550  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4551  		"ALU_SUB_X: 3 - 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   4552  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4553  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4554  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4555  			BPF_ALU32_REG(BPF_S=
UB, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4556  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4557  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4558  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4559  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4560  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4561  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4562  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4563  		"ALU_SUB_X: 42949672=
95 - 4294967294 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4564  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4565  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4566  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4567  			BPF_ALU32_REG(BPF_S=
UB, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4568  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4569  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4570  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4571  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4572  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4573  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4574  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4575  		"ALU64_SUB_X: 3 - 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   4576  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4577  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4578  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4579  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4580  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4581  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4582  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4583  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4584  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4585  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4586  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4587  		"ALU64_SUB_X: 429496=
7295 - 4294967294 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4588  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4589  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4590  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4591  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4592  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4593  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4594  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4595  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4596  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4597  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4598  	/* BPF_ALU | BPF_SUB =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   4599  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4600  		"ALU_SUB_K: 3 - 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   4601  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4602  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4603  			BPF_ALU32_IMM(BPF_S=
UB, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4604  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4605  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4606  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4607  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4608  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4609  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4610  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4611  		"ALU_SUB_K: 3 - 0 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4612  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4613  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4614  			BPF_ALU32_IMM(BPF_S=
UB, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   4615  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4616  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4617  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4618  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4619  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4620  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4621  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4622  		"ALU_SUB_K: 42949672=
95 - 4294967294 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4623  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4624  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4625  			BPF_ALU32_IMM(BPF_S=
UB, R0, 4294967294U),
cffc642d93f932 Michael Holzheu    2015-05-11   4626  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4627  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4628  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4629  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4630  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4631  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4632  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4633  		"ALU64_SUB_K: 3 - 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   4634  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4635  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4636  			BPF_ALU64_IMM(BPF_S=
UB, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4637  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4638  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4639  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4640  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4641  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4642  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4643  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4644  		"ALU64_SUB_K: 3 - 0 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4645  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4646  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4647  			BPF_ALU64_IMM(BPF_S=
UB, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   4648  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4649  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4650  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4651  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4652  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4653  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4654  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4655  		"ALU64_SUB_K: 429496=
7294 - 4294967295 =3D -1",
cffc642d93f932 Michael Holzheu    2015-05-11   4656  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4657  			BPF_LD_IMM64(R0, 42=
94967294U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4658  			BPF_ALU64_IMM(BPF_S=
UB, R0, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   4659  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4660  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4661  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4662  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4663  		{ { 0, -1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4664  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4665  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4666  		"ALU64_ADD_K: 214748=
3646 - 2147483647 =3D -1",
cffc642d93f932 Michael Holzheu    2015-05-11   4667  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4668  			BPF_LD_IMM64(R0, 21=
47483646),
cffc642d93f932 Michael Holzheu    2015-05-11   4669  			BPF_ALU64_IMM(BPF_S=
UB, R0, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4670  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4671  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4672  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4673  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4674  		{ { 0, -1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4675  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4676  	/* BPF_ALU | BPF_MUL =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   4677  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4678  		"ALU_MUL_X: 2 * 3 =
=3D 6",
cffc642d93f932 Michael Holzheu    2015-05-11   4679  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4680  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4681  			BPF_ALU32_IMM(BPF_M=
OV, R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4682  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4683  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4684  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4685  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4686  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4687  		{ { 0, 6 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4688  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4689  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4690  		"ALU_MUL_X: 2 * 0x7F=
FFFFF8 =3D 0xFFFFFFF0",
cffc642d93f932 Michael Holzheu    2015-05-11   4691  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4692  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4693  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0x7FFFFFF8),
cffc642d93f932 Michael Holzheu    2015-05-11   4694  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4695  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4696  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4697  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4698  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4699  		{ { 0, 0xFFFFFFF0 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4700  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4701  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4702  		"ALU_MUL_X: -1 * -1 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4703  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4704  			BPF_LD_IMM64(R0, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4705  			BPF_ALU32_IMM(BPF_M=
OV, R1, -1),
cffc642d93f932 Michael Holzheu    2015-05-11   4706  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4707  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4708  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4709  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4710  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4711  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4712  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4713  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4714  		"ALU64_MUL_X: 2 * 3 =
=3D 6",
cffc642d93f932 Michael Holzheu    2015-05-11   4715  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4716  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4717  			BPF_ALU32_IMM(BPF_M=
OV, R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4718  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4719  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4720  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4721  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4722  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4723  		{ { 0, 6 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4724  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4725  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4726  		"ALU64_MUL_X: 1 * 21=
47483647 =3D 2147483647",
cffc642d93f932 Michael Holzheu    2015-05-11   4727  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4728  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4729  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4730  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4731  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4732  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4733  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4734  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4735  		{ { 0, 2147483647 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4736  	},
faa576253d5fe7 Johan Almbladh     2021-08-09   4737  	{
faa576253d5fe7 Johan Almbladh     2021-08-09   4738  		"ALU64_MUL_X: 64x64 =
multiply, low word",
faa576253d5fe7 Johan Almbladh     2021-08-09   4739  		.u.insns_int =3D {
faa576253d5fe7 Johan Almbladh     2021-08-09   4740  			BPF_LD_IMM64(R0, 0x=
0fedcba987654321LL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4741  			BPF_LD_IMM64(R1, 0x=
123456789abcdef0LL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4742  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
faa576253d5fe7 Johan Almbladh     2021-08-09   4743  			BPF_EXIT_INSN(),
faa576253d5fe7 Johan Almbladh     2021-08-09   4744  		},
faa576253d5fe7 Johan Almbladh     2021-08-09   4745  		INTERNAL,
faa576253d5fe7 Johan Almbladh     2021-08-09   4746  		{ },
faa576253d5fe7 Johan Almbladh     2021-08-09   4747  		{ { 0, 0xe5618cf0 } }
faa576253d5fe7 Johan Almbladh     2021-08-09   4748  	},
faa576253d5fe7 Johan Almbladh     2021-08-09   4749  	{
faa576253d5fe7 Johan Almbladh     2021-08-09   4750  		"ALU64_MUL_X: 64x64 =
multiply, high word",
faa576253d5fe7 Johan Almbladh     2021-08-09   4751  		.u.insns_int =3D {
faa576253d5fe7 Johan Almbladh     2021-08-09   4752  			BPF_LD_IMM64(R0, 0x=
0fedcba987654321LL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4753  			BPF_LD_IMM64(R1, 0x=
123456789abcdef0LL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4754  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
faa576253d5fe7 Johan Almbladh     2021-08-09   4755  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
faa576253d5fe7 Johan Almbladh     2021-08-09   4756  			BPF_EXIT_INSN(),
faa576253d5fe7 Johan Almbladh     2021-08-09   4757  		},
faa576253d5fe7 Johan Almbladh     2021-08-09   4758  		INTERNAL,
faa576253d5fe7 Johan Almbladh     2021-08-09   4759  		{ },
faa576253d5fe7 Johan Almbladh     2021-08-09   4760  		{ { 0, 0x2236d88f } }
faa576253d5fe7 Johan Almbladh     2021-08-09   4761  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4762  	/* BPF_ALU | BPF_MUL =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   4763  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4764  		"ALU_MUL_K: 2 * 3 =
=3D 6",
cffc642d93f932 Michael Holzheu    2015-05-11   4765  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4766  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4767  			BPF_ALU32_IMM(BPF_M=
UL, R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4768  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4769  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4770  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4771  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4772  		{ { 0, 6 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4773  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4774  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4775  		"ALU_MUL_K: 3 * 1 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4776  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4777  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4778  			BPF_ALU32_IMM(BPF_M=
UL, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4779  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4780  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4781  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4782  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4783  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4784  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4785  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4786  		"ALU_MUL_K: 2 * 0x7F=
FFFFF8 =3D 0xFFFFFFF0",
cffc642d93f932 Michael Holzheu    2015-05-11   4787  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4788  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4789  			BPF_ALU32_IMM(BPF_M=
UL, R0, 0x7FFFFFF8),
cffc642d93f932 Michael Holzheu    2015-05-11   4790  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4791  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4792  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4793  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4794  		{ { 0, 0xFFFFFFF0 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4795  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4796  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4797  		"ALU_MUL_K: 1 * (-1)=
 =3D 0x00000000ffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   4798  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4799  			BPF_LD_IMM64(R2, 0x=
1),
cffc642d93f932 Michael Holzheu    2015-05-11   4800  			BPF_LD_IMM64(R3, 0x=
00000000ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4801  			BPF_ALU32_IMM(BPF_M=
UL, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4802  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4803  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4804  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4805  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4806  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4807  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4808  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4809  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4810  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4811  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4812  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4813  		"ALU64_MUL_K: 2 * 3 =
=3D 6",
cffc642d93f932 Michael Holzheu    2015-05-11   4814  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4815  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4816  			BPF_ALU64_IMM(BPF_M=
UL, R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4817  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4818  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4819  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4820  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4821  		{ { 0, 6 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4822  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4823  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4824  		"ALU64_MUL_K: 3 * 1 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4825  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4826  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4827  			BPF_ALU64_IMM(BPF_M=
UL, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4828  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4829  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4830  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4831  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4832  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4833  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4834  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4835  		"ALU64_MUL_K: 1 * 21=
47483647 =3D 2147483647",
cffc642d93f932 Michael Holzheu    2015-05-11   4836  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4837  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4838  			BPF_ALU64_IMM(BPF_M=
UL, R0, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4839  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4840  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4841  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4842  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4843  		{ { 0, 2147483647 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   4844  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4845  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4846  		"ALU64_MUL_K: 1 * -2=
147483647 =3D -2147483647",
cffc642d93f932 Michael Holzheu    2015-05-11   4847  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4848  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4849  			BPF_ALU64_IMM(BPF_M=
UL, R0, -2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4850  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4851  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4852  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4853  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4854  		{ { 0, -2147483647 }=
 },
cffc642d93f932 Michael Holzheu    2015-05-11   4855  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4856  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4857  		"ALU64_MUL_K: 1 * (-=
1) =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   4858  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4859  			BPF_LD_IMM64(R2, 0x=
1),
56cbaa45dde235 Michael Holzheu    2015-05-13   4860  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   4861  			BPF_ALU64_IMM(BPF_M=
UL, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   4862  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4863  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4864  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4865  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4866  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4867  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4868  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4869  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4870  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4871  	},
faa576253d5fe7 Johan Almbladh     2021-08-09   4872  	{
faa576253d5fe7 Johan Almbladh     2021-08-09   4873  		"ALU64_MUL_K: 64x32 =
multiply, low word",
faa576253d5fe7 Johan Almbladh     2021-08-09   4874  		.u.insns_int =3D {
faa576253d5fe7 Johan Almbladh     2021-08-09   4875  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4876  			BPF_ALU64_IMM(BPF_M=
UL, R0, 0x12345678),
faa576253d5fe7 Johan Almbladh     2021-08-09   4877  			BPF_EXIT_INSN(),
faa576253d5fe7 Johan Almbladh     2021-08-09   4878  		},
faa576253d5fe7 Johan Almbladh     2021-08-09   4879  		INTERNAL,
faa576253d5fe7 Johan Almbladh     2021-08-09   4880  		{ },
faa576253d5fe7 Johan Almbladh     2021-08-09   4881  		{ { 0, 0xe242d208 } }
faa576253d5fe7 Johan Almbladh     2021-08-09   4882  	},
faa576253d5fe7 Johan Almbladh     2021-08-09   4883  	{
faa576253d5fe7 Johan Almbladh     2021-08-09   4884  		"ALU64_MUL_K: 64x32 =
multiply, high word",
faa576253d5fe7 Johan Almbladh     2021-08-09   4885  		.u.insns_int =3D {
faa576253d5fe7 Johan Almbladh     2021-08-09   4886  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
faa576253d5fe7 Johan Almbladh     2021-08-09   4887  			BPF_ALU64_IMM(BPF_M=
UL, R0, 0x12345678),
faa576253d5fe7 Johan Almbladh     2021-08-09   4888  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
faa576253d5fe7 Johan Almbladh     2021-08-09   4889  			BPF_EXIT_INSN(),
faa576253d5fe7 Johan Almbladh     2021-08-09   4890  		},
faa576253d5fe7 Johan Almbladh     2021-08-09   4891  		INTERNAL,
faa576253d5fe7 Johan Almbladh     2021-08-09   4892  		{ },
faa576253d5fe7 Johan Almbladh     2021-08-09   4893  		{ { 0, 0xc28f5c28 } }
faa576253d5fe7 Johan Almbladh     2021-08-09   4894  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4895  	/* BPF_ALU | BPF_DIV =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   4896  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4897  		"ALU_DIV_X: 6 / 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4898  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4899  			BPF_LD_IMM64(R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   4900  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4901  			BPF_ALU32_REG(BPF_D=
IV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4902  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4903  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4904  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4905  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4906  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4907  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4908  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4909  		"ALU_DIV_X: 42949672=
95 / 4294967295 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4910  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4911  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4912  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   4913  			BPF_ALU32_REG(BPF_D=
IV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4914  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4915  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4916  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4917  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4918  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4919  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4920  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4921  		"ALU64_DIV_X: 6 / 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4922  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4923  			BPF_LD_IMM64(R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   4924  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4925  			BPF_ALU64_REG(BPF_D=
IV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4926  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4927  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4928  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4929  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4930  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4931  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4932  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4933  		"ALU64_DIV_X: 214748=
3647 / 2147483647 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4934  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4935  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4936  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   4937  			BPF_ALU64_REG(BPF_D=
IV, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   4938  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4939  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4940  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4941  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4942  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4943  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4944  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4945  		"ALU64_DIV_X: 0xffff=
ffffffffffff / (-1) =3D 0x0000000000000001",
cffc642d93f932 Michael Holzheu    2015-05-11   4946  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4947  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde235 Michael Holzheu    2015-05-13   4948  			BPF_LD_IMM64(R4, 0x=
ffffffffffffffffLL),
56cbaa45dde235 Michael Holzheu    2015-05-13   4949  			BPF_LD_IMM64(R3, 0x=
0000000000000001LL),
cffc642d93f932 Michael Holzheu    2015-05-11   4950  			BPF_ALU64_REG(BPF_D=
IV, R2, R4),
cffc642d93f932 Michael Holzheu    2015-05-11   4951  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4952  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4953  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4954  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   4955  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4956  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4957  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4958  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4959  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4960  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4961  	/* BPF_ALU | BPF_DIV =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   4962  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4963  		"ALU_DIV_K: 6 / 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4964  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4965  			BPF_LD_IMM64(R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   4966  			BPF_ALU32_IMM(BPF_D=
IV, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   4967  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4968  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4969  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4970  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4971  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4972  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4973  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4974  		"ALU_DIV_K: 3 / 1 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   4975  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   4976  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   4977  			BPF_ALU32_IMM(BPF_D=
IV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   4978  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4979  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4980  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4981  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4982  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4983  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4984  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4985  		"ALU_DIV_K: 42949672=
95 / 4294967295 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   4986  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4987  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   4988  			BPF_ALU32_IMM(BPF_D=
IV, R0, 4294967295U),
cffc642d93f932 Michael Holzheu    2015-05-11   4989  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   4990  		},
cffc642d93f932 Michael Holzheu    2015-05-11   4991  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   4992  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   4993  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   4994  	},
cffc642d93f932 Michael Holzheu    2015-05-11   4995  	{
cffc642d93f932 Michael Holzheu    2015-05-11   4996  		"ALU_DIV_K: 0xffffff=
ffffffffff / (-1) =3D 0x1",
cffc642d93f932 Michael Holzheu    2015-05-11   4997  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   4998  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   4999  			BPF_LD_IMM64(R3, 0x=
1UL),
cffc642d93f932 Michael Holzheu    2015-05-11   5000  			BPF_ALU32_IMM(BPF_D=
IV, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5001  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5002  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5003  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5004  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5005  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5006  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5007  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5008  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5009  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5010  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5011  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5012  		"ALU64_DIV_K: 6 / 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5013  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5014  			BPF_LD_IMM64(R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   5015  			BPF_ALU64_IMM(BPF_D=
IV, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5016  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5017  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5018  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5019  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5020  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5021  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5022  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5023  		"ALU64_DIV_K: 3 / 1 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5024  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5025  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5026  			BPF_ALU64_IMM(BPF_D=
IV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5027  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5028  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5029  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5030  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5031  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5032  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5033  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5034  		"ALU64_DIV_K: 214748=
3647 / 2147483647 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   5035  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5036  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f932 Michael Holzheu    2015-05-11   5037  			BPF_ALU64_IMM(BPF_D=
IV, R0, 2147483647),
cffc642d93f932 Michael Holzheu    2015-05-11   5038  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5039  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5040  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5041  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5042  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5043  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5044  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5045  		"ALU64_DIV_K: 0xffff=
ffffffffffff / (-1) =3D 0x0000000000000001",
cffc642d93f932 Michael Holzheu    2015-05-11   5046  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5047  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5048  			BPF_LD_IMM64(R3, 0x=
0000000000000001LL),
cffc642d93f932 Michael Holzheu    2015-05-11   5049  			BPF_ALU64_IMM(BPF_D=
IV, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5050  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5051  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5052  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5053  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5054  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5055  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5056  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5057  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5058  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5059  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5060  	/* BPF_ALU | BPF_MOD =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   5061  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5062  		"ALU_MOD_X: 3 % 2 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   5063  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5064  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5065  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5066  			BPF_ALU32_REG(BPF_M=
OD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5067  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5068  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5069  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5070  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5071  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5072  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5073  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5074  		"ALU_MOD_X: 42949672=
95 % 4294967293 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5075  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5076  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   5077  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967293U),
cffc642d93f932 Michael Holzheu    2015-05-11   5078  			BPF_ALU32_REG(BPF_M=
OD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5079  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5080  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5081  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5082  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5083  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5084  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5085  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5086  		"ALU64_MOD_X: 3 % 2 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   5087  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5088  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5089  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5090  			BPF_ALU64_REG(BPF_M=
OD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5091  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5092  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5093  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5094  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5095  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5096  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5097  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5098  		"ALU64_MOD_X: 214748=
3647 % 2147483645 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5099  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5100  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f932 Michael Holzheu    2015-05-11   5101  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483645),
cffc642d93f932 Michael Holzheu    2015-05-11   5102  			BPF_ALU64_REG(BPF_M=
OD, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5103  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5104  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5105  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5106  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5107  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5108  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5109  	/* BPF_ALU | BPF_MOD =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   5110  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5111  		"ALU_MOD_K: 3 % 2 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   5112  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5113  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5114  			BPF_ALU32_IMM(BPF_M=
OD, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5115  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5116  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5117  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5118  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5119  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5120  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5121  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5122  		"ALU_MOD_K: 3 % 1 =
=3D 0",
cffc642d93f932 Michael Holzheu    2015-05-11   5123  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5124  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5125  			BPF_ALU32_IMM(BPF_M=
OD, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5126  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5127  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5128  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5129  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5130  		{ { 0, 0 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5131  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5132  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5133  		"ALU_MOD_K: 42949672=
95 % 4294967293 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5134  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5135  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde235 Michael Holzheu    2015-05-13   5136  			BPF_ALU32_IMM(BPF_M=
OD, R0, 4294967293U),
cffc642d93f932 Michael Holzheu    2015-05-11   5137  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5138  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5139  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5140  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5141  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5142  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5143  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5144  		"ALU64_MOD_K: 3 % 2 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   5145  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5146  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5147  			BPF_ALU64_IMM(BPF_M=
OD, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5148  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5149  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5150  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5151  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5152  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5153  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5154  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5155  		"ALU64_MOD_K: 3 % 1 =
=3D 0",
cffc642d93f932 Michael Holzheu    2015-05-11   5156  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5157  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5158  			BPF_ALU64_IMM(BPF_M=
OD, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5159  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5160  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5161  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5162  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5163  		{ { 0, 0 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5164  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5165  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5166  		"ALU64_MOD_K: 214748=
3647 % 2147483645 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5167  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5168  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f932 Michael Holzheu    2015-05-11   5169  			BPF_ALU64_IMM(BPF_M=
OD, R0, 2147483645),
cffc642d93f932 Michael Holzheu    2015-05-11   5170  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5171  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5172  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5173  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5174  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5175  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5176  	/* BPF_ALU | BPF_AND =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   5177  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5178  		"ALU_AND_X: 3 & 2 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5179  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5180  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5181  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5182  			BPF_ALU32_REG(BPF_A=
ND, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5183  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5184  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5185  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5186  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5187  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5188  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5189  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5190  		"ALU_AND_X: 0xffffff=
ff & 0xffffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5191  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5192  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5193  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5194  			BPF_ALU32_REG(BPF_A=
ND, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5195  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5196  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5197  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5198  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5199  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5200  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5201  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5202  		"ALU64_AND_X: 3 & 2 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5203  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5204  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5205  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5206  			BPF_ALU64_REG(BPF_A=
ND, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5207  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5208  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5209  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5210  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5211  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5212  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5213  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5214  		"ALU64_AND_X: 0xffff=
ffff & 0xffffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5215  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5216  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5217  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5218  			BPF_ALU64_REG(BPF_A=
ND, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5219  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5220  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5221  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5222  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5223  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5224  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5225  	/* BPF_ALU | BPF_AND =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   5226  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5227  		"ALU_AND_K: 3 & 2 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5228  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5229  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5230  			BPF_ALU32_IMM(BPF_A=
ND, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5231  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5232  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5233  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5234  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5235  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5236  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5237  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5238  		"ALU_AND_K: 0xffffff=
ff & 0xffffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5239  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5240  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5241  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5242  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5243  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5244  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5245  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5246  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5247  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5248  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5249  		"ALU_AND_K: Small im=
mediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5250  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5251  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5252  			BPF_ALU32_IMM(BPF_A=
ND, R0, 15),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5253  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5254  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5255  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5256  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5257  		{ { 0, 4 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5258  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5259  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5260  		"ALU_AND_K: Large im=
mediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5261  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5262  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xf1f2f3f4),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5263  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xafbfcfdf),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5264  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5265  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5266  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5267  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5268  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5269  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5270  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5271  		"ALU_AND_K: Zero ext=
ension",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5272  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5273  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5274  			BPF_LD_IMM64(R1, 0x=
0000000080a0c0e0LL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5275  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5276  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5277  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5278  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5279  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5280  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5281  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5282  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5283  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5284  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5285  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5286  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5287  		"ALU64_AND_K: 3 & 2 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5288  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5289  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   5290  			BPF_ALU64_IMM(BPF_A=
ND, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5291  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5292  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5293  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5294  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5295  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5296  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5297  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5298  		"ALU64_AND_K: 0xffff=
ffff & 0xffffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5299  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5300  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5301  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5302  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5303  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5304  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5305  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5306  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5307  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5308  	{
e92c813bf11932 Johan Almbladh     2021-08-09   5309  		"ALU64_AND_K: 0x0000=
ffffffff0000 & 0x0 =3D 0x0000000000000000",
cffc642d93f932 Michael Holzheu    2015-05-11   5310  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5311  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5312  			BPF_LD_IMM64(R3, 0x=
0000000000000000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   5313  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0x0),
cffc642d93f932 Michael Holzheu    2015-05-11   5314  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5315  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5316  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5317  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5318  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5319  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5320  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5321  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5322  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5323  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5324  	{
e92c813bf11932 Johan Almbladh     2021-08-09   5325  		"ALU64_AND_K: 0x0000=
ffffffff0000 & -1 =3D 0x0000ffffffff0000",
cffc642d93f932 Michael Holzheu    2015-05-11   5326  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5327  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5328  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   5329  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5330  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5331  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5332  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5333  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5334  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5335  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5336  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5337  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5338  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5339  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5340  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5341  		"ALU64_AND_K: 0xffff=
ffffffffffff & -1 =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5342  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5343  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5344  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   5345  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5346  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5347  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5348  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5349  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5350  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5351  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5352  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5353  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5354  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5355  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5356  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5357  		"ALU64_AND_K: Sign e=
xtension 1",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5358  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5359  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5360  			BPF_LD_IMM64(R1, 0x=
00000000090b0d0fLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5361  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0x0f0f0f0f),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5362  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5363  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5364  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5365  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5366  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5367  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5368  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5369  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5370  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5371  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5372  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5373  		"ALU64_AND_K: Sign e=
xtension 2",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5374  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5375  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5376  			BPF_LD_IMM64(R1, 0x=
0123456780a0c0e0LL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5377  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5378  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5379  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5380  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5381  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5382  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5383  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5384  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5385  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5386  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5387  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5388  	/* BPF_ALU | BPF_OR |=
 BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   5389  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5390  		"ALU_OR_X: 1 | 2 =3D=
 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5391  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5392  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5393  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5394  			BPF_ALU32_REG(BPF_O=
R, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5395  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5396  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5397  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5398  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5399  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5400  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5401  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5402  		"ALU_OR_X: 0x0 | 0xf=
fffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5403  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5404  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   5405  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5406  			BPF_ALU32_REG(BPF_O=
R, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5407  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5408  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5409  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5410  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5411  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5412  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5413  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5414  		"ALU64_OR_X: 1 | 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5415  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5416  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5417  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5418  			BPF_ALU64_REG(BPF_O=
R, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5419  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5420  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5421  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5422  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5423  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5424  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5425  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5426  		"ALU64_OR_X: 0 | 0xf=
fffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5427  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5428  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   5429  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5430  			BPF_ALU64_REG(BPF_O=
R, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5431  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5432  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5433  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5434  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5435  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5436  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5437  	/* BPF_ALU | BPF_OR |=
 BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   5438  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5439  		"ALU_OR_K: 1 | 2 =3D=
 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5440  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5441  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5442  			BPF_ALU32_IMM(BPF_O=
R, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5443  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5444  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5445  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5446  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5447  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5448  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5449  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5450  		"ALU_OR_K: 0 & 0xfff=
fffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5451  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5452  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   5453  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5454  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5455  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5456  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5457  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5458  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5459  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5460  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5461  		"ALU_OR_K: Small imm=
ediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5462  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5463  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5464  			BPF_ALU32_IMM(BPF_O=
R, R0, 1),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5465  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5466  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5467  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5468  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5469  		{ { 0, 0x01020305 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5470  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5471  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5472  		"ALU_OR_K: Large imm=
ediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5473  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5474  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5475  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xa0b0c0d0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5476  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5477  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5478  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5479  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5480  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5481  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5482  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5483  		"ALU_OR_K: Zero exte=
nsion",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5484  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5485  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5486  			BPF_LD_IMM64(R1, 0x=
00000000f9fbfdffLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5487  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5488  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5489  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5490  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5491  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5492  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5493  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5494  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5495  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5496  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5497  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5498  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5499  		"ALU64_OR_K: 1 | 2 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5500  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5501  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5502  			BPF_ALU64_IMM(BPF_O=
R, R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5503  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5504  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5505  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5506  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5507  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5508  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5509  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5510  		"ALU64_OR_K: 0 & 0xf=
fffffff =3D 0xffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5511  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5512  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   5513  			BPF_ALU64_IMM(BPF_O=
R, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5514  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5515  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5516  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5517  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5518  		{ { 0, 0xffffffff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5519  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5520  	{
e92c813bf11932 Johan Almbladh     2021-08-09   5521  		"ALU64_OR_K: 0x0000f=
fffffff0000 | 0x0 =3D 0x0000ffffffff0000",
cffc642d93f932 Michael Holzheu    2015-05-11   5522  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5523  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5524  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   5525  			BPF_ALU64_IMM(BPF_O=
R, R2, 0x0),
cffc642d93f932 Michael Holzheu    2015-05-11   5526  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5527  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5528  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5529  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5530  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5531  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5532  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5533  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5534  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5535  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5536  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5537  		"ALU64_OR_K: 0x0000f=
fffffff0000 | -1 =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5538  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5539  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5540  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   5541  			BPF_ALU64_IMM(BPF_O=
R, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5542  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5543  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5544  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5545  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5546  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5547  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5548  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5549  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5550  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5551  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5552  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5553  		"ALU64_OR_K: 0x00000=
0000000000 | -1 =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5554  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5555  			BPF_LD_IMM64(R2, 0x=
0000000000000000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5556  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   5557  			BPF_ALU64_IMM(BPF_O=
R, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5558  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5559  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5560  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5561  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5562  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5563  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5564  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5565  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5566  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5567  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5568  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5569  		"ALU64_OR_K: Sign ex=
tension 1",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5570  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5571  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5572  			BPF_LD_IMM64(R1, 0x=
012345678fafcfefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5573  			BPF_ALU64_IMM(BPF_O=
R, R0, 0x0f0f0f0f),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5574  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5575  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5576  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5577  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5578  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5579  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5580  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5581  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5582  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5583  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5584  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5585  		"ALU64_OR_K: Sign ex=
tension 2",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5586  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5587  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5588  			BPF_LD_IMM64(R1, 0x=
fffffffff9fbfdffLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5589  			BPF_ALU64_IMM(BPF_O=
R, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5590  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5591  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5592  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5593  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5594  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5595  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5596  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5597  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5598  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5599  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5600  	/* BPF_ALU | BPF_XOR =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   5601  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5602  		"ALU_XOR_X: 5 ^ 6 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5603  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5604  			BPF_LD_IMM64(R0, 5),
cffc642d93f932 Michael Holzheu    2015-05-11   5605  			BPF_ALU32_IMM(BPF_M=
OV, R1, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   5606  			BPF_ALU32_REG(BPF_X=
OR, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5607  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5608  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5609  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5610  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5611  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5612  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5613  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5614  		"ALU_XOR_X: 0x1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f932 Michael Holzheu    2015-05-11   5615  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5616  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5617  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5618  			BPF_ALU32_REG(BPF_X=
OR, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5619  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5620  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5621  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5622  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5623  		{ { 0, 0xfffffffe } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5624  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5625  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5626  		"ALU64_XOR_X: 5 ^ 6 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5627  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5628  			BPF_LD_IMM64(R0, 5),
cffc642d93f932 Michael Holzheu    2015-05-11   5629  			BPF_ALU32_IMM(BPF_M=
OV, R1, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   5630  			BPF_ALU64_REG(BPF_X=
OR, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5631  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5632  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5633  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5634  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5635  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5636  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5637  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5638  		"ALU64_XOR_X: 1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f932 Michael Holzheu    2015-05-11   5639  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5640  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5641  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5642  			BPF_ALU64_REG(BPF_X=
OR, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5643  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5644  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5645  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5646  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5647  		{ { 0, 0xfffffffe } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5648  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5649  	/* BPF_ALU | BPF_XOR =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   5650  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5651  		"ALU_XOR_K: 5 ^ 6 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5652  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5653  			BPF_LD_IMM64(R0, 5),
cffc642d93f932 Michael Holzheu    2015-05-11   5654  			BPF_ALU32_IMM(BPF_X=
OR, R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   5655  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5656  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5657  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5658  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5659  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5660  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5661  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5662  		"ALU_XOR_K: 1 ^ 0xff=
ffffff =3D 0xfffffffe",
cffc642d93f932 Michael Holzheu    2015-05-11   5663  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5664  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5665  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5666  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5667  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5668  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5669  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5670  		{ { 0, 0xfffffffe } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5671  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5672  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5673  		"ALU_XOR_K: Small im=
mediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5674  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5675  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5676  			BPF_ALU32_IMM(BPF_X=
OR, R0, 15),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5677  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5678  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5679  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5680  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5681  		{ { 0, 0x0102030b } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5682  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5683  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5684  		"ALU_XOR_K: Large im=
mediate",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5685  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5686  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xf1f2f3f4),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5687  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xafbfcfdf),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5688  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5689  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5690  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5691  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5692  		{ { 0, 0x5e4d3c2b } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5693  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5694  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5695  		"ALU_XOR_K: Zero ext=
ension",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5696  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5697  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5698  			BPF_LD_IMM64(R1, 0x=
00000000795b3d1fLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5699  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5700  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5701  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5702  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5703  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5704  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5705  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5706  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5707  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5708  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5709  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5710  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5711  		"ALU64_XOR_K: 5 ^ 6 =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   5712  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5713  			BPF_LD_IMM64(R0, 5),
cffc642d93f932 Michael Holzheu    2015-05-11   5714  			BPF_ALU64_IMM(BPF_X=
OR, R0, 6),
cffc642d93f932 Michael Holzheu    2015-05-11   5715  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5716  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5717  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5718  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5719  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5720  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5721  	{
e92c813bf11932 Johan Almbladh     2021-08-09   5722  		"ALU64_XOR_K: 1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f932 Michael Holzheu    2015-05-11   5723  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5724  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5725  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5726  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5727  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5728  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5729  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5730  		{ { 0, 0xfffffffe } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5731  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5732  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5733  		"ALU64_XOR_K: 0x0000=
ffffffff0000 ^ 0x0 =3D 0x0000ffffffff0000",
cffc642d93f932 Michael Holzheu    2015-05-11   5734  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5735  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5736  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   5737  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0x0),
cffc642d93f932 Michael Holzheu    2015-05-11   5738  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5739  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5740  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5741  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5742  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5743  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5744  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5745  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5746  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5747  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5748  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5749  		"ALU64_XOR_K: 0x0000=
ffffffff0000 ^ -1 =3D 0xffff00000000ffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5750  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5751  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5752  			BPF_LD_IMM64(R3, 0x=
ffff00000000ffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   5753  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5754  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5755  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5756  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5757  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5758  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5759  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5760  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5761  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5762  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5763  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5764  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5765  		"ALU64_XOR_K: 0x0000=
00000000000 ^ -1 =3D 0xffffffffffffffff",
cffc642d93f932 Michael Holzheu    2015-05-11   5766  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   5767  			BPF_LD_IMM64(R2, 0x=
0000000000000000LL),
56cbaa45dde235 Michael Holzheu    2015-05-13   5768  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   5769  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   5770  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   5771  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5772  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5773  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   5774  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5775  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5776  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5777  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5778  		{ { 0, 0x1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5779  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5780  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5781  		"ALU64_XOR_K: Sign e=
xtension 1",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5782  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5783  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5784  			BPF_LD_IMM64(R1, 0x=
0123456786a4c2e0LL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5785  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0x0f0f0f0f),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5786  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5787  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5788  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5789  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5790  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5791  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5792  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5793  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5794  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5795  	},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5796  	{
ba89bcf78fba8f Johan Almbladh     2021-08-09   5797  		"ALU64_XOR_K: Sign e=
xtension 2",
ba89bcf78fba8f Johan Almbladh     2021-08-09   5798  		.u.insns_int =3D {
ba89bcf78fba8f Johan Almbladh     2021-08-09   5799  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5800  			BPF_LD_IMM64(R1, 0x=
fedcba98795b3d1fLL),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5801  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0xf0f0f0f0),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5802  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5803  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5804  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5805  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5806  			BPF_EXIT_INSN(),
ba89bcf78fba8f Johan Almbladh     2021-08-09   5807  		},
ba89bcf78fba8f Johan Almbladh     2021-08-09   5808  		INTERNAL,
ba89bcf78fba8f Johan Almbladh     2021-08-09   5809  		{ },
ba89bcf78fba8f Johan Almbladh     2021-08-09   5810  		{ { 0, 1 } }
ba89bcf78fba8f Johan Almbladh     2021-08-09   5811  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5812  	/* BPF_ALU | BPF_LSH =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   5813  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5814  		"ALU_LSH_X: 1 << 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5815  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5816  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5817  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5818  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5819  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5820  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5821  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5822  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5823  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5824  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5825  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5826  		"ALU_LSH_X: 1 << 31 =
=3D 0x80000000",
cffc642d93f932 Michael Holzheu    2015-05-11   5827  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5828  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5829  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   5830  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5831  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5832  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5833  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5834  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5835  		{ { 0, 0x80000000 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5836  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   5837  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   5838  		"ALU_LSH_X: 0x123456=
78 << 12 =3D 0x45678000",
0f2fca1ab18319 Johan Almbladh     2021-08-09   5839  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   5840  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   5841  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
0f2fca1ab18319 Johan Almbladh     2021-08-09   5842  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
0f2fca1ab18319 Johan Almbladh     2021-08-09   5843  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   5844  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   5845  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   5846  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   5847  		{ { 0, 0x45678000 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   5848  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5849  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5850  		"ALU64_LSH_X: 1 << 1=
 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5851  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5852  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5853  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5854  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5855  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5856  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5857  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5858  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5859  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5860  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5861  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5862  		"ALU64_LSH_X: 1 << 3=
1 =3D 0x80000000",
cffc642d93f932 Michael Holzheu    2015-05-11   5863  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5864  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5865  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   5866  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   5867  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5868  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5869  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5870  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5871  		{ { 0, 0x80000000 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5872  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5873  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5874  		"ALU64_LSH_X: Shift =
< 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5875  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5876  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5877  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   5878  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5879  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5880  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5881  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5882  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5883  		{ { 0, 0xbcdef000 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5884  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5885  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5886  		"ALU64_LSH_X: Shift =
< 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5887  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5888  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5889  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   5890  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5891  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5892  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5893  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5894  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5895  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5896  		{ { 0, 0x3456789a } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5897  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5898  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5899  		"ALU64_LSH_X: Shift =
> 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5900  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5901  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5902  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   5903  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5904  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5905  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5906  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5907  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5908  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5909  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5910  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5911  		"ALU64_LSH_X: Shift =
> 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5912  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5913  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5914  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   5915  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5916  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5917  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5918  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5919  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5920  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5921  		{ { 0, 0x9abcdef0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5922  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5923  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5924  		"ALU64_LSH_X: Shift =
=3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5925  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5926  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5927  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5928  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5929  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5930  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5931  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5932  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5933  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5934  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5935  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5936  		"ALU64_LSH_X: Shift =
=3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5937  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5938  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5939  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5940  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5941  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5942  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5943  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5944  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5945  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5946  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5947  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5948  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5949  		"ALU64_LSH_X: Zero s=
hift, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5950  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5951  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5952  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   5953  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5954  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5955  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5956  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5957  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5958  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5959  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   5960  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   5961  		"ALU64_LSH_X: Zero s=
hift, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   5962  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   5963  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   5964  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   5965  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   5966  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   5967  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   5968  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   5969  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   5970  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   5971  		{ { 0, 0x01234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   5972  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5973  	/* BPF_ALU | BPF_LSH =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   5974  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5975  		"ALU_LSH_K: 1 << 1 =
=3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   5976  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5977  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5978  			BPF_ALU32_IMM(BPF_L=
SH, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5979  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5980  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5981  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5982  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5983  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   5984  	},
cffc642d93f932 Michael Holzheu    2015-05-11   5985  	{
cffc642d93f932 Michael Holzheu    2015-05-11   5986  		"ALU_LSH_K: 1 << 31 =
=3D 0x80000000",
cffc642d93f932 Michael Holzheu    2015-05-11   5987  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   5988  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   5989  			BPF_ALU32_IMM(BPF_L=
SH, R0, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   5990  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   5991  		},
cffc642d93f932 Michael Holzheu    2015-05-11   5992  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   5993  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   5994  		{ { 0, 0x80000000 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   5995  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   5996  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   5997  		"ALU_LSH_K: 0x123456=
78 << 12 =3D 0x45678000",
0f2fca1ab18319 Johan Almbladh     2021-08-09   5998  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   5999  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6000  			BPF_ALU32_IMM(BPF_L=
SH, R0, 12),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6001  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6002  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6003  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6004  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6005  		{ { 0, 0x45678000 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6006  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6007  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6008  		"ALU_LSH_K: 0x123456=
78 << 0 =3D 0x12345678",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6009  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6010  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6011  			BPF_ALU32_IMM(BPF_L=
SH, R0, 0),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6012  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6013  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6014  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6015  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6016  		{ { 0, 0x12345678 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6017  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6018  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6019  		"ALU64_LSH_K: 1 << 1=
 =3D 2",
cffc642d93f932 Michael Holzheu    2015-05-11   6020  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6021  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6022  			BPF_ALU64_IMM(BPF_L=
SH, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6023  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6024  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6025  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6026  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6027  		{ { 0, 2 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6028  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6029  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6030  		"ALU64_LSH_K: 1 << 3=
1 =3D 0x80000000",
cffc642d93f932 Michael Holzheu    2015-05-11   6031  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6032  			BPF_LD_IMM64(R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6033  			BPF_ALU64_IMM(BPF_L=
SH, R0, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   6034  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6035  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6036  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6037  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6038  		{ { 0, 0x80000000 } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   6039  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6040  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6041  		"ALU64_LSH_K: Shift =
< 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6042  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6043  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6044  			BPF_ALU64_IMM(BPF_L=
SH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6045  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6046  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6047  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6048  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6049  		{ { 0, 0xbcdef000 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6050  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6051  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6052  		"ALU64_LSH_K: Shift =
< 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6053  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6054  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6055  			BPF_ALU64_IMM(BPF_L=
SH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6056  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6057  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6058  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6059  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6060  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6061  		{ { 0, 0x3456789a } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6062  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6063  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6064  		"ALU64_LSH_K: Shift =
> 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6065  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6066  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6067  			BPF_ALU64_IMM(BPF_L=
SH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6068  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6069  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6070  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6071  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6072  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6073  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6074  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6075  		"ALU64_LSH_K: Shift =
> 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6076  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6077  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6078  			BPF_ALU64_IMM(BPF_L=
SH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6079  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6080  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6081  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6082  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6083  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6084  		{ { 0, 0x9abcdef0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6085  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6086  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6087  		"ALU64_LSH_K: Shift =
=3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6088  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6089  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6090  			BPF_ALU64_IMM(BPF_L=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6091  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6092  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6093  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6094  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6095  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6096  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6097  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6098  		"ALU64_LSH_K: Shift =
=3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6099  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6100  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6101  			BPF_ALU64_IMM(BPF_L=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6102  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6103  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6104  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6105  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6106  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6107  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6108  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6109  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6110  		"ALU64_LSH_K: Zero s=
hift",
3b9890ef80f428 Johan Almbladh     2021-08-09   6111  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6112  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6113  			BPF_ALU64_IMM(BPF_L=
SH, R0, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6114  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6115  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6116  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6117  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6118  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6119  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6120  	/* BPF_ALU | BPF_RSH =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   6121  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6122  		"ALU_RSH_X: 2 >> 1 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6123  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6124  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   6125  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6126  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   6127  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6128  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6129  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6130  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6131  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6132  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6133  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6134  		"ALU_RSH_X: 0x800000=
00 >> 31 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6135  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6136  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f932 Michael Holzheu    2015-05-11   6137  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   6138  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   6139  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6140  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6141  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6142  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6143  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6144  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6145  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6146  		"ALU_RSH_X: 0x123456=
78 >> 20 =3D 0x123",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6147  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6148  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6149  			BPF_ALU32_IMM(BPF_M=
OV, R1, 20),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6150  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6151  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6152  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6153  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6154  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6155  		{ { 0, 0x123 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6156  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6157  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6158  		"ALU64_RSH_X: 2 >> 1=
 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6159  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6160  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   6161  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6162  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   6163  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6164  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6165  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6166  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6167  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6168  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6169  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6170  		"ALU64_RSH_X: 0x8000=
0000 >> 31 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6171  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6172  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f932 Michael Holzheu    2015-05-11   6173  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   6174  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   6175  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6176  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6177  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6178  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6179  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6180  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6181  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6182  		"ALU64_RSH_X: Shift =
< 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6183  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6184  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6185  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6186  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6187  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6188  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6189  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6190  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6191  		{ { 0, 0x56789abc } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6192  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6193  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6194  		"ALU64_RSH_X: Shift =
< 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6195  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6196  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6197  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6198  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6199  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6200  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6201  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6202  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6203  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6204  		{ { 0, 0x00081234 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6205  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6206  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6207  		"ALU64_RSH_X: Shift =
> 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6208  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6209  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6210  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6211  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6212  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6213  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6214  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6215  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6216  		{ { 0, 0x08123456 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6217  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6218  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6219  		"ALU64_RSH_X: Shift =
> 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6220  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6221  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6222  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6223  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6224  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6225  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6226  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6227  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6228  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6229  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6230  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6231  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6232  		"ALU64_RSH_X: Shift =
=3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6233  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6234  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6235  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6236  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6237  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6238  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6239  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6240  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6241  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6242  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6243  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6244  		"ALU64_RSH_X: Shift =
=3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6245  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6246  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6247  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6248  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6249  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6250  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6251  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6252  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6253  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6254  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6255  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6256  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6257  		"ALU64_RSH_X: Zero s=
hift, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6258  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6259  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6260  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6261  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6262  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6263  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6264  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6265  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6266  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6267  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6268  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6269  		"ALU64_RSH_X: Zero s=
hift, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6270  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6271  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6272  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6273  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6274  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6275  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6276  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6277  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6278  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6279  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6280  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6281  	/* BPF_ALU | BPF_RSH =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   6282  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6283  		"ALU_RSH_K: 2 >> 1 =
=3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6284  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6285  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   6286  			BPF_ALU32_IMM(BPF_R=
SH, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6287  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6288  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6289  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6290  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6291  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6292  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6293  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6294  		"ALU_RSH_K: 0x800000=
00 >> 31 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6295  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6296  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f932 Michael Holzheu    2015-05-11   6297  			BPF_ALU32_IMM(BPF_R=
SH, R0, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   6298  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6299  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6300  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6301  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6302  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6303  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6304  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6305  		"ALU_RSH_K: 0x123456=
78 >> 20 =3D 0x123",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6306  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6307  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6308  			BPF_ALU32_IMM(BPF_R=
SH, R0, 20),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6309  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6310  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6311  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6312  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6313  		{ { 0, 0x123 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6314  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6315  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6316  		"ALU_RSH_K: 0x123456=
78 >> 0 =3D 0x12345678",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6317  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6318  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6319  			BPF_ALU32_IMM(BPF_R=
SH, R0, 0),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6320  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6321  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6322  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6323  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6324  		{ { 0, 0x12345678 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6325  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6326  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6327  		"ALU64_RSH_K: 2 >> 1=
 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6328  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6329  			BPF_LD_IMM64(R0, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   6330  			BPF_ALU64_IMM(BPF_R=
SH, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6331  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6332  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6333  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6334  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6335  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6336  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6337  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6338  		"ALU64_RSH_K: 0x8000=
0000 >> 31 =3D 1",
cffc642d93f932 Michael Holzheu    2015-05-11   6339  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6340  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f932 Michael Holzheu    2015-05-11   6341  			BPF_ALU64_IMM(BPF_R=
SH, R0, 31),
cffc642d93f932 Michael Holzheu    2015-05-11   6342  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6343  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6344  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6345  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6346  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6347  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6348  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6349  		"ALU64_RSH_K: Shift =
< 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6350  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6351  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6352  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6353  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6354  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6355  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6356  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6357  		{ { 0, 0x56789abc } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6358  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6359  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6360  		"ALU64_RSH_K: Shift =
< 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6361  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6362  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6363  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6364  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6365  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6366  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6367  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6368  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6369  		{ { 0, 0x00081234 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6370  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6371  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6372  		"ALU64_RSH_K: Shift =
> 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6373  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6374  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6375  			BPF_ALU64_IMM(BPF_R=
SH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6376  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6377  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6378  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6379  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6380  		{ { 0, 0x08123456 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6381  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6382  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6383  		"ALU64_RSH_K: Shift =
> 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6384  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6385  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6386  			BPF_ALU64_IMM(BPF_R=
SH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6387  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6388  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6389  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6390  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6391  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6392  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6393  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6394  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6395  		"ALU64_RSH_K: Shift =
=3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6396  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6397  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6398  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6399  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6400  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6401  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6402  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6403  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6404  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6405  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6406  		"ALU64_RSH_K: Shift =
=3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6407  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6408  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6409  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6410  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6411  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6412  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6413  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6414  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6415  		{ { 0, 0 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6416  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6417  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6418  		"ALU64_RSH_K: Zero s=
hift",
3b9890ef80f428 Johan Almbladh     2021-08-09   6419  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6420  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6421  			BPF_ALU64_IMM(BPF_R=
SH, R0, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6422  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6423  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6424  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6425  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6426  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6427  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6428  	/* BPF_ALU | BPF_ARSH=
 | BPF_X */
0f2fca1ab18319 Johan Almbladh     2021-08-09   6429  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6430  		"ALU32_ARSH_X: -1234=
 >> 7 =3D -10",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6431  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6432  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6433  			BPF_ALU32_IMM(BPF_M=
OV, R1, 7),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6434  			BPF_ALU32_REG(BPF_A=
RSH, R0, R1),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6435  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6436  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6437  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6438  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6439  		{ { 0, -10 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6440  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6441  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6442  		"ALU64_ARSH_X: 0xff0=
0ff0000000000 >> 40 =3D 0xffffffffffff00ff",
cffc642d93f932 Michael Holzheu    2015-05-11   6443  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6444  			BPF_LD_IMM64(R0, 0x=
ff00ff0000000000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   6445  			BPF_ALU32_IMM(BPF_M=
OV, R1, 40),
cffc642d93f932 Michael Holzheu    2015-05-11   6446  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
cffc642d93f932 Michael Holzheu    2015-05-11   6447  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6448  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6449  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6450  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6451  		{ { 0, 0xffff00ff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   6452  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6453  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6454  		"ALU64_ARSH_X: Shift=
 < 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6455  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6456  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6457  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6458  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6459  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6460  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6461  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6462  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6463  		{ { 0, 0x56789abc } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6464  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6465  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6466  		"ALU64_ARSH_X: Shift=
 < 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6467  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6468  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6469  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6470  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6471  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6472  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6473  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6474  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6475  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6476  		{ { 0, 0xfff81234 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6477  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6478  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6479  		"ALU64_ARSH_X: Shift=
 > 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6480  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6481  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6482  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6483  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6484  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6485  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6486  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6487  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6488  		{ { 0, 0xf8123456 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6489  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6490  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6491  		"ALU64_ARSH_X: Shift=
 > 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6492  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6493  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6494  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6495  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6496  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6497  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6498  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6499  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6500  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6501  		{ { 0, -1 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6502  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6503  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6504  		"ALU64_ARSH_X: Shift=
 =3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6505  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6506  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6507  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6508  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6509  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6510  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6511  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6512  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6513  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6514  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6515  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6516  		"ALU64_ARSH_X: Shift=
 =3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6517  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6518  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6519  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6520  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6521  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6522  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6523  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6524  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6525  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6526  		{ { 0, -1 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6527  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6528  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6529  		"ALU64_ARSH_X: Zero =
shift, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6530  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6531  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6532  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6533  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6534  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6535  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6536  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6537  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6538  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6539  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6540  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6541  		"ALU64_ARSH_X: Zero =
shift, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6542  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6543  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6544  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6545  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f428 Johan Almbladh     2021-08-09   6546  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6547  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6548  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6549  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6550  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6551  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6552  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6553  	/* BPF_ALU | BPF_ARSH=
 | BPF_K */
0f2fca1ab18319 Johan Almbladh     2021-08-09   6554  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6555  		"ALU32_ARSH_K: -1234=
 >> 7 =3D -10",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6556  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6557  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6558  			BPF_ALU32_IMM(BPF_A=
RSH, R0, 7),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6559  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6560  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6561  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6562  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6563  		{ { 0, -10 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6564  	},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6565  	{
0f2fca1ab18319 Johan Almbladh     2021-08-09   6566  		"ALU32_ARSH_K: -1234=
 >> 0 =3D -1234",
0f2fca1ab18319 Johan Almbladh     2021-08-09   6567  		.u.insns_int =3D {
0f2fca1ab18319 Johan Almbladh     2021-08-09   6568  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6569  			BPF_ALU32_IMM(BPF_A=
RSH, R0, 0),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6570  			BPF_EXIT_INSN(),
0f2fca1ab18319 Johan Almbladh     2021-08-09   6571  		},
0f2fca1ab18319 Johan Almbladh     2021-08-09   6572  		INTERNAL,
0f2fca1ab18319 Johan Almbladh     2021-08-09   6573  		{ },
0f2fca1ab18319 Johan Almbladh     2021-08-09   6574  		{ { 0, -1234 } }
0f2fca1ab18319 Johan Almbladh     2021-08-09   6575  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6576  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6577  		"ALU64_ARSH_K: 0xff0=
0ff0000000000 >> 40 =3D 0xffffffffffff00ff",
cffc642d93f932 Michael Holzheu    2015-05-11   6578  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6579  			BPF_LD_IMM64(R0, 0x=
ff00ff0000000000LL),
cffc642d93f932 Michael Holzheu    2015-05-11   6580  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 40),
cffc642d93f932 Michael Holzheu    2015-05-11   6581  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6582  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6583  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6584  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6585  		{ { 0, 0xffff00ff } =
},
cffc642d93f932 Michael Holzheu    2015-05-11   6586  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6587  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6588  		"ALU64_ARSH_K: Shift=
 < 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6589  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6590  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6591  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6592  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6593  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6594  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6595  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6596  		{ { 0, 0x56789abc } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6597  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6598  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6599  		"ALU64_ARSH_K: Shift=
 < 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6600  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6601  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6602  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 12),
3b9890ef80f428 Johan Almbladh     2021-08-09   6603  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6604  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6605  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6606  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6607  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6608  		{ { 0, 0xfff81234 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6609  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6610  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6611  		"ALU64_ARSH_K: Shift=
 > 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6612  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6613  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6614  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6615  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6616  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6617  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6618  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6619  		{ { 0, 0xf8123456 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6620  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6621  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6622  		"ALU64_ARSH_K: Shift=
 > 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6623  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6624  			BPF_LD_IMM64(R0, 0x=
f123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6625  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 36),
3b9890ef80f428 Johan Almbladh     2021-08-09   6626  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6627  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6628  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6629  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6630  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6631  		{ { 0, -1 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6632  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6633  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6634  		"ALU64_ARSH_K: Shift=
 =3D=3D 32, low word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6635  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6636  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6637  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6638  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6639  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6640  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6641  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6642  		{ { 0, 0x81234567 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6643  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6644  	{
3b9890ef80f428 Johan Almbladh     2021-08-09   6645  		"ALU64_ARSH_K: Shift=
 =3D=3D 32, high word",
3b9890ef80f428 Johan Almbladh     2021-08-09   6646  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6647  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6648  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6649  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f428 Johan Almbladh     2021-08-09   6650  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6651  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6652  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6653  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6654  		{ { 0, -1 } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6655  	},
3b9890ef80f428 Johan Almbladh     2021-08-09   6656  	{
1bda52f8047126 Colin Ian King     2021-08-15   6657  		"ALU64_ARSH_K: Zero =
shift",
3b9890ef80f428 Johan Almbladh     2021-08-09   6658  		.u.insns_int =3D {
3b9890ef80f428 Johan Almbladh     2021-08-09   6659  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f428 Johan Almbladh     2021-08-09   6660  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 0),
3b9890ef80f428 Johan Almbladh     2021-08-09   6661  			BPF_EXIT_INSN(),
3b9890ef80f428 Johan Almbladh     2021-08-09   6662  		},
3b9890ef80f428 Johan Almbladh     2021-08-09   6663  		INTERNAL,
3b9890ef80f428 Johan Almbladh     2021-08-09   6664  		{ },
3b9890ef80f428 Johan Almbladh     2021-08-09   6665  		{ { 0, 0x89abcdef } }
3b9890ef80f428 Johan Almbladh     2021-08-09   6666  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6667  	/* BPF_ALU | BPF_NEG =
*/
cffc642d93f932 Michael Holzheu    2015-05-11   6668  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6669  		"ALU_NEG: -(3) =3D -=
3",
cffc642d93f932 Michael Holzheu    2015-05-11   6670  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6671  			BPF_ALU32_IMM(BPF_M=
OV, R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   6672  			BPF_ALU32_IMM(BPF_N=
EG, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6673  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6674  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6675  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6676  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6677  		{ { 0, -3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6678  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6679  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6680  		"ALU_NEG: -(-3) =3D =
3",
cffc642d93f932 Michael Holzheu    2015-05-11   6681  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6682  			BPF_ALU32_IMM(BPF_M=
OV, R0, -3),
cffc642d93f932 Michael Holzheu    2015-05-11   6683  			BPF_ALU32_IMM(BPF_N=
EG, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6684  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6685  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6686  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6687  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6688  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6689  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6690  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6691  		"ALU64_NEG: -(3) =3D=
 -3",
cffc642d93f932 Michael Holzheu    2015-05-11   6692  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6693  			BPF_LD_IMM64(R0, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   6694  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6695  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6696  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6697  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6698  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6699  		{ { 0, -3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6700  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6701  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6702  		"ALU64_NEG: -(-3) =
=3D 3",
cffc642d93f932 Michael Holzheu    2015-05-11   6703  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6704  			BPF_LD_IMM64(R0, -3=
),
cffc642d93f932 Michael Holzheu    2015-05-11   6705  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6706  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6707  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6708  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6709  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6710  		{ { 0, 3 } },
cffc642d93f932 Michael Holzheu    2015-05-11   6711  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6712  	/* BPF_ALU | BPF_END =
| BPF_FROM_BE */
cffc642d93f932 Michael Holzheu    2015-05-11   6713  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6714  		"ALU_END_FROM_BE 16:=
 0x0123456789abcdef -> 0xcdef",
cffc642d93f932 Michael Holzheu    2015-05-11   6715  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6716  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6717  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 16),
cffc642d93f932 Michael Holzheu    2015-05-11   6718  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6719  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6720  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6721  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11  @6722  		{ { 0,  cpu_to_be16(=
0xcdef) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6723  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6724  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6725  		"ALU_END_FROM_BE 32:=
 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f932 Michael Holzheu    2015-05-11   6726  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6727  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6728  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 32),
ba29becd770ffe Xi Wang            2015-07-08   6729  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
ba29becd770ffe Xi Wang            2015-07-08   6730  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
ba29becd770ffe Xi Wang            2015-07-08   6731  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
cffc642d93f932 Michael Holzheu    2015-05-11   6732  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6733  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6734  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6735  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6736  		{ { 0, cpu_to_be32(0=
x89abcdef) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6737  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6738  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6739  		"ALU_END_FROM_BE 64:=
 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f932 Michael Holzheu    2015-05-11   6740  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6741  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6742  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
cffc642d93f932 Michael Holzheu    2015-05-11   6743  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6744  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6745  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6746  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6747  		{ { 0, (u32) cpu_to_=
be64(0x0123456789abcdefLL) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6748  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6749  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6750  		"ALU_END_FROM_BE 64:=
 0x0123456789abcdef >> 32 -> 0x01234567",
b768dbbf26de96 Johan Almbladh     2021-09-02   6751  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6752  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6753  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6754  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6755  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6756  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6757  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6758  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02  @6759  		{ { 0, (u32) (cpu_to=
_be64(0x0123456789abcdefLL) >> 32) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6760  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6761  	/* BPF_ALU | BPF_END =
| BPF_FROM_BE, reversed */
b768dbbf26de96 Johan Almbladh     2021-09-02   6762  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6763  		"ALU_END_FROM_BE 16:=
 0xfedcba9876543210 -> 0x3210",
b768dbbf26de96 Johan Almbladh     2021-09-02   6764  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6765  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6766  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 16),
b768dbbf26de96 Johan Almbladh     2021-09-02   6767  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6768  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6769  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6770  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6771  		{ { 0,  cpu_to_be16(=
0x3210) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6772  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6773  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6774  		"ALU_END_FROM_BE 32:=
 0xfedcba9876543210 -> 0x76543210",
b768dbbf26de96 Johan Almbladh     2021-09-02   6775  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6776  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6777  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6778  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
b768dbbf26de96 Johan Almbladh     2021-09-02   6779  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6780  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
b768dbbf26de96 Johan Almbladh     2021-09-02   6781  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6782  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6783  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6784  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6785  		{ { 0, cpu_to_be32(0=
x76543210) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6786  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6787  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6788  		"ALU_END_FROM_BE 64:=
 0xfedcba9876543210 -> 0x76543210",
b768dbbf26de96 Johan Almbladh     2021-09-02   6789  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6790  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6791  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6792  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6793  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6794  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6795  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02  @6796  		{ { 0, (u32) cpu_to_=
be64(0xfedcba9876543210ULL) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6797  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6798  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6799  		"ALU_END_FROM_BE 64:=
 0xfedcba9876543210 >> 32 -> 0xfedcba98",
b768dbbf26de96 Johan Almbladh     2021-09-02   6800  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6801  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6802  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6803  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6804  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6805  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6806  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6807  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6808  		{ { 0, (u32) (cpu_to=
_be64(0xfedcba9876543210ULL) >> 32) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6809  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6810  	/* BPF_ALU | BPF_END =
| BPF_FROM_LE */
cffc642d93f932 Michael Holzheu    2015-05-11   6811  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6812  		"ALU_END_FROM_LE 16:=
 0x0123456789abcdef -> 0xefcd",
cffc642d93f932 Michael Holzheu    2015-05-11   6813  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6814  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6815  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 16),
cffc642d93f932 Michael Holzheu    2015-05-11   6816  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6817  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6818  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6819  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6820  		{ { 0, cpu_to_le16(0=
xcdef) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6821  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6822  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6823  		"ALU_END_FROM_LE 32:=
 0x0123456789abcdef -> 0xefcdab89",
cffc642d93f932 Michael Holzheu    2015-05-11   6824  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6825  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6826  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 32),
ba29becd770ffe Xi Wang            2015-07-08   6827  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
ba29becd770ffe Xi Wang            2015-07-08   6828  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
ba29becd770ffe Xi Wang            2015-07-08   6829  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
cffc642d93f932 Michael Holzheu    2015-05-11   6830  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6831  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6832  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6833  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6834  		{ { 0, cpu_to_le32(0=
x89abcdef) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6835  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6836  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6837  		"ALU_END_FROM_LE 64:=
 0x0123456789abcdef -> 0x67452301",
cffc642d93f932 Michael Holzheu    2015-05-11   6838  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6839  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6840  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
cffc642d93f932 Michael Holzheu    2015-05-11   6841  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6842  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6843  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6844  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6845  		{ { 0, (u32) cpu_to_=
le64(0x0123456789abcdefLL) } },
cffc642d93f932 Michael Holzheu    2015-05-11   6846  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6847  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6848  		"ALU_END_FROM_LE 64:=
 0x0123456789abcdef >> 32 -> 0xefcdab89",
b768dbbf26de96 Johan Almbladh     2021-09-02   6849  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6850  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6851  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6852  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6853  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6854  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6855  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6856  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02  @6857  		{ { 0, (u32) (cpu_to=
_le64(0x0123456789abcdefLL) >> 32) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6858  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6859  	/* BPF_ALU | BPF_END =
| BPF_FROM_LE, reversed */
b768dbbf26de96 Johan Almbladh     2021-09-02   6860  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6861  		"ALU_END_FROM_LE 16:=
 0xfedcba9876543210 -> 0x1032",
b768dbbf26de96 Johan Almbladh     2021-09-02   6862  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6863  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6864  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 16),
b768dbbf26de96 Johan Almbladh     2021-09-02   6865  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6866  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6867  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6868  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6869  		{ { 0,  cpu_to_le16(=
0x3210) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6870  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6871  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6872  		"ALU_END_FROM_LE 32:=
 0xfedcba9876543210 -> 0x10325476",
b768dbbf26de96 Johan Almbladh     2021-09-02   6873  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6874  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6875  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6876  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
b768dbbf26de96 Johan Almbladh     2021-09-02   6877  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6878  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
b768dbbf26de96 Johan Almbladh     2021-09-02   6879  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6880  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6881  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6882  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6883  		{ { 0, cpu_to_le32(0=
x76543210) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6884  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6885  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6886  		"ALU_END_FROM_LE 64:=
 0xfedcba9876543210 -> 0x10325476",
b768dbbf26de96 Johan Almbladh     2021-09-02   6887  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6888  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6889  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6890  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6891  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6892  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6893  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6894  		{ { 0, (u32) cpu_to_=
le64(0xfedcba9876543210ULL) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6895  	},
b768dbbf26de96 Johan Almbladh     2021-09-02   6896  	{
b768dbbf26de96 Johan Almbladh     2021-09-02   6897  		"ALU_END_FROM_LE 64:=
 0xfedcba9876543210 >> 32 -> 0x98badcfe",
b768dbbf26de96 Johan Almbladh     2021-09-02   6898  		.u.insns_int =3D {
b768dbbf26de96 Johan Almbladh     2021-09-02   6899  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
b768dbbf26de96 Johan Almbladh     2021-09-02   6900  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
b768dbbf26de96 Johan Almbladh     2021-09-02   6901  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
b768dbbf26de96 Johan Almbladh     2021-09-02   6902  			BPF_EXIT_INSN(),
b768dbbf26de96 Johan Almbladh     2021-09-02   6903  		},
b768dbbf26de96 Johan Almbladh     2021-09-02   6904  		INTERNAL,
b768dbbf26de96 Johan Almbladh     2021-09-02   6905  		{ },
b768dbbf26de96 Johan Almbladh     2021-09-02   6906  		{ { 0, (u32) (cpu_to=
_le64(0xfedcba9876543210ULL) >> 32) } },
b768dbbf26de96 Johan Almbladh     2021-09-02   6907  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6908  	/* BPF_ST(X) | BPF_ME=
M | BPF_B/H/W/DW */
cffc642d93f932 Michael Holzheu    2015-05-11   6909  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6910  		"ST_MEM_B: Store/Loa=
d byte: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   6911  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6912  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6913  			BPF_ST_MEM(BPF_B, R=
10, -40, 0xff),
cffc642d93f932 Michael Holzheu    2015-05-11   6914  			BPF_LDX_MEM(BPF_B, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6915  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6916  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6917  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6918  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6919  		{ { 0, 0xff } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6920  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6921  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6922  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6923  		"ST_MEM_B: Store/Loa=
d byte: max positive",
cffc642d93f932 Michael Holzheu    2015-05-11   6924  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6925  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6926  			BPF_ST_MEM(BPF_H, R=
10, -40, 0x7f),
cffc642d93f932 Michael Holzheu    2015-05-11   6927  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6928  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6929  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6930  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6931  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6932  		{ { 0, 0x7f } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6933  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6934  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6935  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6936  		"STX_MEM_B: Store/Lo=
ad byte: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   6937  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6938  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6939  			BPF_LD_IMM64(R1, 0x=
ffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6940  			BPF_STX_MEM(BPF_B, =
R10, R1, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6941  			BPF_LDX_MEM(BPF_B, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6942  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6943  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6944  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6945  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6946  		{ { 0, 0xff } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6947  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6948  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6949  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6950  		"ST_MEM_H: Store/Loa=
d half word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   6951  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6952  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6953  			BPF_ST_MEM(BPF_H, R=
10, -40, 0xffff),
cffc642d93f932 Michael Holzheu    2015-05-11   6954  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6955  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6956  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6957  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6958  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6959  		{ { 0, 0xffff } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6960  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6961  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6962  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6963  		"ST_MEM_H: Store/Loa=
d half word: max positive",
cffc642d93f932 Michael Holzheu    2015-05-11   6964  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6965  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6966  			BPF_ST_MEM(BPF_H, R=
10, -40, 0x7fff),
cffc642d93f932 Michael Holzheu    2015-05-11   6967  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6968  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6969  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6970  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6971  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6972  		{ { 0, 0x7fff } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6973  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6974  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6975  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6976  		"STX_MEM_H: Store/Lo=
ad half word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   6977  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6978  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   6979  			BPF_LD_IMM64(R1, 0x=
ffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   6980  			BPF_STX_MEM(BPF_H, =
R10, R1, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6981  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6982  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6983  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6984  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6985  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6986  		{ { 0, 0xffff } },
105c03614bff2d Alexei Starovoitov 2017-05-30   6987  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   6988  	},
cffc642d93f932 Michael Holzheu    2015-05-11   6989  	{
cffc642d93f932 Michael Holzheu    2015-05-11   6990  		"ST_MEM_W: Store/Loa=
d word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   6991  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   6992  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   6993  			BPF_ST_MEM(BPF_W, R=
10, -40, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   6994  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   6995  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   6996  		},
cffc642d93f932 Michael Holzheu    2015-05-11   6997  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   6998  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   6999  		{ { 0, 0xffffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7000  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7001  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7002  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7003  		"ST_MEM_W: Store/Loa=
d word: max positive",
cffc642d93f932 Michael Holzheu    2015-05-11   7004  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7005  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   7006  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x7fffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   7007  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7008  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7009  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7010  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7011  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7012  		{ { 0, 0x7fffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7013  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7014  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7015  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7016  		"STX_MEM_W: Store/Lo=
ad word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   7017  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7018  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   7019  			BPF_LD_IMM64(R1, 0x=
ffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   7020  			BPF_STX_MEM(BPF_W, =
R10, R1, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7021  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7022  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7023  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7024  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7025  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7026  		{ { 0, 0xffffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7027  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7028  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7029  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7030  		"ST_MEM_DW: Store/Lo=
ad double word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   7031  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7032  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   7033  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   7034  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7035  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7036  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7037  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7038  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7039  		{ { 0, 0xffffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7040  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7041  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7042  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7043  		"ST_MEM_DW: Store/Lo=
ad double word: max negative 2",
cffc642d93f932 Michael Holzheu    2015-05-11   7044  		.u.insns_int =3D {
56cbaa45dde235 Michael Holzheu    2015-05-13   7045  			BPF_LD_IMM64(R2, 0x=
ffff00000000ffffLL),
56cbaa45dde235 Michael Holzheu    2015-05-13   7046  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   7047  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0xffffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   7048  			BPF_LDX_MEM(BPF_DW,=
 R2, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7049  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   7050  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   7051  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7052  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   7053  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7054  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7055  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7056  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7057  		{ { 0, 0x1 } },
105c03614bff2d Alexei Starovoitov 2017-05-30   7058  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7059  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7060  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7061  		"ST_MEM_DW: Store/Lo=
ad double word: max positive",
cffc642d93f932 Michael Holzheu    2015-05-11   7062  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7063  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   7064  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0x7fffffff),
cffc642d93f932 Michael Holzheu    2015-05-11   7065  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7066  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7067  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7068  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7069  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7070  		{ { 0, 0x7fffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7071  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7072  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7073  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7074  		"STX_MEM_DW: Store/L=
oad double word: max negative",
cffc642d93f932 Michael Holzheu    2015-05-11   7075  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7076  			BPF_LD_IMM64(R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   7077  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
ae7f47041d928b Johan Almbladh     2021-07-21   7078  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
ae7f47041d928b Johan Almbladh     2021-07-21   7079  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f932 Michael Holzheu    2015-05-11   7080  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7081  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7082  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7083  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7084  		{ { 0, 0xffffffff } =
},
105c03614bff2d Alexei Starovoitov 2017-05-30   7085  		.stack_depth =3D 40,
cffc642d93f932 Michael Holzheu    2015-05-11   7086  	},
e5009b4636cb59 Johan Almbladh     2021-08-09   7087  	{
e5009b4636cb59 Johan Almbladh     2021-08-09   7088  		"STX_MEM_DW: Store d=
ouble word: first word in memory",
e5009b4636cb59 Johan Almbladh     2021-08-09   7089  		.u.insns_int =3D {
e5009b4636cb59 Johan Almbladh     2021-08-09   7090  			BPF_LD_IMM64(R0, 0),
e5009b4636cb59 Johan Almbladh     2021-08-09   7091  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefLL),
e5009b4636cb59 Johan Almbladh     2021-08-09   7092  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
e5009b4636cb59 Johan Almbladh     2021-08-09   7093  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
e5009b4636cb59 Johan Almbladh     2021-08-09   7094  			BPF_EXIT_INSN(),
e5009b4636cb59 Johan Almbladh     2021-08-09   7095  		},
e5009b4636cb59 Johan Almbladh     2021-08-09   7096  		INTERNAL,
e5009b4636cb59 Johan Almbladh     2021-08-09   7097  		{ },
e5009b4636cb59 Johan Almbladh     2021-08-09   7098  #ifdef __BIG_ENDIAN
e5009b4636cb59 Johan Almbladh     2021-08-09   7099  		{ { 0, 0x01234567 } =
},
e5009b4636cb59 Johan Almbladh     2021-08-09   7100  #else
e5009b4636cb59 Johan Almbladh     2021-08-09   7101  		{ { 0, 0x89abcdef } =
},
e5009b4636cb59 Johan Almbladh     2021-08-09   7102  #endif
e5009b4636cb59 Johan Almbladh     2021-08-09   7103  		.stack_depth =3D 40,
e5009b4636cb59 Johan Almbladh     2021-08-09   7104  	},
e5009b4636cb59 Johan Almbladh     2021-08-09   7105  	{
e5009b4636cb59 Johan Almbladh     2021-08-09   7106  		"STX_MEM_DW: Store d=
ouble word: second word in memory",
e5009b4636cb59 Johan Almbladh     2021-08-09   7107  		.u.insns_int =3D {
e5009b4636cb59 Johan Almbladh     2021-08-09   7108  			BPF_LD_IMM64(R0, 0),
e5009b4636cb59 Johan Almbladh     2021-08-09   7109  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefLL),
e5009b4636cb59 Johan Almbladh     2021-08-09   7110  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
e5009b4636cb59 Johan Almbladh     2021-08-09   7111  			BPF_LDX_MEM(BPF_W, =
R0, R10, -36),
e5009b4636cb59 Johan Almbladh     2021-08-09   7112  			BPF_EXIT_INSN(),
e5009b4636cb59 Johan Almbladh     2021-08-09   7113  		},
e5009b4636cb59 Johan Almbladh     2021-08-09   7114  		INTERNAL,
e5009b4636cb59 Johan Almbladh     2021-08-09   7115  		{ },
e5009b4636cb59 Johan Almbladh     2021-08-09   7116  #ifdef __BIG_ENDIAN
e5009b4636cb59 Johan Almbladh     2021-08-09   7117  		{ { 0, 0x89abcdef } =
},
e5009b4636cb59 Johan Almbladh     2021-08-09   7118  #else
e5009b4636cb59 Johan Almbladh     2021-08-09   7119  		{ { 0, 0x01234567 } =
},
e5009b4636cb59 Johan Almbladh     2021-08-09   7120  #endif
e5009b4636cb59 Johan Almbladh     2021-08-09   7121  		.stack_depth =3D 40,
e5009b4636cb59 Johan Almbladh     2021-08-09   7122  	},
91c960b0056672 Brendan Jackman    2021-01-14   7123  	/* BPF_STX | BPF_ATOM=
IC | BPF_W/DW */
85f68fe8983205 Daniel Borkmann    2017-05-01   7124  	{
85f68fe8983205 Daniel Borkmann    2017-05-01   7125  		"STX_XADD_W: X + 1 +=
 1 + 1 + ...",
85f68fe8983205 Daniel Borkmann    2017-05-01   7126  		{ },
85f68fe8983205 Daniel Borkmann    2017-05-01   7127  		INTERNAL,
85f68fe8983205 Daniel Borkmann    2017-05-01   7128  		{ },
85f68fe8983205 Daniel Borkmann    2017-05-01   7129  		{ { 0, 4134 } },
85f68fe8983205 Daniel Borkmann    2017-05-01   7130  		.fill_helper =3D bpf=
_fill_stxw,
85f68fe8983205 Daniel Borkmann    2017-05-01   7131  	},
85f68fe8983205 Daniel Borkmann    2017-05-01   7132  	{
85f68fe8983205 Daniel Borkmann    2017-05-01   7133  		"STX_XADD_DW: X + 1 =
+ 1 + 1 + ...",
85f68fe8983205 Daniel Borkmann    2017-05-01   7134  		{ },
85f68fe8983205 Daniel Borkmann    2017-05-01   7135  		INTERNAL,
85f68fe8983205 Daniel Borkmann    2017-05-01   7136  		{ },
85f68fe8983205 Daniel Borkmann    2017-05-01   7137  		{ { 0, 4134 } },
85f68fe8983205 Daniel Borkmann    2017-05-01   7138  		.fill_helper =3D bpf=
_fill_stxdw,
85f68fe8983205 Daniel Borkmann    2017-05-01   7139  	},
e4517b3637c648 Johan Almbladh     2021-08-09   7140  	/*
e4517b3637c648 Johan Almbladh     2021-08-09   7141  	 * Exhaustive tests o=
f atomic operation variants.
e4517b3637c648 Johan Almbladh     2021-08-09   7142  	 * Individual tests a=
re expanded from template macros for all
e4517b3637c648 Johan Almbladh     2021-08-09   7143  	 * combinations of AL=
U operation, word size and fetching.
e4517b3637c648 Johan Almbladh     2021-08-09   7144  	 */
e4517b3637c648 Johan Almbladh     2021-08-09   7145  #define BPF_ATOMIC_OP_=
TEST1(width, op, logic, old, update, result)	\
e4517b3637c648 Johan Almbladh     2021-08-09   7146  {									\
e4517b3637c648 Johan Almbladh     2021-08-09   7147  	"BPF_ATOMIC | " #widt=
h ", " #op ": Test: "			\
e4517b3637c648 Johan Almbladh     2021-08-09   7148  		#old " " #logic " " =
#update " =3D " #result,		\
e4517b3637c648 Johan Almbladh     2021-08-09   7149  	.u.insns_int =3D {			=
			\
e4517b3637c648 Johan Almbladh     2021-08-09   7150  		BPF_ALU32_IMM(BPF_MO=
V, R5, update),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7151  		BPF_ST_MEM(width, R1=
0, -40, old),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7152  		BPF_ATOMIC_OP(width,=
 op, R10, R5, -40),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7153  		BPF_LDX_MEM(width, R=
0, R10, -40),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7154  		BPF_EXIT_INSN(),				=
	\
e4517b3637c648 Johan Almbladh     2021-08-09   7155  	},								\
e4517b3637c648 Johan Almbladh     2021-08-09   7156  	INTERNAL,							\
e4517b3637c648 Johan Almbladh     2021-08-09   7157  	{ },								\
e4517b3637c648 Johan Almbladh     2021-08-09   7158  	{ { 0, result } },			=
			\
e4517b3637c648 Johan Almbladh     2021-08-09   7159  	.stack_depth =3D 40,	=
					\
e4517b3637c648 Johan Almbladh     2021-08-09   7160  }
e4517b3637c648 Johan Almbladh     2021-08-09   7161  #define BPF_ATOMIC_OP_=
TEST2(width, op, logic, old, update, result)	\
e4517b3637c648 Johan Almbladh     2021-08-09   7162  {									\
e4517b3637c648 Johan Almbladh     2021-08-09   7163  	"BPF_ATOMIC | " #widt=
h ", " #op ": Test side effects, r10: "	\
e4517b3637c648 Johan Almbladh     2021-08-09   7164  		#old " " #logic " " =
#update " =3D " #result,		\
e4517b3637c648 Johan Almbladh     2021-08-09   7165  	.u.insns_int =3D {			=
			\
e4517b3637c648 Johan Almbladh     2021-08-09   7166  		BPF_ALU64_REG(BPF_MO=
V, R1, R10),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7167  		BPF_ALU32_IMM(BPF_MO=
V, R0, update),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7168  		BPF_ST_MEM(BPF_W, R1=
0, -40, old),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7169  		BPF_ATOMIC_OP(width,=
 op, R10, R0, -40),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7170  		BPF_ALU64_REG(BPF_MO=
V, R0, R10),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7171  		BPF_ALU64_REG(BPF_SU=
B, R0, R1),				\
e4517b3637c648 Johan Almbladh     2021-08-09   7172  		BPF_EXIT_INSN(),				=
	\
e4517b3637c648 Johan Almbladh     2021-08-09   7173  	},								\
e4517b3637c648 Johan Almbladh     2021-08-09   7174  	INTERNAL,							\
e4517b3637c648 Johan Almbladh     2021-08-09   7175  	{ },								\
e4517b3637c648 Johan Almbladh     2021-08-09   7176  	{ { 0, 0 } },							\
e4517b3637c648 Johan Almbladh     2021-08-09   7177  	.stack_depth =3D 40,	=
					\
e4517b3637c648 Johan Almbladh     2021-08-09   7178  }
e4517b3637c648 Johan Almbladh     2021-08-09   7179  #define BPF_ATOMIC_OP_=
TEST3(width, op, logic, old, update, result)	\
e4517b3637c648 Johan Almbladh     2021-08-09   7180  {									\
e4517b3637c648 Johan Almbladh     2021-08-09   7181  	"BPF_ATOMIC | " #widt=
h ", " #op ": Test side effects, r0: "	\
e4517b3637c648 Johan Almbladh     2021-08-09   7182  		#old " " #logic " " =
#update " =3D " #result,		\
e4517b3637c648 Johan Almbladh     2021-08-09   7183  	.u.insns_int =3D {			=
			\
e4517b3637c648 Johan Almbladh     2021-08-09   7184  		BPF_ALU64_REG(BPF_MO=
V, R0, R10),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7185  		BPF_ALU32_IMM(BPF_MO=
V, R1, update),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7186  		BPF_ST_MEM(width, R1=
0, -40, old),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7187  		BPF_ATOMIC_OP(width,=
 op, R10, R1, -40),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7188  		BPF_ALU64_REG(BPF_SU=
B, R0, R10),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7189  		BPF_EXIT_INSN(),				=
	\
e4517b3637c648 Johan Almbladh     2021-08-09   7190  	},								\
e4517b3637c648 Johan Almbladh     2021-08-09   7191  	INTERNAL,            =
                                           \
e4517b3637c648 Johan Almbladh     2021-08-09   7192  	{ },                 =
                                           \
e4517b3637c648 Johan Almbladh     2021-08-09   7193  	{ { 0, 0 } },        =
                                           \
e4517b3637c648 Johan Almbladh     2021-08-09   7194  	.stack_depth =3D 40, =
                                             \
e4517b3637c648 Johan Almbladh     2021-08-09   7195  }
e4517b3637c648 Johan Almbladh     2021-08-09   7196  #define BPF_ATOMIC_OP_=
TEST4(width, op, logic, old, update, result)	\
e4517b3637c648 Johan Almbladh     2021-08-09   7197  {									\
e4517b3637c648 Johan Almbladh     2021-08-09   7198  	"BPF_ATOMIC | " #widt=
h ", " #op ": Test fetch: "		\
e4517b3637c648 Johan Almbladh     2021-08-09   7199  		#old " " #logic " " =
#update " =3D " #result,		\
e4517b3637c648 Johan Almbladh     2021-08-09   7200  	.u.insns_int =3D {			=
			\
e4517b3637c648 Johan Almbladh     2021-08-09   7201  		BPF_ALU32_IMM(BPF_MO=
V, R3, update),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7202  		BPF_ST_MEM(width, R1=
0, -40, old),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7203  		BPF_ATOMIC_OP(width,=
 op, R10, R3, -40),			\
e4517b3637c648 Johan Almbladh     2021-08-09   7204  		BPF_ALU64_REG(BPF_MO=
V, R0, R3),                         \
e4517b3637c648 Johan Almbladh     2021-08-09   7205  		BPF_EXIT_INSN(),				=
	\
e4517b3637c648 Johan Almbladh     2021-08-09   7206  	},								\
e4517b3637c648 Johan Almbladh     2021-08-09   7207  	INTERNAL,            =
                                           \
e4517b3637c648 Johan Almbladh     2021-08-09   7208  	{ },                 =
                                           \
e4517b3637c648 Johan Almbladh     2021-08-09   7209  	{ { 0, (op) & BPF_FET=
CH ? old : update } },			\
e4517b3637c648 Johan Almbladh     2021-08-09   7210  	.stack_depth =3D 40, =
                                             \
e4517b3637c648 Johan Almbladh     2021-08-09   7211  }
e4517b3637c648 Johan Almbladh     2021-08-09   7212  	/* BPF_ATOMIC | BPF_W=
: BPF_ADD */
e4517b3637c648 Johan Almbladh     2021-08-09   7213  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7214  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7215  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7216  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7217  	/* BPF_ATOMIC | BPF_W=
: BPF_ADD | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7218  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7219  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7220  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7221  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7222  	/* BPF_ATOMIC | BPF_D=
W: BPF_ADD */
e4517b3637c648 Johan Almbladh     2021-08-09   7223  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7224  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7225  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7226  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_ADD, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7227  	/* BPF_ATOMIC | BPF_D=
W: BPF_ADD | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7228  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7229  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7230  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7231  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_ADD | BPF_FETCH, +, 0x12, 0xab, 0xbd),
e4517b3637c648 Johan Almbladh     2021-08-09   7232  	/* BPF_ATOMIC | BPF_W=
: BPF_AND */
e4517b3637c648 Johan Almbladh     2021-08-09   7233  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7234  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7235  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7236  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7237  	/* BPF_ATOMIC | BPF_W=
: BPF_AND | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7238  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7239  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7240  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7241  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7242  	/* BPF_ATOMIC | BPF_D=
W: BPF_AND */
e4517b3637c648 Johan Almbladh     2021-08-09   7243  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7244  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7245  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7246  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_AND, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7247  	/* BPF_ATOMIC | BPF_D=
W: BPF_AND | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7248  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7249  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7250  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7251  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_AND | BPF_FETCH, &, 0x12, 0xab, 0x02),
e4517b3637c648 Johan Almbladh     2021-08-09   7252  	/* BPF_ATOMIC | BPF_W=
: BPF_OR */
e4517b3637c648 Johan Almbladh     2021-08-09   7253  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7254  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7255  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7256  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7257  	/* BPF_ATOMIC | BPF_W=
: BPF_OR | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7258  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7259  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7260  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7261  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7262  	/* BPF_ATOMIC | BPF_D=
W: BPF_OR */
e4517b3637c648 Johan Almbladh     2021-08-09   7263  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7264  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7265  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7266  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_OR, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7267  	/* BPF_ATOMIC | BPF_D=
W: BPF_OR | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7268  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7269  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7270  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7271  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_OR | BPF_FETCH, |, 0x12, 0xab, 0xbb),
e4517b3637c648 Johan Almbladh     2021-08-09   7272  	/* BPF_ATOMIC | BPF_W=
: BPF_XOR */
e4517b3637c648 Johan Almbladh     2021-08-09   7273  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7274  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7275  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7276  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7277  	/* BPF_ATOMIC | BPF_W=
: BPF_XOR | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7278  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7279  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7280  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7281  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7282  	/* BPF_ATOMIC | BPF_D=
W: BPF_XOR */
e4517b3637c648 Johan Almbladh     2021-08-09   7283  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7284  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7285  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7286  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_XOR, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7287  	/* BPF_ATOMIC | BPF_D=
W: BPF_XOR | BPF_FETCH */
e4517b3637c648 Johan Almbladh     2021-08-09   7288  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7289  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7290  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7291  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_XOR | BPF_FETCH, ^, 0x12, 0xab, 0xb9),
e4517b3637c648 Johan Almbladh     2021-08-09   7292  	/* BPF_ATOMIC | BPF_W=
: BPF_XCHG */
e4517b3637c648 Johan Almbladh     2021-08-09   7293  	BPF_ATOMIC_OP_TEST1(B=
PF_W, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7294  	BPF_ATOMIC_OP_TEST2(B=
PF_W, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7295  	BPF_ATOMIC_OP_TEST3(B=
PF_W, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7296  	BPF_ATOMIC_OP_TEST4(B=
PF_W, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7297  	/* BPF_ATOMIC | BPF_D=
W: BPF_XCHG */
e4517b3637c648 Johan Almbladh     2021-08-09   7298  	BPF_ATOMIC_OP_TEST1(B=
PF_DW, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7299  	BPF_ATOMIC_OP_TEST2(B=
PF_DW, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7300  	BPF_ATOMIC_OP_TEST3(B=
PF_DW, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7301  	BPF_ATOMIC_OP_TEST4(B=
PF_DW, BPF_XCHG, xchg, 0x12, 0xab, 0xab),
e4517b3637c648 Johan Almbladh     2021-08-09   7302  #undef BPF_ATOMIC_OP_T=
EST1
e4517b3637c648 Johan Almbladh     2021-08-09   7303  #undef BPF_ATOMIC_OP_T=
EST2
e4517b3637c648 Johan Almbladh     2021-08-09   7304  #undef BPF_ATOMIC_OP_T=
EST3
e4517b3637c648 Johan Almbladh     2021-08-09   7305  #undef BPF_ATOMIC_OP_T=
EST4
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7306  	/* BPF_ATOMIC | BPF_W=
, BPF_CMPXCHG */
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7307  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7308  		"BPF_ATOMIC | BPF_W,=
 BPF_CMPXCHG: Test successful return",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7309  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7310  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7311  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7312  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0x89abcdef),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7313  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7314  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7315  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7316  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7317  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7318  		{ { 0, 0x01234567 } =
},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7319  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7320  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7321  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7322  		"BPF_ATOMIC | BPF_W,=
 BPF_CMPXCHG: Test successful store",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7323  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7324  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7325  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7326  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0x89abcdef),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7327  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7328  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7329  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7330  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7331  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7332  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7333  		{ { 0, 0x89abcdef } =
},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7334  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7335  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7336  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7337  		"BPF_ATOMIC | BPF_W,=
 BPF_CMPXCHG: Test failure return",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7338  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7339  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7340  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x76543210),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7341  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0x89abcdef),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7342  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7343  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7344  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7345  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7346  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7347  		{ { 0, 0x01234567 } =
},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7348  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7349  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7350  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7351  		"BPF_ATOMIC | BPF_W,=
 BPF_CMPXCHG: Test failure store",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7352  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7353  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7354  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x76543210),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7355  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0x89abcdef),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7356  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7357  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7358  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7359  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7360  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7361  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7362  		{ { 0, 0x01234567 } =
},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7363  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7364  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7365  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7366  		"BPF_ATOMIC | BPF_W,=
 BPF_CMPXCHG: Test side effects",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7367  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7368  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7369  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01234567),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7370  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0x89abcdef),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7371  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7372  			BPF_ATOMIC_OP(BPF_W=
, BPF_CMPXCHG, R10, R3, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7373  			BPF_ALU32_REG(BPF_M=
OV, R0, R3),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7374  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7375  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7376  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7377  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7378  		{ { 0, 0x89abcdef } =
},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7379  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7380  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7381  	/* BPF_ATOMIC | BPF_D=
W, BPF_CMPXCHG */
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7382  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7383  		"BPF_ATOMIC | BPF_DW=
, BPF_CMPXCHG: Test successful return",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7384  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7385  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7386  			BPF_LD_IMM64(R2, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7387  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7388  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7389  			BPF_ATOMIC_OP(BPF_D=
W, BPF_CMPXCHG, R10, R2, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7390  			BPF_JMP_REG(BPF_JNE=
, R0, R1, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7391  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7392  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7393  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7394  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7395  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7396  		{ { 0, 0 } },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7397  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7398  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7399  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7400  		"BPF_ATOMIC | BPF_DW=
, BPF_CMPXCHG: Test successful store",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7401  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7402  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7403  			BPF_LD_IMM64(R2, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7404  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7405  			BPF_STX_MEM(BPF_DW,=
 R10, R0, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7406  			BPF_ATOMIC_OP(BPF_D=
W, BPF_CMPXCHG, R10, R2, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7407  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7408  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7409  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7410  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7411  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7412  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7413  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7414  		{ { 0, 0 } },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7415  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7416  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7417  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7418  		"BPF_ATOMIC | BPF_DW=
, BPF_CMPXCHG: Test failure return",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7419  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7420  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7421  			BPF_LD_IMM64(R2, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7422  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7423  			BPF_ALU64_IMM(BPF_A=
DD, R0, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7424  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7425  			BPF_ATOMIC_OP(BPF_D=
W, BPF_CMPXCHG, R10, R2, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7426  			BPF_JMP_REG(BPF_JNE=
, R0, R1, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7427  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7428  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7429  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7430  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7431  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7432  		{ { 0, 0 } },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7433  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7434  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7435  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7436  		"BPF_ATOMIC | BPF_DW=
, BPF_CMPXCHG: Test failure store",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7437  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7438  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7439  			BPF_LD_IMM64(R2, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7440  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7441  			BPF_ALU64_IMM(BPF_A=
DD, R0, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7442  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7443  			BPF_ATOMIC_OP(BPF_D=
W, BPF_CMPXCHG, R10, R2, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7444  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7445  			BPF_JMP_REG(BPF_JNE=
, R0, R1, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7446  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7447  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7448  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7449  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7450  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7451  		{ { 0, 0 } },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7452  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7453  	},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7454  	{
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7455  		"BPF_ATOMIC | BPF_DW=
, BPF_CMPXCHG: Test side effects",
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7456  		.u.insns_int =3D {
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7457  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7458  			BPF_LD_IMM64(R2, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7459  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7460  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7461  			BPF_ATOMIC_OP(BPF_D=
W, BPF_CMPXCHG, R10, R2, -40),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7462  			BPF_LD_IMM64(R0, 0x=
fecdba9876543210ULL),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7463  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7464  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7465  			BPF_EXIT_INSN(),
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7466  		},
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7467  		INTERNAL,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7468  		{ },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7469  		{ { 0, 0 } },
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7470  		.stack_depth =3D 40,
6a3b24ca489ea0 Johan Almbladh     2021-08-09   7471  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7472  	/* BPF_JMP32 | BPF_JE=
Q | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7473  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7474  		"JMP32_JEQ_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7475  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7476  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7477  			BPF_JMP32_IMM(BPF_J=
EQ, R0, 321, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7478  			BPF_JMP32_IMM(BPF_J=
EQ, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7479  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7480  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7481  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7482  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7483  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7484  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7485  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7486  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7487  		"JMP32_JEQ_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7488  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7489  			BPF_ALU32_IMM(BPF_M=
OV, R0, 12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7490  			BPF_JMP32_IMM(BPF_J=
EQ, R0, 12345678 & 0xffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7491  			BPF_JMP32_IMM(BPF_J=
EQ, R0, 12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7492  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7493  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7494  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7495  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7496  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7497  		{ { 0, 12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7498  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7499  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7500  		"JMP32_JEQ_K: negati=
ve immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7501  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7502  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7503  			BPF_JMP32_IMM(BPF_J=
EQ, R0,  123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7504  			BPF_JMP32_IMM(BPF_J=
EQ, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7505  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7506  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7507  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7508  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7509  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7510  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7511  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7512  	/* BPF_JMP32 | BPF_JE=
Q | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7513  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7514  		"JMP32_JEQ_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7515  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7516  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1234),
b55dfa85001545 Johan Almbladh     2021-08-09   7517  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4321),
b55dfa85001545 Johan Almbladh     2021-08-09   7518  			BPF_JMP32_REG(BPF_J=
EQ, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7519  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1234),
b55dfa85001545 Johan Almbladh     2021-08-09   7520  			BPF_JMP32_REG(BPF_J=
EQ, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7521  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7522  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7523  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7524  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7525  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7526  		{ { 0, 1234 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7527  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7528  	/* BPF_JMP32 | BPF_JN=
E | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7529  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7530  		"JMP32_JNE_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7531  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7532  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7533  			BPF_JMP32_IMM(BPF_J=
NE, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7534  			BPF_JMP32_IMM(BPF_J=
NE, R0, 321, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7535  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7536  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7537  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7538  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7539  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7540  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7541  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7542  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7543  		"JMP32_JNE_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7544  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7545  			BPF_ALU32_IMM(BPF_M=
OV, R0, 12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7546  			BPF_JMP32_IMM(BPF_J=
NE, R0, 12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7547  			BPF_JMP32_IMM(BPF_J=
NE, R0, 12345678 & 0xffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7548  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7549  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7550  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7551  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7552  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7553  		{ { 0, 12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7554  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7555  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7556  		"JMP32_JNE_K: negati=
ve immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7557  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7558  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7559  			BPF_JMP32_IMM(BPF_J=
NE, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7560  			BPF_JMP32_IMM(BPF_J=
NE, R0,  123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7561  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7562  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7563  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7564  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7565  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7566  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7567  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7568  	/* BPF_JMP32 | BPF_JN=
E | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7569  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7570  		"JMP32_JNE_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7571  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7572  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1234),
b55dfa85001545 Johan Almbladh     2021-08-09   7573  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1234),
b55dfa85001545 Johan Almbladh     2021-08-09   7574  			BPF_JMP32_REG(BPF_J=
NE, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7575  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4321),
b55dfa85001545 Johan Almbladh     2021-08-09   7576  			BPF_JMP32_REG(BPF_J=
NE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7577  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7578  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7579  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7580  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7581  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7582  		{ { 0, 1234 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7583  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7584  	/* BPF_JMP32 | BPF_JS=
ET | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7585  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7586  		"JMP32_JSET_K: Small=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7587  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7588  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7589  			BPF_JMP32_IMM(BPF_J=
SET, R0, 2, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7590  			BPF_JMP32_IMM(BPF_J=
SET, R0, 3, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7591  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7592  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7593  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7594  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7595  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7596  		{ { 0, 1 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7597  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7598  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7599  		"JMP32_JSET_K: Large=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7600  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7601  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x40000000),
b55dfa85001545 Johan Almbladh     2021-08-09   7602  			BPF_JMP32_IMM(BPF_J=
SET, R0, 0x3fffffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7603  			BPF_JMP32_IMM(BPF_J=
SET, R0, 0x60000000, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7604  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7605  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7606  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7607  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7608  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7609  		{ { 0, 0x40000000 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7610  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7611  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7612  		"JMP32_JSET_K: negat=
ive immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7613  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7614  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7615  			BPF_JMP32_IMM(BPF_J=
SET, R0, -1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7616  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7617  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7618  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7619  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7620  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7621  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7622  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7623  	/* BPF_JMP32 | BPF_JS=
ET | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7624  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7625  		"JMP32_JSET_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7626  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7627  			BPF_ALU32_IMM(BPF_M=
OV, R0, 8),
b55dfa85001545 Johan Almbladh     2021-08-09   7628  			BPF_ALU32_IMM(BPF_M=
OV, R1, 7),
b55dfa85001545 Johan Almbladh     2021-08-09   7629  			BPF_JMP32_REG(BPF_J=
SET, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7630  			BPF_ALU32_IMM(BPF_M=
OV, R1, 8 | 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7631  			BPF_JMP32_REG(BPF_J=
NE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7632  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7633  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7634  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7635  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7636  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7637  		{ { 0, 8 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7638  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7639  	/* BPF_JMP32 | BPF_JG=
T | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7640  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7641  		"JMP32_JGT_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7642  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7643  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7644  			BPF_JMP32_IMM(BPF_J=
GT, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7645  			BPF_JMP32_IMM(BPF_J=
GT, R0, 122, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7646  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7647  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7648  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7649  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7650  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7651  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7652  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7653  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7654  		"JMP32_JGT_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7655  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7656  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7657  			BPF_JMP32_IMM(BPF_J=
GT, R0, 0xffffffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7658  			BPF_JMP32_IMM(BPF_J=
GT, R0, 0xfffffffd, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7659  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7660  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7661  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7662  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7663  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7664  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7665  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7666  	/* BPF_JMP32 | BPF_JG=
T | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7667  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7668  		"JMP32_JGT_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7669  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7670  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7671  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
b55dfa85001545 Johan Almbladh     2021-08-09   7672  			BPF_JMP32_REG(BPF_J=
GT, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7673  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfffffffd),
b55dfa85001545 Johan Almbladh     2021-08-09   7674  			BPF_JMP32_REG(BPF_J=
GT, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7675  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7676  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7677  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7678  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7679  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7680  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7681  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7682  	/* BPF_JMP32 | BPF_JG=
E | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7683  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7684  		"JMP32_JGE_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7685  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7686  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7687  			BPF_JMP32_IMM(BPF_J=
GE, R0, 124, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7688  			BPF_JMP32_IMM(BPF_J=
GE, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7689  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7690  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7691  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7692  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7693  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7694  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7695  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7696  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7697  		"JMP32_JGE_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7698  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7699  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7700  			BPF_JMP32_IMM(BPF_J=
GE, R0, 0xffffffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7701  			BPF_JMP32_IMM(BPF_J=
GE, R0, 0xfffffffe, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7702  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7703  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7704  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7705  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7706  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7707  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7708  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7709  	/* BPF_JMP32 | BPF_JG=
E | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7710  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7711  		"JMP32_JGE_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7712  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7713  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7714  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
b55dfa85001545 Johan Almbladh     2021-08-09   7715  			BPF_JMP32_REG(BPF_J=
GE, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7716  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7717  			BPF_JMP32_REG(BPF_J=
GE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7718  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7719  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7720  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7721  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7722  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7723  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7724  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7725  	/* BPF_JMP32 | BPF_JL=
T | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7726  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7727  		"JMP32_JLT_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7728  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7729  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7730  			BPF_JMP32_IMM(BPF_J=
LT, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7731  			BPF_JMP32_IMM(BPF_J=
LT, R0, 124, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7732  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7733  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7734  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7735  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7736  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7737  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7738  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7739  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7740  		"JMP32_JLT_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7741  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7742  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7743  			BPF_JMP32_IMM(BPF_J=
LT, R0, 0xfffffffd, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7744  			BPF_JMP32_IMM(BPF_J=
LT, R0, 0xffffffff, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7745  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7746  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7747  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7748  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7749  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7750  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7751  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7752  	/* BPF_JMP32 | BPF_JL=
T | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7753  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7754  		"JMP32_JLT_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7755  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7756  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7757  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfffffffd),
b55dfa85001545 Johan Almbladh     2021-08-09   7758  			BPF_JMP32_REG(BPF_J=
LT, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7759  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
b55dfa85001545 Johan Almbladh     2021-08-09   7760  			BPF_JMP32_REG(BPF_J=
LT, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7761  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7762  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7763  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7764  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7765  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7766  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7767  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7768  	/* BPF_JMP32 | BPF_JL=
E | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7769  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7770  		"JMP32_JLE_K: Small =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7771  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7772  			BPF_ALU32_IMM(BPF_M=
OV, R0, 123),
b55dfa85001545 Johan Almbladh     2021-08-09   7773  			BPF_JMP32_IMM(BPF_J=
LE, R0, 122, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7774  			BPF_JMP32_IMM(BPF_J=
LE, R0, 123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7775  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7776  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7777  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7778  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7779  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7780  		{ { 0, 123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7781  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7782  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7783  		"JMP32_JLE_K: Large =
immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7784  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7785  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7786  			BPF_JMP32_IMM(BPF_J=
LE, R0, 0xfffffffd, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7787  			BPF_JMP32_IMM(BPF_J=
LE, R0, 0xfffffffe, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7788  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7789  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7790  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7791  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7792  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7793  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7794  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7795  	/* BPF_JMP32 | BPF_JL=
E | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7796  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7797  		"JMP32_JLE_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7798  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7799  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7800  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfffffffd),
b55dfa85001545 Johan Almbladh     2021-08-09   7801  			BPF_JMP32_REG(BPF_J=
LE, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7802  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfffffffe),
b55dfa85001545 Johan Almbladh     2021-08-09   7803  			BPF_JMP32_REG(BPF_J=
LE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7804  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7805  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7806  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7807  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7808  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7809  		{ { 0, 0xfffffffe } }
b55dfa85001545 Johan Almbladh     2021-08-09   7810  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7811  	/* BPF_JMP32 | BPF_JS=
GT | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7812  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7813  		"JMP32_JSGT_K: Small=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7814  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7815  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7816  			BPF_JMP32_IMM(BPF_J=
SGT, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7817  			BPF_JMP32_IMM(BPF_J=
SGT, R0, -124, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7818  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7819  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7820  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7821  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7822  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7823  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7824  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7825  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7826  		"JMP32_JSGT_K: Large=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7827  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7828  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7829  			BPF_JMP32_IMM(BPF_J=
SGT, R0, -12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7830  			BPF_JMP32_IMM(BPF_J=
SGT, R0, -12345679, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7831  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7832  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7833  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7834  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7835  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7836  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7837  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7838  	/* BPF_JMP32 | BPF_JS=
GT | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7839  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7840  		"JMP32_JSGT_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7841  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7842  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7843  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7844  			BPF_JMP32_REG(BPF_J=
SGT, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7845  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345679),
b55dfa85001545 Johan Almbladh     2021-08-09   7846  			BPF_JMP32_REG(BPF_J=
SGT, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7847  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7848  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7849  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7850  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7851  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7852  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7853  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7854  	/* BPF_JMP32 | BPF_JS=
GE | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7855  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7856  		"JMP32_JSGE_K: Small=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7857  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7858  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7859  			BPF_JMP32_IMM(BPF_J=
SGE, R0, -122, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7860  			BPF_JMP32_IMM(BPF_J=
SGE, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7861  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7862  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7863  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7864  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7865  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7866  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7867  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7868  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7869  		"JMP32_JSGE_K: Large=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7870  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7871  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7872  			BPF_JMP32_IMM(BPF_J=
SGE, R0, -12345677, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7873  			BPF_JMP32_IMM(BPF_J=
SGE, R0, -12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7874  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7875  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7876  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7877  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7878  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7879  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7880  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7881  	/* BPF_JMP32 | BPF_JS=
GE | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7882  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7883  		"JMP32_JSGE_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7884  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7885  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7886  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345677),
b55dfa85001545 Johan Almbladh     2021-08-09   7887  			BPF_JMP32_REG(BPF_J=
SGE, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7888  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7889  			BPF_JMP32_REG(BPF_J=
SGE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7890  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7891  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7892  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7893  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7894  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7895  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7896  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7897  	/* BPF_JMP32 | BPF_JS=
LT | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7898  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7899  		"JMP32_JSLT_K: Small=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7900  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7901  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7902  			BPF_JMP32_IMM(BPF_J=
SLT, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7903  			BPF_JMP32_IMM(BPF_J=
SLT, R0, -122, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7904  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7905  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7906  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7907  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7908  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7909  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7910  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7911  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7912  		"JMP32_JSLT_K: Large=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7913  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7914  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7915  			BPF_JMP32_IMM(BPF_J=
SLT, R0, -12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7916  			BPF_JMP32_IMM(BPF_J=
SLT, R0, -12345677, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7917  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7918  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7919  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7920  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7921  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7922  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7923  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7924  	/* BPF_JMP32 | BPF_JS=
LT | BPF_X */
b55dfa85001545 Johan Almbladh     2021-08-09   7925  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7926  		"JMP32_JSLT_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7927  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7928  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7929  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7930  			BPF_JMP32_REG(BPF_J=
SLT, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7931  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345677),
b55dfa85001545 Johan Almbladh     2021-08-09   7932  			BPF_JMP32_REG(BPF_J=
SLT, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7933  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7934  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7935  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7936  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7937  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7938  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7939  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7940  	/* BPF_JMP32 | BPF_JS=
LE | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7941  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7942  		"JMP32_JSLE_K: Small=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7943  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7944  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
b55dfa85001545 Johan Almbladh     2021-08-09   7945  			BPF_JMP32_IMM(BPF_J=
SLE, R0, -124, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7946  			BPF_JMP32_IMM(BPF_J=
SLE, R0, -123, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7947  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7948  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7949  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7950  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7951  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7952  		{ { 0, -123 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7953  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7954  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7955  		"JMP32_JSLE_K: Large=
 immediate",
b55dfa85001545 Johan Almbladh     2021-08-09   7956  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7957  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7958  			BPF_JMP32_IMM(BPF_J=
SLE, R0, -12345679, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7959  			BPF_JMP32_IMM(BPF_J=
SLE, R0, -12345678, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7960  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7961  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7962  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7963  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7964  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7965  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7966  	},
b55dfa85001545 Johan Almbladh     2021-08-09   7967  	/* BPF_JMP32 | BPF_JS=
LE | BPF_K */
b55dfa85001545 Johan Almbladh     2021-08-09   7968  	{
b55dfa85001545 Johan Almbladh     2021-08-09   7969  		"JMP32_JSLE_X",
b55dfa85001545 Johan Almbladh     2021-08-09   7970  		.u.insns_int =3D {
b55dfa85001545 Johan Almbladh     2021-08-09   7971  			BPF_ALU32_IMM(BPF_M=
OV, R0, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7972  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345679),
b55dfa85001545 Johan Almbladh     2021-08-09   7973  			BPF_JMP32_REG(BPF_J=
SLE, R0, R1, 2),
b55dfa85001545 Johan Almbladh     2021-08-09   7974  			BPF_ALU32_IMM(BPF_M=
OV, R1, -12345678),
b55dfa85001545 Johan Almbladh     2021-08-09   7975  			BPF_JMP32_REG(BPF_J=
SLE, R0, R1, 1),
b55dfa85001545 Johan Almbladh     2021-08-09   7976  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b55dfa85001545 Johan Almbladh     2021-08-09   7977  			BPF_EXIT_INSN(),
b55dfa85001545 Johan Almbladh     2021-08-09   7978  		},
b55dfa85001545 Johan Almbladh     2021-08-09   7979  		INTERNAL,
b55dfa85001545 Johan Almbladh     2021-08-09   7980  		{ },
b55dfa85001545 Johan Almbladh     2021-08-09   7981  		{ { 0, -12345678 } }
b55dfa85001545 Johan Almbladh     2021-08-09   7982  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7983  	/* BPF_JMP | BPF_EXIT=
 */
cffc642d93f932 Michael Holzheu    2015-05-11   7984  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7985  		"JMP_EXIT",
cffc642d93f932 Michael Holzheu    2015-05-11   7986  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7987  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x4711),
cffc642d93f932 Michael Holzheu    2015-05-11   7988  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   7989  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x4712),
cffc642d93f932 Michael Holzheu    2015-05-11   7990  		},
cffc642d93f932 Michael Holzheu    2015-05-11   7991  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   7992  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   7993  		{ { 0, 0x4711 } },
cffc642d93f932 Michael Holzheu    2015-05-11   7994  	},
cffc642d93f932 Michael Holzheu    2015-05-11   7995  	/* BPF_JMP | BPF_JA */
cffc642d93f932 Michael Holzheu    2015-05-11   7996  	{
cffc642d93f932 Michael Holzheu    2015-05-11   7997  		"JMP_JA: Uncondition=
al jump: if (true) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   7998  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   7999  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8000  			BPF_JMP_IMM(BPF_JA,=
 0, 0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8001  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8002  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8003  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8004  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8005  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8006  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8007  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8008  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8009  	/* BPF_JMP | BPF_JSLT=
 | BPF_K */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8010  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8011  		"JMP_JSLT_K: Signed =
jump: if (-2 < -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8012  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8013  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8014  			BPF_LD_IMM64(R1, 0x=
fffffffffffffffeLL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8015  			BPF_JMP_IMM(BPF_JSL=
T, R1, -1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8016  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8017  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8018  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8019  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8020  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8021  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8022  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8023  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8024  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8025  		"JMP_JSLT_K: Signed =
jump: if (-1 < -1) return 0",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8026  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8027  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8028  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8029  			BPF_JMP_IMM(BPF_JSL=
T, R1, -1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8030  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8031  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8032  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8033  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8034  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8035  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8036  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8037  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8038  	/* BPF_JMP | BPF_JSGT=
 | BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8039  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8040  		"JMP_JSGT_K: Signed =
jump: if (-1 > -2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8041  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8042  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8043  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   8044  			BPF_JMP_IMM(BPF_JSG=
T, R1, -2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8045  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8046  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8047  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8048  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8049  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8050  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8051  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8052  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8053  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8054  		"JMP_JSGT_K: Signed =
jump: if (-1 > -1) return 0",
cffc642d93f932 Michael Holzheu    2015-05-11   8055  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8056  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8057  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   8058  			BPF_JMP_IMM(BPF_JSG=
T, R1, -1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8059  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8060  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8061  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8062  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8063  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8064  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8065  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8066  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8067  	/* BPF_JMP | BPF_JSLE=
 | BPF_K */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8068  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8069  		"JMP_JSLE_K: Signed =
jump: if (-2 <=3D -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8070  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8071  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8072  			BPF_LD_IMM64(R1, 0x=
fffffffffffffffeLL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8073  			BPF_JMP_IMM(BPF_JSL=
E, R1, -1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8074  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8075  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8076  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8077  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8078  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8079  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8080  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8081  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8082  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8083  		"JMP_JSLE_K: Signed =
jump: if (-1 <=3D -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8084  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8085  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8086  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8087  			BPF_JMP_IMM(BPF_JSL=
E, R1, -1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8088  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8089  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8090  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8091  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8092  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8093  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8094  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8095  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8096  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8097  		"JMP_JSLE_K: Signed =
jump: value walk 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8098  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8099  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8100  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8101  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 6),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8102  			BPF_ALU64_IMM(BPF_S=
UB, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8103  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 4),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8104  			BPF_ALU64_IMM(BPF_S=
UB, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8105  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8106  			BPF_ALU64_IMM(BPF_S=
UB, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8107  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8108  			BPF_EXIT_INSN(),		/=
* bad exit */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8109  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),	/* good exit */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8110  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8111  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8112  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8113  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8114  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8115  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8116  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8117  		"JMP_JSLE_K: Signed =
jump: value walk 2",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8118  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8119  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8120  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8121  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 4),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8122  			BPF_ALU64_IMM(BPF_S=
UB, R1, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8123  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8124  			BPF_ALU64_IMM(BPF_S=
UB, R1, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8125  			BPF_JMP_IMM(BPF_JSL=
E, R1, 0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8126  			BPF_EXIT_INSN(),		/=
* bad exit */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8127  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),	/* good exit */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8128  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8129  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8130  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8131  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8132  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8133  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8134  	/* BPF_JMP | BPF_JSGE=
 | BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8135  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8136  		"JMP_JSGE_K: Signed =
jump: if (-1 >=3D -2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8137  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8138  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8139  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   8140  			BPF_JMP_IMM(BPF_JSG=
E, R1, -2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8141  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8142  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8143  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8144  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8145  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8146  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8147  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8148  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8149  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8150  		"JMP_JSGE_K: Signed =
jump: if (-1 >=3D -1) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8151  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8152  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8153  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
cffc642d93f932 Michael Holzheu    2015-05-11   8154  			BPF_JMP_IMM(BPF_JSG=
E, R1, -1, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8155  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8156  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8157  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8158  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8159  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8160  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8161  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8162  	},
791caeb084c57e David Daney        2017-05-24   8163  	{
791caeb084c57e David Daney        2017-05-24   8164  		"JMP_JSGE_K: Signed =
jump: value walk 1",
791caeb084c57e David Daney        2017-05-24   8165  		.u.insns_int =3D {
791caeb084c57e David Daney        2017-05-24   8166  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
791caeb084c57e David Daney        2017-05-24   8167  			BPF_LD_IMM64(R1, -3=
),
791caeb084c57e David Daney        2017-05-24   8168  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 6),
791caeb084c57e David Daney        2017-05-24   8169  			BPF_ALU64_IMM(BPF_A=
DD, R1, 1),
791caeb084c57e David Daney        2017-05-24   8170  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 4),
791caeb084c57e David Daney        2017-05-24   8171  			BPF_ALU64_IMM(BPF_A=
DD, R1, 1),
791caeb084c57e David Daney        2017-05-24   8172  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 2),
791caeb084c57e David Daney        2017-05-24   8173  			BPF_ALU64_IMM(BPF_A=
DD, R1, 1),
791caeb084c57e David Daney        2017-05-24   8174  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 1),
791caeb084c57e David Daney        2017-05-24   8175  			BPF_EXIT_INSN(),		/=
* bad exit */
791caeb084c57e David Daney        2017-05-24   8176  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),	/* good exit */
791caeb084c57e David Daney        2017-05-24   8177  			BPF_EXIT_INSN(),
791caeb084c57e David Daney        2017-05-24   8178  		},
791caeb084c57e David Daney        2017-05-24   8179  		INTERNAL,
791caeb084c57e David Daney        2017-05-24   8180  		{ },
791caeb084c57e David Daney        2017-05-24   8181  		{ { 0, 1 } },
791caeb084c57e David Daney        2017-05-24   8182  	},
791caeb084c57e David Daney        2017-05-24   8183  	{
791caeb084c57e David Daney        2017-05-24   8184  		"JMP_JSGE_K: Signed =
jump: value walk 2",
791caeb084c57e David Daney        2017-05-24   8185  		.u.insns_int =3D {
791caeb084c57e David Daney        2017-05-24   8186  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
791caeb084c57e David Daney        2017-05-24   8187  			BPF_LD_IMM64(R1, -3=
),
791caeb084c57e David Daney        2017-05-24   8188  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 4),
791caeb084c57e David Daney        2017-05-24   8189  			BPF_ALU64_IMM(BPF_A=
DD, R1, 2),
791caeb084c57e David Daney        2017-05-24   8190  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 2),
791caeb084c57e David Daney        2017-05-24   8191  			BPF_ALU64_IMM(BPF_A=
DD, R1, 2),
791caeb084c57e David Daney        2017-05-24   8192  			BPF_JMP_IMM(BPF_JSG=
E, R1, 0, 1),
791caeb084c57e David Daney        2017-05-24   8193  			BPF_EXIT_INSN(),		/=
* bad exit */
791caeb084c57e David Daney        2017-05-24   8194  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),	/* good exit */
791caeb084c57e David Daney        2017-05-24   8195  			BPF_EXIT_INSN(),
791caeb084c57e David Daney        2017-05-24   8196  		},
791caeb084c57e David Daney        2017-05-24   8197  		INTERNAL,
791caeb084c57e David Daney        2017-05-24   8198  		{ },
791caeb084c57e David Daney        2017-05-24   8199  		{ { 0, 1 } },
791caeb084c57e David Daney        2017-05-24   8200  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8201  	/* BPF_JMP | BPF_JGT =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8202  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8203  		"JMP_JGT_K: if (3 > =
2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8204  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8205  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8206  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8207  			BPF_JMP_IMM(BPF_JGT=
, R1, 2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8208  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8209  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8210  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8211  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8212  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8213  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8214  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8215  	},
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8216  	{
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8217  		"JMP_JGT_K: Unsigned=
 jump: if (-1 > 1) return 1",
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8218  		.u.insns_int =3D {
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8219  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8220  			BPF_LD_IMM64(R1, -1=
),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8221  			BPF_JMP_IMM(BPF_JGT=
, R1, 1, 1),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8222  			BPF_EXIT_INSN(),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8223  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8224  			BPF_EXIT_INSN(),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8225  		},
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8226  		INTERNAL,
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8227  		{ },
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8228  		{ { 0, 1 } },
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8229  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8230  	/* BPF_JMP | BPF_JLT =
| BPF_K */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8231  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8232  		"JMP_JLT_K: if (2 < =
3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8233  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8234  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8235  			BPF_LD_IMM64(R1, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8236  			BPF_JMP_IMM(BPF_JLT=
, R1, 3, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8237  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8238  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8239  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8240  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8241  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8242  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8243  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8244  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8245  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8246  		"JMP_JGT_K: Unsigned=
 jump: if (1 < -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8247  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8248  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8249  			BPF_LD_IMM64(R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8250  			BPF_JMP_IMM(BPF_JLT=
, R1, -1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8251  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8252  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8253  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8254  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8255  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8256  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8257  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8258  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8259  	/* BPF_JMP | BPF_JGE =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8260  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8261  		"JMP_JGE_K: if (3 >=
=3D 2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8262  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8263  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8264  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8265  			BPF_JMP_IMM(BPF_JGE=
, R1, 2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8266  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8267  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8268  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8269  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8270  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8271  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8272  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8273  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8274  	/* BPF_JMP | BPF_JLE =
| BPF_K */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8275  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8276  		"JMP_JLE_K: if (2 <=
=3D 3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8277  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8278  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8279  			BPF_LD_IMM64(R1, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8280  			BPF_JMP_IMM(BPF_JLE=
, R1, 3, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8281  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8282  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8283  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8284  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8285  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8286  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8287  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8288  	},
fe593844957a7c Michael Holzheu    2015-05-22   8289  	/* BPF_JMP | BPF_JGT =
| BPF_K jump backwards */
fe593844957a7c Michael Holzheu    2015-05-22   8290  	{
fe593844957a7c Michael Holzheu    2015-05-22   8291  		"JMP_JGT_K: if (3 > =
2) return 1 (jump backwards)",
fe593844957a7c Michael Holzheu    2015-05-22   8292  		.u.insns_int =3D {
fe593844957a7c Michael Holzheu    2015-05-22   8293  			BPF_JMP_IMM(BPF_JA,=
 0, 0, 2), /* goto start */
fe593844957a7c Michael Holzheu    2015-05-22   8294  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1), /* out: */
fe593844957a7c Michael Holzheu    2015-05-22   8295  			BPF_EXIT_INSN(),
fe593844957a7c Michael Holzheu    2015-05-22   8296  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0), /* start: */
fe593844957a7c Michael Holzheu    2015-05-22   8297  			BPF_LD_IMM64(R1, 3)=
, /* note: this takes 2 insns */
fe593844957a7c Michael Holzheu    2015-05-22   8298  			BPF_JMP_IMM(BPF_JGT=
, R1, 2, -6), /* goto out */
fe593844957a7c Michael Holzheu    2015-05-22   8299  			BPF_EXIT_INSN(),
fe593844957a7c Michael Holzheu    2015-05-22   8300  		},
fe593844957a7c Michael Holzheu    2015-05-22   8301  		INTERNAL,
fe593844957a7c Michael Holzheu    2015-05-22   8302  		{ },
fe593844957a7c Michael Holzheu    2015-05-22   8303  		{ { 0, 1 } },
fe593844957a7c Michael Holzheu    2015-05-22   8304  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8305  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8306  		"JMP_JGE_K: if (3 >=
=3D 3) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8307  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8308  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8309  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8310  			BPF_JMP_IMM(BPF_JGE=
, R1, 3, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8311  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8312  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8313  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8314  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8315  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8316  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8317  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8318  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8319  	/* BPF_JMP | BPF_JLT =
| BPF_K jump backwards */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8320  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8321  		"JMP_JGT_K: if (2 < =
3) return 1 (jump backwards)",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8322  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8323  			BPF_JMP_IMM(BPF_JA,=
 0, 0, 2), /* goto start */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8324  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1), /* out: */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8325  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8326  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0), /* start: */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8327  			BPF_LD_IMM64(R1, 2)=
, /* note: this takes 2 insns */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8328  			BPF_JMP_IMM(BPF_JLT=
, R1, 3, -6), /* goto out */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8329  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8330  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8331  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8332  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8333  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8334  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8335  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8336  		"JMP_JLE_K: if (3 <=
=3D 3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8337  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8338  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8339  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8340  			BPF_JMP_IMM(BPF_JLE=
, R1, 3, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8341  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8342  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8343  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8344  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8345  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8346  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8347  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8348  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8349  	/* BPF_JMP | BPF_JNE =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8350  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8351  		"JMP_JNE_K: if (3 !=
=3D 2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8352  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8353  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8354  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8355  			BPF_JMP_IMM(BPF_JNE=
, R1, 2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8356  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8357  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8358  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8359  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8360  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8361  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8362  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8363  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8364  	/* BPF_JMP | BPF_JEQ =
| BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8365  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8366  		"JMP_JEQ_K: if (3 =
=3D=3D 3) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8367  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8368  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8369  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8370  			BPF_JMP_IMM(BPF_JEQ=
, R1, 3, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8371  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8372  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8373  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8374  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8375  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8376  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8377  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8378  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8379  	/* BPF_JMP | BPF_JSET=
 | BPF_K */
cffc642d93f932 Michael Holzheu    2015-05-11   8380  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8381  		"JMP_JSET_K: if (0x3=
 & 0x2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8382  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8383  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8384  			BPF_LD_IMM64(R1, 3),
9f134c34fbce58 Naveen N. Rao      2016-04-05   8385  			BPF_JMP_IMM(BPF_JSE=
T, R1, 2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8386  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8387  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8388  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8389  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8390  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8391  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8392  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8393  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8394  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8395  		"JMP_JSET_K: if (0x3=
 & 0xffffffff) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8396  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8397  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8398  			BPF_LD_IMM64(R1, 3),
9f134c34fbce58 Naveen N. Rao      2016-04-05   8399  			BPF_JMP_IMM(BPF_JSE=
T, R1, 0xffffffff, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8400  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8401  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8402  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8403  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8404  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8405  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8406  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8407  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8408  	/* BPF_JMP | BPF_JSGT=
 | BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8409  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8410  		"JMP_JSGT_X: Signed =
jump: if (-1 > -2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8411  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8412  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8413  			BPF_LD_IMM64(R1, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8414  			BPF_LD_IMM64(R2, -2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8415  			BPF_JMP_REG(BPF_JSG=
T, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8416  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8417  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8418  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8419  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8420  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8421  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8422  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8423  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8424  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8425  		"JMP_JSGT_X: Signed =
jump: if (-1 > -1) return 0",
cffc642d93f932 Michael Holzheu    2015-05-11   8426  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8427  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8428  			BPF_LD_IMM64(R1, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8429  			BPF_LD_IMM64(R2, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8430  			BPF_JMP_REG(BPF_JSG=
T, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8431  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8432  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8433  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8434  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8435  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8436  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8437  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8438  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8439  	/* BPF_JMP | BPF_JSLT=
 | BPF_X */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8440  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8441  		"JMP_JSLT_X: Signed =
jump: if (-2 < -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8442  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8443  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8444  			BPF_LD_IMM64(R1, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8445  			BPF_LD_IMM64(R2, -2=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8446  			BPF_JMP_REG(BPF_JSL=
T, R2, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8447  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8448  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8449  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8450  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8451  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8452  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8453  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8454  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8455  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8456  		"JMP_JSLT_X: Signed =
jump: if (-1 < -1) return 0",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8457  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8458  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8459  			BPF_LD_IMM64(R1, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8460  			BPF_LD_IMM64(R2, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8461  			BPF_JMP_REG(BPF_JSL=
T, R1, R2, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8462  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8463  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8464  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8465  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8466  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8467  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8468  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8469  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8470  	/* BPF_JMP | BPF_JSGE=
 | BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8471  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8472  		"JMP_JSGE_X: Signed =
jump: if (-1 >=3D -2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8473  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8474  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8475  			BPF_LD_IMM64(R1, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8476  			BPF_LD_IMM64(R2, -2=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8477  			BPF_JMP_REG(BPF_JSG=
E, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8478  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8479  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8480  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8481  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8482  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8483  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8484  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8485  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8486  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8487  		"JMP_JSGE_X: Signed =
jump: if (-1 >=3D -1) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8488  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8489  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8490  			BPF_LD_IMM64(R1, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8491  			BPF_LD_IMM64(R2, -1=
),
cffc642d93f932 Michael Holzheu    2015-05-11   8492  			BPF_JMP_REG(BPF_JSG=
E, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8493  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8494  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8495  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8496  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8497  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8498  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8499  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8500  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8501  	/* BPF_JMP | BPF_JSLE=
 | BPF_X */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8502  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8503  		"JMP_JSLE_X: Signed =
jump: if (-2 <=3D -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8504  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8505  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8506  			BPF_LD_IMM64(R1, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8507  			BPF_LD_IMM64(R2, -2=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8508  			BPF_JMP_REG(BPF_JSL=
E, R2, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8509  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8510  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8511  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8512  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8513  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8514  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8515  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8516  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8517  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8518  		"JMP_JSLE_X: Signed =
jump: if (-1 <=3D -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8519  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8520  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8521  			BPF_LD_IMM64(R1, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8522  			BPF_LD_IMM64(R2, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8523  			BPF_JMP_REG(BPF_JSL=
E, R1, R2, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8524  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8525  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8526  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8527  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8528  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8529  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8530  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8531  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8532  	/* BPF_JMP | BPF_JGT =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8533  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8534  		"JMP_JGT_X: if (3 > =
2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8535  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8536  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8537  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8538  			BPF_LD_IMM64(R2, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   8539  			BPF_JMP_REG(BPF_JGT=
, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8540  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8541  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8542  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8543  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8544  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8545  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8546  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8547  	},
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8548  	{
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8549  		"JMP_JGT_X: Unsigned=
 jump: if (-1 > 1) return 1",
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8550  		.u.insns_int =3D {
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8551  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8552  			BPF_LD_IMM64(R1, -1=
),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8553  			BPF_LD_IMM64(R2, 1),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8554  			BPF_JMP_REG(BPF_JGT=
, R1, R2, 1),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8555  			BPF_EXIT_INSN(),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8556  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8557  			BPF_EXIT_INSN(),
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8558  		},
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8559  		INTERNAL,
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8560  		{ },
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8561  		{ { 0, 1 } },
c7395d6bd7cc1c Naveen N. Rao      2016-04-05   8562  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8563  	/* BPF_JMP | BPF_JLT =
| BPF_X */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8564  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8565  		"JMP_JLT_X: if (2 < =
3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8566  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8567  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8568  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8569  			BPF_LD_IMM64(R2, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8570  			BPF_JMP_REG(BPF_JLT=
, R2, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8571  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8572  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8573  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8574  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8575  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8576  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8577  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8578  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8579  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8580  		"JMP_JLT_X: Unsigned=
 jump: if (1 < -1) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8581  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8582  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8583  			BPF_LD_IMM64(R1, -1=
),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8584  			BPF_LD_IMM64(R2, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8585  			BPF_JMP_REG(BPF_JLT=
, R2, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8586  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8587  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8588  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8589  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8590  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8591  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8592  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8593  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8594  	/* BPF_JMP | BPF_JGE =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8595  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8596  		"JMP_JGE_X: if (3 >=
=3D 2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8597  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8598  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8599  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8600  			BPF_LD_IMM64(R2, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   8601  			BPF_JMP_REG(BPF_JGE=
, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8602  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8603  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8604  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8605  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8606  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8607  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8608  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8609  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8610  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8611  		"JMP_JGE_X: if (3 >=
=3D 3) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8612  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8613  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8614  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8615  			BPF_LD_IMM64(R2, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8616  			BPF_JMP_REG(BPF_JGE=
, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8617  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8618  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8619  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8620  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8621  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8622  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8623  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8624  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8625  	/* BPF_JMP | BPF_JLE =
| BPF_X */
92b31a9af73b3a Daniel Borkmann    2017-08-10   8626  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8627  		"JMP_JLE_X: if (2 <=
=3D 3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8628  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8629  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8630  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8631  			BPF_LD_IMM64(R2, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8632  			BPF_JMP_REG(BPF_JLE=
, R2, R1, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8633  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8634  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8635  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8636  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8637  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8638  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8639  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8640  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8641  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8642  		"JMP_JLE_X: if (3 <=
=3D 3) return 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8643  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8644  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8645  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8646  			BPF_LD_IMM64(R2, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8647  			BPF_JMP_REG(BPF_JLE=
, R1, R2, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8648  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8649  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8650  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8651  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8652  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8653  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8654  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8655  	},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8656  	{
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8657  		/* Mainly testing JI=
T + imm64 here. */
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8658  		"JMP_JGE_X: ldimm64 =
test 1",
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8659  		.u.insns_int =3D {
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8660  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8661  			BPF_LD_IMM64(R1, 3),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8662  			BPF_LD_IMM64(R2, 2),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8663  			BPF_JMP_REG(BPF_JGE=
, R1, R2, 2),
86f8e247b960d6 Geert Uytterhoeven 2017-05-03   8664  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
86f8e247b960d6 Geert Uytterhoeven 2017-05-03   8665  			BPF_LD_IMM64(R0, 0x=
eeeeeeeeeeeeeeeeULL),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8666  			BPF_EXIT_INSN(),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8667  		},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8668  		INTERNAL,
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8669  		{ },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8670  		{ { 0, 0xeeeeeeeeU }=
 },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8671  	},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8672  	{
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8673  		"JMP_JGE_X: ldimm64 =
test 2",
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8674  		.u.insns_int =3D {
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8675  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8676  			BPF_LD_IMM64(R1, 3),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8677  			BPF_LD_IMM64(R2, 2),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8678  			BPF_JMP_REG(BPF_JGE=
, R1, R2, 0),
86f8e247b960d6 Geert Uytterhoeven 2017-05-03   8679  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8680  			BPF_EXIT_INSN(),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8681  		},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8682  		INTERNAL,
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8683  		{ },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8684  		{ { 0, 0xffffffffU }=
 },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8685  	},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8686  	{
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8687  		"JMP_JGE_X: ldimm64 =
test 3",
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8688  		.u.insns_int =3D {
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8689  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8690  			BPF_LD_IMM64(R1, 3),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8691  			BPF_LD_IMM64(R2, 2),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8692  			BPF_JMP_REG(BPF_JGE=
, R1, R2, 4),
86f8e247b960d6 Geert Uytterhoeven 2017-05-03   8693  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
86f8e247b960d6 Geert Uytterhoeven 2017-05-03   8694  			BPF_LD_IMM64(R0, 0x=
eeeeeeeeeeeeeeeeULL),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8695  			BPF_EXIT_INSN(),
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8696  		},
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8697  		INTERNAL,
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8698  		{ },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8699  		{ { 0, 1 } },
ddc665a4bb4b72 Daniel Borkmann    2017-05-02   8700  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8701  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8702  		"JMP_JLE_X: ldimm64 =
test 1",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8703  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8704  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8705  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8706  			BPF_LD_IMM64(R2, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8707  			BPF_JMP_REG(BPF_JLE=
, R2, R1, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8708  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8709  			BPF_LD_IMM64(R0, 0x=
eeeeeeeeeeeeeeeeULL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8710  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8711  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8712  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8713  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8714  		{ { 0, 0xeeeeeeeeU }=
 },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8715  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8716  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8717  		"JMP_JLE_X: ldimm64 =
test 2",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8718  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8719  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8720  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8721  			BPF_LD_IMM64(R2, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8722  			BPF_JMP_REG(BPF_JLE=
, R2, R1, 0),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8723  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8724  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8725  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8726  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8727  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8728  		{ { 0, 0xffffffffU }=
 },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8729  	},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8730  	{
92b31a9af73b3a Daniel Borkmann    2017-08-10   8731  		"JMP_JLE_X: ldimm64 =
test 3",
92b31a9af73b3a Daniel Borkmann    2017-08-10   8732  		.u.insns_int =3D {
92b31a9af73b3a Daniel Borkmann    2017-08-10   8733  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8734  			BPF_LD_IMM64(R1, 3),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8735  			BPF_LD_IMM64(R2, 2),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8736  			BPF_JMP_REG(BPF_JLE=
, R2, R1, 4),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8737  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffULL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8738  			BPF_LD_IMM64(R0, 0x=
eeeeeeeeeeeeeeeeULL),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8739  			BPF_EXIT_INSN(),
92b31a9af73b3a Daniel Borkmann    2017-08-10   8740  		},
92b31a9af73b3a Daniel Borkmann    2017-08-10   8741  		INTERNAL,
92b31a9af73b3a Daniel Borkmann    2017-08-10   8742  		{ },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8743  		{ { 0, 1 } },
92b31a9af73b3a Daniel Borkmann    2017-08-10   8744  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8745  	/* BPF_JMP | BPF_JNE =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8746  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8747  		"JMP_JNE_X: if (3 !=
=3D 2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8748  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8749  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8750  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8751  			BPF_LD_IMM64(R2, 2),
cffc642d93f932 Michael Holzheu    2015-05-11   8752  			BPF_JMP_REG(BPF_JNE=
, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8753  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8754  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8755  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8756  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8757  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8758  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8759  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8760  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8761  	/* BPF_JMP | BPF_JEQ =
| BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8762  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8763  		"JMP_JEQ_X: if (3 =
=3D=3D 3) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8764  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8765  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8766  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8767  			BPF_LD_IMM64(R2, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8768  			BPF_JMP_REG(BPF_JEQ=
, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8769  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8770  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8771  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8772  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8773  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8774  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8775  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8776  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8777  	/* BPF_JMP | BPF_JSET=
 | BPF_X */
cffc642d93f932 Michael Holzheu    2015-05-11   8778  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8779  		"JMP_JSET_X: if (0x3=
 & 0x2) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8780  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8781  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8782  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8783  			BPF_LD_IMM64(R2, 2),
9f134c34fbce58 Naveen N. Rao      2016-04-05   8784  			BPF_JMP_REG(BPF_JSE=
T, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8785  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8786  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8787  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8788  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8789  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8790  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8791  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8792  	},
cffc642d93f932 Michael Holzheu    2015-05-11   8793  	{
cffc642d93f932 Michael Holzheu    2015-05-11   8794  		"JMP_JSET_X: if (0x3=
 & 0xffffffff) return 1",
cffc642d93f932 Michael Holzheu    2015-05-11   8795  		.u.insns_int =3D {
cffc642d93f932 Michael Holzheu    2015-05-11   8796  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
cffc642d93f932 Michael Holzheu    2015-05-11   8797  			BPF_LD_IMM64(R1, 3),
cffc642d93f932 Michael Holzheu    2015-05-11   8798  			BPF_LD_IMM64(R2, 0x=
ffffffff),
9f134c34fbce58 Naveen N. Rao      2016-04-05   8799  			BPF_JMP_REG(BPF_JSE=
T, R1, R2, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8800  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8801  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f932 Michael Holzheu    2015-05-11   8802  			BPF_EXIT_INSN(),
cffc642d93f932 Michael Holzheu    2015-05-11   8803  		},
cffc642d93f932 Michael Holzheu    2015-05-11   8804  		INTERNAL,
cffc642d93f932 Michael Holzheu    2015-05-11   8805  		{ },
cffc642d93f932 Michael Holzheu    2015-05-11   8806  		{ { 0, 1 } },
cffc642d93f932 Michael Holzheu    2015-05-11   8807  	},
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8808  	{
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8809  		"JMP_JA: Jump, gap, =
jump, ...",
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8810  		{ },
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8811  		CLASSIC | FLAG_NO_DA=
TA,
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8812  		{ },
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8813  		{ { 0, 0xababcbac } =
},
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8814  		.fill_helper =3D bpf=
_fill_ja,
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8815  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8816  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8817  		"BPF_MAXINSNS: Maxim=
um possible literals",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8818  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8819  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8820  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8821  		{ { 0, 0xffffffff } =
},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8822  		.fill_helper =3D bpf=
_fill_maxinsns1,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8823  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8824  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8825  		"BPF_MAXINSNS: Singl=
e literal",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8826  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8827  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8828  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8829  		{ { 0, 0xfefefefe } =
},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8830  		.fill_helper =3D bpf=
_fill_maxinsns2,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8831  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8832  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8833  		"BPF_MAXINSNS: Run/a=
dd until end",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8834  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8835  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8836  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8837  		{ { 0, 0x947bf368 } =
},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8838  		.fill_helper =3D bpf=
_fill_maxinsns3,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8839  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8840  	{
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8841  		"BPF_MAXINSNS: Too m=
any instructions",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8842  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8843  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8844  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8845  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8846  		.fill_helper =3D bpf=
_fill_maxinsns4,
09584b40674241 Yonghong Song      2018-02-02   8847  		.expected_errcode =
=3D -EINVAL,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8848  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8849  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8850  		"BPF_MAXINSNS: Very =
long jump",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8851  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8852  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8853  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8854  		{ { 0, 0xabababab } =
},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8855  		.fill_helper =3D bpf=
_fill_maxinsns5,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8856  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8857  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8858  		"BPF_MAXINSNS: Ctx h=
eavy transformations",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8859  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8860  		CLASSIC,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8861  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8862  		{
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   8863  			{  1, SKB=
_VLAN_PRESENT },
0c4b2d370514cb Micha=C5=82 Miros=C5=82aw    2018-11-10   8864  			{ 10, SKB=
_VLAN_PRESENT }
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8865  		},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8866  		.fill_helper =3D bpf=
_fill_maxinsns6,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8867  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8868  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8869  		"BPF_MAXINSNS: Call =
heavy transformations",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8870  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8871  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8872  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8873  		{ { 1, 0 }, { 10, 0 =
} },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8874  		.fill_helper =3D bpf=
_fill_maxinsns7,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8875  	},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8876  	{	/* Mainly checking =
JIT here. */
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8877  		"BPF_MAXINSNS: Jump =
heavy test",
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8878  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8879  		CLASSIC | FLAG_NO_DA=
TA,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8880  		{ },
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8881  		{ { 0, 0xffffffff } =
},
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8882  		.fill_helper =3D bpf=
_fill_maxinsns8,
a4afd37b26f4b9 Daniel Borkmann    2015-05-13   8883  	},
3b52960266a36f Daniel Borkmann    2015-05-23   8884  	{	/* Mainly checking =
JIT here. */
3b52960266a36f Daniel Borkmann    2015-05-23   8885  		"BPF_MAXINSNS: Very =
long jump backwards",
3b52960266a36f Daniel Borkmann    2015-05-23   8886  		{ },
3b52960266a36f Daniel Borkmann    2015-05-23   8887  		INTERNAL | FLAG_NO_D=
ATA,
3b52960266a36f Daniel Borkmann    2015-05-23   8888  		{ },
3b52960266a36f Daniel Borkmann    2015-05-23   8889  		{ { 0, 0xcbababab } =
},
3b52960266a36f Daniel Borkmann    2015-05-23   8890  		.fill_helper =3D bpf=
_fill_maxinsns9,
3b52960266a36f Daniel Borkmann    2015-05-23   8891  	},
3b52960266a36f Daniel Borkmann    2015-05-23   8892  	{	/* Mainly checking =
JIT here. */
3b52960266a36f Daniel Borkmann    2015-05-23   8893  		"BPF_MAXINSNS: Edge =
hopping nuthouse",
3b52960266a36f Daniel Borkmann    2015-05-23   8894  		{ },
3b52960266a36f Daniel Borkmann    2015-05-23   8895  		INTERNAL | FLAG_NO_D=
ATA,
3b52960266a36f Daniel Borkmann    2015-05-23   8896  		{ },
3b52960266a36f Daniel Borkmann    2015-05-23   8897  		{ { 0, 0xabababac } =
},
3b52960266a36f Daniel Borkmann    2015-05-23   8898  		.fill_helper =3D bpf=
_fill_maxinsns10,
3b52960266a36f Daniel Borkmann    2015-05-23   8899  	},
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8900  	{
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8901  		"BPF_MAXINSNS: Jump,=
 gap, jump, ...",
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8902  		{ },
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8903  		CLASSIC | FLAG_NO_DA=
TA,
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8904  		{ },
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8905  		{ { 0, 0xababcbac } =
},
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8906  		.fill_helper =3D bpf=
_fill_maxinsns11,
bde28bc6ad0c57 Daniel Borkmann    2015-05-26   8907  	},
be08815c5d3b25 Daniel Borkmann    2018-06-02   8908  	{
be08815c5d3b25 Daniel Borkmann    2018-06-02   8909  		"BPF_MAXINSNS: jump =
over MSH",
be08815c5d3b25 Daniel Borkmann    2018-06-02   8910  		{ },
be08815c5d3b25 Daniel Borkmann    2018-06-02   8911  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
be08815c5d3b25 Daniel Borkmann    2018-06-02   8912  		{ 0xfa, 0xfb, 0xfc, =
0xfd, },
be08815c5d3b25 Daniel Borkmann    2018-06-02   8913  		{ { 4, 0xabababab } =
},
be08815c5d3b25 Daniel Borkmann    2018-06-02   8914  		.fill_helper =3D bpf=
_fill_maxinsns12,
be08815c5d3b25 Daniel Borkmann    2018-06-02   8915  		.expected_errcode =
=3D -EINVAL,
be08815c5d3b25 Daniel Borkmann    2018-06-02   8916  	},
be08815c5d3b25 Daniel Borkmann    2018-06-02   8917  	{
be08815c5d3b25 Daniel Borkmann    2018-06-02   8918  		"BPF_MAXINSNS: exec =
all MSH",
be08815c5d3b25 Daniel Borkmann    2018-06-02   8919  		{ },
be08815c5d3b25 Daniel Borkmann    2018-06-02   8920  		CLASSIC,
be08815c5d3b25 Daniel Borkmann    2018-06-02   8921  		{ 0xfa, 0xfb, 0xfc, =
0xfd, },
be08815c5d3b25 Daniel Borkmann    2018-06-02   8922  		{ { 4, 0xababab83 } =
},
be08815c5d3b25 Daniel Borkmann    2018-06-02   8923  		.fill_helper =3D bpf=
_fill_maxinsns13,
be08815c5d3b25 Daniel Borkmann    2018-06-02   8924  	},
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8925  	{
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8926  		"BPF_MAXINSNS: ld_ab=
s+get_processor_id",
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8927  		{ },
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8928  		CLASSIC,
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8929  		{ },
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8930  		{ { 1, 0xbee } },
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8931  		.fill_helper =3D bpf=
_fill_ld_abs_get_processor_id,
4d9c5c53ac99e4 Alexei Starovoitov 2015-07-20   8932  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8933  	/*
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8934  	 * LD_IND / LD_ABS on=
 fragmented SKBs
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8935  	 */
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8936  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8937  		"LD_IND byte frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8938  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8939  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8940  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8941  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8942  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8943  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8944  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8945  		{ {0x40, 0x42} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8946  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8947  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8948  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8949  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8950  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8951  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8952  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8953  		"LD_IND halfword fra=
g",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8954  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8955  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8956  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, 0x4),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8957  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8958  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8959  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8960  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8961  		{ {0x40, 0x4344} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8962  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8963  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8964  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8965  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8966  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8967  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8968  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8969  		"LD_IND word frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8970  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8971  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8972  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, 0x8),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8973  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8974  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8975  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8976  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8977  		{ {0x40, 0x21071983}=
 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8978  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8979  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8980  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8981  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8982  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8983  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8984  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8985  		"LD_IND halfword mix=
ed head/frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8986  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8987  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8988  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, -0x1),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8989  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8990  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8991  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8992  		{ [0x3e] =3D 0x25, [=
0x3f] =3D 0x05, },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8993  		{ {0x40, 0x0519} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8994  		.frag_data =3D { 0x1=
9, 0x82 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8995  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8996  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8997  		"LD_IND word mixed h=
ead/frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8998  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   8999  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9000  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x2),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9001  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9002  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9003  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9004  		{ [0x3e] =3D 0x25, [=
0x3f] =3D 0x05, },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9005  		{ {0x40, 0x25051982}=
 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9006  		.frag_data =3D { 0x1=
9, 0x82 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9007  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9008  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9009  		"LD_ABS byte frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9010  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9011  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, 0x40),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9012  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9013  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9014  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9015  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9016  		{ {0x40, 0x42} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9017  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9018  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9019  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9020  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9021  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9022  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9023  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9024  		"LD_ABS halfword fra=
g",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9025  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9026  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x44),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9027  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9028  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9029  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9030  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9031  		{ {0x40, 0x4344} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9032  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9033  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9034  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9035  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9036  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9037  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9038  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9039  		"LD_ABS word frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9040  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9041  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x48),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9042  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9043  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9044  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9045  		{ },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9046  		{ {0x40, 0x21071983}=
 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9047  		.frag_data =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9048  			0x42, 0x00, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9049  			0x43, 0x44, 0x00, 0=
x00,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9050  			0x21, 0x07, 0x19, 0=
x83,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9051  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9052  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9053  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9054  		"LD_ABS halfword mix=
ed head/frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9055  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9056  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x3f),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9057  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9058  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9059  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9060  		{ [0x3e] =3D 0x25, [=
0x3f] =3D 0x05, },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9061  		{ {0x40, 0x0519} },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9062  		.frag_data =3D { 0x1=
9, 0x82 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9063  	},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9064  	{
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9065  		"LD_ABS word mixed h=
ead/frag",
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9066  		.u.insns =3D {
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9067  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x3e),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9068  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9069  		},
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9070  		CLASSIC | FLAG_SKB_F=
RAG,
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9071  		{ [0x3e] =3D 0x25, [=
0x3f] =3D 0x05, },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9072  		{ {0x40, 0x25051982}=
 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9073  		.frag_data =3D { 0x1=
9, 0x82 },
2cf1ad759307f4 Nicolas Schichan   2015-08-04   9074  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9075  	/*
08fcb08fc06758 Nicolas Schichan   2015-08-04   9076  	 * LD_IND / LD_ABS on=
 non fragmented SKBs
08fcb08fc06758 Nicolas Schichan   2015-08-04   9077  	 */
08fcb08fc06758 Nicolas Schichan   2015-08-04   9078  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9079  		/*
08fcb08fc06758 Nicolas Schichan   2015-08-04   9080  		 * this tests that t=
he JIT/interpreter correctly resets X
08fcb08fc06758 Nicolas Schichan   2015-08-04   9081  		 * before using it i=
n an LD_IND instruction.
08fcb08fc06758 Nicolas Schichan   2015-08-04   9082  		 */
08fcb08fc06758 Nicolas Schichan   2015-08-04   9083  		"LD_IND byte default=
 X",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9084  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9085  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, 0x1),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9086  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9087  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9088  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9089  		{ [0x1] =3D 0x42 },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9090  		{ {0x40, 0x42 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9091  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9092  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9093  		"LD_IND byte positiv=
e offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9094  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9095  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9096  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, 0x1),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9097  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9098  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9099  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9100  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9101  		{ {0x40, 0x82 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9102  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9103  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9104  		"LD_IND byte negativ=
e offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9105  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9106  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9107  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, -0x1),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9108  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9109  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9110  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9111  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9112  		{ {0x40, 0x05 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9113  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9114  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9115  		"LD_IND byte positiv=
e offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9116  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9117  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9118  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9119  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9120  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9121  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9122  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9123  		{ {0x40, 0xff } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9124  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9125  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9126  		"LD_IND byte positiv=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9127  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9128  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9129  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9130  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9131  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9132  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9133  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9134  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9135  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9136  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9137  		"LD_IND byte negativ=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9138  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9139  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9140  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, -0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9141  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9142  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9143  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9144  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9145  		{ {0x3f, 0 } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9146  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9147  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9148  		"LD_IND byte negativ=
e offset, multiple calls",
93731ef086cee9 Daniel Borkmann    2018-05-04   9149  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9150  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3b),
93731ef086cee9 Daniel Borkmann    2018-05-04   9151  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, SKF_LL_OFF + 1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9152  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, SKF_LL_OFF + 2),
93731ef086cee9 Daniel Borkmann    2018-05-04   9153  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, SKF_LL_OFF + 3),
93731ef086cee9 Daniel Borkmann    2018-05-04   9154  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_B, SKF_LL_OFF + 4),
93731ef086cee9 Daniel Borkmann    2018-05-04   9155  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9156  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9157  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9158  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9159  		{ {0x40, 0x82 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9160  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9161  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9162  		"LD_IND halfword pos=
itive offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9163  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9164  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9165  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, 0x2),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9166  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9167  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9168  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9169  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9170  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9171  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9172  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9173  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9174  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9175  		{ {0x40, 0xdd88 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9176  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9177  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9178  		"LD_IND halfword neg=
ative offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9179  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9180  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9181  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, -0x2),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9182  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9183  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9184  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9185  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9186  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9187  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9188  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9189  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9190  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9191  		{ {0x40, 0xbb66 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9192  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9193  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9194  		"LD_IND halfword una=
ligned",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9195  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9196  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9197  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, -0x1),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9198  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9199  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9200  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9201  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9202  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9203  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9204  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9205  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9206  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9207  		{ {0x40, 0x66cc } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9208  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9209  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9210  		"LD_IND halfword pos=
itive offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9211  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9212  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3d),
93731ef086cee9 Daniel Borkmann    2018-05-04   9213  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9214  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9215  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9216  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9217  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9218  		{ {0x40, 0xffff } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9219  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9220  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9221  		"LD_IND halfword pos=
itive offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9222  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9223  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9224  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9225  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9226  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9227  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9228  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9229  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9230  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9231  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9232  		"LD_IND halfword neg=
ative offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9233  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9234  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9235  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_H, -0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9236  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9237  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9238  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9239  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9240  		{ {0x3f, 0 } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9241  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9242  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9243  		"LD_IND word positiv=
e offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9244  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9245  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9246  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, 0x4),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9247  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9248  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9249  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9250  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9251  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9252  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9253  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9254  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9255  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9256  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9257  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9258  		{ {0x40, 0xee99ffaa =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9259  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9260  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9261  		"LD_IND word negativ=
e offset",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9262  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9263  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9264  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x4),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9265  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9266  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9267  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9268  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9269  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9270  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9271  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9272  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9273  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9274  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9275  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9276  		{ {0x40, 0xaa55bb66 =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9277  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9278  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9279  		"LD_IND word unalign=
ed (addr & 3 =3D=3D 2)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9280  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9281  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9282  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x2),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9283  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9284  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9285  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9286  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9287  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9288  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9289  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9290  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9291  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9292  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9293  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9294  		{ {0x40, 0xbb66cc77 =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9295  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9296  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9297  		"LD_IND word unalign=
ed (addr & 3 =3D=3D 1)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9298  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9299  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9300  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x3),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9301  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9302  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9303  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9304  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9305  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9306  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9307  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9308  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9309  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9310  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9311  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9312  		{ {0x40, 0x55bb66cc =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9313  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9314  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9315  		"LD_IND word unalign=
ed (addr & 3 =3D=3D 3)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9316  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9317  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9318  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x1),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9319  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9320  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9321  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9322  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9323  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9324  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9325  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9326  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9327  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9328  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9329  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9330  		{ {0x40, 0x66cc77dd =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9331  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9332  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9333  		"LD_IND word positiv=
e offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9334  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9335  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3b),
93731ef086cee9 Daniel Borkmann    2018-05-04   9336  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9337  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9338  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9339  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9340  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9341  		{ {0x40, 0xffffffff =
} },
93731ef086cee9 Daniel Borkmann    2018-05-04   9342  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9343  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9344  		"LD_IND word positiv=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9345  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9346  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9347  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, 0x1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9348  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9349  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9350  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9351  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9352  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9353  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9354  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9355  		"LD_IND word negativ=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9356  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9357  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9358  			BPF_STMT(BPF_LD | B=
PF_IND | BPF_W, -0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9359  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9360  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9361  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9362  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9363  		{ {0x3f, 0 } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9364  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9365  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9366  		"LD_ABS byte",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9367  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9368  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, 0x20),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9369  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9370  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9371  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9372  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9373  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9374  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9375  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9376  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9377  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9378  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9379  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9380  		{ {0x40, 0xcc } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9381  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9382  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9383  		"LD_ABS byte positiv=
e offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9384  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9385  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9386  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9387  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9388  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9389  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9390  		{ {0x40, 0xff } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9391  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9392  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9393  		"LD_ABS byte positiv=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9394  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9395  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9396  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9397  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9398  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9399  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9400  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9401  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9402  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9403  		"LD_ABS byte negativ=
e offset, out of bounds load",
93731ef086cee9 Daniel Borkmann    2018-05-04   9404  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9405  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, -1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9406  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9407  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9408  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9409  		.expected_errcode =
=3D -EINVAL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9410  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9411  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9412  		"LD_ABS byte negativ=
e offset, in bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9413  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9414  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9415  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9416  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9417  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9418  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9419  		{ {0x40, 0x82 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9420  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9421  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9422  		"LD_ABS byte negativ=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9423  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9424  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9425  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9426  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9427  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9428  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9429  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9430  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9431  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9432  		"LD_ABS byte negativ=
e offset, multiple calls",
93731ef086cee9 Daniel Borkmann    2018-05-04   9433  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9434  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9435  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3d),
93731ef086cee9 Daniel Borkmann    2018-05-04   9436  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9437  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_B, SKF_LL_OFF + 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9438  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9439  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9440  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9441  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9442  		{ {0x40, 0x82 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9443  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9444  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9445  		"LD_ABS halfword",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9446  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9447  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x22),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9448  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9449  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9450  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9451  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9452  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9453  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9454  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9455  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9456  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9457  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9458  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9459  		{ {0x40, 0xdd88 } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9460  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9461  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9462  		"LD_ABS halfword una=
ligned",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9463  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9464  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x25),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9465  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9466  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9467  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9468  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9469  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9470  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9471  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9472  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9473  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9474  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9475  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9476  		{ {0x40, 0x99ff } },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9477  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9478  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9479  		"LD_ABS halfword pos=
itive offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9480  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9481  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9482  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9483  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9484  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9485  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9486  		{ {0x40, 0xffff } },
93731ef086cee9 Daniel Borkmann    2018-05-04   9487  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9488  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9489  		"LD_ABS halfword pos=
itive offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9490  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9491  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9492  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9493  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9494  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9495  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9496  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9497  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9498  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9499  		"LD_ABS halfword neg=
ative offset, out of bounds load",
93731ef086cee9 Daniel Borkmann    2018-05-04   9500  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9501  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, -1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9502  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9503  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9504  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9505  		.expected_errcode =
=3D -EINVAL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9506  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9507  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9508  		"LD_ABS halfword neg=
ative offset, in bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9509  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9510  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, SKF_LL_OFF + 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9511  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9512  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9513  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9514  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9515  		{ {0x40, 0x1982 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9516  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9517  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9518  		"LD_ABS halfword neg=
ative offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9519  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9520  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_H, SKF_LL_OFF + 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9521  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9522  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9523  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9524  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9525  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9526  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9527  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9528  		"LD_ABS word",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9529  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9530  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x1c),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9531  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9532  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9533  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9534  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9535  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9536  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9537  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9538  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9539  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9540  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9541  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9542  		{ {0x40, 0xaa55bb66 =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9543  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9544  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9545  		"LD_ABS word unalign=
ed (addr & 3 =3D=3D 2)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9546  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9547  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x22),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9548  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9549  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9550  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9551  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9552  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9553  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9554  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9555  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9556  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9557  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9558  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9559  		{ {0x40, 0xdd88ee99 =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9560  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9561  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9562  		"LD_ABS word unalign=
ed (addr & 3 =3D=3D 1)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9563  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9564  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x21),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9565  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9566  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9567  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9568  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9569  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9570  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9571  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9572  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9573  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9574  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9575  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9576  		{ {0x40, 0x77dd88ee =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9577  	},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9578  	{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9579  		"LD_ABS word unalign=
ed (addr & 3 =3D=3D 3)",
08fcb08fc06758 Nicolas Schichan   2015-08-04   9580  		.u.insns =3D {
08fcb08fc06758 Nicolas Schichan   2015-08-04   9581  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x23),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9582  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
08fcb08fc06758 Nicolas Schichan   2015-08-04   9583  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9584  		CLASSIC,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9585  		{
08fcb08fc06758 Nicolas Schichan   2015-08-04   9586  			[0x1c] =3D 0xaa, [0=
x1d] =3D 0x55,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9587  			[0x1e] =3D 0xbb, [0=
x1f] =3D 0x66,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9588  			[0x20] =3D 0xcc, [0=
x21] =3D 0x77,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9589  			[0x22] =3D 0xdd, [0=
x23] =3D 0x88,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9590  			[0x24] =3D 0xee, [0=
x25] =3D 0x99,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9591  			[0x26] =3D 0xff, [0=
x27] =3D 0xaa,
08fcb08fc06758 Nicolas Schichan   2015-08-04   9592  		},
08fcb08fc06758 Nicolas Schichan   2015-08-04   9593  		{ {0x40, 0x88ee99ff =
} },
08fcb08fc06758 Nicolas Schichan   2015-08-04   9594  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9595  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9596  		"LD_ABS word positiv=
e offset, all ff",
93731ef086cee9 Daniel Borkmann    2018-05-04   9597  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9598  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9599  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9600  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9601  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9602  		{ [0x3c] =3D 0xff, [=
0x3d] =3D 0xff,  [0x3e] =3D 0xff, [0x3f] =3D 0xff },
93731ef086cee9 Daniel Borkmann    2018-05-04   9603  		{ {0x40, 0xffffffff =
} },
93731ef086cee9 Daniel Borkmann    2018-05-04   9604  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9605  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9606  		"LD_ABS word positiv=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9607  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9608  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9609  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9610  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9611  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9612  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9613  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9614  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9615  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9616  		"LD_ABS word negativ=
e offset, out of bounds load",
93731ef086cee9 Daniel Borkmann    2018-05-04   9617  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9618  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, -1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9619  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9620  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9621  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9622  		.expected_errcode =
=3D -EINVAL,
93731ef086cee9 Daniel Borkmann    2018-05-04   9623  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9624  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9625  		"LD_ABS word negativ=
e offset, in bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9626  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9627  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, SKF_LL_OFF + 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9628  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9629  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9630  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9631  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9632  		{ {0x40, 0x25051982 =
}, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9633  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9634  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9635  		"LD_ABS word negativ=
e offset, out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9636  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9637  			BPF_STMT(BPF_LD | B=
PF_ABS | BPF_W, SKF_LL_OFF + 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9638  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9639  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9640  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9641  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9642  		{ {0x3f, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9643  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9644  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9645  		"LDX_MSH standalone,=
 preserved A",
93731ef086cee9 Daniel Borkmann    2018-05-04   9646  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9647  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9648  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9649  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9650  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9651  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9652  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9653  		{ {0x40, 0xffeebbaa =
}, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9654  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9655  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9656  		"LDX_MSH standalone,=
 preserved A 2",
93731ef086cee9 Daniel Borkmann    2018-05-04   9657  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9658  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x175e9d63),
93731ef086cee9 Daniel Borkmann    2018-05-04   9659  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9660  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3d),
93731ef086cee9 Daniel Borkmann    2018-05-04   9661  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9662  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3f),
93731ef086cee9 Daniel Borkmann    2018-05-04   9663  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9664  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9665  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9666  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9667  		{ {0x40, 0x175e9d63 =
}, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9668  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9669  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9670  		"LDX_MSH standalone,=
 test result 1",
93731ef086cee9 Daniel Borkmann    2018-05-04   9671  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9672  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9673  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3c),
93731ef086cee9 Daniel Borkmann    2018-05-04   9674  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9675  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9676  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9677  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9678  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9679  		{ {0x40, 0x14 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9680  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9681  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9682  		"LDX_MSH standalone,=
 test result 2",
93731ef086cee9 Daniel Borkmann    2018-05-04   9683  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9684  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9685  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9686  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9687  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9688  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9689  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9690  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9691  		{ {0x40, 0x24 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9692  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9693  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9694  		"LDX_MSH standalone,=
 negative offset",
93731ef086cee9 Daniel Borkmann    2018-05-04   9695  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9696  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9697  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, -1),
93731ef086cee9 Daniel Borkmann    2018-05-04   9698  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9699  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9700  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9701  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9702  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9703  		{ {0x40, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9704  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9705  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9706  		"LDX_MSH standalone,=
 negative offset 2",
93731ef086cee9 Daniel Borkmann    2018-05-04   9707  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9708  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9709  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, SKF_LL_OFF + 0x3e),
93731ef086cee9 Daniel Borkmann    2018-05-04   9710  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9711  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9712  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9713  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9714  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9715  		{ {0x40, 0x24 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9716  	},
93731ef086cee9 Daniel Borkmann    2018-05-04   9717  	{
93731ef086cee9 Daniel Borkmann    2018-05-04   9718  		"LDX_MSH standalone,=
 out of bounds",
93731ef086cee9 Daniel Borkmann    2018-05-04   9719  		.u.insns =3D {
93731ef086cee9 Daniel Borkmann    2018-05-04   9720  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffeebbaa),
93731ef086cee9 Daniel Borkmann    2018-05-04   9721  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 0x40),
93731ef086cee9 Daniel Borkmann    2018-05-04   9722  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9723  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
93731ef086cee9 Daniel Borkmann    2018-05-04   9724  		},
93731ef086cee9 Daniel Borkmann    2018-05-04   9725  		CLASSIC,
93731ef086cee9 Daniel Borkmann    2018-05-04   9726  		{ [0x3c] =3D 0x25, [=
0x3d] =3D 0x05,  [0x3e] =3D 0x19, [0x3f] =3D 0x82 },
93731ef086cee9 Daniel Borkmann    2018-05-04   9727  		{ {0x40, 0 }, },
93731ef086cee9 Daniel Borkmann    2018-05-04   9728  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9729  	/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9730  	 * verify that the in=
terpreter or JIT correctly sets A and X
86bf1721b22636 Nicolas Schichan   2015-08-04   9731  	 * to 0.
86bf1721b22636 Nicolas Schichan   2015-08-04   9732  	 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9733  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9734  		"ADD default X",
86bf1721b22636 Nicolas Schichan   2015-08-04   9735  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9736  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9737  			 * A =3D 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9738  			 * A =3D A + X
86bf1721b22636 Nicolas Schichan   2015-08-04   9739  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9740  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9741  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9742  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9743  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9744  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9745  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9746  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9747  		{ {0x1, 0x42 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9748  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9749  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9750  		"ADD default A",
86bf1721b22636 Nicolas Schichan   2015-08-04   9751  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9752  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9753  			 * A =3D A + 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9754  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9755  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9756  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9757  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9758  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9759  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9760  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9761  		{ {0x1, 0x42 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9762  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9763  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9764  		"SUB default X",
86bf1721b22636 Nicolas Schichan   2015-08-04   9765  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9766  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9767  			 * A =3D 0x66
86bf1721b22636 Nicolas Schichan   2015-08-04   9768  			 * A =3D A - X
86bf1721b22636 Nicolas Schichan   2015-08-04   9769  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9770  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9771  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x66),
86bf1721b22636 Nicolas Schichan   2015-08-04   9772  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9773  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9774  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9775  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9776  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9777  		{ {0x1, 0x66 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9778  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9779  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9780  		"SUB default A",
86bf1721b22636 Nicolas Schichan   2015-08-04   9781  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9782  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9783  			 * A =3D A - -0x66
86bf1721b22636 Nicolas Schichan   2015-08-04   9784  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9785  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9786  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_K, -0x66),
86bf1721b22636 Nicolas Schichan   2015-08-04   9787  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9788  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9789  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9790  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9791  		{ {0x1, 0x66 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9792  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9793  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9794  		"MUL default X",
86bf1721b22636 Nicolas Schichan   2015-08-04   9795  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9796  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9797  			 * A =3D 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9798  			 * A =3D A * X
86bf1721b22636 Nicolas Schichan   2015-08-04   9799  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9800  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9801  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9802  			BPF_STMT(BPF_ALU | =
BPF_MUL | BPF_X, 0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9803  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9804  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9805  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9806  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9807  		{ {0x1, 0x0 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9808  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9809  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9810  		"MUL default A",
86bf1721b22636 Nicolas Schichan   2015-08-04   9811  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9812  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9813  			 * A =3D A * 0x66
86bf1721b22636 Nicolas Schichan   2015-08-04   9814  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9815  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9816  			BPF_STMT(BPF_ALU | =
BPF_MUL | BPF_K, 0x66),
86bf1721b22636 Nicolas Schichan   2015-08-04   9817  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9818  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9819  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9820  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9821  		{ {0x1, 0x0 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9822  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9823  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9824  		"DIV default X",
86bf1721b22636 Nicolas Schichan   2015-08-04   9825  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9826  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9827  			 * A =3D 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9828  			 * A =3D A / X ; th=
is halt the filter execution if X is 0
86bf1721b22636 Nicolas Schichan   2015-08-04   9829  			 * ret 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9830  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9831  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9832  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_X, 0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9833  			BPF_STMT(BPF_RET | =
BPF_K, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9834  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9835  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9836  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9837  		{ {0x1, 0x0 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9838  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9839  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9840  		"DIV default A",
86bf1721b22636 Nicolas Schichan   2015-08-04   9841  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9842  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9843  			 * A =3D A / 1
86bf1721b22636 Nicolas Schichan   2015-08-04   9844  			 * ret A
86bf1721b22636 Nicolas Schichan   2015-08-04   9845  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9846  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 0x1),
86bf1721b22636 Nicolas Schichan   2015-08-04   9847  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9848  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9849  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9850  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9851  		{ {0x1, 0x0 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9852  	},
d4e4bc16102cb1 Yang Shi           2015-11-04   9853  	{
d4e4bc16102cb1 Yang Shi           2015-11-04   9854  		"MOD default X",
d4e4bc16102cb1 Yang Shi           2015-11-04   9855  		.u.insns =3D {
d4e4bc16102cb1 Yang Shi           2015-11-04   9856  			/*
d4e4bc16102cb1 Yang Shi           2015-11-04   9857  			 * A =3D 0x42
d4e4bc16102cb1 Yang Shi           2015-11-04   9858  			 * A =3D A mod X ; =
this halt the filter execution if X is 0
d4e4bc16102cb1 Yang Shi           2015-11-04   9859  			 * ret 0x42
d4e4bc16102cb1 Yang Shi           2015-11-04   9860  			 */
d4e4bc16102cb1 Yang Shi           2015-11-04   9861  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x42),
d4e4bc16102cb1 Yang Shi           2015-11-04   9862  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_X, 0),
d4e4bc16102cb1 Yang Shi           2015-11-04   9863  			BPF_STMT(BPF_RET | =
BPF_K, 0x42),
d4e4bc16102cb1 Yang Shi           2015-11-04   9864  		},
d4e4bc16102cb1 Yang Shi           2015-11-04   9865  		CLASSIC | FLAG_NO_DA=
TA,
d4e4bc16102cb1 Yang Shi           2015-11-04   9866  		{},
d4e4bc16102cb1 Yang Shi           2015-11-04   9867  		{ {0x1, 0x0 } },
d4e4bc16102cb1 Yang Shi           2015-11-04   9868  	},
d4e4bc16102cb1 Yang Shi           2015-11-04   9869  	{
d4e4bc16102cb1 Yang Shi           2015-11-04   9870  		"MOD default A",
d4e4bc16102cb1 Yang Shi           2015-11-04   9871  		.u.insns =3D {
d4e4bc16102cb1 Yang Shi           2015-11-04   9872  			/*
d4e4bc16102cb1 Yang Shi           2015-11-04   9873  			 * A =3D A mod 1
d4e4bc16102cb1 Yang Shi           2015-11-04   9874  			 * ret A
d4e4bc16102cb1 Yang Shi           2015-11-04   9875  			 */
d4e4bc16102cb1 Yang Shi           2015-11-04   9876  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_K, 0x1),
d4e4bc16102cb1 Yang Shi           2015-11-04   9877  			BPF_STMT(BPF_RET | =
BPF_A, 0x0),
d4e4bc16102cb1 Yang Shi           2015-11-04   9878  		},
d4e4bc16102cb1 Yang Shi           2015-11-04   9879  		CLASSIC | FLAG_NO_DA=
TA,
d4e4bc16102cb1 Yang Shi           2015-11-04   9880  		{},
d4e4bc16102cb1 Yang Shi           2015-11-04   9881  		{ {0x1, 0x0 } },
d4e4bc16102cb1 Yang Shi           2015-11-04   9882  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9883  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9884  		"JMP EQ default A",
86bf1721b22636 Nicolas Schichan   2015-08-04   9885  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9886  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9887  			 * cmp A, 0x0, 0, 1
86bf1721b22636 Nicolas Schichan   2015-08-04   9888  			 * ret 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9889  			 * ret 0x66
86bf1721b22636 Nicolas Schichan   2015-08-04   9890  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9891  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x0, 0, 1),
86bf1721b22636 Nicolas Schichan   2015-08-04   9892  			BPF_STMT(BPF_RET | =
BPF_K, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9893  			BPF_STMT(BPF_RET | =
BPF_K, 0x66),
86bf1721b22636 Nicolas Schichan   2015-08-04   9894  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9895  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9896  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9897  		{ {0x1, 0x42 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9898  	},
86bf1721b22636 Nicolas Schichan   2015-08-04   9899  	{
86bf1721b22636 Nicolas Schichan   2015-08-04   9900  		"JMP EQ default X",
86bf1721b22636 Nicolas Schichan   2015-08-04   9901  		.u.insns =3D {
86bf1721b22636 Nicolas Schichan   2015-08-04   9902  			/*
86bf1721b22636 Nicolas Schichan   2015-08-04   9903  			 * A =3D 0x0
86bf1721b22636 Nicolas Schichan   2015-08-04   9904  			 * cmp A, X, 0, 1
86bf1721b22636 Nicolas Schichan   2015-08-04   9905  			 * ret 0x42
86bf1721b22636 Nicolas Schichan   2015-08-04   9906  			 * ret 0x66
86bf1721b22636 Nicolas Schichan   2015-08-04   9907  			 */
86bf1721b22636 Nicolas Schichan   2015-08-04   9908  			BPF_STMT(BPF_LD | B=
PF_IMM, 0x0),
86bf1721b22636 Nicolas Schichan   2015-08-04   9909  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_X, 0x0, 0, 1),
86bf1721b22636 Nicolas Schichan   2015-08-04   9910  			BPF_STMT(BPF_RET | =
BPF_K, 0x42),
86bf1721b22636 Nicolas Schichan   2015-08-04   9911  			BPF_STMT(BPF_RET | =
BPF_K, 0x66),
86bf1721b22636 Nicolas Schichan   2015-08-04   9912  		},
86bf1721b22636 Nicolas Schichan   2015-08-04   9913  		CLASSIC | FLAG_NO_DA=
TA,
86bf1721b22636 Nicolas Schichan   2015-08-04   9914  		{},
86bf1721b22636 Nicolas Schichan   2015-08-04   9915  		{ {0x1, 0x42 } },
86bf1721b22636 Nicolas Schichan   2015-08-04   9916  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9917  	/* Checking interpret=
er vs JIT wrt signed extended imms. */
fcd1c917719548 Daniel Borkmann    2018-01-20   9918  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9919  		"JNE signed compare,=
 test 1",
fcd1c917719548 Daniel Borkmann    2018-01-20   9920  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9921  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfefbbc12),
fcd1c917719548 Daniel Borkmann    2018-01-20   9922  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0xffff0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9923  			BPF_MOV64_REG(R2, R=
1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9924  			BPF_ALU64_REG(BPF_A=
ND, R2, R3),
fcd1c917719548 Daniel Borkmann    2018-01-20   9925  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9926  			BPF_JMP_IMM(BPF_JNE=
, R2, -17104896, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9927  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20   9928  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20   9929  		},
fcd1c917719548 Daniel Borkmann    2018-01-20   9930  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20   9931  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20   9932  		{ { 0, 1 } },
fcd1c917719548 Daniel Borkmann    2018-01-20   9933  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9934  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9935  		"JNE signed compare,=
 test 2",
fcd1c917719548 Daniel Borkmann    2018-01-20   9936  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9937  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfefbbc12),
fcd1c917719548 Daniel Borkmann    2018-01-20   9938  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0xffff0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9939  			BPF_MOV64_REG(R2, R=
1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9940  			BPF_ALU64_REG(BPF_A=
ND, R2, R3),
fcd1c917719548 Daniel Borkmann    2018-01-20   9941  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9942  			BPF_JMP_IMM(BPF_JNE=
, R2, 0xfefb0000, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9943  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20   9944  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20   9945  		},
fcd1c917719548 Daniel Borkmann    2018-01-20   9946  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20   9947  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20   9948  		{ { 0, 1 } },
fcd1c917719548 Daniel Borkmann    2018-01-20   9949  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9950  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9951  		"JNE signed compare,=
 test 3",
fcd1c917719548 Daniel Borkmann    2018-01-20   9952  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9953  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xfefbbc12),
fcd1c917719548 Daniel Borkmann    2018-01-20   9954  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0xffff0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9955  			BPF_ALU32_IMM(BPF_M=
OV, R4, 0xfefb0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9956  			BPF_MOV64_REG(R2, R=
1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9957  			BPF_ALU64_REG(BPF_A=
ND, R2, R3),
fcd1c917719548 Daniel Borkmann    2018-01-20   9958  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9959  			BPF_JMP_REG(BPF_JNE=
, R2, R4, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9960  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20   9961  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20   9962  		},
fcd1c917719548 Daniel Borkmann    2018-01-20   9963  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20   9964  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20   9965  		{ { 0, 2 } },
fcd1c917719548 Daniel Borkmann    2018-01-20   9966  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9967  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9968  		"JNE signed compare,=
 test 4",
fcd1c917719548 Daniel Borkmann    2018-01-20   9969  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9970  			BPF_LD_IMM64(R1, -1=
7104896),
fcd1c917719548 Daniel Borkmann    2018-01-20   9971  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9972  			BPF_JMP_IMM(BPF_JNE=
, R1, -17104896, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9973  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20   9974  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20   9975  		},
fcd1c917719548 Daniel Borkmann    2018-01-20   9976  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20   9977  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20   9978  		{ { 0, 2 } },
fcd1c917719548 Daniel Borkmann    2018-01-20   9979  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9980  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9981  		"JNE signed compare,=
 test 5",
fcd1c917719548 Daniel Borkmann    2018-01-20   9982  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9983  			BPF_LD_IMM64(R1, 0x=
fefb0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9984  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9985  			BPF_JMP_IMM(BPF_JNE=
, R1, 0xfefb0000, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9986  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20   9987  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20   9988  		},
fcd1c917719548 Daniel Borkmann    2018-01-20   9989  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20   9990  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20   9991  		{ { 0, 1 } },
fcd1c917719548 Daniel Borkmann    2018-01-20   9992  	},
fcd1c917719548 Daniel Borkmann    2018-01-20   9993  	{
fcd1c917719548 Daniel Borkmann    2018-01-20   9994  		"JNE signed compare,=
 test 6",
fcd1c917719548 Daniel Borkmann    2018-01-20   9995  		.u.insns_int =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20   9996  			BPF_LD_IMM64(R1, 0x=
7efb0000),
fcd1c917719548 Daniel Borkmann    2018-01-20   9997  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9998  			BPF_JMP_IMM(BPF_JNE=
, R1, 0x7efb0000, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20   9999  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20  10000  			BPF_EXIT_INSN(),
fcd1c917719548 Daniel Borkmann    2018-01-20  10001  		},
fcd1c917719548 Daniel Borkmann    2018-01-20  10002  		INTERNAL,
fcd1c917719548 Daniel Borkmann    2018-01-20  10003  		{ },
fcd1c917719548 Daniel Borkmann    2018-01-20  10004  		{ { 0, 2 } },
fcd1c917719548 Daniel Borkmann    2018-01-20  10005  	},
fcd1c917719548 Daniel Borkmann    2018-01-20  10006  	{
fcd1c917719548 Daniel Borkmann    2018-01-20  10007  		"JNE signed compare,=
 test 7",
fcd1c917719548 Daniel Borkmann    2018-01-20  10008  		.u.insns =3D {
fcd1c917719548 Daniel Borkmann    2018-01-20  10009  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffff0000),
fcd1c917719548 Daniel Borkmann    2018-01-20  10010  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
fcd1c917719548 Daniel Borkmann    2018-01-20  10011  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xfefbbc12),
fcd1c917719548 Daniel Borkmann    2018-01-20  10012  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_X, 0),
fcd1c917719548 Daniel Borkmann    2018-01-20  10013  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0xfefb0000, 1, 0),
fcd1c917719548 Daniel Borkmann    2018-01-20  10014  			BPF_STMT(BPF_RET | =
BPF_K, 1),
fcd1c917719548 Daniel Borkmann    2018-01-20  10015  			BPF_STMT(BPF_RET | =
BPF_K, 2),
fcd1c917719548 Daniel Borkmann    2018-01-20  10016  		},
fcd1c917719548 Daniel Borkmann    2018-01-20  10017  		CLASSIC | FLAG_NO_DA=
TA,
fcd1c917719548 Daniel Borkmann    2018-01-20  10018  		{},
fcd1c917719548 Daniel Borkmann    2018-01-20  10019  		{ { 0, 2 } },
fcd1c917719548 Daniel Borkmann    2018-01-20  10020  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10021  	/* Exhaustive test of=
 ALU64 shift operations */
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10022  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10023  		"ALU64_LSH_K: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10024  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10025  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10026  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10027  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10028  		.fill_helper =3D bpf=
_fill_alu_lsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10029  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10030  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10031  		"ALU64_RSH_K: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10032  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10033  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10034  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10035  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10036  		.fill_helper =3D bpf=
_fill_alu_rsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10037  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10038  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10039  		"ALU64_ARSH_K: all s=
hift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10040  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10041  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10042  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10043  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10044  		.fill_helper =3D bpf=
_fill_alu_arsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10045  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10046  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10047  		"ALU64_LSH_X: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10048  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10049  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10050  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10051  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10052  		.fill_helper =3D bpf=
_fill_alu_lsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10053  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10054  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10055  		"ALU64_RSH_X: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10056  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10057  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10058  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10059  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10060  		.fill_helper =3D bpf=
_fill_alu_rsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10061  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10062  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10063  		"ALU64_ARSH_X: all s=
hift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10064  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10065  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10066  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10067  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10068  		.fill_helper =3D bpf=
_fill_alu_arsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10069  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10070  	/* Exhaustive test of=
 ALU32 shift operations */
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10071  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10072  		"ALU32_LSH_K: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10073  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10074  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10075  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10076  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10077  		.fill_helper =3D bpf=
_fill_alu32_lsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10078  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10079  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10080  		"ALU32_RSH_K: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10081  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10082  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10083  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10084  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10085  		.fill_helper =3D bpf=
_fill_alu32_rsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10086  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10087  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10088  		"ALU32_ARSH_K: all s=
hift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10089  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10090  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10091  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10092  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10093  		.fill_helper =3D bpf=
_fill_alu32_arsh_imm,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10094  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10095  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10096  		"ALU32_LSH_X: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10097  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10098  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10099  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10100  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10101  		.fill_helper =3D bpf=
_fill_alu32_lsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10102  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10103  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10104  		"ALU32_RSH_X: all sh=
ift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10105  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10106  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10107  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10108  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10109  		.fill_helper =3D bpf=
_fill_alu32_rsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10110  	},
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10111  	{
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10112  		"ALU32_ARSH_X: all s=
hift values",
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10113  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10114  		INTERNAL | FLAG_NO_D=
ATA,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10115  		{ },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10116  		{ { 0, 1 } },
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10117  		.fill_helper =3D bpf=
_fill_alu32_arsh_reg,
ceabc579a2dfd5 Johan Almbladh     2021-09-02  10118  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10119  	/* ALU64 immediate ma=
gnitudes */
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10120  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10121  		"ALU64_MOV_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10122  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10123  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10124  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10125  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10126  		.fill_helper =3D bpf=
_fill_alu64_mov_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10127  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10128  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10129  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10130  		"ALU64_AND_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10131  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10132  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10133  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10134  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10135  		.fill_helper =3D bpf=
_fill_alu64_and_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10136  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10137  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10138  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10139  		"ALU64_OR_K: all imm=
ediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10140  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10141  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10142  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10143  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10144  		.fill_helper =3D bpf=
_fill_alu64_or_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10145  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10146  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10147  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10148  		"ALU64_XOR_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10149  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10150  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10151  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10152  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10153  		.fill_helper =3D bpf=
_fill_alu64_xor_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10154  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10155  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10156  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10157  		"ALU64_ADD_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10158  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10159  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10160  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10161  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10162  		.fill_helper =3D bpf=
_fill_alu64_add_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10163  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10164  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10165  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10166  		"ALU64_SUB_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10167  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10168  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10169  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10170  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10171  		.fill_helper =3D bpf=
_fill_alu64_sub_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10172  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10173  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10174  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10175  		"ALU64_MUL_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10176  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10177  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10178  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10179  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10180  		.fill_helper =3D bpf=
_fill_alu64_mul_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10181  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10182  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10183  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10184  		"ALU64_DIV_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10185  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10186  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10187  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10188  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10189  		.fill_helper =3D bpf=
_fill_alu64_div_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10190  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10191  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10192  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10193  		"ALU64_MOD_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10194  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10195  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10196  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10197  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10198  		.fill_helper =3D bpf=
_fill_alu64_mod_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10199  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10200  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10201  	/* ALU32 immediate ma=
gnitudes */
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10202  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10203  		"ALU32_MOV_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10204  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10205  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10206  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10207  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10208  		.fill_helper =3D bpf=
_fill_alu32_mov_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10209  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10210  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10211  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10212  		"ALU32_AND_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10213  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10214  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10215  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10216  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10217  		.fill_helper =3D bpf=
_fill_alu32_and_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10218  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10219  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10220  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10221  		"ALU32_OR_K: all imm=
ediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10222  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10223  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10224  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10225  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10226  		.fill_helper =3D bpf=
_fill_alu32_or_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10227  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10228  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10229  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10230  		"ALU32_XOR_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10231  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10232  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10233  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10234  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10235  		.fill_helper =3D bpf=
_fill_alu32_xor_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10236  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10237  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10238  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10239  		"ALU32_ADD_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10240  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10241  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10242  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10243  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10244  		.fill_helper =3D bpf=
_fill_alu32_add_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10245  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10246  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10247  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10248  		"ALU32_SUB_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10249  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10250  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10251  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10252  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10253  		.fill_helper =3D bpf=
_fill_alu32_sub_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10254  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10255  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10256  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10257  		"ALU32_MUL_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10258  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10259  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10260  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10261  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10262  		.fill_helper =3D bpf=
_fill_alu32_mul_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10263  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10264  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10265  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10266  		"ALU32_DIV_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10267  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10268  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10269  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10270  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10271  		.fill_helper =3D bpf=
_fill_alu32_div_imm,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10272  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10273  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10274  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10275  		"ALU32_MOD_K: all im=
mediate value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10276  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10277  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10278  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10279  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10280  		.fill_helper =3D bpf=
_fill_alu32_mod_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10281  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10282  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10283  	/* ALU64 register mag=
nitudes */
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10284  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10285  		"ALU64_MOV_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10286  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10287  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10288  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10289  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10290  		.fill_helper =3D bpf=
_fill_alu64_mov_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10291  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10292  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10293  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10294  		"ALU64_AND_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10295  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10296  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10297  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10298  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10299  		.fill_helper =3D bpf=
_fill_alu64_and_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10300  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10301  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10302  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10303  		"ALU64_OR_X: all reg=
ister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10304  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10305  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10306  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10307  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10308  		.fill_helper =3D bpf=
_fill_alu64_or_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10309  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10310  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10311  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10312  		"ALU64_XOR_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10313  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10314  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10315  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10316  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10317  		.fill_helper =3D bpf=
_fill_alu64_xor_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10318  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10319  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10320  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10321  		"ALU64_ADD_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10322  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10323  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10324  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10325  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10326  		.fill_helper =3D bpf=
_fill_alu64_add_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10327  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10328  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10329  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10330  		"ALU64_SUB_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10331  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10332  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10333  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10334  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10335  		.fill_helper =3D bpf=
_fill_alu64_sub_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10336  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10337  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10338  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10339  		"ALU64_MUL_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10340  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10341  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10342  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10343  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10344  		.fill_helper =3D bpf=
_fill_alu64_mul_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10345  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10346  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10347  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10348  		"ALU64_DIV_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10349  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10350  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10351  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10352  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10353  		.fill_helper =3D bpf=
_fill_alu64_div_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10354  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10355  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10356  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10357  		"ALU64_MOD_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10358  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10359  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10360  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10361  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10362  		.fill_helper =3D bpf=
_fill_alu64_mod_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10363  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10364  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10365  	/* ALU32 register mag=
nitudes */
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10366  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10367  		"ALU32_MOV_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10368  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10369  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10370  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10371  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10372  		.fill_helper =3D bpf=
_fill_alu32_mov_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10373  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10374  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10375  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10376  		"ALU32_AND_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10377  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10378  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10379  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10380  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10381  		.fill_helper =3D bpf=
_fill_alu32_and_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10382  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10383  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10384  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10385  		"ALU32_OR_X: all reg=
ister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10386  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10387  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10388  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10389  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10390  		.fill_helper =3D bpf=
_fill_alu32_or_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10391  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10392  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10393  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10394  		"ALU32_XOR_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10395  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10396  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10397  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10398  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10399  		.fill_helper =3D bpf=
_fill_alu32_xor_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10400  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10401  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10402  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10403  		"ALU32_ADD_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10404  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10405  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10406  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10407  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10408  		.fill_helper =3D bpf=
_fill_alu32_add_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10409  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10410  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10411  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10412  		"ALU32_SUB_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10413  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10414  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10415  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10416  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10417  		.fill_helper =3D bpf=
_fill_alu32_sub_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10418  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10419  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10420  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10421  		"ALU32_MUL_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10422  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10423  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10424  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10425  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10426  		.fill_helper =3D bpf=
_fill_alu32_mul_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10427  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10428  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10429  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10430  		"ALU32_DIV_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10431  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10432  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10433  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10434  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10435  		.fill_helper =3D bpf=
_fill_alu32_div_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10436  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10437  	},
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10438  	{
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10439  		"ALU32_MOD_X: all re=
gister value magnitudes",
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10440  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10441  		INTERNAL | FLAG_NO_D=
ATA,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10442  		{ },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10443  		{ { 0, 1 } },
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10444  		.fill_helper =3D bpf=
_fill_alu32_mod_reg,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10445  		.nr_testruns =3D NR_=
PATTERN_RUNS,
c3eecf482bd5f1 Johan Almbladh     2021-09-02  10446  	},
36b493e5eb7466 Johan Almbladh     2021-09-02  10447  	/* LD_IMM64 immediate=
 magnitudes */
36b493e5eb7466 Johan Almbladh     2021-09-02  10448  	{
36b493e5eb7466 Johan Almbladh     2021-09-02  10449  		"LD_IMM64: all immed=
iate value magnitudes",
36b493e5eb7466 Johan Almbladh     2021-09-02  10450  		{ },
36b493e5eb7466 Johan Almbladh     2021-09-02  10451  		INTERNAL | FLAG_NO_D=
ATA,
36b493e5eb7466 Johan Almbladh     2021-09-02  10452  		{ },
36b493e5eb7466 Johan Almbladh     2021-09-02  10453  		{ { 0, 1 } },
36b493e5eb7466 Johan Almbladh     2021-09-02  10454  		.fill_helper =3D bpf=
_fill_ld_imm64,
36b493e5eb7466 Johan Almbladh     2021-09-02  10455  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10456  	/* JMP immediate magn=
itudes */
6b8730939624e5 Johan Almbladh     2021-09-02  10457  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10458  		"JMP_JSET_K: all imm=
ediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10459  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10460  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10461  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10462  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10463  		.fill_helper =3D bpf=
_fill_jmp_jset_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10464  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10465  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10466  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10467  		"JMP_JEQ_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10468  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10469  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10470  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10471  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10472  		.fill_helper =3D bpf=
_fill_jmp_jeq_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10473  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10474  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10475  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10476  		"JMP_JNE_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10477  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10478  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10479  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10480  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10481  		.fill_helper =3D bpf=
_fill_jmp_jne_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10482  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10483  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10484  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10485  		"JMP_JGT_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10486  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10487  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10488  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10489  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10490  		.fill_helper =3D bpf=
_fill_jmp_jgt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10491  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10492  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10493  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10494  		"JMP_JGE_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10495  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10496  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10497  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10498  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10499  		.fill_helper =3D bpf=
_fill_jmp_jge_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10500  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10501  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10502  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10503  		"JMP_JLT_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10504  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10505  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10506  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10507  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10508  		.fill_helper =3D bpf=
_fill_jmp_jlt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10509  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10510  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10511  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10512  		"JMP_JLE_K: all imme=
diate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10513  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10514  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10515  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10516  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10517  		.fill_helper =3D bpf=
_fill_jmp_jle_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10518  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10519  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10520  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10521  		"JMP_JSGT_K: all imm=
ediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10522  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10523  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10524  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10525  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10526  		.fill_helper =3D bpf=
_fill_jmp_jsgt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10527  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10528  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10529  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10530  		"JMP_JSGE_K: all imm=
ediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10531  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10532  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10533  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10534  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10535  		.fill_helper =3D bpf=
_fill_jmp_jsge_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10536  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10537  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10538  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10539  		"JMP_JSLT_K: all imm=
ediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10540  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10541  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10542  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10543  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10544  		.fill_helper =3D bpf=
_fill_jmp_jslt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10545  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10546  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10547  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10548  		"JMP_JSLE_K: all imm=
ediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10549  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10550  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10551  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10552  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10553  		.fill_helper =3D bpf=
_fill_jmp_jsle_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10554  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10555  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10556  	/* JMP register magni=
tudes */
6b8730939624e5 Johan Almbladh     2021-09-02  10557  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10558  		"JMP_JSET_X: all reg=
ister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10559  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10560  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10561  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10562  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10563  		.fill_helper =3D bpf=
_fill_jmp_jset_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10564  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10565  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10566  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10567  		"JMP_JEQ_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10568  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10569  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10570  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10571  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10572  		.fill_helper =3D bpf=
_fill_jmp_jeq_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10573  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10574  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10575  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10576  		"JMP_JNE_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10577  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10578  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10579  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10580  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10581  		.fill_helper =3D bpf=
_fill_jmp_jne_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10582  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10583  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10584  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10585  		"JMP_JGT_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10586  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10587  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10588  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10589  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10590  		.fill_helper =3D bpf=
_fill_jmp_jgt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10591  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10592  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10593  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10594  		"JMP_JGE_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10595  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10596  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10597  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10598  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10599  		.fill_helper =3D bpf=
_fill_jmp_jge_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10600  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10601  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10602  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10603  		"JMP_JLT_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10604  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10605  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10606  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10607  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10608  		.fill_helper =3D bpf=
_fill_jmp_jlt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10609  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10610  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10611  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10612  		"JMP_JLE_X: all regi=
ster value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10613  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10614  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10615  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10616  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10617  		.fill_helper =3D bpf=
_fill_jmp_jle_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10618  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10619  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10620  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10621  		"JMP_JSGT_X: all reg=
ister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10622  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10623  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10624  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10625  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10626  		.fill_helper =3D bpf=
_fill_jmp_jsgt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10627  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10628  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10629  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10630  		"JMP_JSGE_X: all reg=
ister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10631  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10632  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10633  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10634  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10635  		.fill_helper =3D bpf=
_fill_jmp_jsge_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10636  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10637  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10638  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10639  		"JMP_JSLT_X: all reg=
ister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10640  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10641  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10642  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10643  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10644  		.fill_helper =3D bpf=
_fill_jmp_jslt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10645  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10646  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10647  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10648  		"JMP_JSLE_X: all reg=
ister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10649  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10650  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10651  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10652  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10653  		.fill_helper =3D bpf=
_fill_jmp_jsle_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10654  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10655  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10656  	/* JMP32 immediate ma=
gnitudes */
6b8730939624e5 Johan Almbladh     2021-09-02  10657  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10658  		"JMP32_JSET_K: all i=
mmediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10659  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10660  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10661  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10662  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10663  		.fill_helper =3D bpf=
_fill_jmp32_jset_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10664  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10665  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10666  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10667  		"JMP32_JEQ_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10668  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10669  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10670  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10671  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10672  		.fill_helper =3D bpf=
_fill_jmp32_jeq_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10673  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10674  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10675  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10676  		"JMP32_JNE_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10677  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10678  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10679  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10680  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10681  		.fill_helper =3D bpf=
_fill_jmp32_jne_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10682  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10683  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10684  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10685  		"JMP32_JGT_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10686  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10687  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10688  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10689  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10690  		.fill_helper =3D bpf=
_fill_jmp32_jgt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10691  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10692  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10693  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10694  		"JMP32_JGE_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10695  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10696  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10697  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10698  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10699  		.fill_helper =3D bpf=
_fill_jmp32_jge_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10700  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10701  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10702  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10703  		"JMP32_JLT_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10704  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10705  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10706  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10707  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10708  		.fill_helper =3D bpf=
_fill_jmp32_jlt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10709  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10710  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10711  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10712  		"JMP32_JLE_K: all im=
mediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10713  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10714  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10715  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10716  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10717  		.fill_helper =3D bpf=
_fill_jmp32_jle_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10718  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10719  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10720  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10721  		"JMP32_JSGT_K: all i=
mmediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10722  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10723  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10724  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10725  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10726  		.fill_helper =3D bpf=
_fill_jmp32_jsgt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10727  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10728  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10729  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10730  		"JMP32_JSGE_K: all i=
mmediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10731  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10732  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10733  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10734  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10735  		.fill_helper =3D bpf=
_fill_jmp32_jsge_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10736  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10737  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10738  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10739  		"JMP32_JSLT_K: all i=
mmediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10740  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10741  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10742  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10743  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10744  		.fill_helper =3D bpf=
_fill_jmp32_jslt_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10745  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10746  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10747  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10748  		"JMP32_JSLE_K: all i=
mmediate value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10749  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10750  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10751  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10752  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10753  		.fill_helper =3D bpf=
_fill_jmp32_jsle_imm,
6b8730939624e5 Johan Almbladh     2021-09-02  10754  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10755  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10756  	/* JMP32 register mag=
nitudes */
6b8730939624e5 Johan Almbladh     2021-09-02  10757  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10758  		"JMP32_JSET_X: all r=
egister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10759  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10760  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10761  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10762  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10763  		.fill_helper =3D bpf=
_fill_jmp32_jset_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10764  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10765  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10766  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10767  		"JMP32_JEQ_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10768  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10769  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10770  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10771  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10772  		.fill_helper =3D bpf=
_fill_jmp32_jeq_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10773  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10774  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10775  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10776  		"JMP32_JNE_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10777  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10778  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10779  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10780  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10781  		.fill_helper =3D bpf=
_fill_jmp32_jne_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10782  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10783  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10784  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10785  		"JMP32_JGT_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10786  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10787  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10788  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10789  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10790  		.fill_helper =3D bpf=
_fill_jmp32_jgt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10791  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10792  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10793  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10794  		"JMP32_JGE_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10795  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10796  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10797  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10798  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10799  		.fill_helper =3D bpf=
_fill_jmp32_jge_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10800  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10801  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10802  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10803  		"JMP32_JLT_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10804  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10805  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10806  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10807  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10808  		.fill_helper =3D bpf=
_fill_jmp32_jlt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10809  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10810  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10811  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10812  		"JMP32_JLE_X: all re=
gister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10813  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10814  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10815  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10816  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10817  		.fill_helper =3D bpf=
_fill_jmp32_jle_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10818  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10819  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10820  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10821  		"JMP32_JSGT_X: all r=
egister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10822  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10823  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10824  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10825  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10826  		.fill_helper =3D bpf=
_fill_jmp32_jsgt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10827  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10828  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10829  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10830  		"JMP32_JSGE_X: all r=
egister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10831  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10832  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10833  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10834  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10835  		.fill_helper =3D bpf=
_fill_jmp32_jsge_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10836  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10837  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10838  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10839  		"JMP32_JSLT_X: all r=
egister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10840  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10841  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10842  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10843  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10844  		.fill_helper =3D bpf=
_fill_jmp32_jslt_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10845  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10846  	},
6b8730939624e5 Johan Almbladh     2021-09-02  10847  	{
6b8730939624e5 Johan Almbladh     2021-09-02  10848  		"JMP32_JSLE_X: all r=
egister value magnitudes",
6b8730939624e5 Johan Almbladh     2021-09-02  10849  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10850  		INTERNAL | FLAG_NO_D=
ATA,
6b8730939624e5 Johan Almbladh     2021-09-02  10851  		{ },
6b8730939624e5 Johan Almbladh     2021-09-02  10852  		{ { 0, 1 } },
6b8730939624e5 Johan Almbladh     2021-09-02  10853  		.fill_helper =3D bpf=
_fill_jmp32_jsle_reg,
6b8730939624e5 Johan Almbladh     2021-09-02  10854  		.nr_testruns =3D NR_=
PATTERN_RUNS,
6b8730939624e5 Johan Almbladh     2021-09-02  10855  	},
31973d209ca680 Johan Almbladh     2021-09-02  10856  	/* Conditional jumps =
with constant decision */
31973d209ca680 Johan Almbladh     2021-09-02  10857  	{
31973d209ca680 Johan Almbladh     2021-09-02  10858  		"JMP_JSET_K: imm =3D=
 0 -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  10859  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10860  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10861  			BPF_JMP_IMM(BPF_JSE=
T, R1, 0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10862  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10863  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10864  		},
31973d209ca680 Johan Almbladh     2021-09-02  10865  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10866  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10867  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  10868  	},
31973d209ca680 Johan Almbladh     2021-09-02  10869  	{
31973d209ca680 Johan Almbladh     2021-09-02  10870  		"JMP_JLT_K: imm =3D =
0 -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  10871  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10872  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10873  			BPF_JMP_IMM(BPF_JLT=
, R1, 0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10874  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10875  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10876  		},
31973d209ca680 Johan Almbladh     2021-09-02  10877  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10878  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10879  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  10880  	},
31973d209ca680 Johan Almbladh     2021-09-02  10881  	{
31973d209ca680 Johan Almbladh     2021-09-02  10882  		"JMP_JGE_K: imm =3D =
0 -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10883  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10884  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10885  			BPF_JMP_IMM(BPF_JGE=
, R1, 0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10886  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10887  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10888  		},
31973d209ca680 Johan Almbladh     2021-09-02  10889  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10890  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10891  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10892  	},
31973d209ca680 Johan Almbladh     2021-09-02  10893  	{
31973d209ca680 Johan Almbladh     2021-09-02  10894  		"JMP_JGT_K: imm =3D =
0xffffffff -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  10895  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10896  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10897  			BPF_JMP_IMM(BPF_JGT=
, R1, U32_MAX, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10898  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10899  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10900  		},
31973d209ca680 Johan Almbladh     2021-09-02  10901  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10902  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10903  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  10904  	},
31973d209ca680 Johan Almbladh     2021-09-02  10905  	{
31973d209ca680 Johan Almbladh     2021-09-02  10906  		"JMP_JLE_K: imm =3D =
0xffffffff -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10907  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10908  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10909  			BPF_JMP_IMM(BPF_JLE=
, R1, U32_MAX, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10910  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10911  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10912  		},
31973d209ca680 Johan Almbladh     2021-09-02  10913  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10914  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10915  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10916  	},
31973d209ca680 Johan Almbladh     2021-09-02  10917  	{
31973d209ca680 Johan Almbladh     2021-09-02  10918  		"JMP32_JSGT_K: imm =
=3D 0x7fffffff -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  10919  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10920  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10921  			BPF_JMP32_IMM(BPF_J=
SGT, R1, S32_MAX, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10922  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10923  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10924  		},
31973d209ca680 Johan Almbladh     2021-09-02  10925  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10926  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10927  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  10928  	},
31973d209ca680 Johan Almbladh     2021-09-02  10929  	{
31973d209ca680 Johan Almbladh     2021-09-02  10930  		"JMP32_JSGE_K: imm =
=3D -0x80000000 -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10931  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10932  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10933  			BPF_JMP32_IMM(BPF_J=
SGE, R1, S32_MIN, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10934  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10935  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10936  		},
31973d209ca680 Johan Almbladh     2021-09-02  10937  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10938  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10939  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10940  	},
31973d209ca680 Johan Almbladh     2021-09-02  10941  	{
31973d209ca680 Johan Almbladh     2021-09-02  10942  		"JMP32_JSLT_K: imm =
=3D -0x80000000 -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  10943  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10944  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10945  			BPF_JMP32_IMM(BPF_J=
SLT, R1, S32_MIN, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10946  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10947  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10948  		},
31973d209ca680 Johan Almbladh     2021-09-02  10949  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10950  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10951  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  10952  	},
31973d209ca680 Johan Almbladh     2021-09-02  10953  	{
31973d209ca680 Johan Almbladh     2021-09-02  10954  		"JMP32_JSLE_K: imm =
=3D 0x7fffffff -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10955  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10956  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10957  			BPF_JMP32_IMM(BPF_J=
SLE, R1, S32_MAX, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10958  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10959  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10960  		},
31973d209ca680 Johan Almbladh     2021-09-02  10961  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10962  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10963  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10964  	},
31973d209ca680 Johan Almbladh     2021-09-02  10965  	{
31973d209ca680 Johan Almbladh     2021-09-02  10966  		"JMP_JEQ_X: dst =3D =
src -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10967  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10968  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10969  			BPF_JMP_REG(BPF_JEQ=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10970  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10971  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10972  		},
31973d209ca680 Johan Almbladh     2021-09-02  10973  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10974  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10975  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10976  	},
31973d209ca680 Johan Almbladh     2021-09-02  10977  	{
31973d209ca680 Johan Almbladh     2021-09-02  10978  		"JMP_JGE_X: dst =3D =
src -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10979  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10980  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10981  			BPF_JMP_REG(BPF_JGE=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10982  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10983  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10984  		},
31973d209ca680 Johan Almbladh     2021-09-02  10985  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10986  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10987  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  10988  	},
31973d209ca680 Johan Almbladh     2021-09-02  10989  	{
31973d209ca680 Johan Almbladh     2021-09-02  10990  		"JMP_JLE_X: dst =3D =
src -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  10991  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  10992  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10993  			BPF_JMP_REG(BPF_JLE=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  10994  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  10995  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  10996  		},
31973d209ca680 Johan Almbladh     2021-09-02  10997  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  10998  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  10999  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  11000  	},
31973d209ca680 Johan Almbladh     2021-09-02  11001  	{
31973d209ca680 Johan Almbladh     2021-09-02  11002  		"JMP_JSGE_X: dst =3D=
 src -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  11003  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11004  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11005  			BPF_JMP_REG(BPF_JSG=
E, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11006  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11007  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11008  		},
31973d209ca680 Johan Almbladh     2021-09-02  11009  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11010  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11011  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  11012  	},
31973d209ca680 Johan Almbladh     2021-09-02  11013  	{
31973d209ca680 Johan Almbladh     2021-09-02  11014  		"JMP_JSLE_X: dst =3D=
 src -> always taken",
31973d209ca680 Johan Almbladh     2021-09-02  11015  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11016  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11017  			BPF_JMP_REG(BPF_JSL=
E, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11018  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11019  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11020  		},
31973d209ca680 Johan Almbladh     2021-09-02  11021  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11022  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11023  		{ { 0, 1 } },
31973d209ca680 Johan Almbladh     2021-09-02  11024  	},
31973d209ca680 Johan Almbladh     2021-09-02  11025  	{
31973d209ca680 Johan Almbladh     2021-09-02  11026  		"JMP_JNE_X: dst =3D =
src -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  11027  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11028  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11029  			BPF_JMP_REG(BPF_JNE=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11030  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11031  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11032  		},
31973d209ca680 Johan Almbladh     2021-09-02  11033  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11034  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11035  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  11036  	},
31973d209ca680 Johan Almbladh     2021-09-02  11037  	{
31973d209ca680 Johan Almbladh     2021-09-02  11038  		"JMP_JGT_X: dst =3D =
src -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  11039  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11040  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11041  			BPF_JMP_REG(BPF_JGT=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11042  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11043  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11044  		},
31973d209ca680 Johan Almbladh     2021-09-02  11045  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11046  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11047  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  11048  	},
31973d209ca680 Johan Almbladh     2021-09-02  11049  	{
31973d209ca680 Johan Almbladh     2021-09-02  11050  		"JMP_JLT_X: dst =3D =
src -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  11051  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11052  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11053  			BPF_JMP_REG(BPF_JLT=
, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11054  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11055  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11056  		},
31973d209ca680 Johan Almbladh     2021-09-02  11057  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11058  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11059  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  11060  	},
31973d209ca680 Johan Almbladh     2021-09-02  11061  	{
31973d209ca680 Johan Almbladh     2021-09-02  11062  		"JMP_JSGT_X: dst =3D=
 src -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  11063  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11064  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11065  			BPF_JMP_REG(BPF_JSG=
T, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11066  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11067  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11068  		},
31973d209ca680 Johan Almbladh     2021-09-02  11069  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11070  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11071  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  11072  	},
31973d209ca680 Johan Almbladh     2021-09-02  11073  	{
31973d209ca680 Johan Almbladh     2021-09-02  11074  		"JMP_JSLT_X: dst =3D=
 src -> never taken",
31973d209ca680 Johan Almbladh     2021-09-02  11075  		.u.insns_int =3D {
31973d209ca680 Johan Almbladh     2021-09-02  11076  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11077  			BPF_JMP_REG(BPF_JSL=
T, R1, R1, 1),
31973d209ca680 Johan Almbladh     2021-09-02  11078  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
31973d209ca680 Johan Almbladh     2021-09-02  11079  			BPF_EXIT_INSN(),
31973d209ca680 Johan Almbladh     2021-09-02  11080  		},
31973d209ca680 Johan Almbladh     2021-09-02  11081  		INTERNAL | FLAG_NO_D=
ATA,
31973d209ca680 Johan Almbladh     2021-09-02  11082  		{ },
31973d209ca680 Johan Almbladh     2021-09-02  11083  		{ { 0, 0 } },
31973d209ca680 Johan Almbladh     2021-09-02  11084  	},
f771f59673c9d8 Johan Almbladh     2021-09-02  11085  	/* Short relative jum=
ps */
f771f59673c9d8 Johan Almbladh     2021-09-02  11086  	{
f771f59673c9d8 Johan Almbladh     2021-09-02  11087  		"Short relative jump=
: offset=3D0",
f771f59673c9d8 Johan Almbladh     2021-09-02  11088  		.u.insns_int =3D {
f771f59673c9d8 Johan Almbladh     2021-09-02  11089  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11090  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11091  			BPF_EXIT_INSN(),
f771f59673c9d8 Johan Almbladh     2021-09-02  11092  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11093  		},
f771f59673c9d8 Johan Almbladh     2021-09-02  11094  		INTERNAL | FLAG_NO_D=
ATA | FLAG_VERIFIER_ZEXT,
f771f59673c9d8 Johan Almbladh     2021-09-02  11095  		{ },
f771f59673c9d8 Johan Almbladh     2021-09-02  11096  		{ { 0, 0 } },
f771f59673c9d8 Johan Almbladh     2021-09-02  11097  	},
f771f59673c9d8 Johan Almbladh     2021-09-02  11098  	{
f771f59673c9d8 Johan Almbladh     2021-09-02  11099  		"Short relative jump=
: offset=3D1",
f771f59673c9d8 Johan Almbladh     2021-09-02  11100  		.u.insns_int =3D {
f771f59673c9d8 Johan Almbladh     2021-09-02  11101  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11102  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11103  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11104  			BPF_EXIT_INSN(),
f771f59673c9d8 Johan Almbladh     2021-09-02  11105  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11106  		},
f771f59673c9d8 Johan Almbladh     2021-09-02  11107  		INTERNAL | FLAG_NO_D=
ATA | FLAG_VERIFIER_ZEXT,
f771f59673c9d8 Johan Almbladh     2021-09-02  11108  		{ },
f771f59673c9d8 Johan Almbladh     2021-09-02  11109  		{ { 0, 0 } },
f771f59673c9d8 Johan Almbladh     2021-09-02  11110  	},
f771f59673c9d8 Johan Almbladh     2021-09-02  11111  	{
f771f59673c9d8 Johan Almbladh     2021-09-02  11112  		"Short relative jump=
: offset=3D2",
f771f59673c9d8 Johan Almbladh     2021-09-02  11113  		.u.insns_int =3D {
f771f59673c9d8 Johan Almbladh     2021-09-02  11114  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11115  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 2),
f771f59673c9d8 Johan Almbladh     2021-09-02  11116  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11117  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11118  			BPF_EXIT_INSN(),
f771f59673c9d8 Johan Almbladh     2021-09-02  11119  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11120  		},
f771f59673c9d8 Johan Almbladh     2021-09-02  11121  		INTERNAL | FLAG_NO_D=
ATA | FLAG_VERIFIER_ZEXT,
f771f59673c9d8 Johan Almbladh     2021-09-02  11122  		{ },
f771f59673c9d8 Johan Almbladh     2021-09-02  11123  		{ { 0, 0 } },
f771f59673c9d8 Johan Almbladh     2021-09-02  11124  	},
f771f59673c9d8 Johan Almbladh     2021-09-02  11125  	{
f771f59673c9d8 Johan Almbladh     2021-09-02  11126  		"Short relative jump=
: offset=3D3",
f771f59673c9d8 Johan Almbladh     2021-09-02  11127  		.u.insns_int =3D {
f771f59673c9d8 Johan Almbladh     2021-09-02  11128  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11129  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 3),
f771f59673c9d8 Johan Almbladh     2021-09-02  11130  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11131  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11132  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11133  			BPF_EXIT_INSN(),
f771f59673c9d8 Johan Almbladh     2021-09-02  11134  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11135  		},
f771f59673c9d8 Johan Almbladh     2021-09-02  11136  		INTERNAL | FLAG_NO_D=
ATA | FLAG_VERIFIER_ZEXT,
f771f59673c9d8 Johan Almbladh     2021-09-02  11137  		{ },
f771f59673c9d8 Johan Almbladh     2021-09-02  11138  		{ { 0, 0 } },
f771f59673c9d8 Johan Almbladh     2021-09-02  11139  	},
f771f59673c9d8 Johan Almbladh     2021-09-02  11140  	{
f771f59673c9d8 Johan Almbladh     2021-09-02  11141  		"Short relative jump=
: offset=3D4",
f771f59673c9d8 Johan Almbladh     2021-09-02  11142  		.u.insns_int =3D {
f771f59673c9d8 Johan Almbladh     2021-09-02  11143  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
f771f59673c9d8 Johan Almbladh     2021-09-02  11144  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 4),
f771f59673c9d8 Johan Almbladh     2021-09-02  11145  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11146  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11147  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11148  			BPF_ALU32_IMM(BPF_A=
DD, R0, 1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11149  			BPF_EXIT_INSN(),
f771f59673c9d8 Johan Almbladh     2021-09-02  11150  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
f771f59673c9d8 Johan Almbladh     2021-09-02  11151  		},
f771f59673c9d8 Johan Almbladh     2021-09-02  11152  		INTERNAL | FLAG_NO_D=
ATA | FLAG_VERIFIER_ZEXT,
f771f59673c9d8 Johan Almbladh     2021-09-02  11153  		{ },
f771f59673c9d8 Johan Almbladh     2021-09-02  11154  		{ { 0, 0 } },
f771f59673c9d8 Johan Almbladh     2021-09-02  11155  	},
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11156  	/* Conditional branch=
 conversions */
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11157  	{
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11158  		"Long conditional ju=
mp: taken at runtime",
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11159  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11160  		INTERNAL | FLAG_NO_D=
ATA,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11161  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11162  		{ { 0, 1 } },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11163  		.fill_helper =3D bpf=
_fill_max_jmp_taken,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11164  	},
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11165  	{
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11166  		"Long conditional ju=
mp: not taken at runtime",
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11167  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11168  		INTERNAL | FLAG_NO_D=
ATA,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11169  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11170  		{ { 0, 2 } },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11171  		.fill_helper =3D bpf=
_fill_max_jmp_not_taken,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11172  	},
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11173  	{
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11174  		"Long conditional ju=
mp: always taken, known at JIT time",
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11175  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11176  		INTERNAL | FLAG_NO_D=
ATA,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11177  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11178  		{ { 0, 1 } },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11179  		.fill_helper =3D bpf=
_fill_max_jmp_always_taken,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11180  	},
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11181  	{
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11182  		"Long conditional ju=
mp: never taken, known at JIT time",
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11183  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11184  		INTERNAL | FLAG_NO_D=
ATA,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11185  		{ },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11186  		{ { 0, 2 } },
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11187  		.fill_helper =3D bpf=
_fill_max_jmp_never_taken,
0b0177d5a1dd1d Johan Almbladh     2021-09-02  11188  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11189  	/* Staggered jump seq=
uences, immediate */
e1016e1586ff9b Johan Almbladh     2021-09-02  11190  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11191  		"Staggered jumps: JM=
P_JA",
e1016e1586ff9b Johan Almbladh     2021-09-02  11192  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11193  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11194  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11195  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11196  		.fill_helper =3D bpf=
_fill_staggered_ja,
e1016e1586ff9b Johan Almbladh     2021-09-02  11197  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11198  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11199  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11200  		"Staggered jumps: JM=
P_JEQ_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11201  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11202  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11203  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11204  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11205  		.fill_helper =3D bpf=
_fill_staggered_jeq_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11206  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11207  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11208  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11209  		"Staggered jumps: JM=
P_JNE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11210  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11211  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11212  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11213  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11214  		.fill_helper =3D bpf=
_fill_staggered_jne_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11215  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11216  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11217  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11218  		"Staggered jumps: JM=
P_JSET_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11219  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11220  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11221  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11222  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11223  		.fill_helper =3D bpf=
_fill_staggered_jset_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11224  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11225  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11226  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11227  		"Staggered jumps: JM=
P_JGT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11228  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11229  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11230  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11231  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11232  		.fill_helper =3D bpf=
_fill_staggered_jgt_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11233  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11234  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11235  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11236  		"Staggered jumps: JM=
P_JGE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11237  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11238  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11239  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11240  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11241  		.fill_helper =3D bpf=
_fill_staggered_jge_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11242  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11243  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11244  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11245  		"Staggered jumps: JM=
P_JLT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11246  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11247  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11248  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11249  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11250  		.fill_helper =3D bpf=
_fill_staggered_jlt_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11251  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11252  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11253  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11254  		"Staggered jumps: JM=
P_JLE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11255  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11256  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11257  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11258  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11259  		.fill_helper =3D bpf=
_fill_staggered_jle_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11260  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11261  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11262  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11263  		"Staggered jumps: JM=
P_JSGT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11264  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11265  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11266  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11267  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11268  		.fill_helper =3D bpf=
_fill_staggered_jsgt_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11269  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11270  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11271  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11272  		"Staggered jumps: JM=
P_JSGE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11273  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11274  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11275  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11276  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11277  		.fill_helper =3D bpf=
_fill_staggered_jsge_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11278  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11279  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11280  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11281  		"Staggered jumps: JM=
P_JSLT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11282  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11283  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11284  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11285  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11286  		.fill_helper =3D bpf=
_fill_staggered_jslt_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11287  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11288  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11289  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11290  		"Staggered jumps: JM=
P_JSLE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11291  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11292  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11293  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11294  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11295  		.fill_helper =3D bpf=
_fill_staggered_jsle_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11296  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11297  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11298  	/* Staggered jump seq=
uences, register */
e1016e1586ff9b Johan Almbladh     2021-09-02  11299  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11300  		"Staggered jumps: JM=
P_JEQ_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11301  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11302  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11303  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11304  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11305  		.fill_helper =3D bpf=
_fill_staggered_jeq_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11306  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11307  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11308  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11309  		"Staggered jumps: JM=
P_JNE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11310  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11311  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11312  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11313  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11314  		.fill_helper =3D bpf=
_fill_staggered_jne_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11315  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11316  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11317  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11318  		"Staggered jumps: JM=
P_JSET_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11319  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11320  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11321  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11322  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11323  		.fill_helper =3D bpf=
_fill_staggered_jset_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11324  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11325  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11326  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11327  		"Staggered jumps: JM=
P_JGT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11328  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11329  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11330  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11331  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11332  		.fill_helper =3D bpf=
_fill_staggered_jgt_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11333  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11334  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11335  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11336  		"Staggered jumps: JM=
P_JGE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11337  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11338  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11339  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11340  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11341  		.fill_helper =3D bpf=
_fill_staggered_jge_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11342  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11343  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11344  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11345  		"Staggered jumps: JM=
P_JLT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11346  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11347  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11348  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11349  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11350  		.fill_helper =3D bpf=
_fill_staggered_jlt_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11351  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11352  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11353  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11354  		"Staggered jumps: JM=
P_JLE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11355  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11356  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11357  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11358  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11359  		.fill_helper =3D bpf=
_fill_staggered_jle_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11360  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11361  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11362  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11363  		"Staggered jumps: JM=
P_JSGT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11364  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11365  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11366  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11367  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11368  		.fill_helper =3D bpf=
_fill_staggered_jsgt_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11369  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11370  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11371  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11372  		"Staggered jumps: JM=
P_JSGE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11373  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11374  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11375  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11376  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11377  		.fill_helper =3D bpf=
_fill_staggered_jsge_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11378  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11379  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11380  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11381  		"Staggered jumps: JM=
P_JSLT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11382  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11383  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11384  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11385  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11386  		.fill_helper =3D bpf=
_fill_staggered_jslt_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11387  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11388  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11389  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11390  		"Staggered jumps: JM=
P_JSLE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11391  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11392  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11393  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11394  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11395  		.fill_helper =3D bpf=
_fill_staggered_jsle_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11396  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11397  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11398  	/* Staggered jump seq=
uences, JMP32 immediate */
e1016e1586ff9b Johan Almbladh     2021-09-02  11399  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11400  		"Staggered jumps: JM=
P32_JEQ_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11401  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11402  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11403  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11404  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11405  		.fill_helper =3D bpf=
_fill_staggered_jeq32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11406  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11407  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11408  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11409  		"Staggered jumps: JM=
P32_JNE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11410  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11411  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11412  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11413  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11414  		.fill_helper =3D bpf=
_fill_staggered_jne32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11415  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11416  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11417  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11418  		"Staggered jumps: JM=
P32_JSET_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11419  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11420  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11421  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11422  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11423  		.fill_helper =3D bpf=
_fill_staggered_jset32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11424  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11425  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11426  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11427  		"Staggered jumps: JM=
P32_JGT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11428  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11429  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11430  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11431  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11432  		.fill_helper =3D bpf=
_fill_staggered_jgt32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11433  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11434  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11435  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11436  		"Staggered jumps: JM=
P32_JGE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11437  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11438  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11439  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11440  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11441  		.fill_helper =3D bpf=
_fill_staggered_jge32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11442  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11443  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11444  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11445  		"Staggered jumps: JM=
P32_JLT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11446  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11447  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11448  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11449  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11450  		.fill_helper =3D bpf=
_fill_staggered_jlt32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11451  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11452  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11453  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11454  		"Staggered jumps: JM=
P32_JLE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11455  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11456  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11457  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11458  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11459  		.fill_helper =3D bpf=
_fill_staggered_jle32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11460  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11461  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11462  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11463  		"Staggered jumps: JM=
P32_JSGT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11464  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11465  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11466  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11467  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11468  		.fill_helper =3D bpf=
_fill_staggered_jsgt32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11469  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11470  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11471  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11472  		"Staggered jumps: JM=
P32_JSGE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11473  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11474  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11475  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11476  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11477  		.fill_helper =3D bpf=
_fill_staggered_jsge32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11478  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11479  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11480  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11481  		"Staggered jumps: JM=
P32_JSLT_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11482  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11483  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11484  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11485  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11486  		.fill_helper =3D bpf=
_fill_staggered_jslt32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11487  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11488  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11489  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11490  		"Staggered jumps: JM=
P32_JSLE_K",
e1016e1586ff9b Johan Almbladh     2021-09-02  11491  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11492  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11493  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11494  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11495  		.fill_helper =3D bpf=
_fill_staggered_jsle32_imm,
e1016e1586ff9b Johan Almbladh     2021-09-02  11496  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11497  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11498  	/* Staggered jump seq=
uences, JMP32 register */
e1016e1586ff9b Johan Almbladh     2021-09-02  11499  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11500  		"Staggered jumps: JM=
P32_JEQ_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11501  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11502  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11503  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11504  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11505  		.fill_helper =3D bpf=
_fill_staggered_jeq32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11506  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11507  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11508  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11509  		"Staggered jumps: JM=
P32_JNE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11510  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11511  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11512  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11513  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11514  		.fill_helper =3D bpf=
_fill_staggered_jne32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11515  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11516  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11517  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11518  		"Staggered jumps: JM=
P32_JSET_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11519  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11520  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11521  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11522  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11523  		.fill_helper =3D bpf=
_fill_staggered_jset32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11524  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11525  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11526  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11527  		"Staggered jumps: JM=
P32_JGT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11528  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11529  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11530  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11531  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11532  		.fill_helper =3D bpf=
_fill_staggered_jgt32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11533  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11534  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11535  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11536  		"Staggered jumps: JM=
P32_JGE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11537  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11538  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11539  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11540  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11541  		.fill_helper =3D bpf=
_fill_staggered_jge32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11542  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11543  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11544  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11545  		"Staggered jumps: JM=
P32_JLT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11546  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11547  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11548  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11549  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11550  		.fill_helper =3D bpf=
_fill_staggered_jlt32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11551  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11552  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11553  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11554  		"Staggered jumps: JM=
P32_JLE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11555  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11556  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11557  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11558  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11559  		.fill_helper =3D bpf=
_fill_staggered_jle32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11560  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11561  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11562  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11563  		"Staggered jumps: JM=
P32_JSGT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11564  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11565  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11566  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11567  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11568  		.fill_helper =3D bpf=
_fill_staggered_jsgt32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11569  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11570  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11571  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11572  		"Staggered jumps: JM=
P32_JSGE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11573  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11574  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11575  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11576  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11577  		.fill_helper =3D bpf=
_fill_staggered_jsge32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11578  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11579  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11580  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11581  		"Staggered jumps: JM=
P32_JSLT_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11582  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11583  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11584  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11585  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11586  		.fill_helper =3D bpf=
_fill_staggered_jslt32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11587  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11588  	},
e1016e1586ff9b Johan Almbladh     2021-09-02  11589  	{
e1016e1586ff9b Johan Almbladh     2021-09-02  11590  		"Staggered jumps: JM=
P32_JSLE_X",
e1016e1586ff9b Johan Almbladh     2021-09-02  11591  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11592  		INTERNAL | FLAG_NO_D=
ATA,
e1016e1586ff9b Johan Almbladh     2021-09-02  11593  		{ },
e1016e1586ff9b Johan Almbladh     2021-09-02  11594  		{ { 0, MAX_STAGGERED=
_JMP_SIZE + 1 } },
e1016e1586ff9b Johan Almbladh     2021-09-02  11595  		.fill_helper =3D bpf=
_fill_staggered_jsle32_reg,
e1016e1586ff9b Johan Almbladh     2021-09-02  11596  		.nr_testruns =3D NR_=
STAGGERED_JMP_RUNS,
e1016e1586ff9b Johan Almbladh     2021-09-02  11597  	},
64a8946b447e41 Alexei Starovoitov 2014-05-08  11598  };
64a8946b447e41 Alexei Starovoitov 2014-05-08  11599  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4293581099203094452==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
IY/2DAIA
--===============4293581099203094452==--

