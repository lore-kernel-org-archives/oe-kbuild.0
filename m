Content-Type: multipart/mixed; boundary="===============2902424523138628804=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6018/6993] crypto/drbg.c:1200:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 15 Dec 2021 23:05:24 +0800
Message-ID: <202112152209.Phx0xhEk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2902424523138628804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nicolai Stange <nstange@suse.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Stephan Mueller <smueller@chronox.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0bafb8f3ebc84525d0ae0fcea22d12151b99312f
commit: 8f7977284331d0b0f210efa98a5d3fdcb2a65dd3 [6018/6993] crypto: drbg -=
 ignore jitterentropy errors if not in FIPS mode
:::::: branch date: 17 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20211215/202112152209.Phx0xhEk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D8f7977284331d0b0f210efa98a5d3fdcb2a65dd3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8f7977284331d0b0f210efa98a5d3fdcb2a65dd3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/fuse/dev.c:1688:6: note: Assuming 'ra' is non-null
           if (!ra)
               ^~~
   fs/fuse/dev.c:1688:2: note: Taking false branch
           if (!ra)
           ^
   fs/fuse/dev.c:1704:9: note: Assuming 'num' is not equal to 0
           while (num && ap->num_pages < num_pages) {
                  ^~~
   fs/fuse/dev.c:1704:9: note: Left side of '&&' is true
   fs/fuse/dev.c:1704:30: note: The left operand of '<' is a garbage value
           while (num && ap->num_pages < num_pages) {
                         ~~~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/scatterlist.c:109:10: warning: Access to field 'page_link' results i=
n a dereference of a null pointer (loaded from variable 'ret') [clang-analy=
zer-core.NullDereference]
           BUG_ON(!sg_is_last(ret));
                   ^
   include/linux/scatterlist.h:73:26: note: expanded from macro 'sg_is_last'
   #define sg_is_last(sg)          ((sg)->page_link & SG_END)
                                    ^~~
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/scatterlist.c:103:27: note: 'ret' initialized to a null pointer value
           struct scatterlist *sg, *ret =3D NULL;
                                    ^~~
   lib/scatterlist.c:106:30: note: Assuming 'i' is >=3D 'nents'
           for_each_sg(sgl, sg, nents, i)
                                       ^
   include/linux/scatterlist.h:152:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   lib/scatterlist.c:106:2: note: Loop condition is false. Execution contin=
ues on line 109
           for_each_sg(sgl, sg, nents, i)
           ^
   include/linux/scatterlist.h:152:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   lib/scatterlist.c:109:10: note: Access to field 'page_link' results in a=
 dereference of a null pointer (loaded from variable 'ret')
           BUG_ON(!sg_is_last(ret));
                   ^
   include/linux/scatterlist.h:73:26: note: expanded from macro 'sg_is_last'
   #define sg_is_last(sg)          ((sg)->page_link & SG_END)
                                    ^~~
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   crypto/drbg.c:246:17: warning: Value stored to 'entropylen' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:246:17: note: Value stored to 'entropylen' during its init=
ialization is never read
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> crypto/drbg.c:1200:4: warning: Value stored to 'ret' is never read [clan=
g-analyzer-deadcode.DeadStores]
                           ret =3D crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:1200:4: note: Value stored to 'ret' is never read
                           ret =3D crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   crypto/ecc.c:147:24: warning: The left operand of '&' is a garbage value=
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (vli[bit / 64] & ((u64)1 << (bit % 64)));
                                 ^
   crypto/ecc.c:1618:6: note: Assuming 'private_key' is non-null
           if (!private_key || !public_key || !curve ||
               ^~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
   crypto/ecc.c:1618:22: note: Assuming 'public_key' is non-null
           if (!private_key || !public_key || !curve ||
                               ^~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:38: note: 'curve' is non-null
           if (!private_key || !public_key || !curve ||
                                               ^~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1619:6: note: Assuming the condition is false
               ndigits > ARRAY_SIZE(priv) || ndigits > ARRAY_SIZE(rand_z)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:2: note: Taking false branch
           if (!private_key || !public_key || !curve ||
           ^
   crypto/ecc.c:1629:7: note: 'pk' is non-null
           if (!pk) {
                ^~
   crypto/ecc.c:1629:2: note: Taking false branch
           if (!pk) {
           ^
   crypto/ecc.c:1636:8: note: Calling 'ecc_is_pubkey_valid_partial'
           ret =3D ecc_is_pubkey_valid_partial(curve, pk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1553:14: note: Assuming 'pk->ndigits' is equal to 'curve->g=
.ndigits'
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/ecc.c:1553:6: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/ecc.c:1553:2: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
           ^
   crypto/ecc.c:1557:2: note: Taking false branch
           if (ecc_point_is_zero(pk))
           ^
   crypto/ecc.c:1561:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->x, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1563:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->y, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1567:2: note: Calling 'vli_mod_square_fast'
           vli_mod_square_fast(yy, pk->y, curve); /* y^2 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:982:2: note: Calling 'vli_mmod_fast'
           vli_mmod_fast(result, product, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:918:6: note: Assuming the condition is true
           if (strncmp(curve->name, "nist_", 5) !=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:918:2: note: Taking true branch
           if (strncmp(curve->name, "nist_", 5) !=3D 0) {
           ^
   crypto/ecc.c:920:7: note: Assuming the condition is false
                   if (curve_prime[ndigits - 1] =3D=3D -1ull) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:920:3: note: Taking false branch
                   if (curve_prime[ndigits - 1] =3D=3D -1ull) {
                   ^
   crypto/ecc.c:924:14: note: Assuming the condition is true
                   } else if (curve_prime[ndigits - 1] =3D=3D 1ull << 63 &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:924:14: note: Left side of '&&' is true
   crypto/ecc.c:925:7: note: Assuming the condition is true
                              curve_prime[ndigits - 2] =3D=3D 0) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/ret +1200 crypto/drbg.c

8ea5ee00beb925 Nicolai Stange  2021-11-15  1136  =

541af946fe1360 Stephan Mueller 2014-05-31  1137  /*
541af946fe1360 Stephan Mueller 2014-05-31  1138   * Seeding or reseeding of=
 the DRBG
541af946fe1360 Stephan Mueller 2014-05-31  1139   *
541af946fe1360 Stephan Mueller 2014-05-31  1140   * @drbg: DRBG state struct
541af946fe1360 Stephan Mueller 2014-05-31  1141   * @pers: personalization =
/ additional information buffer
541af946fe1360 Stephan Mueller 2014-05-31  1142   * @reseed: 0 for initial =
seed process, 1 for reseeding
541af946fe1360 Stephan Mueller 2014-05-31  1143   *
541af946fe1360 Stephan Mueller 2014-05-31  1144   * return:
541af946fe1360 Stephan Mueller 2014-05-31  1145   *	0 on success
541af946fe1360 Stephan Mueller 2014-05-31  1146   *	error value otherwise
541af946fe1360 Stephan Mueller 2014-05-31  1147   */
541af946fe1360 Stephan Mueller 2014-05-31  1148  static int drbg_seed(struc=
t drbg_state *drbg, struct drbg_string *pers,
541af946fe1360 Stephan Mueller 2014-05-31  1149  		     bool reseed)
541af946fe1360 Stephan Mueller 2014-05-31  1150  {
57225e6797885e Stephan Mueller 2015-06-09  1151  	int ret;
57225e6797885e Stephan Mueller 2015-06-09  1152  	unsigned char entropy[((3=
2 + 16) * 2)];
57225e6797885e Stephan Mueller 2015-06-09  1153  	unsigned int entropylen =
=3D drbg_sec_strength(drbg->core->flags);
541af946fe1360 Stephan Mueller 2014-05-31  1154  	struct drbg_string data1;
8c98716601bc05 Stephan Mueller 2014-06-28  1155  	LIST_HEAD(seedlist);
2bcd25443868aa Nicolai Stange  2021-11-15  1156  	enum drbg_seed_state new_=
seed_state =3D DRBG_SEED_STATE_FULL;
541af946fe1360 Stephan Mueller 2014-05-31  1157  =

541af946fe1360 Stephan Mueller 2014-05-31  1158  	/* 9.1 / 9.2 / 9.3.1 step=
 3 */
541af946fe1360 Stephan Mueller 2014-05-31  1159  	if (pers && pers->len > (=
drbg_max_addtl(drbg))) {
a9089571f2fc20 Stephan Mueller 2014-07-06  1160  		pr_devel("DRBG: personal=
ization string too long %zu\n",
541af946fe1360 Stephan Mueller 2014-05-31  1161  			 pers->len);
541af946fe1360 Stephan Mueller 2014-05-31  1162  		return -EINVAL;
541af946fe1360 Stephan Mueller 2014-05-31  1163  	}
541af946fe1360 Stephan Mueller 2014-05-31  1164  =

8fded5925d0a73 Herbert Xu      2015-04-21  1165  	if (list_empty(&drbg->tes=
t_data.list)) {
8fded5925d0a73 Herbert Xu      2015-04-21  1166  		drbg_string_fill(&data1,=
 drbg->test_data.buf,
8fded5925d0a73 Herbert Xu      2015-04-21  1167  				 drbg->test_data.len);
541af946fe1360 Stephan Mueller 2014-05-31  1168  		pr_devel("DRBG: using te=
st entropy\n");
541af946fe1360 Stephan Mueller 2014-05-31  1169  	} else {
57225e6797885e Stephan Mueller 2015-06-09  1170  		/*
57225e6797885e Stephan Mueller 2015-06-09  1171  		 * Gather entropy equal =
to the security strength of the DRBG.
57225e6797885e Stephan Mueller 2015-06-09  1172  		 * With a derivation fun=
ction, a nonce is required in addition
57225e6797885e Stephan Mueller 2015-06-09  1173  		 * to the entropy. A non=
ce must be at least 1/2 of the security
57225e6797885e Stephan Mueller 2015-06-09  1174  		 * strength of the DRBG =
in size. Thus, entropy + nonce is 3/2
57225e6797885e Stephan Mueller 2015-06-09  1175  		 * of the strength. The =
consideration of a nonce is only
57225e6797885e Stephan Mueller 2015-06-09  1176  		 * applicable during ini=
tial seeding.
57225e6797885e Stephan Mueller 2015-06-09  1177  		 */
57225e6797885e Stephan Mueller 2015-06-09  1178  		BUG_ON(!entropylen);
57225e6797885e Stephan Mueller 2015-06-09  1179  		if (!reseed)
57225e6797885e Stephan Mueller 2015-06-09  1180  			entropylen =3D ((entrop=
ylen + 1) / 2) * 3;
57225e6797885e Stephan Mueller 2015-06-09  1181  		BUG_ON((entropylen * 2) =
> sizeof(entropy));
57225e6797885e Stephan Mueller 2015-06-09  1182  =

b8ec5ba42c4a38 Stephan Mueller 2015-05-25  1183  		/* Get seed from in-kern=
el /dev/urandom */
2bcd25443868aa Nicolai Stange  2021-11-15  1184  		if (!rng_is_initialized(=
))
2bcd25443868aa Nicolai Stange  2021-11-15  1185  			new_seed_state =3D DRBG=
_SEED_STATE_PARTIAL;
2bcd25443868aa Nicolai Stange  2021-11-15  1186  =

db07cd26ac6a41 Stephan Mueller 2019-05-08  1187  		ret =3D drbg_get_random_=
bytes(drbg, entropy, entropylen);
db07cd26ac6a41 Stephan Mueller 2019-05-08  1188  		if (ret)
db07cd26ac6a41 Stephan Mueller 2019-05-08  1189  			goto out;
b8ec5ba42c4a38 Stephan Mueller 2015-05-25  1190  =

57225e6797885e Stephan Mueller 2015-06-09  1191  		if (!drbg->jent) {
57225e6797885e Stephan Mueller 2015-06-09  1192  			drbg_string_fill(&data1=
, entropy, entropylen);
57225e6797885e Stephan Mueller 2015-06-09  1193  			pr_devel("DRBG: (re)see=
ding with %u bytes of entropy\n",
57225e6797885e Stephan Mueller 2015-06-09  1194  				 entropylen);
b8ec5ba42c4a38 Stephan Mueller 2015-05-25  1195  		} else {
8f7977284331d0 Nicolai Stange  2021-11-30  1196  			/*
8f7977284331d0 Nicolai Stange  2021-11-30  1197  			 * Get seed from Jitter=
 RNG, failures are
8f7977284331d0 Nicolai Stange  2021-11-30  1198  			 * fatal only in FIPS m=
ode.
8f7977284331d0 Nicolai Stange  2021-11-30  1199  			 */
57225e6797885e Stephan Mueller 2015-06-09 @1200  			ret =3D crypto_rng_get_=
bytes(drbg->jent,
57225e6797885e Stephan Mueller 2015-06-09  1201  						   entropy + entropy=
len,
57225e6797885e Stephan Mueller 2015-06-09  1202  						   entropylen);
8f7977284331d0 Nicolai Stange  2021-11-30  1203  			if (fips_enabled && ret=
) {
57225e6797885e Stephan Mueller 2015-06-09  1204  				pr_devel("DRBG: jent f=
ailed with %d\n", ret);
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1205  =

97f2650e504033 Stephan M=C3=BCller  2020-04-17  1206  				/*
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1207  				 * Do not treat t=
he transient failure of the
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1208  				 * Jitter RNG as =
an error that needs to be
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1209  				 * reported. The =
combined number of the
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1210  				 * maximum reseed=
 threshold times the maximum
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1211  				 * number of Jitt=
er RNG transient errors is
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1212  				 * less than the =
reseed threshold required by
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1213  				 * SP800-90A allo=
wing us to treat the
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1214  				 * transient erro=
rs as such.
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1215  				 *
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1216  				 * However, we ma=
ndate that at least the first
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1217  				 * seeding operat=
ion must succeed with the
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1218  				 * Jitter RNG.
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1219  				 */
97f2650e504033 Stephan M=C3=BCller  2020-04-17  1220  				if (!reseed || re=
t !=3D -EAGAIN)
db07cd26ac6a41 Stephan Mueller 2019-05-08  1221  					goto out;
57225e6797885e Stephan Mueller 2015-06-09  1222  			}
57225e6797885e Stephan Mueller 2015-06-09  1223  =

57225e6797885e Stephan Mueller 2015-06-09  1224  			drbg_string_fill(&data1=
, entropy, entropylen * 2);
57225e6797885e Stephan Mueller 2015-06-09  1225  			pr_devel("DRBG: (re)see=
ding with %u bytes of entropy\n",
57225e6797885e Stephan Mueller 2015-06-09  1226  				 entropylen * 2);
b8ec5ba42c4a38 Stephan Mueller 2015-05-25  1227  		}
541af946fe1360 Stephan Mueller 2014-05-31  1228  	}
8c98716601bc05 Stephan Mueller 2014-06-28  1229  	list_add_tail(&data1.list=
, &seedlist);
541af946fe1360 Stephan Mueller 2014-05-31  1230  =

541af946fe1360 Stephan Mueller 2014-05-31  1231  	/*
541af946fe1360 Stephan Mueller 2014-05-31  1232  	 * concatenation of entro=
py with personalization str / addtl input)
541af946fe1360 Stephan Mueller 2014-05-31  1233  	 * the variable pers is d=
irectly handed in by the caller, so check its
541af946fe1360 Stephan Mueller 2014-05-31  1234  	 * contents whether it is=
 appropriate
541af946fe1360 Stephan Mueller 2014-05-31  1235  	 */
8c98716601bc05 Stephan Mueller 2014-06-28  1236  	if (pers && pers->buf && =
0 < pers->len) {
8c98716601bc05 Stephan Mueller 2014-06-28  1237  		list_add_tail(&pers->lis=
t, &seedlist);
541af946fe1360 Stephan Mueller 2014-05-31  1238  		pr_devel("DRBG: using pe=
rsonalization string\n");
541af946fe1360 Stephan Mueller 2014-05-31  1239  	}
541af946fe1360 Stephan Mueller 2014-05-31  1240  =

e6c0244ad38a35 Stephan Mueller 2014-08-17  1241  	if (!reseed) {
e6c0244ad38a35 Stephan Mueller 2014-08-17  1242  		memset(drbg->V, 0, drbg_=
statelen(drbg));
e6c0244ad38a35 Stephan Mueller 2014-08-17  1243  		memset(drbg->C, 0, drbg_=
statelen(drbg));
e6c0244ad38a35 Stephan Mueller 2014-08-17  1244  	}
e6c0244ad38a35 Stephan Mueller 2014-08-17  1245  =

2bcd25443868aa Nicolai Stange  2021-11-15  1246  	ret =3D __drbg_seed(drbg,=
 &seedlist, reseed, new_seed_state);
3d6a5f75d13405 Stephan Mueller 2015-05-25  1247  =

db07cd26ac6a41 Stephan Mueller 2019-05-08  1248  out:
57225e6797885e Stephan Mueller 2015-06-09  1249  	memzero_explicit(entropy,=
 entropylen * 2);
4c7879907eddd5 Stephan Mueller 2015-05-25  1250  =

541af946fe1360 Stephan Mueller 2014-05-31  1251  	return ret;
541af946fe1360 Stephan Mueller 2014-05-31  1252  }
541af946fe1360 Stephan Mueller 2014-05-31  1253  =


:::::: The code at line 1200 was first introduced by commit
:::::: 57225e6797885e31302e76fc5926c0bedd7e5ad4 crypto: drbg - Use callback=
 API for random readiness

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2902424523138628804==--

