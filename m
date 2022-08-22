Content-Type: multipart/mixed; boundary="===============5109528578576422536=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 01/31] crypto: Introduce crypto_pool
Date: Mon, 22 Aug 2022 13:35:28 +0800
Message-ID: <202208221327.PD3sMUrp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5109528578576422536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220818170005.747015-2-dima@arista.com>
References: <20220818170005.747015-2-dima@arista.com>
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
20822/202208221327.PD3sMUrp-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
crypto/crypto_pool.c:161 crypto_pool_alloc_ahash() error: testing array off=
set 'i' after use.

vim +/i +161 crypto/crypto_pool.c

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  130  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  131  /**
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  132   * crypto_pool_alloc_ahash =
- allocates pool for ahash requests
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  133   * @alg: name of async hash=
 algorithm
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  134   */
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  135  int crypto_pool_alloc_ahash=
(const char *alg)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  136  {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  137  	unsigned int i;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  138  	int err;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  139  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  140  	/* slow-path */
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  141  	mutex_lock(&cpool_mutex);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  142  	err =3D crypto_pool_scratc=
h_alloc();
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  143  	if (err)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  144  		goto out;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  145  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  146  	for (i =3D 0; i < last_all=
ocated; i++) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  147  		if (cpool[i].alg && !strc=
mp(cpool[i].alg, alg)) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  148  			if (kref_read(&cpool[i].=
kref) > 0) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  149  				kref_get(&cpool[i].kref=
);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  150  				goto out;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  151  			} else {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  152  				break;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  153  			}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  154  		}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  155  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  156  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  157  	for (i =3D 0; i < last_all=
ocated; i++) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  158  		if (!cpool[i].alg)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  159  			break;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  160  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18 @161  	if (i >=3D CPOOL_SIZE) {
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  162  		err =3D -ENOSPC;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  163  		goto out;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  164  	}
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  165  =

f4c3873630fc8c4 Dmitry Safonov 2022-08-18  166  	err =3D __cpool_alloc_ahas=
h(&cpool[i], alg);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  167  	if (!err && last_allocated=
 <=3D i)
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  168  		last_allocated++;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  169  out:
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  170  	mutex_unlock(&cpool_mutex);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  171  	return err ?: (int)i;
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  172  }
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  173  EXPORT_SYMBOL_GPL(crypto_po=
ol_alloc_ahash);
f4c3873630fc8c4 Dmitry Safonov 2022-08-18  174  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5109528578576422536==--

