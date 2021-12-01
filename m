Content-Type: multipart/mixed; boundary="===============8081565528449788974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] crypto: drbg - ignore jitterentropy errors if not in FIPS mode
Date: Wed, 01 Dec 2021 18:09:47 +0800
Message-ID: <202112011713.oDc3BxfB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8081565528449788974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211130141009.6791-2-nstange@suse.de>
References: <20211130141009.6791-2-nstange@suse.de>
TO: Nicolai Stange <nstange@suse.de>
TO: "Stephan M=C3=BCller" <smueller@chronox.de>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
CC: Torsten Duwe <duwe@suse.de>
CC: linux-crypto(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Nicolai Stange <nstange@suse.de>

Hi Nicolai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on v5.16-rc3 next-20211201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicolai-Stange/crypto-jitt=
erentropy-bound-collection-loop/20211130-221237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-c001-20211128 (https://download.01.org/0day-ci/arch=
ive/20211201/202112011713.oDc3BxfB-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/39add3a4ed785c1aa833f6b70=
58f334f0156be4b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicolai-Stange/crypto-jitterentrop=
y-bound-collection-loop/20211130-221237
        git checkout 39add3a4ed785c1aa833f6b7058f334f0156be4b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   crypto/drbg.c:409:29: note: Calling 'drbg_blocklen'
           unsigned char *temp =3D iv + drbg_blocklen(drbg);
                                      ^~~~~~~~~~~~~~~~~~~
   include/crypto/drbg.h:156:6: note: 'drbg' is non-null, which participate=
s in a condition later
           if (drbg && drbg->core)
               ^~~~
   include/crypto/drbg.h:156:6: note: Left side of '&&' is true
   include/crypto/drbg.h:156:20: note: Field 'core' is null, which particip=
ates in a condition later
           if (drbg && drbg->core)
                             ^
   include/crypto/drbg.h:156:2: note: Taking false branch
           if (drbg && drbg->core)
           ^
   include/crypto/drbg.h:158:2: note: Returning without writing to 'drbg->c=
ore', which participates in a condition later
           return 0;
           ^
   crypto/drbg.c:409:29: note: Returning from 'drbg_blocklen'
           unsigned char *temp =3D iv + drbg_blocklen(drbg);
                                      ^~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:425:17: note: Calling 'drbg_blocklen'
           memset(pad, 0, drbg_blocklen(drbg));
                          ^
   arch/x86/include/asm/string_32.h:228:52: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                                                      ^~~~~
   include/crypto/drbg.h:156:6: note: 'drbg' is non-null, which participate=
s in a condition later
           if (drbg && drbg->core)
               ^~~~
   include/crypto/drbg.h:156:6: note: Left side of '&&' is true
   include/crypto/drbg.h:156:20: note: Field 'core' is null, which particip=
ates in a condition later
           if (drbg && drbg->core)
                             ^
   include/crypto/drbg.h:156:2: note: Taking false branch
           if (drbg && drbg->core)
           ^
   include/crypto/drbg.h:158:2: note: Returning without writing to 'drbg->c=
ore', which participates in a condition later
           return 0;
           ^
   crypto/drbg.c:425:17: note: Returning from 'drbg_blocklen'
           memset(pad, 0, drbg_blocklen(drbg));
                          ^
   arch/x86/include/asm/string_32.h:228:52: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                                                      ^~~~~
   crypto/drbg.c:426:16: note: Calling 'drbg_blocklen'
           memset(iv, 0, drbg_blocklen(drbg));
                         ^
   arch/x86/include/asm/string_32.h:228:52: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                                                      ^~~~~
   include/crypto/drbg.h:156:6: note: 'drbg' is non-null, which participate=
s in a condition later
           if (drbg && drbg->core)
               ^~~~
   include/crypto/drbg.h:156:6: note: Left side of '&&' is true
   include/crypto/drbg.h:156:20: note: Field 'core' is null, which particip=
ates in a condition later
           if (drbg && drbg->core)
                             ^
   include/crypto/drbg.h:156:2: note: Taking false branch
           if (drbg && drbg->core)
           ^
   include/crypto/drbg.h:158:2: note: Returning without writing to 'drbg->c=
ore', which participates in a condition later
           return 0;
           ^
   crypto/drbg.c:426:16: note: Returning from 'drbg_blocklen'
           memset(iv, 0, drbg_blocklen(drbg));
                         ^
   arch/x86/include/asm/string_32.h:228:52: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                                                      ^~~~~
   crypto/drbg.c:431:2: note: Taking false branch
           if ((512/8) < bytes_to_return)
           ^
   crypto/drbg.c:435:2: note: Loop condition is false. Execution continues =
on line 437
           list_for_each_entry(seed, seedlist, list)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   crypto/drbg.c:443:43: note: Calling 'drbg_blocklen'
           padlen =3D (inputlen + sizeof(L_N) + 1) % (drbg_blocklen(drbg));
                                                    ^~~~~~~~~~~~~~~~~~~
   include/crypto/drbg.h:156:6: note: 'drbg' is non-null
           if (drbg && drbg->core)
               ^~~~
   include/crypto/drbg.h:156:6: note: Left side of '&&' is true
   include/crypto/drbg.h:156:20: note: Field 'core' is null
           if (drbg && drbg->core)
                             ^
   include/crypto/drbg.h:156:2: note: Taking false branch
           if (drbg && drbg->core)
           ^
   include/crypto/drbg.h:158:2: note: Returning zero
           return 0;
           ^~~~~~~~
   crypto/drbg.c:443:43: note: Returning from 'drbg_blocklen'
           padlen =3D (inputlen + sizeof(L_N) + 1) % (drbg_blocklen(drbg));
                                                    ^~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:443:40: note: Division by zero
           padlen =3D (inputlen + sizeof(L_N) + 1) % (drbg_blocklen(drbg));
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>> crypto/drbg.c:1200:4: warning: Value stored to 'ret' is never read [clan=
g-analyzer-deadcode.DeadStores]
                           ret =3D crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:1200:4: note: Value stored to 'ret' is never read
                           ret =3D crypto_rng_get_bytes(drbg->jent,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:1870:3: warning: Null pointer passed as 1st argument to me=
mory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(outbuf, drbg->outscratchpad, cryptlen);
                   ^
   arch/x86/include/asm/string_32.h:182:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^
   crypto/drbg.c:600:12: note: Assuming '__UNIQUE_ID___x211' is >=3D '__UNI=
QUE_ID___y212'
           int len =3D min_t(int, buflen, INT_MAX);
                     ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   crypto/drbg.c:600:12: note: '?' condition is false
           int len =3D min_t(int, buflen, INT_MAX);
                     ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   crypto/drbg.c:603:6: note: Assuming 'addtl' is non-null
           if (addtl && !list_empty(addtl)) {
               ^~~~~
   crypto/drbg.c:603:6: note: Left side of '&&' is true
   crypto/drbg.c:603:16: note: Calling 'list_empty'
           if (addtl && !list_empty(addtl)) {
                         ^~~~~~~~~~~~~~~~~
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/list.h:284:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'

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
39add3a4ed785c Nicolai Stange  2021-11-30  1196  			/*
39add3a4ed785c Nicolai Stange  2021-11-30  1197  			 * Get seed from Jitter=
 RNG, failures are
39add3a4ed785c Nicolai Stange  2021-11-30  1198  			 * fatal only in FIPS m=
ode.
39add3a4ed785c Nicolai Stange  2021-11-30  1199  			 */
57225e6797885e Stephan Mueller 2015-06-09 @1200  			ret =3D crypto_rng_get_=
bytes(drbg->jent,
57225e6797885e Stephan Mueller 2015-06-09  1201  						   entropy + entropy=
len,
57225e6797885e Stephan Mueller 2015-06-09  1202  						   entropylen);
39add3a4ed785c Nicolai Stange  2021-11-30  1203  			if (fips_enabled && ret=
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8081565528449788974==--

