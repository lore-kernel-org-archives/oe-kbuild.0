Content-Type: multipart/mixed; boundary="===============0770339503315428486=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 02/31] crypto_pool: Add crypto_pool_reserve_scratch()
Date: Mon, 22 Aug 2022 18:21:02 +0800
Message-ID: <202208221817.t5uzfegL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0770339503315428486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220818170005.747015-3-dima@arista.com>
References: <20220818170005.747015-3-dima@arista.com>
TO: Dmitry Safonov <dima@arista.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Dmitry Safonov <dima@arista.com>
CC: Andy Lutomirski <luto@amacapital.net>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Bob Gilligan <gilligan@arista.com>
CC: David Ahern <dsahern@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Ivan Delalande <colona@arista.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Leonard Crestez <cdleonard@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Salam Noureddine <noureddine@arista.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-crypto(a)vger.kernel.org

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e34cfee65ec891a319ce79797dda18083af33a76]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-t=
cp-Add-TCP-AO-support/20220819-010628
base:   e34cfee65ec891a319ce79797dda18083af33a76
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20822/202208221817.t5uzfegL-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
crypto/crypto_pool.c:203 crypto_pool_alloc_ahash() error: uninitialized sym=
bol 'err'.

Old smatch warnings:
crypto/crypto_pool.c:193 crypto_pool_alloc_ahash() error: testing array off=
set 'i' after use.

vim +/err +203 crypto/crypto_pool.c

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  166  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  167  /**
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  168   * crypto_pool_alloc_ahash =
- allocates pool for ahash requests
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  169   * @alg: name of async hash=
 algorithm
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  170   */
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  171  int crypto_pool_alloc_ahash=
(const char *alg)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  172  {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  173  	unsigned int i;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  174  	int err;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  175  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  176  	/* slow-path */
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  177  	mutex_lock(&cpool_mutex);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  178  	for (i =3D 0; i < last_all=
ocated; i++) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  179  		if (cpool[i].alg && !strc=
mp(cpool[i].alg, alg)) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  180  			if (kref_read(&cpool[i].=
kref) > 0) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  181  				kref_get(&cpool[i].kref=
);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  182  				goto out;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  183  			} else {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  184  				break;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  185  			}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  186  		}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  187  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  188  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  189  	for (i =3D 0; i < last_all=
ocated; i++) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  190  		if (!cpool[i].alg)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  191  			break;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  192  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  193  	if (i >=3D CPOOL_SIZE) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  194  		err =3D -ENOSPC;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  195  		goto out;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  196  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  197  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  198  	err =3D __cpool_alloc_ahas=
h(&cpool[i], alg);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  199  	if (!err && last_allocated=
 <=3D i)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  200  		last_allocated++;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  201  out:
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  202  	mutex_unlock(&cpool_mutex);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18 @203  	return err ?: (int)i;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  204  }
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  205  EXPORT_SYMBOL_GPL(crypto_po=
ol_alloc_ahash);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  206  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0770339503315428486==--

