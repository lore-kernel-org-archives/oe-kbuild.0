Content-Type: multipart/mixed; boundary="===============0539285597060368534=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/7] crypto: DRBG - remove internal reseeding operation
Date: Wed, 26 Jan 2022 19:54:33 +0800
Message-ID: <202201261919.fUyJINhO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0539285597060368534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <2450379.h6RI2rZIcs@positron.chronox.de>
References: <2450379.h6RI2rZIcs@positron.chronox.de>
TO: "Stephan M=C3=BCller" <smueller@chronox.de>
TO: herbert(a)gondor.apana.org.au
CC: linux-crypto(a)vger.kernel.org
CC: simo(a)redhat.com
CC: Nicolai Stange <nstange@suse.de>

Hi "Stephan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.17-rc=
1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephan-M-ller/Common-entr=
opy-source-and-DRNG-management/20220126-150911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arc-randconfig-c004-20220124 (https://download.01.org/0day-ci/archi=
ve/20220126/202201261919.fUyJINhO-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> crypto/drbg.c:1315:3-9: preceding lock on line 1303
   crypto/drbg.c:1322:3-9: preceding lock on line 1303

vim +1315 crypto/drbg.c

57225e6797885e Stephan Mueller 2015-06-09  1277  =

541af946fe1360 Stephan Mueller 2014-05-31  1278  /*
541af946fe1360 Stephan Mueller 2014-05-31  1279   * DRBG instantiation func=
tion as required by SP800-90A - this function
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1280   * sets up the DRBG h=
andle if needed and seeds the DRBG with entropy. If the
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1281   * DRBG is already in=
stantiated, the DRBG is simply reseeded.
541af946fe1360 Stephan Mueller 2014-05-31  1282   *
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1283   * @tfm: tfm cipher h=
andle with DRBG state (may be uninitialized)
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1284   * @seed: buffer with=
 the entropy data to (re)seed the DRBG
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1285   * @slen: length of s=
eed buffer
541af946fe1360 Stephan Mueller 2014-05-31  1286   *
541af946fe1360 Stephan Mueller 2014-05-31  1287   * return
541af946fe1360 Stephan Mueller 2014-05-31  1288   *	0 on success
541af946fe1360 Stephan Mueller 2014-05-31  1289   *	error value otherwise
541af946fe1360 Stephan Mueller 2014-05-31  1290   */
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1291  static int drbg_insta=
ntiate(struct crypto_rng *tfm,
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1292  			    const u8 *seed=
, unsigned int slen)
541af946fe1360 Stephan Mueller 2014-05-31  1293  {
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1294  	struct drbg_state *d=
rbg =3D crypto_rng_ctx(tfm);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1295  	struct drbg_string s=
eeddata;
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1296  	LIST_HEAD(seedlist);
2a57e4241ec9a1 Herbert Xu      2015-04-20  1297  	int ret;
2a57e4241ec9a1 Herbert Xu      2015-04-20  1298  	bool reseed =3D true;
541af946fe1360 Stephan Mueller 2014-05-31  1299  =

14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1300  	drbg_string_fill(&se=
eddata, seed, slen);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1301  	list_add_tail(&seedd=
ata.list, &seedlist);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1302  =

76899a41f830d1 Stephan Mueller 2015-04-18 @1303  	mutex_lock(&drbg->drbg_mu=
tex);
541af946fe1360 Stephan Mueller 2014-05-31  1304  =

541af946fe1360 Stephan Mueller 2014-05-31  1305  	/* 9.1 step 1 is implicit=
 with the selected DRBG type */
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1306  	/* 9.1 step 2 is imp=
licit as no prediction resistance is supported */
541af946fe1360 Stephan Mueller 2014-05-31  1307  	/* 9.1 step 4 is implicit=
 in  drbg_sec_strength */
541af946fe1360 Stephan Mueller 2014-05-31  1308  =

2a57e4241ec9a1 Herbert Xu      2015-04-20  1309  	if (!drbg->core) {
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1310  		struct crypto_tfm *=
tfm_base =3D crypto_rng_tfm(tfm);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1311  		int coreref =3D 0;
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1312  =

14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1313  		if (!slen) {
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1314  			pr_warn("DRBG: ini=
tial seed missing\n");
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26 @1315  			return -EINVAL;
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1316  		}
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1317  =

14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1318  		pr_devel("DRBG: Ini=
tializing DRBG core %d\n", coreref);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1319  		ret =3D drbg_conver=
t_tfm_core(
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1320  			crypto_tfm_alg_dri=
ver_name(tfm_base), &coreref);
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1321  		if (ret)
14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1322  			return ret;
2a57e4241ec9a1 Herbert Xu      2015-04-20  1323  		drbg->core =3D &drbg_cor=
es[coreref];
2a57e4241ec9a1 Herbert Xu      2015-04-20  1324  =

541af946fe1360 Stephan Mueller 2014-05-31  1325  		ret =3D drbg_alloc_state=
(drbg);
541af946fe1360 Stephan Mueller 2014-05-31  1326  		if (ret)
76899a41f830d1 Stephan Mueller 2015-04-18  1327  			goto unlock;
541af946fe1360 Stephan Mueller 2014-05-31  1328  =

2a57e4241ec9a1 Herbert Xu      2015-04-20  1329  		reseed =3D false;
2a57e4241ec9a1 Herbert Xu      2015-04-20  1330  	}
2a57e4241ec9a1 Herbert Xu      2015-04-20  1331  =

14ec08bbd20e04 Stephan M=C3=BCller  2022-01-26  1332  	ret =3D drbg_seed(dr=
bg, &seedlist, reseed);
541af946fe1360 Stephan Mueller 2014-05-31  1333  =

76899a41f830d1 Stephan Mueller 2015-04-18  1334  unlock:
76899a41f830d1 Stephan Mueller 2015-04-18  1335  	mutex_unlock(&drbg->drbg_=
mutex);
541af946fe1360 Stephan Mueller 2014-05-31  1336  	return ret;
541af946fe1360 Stephan Mueller 2014-05-31  1337  }
541af946fe1360 Stephan Mueller 2014-05-31  1338  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0539285597060368534==--

