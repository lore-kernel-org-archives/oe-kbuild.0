Content-Type: multipart/mixed; boundary="===============1583529340370470195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 07/10] bpf/tests: Add exhaustive tests of ALU register combinations
Date: Fri, 12 Nov 2021 07:21:03 +0800
Message-ID: <202111120722.8fwnWsNy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1583529340370470195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211001130348.3670534-8-johan.almbladh@anyfinetworks.com>
References: <20211001130348.3670534-8-johan.almbladh@anyfinetworks.com>
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Hi Johan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Johan-Almbladh/bpf-tests-E=
xtend-eBPF-JIT-test-suite/20211001-213027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: x86_64-rhel-8.3-kselftests (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/278ec42838bdb02527941c5c3=
e5d3e5bbb7892f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Johan-Almbladh/bpf-tests-Extend-eB=
PF-JIT-test-suite/20211001-213027
        git checkout 278ec42838bdb02527941c5c3e5d3e5bbb7892f5
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   lib/test_bpf.c:7314:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __be32 [usertype] @@
   lib/test_bpf.c:7314:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:7314:24: sparse:     got restricted __be32 [usertype]
   lib/test_bpf.c:7325:25: sparse: sparse: cast from restricted __be64
   lib/test_bpf.c:7337:31: sparse: sparse: restricted __be64 degrades to in=
teger
   lib/test_bpf.c:7349:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le16 [usertype] @@
   lib/test_bpf.c:7349:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:7349:24: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:7363:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le32 [usertype] @@
   lib/test_bpf.c:7363:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:7363:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:7374:25: sparse: sparse: cast from restricted __le64
   lib/test_bpf.c:7386:31: sparse: sparse: restricted __le64 degrades to in=
teger
   lib/test_bpf.c:7398:25: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le16 [usertype] @@
   lib/test_bpf.c:7398:25: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:7398:25: sparse:     got restricted __le16 [usertype]
   lib/test_bpf.c:7412:24: sparse: sparse: incorrect type in initializer (d=
ifferent base types) @@     expected unsigned int [usertype] result @@     =
got restricted __le32 [usertype] @@
   lib/test_bpf.c:7412:24: sparse:     expected unsigned int [usertype] res=
ult
   lib/test_bpf.c:7412:24: sparse:     got restricted __le32 [usertype]
   lib/test_bpf.c:7423:25: sparse: sparse: cast from restricted __le64
   lib/test_bpf.c:7435:31: sparse: sparse: restricted __le64 degrades to in=
teger
   lib/test_bpf.c:4474:25: sparse: sparse: cast truncates bits from constan=
t value (567800001234 becomes 1234)
   lib/test_bpf.c:4485:25: sparse: sparse: cast truncates bits from constan=
t value (1ffffffff becomes ffffffff)
   lib/test_bpf.c:4562:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4640:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4656:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:4781:25: sparse: sparse: cast truncates bits from constan=
t value (100000000 becomes 0)
   lib/test_bpf.c:4959:25: sparse: sparse: cast truncates bits from constan=
t value (100000000 becomes 0)
   lib/test_bpf.c:5269:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:5270:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:5281:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba987654321 becomes 87654321)
   lib/test_bpf.c:5282:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef0 becomes 9abcdef0)
   lib/test_bpf.c:5404:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5415:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5802:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5840:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5856:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5857:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:5888:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5904:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:5905:25: sparse: sparse: cast truncates bits from constan=
t value (123456780a0c0e0 becomes 80a0c0e0)
   lib/test_bpf.c:6014:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6052:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6053:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6068:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6100:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6101:25: sparse: sparse: cast truncates bits from constan=
t value (12345678fafcfef becomes 8fafcfef)
   lib/test_bpf.c:6116:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6226:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6264:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6265:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6280:25: sparse: sparse: cast truncates bits from constan=
t value (ffffffff0000 becomes ffff0000)
   lib/test_bpf.c:6281:25: sparse: sparse: cast truncates bits from constan=
t value (ffff00000000ffff becomes ffff)
   lib/test_bpf.c:6312:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6313:25: sparse: sparse: cast truncates bits from constan=
t value (123456786a4c2e0 becomes 86a4c2e0)
   lib/test_bpf.c:6328:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6329:25: sparse: sparse: cast truncates bits from constan=
t value (fedcba98795b3d1f becomes 795b3d1f)
   lib/test_bpf.c:6405:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6417:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6430:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6442:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6455:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6467:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6480:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6492:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6572:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6583:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6595:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6606:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6618:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6629:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6641:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6713:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6725:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6738:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6750:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6763:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6775:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6788:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6800:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6880:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6891:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6903:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6914:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6926:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6937:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6949:25: sparse: sparse: cast truncates bits from constan=
t value (123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6973:25: sparse: sparse: cast truncates bits from constan=
t value (ff00ff0000000000 becomes 0)
   lib/test_bpf.c:6985:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:6997:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7010:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7022:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7035:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7047:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7060:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7072:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7108:25: sparse: sparse: cast truncates bits from constan=
t value (ff00ff0000000000 becomes 0)
   lib/test_bpf.c:7119:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7130:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7142:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
>> lib/test_bpf.c:7153:25: sparse: sparse: cast truncates bits from constan=
t value (f123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7165:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7176:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7188:25: sparse: sparse: cast truncates bits from constan=
t value (8123456789abcdef becomes 89abcdef)
   lib/test_bpf.c:7245:25: sparse: sparse: too many warnings

vim +7153 lib/test_bpf.c

a7d2e752e52050f Johan Almbladh     2021-09-14  2658  =

a5a36544de38057 Johan Almbladh     2021-09-14  2659  =

64a8946b447e418 Alexei Starovoitov 2014-05-08  2660  static struct bpf_test=
 tests[] =3D {
64a8946b447e418 Alexei Starovoitov 2014-05-08  2661  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  2662  		"TAX",
ece80490e2c1cef Andrew Morton      2014-05-22  2663  		.u.insns =3D {
64a8946b447e418 Alexei Starovoitov 2014-05-08  2664  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2665  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2666  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2667  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2668  			BPF_STMT(BPF_ALU | =
BPF_NEG, 0), /* A =3D=3D -3 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  2669  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2670  			BPF_STMT(BPF_LD | B=
PF_LEN, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2671  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2672  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0), /* X =3D=3D len - 3 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  2673  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  2674  			BPF_STMT(BPF_RET | =
BPF_A, 0)
64a8946b447e418 Alexei Starovoitov 2014-05-08  2675  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2676  		CLASSIC,
64a8946b447e418 Alexei Starovoitov 2014-05-08  2677  		{ 10, 20, 30, 40, 50=
 },
64a8946b447e418 Alexei Starovoitov 2014-05-08  2678  		{ { 2, 10 }, { 3, 20=
 }, { 4, 30 } },
64a8946b447e418 Alexei Starovoitov 2014-05-08  2679  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2680  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2681  		"TXA",
ece80490e2c1cef Andrew Morton      2014-05-22  2682  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2683  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2684  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2685  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2686  			BPF_STMT(BPF_RET | =
BPF_A, 0) /* A =3D=3D len * 2 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2687  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2688  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2689  		{ 10, 20, 30, 40, 50=
 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2690  		{ { 1, 2 }, { 3, 6 }=
, { 4, 8 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2691  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2692  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2693  		"ADD_SUB_MUL_K",
ece80490e2c1cef Andrew Morton      2014-05-22  2694  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2695  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2696  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2697  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2698  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2699  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2700  			BPF_STMT(BPF_ALU | =
BPF_MUL | BPF_K, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2701  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2702  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2703  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2704  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2705  		{ { 0, 0xfffffffd } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2706  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2707  	{
6867b17b26d80cf Denis Kirjanov     2014-12-01  2708  		"DIV_MOD_KX",
ece80490e2c1cef Andrew Morton      2014-05-22  2709  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2710  			BPF_STMT(BPF_LD | B=
PF_IMM, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2711  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2712  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2713  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2714  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2715  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2716  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2717  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 0x70000000),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2718  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2719  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2720  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_X, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2721  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2722  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xffffffff),
6867b17b26d80cf Denis Kirjanov     2014-12-01  2723  			BPF_STMT(BPF_ALU | =
BPF_MOD | BPF_K, 0x70000000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2724  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2725  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2726  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2727  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2728  		{ },
6867b17b26d80cf Denis Kirjanov     2014-12-01  2729  		{ { 0, 0x20000000 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2730  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2731  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2732  		"AND_OR_LSH_K",
ece80490e2c1cef Andrew Morton      2014-05-22  2733  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2734  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xff),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2735  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2736  			BPF_STMT(BPF_ALU | =
BPF_LSH | BPF_K, 27),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2737  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2738  			BPF_STMT(BPF_LD | B=
PF_IMM, 0xf),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2739  			BPF_STMT(BPF_ALU | =
BPF_OR | BPF_K, 0xf0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2740  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2741  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2742  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2743  		CLASSIC | FLAG_NO_DA=
TA,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2744  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2745  		{ { 0, 0x800000ff },=
 { 1, 0x800000ff } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2746  	},
e9d9450497f77ee Chema Gonzalez     2014-05-30  2747  	{
e9d9450497f77ee Chema Gonzalez     2014-05-30  2748  		"LD_IMM_0",
e9d9450497f77ee Chema Gonzalez     2014-05-30  2749  		.u.insns =3D {
e9d9450497f77ee Chema Gonzalez     2014-05-30  2750  			BPF_STMT(BPF_LD | B=
PF_IMM, 0), /* ld #0 */
e9d9450497f77ee Chema Gonzalez     2014-05-30  2751  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0, 1, 0),
e9d9450497f77ee Chema Gonzalez     2014-05-30  2752  			BPF_STMT(BPF_RET | =
BPF_K, 0),
e9d9450497f77ee Chema Gonzalez     2014-05-30  2753  			BPF_STMT(BPF_RET | =
BPF_K, 1),
e9d9450497f77ee Chema Gonzalez     2014-05-30  2754  		},
e9d9450497f77ee Chema Gonzalez     2014-05-30  2755  		CLASSIC,
e9d9450497f77ee Chema Gonzalez     2014-05-30  2756  		{ },
e9d9450497f77ee Chema Gonzalez     2014-05-30  2757  		{ { 1, 1 } },
e9d9450497f77ee Chema Gonzalez     2014-05-30  2758  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2759  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2760  		"LD_IND",
ece80490e2c1cef Andrew Morton      2014-05-22  2761  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2762  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2763  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, MAX_K),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2764  			BPF_STMT(BPF_RET | =
BPF_K, 1)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2765  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2766  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2767  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2768  		{ { 1, 0 }, { 10, 0 =
}, { 60, 0 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2769  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2770  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2771  		"LD_ABS",
ece80490e2c1cef Andrew Morton      2014-05-22  2772  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2773  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS, 1000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2774  			BPF_STMT(BPF_RET | =
BPF_K, 1)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2775  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2776  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2777  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2778  		{ { 1, 0 }, { 10, 0 =
}, { 60, 0 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2779  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2780  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2781  		"LD_ABS_LL",
ece80490e2c1cef Andrew Morton      2014-05-22  2782  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2783  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_LL_OFF),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2784  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2785  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_LL_OFF + 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2786  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2787  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2788  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2789  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2790  		{ 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2791  		{ { 1, 0 }, { 2, 3 }=
 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2792  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2793  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2794  		"LD_IND_LL",
ece80490e2c1cef Andrew Morton      2014-05-22  2795  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2796  			BPF_STMT(BPF_LD | B=
PF_IMM, SKF_LL_OFF - 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2797  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2798  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2799  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2800  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2801  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2802  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2803  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2804  		{ 1, 2, 3, 0xff },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2805  		{ { 1, 1 }, { 3, 3 }=
, { 4, 0xff } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2806  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2807  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2808  		"LD_ABS_NET",
ece80490e2c1cef Andrew Morton      2014-05-22  2809  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2810  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_NET_OFF),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2811  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2812  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, SKF_NET_OFF + 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2813  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2814  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2815  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2816  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2817  		{ 0, 0, 0, 0, 0, 0, =
0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2818  		{ { 15, 0 }, { 16, 3=
 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2819  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2820  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2821  		"LD_IND_NET",
ece80490e2c1cef Andrew Morton      2014-05-22  2822  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2823  			BPF_STMT(BPF_LD | B=
PF_IMM, SKF_NET_OFF - 15),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2824  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2825  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2826  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2827  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2828  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2829  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2830  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2831  		{ 0, 0, 0, 0, 0, 0, =
0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2832  		{ { 14, 0 }, { 15, 1=
 }, { 17, 3 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2833  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2834  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2835  		"LD_PKTTYPE",
ece80490e2c1cef Andrew Morton      2014-05-22  2836  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2837  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2838  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2839  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2840  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2841  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2842  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2843  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2844  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2845  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2846  				 SKF_AD_OFF + SKF_=
AD_PKTTYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2847  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, SKB_TYPE, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2848  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2849  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2850  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2851  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2852  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2853  		{ { 1, 3 }, { 10, 3 =
} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2854  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2855  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2856  		"LD_MARK",
ece80490e2c1cef Andrew Morton      2014-05-22  2857  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2858  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2859  				 SKF_AD_OFF + SKF_=
AD_MARK),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2860  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2861  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2862  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2863  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2864  		{ { 1, SKB_MARK}, { =
10, SKB_MARK} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2865  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2866  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2867  		"LD_RXHASH",
ece80490e2c1cef Andrew Morton      2014-05-22  2868  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2869  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2870  				 SKF_AD_OFF + SKF_=
AD_RXHASH),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2871  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2872  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2873  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2874  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2875  		{ { 1, SKB_HASH}, { =
10, SKB_HASH} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2876  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2877  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2878  		"LD_QUEUE",
ece80490e2c1cef Andrew Morton      2014-05-22  2879  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2880  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2881  				 SKF_AD_OFF + SKF_=
AD_QUEUE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2882  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2883  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2884  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2885  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2886  		{ { 1, SKB_QUEUE_MAP=
 }, { 10, SKB_QUEUE_MAP } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2887  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2888  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2889  		"LD_PROTOCOL",
ece80490e2c1cef Andrew Morton      2014-05-22  2890  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2891  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2892  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 20, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2893  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2894  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2895  				 SKF_AD_OFF + SKF_=
AD_PROTOCOL),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2896  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2897  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2898  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 30, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2899  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2900  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2901  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2902  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2903  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2904  		{ 10, 20, 30 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2905  		{ { 10, ETH_P_IP }, =
{ 100, ETH_P_IP } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2906  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2907  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2908  		"LD_VLAN_TAG",
ece80490e2c1cef Andrew Morton      2014-05-22  2909  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2910  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2911  				 SKF_AD_OFF + SKF_=
AD_VLAN_TAG),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2912  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2913  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2914  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2915  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2916  		{
0c4b2d370514cb4 Micha=C5=82 Miros=C5=82aw    2018-11-10  2917  			{ 1, SKB_=
VLAN_TCI },
0c4b2d370514cb4 Micha=C5=82 Miros=C5=82aw    2018-11-10  2918  			{ 10, SKB=
_VLAN_TCI }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2919  		},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2920  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2921  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2922  		"LD_VLAN_TAG_PRESENT=
",
ece80490e2c1cef Andrew Morton      2014-05-22  2923  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2924  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2925  				 SKF_AD_OFF + SKF_=
AD_VLAN_TAG_PRESENT),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2926  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2927  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2928  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2929  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2930  		{
0c4b2d370514cb4 Micha=C5=82 Miros=C5=82aw    2018-11-10  2931  			{ 1, SKB_=
VLAN_PRESENT },
0c4b2d370514cb4 Micha=C5=82 Miros=C5=82aw    2018-11-10  2932  			{ 10, SKB=
_VLAN_PRESENT }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2933  		},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2934  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2935  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2936  		"LD_IFINDEX",
ece80490e2c1cef Andrew Morton      2014-05-22  2937  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2938  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2939  				 SKF_AD_OFF + SKF_=
AD_IFINDEX),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2940  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2941  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2942  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2943  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2944  		{ { 1, SKB_DEV_IFIND=
EX }, { 10, SKB_DEV_IFINDEX } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2945  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2946  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2947  		"LD_HATYPE",
ece80490e2c1cef Andrew Morton      2014-05-22  2948  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2949  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2950  				 SKF_AD_OFF + SKF_=
AD_HATYPE),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2951  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2952  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2953  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2954  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2955  		{ { 1, SKB_DEV_TYPE =
}, { 10, SKB_DEV_TYPE } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2956  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2957  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2958  		"LD_CPU",
ece80490e2c1cef Andrew Morton      2014-05-22  2959  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2960  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2961  				 SKF_AD_OFF + SKF_=
AD_CPU),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2962  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2963  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2964  				 SKF_AD_OFF + SKF_=
AD_CPU),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2965  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2966  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2967  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2968  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2969  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2970  		{ { 1, 0 }, { 10, 0 =
} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2971  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2972  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2973  		"LD_NLATTR",
ece80490e2c1cef Andrew Morton      2014-05-22  2974  		.u.insns =3D {
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2975  			BPF_STMT(BPF_LDX | =
BPF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2976  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2977  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2978  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2979  				 SKF_AD_OFF + SKF_=
AD_NLATTR),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2980  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2981  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  2982  		CLASSIC,
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2983  #ifdef __BIG_ENDIAN
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2984  		{ 0xff, 0xff, 0, 4, =
0, 2, 0, 4, 0, 3 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2985  #else
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2986  		{ 0xff, 0xff, 4, 0, =
2, 0, 4, 0, 3, 0 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2987  #endif
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2988  		{ { 4, 0 }, { 20, 6 =
} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2989  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2990  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2991  		"LD_NLATTR_NEST",
ece80490e2c1cef Andrew Morton      2014-05-22  2992  		.u.insns =3D {
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2993  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2994  			BPF_STMT(BPF_LDX | =
BPF_IMM, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2995  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2996  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  2997  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2998  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  2999  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3000  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3001  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3002  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3003  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3004  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3005  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3006  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3007  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3008  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3009  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3010  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3011  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3012  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3013  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3014  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3015  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3016  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3017  				 SKF_AD_OFF + SKF_=
AD_NLATTR_NEST),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3018  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3019  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3020  		CLASSIC,
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3021  #ifdef __BIG_ENDIAN
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3022  		{ 0xff, 0xff, 0, 12,=
 0, 1, 0, 4, 0, 2, 0, 4, 0, 3 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3023  #else
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3024  		{ 0xff, 0xff, 12, 0,=
 1, 0, 4, 0, 2, 0, 4, 0, 3, 0 },
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3025  #endif
df6d0f983a59c33 Alexei Starovoitov 2014-06-06  3026  		{ { 4, 0 }, { 20, 10=
 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3027  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3028  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3029  		"LD_PAYLOAD_OFF",
ece80490e2c1cef Andrew Morton      2014-05-22  3030  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3031  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3032  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3033  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3034  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3035  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3036  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3037  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3038  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3039  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3040  				 SKF_AD_OFF + SKF_=
AD_PAY_OFFSET),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3041  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3042  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3043  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3044  		/* 00:00:00:00:00:00=
 > 00:00:00:00:00:00, ethtype IPv4 (0x0800),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3045  		 * length 98: 127.0.=
0.1 > 127.0.0.1: ICMP echo request,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3046  		 * id 9737, seq 1, l=
ength 64
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3047  		 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3048  		{ 0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3049  		  0x00, 0x00, 0x00, =
0x00, 0x00, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3050  		  0x08, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3051  		  0x45, 0x00, 0x00, =
0x54, 0xac, 0x8b, 0x40, 0x00, 0x40,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3052  		  0x01, 0x90, 0x1b, =
0x7f, 0x00, 0x00, 0x01 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3053  		{ { 30, 0 }, { 100, =
42 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3054  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3055  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3056  		"LD_ANC_XOR",
ece80490e2c1cef Andrew Morton      2014-05-22  3057  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3058  			BPF_STMT(BPF_LD | B=
PF_IMM, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3059  			BPF_STMT(BPF_LDX | =
BPF_IMM, 300),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3060  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3061  				 SKF_AD_OFF + SKF_=
AD_ALU_XOR_X),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3062  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3063  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3064  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3065  		{ },
098454362a06029 Nathan Chancellor  2019-08-18  3066  		{ { 4, 0xA ^ 300 }, =
{ 20, 0xA ^ 300 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3067  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3068  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3069  		"SPILL_FILL",
ece80490e2c1cef Andrew Morton      2014-05-22  3070  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3071  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3072  			BPF_STMT(BPF_LD | B=
PF_IMM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3073  			BPF_STMT(BPF_ALU | =
BPF_RSH, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3074  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3075  			BPF_STMT(BPF_ST, 1)=
, /* M1 =3D 1 ^ len */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3076  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_K, 0x80000000),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3077  			BPF_STMT(BPF_ST, 2)=
, /* M2 =3D 1 ^ len ^ 0x80000000 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3078  			BPF_STMT(BPF_STX, 1=
5), /* M3 =3D len */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3079  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3080  			BPF_STMT(BPF_LD | B=
PF_MEM, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3081  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3082  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3083  			BPF_STMT(BPF_ALU | =
BPF_XOR | BPF_X, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3084  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3085  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3086  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3087  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3088  		{ { 1, 0x80000001 },=
 { 2, 0x80000002 }, { 60, 0x80000000 ^ 60 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3089  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3090  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3091  		"JEQ",
ece80490e2c1cef Andrew Morton      2014-05-22  3092  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3093  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3094  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3095  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_X, 0, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3096  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3097  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3098  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3099  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3100  		{ 3, 3, 3, 3, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3101  		{ { 1, 0 }, { 3, 1 }=
, { 4, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3102  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3103  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3104  		"JGT",
ece80490e2c1cef Andrew Morton      2014-05-22  3105  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3106  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3107  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3108  			BPF_JUMP(BPF_JMP | =
BPF_JGT | BPF_X, 0, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3109  			BPF_STMT(BPF_RET | =
BPF_K, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3110  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3111  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3112  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3113  		{ 4, 4, 4, 3, 3 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3114  		{ { 2, 0 }, { 3, 1 }=
, { 4, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3115  	},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3116  	{
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3117  		"JGE (jt 0), test 1",
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3118  		.u.insns =3D {
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3119  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3120  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3121  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3122  			BPF_STMT(BPF_RET | =
BPF_K, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3123  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3124  		},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3125  		CLASSIC,
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3126  		{ 4, 4, 4, 3, 3 },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3127  		{ { 2, 0 }, { 3, 1 }=
, { 4, 1 } },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3128  	},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3129  	{
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3130  		"JGE (jt 0), test 2",
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3131  		.u.insns =3D {
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3132  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3133  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 2),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3134  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_X, 0, 0, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3135  			BPF_STMT(BPF_RET | =
BPF_K, 1),
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3136  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3137  		},
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3138  		CLASSIC,
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3139  		{ 4, 4, 5, 3, 3 },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3140  		{ { 4, 1 }, { 5, 1 }=
, { 6, MAX_K } },
92b31a9af73b3a3 Daniel Borkmann    2017-08-10  3141  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3142  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3143  		"JGE",
ece80490e2c1cef Andrew Morton      2014-05-22  3144  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3145  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3146  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, MAX_K),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3147  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 1, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3148  			BPF_STMT(BPF_RET | =
BPF_K, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3149  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 2, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3150  			BPF_STMT(BPF_RET | =
BPF_K, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3151  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 3, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3152  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3153  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 4, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3154  			BPF_STMT(BPF_RET | =
BPF_K, 40),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3155  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3156  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3157  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3158  		{ 1, 2, 3, 4, 5 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3159  		{ { 1, 20 }, { 3, 40=
 }, { 5, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3160  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3161  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3162  		"JSET",
ece80490e2c1cef Andrew Morton      2014-05-22  3163  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3164  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3165  			BPF_JUMP(BPF_JMP | =
BPF_JA, 1, 1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3166  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3167  			BPF_JUMP(BPF_JMP | =
BPF_JA, 0, 0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3168  			BPF_STMT(BPF_LDX | =
BPF_LEN, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3169  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3170  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_K, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3171  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3172  			BPF_STMT(BPF_LD | B=
PF_W | BPF_IND, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3173  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 1, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3174  			BPF_STMT(BPF_RET | =
BPF_K, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3175  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x80000000, 0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3176  			BPF_STMT(BPF_RET | =
BPF_K, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3177  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3178  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3179  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3180  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3181  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3182  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3183  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3184  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3185  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0xffffff, 1, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3186  			BPF_STMT(BPF_RET | =
BPF_K, 30),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3187  			BPF_STMT(BPF_RET | =
BPF_K, MAX_K)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3188  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3189  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3190  		{ 0, 0xAA, 0x55, 1 },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3191  		{ { 4, 10 }, { 5, 20=
 }, { 6, MAX_K } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3192  	},
64a8946b447e418 Alexei Starovoitov 2014-05-08  3193  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  3194  		"tcpdump port 22",
ece80490e2c1cef Andrew Morton      2014-05-22  3195  		.u.insns =3D {
ce25b68b74593bb Daniel Borkmann    2014-05-26  3196  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 12),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3197  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x86dd, 0, 8), /* IPv6 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3198  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3199  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3200  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3201  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x11, 0, 17),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3202  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 54),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3203  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 14, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3204  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 56),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3205  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 12, 13),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3206  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x0800, 0, 12), /* IPv4 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3207  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 23),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3208  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x84, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3209  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3210  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x11, 0, 8),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3211  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3212  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x1fff, 6, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3213  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3214  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3215  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3216  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3217  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 0, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3218  			BPF_STMT(BPF_RET | =
BPF_K, 0xffff),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3219  			BPF_STMT(BPF_RET | =
BPF_K, 0),
64a8946b447e418 Alexei Starovoitov 2014-05-08  3220  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3221  		CLASSIC,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3222  		/* 3c:07:54:43:e5:76=
 > 10:bf:48:d6:43:d6, ethertype IPv4(0x0800)
64a8946b447e418 Alexei Starovoitov 2014-05-08  3223  		 * length 114: 10.1.=
1.149.49700 > 10.1.2.10.22: Flags [P.],
64a8946b447e418 Alexei Starovoitov 2014-05-08  3224  		 * seq 1305692979:13=
05693027, ack 3650467037, win 65535,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3225  		 * options [nop,nop,=
TS val 2502645400 ecr 3971138], length 48
64a8946b447e418 Alexei Starovoitov 2014-05-08  3226  		 */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3227  		{ 0x10, 0xbf, 0x48, =
0xd6, 0x43, 0xd6,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3228  		  0x3c, 0x07, 0x54, =
0x43, 0xe5, 0x76,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3229  		  0x08, 0x00,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3230  		  0x45, 0x10, 0x00, =
0x64, 0x75, 0xb5,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3231  		  0x40, 0x00, 0x40, =
0x06, 0xad, 0x2e, /* IP header */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3232  		  0x0a, 0x01, 0x01, =
0x95, /* ip src */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3233  		  0x0a, 0x01, 0x02, =
0x0a, /* ip dst */
64a8946b447e418 Alexei Starovoitov 2014-05-08  3234  		  0xc2, 0x24,
64a8946b447e418 Alexei Starovoitov 2014-05-08  3235  		  0x00, 0x16 /* dst =
port */ },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3236  		{ { 10, 0 }, { 30, 0=
 }, { 100, 65535 } },
64a8946b447e418 Alexei Starovoitov 2014-05-08  3237  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3238  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3239  		"tcpdump complex",
ece80490e2c1cef Andrew Morton      2014-05-22  3240  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3241  			/* tcpdump -nei eth=
0 'tcp port 22 and (((ip[2:2] -
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3242  			 * ((ip[0]&0xf)<<2)=
) - ((tcp[12]&0xf0)>>2)) !=3D 0) and
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3243  			 * (len > 115 or le=
n < 30000000000)' -d
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3244  			 */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3245  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 12),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3246  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x86dd, 30, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3247  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x800, 0, 29),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3248  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 23),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3249  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 0x6, 0, 27),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3250  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3251  			BPF_JUMP(BPF_JMP | =
BPF_JSET | BPF_K, 0x1fff, 25, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3252  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3253  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3254  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 2, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3255  			BPF_STMT(BPF_LD | B=
PF_H | BPF_IND, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3256  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_K, 22, 0, 20),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3257  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 16),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3258  			BPF_STMT(BPF_ST, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3259  			BPF_STMT(BPF_LD | B=
PF_B | BPF_ABS, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3260  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3261  			BPF_STMT(BPF_ALU | =
BPF_LSH | BPF_K, 2),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3262  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0x5), /* libpcap emits K on TAX */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3263  			BPF_STMT(BPF_LD | B=
PF_MEM, 1),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3264  			BPF_STMT(BPF_ALU | =
BPF_SUB | BPF_X, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3265  			BPF_STMT(BPF_ST, 5),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3266  			BPF_STMT(BPF_LDX | =
BPF_B | BPF_MSH, 14),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3267  			BPF_STMT(BPF_LD | B=
PF_B | BPF_IND, 26),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3268  			BPF_STMT(BPF_ALU | =
BPF_AND | BPF_K, 0xf0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3269  			BPF_STMT(BPF_ALU | =
BPF_RSH | BPF_K, 2),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3270  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0x9), /* libpcap emits K on TAX */
ce25b68b74593bb Daniel Borkmann    2014-05-26  3271  			BPF_STMT(BPF_LD | B=
PF_MEM, 5),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3272  			BPF_JUMP(BPF_JMP | =
BPF_JEQ | BPF_X, 0, 4, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3273  			BPF_STMT(BPF_LD | B=
PF_LEN, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3274  			BPF_JUMP(BPF_JMP | =
BPF_JGT | BPF_K, 0x73, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3275  			BPF_JUMP(BPF_JMP | =
BPF_JGE | BPF_K, 0xfc23ac00, 1, 0),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3276  			BPF_STMT(BPF_RET | =
BPF_K, 0xffff),
ce25b68b74593bb Daniel Borkmann    2014-05-26  3277  			BPF_STMT(BPF_RET | =
BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3278  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3279  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3280  		{ 0x10, 0xbf, 0x48, =
0xd6, 0x43, 0xd6,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3281  		  0x3c, 0x07, 0x54, =
0x43, 0xe5, 0x76,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3282  		  0x08, 0x00,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3283  		  0x45, 0x10, 0x00, =
0x64, 0x75, 0xb5,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3284  		  0x40, 0x00, 0x40, =
0x06, 0xad, 0x2e, /* IP header */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3285  		  0x0a, 0x01, 0x01, =
0x95, /* ip src */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3286  		  0x0a, 0x01, 0x02, =
0x0a, /* ip dst */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3287  		  0xc2, 0x24,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3288  		  0x00, 0x16 /* dst =
port */ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3289  		{ { 10, 0 }, { 30, 0=
 }, { 100, 65535 } },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3290  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3291  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3292  		"RET_A",
ece80490e2c1cef Andrew Morton      2014-05-22  3293  		.u.insns =3D {
53b0fe36ab7c6eb Zhen Lei           2021-07-07  3294  			/* check that unini=
tialized X and A contain zeros */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3295  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3296  			BPF_STMT(BPF_RET | =
BPF_A, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3297  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3298  		CLASSIC,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3299  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3300  		{ {1, 0}, {2, 0} },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3301  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3302  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3303  		"INT: ADD trivial",
ece80490e2c1cef Andrew Morton      2014-05-22  3304  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3305  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3306  			BPF_ALU64_IMM(BPF_A=
DD, R1, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3307  			BPF_ALU64_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3308  			BPF_ALU64_REG(BPF_S=
UB, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3309  			BPF_ALU64_IMM(BPF_A=
DD, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3310  			BPF_ALU64_IMM(BPF_M=
UL, R1, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3311  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3312  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3313  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3314  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3315  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3316  		{ { 0, 0xfffffffd } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3317  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3318  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3319  		"INT: MUL_X",
ece80490e2c1cef Andrew Morton      2014-05-22  3320  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3321  			BPF_ALU64_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3322  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3323  			BPF_ALU64_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3324  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3325  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xfffffffd, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3326  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3327  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3328  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3329  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3330  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3331  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3332  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3333  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3334  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3335  		"INT: MUL_X2",
ece80490e2c1cef Andrew Morton      2014-05-22  3336  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3337  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3338  			BPF_ALU32_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3339  			BPF_ALU32_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3340  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3341  			BPF_ALU64_IMM(BPF_R=
SH, R1, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3342  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0x2ffffff, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3343  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3344  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3345  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3346  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3347  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3348  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3349  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3350  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3351  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3352  		"INT: MUL32_X",
ece80490e2c1cef Andrew Morton      2014-05-22  3353  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3354  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3355  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3356  			BPF_ALU32_IMM(BPF_M=
OV, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3357  			BPF_ALU32_REG(BPF_M=
UL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3358  			BPF_ALU64_IMM(BPF_R=
SH, R1, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3359  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xffffff, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3360  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3361  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3362  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3363  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3364  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3365  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3366  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3367  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3368  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3369  		/* Have to test all =
register combinations, since
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3370  		 * JITing of differe=
nt registers will produce
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3371  		 * different asm cod=
e.
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3372  		 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3373  		"INT: ADD 64-bit",
ece80490e2c1cef Andrew Morton      2014-05-22  3374  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3375  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3376  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3377  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3378  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3379  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3380  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3381  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3382  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3383  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3384  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3385  			BPF_ALU64_IMM(BPF_A=
DD, R0, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3386  			BPF_ALU64_IMM(BPF_A=
DD, R1, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3387  			BPF_ALU64_IMM(BPF_A=
DD, R2, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3388  			BPF_ALU64_IMM(BPF_A=
DD, R3, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3389  			BPF_ALU64_IMM(BPF_A=
DD, R4, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3390  			BPF_ALU64_IMM(BPF_A=
DD, R5, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3391  			BPF_ALU64_IMM(BPF_A=
DD, R6, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3392  			BPF_ALU64_IMM(BPF_A=
DD, R7, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3393  			BPF_ALU64_IMM(BPF_A=
DD, R8, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3394  			BPF_ALU64_IMM(BPF_A=
DD, R9, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3395  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3396  			BPF_ALU64_IMM(BPF_S=
UB, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3397  			BPF_ALU64_IMM(BPF_S=
UB, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3398  			BPF_ALU64_IMM(BPF_S=
UB, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3399  			BPF_ALU64_IMM(BPF_S=
UB, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3400  			BPF_ALU64_IMM(BPF_S=
UB, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3401  			BPF_ALU64_IMM(BPF_S=
UB, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3402  			BPF_ALU64_IMM(BPF_S=
UB, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3403  			BPF_ALU64_IMM(BPF_S=
UB, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3404  			BPF_ALU64_IMM(BPF_S=
UB, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3405  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3406  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3407  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3408  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3409  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3410  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3411  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3412  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3413  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3414  			BPF_ALU64_REG(BPF_A=
DD, R0, R9), /* R0 =3D=3D 155 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3415  			BPF_JMP_IMM(BPF_JEQ=
, R0, 155, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3416  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3417  			BPF_ALU64_REG(BPF_A=
DD, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3418  			BPF_ALU64_REG(BPF_A=
DD, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3419  			BPF_ALU64_REG(BPF_A=
DD, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3420  			BPF_ALU64_REG(BPF_A=
DD, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3421  			BPF_ALU64_REG(BPF_A=
DD, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3422  			BPF_ALU64_REG(BPF_A=
DD, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3423  			BPF_ALU64_REG(BPF_A=
DD, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3424  			BPF_ALU64_REG(BPF_A=
DD, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3425  			BPF_ALU64_REG(BPF_A=
DD, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3426  			BPF_ALU64_REG(BPF_A=
DD, R1, R9), /* R1 =3D=3D 456 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3427  			BPF_JMP_IMM(BPF_JEQ=
, R1, 456, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3428  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3429  			BPF_ALU64_REG(BPF_A=
DD, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3430  			BPF_ALU64_REG(BPF_A=
DD, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3431  			BPF_ALU64_REG(BPF_A=
DD, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3432  			BPF_ALU64_REG(BPF_A=
DD, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3433  			BPF_ALU64_REG(BPF_A=
DD, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3434  			BPF_ALU64_REG(BPF_A=
DD, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3435  			BPF_ALU64_REG(BPF_A=
DD, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3436  			BPF_ALU64_REG(BPF_A=
DD, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3437  			BPF_ALU64_REG(BPF_A=
DD, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3438  			BPF_ALU64_REG(BPF_A=
DD, R2, R9), /* R2 =3D=3D 1358 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3439  			BPF_JMP_IMM(BPF_JEQ=
, R2, 1358, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3440  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3441  			BPF_ALU64_REG(BPF_A=
DD, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3442  			BPF_ALU64_REG(BPF_A=
DD, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3443  			BPF_ALU64_REG(BPF_A=
DD, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3444  			BPF_ALU64_REG(BPF_A=
DD, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3445  			BPF_ALU64_REG(BPF_A=
DD, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3446  			BPF_ALU64_REG(BPF_A=
DD, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3447  			BPF_ALU64_REG(BPF_A=
DD, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3448  			BPF_ALU64_REG(BPF_A=
DD, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3449  			BPF_ALU64_REG(BPF_A=
DD, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3450  			BPF_ALU64_REG(BPF_A=
DD, R3, R9), /* R3 =3D=3D 4063 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3451  			BPF_JMP_IMM(BPF_JEQ=
, R3, 4063, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3452  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3453  			BPF_ALU64_REG(BPF_A=
DD, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3454  			BPF_ALU64_REG(BPF_A=
DD, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3455  			BPF_ALU64_REG(BPF_A=
DD, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3456  			BPF_ALU64_REG(BPF_A=
DD, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3457  			BPF_ALU64_REG(BPF_A=
DD, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3458  			BPF_ALU64_REG(BPF_A=
DD, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3459  			BPF_ALU64_REG(BPF_A=
DD, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3460  			BPF_ALU64_REG(BPF_A=
DD, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3461  			BPF_ALU64_REG(BPF_A=
DD, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3462  			BPF_ALU64_REG(BPF_A=
DD, R4, R9), /* R4 =3D=3D 12177 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3463  			BPF_JMP_IMM(BPF_JEQ=
, R4, 12177, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3464  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3465  			BPF_ALU64_REG(BPF_A=
DD, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3466  			BPF_ALU64_REG(BPF_A=
DD, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3467  			BPF_ALU64_REG(BPF_A=
DD, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3468  			BPF_ALU64_REG(BPF_A=
DD, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3469  			BPF_ALU64_REG(BPF_A=
DD, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3470  			BPF_ALU64_REG(BPF_A=
DD, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3471  			BPF_ALU64_REG(BPF_A=
DD, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3472  			BPF_ALU64_REG(BPF_A=
DD, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3473  			BPF_ALU64_REG(BPF_A=
DD, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3474  			BPF_ALU64_REG(BPF_A=
DD, R5, R9), /* R5 =3D=3D 36518 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3475  			BPF_JMP_IMM(BPF_JEQ=
, R5, 36518, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3476  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3477  			BPF_ALU64_REG(BPF_A=
DD, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3478  			BPF_ALU64_REG(BPF_A=
DD, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3479  			BPF_ALU64_REG(BPF_A=
DD, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3480  			BPF_ALU64_REG(BPF_A=
DD, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3481  			BPF_ALU64_REG(BPF_A=
DD, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3482  			BPF_ALU64_REG(BPF_A=
DD, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3483  			BPF_ALU64_REG(BPF_A=
DD, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3484  			BPF_ALU64_REG(BPF_A=
DD, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3485  			BPF_ALU64_REG(BPF_A=
DD, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3486  			BPF_ALU64_REG(BPF_A=
DD, R6, R9), /* R6 =3D=3D 109540 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3487  			BPF_JMP_IMM(BPF_JEQ=
, R6, 109540, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3488  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3489  			BPF_ALU64_REG(BPF_A=
DD, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3490  			BPF_ALU64_REG(BPF_A=
DD, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3491  			BPF_ALU64_REG(BPF_A=
DD, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3492  			BPF_ALU64_REG(BPF_A=
DD, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3493  			BPF_ALU64_REG(BPF_A=
DD, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3494  			BPF_ALU64_REG(BPF_A=
DD, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3495  			BPF_ALU64_REG(BPF_A=
DD, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3496  			BPF_ALU64_REG(BPF_A=
DD, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3497  			BPF_ALU64_REG(BPF_A=
DD, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3498  			BPF_ALU64_REG(BPF_A=
DD, R7, R9), /* R7 =3D=3D 328605 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3499  			BPF_JMP_IMM(BPF_JEQ=
, R7, 328605, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3500  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3501  			BPF_ALU64_REG(BPF_A=
DD, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3502  			BPF_ALU64_REG(BPF_A=
DD, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3503  			BPF_ALU64_REG(BPF_A=
DD, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3504  			BPF_ALU64_REG(BPF_A=
DD, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3505  			BPF_ALU64_REG(BPF_A=
DD, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3506  			BPF_ALU64_REG(BPF_A=
DD, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3507  			BPF_ALU64_REG(BPF_A=
DD, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3508  			BPF_ALU64_REG(BPF_A=
DD, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3509  			BPF_ALU64_REG(BPF_A=
DD, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3510  			BPF_ALU64_REG(BPF_A=
DD, R8, R9), /* R8 =3D=3D 985799 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3511  			BPF_JMP_IMM(BPF_JEQ=
, R8, 985799, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3512  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3513  			BPF_ALU64_REG(BPF_A=
DD, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3514  			BPF_ALU64_REG(BPF_A=
DD, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3515  			BPF_ALU64_REG(BPF_A=
DD, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3516  			BPF_ALU64_REG(BPF_A=
DD, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3517  			BPF_ALU64_REG(BPF_A=
DD, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3518  			BPF_ALU64_REG(BPF_A=
DD, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3519  			BPF_ALU64_REG(BPF_A=
DD, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3520  			BPF_ALU64_REG(BPF_A=
DD, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3521  			BPF_ALU64_REG(BPF_A=
DD, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3522  			BPF_ALU64_REG(BPF_A=
DD, R9, R9), /* R9 =3D=3D 2957380 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3523  			BPF_ALU64_REG(BPF_M=
OV, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3524  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3525  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3526  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3527  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3528  		{ { 0, 2957380 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3529  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3530  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3531  		"INT: ADD 32-bit",
ece80490e2c1cef Andrew Morton      2014-05-22  3532  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3533  			BPF_ALU32_IMM(BPF_M=
OV, R0, 20),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3534  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3535  			BPF_ALU32_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3536  			BPF_ALU32_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3537  			BPF_ALU32_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3538  			BPF_ALU32_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3539  			BPF_ALU32_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3540  			BPF_ALU32_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3541  			BPF_ALU32_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3542  			BPF_ALU32_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3543  			BPF_ALU64_IMM(BPF_A=
DD, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3544  			BPF_ALU64_IMM(BPF_A=
DD, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3545  			BPF_ALU64_IMM(BPF_A=
DD, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3546  			BPF_ALU64_IMM(BPF_A=
DD, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3547  			BPF_ALU64_IMM(BPF_A=
DD, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3548  			BPF_ALU64_IMM(BPF_A=
DD, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3549  			BPF_ALU64_IMM(BPF_A=
DD, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3550  			BPF_ALU64_IMM(BPF_A=
DD, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3551  			BPF_ALU64_IMM(BPF_A=
DD, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3552  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3553  			BPF_ALU32_REG(BPF_A=
DD, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3554  			BPF_ALU32_REG(BPF_A=
DD, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3555  			BPF_ALU32_REG(BPF_A=
DD, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3556  			BPF_ALU32_REG(BPF_A=
DD, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3557  			BPF_ALU32_REG(BPF_A=
DD, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3558  			BPF_ALU32_REG(BPF_A=
DD, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3559  			BPF_ALU32_REG(BPF_A=
DD, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3560  			BPF_ALU32_REG(BPF_A=
DD, R0, R9), /* R0 =3D=3D 155 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3561  			BPF_JMP_IMM(BPF_JEQ=
, R0, 155, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3562  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3563  			BPF_ALU32_REG(BPF_A=
DD, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3564  			BPF_ALU32_REG(BPF_A=
DD, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3565  			BPF_ALU32_REG(BPF_A=
DD, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3566  			BPF_ALU32_REG(BPF_A=
DD, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3567  			BPF_ALU32_REG(BPF_A=
DD, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3568  			BPF_ALU32_REG(BPF_A=
DD, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3569  			BPF_ALU32_REG(BPF_A=
DD, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3570  			BPF_ALU32_REG(BPF_A=
DD, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3571  			BPF_ALU32_REG(BPF_A=
DD, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3572  			BPF_ALU32_REG(BPF_A=
DD, R1, R9), /* R1 =3D=3D 456 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3573  			BPF_JMP_IMM(BPF_JEQ=
, R1, 456, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3574  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3575  			BPF_ALU32_REG(BPF_A=
DD, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3576  			BPF_ALU32_REG(BPF_A=
DD, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3577  			BPF_ALU32_REG(BPF_A=
DD, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3578  			BPF_ALU32_REG(BPF_A=
DD, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3579  			BPF_ALU32_REG(BPF_A=
DD, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3580  			BPF_ALU32_REG(BPF_A=
DD, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3581  			BPF_ALU32_REG(BPF_A=
DD, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3582  			BPF_ALU32_REG(BPF_A=
DD, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3583  			BPF_ALU32_REG(BPF_A=
DD, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3584  			BPF_ALU32_REG(BPF_A=
DD, R2, R9), /* R2 =3D=3D 1358 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3585  			BPF_JMP_IMM(BPF_JEQ=
, R2, 1358, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3586  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3587  			BPF_ALU32_REG(BPF_A=
DD, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3588  			BPF_ALU32_REG(BPF_A=
DD, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3589  			BPF_ALU32_REG(BPF_A=
DD, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3590  			BPF_ALU32_REG(BPF_A=
DD, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3591  			BPF_ALU32_REG(BPF_A=
DD, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3592  			BPF_ALU32_REG(BPF_A=
DD, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3593  			BPF_ALU32_REG(BPF_A=
DD, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3594  			BPF_ALU32_REG(BPF_A=
DD, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3595  			BPF_ALU32_REG(BPF_A=
DD, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3596  			BPF_ALU32_REG(BPF_A=
DD, R3, R9), /* R3 =3D=3D 4063 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3597  			BPF_JMP_IMM(BPF_JEQ=
, R3, 4063, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3598  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3599  			BPF_ALU32_REG(BPF_A=
DD, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3600  			BPF_ALU32_REG(BPF_A=
DD, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3601  			BPF_ALU32_REG(BPF_A=
DD, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3602  			BPF_ALU32_REG(BPF_A=
DD, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3603  			BPF_ALU32_REG(BPF_A=
DD, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3604  			BPF_ALU32_REG(BPF_A=
DD, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3605  			BPF_ALU32_REG(BPF_A=
DD, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3606  			BPF_ALU32_REG(BPF_A=
DD, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3607  			BPF_ALU32_REG(BPF_A=
DD, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3608  			BPF_ALU32_REG(BPF_A=
DD, R4, R9), /* R4 =3D=3D 12177 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3609  			BPF_JMP_IMM(BPF_JEQ=
, R4, 12177, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3610  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3611  			BPF_ALU32_REG(BPF_A=
DD, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3612  			BPF_ALU32_REG(BPF_A=
DD, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3613  			BPF_ALU32_REG(BPF_A=
DD, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3614  			BPF_ALU32_REG(BPF_A=
DD, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3615  			BPF_ALU32_REG(BPF_A=
DD, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3616  			BPF_ALU32_REG(BPF_A=
DD, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3617  			BPF_ALU32_REG(BPF_A=
DD, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3618  			BPF_ALU32_REG(BPF_A=
DD, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3619  			BPF_ALU32_REG(BPF_A=
DD, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3620  			BPF_ALU32_REG(BPF_A=
DD, R5, R9), /* R5 =3D=3D 36518 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3621  			BPF_JMP_IMM(BPF_JEQ=
, R5, 36518, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3622  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3623  			BPF_ALU32_REG(BPF_A=
DD, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3624  			BPF_ALU32_REG(BPF_A=
DD, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3625  			BPF_ALU32_REG(BPF_A=
DD, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3626  			BPF_ALU32_REG(BPF_A=
DD, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3627  			BPF_ALU32_REG(BPF_A=
DD, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3628  			BPF_ALU32_REG(BPF_A=
DD, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3629  			BPF_ALU32_REG(BPF_A=
DD, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3630  			BPF_ALU32_REG(BPF_A=
DD, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3631  			BPF_ALU32_REG(BPF_A=
DD, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3632  			BPF_ALU32_REG(BPF_A=
DD, R6, R9), /* R6 =3D=3D 109540 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3633  			BPF_JMP_IMM(BPF_JEQ=
, R6, 109540, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3634  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3635  			BPF_ALU32_REG(BPF_A=
DD, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3636  			BPF_ALU32_REG(BPF_A=
DD, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3637  			BPF_ALU32_REG(BPF_A=
DD, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3638  			BPF_ALU32_REG(BPF_A=
DD, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3639  			BPF_ALU32_REG(BPF_A=
DD, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3640  			BPF_ALU32_REG(BPF_A=
DD, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3641  			BPF_ALU32_REG(BPF_A=
DD, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3642  			BPF_ALU32_REG(BPF_A=
DD, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3643  			BPF_ALU32_REG(BPF_A=
DD, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3644  			BPF_ALU32_REG(BPF_A=
DD, R7, R9), /* R7 =3D=3D 328605 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3645  			BPF_JMP_IMM(BPF_JEQ=
, R7, 328605, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3646  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3647  			BPF_ALU32_REG(BPF_A=
DD, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3648  			BPF_ALU32_REG(BPF_A=
DD, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3649  			BPF_ALU32_REG(BPF_A=
DD, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3650  			BPF_ALU32_REG(BPF_A=
DD, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3651  			BPF_ALU32_REG(BPF_A=
DD, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3652  			BPF_ALU32_REG(BPF_A=
DD, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3653  			BPF_ALU32_REG(BPF_A=
DD, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3654  			BPF_ALU32_REG(BPF_A=
DD, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3655  			BPF_ALU32_REG(BPF_A=
DD, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3656  			BPF_ALU32_REG(BPF_A=
DD, R8, R9), /* R8 =3D=3D 985799 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3657  			BPF_JMP_IMM(BPF_JEQ=
, R8, 985799, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3658  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3659  			BPF_ALU32_REG(BPF_A=
DD, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3660  			BPF_ALU32_REG(BPF_A=
DD, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3661  			BPF_ALU32_REG(BPF_A=
DD, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3662  			BPF_ALU32_REG(BPF_A=
DD, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3663  			BPF_ALU32_REG(BPF_A=
DD, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3664  			BPF_ALU32_REG(BPF_A=
DD, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3665  			BPF_ALU32_REG(BPF_A=
DD, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3666  			BPF_ALU32_REG(BPF_A=
DD, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3667  			BPF_ALU32_REG(BPF_A=
DD, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3668  			BPF_ALU32_REG(BPF_A=
DD, R9, R9), /* R9 =3D=3D 2957380 */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3669  			BPF_ALU32_REG(BPF_M=
OV, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3670  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3671  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3672  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3673  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3674  		{ { 0, 2957380 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3675  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3676  	{	/* Mainly checking =
JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3677  		"INT: SUB",
ece80490e2c1cef Andrew Morton      2014-05-22  3678  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3679  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3680  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3681  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3682  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3683  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3684  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3685  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3686  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3687  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3688  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3689  			BPF_ALU64_REG(BPF_S=
UB, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3690  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3691  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3692  			BPF_ALU64_REG(BPF_S=
UB, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3693  			BPF_ALU64_REG(BPF_S=
UB, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3694  			BPF_ALU64_REG(BPF_S=
UB, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3695  			BPF_ALU64_REG(BPF_S=
UB, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3696  			BPF_ALU64_REG(BPF_S=
UB, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3697  			BPF_ALU64_REG(BPF_S=
UB, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3698  			BPF_ALU64_REG(BPF_S=
UB, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3699  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3700  			BPF_JMP_IMM(BPF_JEQ=
, R0, -55, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3701  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3702  			BPF_ALU64_REG(BPF_S=
UB, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3703  			BPF_ALU64_REG(BPF_S=
UB, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3704  			BPF_ALU64_REG(BPF_S=
UB, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3705  			BPF_ALU64_REG(BPF_S=
UB, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3706  			BPF_ALU64_REG(BPF_S=
UB, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3707  			BPF_ALU64_REG(BPF_S=
UB, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3708  			BPF_ALU64_REG(BPF_S=
UB, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3709  			BPF_ALU64_REG(BPF_S=
UB, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3710  			BPF_ALU64_REG(BPF_S=
UB, R1, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3711  			BPF_ALU64_IMM(BPF_S=
UB, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3712  			BPF_ALU64_REG(BPF_S=
UB, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3713  			BPF_ALU64_REG(BPF_S=
UB, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3714  			BPF_ALU64_REG(BPF_S=
UB, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3715  			BPF_ALU64_REG(BPF_S=
UB, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3716  			BPF_ALU64_REG(BPF_S=
UB, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3717  			BPF_ALU64_REG(BPF_S=
UB, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3718  			BPF_ALU64_REG(BPF_S=
UB, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3719  			BPF_ALU64_REG(BPF_S=
UB, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3720  			BPF_ALU64_REG(BPF_S=
UB, R2, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3721  			BPF_ALU64_IMM(BPF_S=
UB, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3722  			BPF_ALU64_REG(BPF_S=
UB, R3, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3723  			BPF_ALU64_REG(BPF_S=
UB, R3, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3724  			BPF_ALU64_REG(BPF_S=
UB, R3, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3725  			BPF_ALU64_REG(BPF_S=
UB, R3, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3726  			BPF_ALU64_REG(BPF_S=
UB, R3, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3727  			BPF_ALU64_REG(BPF_S=
UB, R3, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3728  			BPF_ALU64_REG(BPF_S=
UB, R3, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3729  			BPF_ALU64_REG(BPF_S=
UB, R3, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3730  			BPF_ALU64_REG(BPF_S=
UB, R3, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3731  			BPF_ALU64_IMM(BPF_S=
UB, R3, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3732  			BPF_ALU64_REG(BPF_S=
UB, R4, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3733  			BPF_ALU64_REG(BPF_S=
UB, R4, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3734  			BPF_ALU64_REG(BPF_S=
UB, R4, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3735  			BPF_ALU64_REG(BPF_S=
UB, R4, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3736  			BPF_ALU64_REG(BPF_S=
UB, R4, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3737  			BPF_ALU64_REG(BPF_S=
UB, R4, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3738  			BPF_ALU64_REG(BPF_S=
UB, R4, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3739  			BPF_ALU64_REG(BPF_S=
UB, R4, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3740  			BPF_ALU64_REG(BPF_S=
UB, R4, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3741  			BPF_ALU64_IMM(BPF_S=
UB, R4, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3742  			BPF_ALU64_REG(BPF_S=
UB, R5, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3743  			BPF_ALU64_REG(BPF_S=
UB, R5, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3744  			BPF_ALU64_REG(BPF_S=
UB, R5, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3745  			BPF_ALU64_REG(BPF_S=
UB, R5, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3746  			BPF_ALU64_REG(BPF_S=
UB, R5, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3747  			BPF_ALU64_REG(BPF_S=
UB, R5, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3748  			BPF_ALU64_REG(BPF_S=
UB, R5, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3749  			BPF_ALU64_REG(BPF_S=
UB, R5, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3750  			BPF_ALU64_REG(BPF_S=
UB, R5, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3751  			BPF_ALU64_IMM(BPF_S=
UB, R5, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3752  			BPF_ALU64_REG(BPF_S=
UB, R6, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3753  			BPF_ALU64_REG(BPF_S=
UB, R6, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3754  			BPF_ALU64_REG(BPF_S=
UB, R6, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3755  			BPF_ALU64_REG(BPF_S=
UB, R6, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3756  			BPF_ALU64_REG(BPF_S=
UB, R6, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3757  			BPF_ALU64_REG(BPF_S=
UB, R6, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3758  			BPF_ALU64_REG(BPF_S=
UB, R6, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3759  			BPF_ALU64_REG(BPF_S=
UB, R6, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3760  			BPF_ALU64_REG(BPF_S=
UB, R6, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3761  			BPF_ALU64_IMM(BPF_S=
UB, R6, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3762  			BPF_ALU64_REG(BPF_S=
UB, R7, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3763  			BPF_ALU64_REG(BPF_S=
UB, R7, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3764  			BPF_ALU64_REG(BPF_S=
UB, R7, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3765  			BPF_ALU64_REG(BPF_S=
UB, R7, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3766  			BPF_ALU64_REG(BPF_S=
UB, R7, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3767  			BPF_ALU64_REG(BPF_S=
UB, R7, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3768  			BPF_ALU64_REG(BPF_S=
UB, R7, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3769  			BPF_ALU64_REG(BPF_S=
UB, R7, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3770  			BPF_ALU64_REG(BPF_S=
UB, R7, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3771  			BPF_ALU64_IMM(BPF_S=
UB, R7, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3772  			BPF_ALU64_REG(BPF_S=
UB, R8, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3773  			BPF_ALU64_REG(BPF_S=
UB, R8, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3774  			BPF_ALU64_REG(BPF_S=
UB, R8, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3775  			BPF_ALU64_REG(BPF_S=
UB, R8, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3776  			BPF_ALU64_REG(BPF_S=
UB, R8, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3777  			BPF_ALU64_REG(BPF_S=
UB, R8, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3778  			BPF_ALU64_REG(BPF_S=
UB, R8, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3779  			BPF_ALU64_REG(BPF_S=
UB, R8, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3780  			BPF_ALU64_REG(BPF_S=
UB, R8, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3781  			BPF_ALU64_IMM(BPF_S=
UB, R8, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3782  			BPF_ALU64_REG(BPF_S=
UB, R9, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3783  			BPF_ALU64_REG(BPF_S=
UB, R9, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3784  			BPF_ALU64_REG(BPF_S=
UB, R9, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3785  			BPF_ALU64_REG(BPF_S=
UB, R9, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3786  			BPF_ALU64_REG(BPF_S=
UB, R9, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3787  			BPF_ALU64_REG(BPF_S=
UB, R9, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3788  			BPF_ALU64_REG(BPF_S=
UB, R9, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3789  			BPF_ALU64_REG(BPF_S=
UB, R9, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3790  			BPF_ALU64_REG(BPF_S=
UB, R9, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3791  			BPF_ALU64_IMM(BPF_S=
UB, R9, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3792  			BPF_ALU64_IMM(BPF_S=
UB, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3793  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3794  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3795  			BPF_ALU64_REG(BPF_S=
UB, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3796  			BPF_ALU64_REG(BPF_S=
UB, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3797  			BPF_ALU64_REG(BPF_S=
UB, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3798  			BPF_ALU64_REG(BPF_S=
UB, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3799  			BPF_ALU64_REG(BPF_S=
UB, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3800  			BPF_ALU64_REG(BPF_S=
UB, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3801  			BPF_ALU64_REG(BPF_S=
UB, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3802  			BPF_ALU64_REG(BPF_S=
UB, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3803  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3804  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3805  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3806  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3807  		{ { 0, 11 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3808  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3809  	{	/* Mainly checking =
JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3810  		"INT: XOR",
ece80490e2c1cef Andrew Morton      2014-05-22  3811  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3812  			BPF_ALU64_REG(BPF_S=
UB, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3813  			BPF_ALU64_REG(BPF_X=
OR, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3814  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3815  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3816  			BPF_ALU64_IMM(BPF_M=
OV, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3817  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3818  			BPF_ALU64_REG(BPF_S=
UB, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3819  			BPF_ALU64_REG(BPF_X=
OR, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3820  			BPF_JMP_REG(BPF_JEQ=
, R1, R2, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3821  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3822  			BPF_ALU64_REG(BPF_S=
UB, R2, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3823  			BPF_ALU64_REG(BPF_X=
OR, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3824  			BPF_ALU64_IMM(BPF_M=
OV, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3825  			BPF_ALU64_IMM(BPF_M=
OV, R1, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3826  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3827  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3828  			BPF_ALU64_REG(BPF_S=
UB, R3, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3829  			BPF_ALU64_REG(BPF_X=
OR, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3830  			BPF_ALU64_IMM(BPF_M=
OV, R2, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3831  			BPF_ALU64_IMM(BPF_M=
OV, R5, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3832  			BPF_JMP_REG(BPF_JEQ=
, R3, R4, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3833  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3834  			BPF_ALU64_REG(BPF_S=
UB, R4, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3835  			BPF_ALU64_REG(BPF_X=
OR, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3836  			BPF_ALU64_IMM(BPF_M=
OV, R3, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3837  			BPF_ALU64_IMM(BPF_M=
OV, R7, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3838  			BPF_JMP_REG(BPF_JEQ=
, R5, R4, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3839  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3840  			BPF_ALU64_IMM(BPF_M=
OV, R5, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3841  			BPF_ALU64_REG(BPF_S=
UB, R5, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3842  			BPF_ALU64_REG(BPF_X=
OR, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3843  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3844  			BPF_ALU64_IMM(BPF_M=
OV, R8, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3845  			BPF_JMP_REG(BPF_JEQ=
, R5, R6, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3846  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3847  			BPF_ALU64_REG(BPF_S=
UB, R6, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3848  			BPF_ALU64_REG(BPF_X=
OR, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3849  			BPF_JMP_REG(BPF_JEQ=
, R7, R6, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3850  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3851  			BPF_ALU64_REG(BPF_S=
UB, R7, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3852  			BPF_ALU64_REG(BPF_X=
OR, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3853  			BPF_JMP_REG(BPF_JEQ=
, R7, R8, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3854  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3855  			BPF_ALU64_REG(BPF_S=
UB, R8, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3856  			BPF_ALU64_REG(BPF_X=
OR, R9, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3857  			BPF_JMP_REG(BPF_JEQ=
, R9, R8, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3858  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3859  			BPF_ALU64_REG(BPF_S=
UB, R9, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3860  			BPF_ALU64_REG(BPF_X=
OR, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3861  			BPF_JMP_REG(BPF_JEQ=
, R9, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3862  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3863  			BPF_ALU64_REG(BPF_S=
UB, R1, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3864  			BPF_ALU64_REG(BPF_X=
OR, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3865  			BPF_JMP_REG(BPF_JEQ=
, R9, R0, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3866  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3867  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3868  			BPF_ALU64_IMM(BPF_M=
OV, R0, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3869  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3870  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3871  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3872  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3873  		{ { 0, 1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3874  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3875  	{	/* Mainly checking =
JIT here. */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3876  		"INT: MUL",
ece80490e2c1cef Andrew Morton      2014-05-22  3877  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3878  			BPF_ALU64_IMM(BPF_M=
OV, R0, 11),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3879  			BPF_ALU64_IMM(BPF_M=
OV, R1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3880  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3881  			BPF_ALU64_IMM(BPF_M=
OV, R3, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3882  			BPF_ALU64_IMM(BPF_M=
OV, R4, 4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3883  			BPF_ALU64_IMM(BPF_M=
OV, R5, 5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3884  			BPF_ALU64_IMM(BPF_M=
OV, R6, 6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3885  			BPF_ALU64_IMM(BPF_M=
OV, R7, 7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3886  			BPF_ALU64_IMM(BPF_M=
OV, R8, 8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3887  			BPF_ALU64_IMM(BPF_M=
OV, R9, 9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3888  			BPF_ALU64_REG(BPF_M=
UL, R0, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3889  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3890  			BPF_ALU64_REG(BPF_M=
UL, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3891  			BPF_ALU64_REG(BPF_M=
UL, R0, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3892  			BPF_ALU64_REG(BPF_M=
UL, R0, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3893  			BPF_ALU64_REG(BPF_M=
UL, R0, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3894  			BPF_ALU64_REG(BPF_M=
UL, R0, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3895  			BPF_ALU64_REG(BPF_M=
UL, R0, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3896  			BPF_ALU64_REG(BPF_M=
UL, R0, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3897  			BPF_ALU64_REG(BPF_M=
UL, R0, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3898  			BPF_ALU64_IMM(BPF_M=
UL, R0, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3899  			BPF_JMP_IMM(BPF_JEQ=
, R0, 439084800, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3900  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3901  			BPF_ALU64_REG(BPF_M=
UL, R1, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3902  			BPF_ALU64_REG(BPF_M=
UL, R1, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3903  			BPF_ALU64_REG(BPF_M=
UL, R1, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3904  			BPF_ALU64_REG(BPF_M=
UL, R1, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3905  			BPF_ALU64_REG(BPF_M=
UL, R1, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3906  			BPF_ALU64_REG(BPF_M=
UL, R1, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3907  			BPF_ALU64_REG(BPF_M=
UL, R1, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3908  			BPF_ALU64_REG(BPF_M=
UL, R1, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3909  			BPF_ALU64_REG(BPF_M=
UL, R1, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3910  			BPF_ALU64_IMM(BPF_M=
UL, R1, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3911  			BPF_ALU64_REG(BPF_M=
OV, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3912  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3913  			BPF_JMP_IMM(BPF_JEQ=
, R2, 0x5a924, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3914  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3915  			BPF_ALU64_IMM(BPF_L=
SH, R1, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3916  			BPF_ALU64_IMM(BPF_A=
RSH, R1, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3917  			BPF_JMP_IMM(BPF_JEQ=
, R1, 0xebb90000, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3918  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3919  			BPF_ALU64_REG(BPF_M=
UL, R2, R0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3920  			BPF_ALU64_REG(BPF_M=
UL, R2, R1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3921  			BPF_ALU64_REG(BPF_M=
UL, R2, R3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3922  			BPF_ALU64_REG(BPF_M=
UL, R2, R4),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3923  			BPF_ALU64_REG(BPF_M=
UL, R2, R5),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3924  			BPF_ALU64_REG(BPF_M=
UL, R2, R6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3925  			BPF_ALU64_REG(BPF_M=
UL, R2, R7),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3926  			BPF_ALU64_REG(BPF_M=
UL, R2, R8),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3927  			BPF_ALU64_REG(BPF_M=
UL, R2, R9),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3928  			BPF_ALU64_IMM(BPF_M=
UL, R2, 10),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3929  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3930  			BPF_ALU64_REG(BPF_M=
OV, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3931  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3932  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  3933  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3934  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3935  		{ { 0, 0x35d97ef2 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  3936  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  3937  	{	/* Mainly checking =
JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  3938  		"MOV REG64",
9dd2af834dea132 Daniel Borkmann    2015-12-17  3939  		.u.insns_int =3D {
9dd2af834dea132 Daniel Borkmann    2015-12-17  3940  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3941  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3942  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3943  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3944  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3945  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3946  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3947  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3948  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3949  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3950  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3951  			BPF_ALU64_IMM(BPF_M=
OV, R1, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3952  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3953  			BPF_ALU64_IMM(BPF_M=
OV, R3, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3954  			BPF_ALU64_IMM(BPF_M=
OV, R4, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3955  			BPF_ALU64_IMM(BPF_M=
OV, R5, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3956  			BPF_ALU64_IMM(BPF_M=
OV, R6, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3957  			BPF_ALU64_IMM(BPF_M=
OV, R7, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3958  			BPF_ALU64_IMM(BPF_M=
OV, R8, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3959  			BPF_ALU64_IMM(BPF_M=
OV, R9, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3960  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3961  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3962  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3963  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3964  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3965  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3966  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3967  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3968  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3969  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3970  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3971  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3972  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  3973  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  3974  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  3975  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  3976  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  3977  	{	/* Mainly checking =
JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  3978  		"MOV REG32",
9dd2af834dea132 Daniel Borkmann    2015-12-17  3979  		.u.insns_int =3D {
9dd2af834dea132 Daniel Borkmann    2015-12-17  3980  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3981  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3982  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3983  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3984  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3985  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3986  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3987  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3988  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3989  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3990  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3991  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3992  			BPF_ALU32_IMM(BPF_M=
OV, R2, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3993  			BPF_ALU32_IMM(BPF_M=
OV, R3, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3994  			BPF_ALU32_IMM(BPF_M=
OV, R4, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3995  			BPF_ALU32_IMM(BPF_M=
OV, R5, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3996  			BPF_ALU32_IMM(BPF_M=
OV, R6, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3997  			BPF_ALU32_IMM(BPF_M=
OV, R7, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3998  			BPF_ALU32_IMM(BPF_M=
OV, R8, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  3999  			BPF_ALU32_IMM(BPF_M=
OV, R9, 0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4000  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4001  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4002  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4003  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4004  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4005  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4006  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4007  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4008  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4009  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4010  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4011  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4012  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4013  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  4014  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  4015  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  4016  	},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4017  	{	/* Mainly checking =
JIT here. */
9dd2af834dea132 Daniel Borkmann    2015-12-17  4018  		"LD IMM64",
9dd2af834dea132 Daniel Borkmann    2015-12-17  4019  		.u.insns_int =3D {
9dd2af834dea132 Daniel Borkmann    2015-12-17  4020  			BPF_LD_IMM64(R0, 0x=
ffffffffffffffffLL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4021  			BPF_MOV64_REG(R1, R=
0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4022  			BPF_MOV64_REG(R2, R=
1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4023  			BPF_MOV64_REG(R3, R=
2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4024  			BPF_MOV64_REG(R4, R=
3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4025  			BPF_MOV64_REG(R5, R=
4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4026  			BPF_MOV64_REG(R6, R=
5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4027  			BPF_MOV64_REG(R7, R=
6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4028  			BPF_MOV64_REG(R8, R=
7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4029  			BPF_MOV64_REG(R9, R=
8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4030  			BPF_LD_IMM64(R0, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4031  			BPF_LD_IMM64(R1, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4032  			BPF_LD_IMM64(R2, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4033  			BPF_LD_IMM64(R3, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4034  			BPF_LD_IMM64(R4, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4035  			BPF_LD_IMM64(R5, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4036  			BPF_LD_IMM64(R6, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4037  			BPF_LD_IMM64(R7, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4038  			BPF_LD_IMM64(R8, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4039  			BPF_LD_IMM64(R9, 0x=
0LL),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4040  			BPF_ALU64_REG(BPF_A=
DD, R0, R0),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4041  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4042  			BPF_ALU64_REG(BPF_A=
DD, R0, R2),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4043  			BPF_ALU64_REG(BPF_A=
DD, R0, R3),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4044  			BPF_ALU64_REG(BPF_A=
DD, R0, R4),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4045  			BPF_ALU64_REG(BPF_A=
DD, R0, R5),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4046  			BPF_ALU64_REG(BPF_A=
DD, R0, R6),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4047  			BPF_ALU64_REG(BPF_A=
DD, R0, R7),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4048  			BPF_ALU64_REG(BPF_A=
DD, R0, R8),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4049  			BPF_ALU64_REG(BPF_A=
DD, R0, R9),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4050  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0xfefe),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4051  			BPF_EXIT_INSN(),
9dd2af834dea132 Daniel Borkmann    2015-12-17  4052  		},
9dd2af834dea132 Daniel Borkmann    2015-12-17  4053  		INTERNAL,
9dd2af834dea132 Daniel Borkmann    2015-12-17  4054  		{ },
9dd2af834dea132 Daniel Borkmann    2015-12-17  4055  		{ { 0, 0xfefe } }
9dd2af834dea132 Daniel Borkmann    2015-12-17  4056  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4057  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4058  		"INT: ALU MIX",
ece80490e2c1cef Andrew Morton      2014-05-22  4059  		.u.insns_int =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4060  			BPF_ALU64_IMM(BPF_M=
OV, R0, 11),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4061  			BPF_ALU64_IMM(BPF_A=
DD, R0, -1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4062  			BPF_ALU64_IMM(BPF_M=
OV, R2, 2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4063  			BPF_ALU64_IMM(BPF_X=
OR, R2, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4064  			BPF_ALU64_REG(BPF_D=
IV, R0, R2),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4065  			BPF_JMP_IMM(BPF_JEQ=
, R0, 10, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4066  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4067  			BPF_ALU64_IMM(BPF_M=
OD, R0, 3),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4068  			BPF_JMP_IMM(BPF_JEQ=
, R0, 1, 1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4069  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4070  			BPF_ALU64_IMM(BPF_M=
OV, R0, -1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4071  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4072  		},
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4073  		INTERNAL,
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4074  		{ },
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4075  		{ { 0, -1 } }
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4076  	},
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4077  	{
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4078  		"INT: shifts by regi=
ster",
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4079  		.u.insns_int =3D {
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4080  			BPF_MOV64_IMM(R0, -=
1234),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4081  			BPF_MOV64_IMM(R1, 1=
),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4082  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4083  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0x7ffffd97, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4084  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4085  			BPF_MOV64_IMM(R2, 1=
),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4086  			BPF_ALU64_REG(BPF_L=
SH, R0, R2),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4087  			BPF_MOV32_IMM(R4, -=
1234),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4088  			BPF_JMP_REG(BPF_JEQ=
, R0, R4, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4089  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4090  			BPF_ALU64_IMM(BPF_A=
ND, R4, 63),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4091  			BPF_ALU64_REG(BPF_L=
SH, R0, R4), /* R0 <=3D 46 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4092  			BPF_MOV64_IMM(R3, 4=
7),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4093  			BPF_ALU64_REG(BPF_A=
RSH, R0, R3),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4094  			BPF_JMP_IMM(BPF_JEQ=
, R0, -617, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4095  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4096  			BPF_MOV64_IMM(R2, 1=
),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4097  			BPF_ALU64_REG(BPF_L=
SH, R4, R2), /* R4 =3D 46 << 1 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4098  			BPF_JMP_IMM(BPF_JEQ=
, R4, 92, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4099  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4100  			BPF_MOV64_IMM(R4, 4=
),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4101  			BPF_ALU64_REG(BPF_L=
SH, R4, R4), /* R4 =3D 4 << 4 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4102  			BPF_JMP_IMM(BPF_JEQ=
, R4, 64, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4103  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4104  			BPF_MOV64_IMM(R4, 5=
),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4105  			BPF_ALU32_REG(BPF_L=
SH, R4, R4), /* R4 =3D 5 << 5 */
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4106  			BPF_JMP_IMM(BPF_JEQ=
, R4, 160, 1),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4107  			BPF_EXIT_INSN(),
72b603ee8cfc6be Alexei Starovoitov 2014-08-25  4108  			BPF_MOV64_IMM(R0, -=
1),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4109  			BPF_EXIT_INSN(),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4110  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4111  		INTERNAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4112  		{ },
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4113  		{ { 0, -1 } }
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4114  	},
53e33f9928cd612 Johan Almbladh     2021-08-09  4115  #ifdef CONFIG_32BIT
53e33f9928cd612 Johan Almbladh     2021-08-09  4116  	{
53e33f9928cd612 Johan Almbladh     2021-08-09  4117  		"INT: 32-bit context=
 pointer word order and zero-extension",
53e33f9928cd612 Johan Almbladh     2021-08-09  4118  		.u.insns_int =3D {
53e33f9928cd612 Johan Almbladh     2021-08-09  4119  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
53e33f9928cd612 Johan Almbladh     2021-08-09  4120  			BPF_JMP32_IMM(BPF_J=
EQ, R1, 0, 3),
53e33f9928cd612 Johan Almbladh     2021-08-09  4121  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
53e33f9928cd612 Johan Almbladh     2021-08-09  4122  			BPF_JMP32_IMM(BPF_J=
NE, R1, 0, 1),
53e33f9928cd612 Johan Almbladh     2021-08-09  4123  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
53e33f9928cd612 Johan Almbladh     2021-08-09  4124  			BPF_EXIT_INSN(),
53e33f9928cd612 Johan Almbladh     2021-08-09  4125  		},
53e33f9928cd612 Johan Almbladh     2021-08-09  4126  		INTERNAL,
53e33f9928cd612 Johan Almbladh     2021-08-09  4127  		{ },
53e33f9928cd612 Johan Almbladh     2021-08-09  4128  		{ { 0, 1 } }
53e33f9928cd612 Johan Almbladh     2021-08-09  4129  	},
53e33f9928cd612 Johan Almbladh     2021-08-09  4130  #endif
64a8946b447e418 Alexei Starovoitov 2014-05-08  4131  	{
64a8946b447e418 Alexei Starovoitov 2014-05-08  4132  		"check: missing ret",
ece80490e2c1cef Andrew Morton      2014-05-22  4133  		.u.insns =3D {
64a8946b447e418 Alexei Starovoitov 2014-05-08  4134  			BPF_STMT(BPF_LD | B=
PF_IMM, 1),
64a8946b447e418 Alexei Starovoitov 2014-05-08  4135  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4136  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
64a8946b447e418 Alexei Starovoitov 2014-05-08  4137  		{ },
09584b406742413 Yonghong Song      2018-02-02  4138  		{ },
09584b406742413 Yonghong Song      2018-02-02  4139  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4140  		.expected_errcode =
=3D -EINVAL,
64a8946b447e418 Alexei Starovoitov 2014-05-08  4141  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4142  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4143  		"check: div_k_0",
ece80490e2c1cef Andrew Morton      2014-05-22  4144  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4145  			BPF_STMT(BPF_ALU | =
BPF_DIV | BPF_K, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4146  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4147  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4148  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4149  		{ },
09584b406742413 Yonghong Song      2018-02-02  4150  		{ },
09584b406742413 Yonghong Song      2018-02-02  4151  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4152  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4153  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4154  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4155  		"check: unknown insn=
",
ece80490e2c1cef Andrew Morton      2014-05-22  4156  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4157  			/* seccomp insn, re=
jected in socket filter */
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4158  			BPF_STMT(BPF_LDX | =
BPF_W | BPF_ABS, 0),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4159  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4160  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4161  		CLASSIC | FLAG_EXPEC=
TED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4162  		{ },
09584b406742413 Yonghong Song      2018-02-02  4163  		{ },
09584b406742413 Yonghong Song      2018-02-02  4164  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4165  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4166  	},
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4167  	{
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4168  		"check: out of range=
 spill/fill",
ece80490e2c1cef Andrew Morton      2014-05-22  4169  		.u.insns =3D {
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4170  			BPF_STMT(BPF_STX, 1=
6),
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4171  			BPF_STMT(BPF_RET | =
BPF_K, 0)
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4172  		},
10f18e0ba1ea7eb Daniel Borkmann    2014-05-23  4173  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4174  		{ },
09584b406742413 Yonghong Song      2018-02-02  4175  		{ },
09584b406742413 Yonghong Song      2018-02-02  4176  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4177  		.expected_errcode =
=3D -EINVAL,
9def624afdf2a81 Alexei Starovoitov 2014-05-08  4178  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4179  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4180  		"JUMPS + HOLES",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4181  		.u.insns =3D {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4182  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4183  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4184  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4185  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4186  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4187  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4188  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4189  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4190  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4191  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4192  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4193  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4194  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4195  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4196  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4197  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90c2894d, 3, 4),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4198  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4199  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90c2894d, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4200  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4201  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 14, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4202  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 14),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4203  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4204  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4205  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4206  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4207  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4208  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4209  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4210  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4211  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4212  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4213  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4214  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4215  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4216  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x2ac28349, 2, 3),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4217  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x2ac28349, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4218  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4219  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 14, 15),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4220  			BPF_JUMP(BPF_JMP | =
BPF_JGE, 0, 13, 14),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4221  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4222  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4223  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4224  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4225  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4226  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4227  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4228  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4229  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4230  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4231  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4232  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4233  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4234  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90d2ff41, 2, 3),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4235  			BPF_JUMP(BPF_JMP | =
BPF_JEQ, 0x90d2ff41, 1, 2),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4236  			BPF_STMT(BPF_LD | B=
PF_H | BPF_ABS, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4237  			BPF_STMT(BPF_RET | =
BPF_A, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4238  			BPF_STMT(BPF_RET | =
BPF_A, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4239  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4240  		CLASSIC,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4241  		{ 0x00, 0x1b, 0x21, =
0x3c, 0x9d, 0xf8,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4242  		  0x90, 0xe2, 0xba, =
0x0a, 0x56, 0xb4,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4243  		  0x08, 0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4244  		  0x45, 0x00, 0x00, =
0x28, 0x00, 0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4245  		  0x20, 0x00, 0x40, =
0x11, 0x00, 0x00, /* IP header */
ce25b68b74593bb Daniel Borkmann    2014-05-26  4246  		  0xc0, 0xa8, 0x33, =
0x01,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4247  		  0xc0, 0xa8, 0x33, =
0x02,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4248  		  0xbb, 0xb6,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4249  		  0xa9, 0xfa,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4250  		  0x00, 0x14, 0x00, =
0x00,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4251  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4252  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4253  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4254  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4255  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4256  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4257  		  0xcc, 0xcc, 0xcc, =
0xcc, 0xcc, 0xcc,
ce25b68b74593bb Daniel Borkmann    2014-05-26  4258  		  0xcc, 0xcc, 0xcc, =
0xcc },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4259  		{ { 88, 0x001b } }
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4260  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4261  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4262  		"check: RET X",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4263  		.u.insns =3D {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4264  			BPF_STMT(BPF_RET | =
BPF_X, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4265  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4266  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4267  		{ },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4268  		{ },
09584b406742413 Yonghong Song      2018-02-02  4269  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4270  		.expected_errcode =
=3D -EINVAL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4271  	},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4272  	{
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4273  		"check: LDX + RET X",
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4274  		.u.insns =3D {
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4275  			BPF_STMT(BPF_LDX | =
BPF_IMM, 42),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4276  			BPF_STMT(BPF_RET | =
BPF_X, 0),
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4277  		},
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4278  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4279  		{ },
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4280  		{ },
09584b406742413 Yonghong Song      2018-02-02  4281  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4282  		.expected_errcode =
=3D -EINVAL,
2e8a83c52ffa418 Daniel Borkmann    2014-05-23  4283  	},
108cc22a93e1843 Daniel Borkmann    2014-05-26  4284  	{	/* Mainly checking =
JIT here. */
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4285  		"M[]: alt STX + LDX",
108cc22a93e1843 Daniel Borkmann    2014-05-26  4286  		.u.insns =3D {
108cc22a93e1843 Daniel Borkmann    2014-05-26  4287  			BPF_STMT(BPF_LDX | =
BPF_IMM, 100),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4288  			BPF_STMT(BPF_STX, 0=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4289  			BPF_STMT(BPF_LDX | =
BPF_MEM, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4290  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4291  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4292  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4293  			BPF_STMT(BPF_STX, 1=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4294  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4295  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4296  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4297  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4298  			BPF_STMT(BPF_STX, 2=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4299  			BPF_STMT(BPF_LDX | =
BPF_MEM, 2),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4300  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4301  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4302  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4303  			BPF_STMT(BPF_STX, 3=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4304  			BPF_STMT(BPF_LDX | =
BPF_MEM, 3),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4305  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4306  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4307  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4308  			BPF_STMT(BPF_STX, 4=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4309  			BPF_STMT(BPF_LDX | =
BPF_MEM, 4),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4310  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4311  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4312  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4313  			BPF_STMT(BPF_STX, 5=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4314  			BPF_STMT(BPF_LDX | =
BPF_MEM, 5),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4315  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4316  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4317  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4318  			BPF_STMT(BPF_STX, 6=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4319  			BPF_STMT(BPF_LDX | =
BPF_MEM, 6),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4320  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4321  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4322  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4323  			BPF_STMT(BPF_STX, 7=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4324  			BPF_STMT(BPF_LDX | =
BPF_MEM, 7),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4325  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4326  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4327  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4328  			BPF_STMT(BPF_STX, 8=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4329  			BPF_STMT(BPF_LDX | =
BPF_MEM, 8),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4330  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4331  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4332  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4333  			BPF_STMT(BPF_STX, 9=
),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4334  			BPF_STMT(BPF_LDX | =
BPF_MEM, 9),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4335  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4336  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4337  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4338  			BPF_STMT(BPF_STX, 1=
0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4339  			BPF_STMT(BPF_LDX | =
BPF_MEM, 10),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4340  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4341  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4342  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4343  			BPF_STMT(BPF_STX, 1=
1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4344  			BPF_STMT(BPF_LDX | =
BPF_MEM, 11),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4345  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4346  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4347  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4348  			BPF_STMT(BPF_STX, 1=
2),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4349  			BPF_STMT(BPF_LDX | =
BPF_MEM, 12),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4350  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4351  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4352  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4353  			BPF_STMT(BPF_STX, 1=
3),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4354  			BPF_STMT(BPF_LDX | =
BPF_MEM, 13),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4355  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4356  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4357  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4358  			BPF_STMT(BPF_STX, 1=
4),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4359  			BPF_STMT(BPF_LDX | =
BPF_MEM, 14),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4360  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4361  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4362  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4363  			BPF_STMT(BPF_STX, 1=
5),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4364  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4365  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4366  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_K, 1),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4367  			BPF_STMT(BPF_MISC |=
 BPF_TAX, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4368  			BPF_STMT(BPF_RET | =
BPF_A, 0),
108cc22a93e1843 Daniel Borkmann    2014-05-26  4369  		},
108cc22a93e1843 Daniel Borkmann    2014-05-26  4370  		CLASSIC | FLAG_NO_DA=
TA,
108cc22a93e1843 Daniel Borkmann    2014-05-26  4371  		{ },
108cc22a93e1843 Daniel Borkmann    2014-05-26  4372  		{ { 0, 116 } },
108cc22a93e1843 Daniel Borkmann    2014-05-26  4373  	},
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4374  	{	/* Mainly checking =
JIT here. */
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4375  		"M[]: full STX + ful=
l LDX",
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4376  		.u.insns =3D {
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4377  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbadfeedb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4378  			BPF_STMT(BPF_STX, 0=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4379  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xecabedae),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4380  			BPF_STMT(BPF_STX, 1=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4381  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xafccfeaf),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4382  			BPF_STMT(BPF_STX, 2=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4383  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbffdcedc),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4384  			BPF_STMT(BPF_STX, 3=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4385  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfbbbdccb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4386  			BPF_STMT(BPF_STX, 4=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4387  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfbabcbda),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4388  			BPF_STMT(BPF_STX, 5=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4389  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaedecbdb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4390  			BPF_STMT(BPF_STX, 6=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4391  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xadebbade),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4392  			BPF_STMT(BPF_STX, 7=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4393  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfcfcfaec),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4394  			BPF_STMT(BPF_STX, 8=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4395  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbcdddbdc),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4396  			BPF_STMT(BPF_STX, 9=
),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4397  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfeefdfac),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4398  			BPF_STMT(BPF_STX, 1=
0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4399  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xcddcdeea),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4400  			BPF_STMT(BPF_STX, 1=
1),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4401  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaccfaebb),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4402  			BPF_STMT(BPF_STX, 1=
2),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4403  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xbdcccdcf),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4404  			BPF_STMT(BPF_STX, 1=
3),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4405  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xaaedecde),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4406  			BPF_STMT(BPF_STX, 1=
4),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4407  			BPF_STMT(BPF_LDX | =
BPF_IMM, 0xfaeacdad),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4408  			BPF_STMT(BPF_STX, 1=
5),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4409  			BPF_STMT(BPF_LDX | =
BPF_MEM, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4410  			BPF_STMT(BPF_MISC |=
 BPF_TXA, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4411  			BPF_STMT(BPF_LDX | =
BPF_MEM, 1),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4412  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4413  			BPF_STMT(BPF_LDX | =
BPF_MEM, 2),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4414  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4415  			BPF_STMT(BPF_LDX | =
BPF_MEM, 3),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4416  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4417  			BPF_STMT(BPF_LDX | =
BPF_MEM, 4),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4418  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4419  			BPF_STMT(BPF_LDX | =
BPF_MEM, 5),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4420  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4421  			BPF_STMT(BPF_LDX | =
BPF_MEM, 6),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4422  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4423  			BPF_STMT(BPF_LDX | =
BPF_MEM, 7),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4424  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4425  			BPF_STMT(BPF_LDX | =
BPF_MEM, 8),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4426  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4427  			BPF_STMT(BPF_LDX | =
BPF_MEM, 9),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4428  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4429  			BPF_STMT(BPF_LDX | =
BPF_MEM, 10),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4430  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4431  			BPF_STMT(BPF_LDX | =
BPF_MEM, 11),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4432  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4433  			BPF_STMT(BPF_LDX | =
BPF_MEM, 12),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4434  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4435  			BPF_STMT(BPF_LDX | =
BPF_MEM, 13),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4436  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4437  			BPF_STMT(BPF_LDX | =
BPF_MEM, 14),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4438  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4439  			BPF_STMT(BPF_LDX | =
BPF_MEM, 15),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4440  			BPF_STMT(BPF_ALU | =
BPF_ADD | BPF_X, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4441  			BPF_STMT(BPF_RET | =
BPF_A, 0),
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4442  		},
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4443  		CLASSIC | FLAG_NO_DA=
TA,
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4444  		{ },
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4445  		{ { 0, 0x2a5a5e5 } },
9fe13baad6b1e8d Daniel Borkmann    2014-05-29  4446  	},
d50bc1575096250 Daniel Borkmann    2014-05-29  4447  	{
d50bc1575096250 Daniel Borkmann    2014-05-29  4448  		"check: SKF_AD_MAX",
d50bc1575096250 Daniel Borkmann    2014-05-29  4449  		.u.insns =3D {
d50bc1575096250 Daniel Borkmann    2014-05-29  4450  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
d50bc1575096250 Daniel Borkmann    2014-05-29  4451  				 SKF_AD_OFF + SKF_=
AD_MAX),
d50bc1575096250 Daniel Borkmann    2014-05-29  4452  			BPF_STMT(BPF_RET | =
BPF_A, 0),
d50bc1575096250 Daniel Borkmann    2014-05-29  4453  		},
d50bc1575096250 Daniel Borkmann    2014-05-29  4454  		CLASSIC | FLAG_NO_DA=
TA | FLAG_EXPECTED_FAIL,
d50bc1575096250 Daniel Borkmann    2014-05-29  4455  		{ },
d50bc1575096250 Daniel Borkmann    2014-05-29  4456  		{ },
09584b406742413 Yonghong Song      2018-02-02  4457  		.fill_helper =3D NUL=
L,
09584b406742413 Yonghong Song      2018-02-02  4458  		.expected_errcode =
=3D -EINVAL,
d50bc1575096250 Daniel Borkmann    2014-05-29  4459  	},
d50bc1575096250 Daniel Borkmann    2014-05-29  4460  	{	/* Passes checker b=
ut fails during runtime. */
d50bc1575096250 Daniel Borkmann    2014-05-29  4461  		"LD [SKF_AD_OFF-1]",
d50bc1575096250 Daniel Borkmann    2014-05-29  4462  		.u.insns =3D {
d50bc1575096250 Daniel Borkmann    2014-05-29  4463  			BPF_STMT(BPF_LD | B=
PF_W | BPF_ABS,
d50bc1575096250 Daniel Borkmann    2014-05-29  4464  				 SKF_AD_OFF - 1),
d50bc1575096250 Daniel Borkmann    2014-05-29  4465  			BPF_STMT(BPF_RET | =
BPF_K, 1),
d50bc1575096250 Daniel Borkmann    2014-05-29  4466  		},
d50bc1575096250 Daniel Borkmann    2014-05-29  4467  		CLASSIC,
d50bc1575096250 Daniel Borkmann    2014-05-29  4468  		{ },
d50bc1575096250 Daniel Borkmann    2014-05-29  4469  		{ { 1, 0 } },
d50bc1575096250 Daniel Borkmann    2014-05-29  4470  	},
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4471  	{
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4472  		"load 64-bit immedia=
te",
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4473  		.u.insns_int =3D {
25ee7327d04bc3f Alexei Starovoitov 2014-09-19  4474  			BPF_LD_IMM64(R1, 0x=
567800001234LL),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4475  			BPF_MOV64_REG(R2, R=
1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4476  			BPF_MOV64_REG(R3, R=
2),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4477  			BPF_ALU64_IMM(BPF_R=
SH, R2, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4478  			BPF_ALU64_IMM(BPF_L=
SH, R3, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4479  			BPF_ALU64_IMM(BPF_R=
SH, R3, 32),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4480  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4481  			BPF_JMP_IMM(BPF_JEQ=
, R2, 0x5678, 1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4482  			BPF_EXIT_INSN(),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4483  			BPF_JMP_IMM(BPF_JEQ=
, R3, 0x1234, 1),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4484  			BPF_EXIT_INSN(),
986ccfdbd90a292 Xi Wang            2015-05-09  4485  			BPF_LD_IMM64(R0, 0x=
1ffffffffLL),
986ccfdbd90a292 Xi Wang            2015-05-09  4486  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32), /* R0 =3D 1 */
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4487  			BPF_EXIT_INSN(),
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4488  		},
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4489  		INTERNAL,
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4490  		{ },
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4491  		{ { 0, 1 } }
02ab695bb37ee9a Alexei Starovoitov 2014-09-04  4492  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4493  	/* BPF_ALU | BPF_MOV =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  4494  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4495  		"ALU_MOV_X: dst =3D =
2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4496  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4497  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4498  			BPF_ALU32_REG(BPF_M=
OV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4499  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4500  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4501  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4502  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4503  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4504  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4505  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4506  		"ALU_MOV_X: dst =3D =
4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4507  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4508  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4509  			BPF_ALU32_REG(BPF_M=
OV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4510  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4511  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4512  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4513  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4514  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4515  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4516  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4517  		"ALU64_MOV_X: dst =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4518  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4519  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4520  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4521  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4522  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4523  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4524  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4525  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4526  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4527  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4528  		"ALU64_MOV_X: dst =
=3D 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4529  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4530  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4531  			BPF_ALU64_REG(BPF_M=
OV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4532  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4533  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4534  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4535  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4536  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4537  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4538  	/* BPF_ALU | BPF_MOV =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  4539  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4540  		"ALU_MOV_K: dst =3D =
2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4541  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4542  			BPF_ALU32_IMM(BPF_M=
OV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4543  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4544  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4545  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4546  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4547  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4548  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4549  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4550  		"ALU_MOV_K: dst =3D =
4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4551  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4552  			BPF_ALU32_IMM(BPF_M=
OV, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4553  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4554  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4555  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4556  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4557  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4558  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4559  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4560  		"ALU_MOV_K: 0x0000ff=
ffffff0000 =3D 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  4561  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4562  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4563  			BPF_LD_IMM64(R3, 0x=
00000000ffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  4564  			BPF_ALU32_IMM(BPF_M=
OV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  4565  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4566  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4567  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4568  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4569  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4570  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4571  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4572  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4573  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4574  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4575  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4576  		"ALU_MOV_K: small ne=
gative",
565731acfcf28ff Johan Almbladh     2021-08-09  4577  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4578  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4579  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4580  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4581  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4582  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4583  		{ { 0, -123 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4584  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4585  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4586  		"ALU_MOV_K: small ne=
gative zero extension",
565731acfcf28ff Johan Almbladh     2021-08-09  4587  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4588  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4589  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  4590  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4591  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4592  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4593  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4594  		{ { 0, 0 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4595  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4596  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4597  		"ALU_MOV_K: large ne=
gative",
565731acfcf28ff Johan Almbladh     2021-08-09  4598  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4599  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  4600  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4601  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4602  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4603  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4604  		{ { 0, -123456789 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4605  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4606  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4607  		"ALU_MOV_K: large ne=
gative zero extension",
565731acfcf28ff Johan Almbladh     2021-08-09  4608  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4609  			BPF_ALU32_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  4610  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  4611  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4612  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4613  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4614  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4615  		{ { 0, 0 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4616  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4617  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4618  		"ALU64_MOV_K: dst =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  4619  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4620  			BPF_ALU64_IMM(BPF_M=
OV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4621  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4622  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4623  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4624  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4625  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4626  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4627  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4628  		"ALU64_MOV_K: dst =
=3D 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  4629  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4630  			BPF_ALU64_IMM(BPF_M=
OV, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  4631  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4632  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4633  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4634  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4635  		{ { 0, 2147483647 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  4636  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4637  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4638  		"ALU64_OR_K: dst =3D=
 0x0",
cffc642d93f9324 Michael Holzheu    2015-05-11  4639  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4640  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  4641  			BPF_LD_IMM64(R3, 0x=
0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4642  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4643  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4644  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4645  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4646  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4647  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4648  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4649  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4650  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4651  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4652  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4653  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4654  		"ALU64_MOV_K: dst =
=3D -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  4655  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  4656  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4657  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  4658  			BPF_ALU64_IMM(BPF_M=
OV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  4659  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4660  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4661  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4662  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4663  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4664  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4665  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4666  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4667  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4668  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4669  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4670  		"ALU64_MOV_K: small =
negative",
565731acfcf28ff Johan Almbladh     2021-08-09  4671  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4672  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4673  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4674  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4675  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4676  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4677  		{ { 0, -123 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4678  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4679  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4680  		"ALU64_MOV_K: small =
negative sign extension",
565731acfcf28ff Johan Almbladh     2021-08-09  4681  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4682  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123),
565731acfcf28ff Johan Almbladh     2021-08-09  4683  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  4684  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4685  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4686  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4687  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4688  		{ { 0, 0xffffffff } }
565731acfcf28ff Johan Almbladh     2021-08-09  4689  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4690  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4691  		"ALU64_MOV_K: large =
negative",
565731acfcf28ff Johan Almbladh     2021-08-09  4692  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4693  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  4694  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4695  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4696  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4697  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4698  		{ { 0, -123456789 } }
565731acfcf28ff Johan Almbladh     2021-08-09  4699  	},
565731acfcf28ff Johan Almbladh     2021-08-09  4700  	{
565731acfcf28ff Johan Almbladh     2021-08-09  4701  		"ALU64_MOV_K: large =
negative sign extension",
565731acfcf28ff Johan Almbladh     2021-08-09  4702  		.u.insns_int =3D {
565731acfcf28ff Johan Almbladh     2021-08-09  4703  			BPF_ALU64_IMM(BPF_M=
OV, R0, -123456789),
565731acfcf28ff Johan Almbladh     2021-08-09  4704  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
565731acfcf28ff Johan Almbladh     2021-08-09  4705  			BPF_EXIT_INSN(),
565731acfcf28ff Johan Almbladh     2021-08-09  4706  		},
565731acfcf28ff Johan Almbladh     2021-08-09  4707  		INTERNAL,
565731acfcf28ff Johan Almbladh     2021-08-09  4708  		{ },
565731acfcf28ff Johan Almbladh     2021-08-09  4709  		{ { 0, 0xffffffff } }
565731acfcf28ff Johan Almbladh     2021-08-09  4710  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4711  	/* BPF_ALU | BPF_ADD =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  4712  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4713  		"ALU_ADD_X: 1 + 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4714  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4715  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4716  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4717  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4718  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4719  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4720  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4721  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4722  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4723  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4724  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4725  		"ALU_ADD_X: 1 + 4294=
967294 =3D 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4726  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4727  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4728  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4729  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4730  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4731  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4732  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4733  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4734  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4735  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  4736  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  4737  		"ALU_ADD_X: 2 + 4294=
967294 =3D 0",
b64b50eac47046f Naveen N. Rao      2016-04-05  4738  		.u.insns_int =3D {
b64b50eac47046f Naveen N. Rao      2016-04-05  4739  			BPF_LD_IMM64(R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4740  			BPF_LD_IMM64(R1, 42=
94967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  4741  			BPF_ALU32_REG(BPF_A=
DD, R0, R1),
b64b50eac47046f Naveen N. Rao      2016-04-05  4742  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4743  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  4744  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4745  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  4746  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4747  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  4748  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  4749  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  4750  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  4751  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4752  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4753  		"ALU64_ADD_X: 1 + 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4754  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4755  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4756  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4757  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4758  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4759  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4760  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4761  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4762  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4763  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4764  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4765  		"ALU64_ADD_X: 1 + 42=
94967294 =3D 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4766  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4767  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4768  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4769  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4770  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4771  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4772  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4773  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4774  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4775  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  4776  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  4777  		"ALU64_ADD_X: 2 + 42=
94967294 =3D 4294967296",
b64b50eac47046f Naveen N. Rao      2016-04-05  4778  		.u.insns_int =3D {
b64b50eac47046f Naveen N. Rao      2016-04-05  4779  			BPF_LD_IMM64(R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4780  			BPF_LD_IMM64(R1, 42=
94967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  4781  			BPF_LD_IMM64(R2, 42=
94967296ULL),
b64b50eac47046f Naveen N. Rao      2016-04-05  4782  			BPF_ALU64_REG(BPF_A=
DD, R0, R1),
b64b50eac47046f Naveen N. Rao      2016-04-05  4783  			BPF_JMP_REG(BPF_JEQ=
, R0, R2, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4784  			BPF_MOV32_IMM(R0, 0=
),
b64b50eac47046f Naveen N. Rao      2016-04-05  4785  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4786  			BPF_MOV32_IMM(R0, 1=
),
b64b50eac47046f Naveen N. Rao      2016-04-05  4787  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4788  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  4789  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  4790  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  4791  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  4792  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4793  	/* BPF_ALU | BPF_ADD =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  4794  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4795  		"ALU_ADD_K: 1 + 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4796  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4797  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4798  			BPF_ALU32_IMM(BPF_A=
DD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4799  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4800  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4801  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4802  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4803  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4804  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4805  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4806  		"ALU_ADD_K: 3 + 0 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4807  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4808  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  4809  			BPF_ALU32_IMM(BPF_A=
DD, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4810  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4811  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4812  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4813  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4814  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4815  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4816  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4817  		"ALU_ADD_K: 1 + 4294=
967294 =3D 4294967295",
cffc642d93f9324 Michael Holzheu    2015-05-11  4818  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4819  			BPF_LD_IMM64(R0, 1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  4820  			BPF_ALU32_IMM(BPF_A=
DD, R0, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  4821  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4822  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4823  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4824  		{ },
56cbaa45dde2356 Michael Holzheu    2015-05-13  4825  		{ { 0, 4294967295U }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  4826  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  4827  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  4828  		"ALU_ADD_K: 42949672=
94 + 2 =3D 0",
b64b50eac47046f Naveen N. Rao      2016-04-05  4829  		.u.insns_int =3D {
b64b50eac47046f Naveen N. Rao      2016-04-05  4830  			BPF_LD_IMM64(R0, 42=
94967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  4831  			BPF_ALU32_IMM(BPF_A=
DD, R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4832  			BPF_JMP_IMM(BPF_JEQ=
, R0, 0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4833  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  4834  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4835  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  4836  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4837  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  4838  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  4839  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  4840  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  4841  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4842  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4843  		"ALU_ADD_K: 0 + (-1)=
 =3D 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  4844  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4845  			BPF_LD_IMM64(R2, 0x=
0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4846  			BPF_LD_IMM64(R3, 0x=
00000000ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  4847  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  4848  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4849  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4850  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4851  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4852  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4853  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4854  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4855  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4856  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4857  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4858  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4859  		"ALU_ADD_K: 0 + 0xff=
ff =3D 0xffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4860  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4861  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4862  			BPF_LD_IMM64(R3, 0x=
ffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4863  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4864  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4865  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4866  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4867  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4868  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4869  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4870  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4871  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4872  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4873  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4874  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4875  		"ALU_ADD_K: 0 + 0x7f=
ffffff =3D 0x7fffffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4876  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4877  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4878  			BPF_LD_IMM64(R3, 0x=
7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4879  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4880  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4881  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4882  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4883  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4884  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4885  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4886  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4887  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4888  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4889  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4890  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4891  		"ALU_ADD_K: 0 + 0x80=
000000 =3D 0x80000000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4892  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4893  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4894  			BPF_LD_IMM64(R3, 0x=
80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4895  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4896  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4897  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4898  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4899  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4900  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4901  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4902  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4903  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4904  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4905  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4906  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4907  		"ALU_ADD_K: 0 + 0x80=
008000 =3D 0x80008000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4908  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4909  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4910  			BPF_LD_IMM64(R3, 0x=
80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4911  			BPF_ALU32_IMM(BPF_A=
DD, R2, 0x80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4912  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4913  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4914  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4915  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4916  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4917  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4918  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4919  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4920  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  4921  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4922  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4923  		"ALU64_ADD_K: 1 + 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4924  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4925  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4926  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4927  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4928  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4929  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4930  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4931  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4932  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4933  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4934  		"ALU64_ADD_K: 3 + 0 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  4935  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4936  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  4937  			BPF_ALU64_IMM(BPF_A=
DD, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4938  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4939  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4940  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4941  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4942  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4943  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4944  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4945  		"ALU64_ADD_K: 1 + 21=
47483646 =3D 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  4946  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4947  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4948  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2147483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  4949  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4950  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4951  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4952  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4953  		{ { 0, 2147483647 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  4954  	},
b64b50eac47046f Naveen N. Rao      2016-04-05  4955  	{
b64b50eac47046f Naveen N. Rao      2016-04-05  4956  		"ALU64_ADD_K: 429496=
7294 + 2 =3D 4294967296",
b64b50eac47046f Naveen N. Rao      2016-04-05  4957  		.u.insns_int =3D {
b64b50eac47046f Naveen N. Rao      2016-04-05  4958  			BPF_LD_IMM64(R0, 42=
94967294U),
b64b50eac47046f Naveen N. Rao      2016-04-05  4959  			BPF_LD_IMM64(R1, 42=
94967296ULL),
b64b50eac47046f Naveen N. Rao      2016-04-05  4960  			BPF_ALU64_IMM(BPF_A=
DD, R0, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4961  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
b64b50eac47046f Naveen N. Rao      2016-04-05  4962  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0),
b64b50eac47046f Naveen N. Rao      2016-04-05  4963  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4964  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
b64b50eac47046f Naveen N. Rao      2016-04-05  4965  			BPF_EXIT_INSN(),
b64b50eac47046f Naveen N. Rao      2016-04-05  4966  		},
b64b50eac47046f Naveen N. Rao      2016-04-05  4967  		INTERNAL,
b64b50eac47046f Naveen N. Rao      2016-04-05  4968  		{ },
b64b50eac47046f Naveen N. Rao      2016-04-05  4969  		{ { 0, 1 } },
b64b50eac47046f Naveen N. Rao      2016-04-05  4970  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4971  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4972  		"ALU64_ADD_K: 214748=
3646 + -2147483647 =3D -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  4973  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4974  			BPF_LD_IMM64(R0, 21=
47483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  4975  			BPF_ALU64_IMM(BPF_A=
DD, R0, -2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  4976  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4977  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4978  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4979  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4980  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4981  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4982  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4983  		"ALU64_ADD_K: 1 + 0 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  4984  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  4985  			BPF_LD_IMM64(R2, 0x=
1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4986  			BPF_LD_IMM64(R3, 0x=
1),
cffc642d93f9324 Michael Holzheu    2015-05-11  4987  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  4988  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  4989  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4990  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4991  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  4992  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  4993  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  4994  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  4995  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  4996  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  4997  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  4998  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  4999  		"ALU64_ADD_K: 0 + (-=
1) =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5000  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5001  			BPF_LD_IMM64(R2, 0x=
0),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5002  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5003  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5004  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5005  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5006  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5007  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5008  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5009  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5010  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5011  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5012  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5013  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5014  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5015  		"ALU64_ADD_K: 0 + 0x=
ffff =3D 0xffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5016  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5017  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5018  			BPF_LD_IMM64(R3, 0x=
ffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5019  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0xffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5020  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5021  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5022  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5023  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5024  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5025  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5026  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5027  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5028  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5029  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5030  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5031  		"ALU64_ADD_K: 0 + 0x=
7fffffff =3D 0x7fffffff",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5032  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5033  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5034  			BPF_LD_IMM64(R3, 0x=
7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5035  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x7fffffff),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5036  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5037  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5038  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5039  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5040  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5041  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5042  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5043  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5044  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5045  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5046  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5047  		"ALU64_ADD_K: 0 + 0x=
80000000 =3D 0xffffffff80000000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5048  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5049  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5050  			BPF_LD_IMM64(R3, 0x=
ffffffff80000000LL),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5051  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x80000000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5052  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5053  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5054  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5055  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5056  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5057  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5058  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5059  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5060  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5061  	},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5062  	{
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5063  		"ALU_ADD_K: 0 + 0x80=
008000 =3D 0xffffffff80008000",
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5064  		.u.insns_int =3D {
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5065  			BPF_LD_IMM64(R2, 0x=
0),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5066  			BPF_LD_IMM64(R3, 0x=
ffffffff80008000LL),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5067  			BPF_ALU64_IMM(BPF_A=
DD, R2, 0x80008000),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5068  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5069  			BPF_MOV32_IMM(R0, 2=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5070  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5071  			BPF_MOV32_IMM(R0, 1=
),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5072  			BPF_EXIT_INSN(),
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5073  		},
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5074  		INTERNAL,
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5075  		{ },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5076  		{ { 0, 0x1 } },
9c94f6c8e0d3d4b Naveen N. Rao      2016-04-05  5077  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5078  	/* BPF_ALU | BPF_SUB =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5079  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5080  		"ALU_SUB_X: 3 - 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5081  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5082  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5083  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5084  			BPF_ALU32_REG(BPF_S=
UB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5085  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5086  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5087  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5088  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5089  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5090  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5091  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5092  		"ALU_SUB_X: 42949672=
95 - 4294967294 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5093  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5094  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5095  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5096  			BPF_ALU32_REG(BPF_S=
UB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5097  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5098  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5099  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5100  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5101  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5102  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5103  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5104  		"ALU64_SUB_X: 3 - 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5105  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5106  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5107  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5108  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5109  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5110  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5111  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5112  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5113  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5114  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5115  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5116  		"ALU64_SUB_X: 429496=
7295 - 4294967294 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5117  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5118  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5119  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5120  			BPF_ALU64_REG(BPF_S=
UB, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5121  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5122  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5123  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5124  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5125  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5126  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5127  	/* BPF_ALU | BPF_SUB =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5128  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5129  		"ALU_SUB_K: 3 - 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5130  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5131  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5132  			BPF_ALU32_IMM(BPF_S=
UB, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5133  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5134  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5135  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5136  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5137  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5138  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5139  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5140  		"ALU_SUB_K: 3 - 0 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5141  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5142  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5143  			BPF_ALU32_IMM(BPF_S=
UB, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5144  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5145  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5146  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5147  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5148  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5149  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5150  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5151  		"ALU_SUB_K: 42949672=
95 - 4294967294 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5152  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5153  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5154  			BPF_ALU32_IMM(BPF_S=
UB, R0, 4294967294U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5155  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5156  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5157  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5158  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5159  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5160  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5161  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5162  		"ALU64_SUB_K: 3 - 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5163  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5164  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5165  			BPF_ALU64_IMM(BPF_S=
UB, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5166  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5167  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5168  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5169  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5170  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5171  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5172  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5173  		"ALU64_SUB_K: 3 - 0 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5174  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5175  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5176  			BPF_ALU64_IMM(BPF_S=
UB, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5177  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5178  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5179  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5180  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5181  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5182  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5183  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5184  		"ALU64_SUB_K: 429496=
7294 - 4294967295 =3D -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5185  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5186  			BPF_LD_IMM64(R0, 42=
94967294U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5187  			BPF_ALU64_IMM(BPF_S=
UB, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5188  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5189  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5190  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5191  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5192  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5193  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5194  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5195  		"ALU64_ADD_K: 214748=
3646 - 2147483647 =3D -1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5196  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5197  			BPF_LD_IMM64(R0, 21=
47483646),
cffc642d93f9324 Michael Holzheu    2015-05-11  5198  			BPF_ALU64_IMM(BPF_S=
UB, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5199  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5200  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5201  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5202  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5203  		{ { 0, -1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5204  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5205  	/* BPF_ALU | BPF_MUL =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5206  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5207  		"ALU_MUL_X: 2 * 3 =
=3D 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5208  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5209  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5210  			BPF_ALU32_IMM(BPF_M=
OV, R1, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5211  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5212  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5213  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5214  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5215  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5216  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5217  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5218  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5219  		"ALU_MUL_X: 2 * 0x7F=
FFFFF8 =3D 0xFFFFFFF0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5220  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5221  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5222  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0x7FFFFFF8),
cffc642d93f9324 Michael Holzheu    2015-05-11  5223  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5224  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5225  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5226  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5227  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5228  		{ { 0, 0xFFFFFFF0 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5229  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5230  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5231  		"ALU_MUL_X: -1 * -1 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5232  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5233  			BPF_LD_IMM64(R0, -1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5234  			BPF_ALU32_IMM(BPF_M=
OV, R1, -1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5235  			BPF_ALU32_REG(BPF_M=
UL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5236  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5237  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5238  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5239  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5240  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5241  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5242  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5243  		"ALU64_MUL_X: 2 * 3 =
=3D 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5244  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5245  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5246  			BPF_ALU32_IMM(BPF_M=
OV, R1, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5247  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5248  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5249  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5250  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5251  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5252  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5253  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5254  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5255  		"ALU64_MUL_X: 1 * 21=
47483647 =3D 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5256  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5257  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5258  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5259  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5260  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5261  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5262  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5263  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5264  		{ { 0, 2147483647 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5265  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5266  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5267  		"ALU64_MUL_X: 64x64 =
multiply, low word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5268  		.u.insns_int =3D {
faa576253d5fe75 Johan Almbladh     2021-08-09  5269  			BPF_LD_IMM64(R0, 0x=
0fedcba987654321LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5270  			BPF_LD_IMM64(R1, 0x=
123456789abcdef0LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5271  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
faa576253d5fe75 Johan Almbladh     2021-08-09  5272  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5273  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5274  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5275  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5276  		{ { 0, 0xe5618cf0 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5277  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5278  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5279  		"ALU64_MUL_X: 64x64 =
multiply, high word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5280  		.u.insns_int =3D {
faa576253d5fe75 Johan Almbladh     2021-08-09  5281  			BPF_LD_IMM64(R0, 0x=
0fedcba987654321LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5282  			BPF_LD_IMM64(R1, 0x=
123456789abcdef0LL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5283  			BPF_ALU64_REG(BPF_M=
UL, R0, R1),
faa576253d5fe75 Johan Almbladh     2021-08-09  5284  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
faa576253d5fe75 Johan Almbladh     2021-08-09  5285  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5286  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5287  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5288  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5289  		{ { 0, 0x2236d88f } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5290  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5291  	/* BPF_ALU | BPF_MUL =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5292  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5293  		"ALU_MUL_K: 2 * 3 =
=3D 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5294  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5295  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5296  			BPF_ALU32_IMM(BPF_M=
UL, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5297  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5298  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5299  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5300  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5301  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5302  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5303  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5304  		"ALU_MUL_K: 3 * 1 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5305  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5306  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5307  			BPF_ALU32_IMM(BPF_M=
UL, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5308  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5309  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5310  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5311  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5312  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5313  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5314  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5315  		"ALU_MUL_K: 2 * 0x7F=
FFFFF8 =3D 0xFFFFFFF0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5316  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5317  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5318  			BPF_ALU32_IMM(BPF_M=
UL, R0, 0x7FFFFFF8),
cffc642d93f9324 Michael Holzheu    2015-05-11  5319  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5320  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5321  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5322  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5323  		{ { 0, 0xFFFFFFF0 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5324  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5325  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5326  		"ALU_MUL_K: 1 * (-1)=
 =3D 0x00000000ffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5327  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5328  			BPF_LD_IMM64(R2, 0x=
1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5329  			BPF_LD_IMM64(R3, 0x=
00000000ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5330  			BPF_ALU32_IMM(BPF_M=
UL, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5331  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5332  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5333  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5334  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5335  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5336  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5337  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5338  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5339  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5340  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5341  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5342  		"ALU64_MUL_K: 2 * 3 =
=3D 6",
cffc642d93f9324 Michael Holzheu    2015-05-11  5343  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5344  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5345  			BPF_ALU64_IMM(BPF_M=
UL, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5346  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5347  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5348  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5349  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5350  		{ { 0, 6 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5351  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5352  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5353  		"ALU64_MUL_K: 3 * 1 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5354  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5355  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5356  			BPF_ALU64_IMM(BPF_M=
UL, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5357  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5358  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5359  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5360  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5361  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5362  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5363  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5364  		"ALU64_MUL_K: 1 * 21=
47483647 =3D 2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5365  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5366  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5367  			BPF_ALU64_IMM(BPF_M=
UL, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5368  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5369  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5370  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5371  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5372  		{ { 0, 2147483647 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5373  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5374  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5375  		"ALU64_MUL_K: 1 * -2=
147483647 =3D -2147483647",
cffc642d93f9324 Michael Holzheu    2015-05-11  5376  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5377  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5378  			BPF_ALU64_IMM(BPF_M=
UL, R0, -2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5379  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5380  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5381  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5382  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5383  		{ { 0, -2147483647 }=
 },
cffc642d93f9324 Michael Holzheu    2015-05-11  5384  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5385  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5386  		"ALU64_MUL_K: 1 * (-=
1) =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5387  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5388  			BPF_LD_IMM64(R2, 0x=
1),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5389  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5390  			BPF_ALU64_IMM(BPF_M=
UL, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5391  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5392  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5393  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5394  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5395  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5396  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5397  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5398  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5399  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5400  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5401  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5402  		"ALU64_MUL_K: 64x32 =
multiply, low word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5403  		.u.insns_int =3D {
faa576253d5fe75 Johan Almbladh     2021-08-09  5404  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5405  			BPF_ALU64_IMM(BPF_M=
UL, R0, 0x12345678),
faa576253d5fe75 Johan Almbladh     2021-08-09  5406  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5407  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5408  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5409  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5410  		{ { 0, 0xe242d208 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5411  	},
faa576253d5fe75 Johan Almbladh     2021-08-09  5412  	{
faa576253d5fe75 Johan Almbladh     2021-08-09  5413  		"ALU64_MUL_K: 64x32 =
multiply, high word",
faa576253d5fe75 Johan Almbladh     2021-08-09  5414  		.u.insns_int =3D {
faa576253d5fe75 Johan Almbladh     2021-08-09  5415  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
faa576253d5fe75 Johan Almbladh     2021-08-09  5416  			BPF_ALU64_IMM(BPF_M=
UL, R0, 0x12345678),
faa576253d5fe75 Johan Almbladh     2021-08-09  5417  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
faa576253d5fe75 Johan Almbladh     2021-08-09  5418  			BPF_EXIT_INSN(),
faa576253d5fe75 Johan Almbladh     2021-08-09  5419  		},
faa576253d5fe75 Johan Almbladh     2021-08-09  5420  		INTERNAL,
faa576253d5fe75 Johan Almbladh     2021-08-09  5421  		{ },
faa576253d5fe75 Johan Almbladh     2021-08-09  5422  		{ { 0, 0xc28f5c28 } }
faa576253d5fe75 Johan Almbladh     2021-08-09  5423  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5424  	/* BPF_ALU | BPF_DIV =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5425  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5426  		"ALU_DIV_X: 6 / 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5427  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5428  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5429  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5430  			BPF_ALU32_REG(BPF_D=
IV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5431  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5432  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5433  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5434  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5435  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5436  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5437  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5438  		"ALU_DIV_X: 42949672=
95 / 4294967295 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5439  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5440  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5441  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5442  			BPF_ALU32_REG(BPF_D=
IV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5443  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5444  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5445  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5446  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5447  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5448  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5449  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5450  		"ALU64_DIV_X: 6 / 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5451  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5452  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5453  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5454  			BPF_ALU64_REG(BPF_D=
IV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5455  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5456  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5457  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5458  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5459  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5460  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5461  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5462  		"ALU64_DIV_X: 214748=
3647 / 2147483647 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5463  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5464  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5465  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5466  			BPF_ALU64_REG(BPF_D=
IV, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5467  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5468  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5469  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5470  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5471  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5472  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5473  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5474  		"ALU64_DIV_X: 0xffff=
ffffffffffff / (-1) =3D 0x0000000000000001",
cffc642d93f9324 Michael Holzheu    2015-05-11  5475  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5476  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5477  			BPF_LD_IMM64(R4, 0x=
ffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5478  			BPF_LD_IMM64(R3, 0x=
0000000000000001LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5479  			BPF_ALU64_REG(BPF_D=
IV, R2, R4),
cffc642d93f9324 Michael Holzheu    2015-05-11  5480  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5481  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5482  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5483  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5484  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5485  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5486  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5487  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5488  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5489  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5490  	/* BPF_ALU | BPF_DIV =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5491  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5492  		"ALU_DIV_K: 6 / 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5493  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5494  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5495  			BPF_ALU32_IMM(BPF_D=
IV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5496  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5497  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5498  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5499  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5500  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5501  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5502  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5503  		"ALU_DIV_K: 3 / 1 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5504  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5505  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5506  			BPF_ALU32_IMM(BPF_D=
IV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5507  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5508  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5509  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5510  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5511  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5512  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5513  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5514  		"ALU_DIV_K: 42949672=
95 / 4294967295 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5515  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5516  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5517  			BPF_ALU32_IMM(BPF_D=
IV, R0, 4294967295U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5518  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5519  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5520  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5521  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5522  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5523  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5524  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5525  		"ALU_DIV_K: 0xffffff=
ffffffffff / (-1) =3D 0x1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5526  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5527  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5528  			BPF_LD_IMM64(R3, 0x=
1UL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5529  			BPF_ALU32_IMM(BPF_D=
IV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5530  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5531  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5532  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5533  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5534  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5535  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5536  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5537  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5538  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5539  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5540  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5541  		"ALU64_DIV_K: 6 / 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5542  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5543  			BPF_LD_IMM64(R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  5544  			BPF_ALU64_IMM(BPF_D=
IV, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5545  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5546  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5547  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5548  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5549  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5550  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5551  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5552  		"ALU64_DIV_K: 3 / 1 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5553  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5554  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5555  			BPF_ALU64_IMM(BPF_D=
IV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5556  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5557  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5558  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5559  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5560  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5561  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5562  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5563  		"ALU64_DIV_K: 214748=
3647 / 2147483647 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5564  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5565  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5566  			BPF_ALU64_IMM(BPF_D=
IV, R0, 2147483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5567  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5568  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5569  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5570  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5571  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5572  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5573  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5574  		"ALU64_DIV_K: 0xffff=
ffffffffffff / (-1) =3D 0x0000000000000001",
cffc642d93f9324 Michael Holzheu    2015-05-11  5575  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5576  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5577  			BPF_LD_IMM64(R3, 0x=
0000000000000001LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5578  			BPF_ALU64_IMM(BPF_D=
IV, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5579  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5580  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5581  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5582  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5583  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5584  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5585  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5586  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5587  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5588  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5589  	/* BPF_ALU | BPF_MOD =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5590  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5591  		"ALU_MOD_X: 3 % 2 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5592  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5593  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5594  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5595  			BPF_ALU32_REG(BPF_M=
OD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5596  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5597  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5598  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5599  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5600  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5601  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5602  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5603  		"ALU_MOD_X: 42949672=
95 % 4294967293 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5604  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5605  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5606  			BPF_ALU32_IMM(BPF_M=
OV, R1, 4294967293U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5607  			BPF_ALU32_REG(BPF_M=
OD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5608  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5609  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5610  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5611  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5612  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5613  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5614  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5615  		"ALU64_MOD_X: 3 % 2 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5616  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5617  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5618  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5619  			BPF_ALU64_REG(BPF_M=
OD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5620  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5621  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5622  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5623  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5624  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5625  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5626  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5627  		"ALU64_MOD_X: 214748=
3647 % 2147483645 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5628  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5629  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5630  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2147483645),
cffc642d93f9324 Michael Holzheu    2015-05-11  5631  			BPF_ALU64_REG(BPF_M=
OD, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5632  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5633  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5634  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5635  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5636  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5637  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5638  	/* BPF_ALU | BPF_MOD =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5639  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5640  		"ALU_MOD_K: 3 % 2 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5641  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5642  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5643  			BPF_ALU32_IMM(BPF_M=
OD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5644  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5645  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5646  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5647  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5648  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5649  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5650  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5651  		"ALU_MOD_K: 3 % 1 =
=3D 0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5652  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5653  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5654  			BPF_ALU32_IMM(BPF_M=
OD, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5655  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5656  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5657  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5658  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5659  		{ { 0, 0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5660  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5661  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5662  		"ALU_MOD_K: 42949672=
95 % 4294967293 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5663  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5664  			BPF_LD_IMM64(R0, 42=
94967295U),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5665  			BPF_ALU32_IMM(BPF_M=
OD, R0, 4294967293U),
cffc642d93f9324 Michael Holzheu    2015-05-11  5666  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5667  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5668  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5669  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5670  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5671  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5672  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5673  		"ALU64_MOD_K: 3 % 2 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  5674  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5675  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5676  			BPF_ALU64_IMM(BPF_M=
OD, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5677  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5678  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5679  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5680  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5681  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5682  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5683  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5684  		"ALU64_MOD_K: 3 % 1 =
=3D 0",
cffc642d93f9324 Michael Holzheu    2015-05-11  5685  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5686  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5687  			BPF_ALU64_IMM(BPF_M=
OD, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5688  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5689  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5690  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5691  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5692  		{ { 0, 0 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5693  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5694  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5695  		"ALU64_MOD_K: 214748=
3647 % 2147483645 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5696  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5697  			BPF_LD_IMM64(R0, 21=
47483647),
cffc642d93f9324 Michael Holzheu    2015-05-11  5698  			BPF_ALU64_IMM(BPF_M=
OD, R0, 2147483645),
cffc642d93f9324 Michael Holzheu    2015-05-11  5699  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5700  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5701  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5702  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5703  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5704  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5705  	/* BPF_ALU | BPF_AND =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5706  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5707  		"ALU_AND_X: 3 & 2 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5708  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5709  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5710  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5711  			BPF_ALU32_REG(BPF_A=
ND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5712  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5713  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5714  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5715  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5716  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5717  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5718  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5719  		"ALU_AND_X: 0xffffff=
ff & 0xffffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5720  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5721  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5722  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5723  			BPF_ALU32_REG(BPF_A=
ND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5724  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5725  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5726  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5727  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5728  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5729  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5730  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5731  		"ALU64_AND_X: 3 & 2 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5732  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5733  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5734  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5735  			BPF_ALU64_REG(BPF_A=
ND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5736  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5737  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5738  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5739  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5740  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5741  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5742  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5743  		"ALU64_AND_X: 0xffff=
ffff & 0xffffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5744  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5745  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5746  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5747  			BPF_ALU64_REG(BPF_A=
ND, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5748  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5749  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5750  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5751  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5752  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5753  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5754  	/* BPF_ALU | BPF_AND =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5755  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5756  		"ALU_AND_K: 3 & 2 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5757  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5758  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5759  			BPF_ALU32_IMM(BPF_A=
ND, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5760  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5761  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5762  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5763  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5764  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5765  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5766  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5767  		"ALU_AND_K: 0xffffff=
ff & 0xffffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5768  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5769  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5770  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5771  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5772  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5773  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5774  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5775  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5776  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5777  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5778  		"ALU_AND_K: Small im=
mediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5779  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5780  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5781  			BPF_ALU32_IMM(BPF_A=
ND, R0, 15),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5782  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5783  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5784  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5785  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5786  		{ { 0, 4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5787  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5788  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5789  		"ALU_AND_K: Large im=
mediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5790  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5791  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xf1f2f3f4),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5792  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xafbfcfdf),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5793  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5794  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5795  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5796  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5797  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5798  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5799  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5800  		"ALU_AND_K: Zero ext=
ension",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5801  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5802  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5803  			BPF_LD_IMM64(R1, 0x=
0000000080a0c0e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5804  			BPF_ALU32_IMM(BPF_A=
ND, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5805  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5806  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5807  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5808  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5809  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5810  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5811  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5812  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5813  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5814  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5815  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5816  		"ALU64_AND_K: 3 & 2 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  5817  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5818  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  5819  			BPF_ALU64_IMM(BPF_A=
ND, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5820  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5821  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5822  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5823  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5824  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5825  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5826  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5827  		"ALU64_AND_K: 0xffff=
ffff & 0xffffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5828  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5829  			BPF_LD_IMM64(R0, 0x=
ffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5830  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5831  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5832  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5833  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5834  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5835  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5836  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5837  	{
e92c813bf119324 Johan Almbladh     2021-08-09  5838  		"ALU64_AND_K: 0x0000=
ffffffff0000 & 0x0 =3D 0x0000000000000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  5839  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5840  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5841  			BPF_LD_IMM64(R3, 0x=
0000000000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5842  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5843  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5844  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5845  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5846  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5847  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5848  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5849  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5850  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5851  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5852  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5853  	{
e92c813bf119324 Johan Almbladh     2021-08-09  5854  		"ALU64_AND_K: 0x0000=
ffffffff0000 & -1 =3D 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  5855  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5856  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5857  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5858  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5859  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5860  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5861  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5862  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5863  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5864  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5865  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5866  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5867  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5868  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5869  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5870  		"ALU64_AND_K: 0xffff=
ffffffffffff & -1 =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5871  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  5872  			BPF_LD_IMM64(R2, 0x=
ffffffffffffffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  5873  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  5874  			BPF_ALU64_IMM(BPF_A=
ND, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5875  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5876  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5877  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5878  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  5879  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5880  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5881  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5882  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5883  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5884  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5885  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5886  		"ALU64_AND_K: Sign e=
xtension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5887  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5888  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5889  			BPF_LD_IMM64(R1, 0x=
00000000090b0d0fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5890  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5891  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5892  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5893  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5894  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5895  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5896  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5897  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5898  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5899  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5900  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5901  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5902  		"ALU64_AND_K: Sign e=
xtension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5903  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5904  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5905  			BPF_LD_IMM64(R1, 0x=
0123456780a0c0e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5906  			BPF_ALU64_IMM(BPF_A=
ND, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5907  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5908  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5909  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5910  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5911  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5912  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5913  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5914  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5915  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5916  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5917  	/* BPF_ALU | BPF_OR |=
 BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  5918  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5919  		"ALU_OR_X: 1 | 2 =3D=
 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5920  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5921  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5922  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5923  			BPF_ALU32_REG(BPF_O=
R, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5924  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5925  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5926  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5927  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5928  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5929  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5930  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5931  		"ALU_OR_X: 0x0 | 0xf=
fffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5932  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5933  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5934  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5935  			BPF_ALU32_REG(BPF_O=
R, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5936  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5937  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5938  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5939  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5940  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5941  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5942  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5943  		"ALU64_OR_X: 1 | 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5944  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5945  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5946  			BPF_ALU32_IMM(BPF_M=
OV, R1, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5947  			BPF_ALU64_REG(BPF_O=
R, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5948  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5949  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5950  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5951  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5952  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5953  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5954  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5955  		"ALU64_OR_X: 0 | 0xf=
fffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5956  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5957  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5958  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5959  			BPF_ALU64_REG(BPF_O=
R, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5960  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5961  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5962  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5963  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5964  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5965  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5966  	/* BPF_ALU | BPF_OR |=
 BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  5967  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5968  		"ALU_OR_K: 1 | 2 =3D=
 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  5969  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5970  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  5971  			BPF_ALU32_IMM(BPF_O=
R, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  5972  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5973  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5974  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5975  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5976  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  5977  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  5978  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  5979  		"ALU_OR_K: 0 & 0xfff=
fffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  5980  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  5981  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  5982  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  5983  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  5984  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  5985  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  5986  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  5987  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  5988  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5989  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5990  		"ALU_OR_K: Small imm=
ediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5991  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5992  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5993  			BPF_ALU32_IMM(BPF_O=
R, R0, 1),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5994  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5995  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5996  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5997  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5998  		{ { 0, 0x01020305 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  5999  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6000  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6001  		"ALU_OR_K: Large imm=
ediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6002  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6003  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6004  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xa0b0c0d0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6005  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6006  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6007  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6008  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6009  		{ { 0, 0xa1b2c3d4 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6010  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6011  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6012  		"ALU_OR_K: Zero exte=
nsion",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6013  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6014  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6015  			BPF_LD_IMM64(R1, 0x=
00000000f9fbfdffLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6016  			BPF_ALU32_IMM(BPF_O=
R, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6017  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6018  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6019  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6020  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6021  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6022  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6023  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6024  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6025  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6026  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6027  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6028  		"ALU64_OR_K: 1 | 2 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6029  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6030  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6031  			BPF_ALU64_IMM(BPF_O=
R, R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6032  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6033  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6034  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6035  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6036  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6037  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6038  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6039  		"ALU64_OR_K: 0 & 0xf=
fffffff =3D 0xffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6040  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6041  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6042  			BPF_ALU64_IMM(BPF_O=
R, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6043  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6044  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6045  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6046  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6047  		{ { 0, 0xffffffff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6048  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6049  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6050  		"ALU64_OR_K: 0x0000f=
fffffff0000 | 0x0 =3D 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6051  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6052  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6053  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6054  			BPF_ALU64_IMM(BPF_O=
R, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6055  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6056  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6057  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6058  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6059  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6060  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6061  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6062  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6063  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6064  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6065  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6066  		"ALU64_OR_K: 0x0000f=
fffffff0000 | -1 =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6067  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6068  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6069  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6070  			BPF_ALU64_IMM(BPF_O=
R, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6071  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6072  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6073  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6074  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6075  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6076  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6077  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6078  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6079  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6080  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6081  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6082  		"ALU64_OR_K: 0x00000=
0000000000 | -1 =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6083  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6084  			BPF_LD_IMM64(R2, 0x=
0000000000000000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6085  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6086  			BPF_ALU64_IMM(BPF_O=
R, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6087  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6088  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6089  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6090  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6091  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6092  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6093  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6094  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6095  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6096  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6097  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6098  		"ALU64_OR_K: Sign ex=
tension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6099  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6100  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6101  			BPF_LD_IMM64(R1, 0x=
012345678fafcfefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6102  			BPF_ALU64_IMM(BPF_O=
R, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6103  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6104  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6105  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6106  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6107  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6108  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6109  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6110  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6111  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6112  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6113  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6114  		"ALU64_OR_K: Sign ex=
tension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6115  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6116  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6117  			BPF_LD_IMM64(R1, 0x=
fffffffff9fbfdffLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6118  			BPF_ALU64_IMM(BPF_O=
R, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6119  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6120  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6121  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6122  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6123  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6124  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6125  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6126  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6127  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6128  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6129  	/* BPF_ALU | BPF_XOR =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6130  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6131  		"ALU_XOR_X: 5 ^ 6 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6132  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6133  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6134  			BPF_ALU32_IMM(BPF_M=
OV, R1, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6135  			BPF_ALU32_REG(BPF_X=
OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6136  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6137  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6138  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6139  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6140  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6141  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6142  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6143  		"ALU_XOR_X: 0x1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6144  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6145  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6146  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6147  			BPF_ALU32_REG(BPF_X=
OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6148  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6149  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6150  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6151  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6152  		{ { 0, 0xfffffffe } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6153  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6154  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6155  		"ALU64_XOR_X: 5 ^ 6 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6156  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6157  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6158  			BPF_ALU32_IMM(BPF_M=
OV, R1, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6159  			BPF_ALU64_REG(BPF_X=
OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6160  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6161  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6162  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6163  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6164  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6165  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6166  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6167  		"ALU64_XOR_X: 1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6168  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6169  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6170  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6171  			BPF_ALU64_REG(BPF_X=
OR, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6172  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6173  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6174  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6175  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6176  		{ { 0, 0xfffffffe } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6177  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6178  	/* BPF_ALU | BPF_XOR =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6179  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6180  		"ALU_XOR_K: 5 ^ 6 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6181  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6182  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6183  			BPF_ALU32_IMM(BPF_X=
OR, R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6184  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6185  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6186  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6187  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6188  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6189  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6190  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6191  		"ALU_XOR_K: 1 ^ 0xff=
ffffff =3D 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6192  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6193  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6194  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6195  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6196  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6197  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6198  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6199  		{ { 0, 0xfffffffe } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6200  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6201  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6202  		"ALU_XOR_K: Small im=
mediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6203  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6204  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x01020304),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6205  			BPF_ALU32_IMM(BPF_X=
OR, R0, 15),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6206  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6207  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6208  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6209  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6210  		{ { 0, 0x0102030b } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6211  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6212  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6213  		"ALU_XOR_K: Large im=
mediate",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6214  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6215  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0xf1f2f3f4),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6216  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xafbfcfdf),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6217  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6218  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6219  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6220  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6221  		{ { 0, 0x5e4d3c2b } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6222  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6223  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6224  		"ALU_XOR_K: Zero ext=
ension",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6225  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6226  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6227  			BPF_LD_IMM64(R1, 0x=
00000000795b3d1fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6228  			BPF_ALU32_IMM(BPF_X=
OR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6229  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6230  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6231  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6232  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6233  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6234  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6235  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6236  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6237  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6238  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6239  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6240  		"ALU64_XOR_K: 5 ^ 6 =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  6241  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6242  			BPF_LD_IMM64(R0, 5),
cffc642d93f9324 Michael Holzheu    2015-05-11  6243  			BPF_ALU64_IMM(BPF_X=
OR, R0, 6),
cffc642d93f9324 Michael Holzheu    2015-05-11  6244  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6245  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6246  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6247  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6248  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6249  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6250  	{
e92c813bf119324 Johan Almbladh     2021-08-09  6251  		"ALU64_XOR_K: 1 ^ 0x=
ffffffff =3D 0xfffffffe",
cffc642d93f9324 Michael Holzheu    2015-05-11  6252  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6253  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6254  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6255  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6256  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6257  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6258  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6259  		{ { 0, 0xfffffffe } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6260  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6261  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6262  		"ALU64_XOR_K: 0x0000=
ffffffff0000 ^ 0x0 =3D 0x0000ffffffff0000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6263  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6264  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6265  			BPF_LD_IMM64(R3, 0x=
0000ffffffff0000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6266  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0x0),
cffc642d93f9324 Michael Holzheu    2015-05-11  6267  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6268  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6269  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6270  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6271  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6272  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6273  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6274  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6275  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6276  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6277  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6278  		"ALU64_XOR_K: 0x0000=
ffffffff0000 ^ -1 =3D 0xffff00000000ffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6279  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6280  			BPF_LD_IMM64(R2, 0x=
0000ffffffff0000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6281  			BPF_LD_IMM64(R3, 0x=
ffff00000000ffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6282  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6283  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6284  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6285  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6286  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6287  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6288  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6289  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6290  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6291  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6292  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6293  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6294  		"ALU64_XOR_K: 0x0000=
00000000000 ^ -1 =3D 0xffffffffffffffff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6295  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  6296  			BPF_LD_IMM64(R2, 0x=
0000000000000000LL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  6297  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6298  			BPF_ALU64_IMM(BPF_X=
OR, R2, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  6299  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6300  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6301  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6302  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  6303  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6304  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6305  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6306  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6307  		{ { 0, 0x1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6308  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6309  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6310  		"ALU64_XOR_K: Sign e=
xtension 1",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6311  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6312  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6313  			BPF_LD_IMM64(R1, 0x=
0123456786a4c2e0LL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6314  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0x0f0f0f0f),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6315  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6316  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6317  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6318  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6319  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6320  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6321  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6322  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6323  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6324  	},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6325  	{
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6326  		"ALU64_XOR_K: Sign e=
xtension 2",
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6327  		.u.insns_int =3D {
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6328  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6329  			BPF_LD_IMM64(R1, 0x=
fedcba98795b3d1fLL),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6330  			BPF_ALU64_IMM(BPF_X=
OR, R0, 0xf0f0f0f0),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6331  			BPF_JMP_REG(BPF_JEQ=
, R0, R1, 2),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6332  			BPF_MOV32_IMM(R0, 2=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6333  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6334  			BPF_MOV32_IMM(R0, 1=
),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6335  			BPF_EXIT_INSN(),
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6336  		},
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6337  		INTERNAL,
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6338  		{ },
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6339  		{ { 0, 1 } }
ba89bcf78fba8ff Johan Almbladh     2021-08-09  6340  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6341  	/* BPF_ALU | BPF_LSH =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6342  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6343  		"ALU_LSH_X: 1 << 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6344  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6345  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6346  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6347  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6348  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6349  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6350  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6351  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6352  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6353  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6354  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6355  		"ALU_LSH_X: 1 << 31 =
=3D 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6356  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6357  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6358  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6359  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6360  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6361  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6362  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6363  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6364  		{ { 0, 0x80000000 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6365  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6366  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6367  		"ALU_LSH_X: 0x123456=
78 << 12 =3D 0x45678000",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6368  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6369  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6370  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6371  			BPF_ALU32_REG(BPF_L=
SH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6372  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6373  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6374  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6375  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6376  		{ { 0, 0x45678000 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6377  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6378  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6379  		"ALU64_LSH_X: 1 << 1=
 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6380  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6381  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6382  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6383  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6384  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6385  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6386  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6387  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6388  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6389  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6390  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6391  		"ALU64_LSH_X: 1 << 3=
1 =3D 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6392  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6393  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6394  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6395  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6396  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6397  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6398  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6399  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6400  		{ { 0, 0x80000000 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6401  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6402  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6403  		"ALU64_LSH_X: Shift =
< 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6404  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6405  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6406  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6407  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6408  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6409  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6410  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6411  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6412  		{ { 0, 0xbcdef000 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6413  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6414  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6415  		"ALU64_LSH_X: Shift =
< 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6416  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6417  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6418  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6419  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6420  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6421  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6422  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6423  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6424  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6425  		{ { 0, 0x3456789a } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6426  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6427  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6428  		"ALU64_LSH_X: Shift =
> 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6429  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6430  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6431  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6432  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6433  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6434  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6435  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6436  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6437  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6438  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6439  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6440  		"ALU64_LSH_X: Shift =
> 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6441  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6442  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6443  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6444  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6445  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6446  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6447  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6448  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6449  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6450  		{ { 0, 0x9abcdef0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6451  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6452  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6453  		"ALU64_LSH_X: Shift =
=3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6454  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6455  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6456  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6457  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6458  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6459  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6460  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6461  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6462  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6463  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6464  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6465  		"ALU64_LSH_X: Shift =
=3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6466  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6467  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6468  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6469  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6470  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6471  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6472  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6473  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6474  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6475  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6476  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6477  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6478  		"ALU64_LSH_X: Zero s=
hift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6479  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6480  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6481  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6482  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6483  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6484  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6485  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6486  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6487  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6488  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6489  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6490  		"ALU64_LSH_X: Zero s=
hift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6491  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6492  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6493  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6494  			BPF_ALU64_REG(BPF_L=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6495  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6496  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6497  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6498  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6499  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6500  		{ { 0, 0x01234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6501  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6502  	/* BPF_ALU | BPF_LSH =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6503  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6504  		"ALU_LSH_K: 1 << 1 =
=3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6505  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6506  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6507  			BPF_ALU32_IMM(BPF_L=
SH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6508  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6509  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6510  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6511  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6512  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6513  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6514  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6515  		"ALU_LSH_K: 1 << 31 =
=3D 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6516  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6517  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6518  			BPF_ALU32_IMM(BPF_L=
SH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6519  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6520  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6521  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6522  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6523  		{ { 0, 0x80000000 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6524  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6525  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6526  		"ALU_LSH_K: 0x123456=
78 << 12 =3D 0x45678000",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6527  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6528  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6529  			BPF_ALU32_IMM(BPF_L=
SH, R0, 12),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6530  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6531  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6532  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6533  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6534  		{ { 0, 0x45678000 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6535  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6536  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6537  		"ALU_LSH_K: 0x123456=
78 << 0 =3D 0x12345678",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6538  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6539  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6540  			BPF_ALU32_IMM(BPF_L=
SH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6541  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6542  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6543  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6544  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6545  		{ { 0, 0x12345678 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6546  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6547  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6548  		"ALU64_LSH_K: 1 << 1=
 =3D 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  6549  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6550  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6551  			BPF_ALU64_IMM(BPF_L=
SH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6552  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6553  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6554  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6555  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6556  		{ { 0, 2 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6557  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6558  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6559  		"ALU64_LSH_K: 1 << 3=
1 =3D 0x80000000",
cffc642d93f9324 Michael Holzheu    2015-05-11  6560  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6561  			BPF_LD_IMM64(R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6562  			BPF_ALU64_IMM(BPF_L=
SH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6563  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6564  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6565  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6566  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6567  		{ { 0, 0x80000000 } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6568  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6569  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6570  		"ALU64_LSH_K: Shift =
< 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6571  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6572  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6573  			BPF_ALU64_IMM(BPF_L=
SH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6574  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6575  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6576  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6577  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6578  		{ { 0, 0xbcdef000 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6579  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6580  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6581  		"ALU64_LSH_K: Shift =
< 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6582  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6583  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6584  			BPF_ALU64_IMM(BPF_L=
SH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6585  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6586  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6587  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6588  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6589  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6590  		{ { 0, 0x3456789a } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6591  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6592  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6593  		"ALU64_LSH_K: Shift =
> 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6594  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6595  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6596  			BPF_ALU64_IMM(BPF_L=
SH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6597  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6598  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6599  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6600  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6601  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6602  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6603  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6604  		"ALU64_LSH_K: Shift =
> 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6605  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6606  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6607  			BPF_ALU64_IMM(BPF_L=
SH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6608  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6609  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6610  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6611  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6612  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6613  		{ { 0, 0x9abcdef0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6614  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6615  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6616  		"ALU64_LSH_K: Shift =
=3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6617  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6618  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6619  			BPF_ALU64_IMM(BPF_L=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6620  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6621  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6622  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6623  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6624  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6625  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6626  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6627  		"ALU64_LSH_K: Shift =
=3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6628  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6629  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6630  			BPF_ALU64_IMM(BPF_L=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6631  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6632  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6633  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6634  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6635  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6636  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6637  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6638  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6639  		"ALU64_LSH_K: Zero s=
hift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6640  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6641  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6642  			BPF_ALU64_IMM(BPF_L=
SH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6643  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6644  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6645  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6646  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6647  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6648  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6649  	/* BPF_ALU | BPF_RSH =
| BPF_X */
cffc642d93f9324 Michael Holzheu    2015-05-11  6650  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6651  		"ALU_RSH_X: 2 >> 1 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6652  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6653  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6654  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6655  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6656  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6657  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6658  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6659  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6660  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6661  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6662  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6663  		"ALU_RSH_X: 0x800000=
00 >> 31 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6664  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6665  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  6666  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6667  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6668  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6669  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6670  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6671  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6672  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6673  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6674  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6675  		"ALU_RSH_X: 0x123456=
78 >> 20 =3D 0x123",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6676  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6677  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6678  			BPF_ALU32_IMM(BPF_M=
OV, R1, 20),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6679  			BPF_ALU32_REG(BPF_R=
SH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6680  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6681  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6682  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6683  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6684  		{ { 0, 0x123 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6685  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6686  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6687  		"ALU64_RSH_X: 2 >> 1=
 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6688  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6689  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6690  			BPF_ALU32_IMM(BPF_M=
OV, R1, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6691  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6692  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6693  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6694  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6695  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6696  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6697  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6698  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6699  		"ALU64_RSH_X: 0x8000=
0000 >> 31 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6700  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6701  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  6702  			BPF_ALU32_IMM(BPF_M=
OV, R1, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6703  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6704  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6705  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6706  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6707  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6708  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6709  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6710  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6711  		"ALU64_RSH_X: Shift =
< 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6712  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6713  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6714  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6715  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6716  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6717  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6718  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6719  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6720  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6721  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6722  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6723  		"ALU64_RSH_X: Shift =
< 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6724  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6725  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6726  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6727  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6728  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6729  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6730  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6731  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6732  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6733  		{ { 0, 0x00081234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6734  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6735  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6736  		"ALU64_RSH_X: Shift =
> 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6737  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6738  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6739  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6740  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6741  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6742  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6743  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6744  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6745  		{ { 0, 0x08123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6746  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6747  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6748  		"ALU64_RSH_X: Shift =
> 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6749  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6750  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6751  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6752  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6753  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6754  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6755  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6756  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6757  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6758  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6759  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6760  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6761  		"ALU64_RSH_X: Shift =
=3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6762  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6763  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6764  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6765  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6766  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6767  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6768  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6769  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6770  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6771  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6772  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6773  		"ALU64_RSH_X: Shift =
=3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6774  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6775  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6776  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6777  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6778  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6779  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6780  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6781  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6782  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6783  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6784  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6785  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6786  		"ALU64_RSH_X: Zero s=
hift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6787  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6788  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6789  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6790  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6791  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6792  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6793  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6794  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6795  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6796  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6797  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6798  		"ALU64_RSH_X: Zero s=
hift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6799  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6800  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6801  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6802  			BPF_ALU64_REG(BPF_R=
SH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6803  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6804  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6805  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6806  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6807  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6808  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6809  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6810  	/* BPF_ALU | BPF_RSH =
| BPF_K */
cffc642d93f9324 Michael Holzheu    2015-05-11  6811  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6812  		"ALU_RSH_K: 2 >> 1 =
=3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6813  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6814  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6815  			BPF_ALU32_IMM(BPF_R=
SH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6816  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6817  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6818  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6819  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6820  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6821  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6822  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6823  		"ALU_RSH_K: 0x800000=
00 >> 31 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6824  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6825  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  6826  			BPF_ALU32_IMM(BPF_R=
SH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6827  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6828  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6829  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6830  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6831  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6832  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6833  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6834  		"ALU_RSH_K: 0x123456=
78 >> 20 =3D 0x123",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6835  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6836  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6837  			BPF_ALU32_IMM(BPF_R=
SH, R0, 20),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6838  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6839  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6840  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6841  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6842  		{ { 0, 0x123 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6843  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6844  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6845  		"ALU_RSH_K: 0x123456=
78 >> 0 =3D 0x12345678",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6846  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6847  			BPF_ALU32_IMM(BPF_M=
OV, R0, 0x12345678),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6848  			BPF_ALU32_IMM(BPF_R=
SH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6849  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6850  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6851  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6852  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6853  		{ { 0, 0x12345678 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6854  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6855  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6856  		"ALU64_RSH_K: 2 >> 1=
 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6857  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6858  			BPF_LD_IMM64(R0, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  6859  			BPF_ALU64_IMM(BPF_R=
SH, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6860  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6861  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6862  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6863  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6864  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6865  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6866  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  6867  		"ALU64_RSH_K: 0x8000=
0000 >> 31 =3D 1",
cffc642d93f9324 Michael Holzheu    2015-05-11  6868  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6869  			BPF_LD_IMM64(R0, 0x=
80000000),
cffc642d93f9324 Michael Holzheu    2015-05-11  6870  			BPF_ALU64_IMM(BPF_R=
SH, R0, 31),
cffc642d93f9324 Michael Holzheu    2015-05-11  6871  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6872  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6873  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6874  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6875  		{ { 0, 1 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  6876  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6877  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6878  		"ALU64_RSH_K: Shift =
< 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6879  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6880  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6881  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6882  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6883  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6884  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6885  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6886  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6887  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6888  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6889  		"ALU64_RSH_K: Shift =
< 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6890  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6891  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6892  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6893  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6894  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6895  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6896  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6897  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6898  		{ { 0, 0x00081234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6899  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6900  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6901  		"ALU64_RSH_K: Shift =
> 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6902  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6903  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6904  			BPF_ALU64_IMM(BPF_R=
SH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6905  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6906  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6907  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6908  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6909  		{ { 0, 0x08123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6910  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6911  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6912  		"ALU64_RSH_K: Shift =
> 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6913  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6914  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6915  			BPF_ALU64_IMM(BPF_R=
SH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6916  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6917  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6918  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6919  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6920  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6921  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6922  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6923  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6924  		"ALU64_RSH_K: Shift =
=3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6925  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6926  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6927  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6928  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6929  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6930  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6931  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6932  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6933  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6934  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6935  		"ALU64_RSH_K: Shift =
=3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6936  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6937  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6938  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6939  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6940  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6941  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6942  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6943  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6944  		{ { 0, 0 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6945  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6946  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6947  		"ALU64_RSH_K: Zero s=
hift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6948  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6949  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6950  			BPF_ALU64_IMM(BPF_R=
SH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6951  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6952  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6953  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6954  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6955  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6956  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6957  	/* BPF_ALU | BPF_ARSH=
 | BPF_X */
0f2fca1ab18319d Johan Almbladh     2021-08-09  6958  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  6959  		"ALU32_ARSH_X: -1234=
 >> 7 =3D -10",
0f2fca1ab18319d Johan Almbladh     2021-08-09  6960  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  6961  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6962  			BPF_ALU32_IMM(BPF_M=
OV, R1, 7),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6963  			BPF_ALU32_REG(BPF_A=
RSH, R0, R1),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6964  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  6965  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  6966  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  6967  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  6968  		{ { 0, -10 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  6969  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  6970  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6971  		"ALU64_ARSH_X: 0xff0=
0ff0000000000 >> 40 =3D 0xffffffffffff00ff",
cffc642d93f9324 Michael Holzheu    2015-05-11  6972  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  6973  			BPF_LD_IMM64(R0, 0x=
ff00ff0000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  6974  			BPF_ALU32_IMM(BPF_M=
OV, R1, 40),
cffc642d93f9324 Michael Holzheu    2015-05-11  6975  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
cffc642d93f9324 Michael Holzheu    2015-05-11  6976  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  6977  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  6978  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  6979  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  6980  		{ { 0, 0xffff00ff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  6981  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6982  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6983  		"ALU64_ARSH_X: Shift=
 < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6984  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6985  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6986  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6987  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6988  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6989  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6990  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  6991  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  6992  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  6993  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  6994  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  6995  		"ALU64_ARSH_X: Shift=
 < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  6996  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  6997  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6998  			BPF_ALU32_IMM(BPF_M=
OV, R1, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  6999  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7000  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7001  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7002  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7003  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7004  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7005  		{ { 0, 0xfff81234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7006  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7007  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7008  		"ALU64_ARSH_X: Shift=
 > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7009  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7010  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7011  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7012  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7013  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7014  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7015  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7016  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7017  		{ { 0, 0xf8123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7018  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7019  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7020  		"ALU64_ARSH_X: Shift=
 > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7021  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7022  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7023  			BPF_ALU32_IMM(BPF_M=
OV, R1, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7024  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7025  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7026  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7027  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7028  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7029  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7030  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7031  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7032  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7033  		"ALU64_ARSH_X: Shift=
 =3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7034  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7035  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7036  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7037  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7038  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7039  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7040  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7041  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7042  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7043  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7044  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7045  		"ALU64_ARSH_X: Shift=
 =3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7046  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7047  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7048  			BPF_ALU32_IMM(BPF_M=
OV, R1, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7049  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7050  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7051  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7052  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7053  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7054  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7055  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7056  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7057  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7058  		"ALU64_ARSH_X: Zero =
shift, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7059  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7060  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7061  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7062  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7063  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7064  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7065  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7066  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7067  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7068  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7069  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7070  		"ALU64_ARSH_X: Zero =
shift, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7071  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7072  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7073  			BPF_ALU32_IMM(BPF_M=
OV, R1, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7074  			BPF_ALU64_REG(BPF_A=
RSH, R0, R1),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7075  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7076  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7077  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7078  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7079  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7080  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7081  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7082  	/* BPF_ALU | BPF_ARSH=
 | BPF_K */
0f2fca1ab18319d Johan Almbladh     2021-08-09  7083  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7084  		"ALU32_ARSH_K: -1234=
 >> 7 =3D -10",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7085  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7086  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7087  			BPF_ALU32_IMM(BPF_A=
RSH, R0, 7),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7088  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7089  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7090  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7091  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7092  		{ { 0, -10 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7093  	},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7094  	{
0f2fca1ab18319d Johan Almbladh     2021-08-09  7095  		"ALU32_ARSH_K: -1234=
 >> 0 =3D -1234",
0f2fca1ab18319d Johan Almbladh     2021-08-09  7096  		.u.insns_int =3D {
0f2fca1ab18319d Johan Almbladh     2021-08-09  7097  			BPF_ALU32_IMM(BPF_M=
OV, R0, -1234),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7098  			BPF_ALU32_IMM(BPF_A=
RSH, R0, 0),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7099  			BPF_EXIT_INSN(),
0f2fca1ab18319d Johan Almbladh     2021-08-09  7100  		},
0f2fca1ab18319d Johan Almbladh     2021-08-09  7101  		INTERNAL,
0f2fca1ab18319d Johan Almbladh     2021-08-09  7102  		{ },
0f2fca1ab18319d Johan Almbladh     2021-08-09  7103  		{ { 0, -1234 } }
0f2fca1ab18319d Johan Almbladh     2021-08-09  7104  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7105  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7106  		"ALU64_ARSH_K: 0xff0=
0ff0000000000 >> 40 =3D 0xffffffffffff00ff",
cffc642d93f9324 Michael Holzheu    2015-05-11  7107  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7108  			BPF_LD_IMM64(R0, 0x=
ff00ff0000000000LL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7109  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7110  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7111  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7112  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7113  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7114  		{ { 0, 0xffff00ff } =
},
cffc642d93f9324 Michael Holzheu    2015-05-11  7115  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7116  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7117  		"ALU64_ARSH_K: Shift=
 < 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7118  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7119  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7120  			BPF_ALU64_IMM(BPF_R=
SH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7121  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7122  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7123  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7124  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7125  		{ { 0, 0x56789abc } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7126  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7127  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7128  		"ALU64_ARSH_K: Shift=
 < 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7129  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7130  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7131  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 12),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7132  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7133  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7134  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7135  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7136  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7137  		{ { 0, 0xfff81234 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7138  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7139  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7140  		"ALU64_ARSH_K: Shift=
 > 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7141  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7142  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7143  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7144  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7145  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7146  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7147  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7148  		{ { 0, 0xf8123456 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7149  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7150  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7151  		"ALU64_ARSH_K: Shift=
 > 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7152  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09 @7153  			BPF_LD_IMM64(R0, 0x=
f123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7154  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 36),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7155  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7156  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7157  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7158  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7159  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7160  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7161  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7162  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7163  		"ALU64_ARSH_K: Shift=
 =3D=3D 32, low word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7164  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7165  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7166  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7167  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7168  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7169  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7170  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7171  		{ { 0, 0x81234567 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7172  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7173  	{
3b9890ef80f4285 Johan Almbladh     2021-08-09  7174  		"ALU64_ARSH_K: Shift=
 =3D=3D 32, high word",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7175  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7176  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7177  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7178  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7179  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7180  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7181  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7182  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7183  		{ { 0, -1 } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7184  	},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7185  	{
1bda52f80471260 Colin Ian King     2021-08-15  7186  		"ALU64_ARSH_K: Zero =
shift",
3b9890ef80f4285 Johan Almbladh     2021-08-09  7187  		.u.insns_int =3D {
3b9890ef80f4285 Johan Almbladh     2021-08-09  7188  			BPF_LD_IMM64(R0, 0x=
8123456789abcdefLL),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7189  			BPF_ALU64_IMM(BPF_A=
RSH, R0, 0),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7190  			BPF_EXIT_INSN(),
3b9890ef80f4285 Johan Almbladh     2021-08-09  7191  		},
3b9890ef80f4285 Johan Almbladh     2021-08-09  7192  		INTERNAL,
3b9890ef80f4285 Johan Almbladh     2021-08-09  7193  		{ },
3b9890ef80f4285 Johan Almbladh     2021-08-09  7194  		{ { 0, 0x89abcdef } }
3b9890ef80f4285 Johan Almbladh     2021-08-09  7195  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7196  	/* BPF_ALU | BPF_NEG =
*/
cffc642d93f9324 Michael Holzheu    2015-05-11  7197  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7198  		"ALU_NEG: -(3) =3D -=
3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7199  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7200  			BPF_ALU32_IMM(BPF_M=
OV, R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7201  			BPF_ALU32_IMM(BPF_N=
EG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7202  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7203  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7204  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7205  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7206  		{ { 0, -3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7207  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7208  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7209  		"ALU_NEG: -(-3) =3D =
3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7210  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7211  			BPF_ALU32_IMM(BPF_M=
OV, R0, -3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7212  			BPF_ALU32_IMM(BPF_N=
EG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7213  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7214  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7215  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7216  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7217  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7218  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7219  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7220  		"ALU64_NEG: -(3) =3D=
 -3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7221  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7222  			BPF_LD_IMM64(R0, 3),
cffc642d93f9324 Michael Holzheu    2015-05-11  7223  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7224  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7225  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7226  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7227  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7228  		{ { 0, -3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7229  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7230  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7231  		"ALU64_NEG: -(-3) =
=3D 3",
cffc642d93f9324 Michael Holzheu    2015-05-11  7232  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7233  			BPF_LD_IMM64(R0, -3=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  7234  			BPF_ALU64_IMM(BPF_N=
EG, R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7235  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7236  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7237  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7238  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7239  		{ { 0, 3 } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7240  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7241  	/* BPF_ALU | BPF_END =
| BPF_FROM_BE */
cffc642d93f9324 Michael Holzheu    2015-05-11  7242  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7243  		"ALU_END_FROM_BE 16:=
 0x0123456789abcdef -> 0xcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7244  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7245  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7246  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 16),
cffc642d93f9324 Michael Holzheu    2015-05-11  7247  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7248  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7249  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7250  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7251  		{ { 0,  cpu_to_be16(=
0xcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7252  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7253  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7254  		"ALU_END_FROM_BE 32:=
 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7255  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7256  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7257  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 32),
ba29becd770ffec Xi Wang            2015-07-08  7258  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
ba29becd770ffec Xi Wang            2015-07-08  7259  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
ba29becd770ffec Xi Wang            2015-07-08  7260  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
cffc642d93f9324 Michael Holzheu    2015-05-11  7261  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7262  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7263  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7264  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7265  		{ { 0, cpu_to_be32(0=
x89abcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7266  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7267  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7268  		"ALU_END_FROM_BE 64:=
 0x0123456789abcdef -> 0x89abcdef",
cffc642d93f9324 Michael Holzheu    2015-05-11  7269  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7270  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7271  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
cffc642d93f9324 Michael Holzheu    2015-05-11  7272  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7273  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7274  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7275  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7276  		{ { 0, (u32) cpu_to_=
be64(0x0123456789abcdefLL) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7277  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7278  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7279  		"ALU_END_FROM_BE 64:=
 0x0123456789abcdef >> 32 -> 0x01234567",
f536a7c80675e48 Johan Almbladh     2021-09-14  7280  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7281  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7282  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7283  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7284  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7285  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7286  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7287  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7288  		{ { 0, (u32) (cpu_to=
_be64(0x0123456789abcdefLL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7289  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7290  	/* BPF_ALU | BPF_END =
| BPF_FROM_BE, reversed */
f536a7c80675e48 Johan Almbladh     2021-09-14  7291  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7292  		"ALU_END_FROM_BE 16:=
 0xfedcba9876543210 -> 0x3210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7293  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7294  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7295  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 16),
f536a7c80675e48 Johan Almbladh     2021-09-14  7296  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7297  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7298  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7299  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7300  		{ { 0,  cpu_to_be16(=
0x3210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7301  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7302  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7303  		"ALU_END_FROM_BE 32:=
 0xfedcba9876543210 -> 0x76543210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7304  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7305  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7306  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7307  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
f536a7c80675e48 Johan Almbladh     2021-09-14  7308  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7309  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
f536a7c80675e48 Johan Almbladh     2021-09-14  7310  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7311  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7312  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7313  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7314  		{ { 0, cpu_to_be32(0=
x76543210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7315  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7316  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7317  		"ALU_END_FROM_BE 64:=
 0xfedcba9876543210 -> 0x76543210",
f536a7c80675e48 Johan Almbladh     2021-09-14  7318  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7319  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7320  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7321  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7322  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7323  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7324  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7325  		{ { 0, (u32) cpu_to_=
be64(0xfedcba9876543210ULL) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7326  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7327  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7328  		"ALU_END_FROM_BE 64:=
 0xfedcba9876543210 >> 32 -> 0xfedcba98",
f536a7c80675e48 Johan Almbladh     2021-09-14  7329  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7330  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7331  			BPF_ENDIAN(BPF_FROM=
_BE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7332  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7333  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7334  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7335  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7336  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7337  		{ { 0, (u32) (cpu_to=
_be64(0xfedcba9876543210ULL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7338  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7339  	/* BPF_ALU | BPF_END =
| BPF_FROM_LE */
cffc642d93f9324 Michael Holzheu    2015-05-11  7340  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7341  		"ALU_END_FROM_LE 16:=
 0x0123456789abcdef -> 0xefcd",
cffc642d93f9324 Michael Holzheu    2015-05-11  7342  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7343  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7344  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 16),
cffc642d93f9324 Michael Holzheu    2015-05-11  7345  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7346  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7347  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7348  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7349  		{ { 0, cpu_to_le16(0=
xcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7350  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7351  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7352  		"ALU_END_FROM_LE 32:=
 0x0123456789abcdef -> 0xefcdab89",
cffc642d93f9324 Michael Holzheu    2015-05-11  7353  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7354  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7355  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 32),
ba29becd770ffec Xi Wang            2015-07-08  7356  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
ba29becd770ffec Xi Wang            2015-07-08  7357  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
ba29becd770ffec Xi Wang            2015-07-08  7358  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
cffc642d93f9324 Michael Holzheu    2015-05-11  7359  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7360  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7361  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7362  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7363  		{ { 0, cpu_to_le32(0=
x89abcdef) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7364  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7365  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7366  		"ALU_END_FROM_LE 64:=
 0x0123456789abcdef -> 0x67452301",
cffc642d93f9324 Michael Holzheu    2015-05-11  7367  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7368  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7369  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
cffc642d93f9324 Michael Holzheu    2015-05-11  7370  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7371  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7372  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7373  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7374  		{ { 0, (u32) cpu_to_=
le64(0x0123456789abcdefLL) } },
cffc642d93f9324 Michael Holzheu    2015-05-11  7375  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7376  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7377  		"ALU_END_FROM_LE 64:=
 0x0123456789abcdef >> 32 -> 0xefcdab89",
f536a7c80675e48 Johan Almbladh     2021-09-14  7378  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7379  			BPF_LD_IMM64(R0, 0x=
0123456789abcdefLL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7380  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7381  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7382  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7383  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7384  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7385  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7386  		{ { 0, (u32) (cpu_to=
_le64(0x0123456789abcdefLL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7387  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7388  	/* BPF_ALU | BPF_END =
| BPF_FROM_LE, reversed */
f536a7c80675e48 Johan Almbladh     2021-09-14  7389  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7390  		"ALU_END_FROM_LE 16:=
 0xfedcba9876543210 -> 0x1032",
f536a7c80675e48 Johan Almbladh     2021-09-14  7391  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7392  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7393  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 16),
f536a7c80675e48 Johan Almbladh     2021-09-14  7394  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7395  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7396  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7397  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7398  		{ { 0,  cpu_to_le16(=
0x3210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7399  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7400  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7401  		"ALU_END_FROM_LE 32:=
 0xfedcba9876543210 -> 0x10325476",
f536a7c80675e48 Johan Almbladh     2021-09-14  7402  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7403  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7404  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7405  			BPF_ALU64_REG(BPF_M=
OV, R1, R0),
f536a7c80675e48 Johan Almbladh     2021-09-14  7406  			BPF_ALU64_IMM(BPF_R=
SH, R1, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7407  			BPF_ALU32_REG(BPF_A=
DD, R0, R1), /* R1 =3D 0 */
f536a7c80675e48 Johan Almbladh     2021-09-14  7408  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7409  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7410  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7411  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7412  		{ { 0, cpu_to_le32(0=
x76543210) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7413  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7414  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7415  		"ALU_END_FROM_LE 64:=
 0xfedcba9876543210 -> 0x10325476",
f536a7c80675e48 Johan Almbladh     2021-09-14  7416  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7417  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7418  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7419  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7420  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7421  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7422  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7423  		{ { 0, (u32) cpu_to_=
le64(0xfedcba9876543210ULL) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7424  	},
f536a7c80675e48 Johan Almbladh     2021-09-14  7425  	{
f536a7c80675e48 Johan Almbladh     2021-09-14  7426  		"ALU_END_FROM_LE 64:=
 0xfedcba9876543210 >> 32 -> 0x98badcfe",
f536a7c80675e48 Johan Almbladh     2021-09-14  7427  		.u.insns_int =3D {
f536a7c80675e48 Johan Almbladh     2021-09-14  7428  			BPF_LD_IMM64(R0, 0x=
fedcba9876543210ULL),
f536a7c80675e48 Johan Almbladh     2021-09-14  7429  			BPF_ENDIAN(BPF_FROM=
_LE, R0, 64),
f536a7c80675e48 Johan Almbladh     2021-09-14  7430  			BPF_ALU64_IMM(BPF_R=
SH, R0, 32),
f536a7c80675e48 Johan Almbladh     2021-09-14  7431  			BPF_EXIT_INSN(),
f536a7c80675e48 Johan Almbladh     2021-09-14  7432  		},
f536a7c80675e48 Johan Almbladh     2021-09-14  7433  		INTERNAL,
f536a7c80675e48 Johan Almbladh     2021-09-14  7434  		{ },
f536a7c80675e48 Johan Almbladh     2021-09-14  7435  		{ { 0, (u32) (cpu_to=
_le64(0xfedcba9876543210ULL) >> 32) } },
f536a7c80675e48 Johan Almbladh     2021-09-14  7436  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7437  	/* BPF_LDX_MEM B/H/W/=
DW */
b7436e53c202df5 Johan Almbladh     2021-10-01  7438  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7439  		"BPF_LDX_MEM | BPF_B=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7440  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7441  			BPF_LD_IMM64(R1, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7442  			BPF_LD_IMM64(R2, 0x=
0000000000000008ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7443  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7444  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7445  			BPF_LDX_MEM(BPF_B, =
R0, R10, -1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7446  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7447  			BPF_LDX_MEM(BPF_B, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7448  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7449  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7450  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7451  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7452  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7453  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7454  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7455  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7456  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7457  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7458  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7459  		"BPF_LDX_MEM | BPF_B=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7460  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7461  			BPF_LD_IMM64(R1, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7462  			BPF_LD_IMM64(R2, 0x=
0000000000000088ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7463  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7464  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7465  			BPF_LDX_MEM(BPF_B, =
R0, R10, -1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7466  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7467  			BPF_LDX_MEM(BPF_B, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7468  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7469  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7470  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7471  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7472  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7473  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7474  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7475  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7476  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7477  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7478  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7479  		"BPF_LDX_MEM | BPF_H=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7480  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7481  			BPF_LD_IMM64(R1, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7482  			BPF_LD_IMM64(R2, 0x=
0000000000000708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7483  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7484  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7485  			BPF_LDX_MEM(BPF_H, =
R0, R10, -2),
b7436e53c202df5 Johan Almbladh     2021-10-01  7486  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7487  			BPF_LDX_MEM(BPF_H, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7488  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7489  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7490  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7491  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7492  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7493  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7494  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7495  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7496  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7497  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7498  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7499  		"BPF_LDX_MEM | BPF_H=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7500  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7501  			BPF_LD_IMM64(R1, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7502  			BPF_LD_IMM64(R2, 0x=
0000000000008788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7503  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7504  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7505  			BPF_LDX_MEM(BPF_H, =
R0, R10, -2),
b7436e53c202df5 Johan Almbladh     2021-10-01  7506  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7507  			BPF_LDX_MEM(BPF_H, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7508  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7509  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7510  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7511  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7512  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7513  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7514  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7515  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7516  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7517  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7518  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7519  		"BPF_LDX_MEM | BPF_W=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7520  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7521  			BPF_LD_IMM64(R1, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7522  			BPF_LD_IMM64(R2, 0x=
0000000005060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7523  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7524  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7525  			BPF_LDX_MEM(BPF_W, =
R0, R10, -4),
b7436e53c202df5 Johan Almbladh     2021-10-01  7526  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7527  			BPF_LDX_MEM(BPF_W, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7528  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7529  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7530  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7531  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7532  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7533  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7534  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7535  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7536  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7537  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7538  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7539  		"BPF_LDX_MEM | BPF_W=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7540  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7541  			BPF_LD_IMM64(R1, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7542  			BPF_LD_IMM64(R2, 0x=
0000000085868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7543  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7544  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7545  			BPF_LDX_MEM(BPF_W, =
R0, R10, -4),
b7436e53c202df5 Johan Almbladh     2021-10-01  7546  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7547  			BPF_LDX_MEM(BPF_W, =
R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7548  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7549  			BPF_JMP_REG(BPF_JNE=
, R0, R2, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7550  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7551  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7552  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7553  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7554  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7555  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7556  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7557  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7558  	/* BPF_STX_MEM B/H/W/=
DW */
b7436e53c202df5 Johan Almbladh     2021-10-01  7559  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7560  		"BPF_STX_MEM | BPF_B=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7561  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7562  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7563  			BPF_LD_IMM64(R2, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7564  			BPF_LD_IMM64(R3, 0x=
8090a0b0c0d0e008ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7565  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7566  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7567  			BPF_STX_MEM(BPF_B, =
R10, R2, -1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7568  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7569  			BPF_STX_MEM(BPF_B, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7570  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7571  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7572  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7573  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7574  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7575  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7576  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7577  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7578  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7579  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7580  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7581  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7582  		"BPF_STX_MEM | BPF_B=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7583  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7584  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7585  			BPF_LD_IMM64(R2, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7586  			BPF_LD_IMM64(R3, 0x=
8090a0b0c0d0e088ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7587  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7588  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7589  			BPF_STX_MEM(BPF_B, =
R10, R2, -1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7590  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7591  			BPF_STX_MEM(BPF_B, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7592  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7593  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7594  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7595  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7596  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7597  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7598  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7599  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7600  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7601  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7602  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7603  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7604  		"BPF_STX_MEM | BPF_H=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7605  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7606  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7607  			BPF_LD_IMM64(R2, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7608  			BPF_LD_IMM64(R3, 0x=
8090a0b0c0d00708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7609  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7610  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7611  			BPF_STX_MEM(BPF_H, =
R10, R2, -2),
b7436e53c202df5 Johan Almbladh     2021-10-01  7612  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7613  			BPF_STX_MEM(BPF_H, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7614  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7615  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7616  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7617  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7618  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7619  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7620  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7621  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7622  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7623  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7624  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7625  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7626  		"BPF_STX_MEM | BPF_H=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7627  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7628  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7629  			BPF_LD_IMM64(R2, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7630  			BPF_LD_IMM64(R3, 0x=
8090a0b0c0d08788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7631  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7632  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7633  			BPF_STX_MEM(BPF_H, =
R10, R2, -2),
b7436e53c202df5 Johan Almbladh     2021-10-01  7634  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7635  			BPF_STX_MEM(BPF_H, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7636  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7637  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7638  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7639  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7640  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7641  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7642  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7643  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7644  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7645  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7646  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7647  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7648  		"BPF_STX_MEM | BPF_W=
",
b7436e53c202df5 Johan Almbladh     2021-10-01  7649  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7650  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7651  			BPF_LD_IMM64(R2, 0x=
0102030405060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7652  			BPF_LD_IMM64(R3, 0x=
8090a0b005060708ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7653  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7654  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7655  			BPF_STX_MEM(BPF_W, =
R10, R2, -4),
b7436e53c202df5 Johan Almbladh     2021-10-01  7656  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7657  			BPF_STX_MEM(BPF_W, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7658  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7659  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7660  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7661  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7662  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7663  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7664  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7665  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7666  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7667  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7668  	},
b7436e53c202df5 Johan Almbladh     2021-10-01  7669  	{
b7436e53c202df5 Johan Almbladh     2021-10-01  7670  		"BPF_STX_MEM | BPF_W=
, MSB set",
b7436e53c202df5 Johan Almbladh     2021-10-01  7671  		.u.insns_int =3D {
b7436e53c202df5 Johan Almbladh     2021-10-01  7672  			BPF_LD_IMM64(R1, 0x=
8090a0b0c0d0e0f0ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7673  			BPF_LD_IMM64(R2, 0x=
8182838485868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7674  			BPF_LD_IMM64(R3, 0x=
8090a0b085868788ULL),
b7436e53c202df5 Johan Almbladh     2021-10-01  7675  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7676  #ifdef __BIG_ENDIAN
b7436e53c202df5 Johan Almbladh     2021-10-01  7677  			BPF_STX_MEM(BPF_W, =
R10, R2, -4),
b7436e53c202df5 Johan Almbladh     2021-10-01  7678  #else
b7436e53c202df5 Johan Almbladh     2021-10-01  7679  			BPF_STX_MEM(BPF_W, =
R10, R2, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7680  #endif
b7436e53c202df5 Johan Almbladh     2021-10-01  7681  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -8),
b7436e53c202df5 Johan Almbladh     2021-10-01  7682  			BPF_JMP_REG(BPF_JNE=
, R0, R3, 1),
b7436e53c202df5 Johan Almbladh     2021-10-01  7683  			BPF_ALU64_IMM(BPF_M=
OV, R0, 0),
b7436e53c202df5 Johan Almbladh     2021-10-01  7684  			BPF_EXIT_INSN(),
b7436e53c202df5 Johan Almbladh     2021-10-01  7685  		},
b7436e53c202df5 Johan Almbladh     2021-10-01  7686  		INTERNAL,
b7436e53c202df5 Johan Almbladh     2021-10-01  7687  		{ },
b7436e53c202df5 Johan Almbladh     2021-10-01  7688  		{ { 0, 0 } },
b7436e53c202df5 Johan Almbladh     2021-10-01  7689  		.stack_depth =3D 8,
b7436e53c202df5 Johan Almbladh     2021-10-01  7690  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7691  	/* BPF_ST(X) | BPF_ME=
M | BPF_B/H/W/DW */
cffc642d93f9324 Michael Holzheu    2015-05-11  7692  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7693  		"ST_MEM_B: Store/Loa=
d byte: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7694  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7695  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7696  			BPF_ST_MEM(BPF_B, R=
10, -40, 0xff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7697  			BPF_LDX_MEM(BPF_B, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7698  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7699  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7700  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7701  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7702  		{ { 0, 0xff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7703  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7704  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7705  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7706  		"ST_MEM_B: Store/Loa=
d byte: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  7707  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7708  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7709  			BPF_ST_MEM(BPF_H, R=
10, -40, 0x7f),
cffc642d93f9324 Michael Holzheu    2015-05-11  7710  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7711  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7712  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7713  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7714  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7715  		{ { 0, 0x7f } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7716  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7717  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7718  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7719  		"STX_MEM_B: Store/Lo=
ad byte: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7720  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7721  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7722  			BPF_LD_IMM64(R1, 0x=
ffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7723  			BPF_STX_MEM(BPF_B, =
R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7724  			BPF_LDX_MEM(BPF_B, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7725  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7726  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7727  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7728  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7729  		{ { 0, 0xff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7730  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7731  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7732  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7733  		"ST_MEM_H: Store/Loa=
d half word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7734  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7735  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7736  			BPF_ST_MEM(BPF_H, R=
10, -40, 0xffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7737  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7738  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7739  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7740  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7741  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7742  		{ { 0, 0xffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7743  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7744  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7745  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7746  		"ST_MEM_H: Store/Loa=
d half word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  7747  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7748  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7749  			BPF_ST_MEM(BPF_H, R=
10, -40, 0x7fff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7750  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7751  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7752  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7753  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7754  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7755  		{ { 0, 0x7fff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7756  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7757  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7758  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7759  		"STX_MEM_H: Store/Lo=
ad half word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7760  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7761  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7762  			BPF_LD_IMM64(R1, 0x=
ffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7763  			BPF_STX_MEM(BPF_H, =
R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7764  			BPF_LDX_MEM(BPF_H, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7765  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7766  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7767  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7768  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7769  		{ { 0, 0xffff } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7770  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7771  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7772  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7773  		"ST_MEM_W: Store/Loa=
d word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7774  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7775  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7776  			BPF_ST_MEM(BPF_W, R=
10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7777  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7778  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7779  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7780  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7781  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7782  		{ { 0, 0xffffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7783  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7784  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7785  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7786  		"ST_MEM_W: Store/Loa=
d word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  7787  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7788  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7789  			BPF_ST_MEM(BPF_W, R=
10, -40, 0x7fffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7790  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7791  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7792  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7793  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7794  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7795  		{ { 0, 0x7fffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7796  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7797  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7798  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7799  		"STX_MEM_W: Store/Lo=
ad word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7800  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7801  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7802  			BPF_LD_IMM64(R1, 0x=
ffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7803  			BPF_STX_MEM(BPF_W, =
R10, R1, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7804  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7805  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7806  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7807  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7808  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7809  		{ { 0, 0xffffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7810  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7811  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7812  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7813  		"ST_MEM_DW: Store/Lo=
ad double word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7814  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7815  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7816  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7817  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7818  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7819  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7820  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7821  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7822  		{ { 0, 0xffffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7823  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7824  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7825  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7826  		"ST_MEM_DW: Store/Lo=
ad double word: max negative 2",
cffc642d93f9324 Michael Holzheu    2015-05-11  7827  		.u.insns_int =3D {
56cbaa45dde2356 Michael Holzheu    2015-05-13  7828  			BPF_LD_IMM64(R2, 0x=
ffff00000000ffffLL),
56cbaa45dde2356 Michael Holzheu    2015-05-13  7829  			BPF_LD_IMM64(R3, 0x=
ffffffffffffffffLL),
cffc642d93f9324 Michael Holzheu    2015-05-11  7830  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0xffffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7831  			BPF_LDX_MEM(BPF_DW,=
 R2, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7832  			BPF_JMP_REG(BPF_JEQ=
, R2, R3, 2),
cffc642d93f9324 Michael Holzheu    2015-05-11  7833  			BPF_MOV32_IMM(R0, 2=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  7834  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7835  			BPF_MOV32_IMM(R0, 1=
),
cffc642d93f9324 Michael Holzheu    2015-05-11  7836  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7837  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7838  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7839  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7840  		{ { 0, 0x1 } },
105c03614bff2de Alexei Starovoitov 2017-05-30  7841  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7842  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7843  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7844  		"ST_MEM_DW: Store/Lo=
ad double word: max positive",
cffc642d93f9324 Michael Holzheu    2015-05-11  7845  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7846  			BPF_ALU32_IMM(BPF_M=
OV, R0, 1),
cffc642d93f9324 Michael Holzheu    2015-05-11  7847  			BPF_ST_MEM(BPF_DW, =
R10, -40, 0x7fffffff),
cffc642d93f9324 Michael Holzheu    2015-05-11  7848  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7849  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7850  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7851  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7852  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7853  		{ { 0, 0x7fffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7854  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7855  	},
cffc642d93f9324 Michael Holzheu    2015-05-11  7856  	{
cffc642d93f9324 Michael Holzheu    2015-05-11  7857  		"STX_MEM_DW: Store/L=
oad double word: max negative",
cffc642d93f9324 Michael Holzheu    2015-05-11  7858  		.u.insns_int =3D {
cffc642d93f9324 Michael Holzheu    2015-05-11  7859  			BPF_LD_IMM64(R0, 0),
cffc642d93f9324 Michael Holzheu    2015-05-11  7860  			BPF_LD_IMM64(R1, 0x=
ffffffffffffffffLL),
ae7f47041d928b1 Johan Almbladh     2021-07-21  7861  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
ae7f47041d928b1 Johan Almbladh     2021-07-21  7862  			BPF_LDX_MEM(BPF_DW,=
 R0, R10, -40),
cffc642d93f9324 Michael Holzheu    2015-05-11  7863  			BPF_EXIT_INSN(),
cffc642d93f9324 Michael Holzheu    2015-05-11  7864  		},
cffc642d93f9324 Michael Holzheu    2015-05-11  7865  		INTERNAL,
cffc642d93f9324 Michael Holzheu    2015-05-11  7866  		{ },
cffc642d93f9324 Michael Holzheu    2015-05-11  7867  		{ { 0, 0xffffffff } =
},
105c03614bff2de Alexei Starovoitov 2017-05-30  7868  		.stack_depth =3D 40,
cffc642d93f9324 Michael Holzheu    2015-05-11  7869  	},
e5009b4636cb593 Johan Almbladh     2021-08-09  7870  	{
e5009b4636cb593 Johan Almbladh     2021-08-09  7871  		"STX_MEM_DW: Store d=
ouble word: first word in memory",
e5009b4636cb593 Johan Almbladh     2021-08-09  7872  		.u.insns_int =3D {
e5009b4636cb593 Johan Almbladh     2021-08-09  7873  			BPF_LD_IMM64(R0, 0),
e5009b4636cb593 Johan Almbladh     2021-08-09  7874  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefLL),
e5009b4636cb593 Johan Almbladh     2021-08-09  7875  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  7876  			BPF_LDX_MEM(BPF_W, =
R0, R10, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  7877  			BPF_EXIT_INSN(),
e5009b4636cb593 Johan Almbladh     2021-08-09  7878  		},
e5009b4636cb593 Johan Almbladh     2021-08-09  7879  		INTERNAL,
e5009b4636cb593 Johan Almbladh     2021-08-09  7880  		{ },
e5009b4636cb593 Johan Almbladh     2021-08-09  7881  #ifdef __BIG_ENDIAN
e5009b4636cb593 Johan Almbladh     2021-08-09  7882  		{ { 0, 0x01234567 } =
},
e5009b4636cb593 Johan Almbladh     2021-08-09  7883  #else
e5009b4636cb593 Johan Almbladh     2021-08-09  7884  		{ { 0, 0x89abcdef } =
},
e5009b4636cb593 Johan Almbladh     2021-08-09  7885  #endif
e5009b4636cb593 Johan Almbladh     2021-08-09  7886  		.stack_depth =3D 40,
e5009b4636cb593 Johan Almbladh     2021-08-09  7887  	},
e5009b4636cb593 Johan Almbladh     2021-08-09  7888  	{
e5009b4636cb593 Johan Almbladh     2021-08-09  7889  		"STX_MEM_DW: Store d=
ouble word: second word in memory",
e5009b4636cb593 Johan Almbladh     2021-08-09  7890  		.u.insns_int =3D {
e5009b4636cb593 Johan Almbladh     2021-08-09  7891  			BPF_LD_IMM64(R0, 0),
e5009b4636cb593 Johan Almbladh     2021-08-09  7892  			BPF_LD_IMM64(R1, 0x=
0123456789abcdefLL),
e5009b4636cb593 Johan Almbladh     2021-08-09  7893  			BPF_STX_MEM(BPF_DW,=
 R10, R1, -40),
e5009b4636cb593 Johan Almbladh     2021-08-09  7894  			BPF_LDX_MEM(BPF_W, =
R0, R10, -36),
e5009b4636cb593 Johan Almbladh     2021-08-09  7895  			BPF_EXIT_INSN(),
e5009b4636cb593 Johan Almbladh     2021-08-09  7896  		},
e5009b4636cb593 Johan Almbladh     2021-08-09  7897  		INTERNAL,
e5009b4636cb593 Johan Almbladh     2021-08-09  7898  		{ },
e5009b4636cb593 Johan Almbladh     2021-08-09  7899  #ifdef __BIG_ENDIAN
e5009b4636cb593 Johan Almbladh     2021-08-09  7900  		{ { 0, 0x89abcdef } =
},
e5009b4636cb593 Johan Almbladh     2021-08-09  7901  #else
e5009b4636cb593 Johan Almbladh     2021-08-09  7902  		{ { 0, 0x01234567 } =
},
e5009b4636cb593 Johan Almbladh     2021-08-09  7903  #endif
e5009b4636cb593 Johan Almbladh     2021-08-09  7904  		.stack_depth =3D 40,
e5009b4636cb593 Johan Almbladh     2021-08-09  7905  	},
91c960b0056672e Brendan Jackman    2021-01-14  7906  	/* BPF_STX | BPF_ATOM=
IC | BPF_W/DW */
85f68fe89832057 Daniel Borkmann    2017-05-01  7907  	{
85f68fe89832057 Daniel Borkmann    2017-05-01  7908  		"STX_XADD_W: X + 1 +=
 1 + 1 + ...",
85f68fe89832057 Daniel Borkmann    2017-05-01  7909  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  7910  		INTERNAL,
85f68fe89832057 Daniel Borkmann    2017-05-01  7911  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  7912  		{ { 0, 4134 } },
85f68fe89832057 Daniel Borkmann    2017-05-01  7913  		.fill_helper =3D bpf=
_fill_stxw,
85f68fe89832057 Daniel Borkmann    2017-05-01  7914  	},
85f68fe89832057 Daniel Borkmann    2017-05-01  7915  	{
85f68fe89832057 Daniel Borkmann    2017-05-01  7916  		"STX_XADD_DW: X + 1 =
+ 1 + 1 + ...",
85f68fe89832057 Daniel Borkmann    2017-05-01  7917  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  7918  		INTERNAL,
85f68fe89832057 Daniel Borkmann    2017-05-01  7919  		{ },
85f68fe89832057 Daniel Borkmann    2017-05-01  7920  		{ { 0, 4134 } },
85f68fe89832057 Daniel Borkmann    2017-05-01  7921  		.fill_helper =3D bpf=
_fill_stxdw,
85f68fe89832057 Daniel Borkmann    2017-05-01  7922  	},
e4517b3637c648b Johan Almbladh     2021-08-09  7923  	/*
e4517b3637c648b Johan Almbladh     2021-08-09  7924  	 * Exhaustive tests o=
f atomic operation variants.
e4517b3637c648b Johan Almbladh     2021-08-09  7925  	 * Individual tests a=
re expanded from template macros for all
e4517b3637c648b Johan Almbladh     2021-08-09  7926  	 * combinations of AL=
U operation, word size and fetching.
e4517b3637c648b Johan Almbladh     2021-08-09  7927  	 */
eb2947361f01693 Johan Almbladh     2021-10-01  7928  #define BPF_ATOMIC_POI=
SON(width) ((width) =3D=3D BPF_W ? (0xbaadf00dULL << 32) : 0)
eb2947361f01693 Johan Almbladh     2021-10-01  7929  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============1583529340370470195==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
eV5wQOno+/+XUduvF7ICAA==
--===============1583529340370470195==--

