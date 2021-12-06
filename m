Content-Type: multipart/mixed; boundary="===============7295367595674893805=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 03/18] crypto: dh - optimize domain parameter serialization for well-known groups
Date: Tue, 07 Dec 2021 03:01:55 +0800
Message-ID: <202112070306.wfN6TcdK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7295367595674893805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201004858.19831-4-nstange@suse.de>
References: <20211201004858.19831-4-nstange@suse.de>
TO: Nicolai Stange <nstange@suse.de>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
CC: "Stephan M=C3=BCller" <smueller@chronox.de>
CC: Hannes Reinecke <hare@suse.de>
CC: Torsten Duwe <duwe@suse.de>
CC: Zaibo Xu <xuzaibo@huawei.com>
CC: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: David Howells <dhowells@redhat.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

Hi Nicolai,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master jmorris-=
security/next-testing v5.16-rc4 next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicolai-Stange/crypto-dh-i=
nfrastructure-for-NVM-in-band-auth-and-FIPS-conformance/20211201-085159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211207/202112070306.wfN6TcdK-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
crypto/dh_helper.c:32 get_safe_prime_group() warn: we never enter this loop

vim +32 crypto/dh_helper.c

3313d2f891c8a3 Nicolai Stange      2021-12-01  26  =

3313d2f891c8a3 Nicolai Stange      2021-12-01  27  static inline const stru=
ct safe_prime_group *
3313d2f891c8a3 Nicolai Stange      2021-12-01  28  get_safe_prime_group(enu=
m dh_group_id group_id)
3313d2f891c8a3 Nicolai Stange      2021-12-01  29  {
3313d2f891c8a3 Nicolai Stange      2021-12-01  30  	int i;
3313d2f891c8a3 Nicolai Stange      2021-12-01  31  =

3313d2f891c8a3 Nicolai Stange      2021-12-01 @32  	for (i =3D 0; i < ARRAY=
_SIZE(safe_prime_groups); ++i) {
3313d2f891c8a3 Nicolai Stange      2021-12-01  33  		if (safe_prime_groups[=
i].group_id =3D=3D group_id)
3313d2f891c8a3 Nicolai Stange      2021-12-01  34  			return &safe_prime_gr=
oups[i];
3313d2f891c8a3 Nicolai Stange      2021-12-01  35  	}
3313d2f891c8a3 Nicolai Stange      2021-12-01  36  =

3313d2f891c8a3 Nicolai Stange      2021-12-01  37  	return NULL;
3313d2f891c8a3 Nicolai Stange      2021-12-01  38  }
802c7f1c84e4b5 Salvatore Benedetto 2016-06-22  39  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7295367595674893805==--

